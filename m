Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F42D7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 00:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675556943; x=1707092943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rku1bXjL3JhwzKCRRo46JO0K9XSWdntxXF9F2uPeeQo=;
  b=jA3+7mVG61DLHB2dCIgm3zkVum1HG0CAvtG+34GUMUhIsGcl41L++xyR
   QBB+IjFMIF/Iczohnm3aBNuTfiWd5MaSRWSRa4bboHy4pS2aNy1OgR4Gv
   WQSNV5ci6FH7TRg6XNGFDNBHzayhzWuotz9V0ilcVNMQ1sxiPOLGoJScy
   xjLzb3kzg20A+w18tj5ait1S3852cSXzP8Bkr08xzn6YADAtwbdnMnjc2
   waAgtSMO/hHLUzMCcZKTvGy3vPqm3sxvBBlSi/x1FLfd2qpfpEspwnfXh
   FXsUh5Ihxt30VxW0Yu5U4qwwiVka/jHhfwaLPRRuCurfLk8zIWhtwcy1l
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="356355408"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="356355408"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 16:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754876717"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="754876717"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 16:29:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOStx-0001bQ-0L;
	Sun, 05 Feb 2023 00:29:01 +0000
Date: Sun, 5 Feb 2023 08:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 472/20209]
 drivers/media/platform/mxc/capture/mx6s_capture.c:363:18: warning: no
 previous prototype for 'format_by_fourcc'
Message-ID: <202302050818.GPy3fQBx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robby,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: a0e0e25d3d53071262b9c64f8c2c8e9628766b48 [472/20209] media: v4l2 capture: add v4l2 capture driver based on csi
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302050818.GPy3fQBx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/a0e0e25d3d53071262b9c64f8c2c8e9628766b48
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout a0e0e25d3d53071262b9c64f8c2c8e9628766b48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/mxc/capture/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mxc/capture/mx6s_capture.c:363:18: warning: no previous prototype for 'format_by_fourcc' [-Wmissing-prototypes]
     363 | struct mx6s_fmt *format_by_fourcc(int fourcc)
         |                  ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:376:18: warning: no previous prototype for 'format_by_mbus' [-Wmissing-prototypes]
     376 | struct mx6s_fmt *format_by_mbus(u32 code)
         |                  ^~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:394:6: warning: no previous prototype for 'csi_clk_enable' [-Wmissing-prototypes]
     394 | void csi_clk_enable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:401:6: warning: no previous prototype for 'csi_clk_disable' [-Wmissing-prototypes]
     401 | void csi_clk_disable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_qbuf':
   drivers/media/platform/mxc/capture/mx6s_capture.c:1368:45: error: passing argument 2 of 'vb2_qbuf' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1368 |         return vb2_qbuf(&csi_dev->vb2_vidq, p);
         |                                             ^
         |                                             |
         |                                             struct v4l2_buffer *
   In file included from include/media/videobuf2-dma-contig.h:16,
                    from drivers/media/platform/mxc/capture/mx6s_capture.c:46:
   include/media/videobuf2-v4l2.h:151:56: note: expected 'struct media_device *' but argument is of type 'struct v4l2_buffer *'
     151 | int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
         |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1368:16: error: too few arguments to function 'vb2_qbuf'
    1368 |         return vb2_qbuf(&csi_dev->vb2_vidq, p);
         |                ^~~~~~~~
   include/media/videobuf2-v4l2.h:151:5: note: declared here
     151 | int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
         |     ^~~~~~~~
   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/platform/mxc/capture/mx6s_capture.c:43:
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_g_parm':
   include/media/v4l2-subdev.h:1185:56: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1185 |                 else if (!(__sd->ops->o && __sd->ops->o->f))            \
         |                                                        ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1607:16: note: in expansion of macro 'v4l2_subdev_call'
    1607 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1188:53: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1188 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1607:16: note: in expansion of macro 'v4l2_subdev_call'
    1607 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1189:63: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1189 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1607:16: note: in expansion of macro 'v4l2_subdev_call'
    1607 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1192:48: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1192 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1607:16: note: in expansion of macro 'v4l2_subdev_call'
    1607 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_s_parm':
   include/media/v4l2-subdev.h:1185:56: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1185 |                 else if (!(__sd->ops->o && __sd->ops->o->f))            \
         |                                                        ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1616:16: note: in expansion of macro 'v4l2_subdev_call'
    1616 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1188:53: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1188 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1616:16: note: in expansion of macro 'v4l2_subdev_call'
    1616 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1189:63: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1189 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1616:16: note: in expansion of macro 'v4l2_subdev_call'
    1616 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1192:48: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1192 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1616:16: note: in expansion of macro 'v4l2_subdev_call'
    1616 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: At top level:
   drivers/media/platform/mxc/capture/mx6s_capture.c:1692:10: error: 'const struct v4l2_ioctl_ops' has no member named 'vidioc_cropcap'; did you mean 'vidioc_querycap'?
    1692 |         .vidioc_cropcap       = mx6s_vidioc_cropcap,
         |          ^~~~~~~~~~~~~~
         |          vidioc_querycap
   drivers/media/platform/mxc/capture/mx6s_capture.c:1692:33: error: initialization of 'int (*)(struct file *, void *, struct v4l2_format *)' from incompatible pointer type 'int (*)(struct file *, void *, struct v4l2_cropcap *)' [-Werror=incompatible-pointer-types]
    1692 |         .vidioc_cropcap       = mx6s_vidioc_cropcap,
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1692:33: note: (near initialization for 'mx6s_csi_ioctl_ops.vidioc_s_fmt_vid_overlay')
   drivers/media/platform/mxc/capture/mx6s_capture.c:1693:10: error: 'const struct v4l2_ioctl_ops' has no member named 'vidioc_s_crop'; did you mean 'vidioc_s_ctrl'?
    1693 |         .vidioc_s_crop        = mx6s_vidioc_s_crop,
         |          ^~~~~~~~~~~~~
         |          vidioc_s_ctrl
   drivers/media/platform/mxc/capture/mx6s_capture.c:1693:33: error: initialization of 'int (*)(struct file *, void *, struct v4l2_format *)' from incompatible pointer type 'int (*)(struct file *, void *, const struct v4l2_crop *)' [-Werror=incompatible-pointer-types]
    1693 |         .vidioc_s_crop        = mx6s_vidioc_s_crop,
         |                                 ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1693:33: note: (near initialization for 'mx6s_csi_ioctl_ops.vidioc_s_fmt_vid_out')
   drivers/media/platform/mxc/capture/mx6s_capture.c:1694:10: error: 'const struct v4l2_ioctl_ops' has no member named 'vidioc_g_crop'; did you mean 'vidioc_g_ctrl'?
    1694 |         .vidioc_g_crop        = mx6s_vidioc_g_crop,
         |          ^~~~~~~~~~~~~
         |          vidioc_g_ctrl
   drivers/media/platform/mxc/capture/mx6s_capture.c:1694:33: error: initialization of 'int (*)(struct file *, void *, struct v4l2_format *)' from incompatible pointer type 'int (*)(struct file *, void *, struct v4l2_crop *)' [-Werror=incompatible-pointer-types]
    1694 |         .vidioc_g_crop        = mx6s_vidioc_g_crop,
         |                                 ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1694:33: note: (near initialization for 'mx6s_csi_ioctl_ops.vidioc_s_fmt_vid_out_overlay')
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6sx_register_subdevs':
   drivers/media/platform/mxc/capture/mx6s_capture.c:1826:33: error: 'struct v4l2_async_notifier' has no member named 'subdevs'
    1826 |         csi_dev->subdev_notifier.subdevs = csi_dev->async_subdevs;
         |                                 ^


