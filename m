Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18E2C85A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 23:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1vSpN2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697240778; x=1728776778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rSVaNHsw27ZwQGPhWWaxYZNf+US5Vf2eNv4vatrf7bg=;
  b=F1vSpN2mcD7y38vd9GdROxzq3sGXwPz4wdLrCRwfRM1ikps87BDeFuqJ
   ozQU1xjIOBvItwAurrWnAX7kxYO8fZ2DBEOo8dRTaDFBI4oy3jNSYMGwk
   WvNQUTHmAwsiNSUtU94JzjxYDsTBb/Grk3pFiY9AjKfJ+EYi1SzbORFlW
   LvrleRSEUqNDRLDmPAeMWy1H4i2wRjLKOlXu5D98Vc7AJWVf3el+RpIqr
   r1ifv1W/qReHEL9Sixf7IRXgZELyAX64x7wxlRqif6cDceB3CbGU+02eK
   9+fkcB3W0Csbl7Y7HauIY0F3Ttg0OZ9PJYd/wfibmZmHJZA5xRTqm1Ywu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389146482"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="389146482"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 16:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754884194"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="754884194"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 16:46:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrRrC-0005Wk-27;
	Fri, 13 Oct 2023 23:46:14 +0000
Date: Sat, 14 Oct 2023 07:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 672/30000]
 drivers/media/platform/mxc/capture/mxc_vadc.c:800:12: warning: 'vadc_resume'
 defined but not used
Message-ID: <202310140737.Unmwi86a-lkp@intel.com>
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
commit: 9ee1187583796a21515fa2c04a6511f739059036 [672/30000] media: v4l2: vadc: Enable vadc driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140737.Unmwi86a-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140737.Unmwi86a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140737.Unmwi86a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_vadc.c: In function 'vadc_enum_frameintervals':
   drivers/media/platform/mxc/capture/mxc_vadc.c:555:24: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     555 |         if (fie->index < 0 || fie->index >= 1)
         |                        ^
   drivers/media/platform/mxc/capture/mxc_vadc.c: At top level:
   drivers/media/platform/mxc/capture/mxc_vadc.c:582:10: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
     582 |         .s_parm                = vadc_s_parm,
         |          ^~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:582:34: error: initialization of 'int (*)(struct v4l2_subdev *, v4l2_std_id *)' {aka 'int (*)(struct v4l2_subdev *, long long unsigned int *)'} from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Werror=incompatible-pointer-types]
     582 |         .s_parm                = vadc_s_parm,
         |                                  ^~~~~~~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:582:34: note: (near initialization for 'vadc_video_ops.g_tvnorms')
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
