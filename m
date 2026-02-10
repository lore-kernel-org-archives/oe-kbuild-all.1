Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91FE31578B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770765307; cv=none; b=HYwhgMm6pN86EF2jcM/IrhgcLMlJO/19tJAyVXUnn1AuDQH6V07hZTynywZb5FnVjk0PCNVXf+SqBTCJYjtw8a8aaDXpMCwd8fcGRkyD8TGoPEzLHcb6aBo3mwzIs0Ot4ZPWq2gRemIwx0OTwiPES10a1Xt63VJuanTzbrJ7BZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770765307; c=relaxed/simple;
	bh=/OyBP0Q8Mj/G2WlfxSyhbx5cS3/mLdLXiGBoAk/XOII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TzI11CKsFHJQ8/EozIm8XEoBORhF6cJUT09IHuPu/THdDbOOQqrVsmXp++wssTQWlQhPwxqzxze+cQcTiNBoICFB6TRxaYLYaBEgxLrYPoHI+O2sX9hiG+9bSvuQwBm+SLY/8h4T854syZPrn4fotHjAeBTTQnhpWxc1GgIYzzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjKGKUVt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjKGKUVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770765306; x=1802301306;
  h=date:from:to:cc:subject:message-id;
  bh=/OyBP0Q8Mj/G2WlfxSyhbx5cS3/mLdLXiGBoAk/XOII=;
  b=EjKGKUVt3pqiS8hbrFvLl8rdNC4QiAHmbG4p3cNbwtnTDwgxTE1aRDAg
   xDp/njni4JCMoxVyYWsFlvuXzZShZOGJGh/zqEt8X5klbxcRjfR1pQCGg
   Xl1myqI0zsAp83kMSVm7Yfvi5n08yYMuifqbVteU3pE0gxilHMpn5asKO
   zqmKz5M8M2I7wCpXCe8p0Wm2CWBxUPwhAdwmmekYOOqAKfSsCvCX4x5OD
   GtYS+ddt17UK6HBqZCCf8h9RXs6AwSXAsKIzXK69GLB3MOeVSnERO0UkZ
   eXxSMqt6l4mLvaDLRbuIyhUwax/eSQq/83e0hSKANprs+zeHZFiyyiUw6
   A==;
X-CSE-ConnectionGUID: MKkY0VeuSYe268bbz3ezig==
X-CSE-MsgGUID: PmmOIqiST06MstktpjnhXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75755423"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75755423"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 15:15:05 -0800
X-CSE-ConnectionGUID: wzrK8ZDuTKGYFvzcReL+Yg==
X-CSE-MsgGUID: MQ2TZRhqSOOMsLBQ/x9tHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="241951407"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2026 15:15:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpwwf-00000000pUu-0j2V;
	Tue, 10 Feb 2026 23:15:01 +0000
Date: Wed, 11 Feb 2026 07:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:bla 1/4] drivers/gpio/gpio-mpfs.c:267:31: error:
 implicit declaration of function 'devm_request_irq'; did you mean
 'can_request_irq'?
Message-ID: <202602110750.Uc5z21rO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git bla
head:   6124ffbb452bacd43bf2679507cf0908b229701a
commit: a20ea9beb081c80bcb178e25ca3386c9068e8474 [1/4] gpio: mpfs: Add interrupt support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110750.Uc5z21rO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110750.Uc5z21rO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110750.Uc5z21rO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_probe':
>> drivers/gpio/gpio-mpfs.c:267:31: error: implicit declaration of function 'devm_request_irq'; did you mean 'can_request_irq'? [-Wimplicit-function-declaration]
     267 |                         ret = devm_request_irq(dev, girq->parents[i], mpfs_gpio_irq_handler,
         |                               ^~~~~~~~~~~~~~~~
         |                               can_request_irq
>> drivers/gpio/gpio-mpfs.c:268:48: error: 'IRQF_SHARED' undeclared (first use in this function)
     268 |                                                IRQF_SHARED, NULL, mpfs_gpio);
         |                                                ^~~~~~~~~~~
   drivers/gpio/gpio-mpfs.c:268:48: note: each undeclared identifier is reported only once for each function it appears in


vim +267 drivers/gpio/gpio-mpfs.c

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