vim +/format_by_fourcc +363 drivers/media/platform/mxc/capture/mx6s_capture.c

   362	
 > 363	struct mx6s_fmt *format_by_fourcc(int fourcc)
   364	{
   365		int i;
   366	
   367		for (i = 0; i < NUM_FORMATS; i++) {
   368			if (formats[i].pixelformat == fourcc)
   369				return formats + i;
   370		}
   371	
   372		pr_err("unknown pixelformat:'%4.4s'\n", (char *)&fourcc);
   373		return NULL;
   374	}
   375	
 > 376	struct mx6s_fmt *format_by_mbus(u32 code)
   377	{
   378		int i;
   379	
   380		for (i = 0; i < NUM_FORMATS; i++) {
   381			if (formats[i].mbus_code == code)
   382				return formats + i;
   383		}
   384	
   385		pr_err("unknown mbus:0x%x\n", code);
   386		return NULL;
   387	}
   388	
   389	static struct mx6s_buffer *mx6s_ibuf_to_buf(struct mx6s_buf_internal *int_buf)
   390	{
   391		return container_of(int_buf, struct mx6s_buffer, internal);
   392	}
   393	
 > 394	void csi_clk_enable(struct mx6s_csi_dev *csi_dev)
   395	{
   396		clk_prepare_enable(csi_dev->clk_disp_axi);
   397		clk_prepare_enable(csi_dev->clk_disp_dcic);
   398		clk_prepare_enable(csi_dev->clk_csi_mclk);
   399	}
   400	
 > 401	void csi_clk_disable(struct mx6s_csi_dev *csi_dev)
   402	{
   403		clk_disable_unprepare(csi_dev->clk_csi_mclk);
   404		clk_disable_unprepare(csi_dev->clk_disp_dcic);
   405		clk_disable_unprepare(csi_dev->clk_disp_axi);
   406	}
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
