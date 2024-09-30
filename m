Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F0A35894
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727667229; cv=none; b=XbjV683i16x9xmkbR0v8OaNhNY5yX+NVOndo+r/2t/0tK6gkJlUuUkX/8eae6LGxrxh6dlV7WRb+LIiYGllZpmLdygea32ac3hRhcHYzL8FlUOjwibfiH96fhykLMYFlQRVoL6Z7RTtYFzddR5J9QzlPqMeE1v/sPMS0aDN7u0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727667229; c=relaxed/simple;
	bh=i0V5pw5h6Roo2GHb63SSc6rcWYxmm5uUgFDoTwjRJO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L2bJzaxhCNJ1xxnx3jaU17JSzvKa8b3WVwwNcGi9K576sprD75Ysiujft1/juCDiGz60zzy9HIdU4L1LXFlJTolAhmY7khOaSmiA19hDqHQbM7/fv5Eq667H7rmwtB2HpMAp4USsG9WSV6ae8W+a5ZABpGAszBq9ncpZ5heDcIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msXvzTn+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msXvzTn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727667227; x=1759203227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0V5pw5h6Roo2GHb63SSc6rcWYxmm5uUgFDoTwjRJO0=;
  b=msXvzTn+whvdmlfee1533SIZ0OJqmDkr4pXKPk6dhE0UcR0Yt9t0f6XB
   bu1FUnATK1skp+6M8y00869+kltCU0njdDrf6TEN+egcFbsQVaLR4QUw8
   UihKsh0Kvg61y3QsKWqwBZP8wt52hlpI6qM6GbZoseFBC+wgxXN19ta5u
   hG+xogLGU+E7aZFv1V4up8QCL3uVuB+iGQx76PN+TiStDuNeAKww95PfY
   98CSEzeuAlpveh2GXTDqvJbzt77G1bT0/C/hHR3/P3sNxlSruWFyd1h8G
   Yw9HB++fwdO9NsbAjD+GF+b43bAGcr+ZE/UWGiqjLPRE7FgZ8KeeK8Scd
   A==;
X-CSE-ConnectionGUID: xqb6KgrhRfikvtv5DdS8zw==
X-CSE-MsgGUID: JxWiMrybSQi/ylPUDP4D/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26832947"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26832947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 20:33:46 -0700
X-CSE-ConnectionGUID: wUigYKzqQ1mmhqWBxnQ3+w==
X-CSE-MsgGUID: 3DmVxADjTASUwJyjbeePVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73205737"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2024 20:33:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv7AN-000P08-18;
	Mon, 30 Sep 2024 03:33:43 +0000
Date: Mon, 30 Sep 2024 11:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 469/16788]
 drivers/media/platform/mxc/capture/mxc_vadc.c:800:12: warning: 'vadc_resume'
 defined but not used
Message-ID: <202409301121.TGkib2zf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guoniu.zhou,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 44767954c162e96e6d006d612e244ab24aaa763d [469/16788] LF-5810-01: media: mxc: Kconfig: cleanup VIDEO_V4L2 due to community change
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240930/202409301121.TGkib2zf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301121.TGkib2zf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301121.TGkib2zf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_vadc.c:582:10: error: 'const struct v4l2_subdev_video_ops' has no member named 's_parm'
     582 |         .s_parm                = vadc_s_parm,
         |          ^~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:582:34: error: initialization of 'int (*)(struct v4l2_subdev *, v4l2_std_id *)' {aka 'int (*)(struct v4l2_subdev *, long long unsigned int *)'} from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_streamparm *)' [-Wincompatible-pointer-types]
     582 |         .s_parm                = vadc_s_parm,
         |                                  ^~~~~~~~~~~
   drivers/media/platform/mxc/capture/mxc_vadc.c:582:34: note: (near initialization for 'vadc_video_ops.g_tvnorms')
>> drivers/media/platform/mxc/capture/mxc_vadc.c:800:12: warning: 'vadc_resume' defined but not used [-Wunused-function]
     800 | static int vadc_resume(struct device *dev)
         |            ^~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mxc_vadc.c:787:12: warning: 'vadc_suspend' defined but not used [-Wunused-function]
     787 | static int vadc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~


vim +/vadc_resume +800 drivers/media/platform/mxc/capture/mxc_vadc.c

f820eeb46a80ef Sandor Yu 2019-10-16  786  
f820eeb46a80ef Sandor Yu 2019-10-16 @787  static int vadc_suspend(struct device *dev)
f820eeb46a80ef Sandor Yu 2019-10-16  788  {
f820eeb46a80ef Sandor Yu 2019-10-16  789  	struct platform_device *pdev = to_platform_device(dev);
f820eeb46a80ef Sandor Yu 2019-10-16  790  	struct vadc_state *state = platform_get_drvdata(pdev);
f820eeb46a80ef Sandor Yu 2019-10-16  791  
f820eeb46a80ef Sandor Yu 2019-10-16  792  	clk_disable(state->csi_clk);
f820eeb46a80ef Sandor Yu 2019-10-16  793  	clk_disable(state->vadc_clk);
f820eeb46a80ef Sandor Yu 2019-10-16  794  
f820eeb46a80ef Sandor Yu 2019-10-16  795  	vadc_power_down(state);
f820eeb46a80ef Sandor Yu 2019-10-16  796  
f820eeb46a80ef Sandor Yu 2019-10-16  797  	return 0;
f820eeb46a80ef Sandor Yu 2019-10-16  798  }
f820eeb46a80ef Sandor Yu 2019-10-16  799  
f820eeb46a80ef Sandor Yu 2019-10-16 @800  static int vadc_resume(struct device *dev)
f820eeb46a80ef Sandor Yu 2019-10-16  801  {
f820eeb46a80ef Sandor Yu 2019-10-16  802  	struct platform_device *pdev = to_platform_device(dev);
f820eeb46a80ef Sandor Yu 2019-10-16  803  	struct vadc_state *state = platform_get_drvdata(pdev);
f820eeb46a80ef Sandor Yu 2019-10-16  804  
f820eeb46a80ef Sandor Yu 2019-10-16  805  	clk_enable(state->csi_clk);
f820eeb46a80ef Sandor Yu 2019-10-16  806  	clk_enable(state->vadc_clk);
f820eeb46a80ef Sandor Yu 2019-10-16  807  
f820eeb46a80ef Sandor Yu 2019-10-16  808  	vadc_init(state);
f820eeb46a80ef Sandor Yu 2019-10-16  809  	return 0;
f820eeb46a80ef Sandor Yu 2019-10-16  810  }
f820eeb46a80ef Sandor Yu 2019-10-16  811  

:::::: The code at line 800 was first introduced by commit
:::::: f820eeb46a80ef3f2922c9fa31a6df29f6fb6285 media: v4l2: vadc: Enable vadc driver

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
