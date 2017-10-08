关于DATA_analysis的使用：

	1.1 首先导入一个事件的数组；调用Untitled4.m ;

	1.2 indx表示获得的对应的细胞位置；可以使用plot(str(indx,:))查看；

	1.3 使用PCA_vertex 获得事件的位置 indx；

	1.4 调用DATA_posture(file_path) 可以切割原始图片，获得老鼠在图片中的
位置，并保存在material文件夹下；

	1.5 基于1.3步中获得的indx来手工挑出material文件夹下的对应的图片，保存
到一个新的文件夹；
	
	1.6 调用DATA_getCurve.m 获得sin_theta_all；

	1.7 调用DATA_plot_theta来绘制图线；