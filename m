Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE821362
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEkOc4gp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697218382; x=1728754382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bDLsHpAZzYRQQb0eUwY0EcwXPshsVt6DOBX7wEtbS5A=;
  b=jEkOc4gplIYBjOTgigiljQDOuzaJpE83BQEPSIeVYyXFzFo/MBF7A+aD
   HgwMMCcTJzMy7LnzievubB9fYuQ46tBLHsmySO1V/mTBys9vxz6QdKM/R
   0BYlHo/O0na4jE6Z4naxyH0ZOJ7yQZJJx/9LbCEh8YNaRrzBqARRMIx0/
   9Rec9NGXIJd47P/RiMzHM0RQpxdPGGasgFFDuveGWxmOa92e0AcXWoGjU
   brMZZQs12mTP21n5HCf3BmFZV1j7MQ01JlqkkCAqiLPhrLa6+TU3ylC5t
   7L6d/WbAgGfcHKiHUePecJZgRHiGGA4W2oAwFT5ZlPBZaG3b3fsP6WquA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="451712441"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="451712441"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 10:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="820721967"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="820721967"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2023 10:33:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrM1x-0005C5-3A;
	Fri, 13 Oct 2023 17:32:57 +0000
Date: Sat, 14 Oct 2023 01:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 670/30000]
 drivers/media/platform/mxc/capture/mx6s_capture.c:1991:12: warning:
 'mx6s_csi_runtime_resume' defined but not used
Message-ID: <202310140144.HzECPSpY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: d6bfdb3631df579118ee2c3223d776e671ba4cd1 [670/30000] media: v4l2 capture: add v4l2 capture driver based on csi
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140144.HzECPSpY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140144.HzECPSpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140144.HzECPSpY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/media/videobuf2-dma-contig.h:16,
                    from drivers/media/platform/mxc/capture/mx6s_capture.c:46:
   include/media/videobuf2-v4l2.h:144:56: note: expected 'struct media_device *' but argument is of type 'struct v4l2_buffer *'
     144 | int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
         |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1368:16: error: too few arguments to function 'vb2_qbuf'
    1368 |         return vb2_qbuf(&csi_dev->vb2_vidq, p);
         |                ^~~~~~~~
   include/media/videobuf2-v4l2.h:144:5: note: declared here
     144 | int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
         |     ^~~~~~~~
   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/platform/mxc/capture/mx6s_capture.c:43:
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_g_parm':
   include/media/v4l2-subdev.h:1106:56: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1106 |                 else if (!(__sd->ops->o && __sd->ops->o->f))            \
         |                                                        ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1607:16: note: in expansion of macro 'v4l2_subdev_call'
    1607 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1109:53: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1109 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1607:16: note: in expansion of macro 'v4l2_subdev_call'
    1607 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:63: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1110 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1607:16: note: in expansion of macro 'v4l2_subdev_call'
    1607 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1113:48: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_parm'
    1113 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1607:16: note: in expansion of macro 'v4l2_subdev_call'
    1607 |         return v4l2_subdev_call(sd, video, g_parm, a);
         |                ^~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_s_parm':
   include/media/v4l2-subdev.h:1106:56: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1106 |                 else if (!(__sd->ops->o && __sd->ops->o->f))            \
         |                                                        ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1616:16: note: in expansion of macro 'v4l2_subdev_call'
    1616 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1109:53: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1109 |                          v4l2_subdev_call_wrappers.o->f)                \
         |                                                     ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1616:16: note: in expansion of macro 'v4l2_subdev_call'
    1616 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1110:63: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1110 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                                               ^~
   drivers/media/platform/mxc/capture/mx6s_capture.c:1616:16: note: in expansion of macro 'v4l2_subdev_call'
    1616 |         return v4l2_subdev_call(sd, video, s_parm, a);
         |                ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1113:48: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
    1113 |                         __result = __sd->ops->o->f(__sd, ##args);       \
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
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6s_vidioc_qbuf':
   drivers/media/platform/mxc/capture/mx6s_capture.c:1369:1: warning: control reaches end of non-void function [-Wreturn-type]
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
