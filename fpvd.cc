/// @file
/// @brief @ref mob server
/// @defgroup fpvd FPVD
/// @brief @ref mob server

#include "fpvip.hh"
#include <linux/videodev2.h>

int xioctl(int fd, int request, void *arg)
{
	int r = -1;
	do
		r = ioctl(fd, request, arg);
	while (r == -1 && errno == EINTR);
	return r;
}

int main(int argc, char *argv[])
{
	void *err = 0;
	// check cmdline (see reference Related Pages/fpvd)
	assert(argc == 3 + 1);
	// open capture device
	int cam = open(argv[3], O_RDWR);
	assert(cam >= 0);
	// query capabilities
	struct v4l2_capability caps = { 0 };
	assert(xioctl(cam, VIDIOC_QUERYCAP, &caps) >= 0);
	// capture format
	v4l2_format fmt = { 0 };
	fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	fmt.fmt.pix.width = 320;
	fmt.fmt.pix.height = 240;
	assert(xioctl(cam, VIDIOC_S_FMT, &fmt) >= 0);
	// streaming i/o buffers
	v4l2_requestbuffers req = { 0 };
	//
	return 0;
}

// * https://jayrambhia.com/blog/capture-v4l2
