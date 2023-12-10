from fireworks import Workflow, Firework, LaunchPad, ScriptTask, TemplateWriterTask


LPAD = LaunchPad.from_file('my_launchpad.yaml')

def ersap_fw(nnode):
    fw_name = f"ersap-node{nnode}"
    
    vk_string = f"#!/bin/bash\n\nexport NODENAME={fw_name}\nexport KUBECONFIG=/global/homes/j/jlabtsai/run-vk/kubeconfig/mylin\n\nssh -NfL 33469:localhost:33469 mylin\n\nshifter --image=docker:jlabtsai/vk-cmd:no-vk-container -- /bin/bash -c \"cp -r /vk-cmd `pwd`\"\n\ncd `pwd`/vk-cmd\n\n./start.sh $KUBECONFIG $NODENAME"

    task1 = ScriptTask.from_str(vk_string)
    
    fw = Firework([task1], name=fw_name)
    fw.spec["_category"] = fw_name
    fw.spec["_queueadapter"] = {"job_name": fw_name, "walltime": "00:30:00",
                                "qos": "debug", "nodes": nnode}
    return fw


def main():
    nnode = 8
    fw = ersap_fw(nnode)
    wf = Workflow([fw], {fw: []})
    wf.name = f"ersap-node{nnode}"
    print(wf.as_dict())
    LPAD.add_wf(wf)

if __name__ == "__main__":
    main()