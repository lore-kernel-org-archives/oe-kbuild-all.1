Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2531FC8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770768608; cv=none; b=A1pJvVWAJmpuKP+nY11XkaqMWDdETMhjmS3MHnarhVQLx+/Sd6sUdWOzFM+5BuwpBKY1YfpiWnYtuAoCIQ3jCs5Oy0iKw7SGeyzG8LsjjA/IlxVAFsVJm7IESLooUe1aRS14dxKi5ZCY6ec17OJ8EYqZZKp3FuFPKQftGV/u7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770768608; c=relaxed/simple;
	bh=qYHiSFybsiBiEyHlkr2sR6jK5ts8yD99cHXvL9KbvS4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N23t6yB0Rfa8qJmnTAkVVoQeDVzmV+MqBUpqON9+G1f1YLgdHeaU9lV1OhNSa583ubN1canwKvdVx+0UPT2RVRB32IZuC6t/8KfLv58y/0EZpm/oaVUXNFYtv0yNvqkm1f94gc2Tc6JmGFyvrSjOx9YcgRJgPbVS66YOX56VOaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyMAjmZ9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyMAjmZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770768607; x=1802304607;
  h=date:from:to:cc:subject:message-id;
  bh=qYHiSFybsiBiEyHlkr2sR6jK5ts8yD99cHXvL9KbvS4=;
  b=KyMAjmZ9J88PzEbkMhtjubvVfeKSzB4kzdavOphHDgSyzzb9/dWE5VVb
   8WPcXnf3r+2HSDQ8kOkaSnO2ZeHN6lGCzKcvOp2T7+97hlr88mXvaq/oC
   Cv9BEMlXolF3yC+pa81HLLKcyjlTVUJQ8PYj+xGbZtYZF7Xfv2FJ0hc0z
   J5x0w2wMBjf+9KZD2dMI3q/kfzI8HWNAWNHEvIPxLj3LnmcGLZZohJKfU
   ic/al1Zv4FFG5P2j3VCrPA2HfAoyOKMB0gITh09zNyZgdbOmPQwNWPl4w
   dl0veUt/MuQTt+9gkBdvx3HOJ5493dcZjR8Vl2RQ7fOufJX9NeMt7aqw7
   w==;
X-CSE-ConnectionGUID: BAXp6jB6SYqWv7B+MTdQfg==
X-CSE-MsgGUID: gkO1JNwZRGqjxLKwy6ICyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83279535"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83279535"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:10:06 -0800
X-CSE-ConnectionGUID: XEeDe99TRsieQbBhmNTMLw==
X-CSE-MsgGUID: ei3U3/xQQ7aP8Xzgmb0tHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="217023207"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Feb 2026 16:10:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpxnu-00000000pX2-3QcD;
	Wed, 11 Feb 2026 00:10:02 +0000
Date: Wed, 11 Feb 2026 08:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:bla 1/4] drivers/gpio/gpio-mpfs.c:267:10: error: call
 to undeclared function 'devm_request_irq'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202602110859.CbN7moeR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git bla
head:   6124ffbb452bacd43bf2679507cf0908b229701a
commit: a20ea9beb081c80bcb178e25ca3386c9068e8474 [1/4] gpio: mpfs: Add interrupt support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110859.CbN7moeR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110859.CbN7moeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110859.CbN7moeR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-mpfs.c:267:10: error: call to undeclared function 'devm_request_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     267 |                         ret = devm_request_irq(dev, girq->parents[i], mpfs_gpio_irq_handler,
         |                               ^
   drivers/gpio/gpio-mpfs.c:267:10: note: did you mean 'can_request_irq'?
   include/linux/irq.h:710:13: note: 'can_request_irq' declared here
     710 | extern bool can_request_irq(unsigned int irq, unsigned long irqflags);
         |             ^
>> drivers/gpio/gpio-mpfs.c:268:13: error: use of undeclared identifier 'IRQF_SHARED'
     268 |                                                IRQF_SHARED, NULL, mpfs_gpio);
         |                                                ^
   2 errors generated.


vim +/devm_request_irq +267 drivers/gpio/gpio-mpfs.c

   200	
   201	static int mpfs_gpio_probe(struct platform_device *pdev)
   202	{
   203		struct device *dev = &pdev->dev;
   204		struct device_node *node = pdev->dev.of_node;
   205		struct mpfs_gpio_chip *mpfs_gpio;
   206		struct gpio_irq_chip *girq;
   207		struct clk *clk;
   208		void __iomem *base;
   209		int ngpios, nirqs, ret;
   210	
   211		mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
   212		if (!mpfs_gpio)
   213			return -ENOMEM;
   214	
   215		mpfs_gpio->offsets = device_get_match_data(&pdev->dev);
   216	
   217		base = devm_platform_ioremap_resource(pdev, 0);
   218		if (IS_ERR(base))
   219			return dev_err_probe(dev, PTR_ERR(base), "failed to ioremap memory resource\n");
   220	
   221		mpfs_gpio->regs = devm_regmap_init_mmio(dev, base, &mpfs_gpio_regmap_config);
   222		if (IS_ERR(mpfs_gpio->regs))
   223			return dev_err_probe(dev, PTR_ERR(mpfs_gpio->regs),
   224					     "failed to initialise regmap\n");
   225	
   226		clk = devm_clk_get_enabled(dev, NULL);
   227		if (IS_ERR(clk))
   228			return dev_err_probe(dev, PTR_ERR(clk), "failed to get and enable clock\n");
   229	
   230		ngpios = MPFS_MAX_NUM_GPIO;
   231		device_property_read_u32(dev, "ngpios", &ngpios);
   232		if (ngpios > MPFS_MAX_NUM_GPIO)
   233			ngpios = MPFS_MAX_NUM_GPIO;
   234	
   235		mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
   236		mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
   237		mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
   238		mpfs_gpio->gc.get = mpfs_gpio_get;
   239		mpfs_gpio->gc.set = mpfs_gpio_set;
   240		mpfs_gpio->gc.base = -1;
   241		mpfs_gpio->gc.ngpio = ngpios;
   242		mpfs_gpio->gc.label = dev_name(dev);
   243		mpfs_gpio->gc.parent = dev;
   244		mpfs_gpio->gc.owner = THIS_MODULE;
   245	
   246		nirqs = of_irq_count(node);
   247		if (nirqs > MPFS_MAX_NUM_GPIO)
   248			return -ENXIO;
   249	
   250		girq = &mpfs_gpio->gc.irq;
   251		girq->num_parents = nirqs;
   252	
   253		if (girq->num_parents) {
   254			gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
   255	
   256			girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
   257						     sizeof(*girq->parents), GFP_KERNEL);
   258			if (!girq->parents)
   259				return -ENOMEM;
   260	
   261			for (int i = 0; i < girq->num_parents; i++) {
   262				ret = platform_get_irq(pdev, i);
   263				if (ret < 0)
   264					return ret;
   265	
   266				girq->parents[i] = ret;
 > 267				ret = devm_request_irq(dev, girq->parents[i], mpfs_gpio_irq_handler,
 > 268						       IRQF_SHARED, NULL, mpfs_gpio);
   269				if (ret)
   270					return dev_err_probe(dev, ret,
   271							     "failed to request irq for line %u\n",
   272							     i);
   273			}
   274	
   275			girq->handler = handle_level_irq;
   276			girq->default_type = IRQ_TYPE_NONE;
   277		}
   278	
   279		return devm_gpiochip_add_data(dev, &mpfs_gpio->gc, mpfs_gpio);
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
