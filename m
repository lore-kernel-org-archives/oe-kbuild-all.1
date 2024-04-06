Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38E47F7E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712432632; cv=none; b=DbKLFe1O0JdegLyL1CoKsp8Tt6yFas8QBkvGVrbfKSWrBhcYgRMEBAo0LG5f4/IaooI0whQCAwLofGcllxVW4gqFfzlP3MFwqrVBLXg+g2JW+60xi2u5sDWcUStZ9x4s9YJn1fQgXa8ov17QSAz1GNTRwQDXPYJyaJKrrkvXgwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712432632; c=relaxed/simple;
	bh=RMP7TzXwUZKGJRQSqVvVWAxJqbdlyjLEJ3g5Ou6lv90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MwjkCaJTZpV1+BuptMqY/1lVEDUxh3f5LNIq8U0YSzeWVHpVD4BeuFwS1ztTEKEDdC2rRHgsM07ujPrkUPaQekSCTMrDgm2kgfVLcBmKr5Z09IZkYR5p1MRu/VgWLMrN4T64oEwrjG5pCdE2qWyRZ7Ml/nQkwS1HVKR0aYYwTFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUW6KJsZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUW6KJsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712432630; x=1743968630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMP7TzXwUZKGJRQSqVvVWAxJqbdlyjLEJ3g5Ou6lv90=;
  b=LUW6KJsZ5624qEVkEowdHvXfQpUi0YglTxiSZl7kr8BcRkicdyHMh7qU
   tZZs1oRr8wXSGvxnOaKlDFZ1cK/l124mMv7tcw65Pfq380jEiwEC3ytgX
   Dvfy+HjzlUiToR/J/EQZ6DxX/2mATanqU2YCe39RYmqFrMM8g2Fen6b8V
   kskMJS5BnV5CgIxHGqH3ewWKGnXbEuYZ4jlYgn/BzHblcQJf5M9UOcD6P
   DaDK5uIELHfqu+9W9BKydue8mTaaqlR4IXdD2CeUjjHA/V/ubbfNLPkeJ
   4BZOwjZcMtOfghEh2wT7KbFzzWzMo/sag3cXfjtpBLEdoTaftdG77R89f
   g==;
X-CSE-ConnectionGUID: hoHBgQDqQ3OaqJB3m/kluQ==
X-CSE-MsgGUID: BKQ4xyVnShqndrUwVYG5EQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7583566"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7583566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 12:43:50 -0700
X-CSE-ConnectionGUID: fTPj2lVBQqyLdGC79QRfVw==
X-CSE-MsgGUID: jc9uMOMHQqGzGBdfhgA+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="24153425"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2024 12:43:48 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtBx4-0003oc-0I;
	Sat, 06 Apr 2024 19:43:46 +0000
Date: Sun, 7 Apr 2024 03:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [ukleinek:pwm/for-nexxt 28/28] drivers/pwm/pwm-bcm2835.c:148:15:
 error: implicit declaration of function 'devm_clk_rate_exclusive_get'; did
 you mean 'clk_rate_exclusive_get'?
Message-ID: <202404070359.YEHJFX4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-nexxt
head:   e2040e86d660980c4a3929ddde29419a77e37f75
commit: e2040e86d660980c4a3929ddde29419a77e37f75 [28/28] pwm: bcm2835: Drop open coded variant of devm_clk_rate_exclusive_get()
config: sh-randconfig-r123-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070359.YEHJFX4I-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240407/202404070359.YEHJFX4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070359.YEHJFX4I-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-bcm2835.c: In function 'bcm2835_pwm_probe':
>> drivers/pwm/pwm-bcm2835.c:148:15: error: implicit declaration of function 'devm_clk_rate_exclusive_get'; did you mean 'clk_rate_exclusive_get'? [-Werror=implicit-function-declaration]
     148 |         ret = devm_clk_rate_exclusive_get(dev, pc->clk);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               clk_rate_exclusive_get
   cc1: some warnings being treated as errors


vim +148 drivers/pwm/pwm-bcm2835.c

   126	
   127	static int bcm2835_pwm_probe(struct platform_device *pdev)
   128	{
   129		struct device *dev = &pdev->dev;
   130		struct pwm_chip *chip;
   131		struct bcm2835_pwm *pc;
   132		int ret;
   133	
   134		chip = devm_pwmchip_alloc(dev, 2, sizeof(*pc));
   135		if (IS_ERR(chip))
   136			return PTR_ERR(chip);
   137		pc = to_bcm2835_pwm(chip);
   138	
   139		pc->base = devm_platform_ioremap_resource(pdev, 0);
   140		if (IS_ERR(pc->base))
   141			return PTR_ERR(pc->base);
   142	
   143		pc->clk = devm_clk_get_enabled(dev, NULL);
   144		if (IS_ERR(pc->clk))
   145			return dev_err_probe(dev, PTR_ERR(pc->clk),
   146					     "clock not found\n");
   147	
 > 148		ret = devm_clk_rate_exclusive_get(dev, pc->clk);
   149		if (ret)
   150			return dev_err_probe(dev, ret,
   151					     "fail to get exclusive rate\n");
   152	
   153		pc->rate = clk_get_rate(pc->clk);
   154		if (!pc->rate)
   155			return dev_err_probe(dev, -EINVAL,
   156					     "failed to get clock rate\n");
   157	
   158		chip->ops = &bcm2835_pwm_ops;
   159		chip->atomic = true;
   160	
   161		platform_set_drvdata(pdev, pc);
   162	
   163		ret = devm_pwmchip_add(dev, chip);
   164		if (ret < 0)
   165			return dev_err_probe(dev, ret, "failed to add pwmchip\n");
   166	
   167		return 0;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
