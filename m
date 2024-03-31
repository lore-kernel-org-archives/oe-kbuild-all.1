Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DDE4688
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711910380; cv=none; b=MGZzWFiulXzKkQlkGJDDmTa5RVMRMdO8FvhqVMrPb2Z0IwcicmymQ4ik9P26OtgTmbMtwiqJwMv/chTDxBRVlroMzDw8G1FzZrfUMMvYZmXFktvD0i9EIO7VfLAMuUUIlNNHrupjuZw/0P0NU0wBd0+FP+/UKz26jD4/2VUGtFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711910380; c=relaxed/simple;
	bh=BdRP69A6ruzzD5PtK39Wno0xL6G54u9O2vI6bzb/4xA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTRBQYaTqGTddqK8LV2TJb6OKQEoaheVgUTgTEDwW9cqAk+OcsoqDJJSsyusJYZZbi9Ns1RqHRpjmXco6HwOjnkGxyNw/6EyXFDDOGp2YKZ6ftWlj3x0GD27H18O6wR4Y7MgUDha08hmOTuVYUkMZ+3BynhBBh/o6kDZQixKlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ScXi0OrW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ScXi0OrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711910378; x=1743446378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdRP69A6ruzzD5PtK39Wno0xL6G54u9O2vI6bzb/4xA=;
  b=ScXi0OrW5ljMarWjrh+dp0WJ6G9HP1a2uvJN0ycxfSWKIss4rIpjXOzY
   5EnTyty0VjEPxl4FgXI0QMrcks/Qv+bQhH0uhwxV+/MZ52Wg6o0lemYB8
   bzXn37yCJ0igtcgty5jULRR9E85FQ/c8/4Je/Nh00Dq5awBoF4643KZCQ
   SwZcJSGQogye7FF2/pfZQarGk1X4q1GrYtrFwjyRDxaoym2jLnLmVIzT4
   3k+576Vai6xGB84hPKcAKgDRFKf7g4pCGSaBlotHwVEd12M9n1HVru3rG
   NO2QUHJ51A64NMaRx8hqiC0anxsTBcQl5fChvAlm0nTiIhs8NGgPx1NsV
   Q==;
X-CSE-ConnectionGUID: 7fOX55bISterlKhCfSWO+Q==
X-CSE-MsgGUID: 7QWcaEfVR2uGWeoc57fh8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="18406305"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="18406305"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 11:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="48708303"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2024 11:39:36 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr05e-0001Ly-0q;
	Sun, 31 Mar 2024 18:39:34 +0000
Date: Mon, 1 Apr 2024 02:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm/for-nexxt 26/26] drivers/pwm/pwm-apple.c:125:15:
 error: implicit declaration of function 'devm_clk_rate_exclusive_get'; did
 you mean 'clk_rate_exclusive_get'?
Message-ID: <202404010229.4zSY98zS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-nexxt
head:   0bac6aced1c550ec9628e0fa5d98036c6cbc51b4
commit: 0bac6aced1c550ec9628e0fa5d98036c6cbc51b4 [26/26] WIP: pwm: Fix clk rate using clk_rate_exclusive_get()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240401/202404010229.4zSY98zS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010229.4zSY98zS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010229.4zSY98zS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-apple.c: In function 'apple_pwm_probe':
>> drivers/pwm/pwm-apple.c:125:15: error: implicit declaration of function 'devm_clk_rate_exclusive_get'; did you mean 'clk_rate_exclusive_get'? [-Werror=implicit-function-declaration]
     125 |         ret = devm_clk_rate_exclusive_get(&pdev->dev, clk);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               clk_rate_exclusive_get
   cc1: some warnings being treated as errors
--
   drivers/pwm/pwm-lpc18xx-sct.c: In function 'lpc18xx_pwm_probe':
>> drivers/pwm/pwm-lpc18xx-sct.c:369:15: error: implicit declaration of function 'devm_clk_rate_exclusive_get'; did you mean 'clk_rate_exclusive_get'? [-Werror=implicit-function-declaration]
     369 |         ret = devm_clk_rate_exclusive_get(&pdev->dev, lpc18xx_pwm->pwm_clk);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               clk_rate_exclusive_get
   cc1: some warnings being treated as errors


vim +125 drivers/pwm/pwm-apple.c

   102	
   103	static int apple_pwm_probe(struct platform_device *pdev)
   104	{
   105		struct pwm_chip *chip;
   106		struct apple_pwm *fpwm;
   107		struct clk *clk;
   108		int ret;
   109	
   110		chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*fpwm));
   111		if (IS_ERR(chip))
   112			return PTR_ERR(chip);
   113	
   114		fpwm = to_apple_pwm(chip);
   115	
   116		fpwm->base = devm_platform_ioremap_resource(pdev, 0);
   117		if (IS_ERR(fpwm->base))
   118			return PTR_ERR(fpwm->base);
   119	
   120		clk = devm_clk_get_enabled(&pdev->dev, NULL);
   121		if (IS_ERR(clk))
   122			return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get the clock");
   123	
   124		/* Ensure that clk doesn't change behind our back */
 > 125		ret = devm_clk_rate_exclusive_get(&pdev->dev, clk);
   126		if (ret)
   127			return dev_err_probe(&pdev->dev, ret,
   128					     "unable to lock clock rate");
   129	
   130		/*
   131		 * Uses the 24MHz system clock on all existing devices, can only
   132		 * happen if the device tree is broken
   133		 *
   134		 * This check is done to prevent an overflow in .apply
   135		 */
   136		fpwm->clkrate = clk_get_rate(clk);
   137		if (fpwm->clkrate > NSEC_PER_SEC)
   138			return dev_err_probe(&pdev->dev, -EINVAL, "pwm clock out of range");
   139	
   140		chip->ops = &apple_pwm_ops;
   141	
   142		ret = devm_pwmchip_add(&pdev->dev, chip);
   143		if (ret < 0)
   144			return dev_err_probe(&pdev->dev, ret, "unable to add pwm chip");
   145	
   146		return 0;
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
