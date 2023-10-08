Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F6FC8E3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etyESvZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696786329; x=1728322329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ps9AFQz5Iev0TyMbhUhrypNWSa2cDtwwdFIllYEmqHQ=;
  b=etyESvZyADbGdcvYIvwE3+tNKG79A8FaLQxAefsITa+yh3COiKkKPjdc
   cSOgq8rEDaPal9bL1w3+AvBlG/ZL/uaZLK9IHO220j+EFXoJB7YQennhd
   KQ5cloloqyPi9ATjUlWeTpUh+dxy0tY59rdPrl+ZMmamDFfRuQHYcyBjN
   95Ur2E4b8J0C5EdYNXoZB+TTKaK5ZOxk4gyXAn2LqpxeImgZM4E8duKFO
   7wqrL29XhC0t8wO9qSuP4btm9zIDavbAYCP1ufGQaEIclZMi1hE3umYG4
   vOsT2fH7tp4Vbv5TEblmXsXnnv4Mc9qT572KzhnUzhrNjF7QtXqvF1i2c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="363382218"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="363382218"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 10:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="746429757"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="746429757"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Oct 2023 10:32:06 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpXdM-0005bJ-1k;
	Sun, 08 Oct 2023 17:32:04 +0000
Date: Mon, 9 Oct 2023 01:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 474/24603]
 drivers/media/platform/mxc/capture/mxc_vadc.c:800:12: warning: 'vadc_resume'
 defined but not used
Message-ID: <202310090150.170edNRj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandor,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 46cb56a3f576432295951d076cf5e50cdf663978 [474/24603] media: v4l2: vadc: Enable vadc driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310090150.170edNRj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310090150.170edNRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310090150.170edNRj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_vadc.c:582:10: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
     582 |         .s_parm                = vadc_s_parm,
         |          ^~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:582:34: error: initialization of 'int (*)(struct v4l2_subdev *, v4l2_std_id *)' {aka 'int (*)(struct v4l2_subdev *, long long unsigned int *)'} from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Werror=incompatible-pointer-types]
     582 |         .s_parm                = vadc_s_parm,
         |                                  ^~~~~~~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:582:34: note: (near initialization for 'vadc_video_ops.g_tvnorms')
   drivers/media/platform/mxc/capture/mxc_vadc.c:588:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
     588 |         .get_fmt               = vadc_get_fmt,
         |                                  ^~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:588:34: note: (near initialization for 'vadc_pad_ops.get_fmt')
   drivers/media/platform/mxc/capture/mxc_vadc.c:589:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
     589 |         .set_fmt               = vadc_set_fmt,
         |                                  ^~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:589:34: note: (near initialization for 'vadc_pad_ops.set_fmt')
   drivers/media/platform/mxc/capture/mxc_vadc.c:590:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Werror=incompatible-pointer-types]
     590 |         .enum_mbus_code        = vadc_enum_mbus_code,
         |                                  ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:590:34: note: (near initialization for 'vadc_pad_ops.enum_mbus_code')
   drivers/media/platform/mxc/capture/mxc_vadc.c:591:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Werror=incompatible-pointer-types]
     591 |         .enum_frame_size       = vadc_enum_framesizes,
         |                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:591:34: note: (near initialization for 'vadc_pad_ops.enum_frame_size')
   drivers/media/platform/mxc/capture/mxc_vadc.c:592:34: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Werror=incompatible-pointer-types]
     592 |         .enum_frame_interval   = vadc_enum_frameintervals,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:592:34: note: (near initialization for 'vadc_pad_ops.enum_frame_interval')
>> drivers/media/platform/mxc/capture/mxc_vadc.c:800:12: warning: 'vadc_resume' defined but not used [-Wunused-function]
     800 | static int vadc_resume(struct device *dev)
         |            ^~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mxc_vadc.c:787:12: warning: 'vadc_suspend' defined but not used [-Wunused-function]
     787 | static int vadc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vadc_resume +800 drivers/media/platform/mxc/capture/mxc_vadc.c

   786	
 > 787	static int vadc_suspend(struct device *dev)
   788	{
   789		struct platform_device *pdev = to_platform_device(dev);
   790		struct vadc_state *state = platform_get_drvdata(pdev);
   791	
   792		clk_disable(state->csi_clk);
   793		clk_disable(state->vadc_clk);
   794	
   795		vadc_power_down(state);
   796	
   797		return 0;
   798	}
   799	
 > 800	static int vadc_resume(struct device *dev)
   801	{
   802		struct platform_device *pdev = to_platform_device(dev);
   803		struct vadc_state *state = platform_get_drvdata(pdev);
   804	
   805		clk_enable(state->csi_clk);
   806		clk_enable(state->vadc_clk);
   807	
   808		vadc_init(state);
   809		return 0;
   810	}
   811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
