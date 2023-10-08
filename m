Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881EB138D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgrC1C9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696776305; x=1728312305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6M51rGeOHBEmFf08ooHLNTsc683ZQ5nB6KYkmSmMWtc=;
  b=DgrC1C9IfLQiX5KJ7fm9oPBGKl2h7OM97bllqXY9626UbjoPmmqY5c3V
   FSKIl2OynJHdnCKU0X5yneU9VjUt3a0MexDHDeX5x+iQ78EgXBlA8vV97
   PT0/CbjVhAcEc/Wwq3YDVmUs8yp9/xBWmd2d4VOOEX8pASJYJ1wCZ4ci3
   T8QFtgBeLOVKGzlVryzNrtyeDB9gq2e9fJhYfRWP6u6DbIbnpoW/uRV4P
   bU+PGq+Xh44BE/UZ2tWyWOCR1vdaH6RwtHb6dt8f125ZMmgvbpMa9uP3l
   XJHNjJYdMD0UvEaIndcRcv++nm5mTVMXGi9/WivTDa+MV6TbdDO27l6oQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="386842436"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="386842436"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 07:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="702616498"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="702616498"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Oct 2023 07:45:03 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpV1g-0005UL-0Z;
	Sun, 08 Oct 2023 14:45:00 +0000
Date: Sun, 8 Oct 2023 22:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 472/24603]
 drivers/media/platform/mxc/capture/mx6s_capture.c:1991:12: warning:
 'mx6s_csi_runtime_resume' defined but not used
Message-ID: <202310082224.IoQcOUs4-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: a0e0e25d3d53071262b9c64f8c2c8e9628766b48 [472/24603] media: v4l2 capture: add v4l2 capture driver based on csi
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231008/202310082224.IoQcOUs4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310082224.IoQcOUs4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310082224.IoQcOUs4-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/media/platform/mxc/capture/mx6s_capture.c:1827:33: error: 'struct v4l2_async_notifier' has no member named 'num_subdevs'
    1827 |         csi_dev->subdev_notifier.num_subdevs = 1;
         |                                 ^
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_csi_probe':
   drivers/media/platform/mxc/capture/mx6s_capture.c:1938:52: error: 'VFL_TYPE_GRABBER' undeclared (first use in this function); did you mean 'VFL_TYPE_SUBDEV'?
    1938 |         ret = video_register_device(csi_dev->vdev, VFL_TYPE_GRABBER, -1);
         |                                                    ^~~~~~~~~~~~~~~~
         |                                                    VFL_TYPE_SUBDEV
   drivers/media/platform/mxc/capture/mx6s_capture.c:1938:52: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_qbuf':
   drivers/media/platform/mxc/capture/mx6s_capture.c:1369:1: error: control reaches end of non-void function [-Werror=return-type]
    1369 | }
         | ^
   drivers/media/platform/mxc/capture/mx6s_capture.c: At top level:
>> drivers/media/platform/mxc/capture/mx6s_capture.c:1991:12: warning: 'mx6s_csi_runtime_resume' defined but not used [-Wunused-function]
    1991 | static int mx6s_csi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mx6s_capture.c:1985:12: warning: 'mx6s_csi_runtime_suspend' defined but not used [-Wunused-function]
    1985 | static int mx6s_csi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mx6s_csi_runtime_resume +1991 drivers/media/platform/mxc/capture/mx6s_capture.c

  1984	
> 1985	static int mx6s_csi_runtime_suspend(struct device *dev)
  1986	{
  1987		dev_dbg(dev, "csi v4l2 busfreq high release.\n");
  1988		return 0;
  1989	}
  1990	
> 1991	static int mx6s_csi_runtime_resume(struct device *dev)
  1992	{
  1993		dev_dbg(dev, "csi v4l2 busfreq high request.\n");
  1994		return 0;
  1995	}
  1996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
