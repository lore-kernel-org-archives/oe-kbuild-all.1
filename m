Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E196AB7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707552313; cv=none; b=TPrHLOK1CV5evLaH00Lnlh3jbMMNYoa3VNHrGQRwI+6Dfw1LjB6YLZuokQxQz3gm7ono85y9Fdm1v3uDst7C0gcopsjjOOtcDAwrGWkG6yyPzDD4XUn+L3igsLGsU25upbgnhOzXXXJzvTLxVOFP6ldoe8x6RHsueX1FqDFd6zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707552313; c=relaxed/simple;
	bh=W0rCFNL+G14kYGxIx4EAtv/kDxgPtUWkqNIMcM6KyuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9J42ChRGvmkSy5aVJ/Uq0FTmAh+vPnodRA52+YRGGNnAIM/hXbpf46Zp8ipTPYCFVZdIrRcxCjY9ExPj8y6MXsPIJuB82Hnd+V99f4JZFgPXnvsmD+LRaJMxsTtb6Bc1Mm8/SAmW1IQb+7VO+McgtBPg68vWU9dh//MUWxl52g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luR8eEZc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luR8eEZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707552311; x=1739088311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W0rCFNL+G14kYGxIx4EAtv/kDxgPtUWkqNIMcM6KyuU=;
  b=luR8eEZcDxniOz9DSZkMXZXO5jliQ8X9UYjQ8YaL3r8uvEhL421VNvDh
   KnZswVsPYKwJCyn2S0OgAFHSaZTuAnFTFLvVso/MhXRs9WgEVSRKkfG2/
   JSjtGlIvdRO//3WXPUZQTFedpKPikJUXeRXFgnsKwZkKF8iavW00Zq+8r
   Vb3FTsBbizbghffzj6AaZhyXrkCjPSz67XEckNT5wvMAXLbpaOp1GLkJH
   sEhkYaiO/9jH+xlmAo3tRpuhnF2/c9VnTHP5pyUZi/vq9Nm0QIwjT8I2z
   OWPfp3pm0WjsmyUlExoGH57QYcOqqBBRQQye2FZxQL9AC+4r1vCs58BPQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12920603"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12920603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 00:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2118754"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2024 00:05:08 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYiME-0005U6-33;
	Sat, 10 Feb 2024 08:05:06 +0000
Date: Sat, 10 Feb 2024 16:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm-lifetime-tracking 66/159]
 drivers/pinctrl/intel/pinctrl-intel.c:1503:6: error: assignment to 'struct
 pwm_lpss_chip *' from incompatible pointer type 'struct pwm_chip *'
Message-ID: <202402101521.KG8R684I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm-lifetime-tracking
head:   f10ff6c7e1f341afe7f15a1f5f53379a0752bcb0
commit: 82415fb0b6b61675cdd5c9c252c71634d986c613 [66/159] pwm: lpss-*: Make use of devm_pwmchip_alloc() function
config: i386-buildonly-randconfig-002-20240210 (https://download.01.org/0day-ci/archive/20240210/202402101521.KG8R684I-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101521.KG8R684I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101521.KG8R684I-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/intel/pinctrl-intel.c: In function 'intel_pinctrl_probe_pwm':
>> drivers/pinctrl/intel/pinctrl-intel.c:1503:6: error: assignment to 'struct pwm_lpss_chip *' from incompatible pointer type 'struct pwm_chip *' [-Werror=incompatible-pointer-types]
    1503 |  pwm = devm_pwm_lpss_probe(pctrl->dev, community->regs + PWMC, &info);
         |      ^
   cc1: some warnings being treated as errors


vim +1503 drivers/pinctrl/intel/pinctrl-intel.c

7981c0015af263 Mika Westerberg 2015-03-30  1485  
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1486  static int intel_pinctrl_probe_pwm(struct intel_pinctrl *pctrl,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1487  				   struct intel_community *community)
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1488  {
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1489  	static const struct pwm_lpss_boardinfo info = {
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1490  		.clk_rate = 19200000,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1491  		.npwm = 1,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1492  		.base_unit_bits = 22,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1493  		.bypass = true,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1494  	};
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1495  	struct pwm_lpss_chip *pwm;
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1496  
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1497  	if (!(community->features & PINCTRL_FEATURE_PWM))
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1498  		return 0;
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1499  
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1500  	if (!IS_REACHABLE(CONFIG_PWM_LPSS))
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1501  		return 0;
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1502  
eb78d3604d6bcb Andy Shevchenko 2022-11-17 @1503  	pwm = devm_pwm_lpss_probe(pctrl->dev, community->regs + PWMC, &info);
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1504  	return PTR_ERR_OR_ZERO(pwm);
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1505  }
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1506  

:::::: The code at line 1503 was first introduced by commit
:::::: eb78d3604d6bcbe9743e036114c33a5a17090a0a pinctrl: intel: Enumerate PWM device when community has a capability

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
