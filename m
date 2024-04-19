Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2B2BAF3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713562718; cv=none; b=aMTnSa69IDPlO7T5PAslYew5S8qwmuJ4RyB1qy3VIuJMw85p5mVeIMbo6QLL0aD+4ZD7UM6h681YCaaCKKLKg9SgWIwDgk9ZpGsGOMvq6KJ7a3xEAcvB4SOKAjlYmnvdmiXeUdYTE8z7HUcvWSPkYxgd/QTle9FewzsBmB8eSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713562718; c=relaxed/simple;
	bh=P4PNgCT9FFN475E5AYT+J96xWQZH12PUzo4wcHjonwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=az+yrZPqPUMRyMyf4+eqJIPdZuyO9dRuPzEaDiWVQJARHE37rOJEmdVvqaw4WaWit9DHVPLlZuzha71KB8XV/G+Pc4TfKY6Zs7ZVtwqgNf5yTsu5UNj+giMbEupXnL71o/KzVT0+PcLSwQZx/tmEDF0A8j3iVUDVL9IBDq8L7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD9y+qgJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD9y+qgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713562716; x=1745098716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P4PNgCT9FFN475E5AYT+J96xWQZH12PUzo4wcHjonwY=;
  b=PD9y+qgJ0HiOHDJd4d6d8A9BuayO21QY1Hs78n75WGCDRcOIn1H7kQM2
   yLJZQXhrI6i1szrHkIyxm6TUPQNP4/ad3ZZ5VMxIwS4sGZkg8VHFwe7jc
   kj+awIsaFiBYNM6NOjhPMq0VcEoE9SdFvvLpUYuZdVqq2MAGKJ7BfFCqN
   e1wuu2eAx1+XVz8m8Jj5ixSjkq+lVOVdvMX/5MiuO3zXSAmEqtFbxpy57
   3nZXl0Wmnz2RnbtnLBVA81j2QkSCHBhbhNuqwyTNm+RhMHToYVh6i97Au
   9fRqRxBH1WroDhSSTQjOiZiJQhPmYRGIAIug6kyJuYfVRIfwHgVUBJjH/
   g==;
X-CSE-ConnectionGUID: 8fZ6RFM5S6akqiJAREStEg==
X-CSE-MsgGUID: r53by6vORXe03AsFOM+AaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9042992"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9042992"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 14:38:34 -0700
X-CSE-ConnectionGUID: CwmdYwKGTpyxSXyi/gB0eA==
X-CSE-MsgGUID: HVEh7MUaTEiPuFPPe68vbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="23960596"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2024 14:38:32 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxvwD-000ATK-30;
	Fri, 19 Apr 2024 21:38:29 +0000
Date: Sat, 20 Apr 2024 05:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21355/22156]
 drivers/gpio/gpio-phytium-core.c:346:5: warning: "CONFIG_SMP" is not
 defined, evaluates to 0
Message-ID: <202404200513.yVJXlWk1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e9eac2f8ec0d6e36fe87c658851c3c77f990b098
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [21355/22156] gpio: add phytium gpio driver
config: x86_64-randconfig-014-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200513.yVJXlWk1-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200513.yVJXlWk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200513.yVJXlWk1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-phytium-core.c:346:5: warning: "CONFIG_SMP" is not defined, evaluates to 0 [-Wundef]
     346 | #if CONFIG_SMP
         |     ^~~~~~~~~~


vim +/CONFIG_SMP +346 drivers/gpio/gpio-phytium-core.c

   345	
 > 346	#if CONFIG_SMP
   347	int
   348	phytium_gpio_irq_set_affinity(struct irq_data *d,
   349					const struct cpumask *mask_val, bool force)
   350	{
   351		struct gpio_chip *chip_data = irq_data_get_irq_chip_data(d);
   352		struct irq_chip *chip = irq_get_chip(chip_data->irq.num_parents);
   353		struct irq_data *data = irq_get_irq_data(chip_data->irq.num_parents);
   354	
   355		if (chip && chip->irq_set_affinity)
   356			return chip->irq_set_affinity(data, mask_val, force);
   357	
   358		return -EINVAL;
   359	}
   360	EXPORT_SYMBOL_GPL(phytium_gpio_irq_set_affinity);
   361	#endif
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
