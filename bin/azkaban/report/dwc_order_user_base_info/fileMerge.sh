#!/bin/sh
function filemerge(){
#文件合并
source /etc/profile && hadoop fs -cat ${path}/part* | hadoop fs -appendToFile - ${path}.txt

#删除路径
hadoop fs -test -e ${path}.txt
if [ $? -eq 0 ]; then
hdfs dfs -rm -r ${path}
fi
}
#path=hdfs://jianbing/tao/dwc/dwc_order_user_base_info
path=hdfs://jianbing/tmp/liuhao/dwc_order_user_base_info
filemerge