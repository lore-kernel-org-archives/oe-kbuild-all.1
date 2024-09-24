Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F041B85FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 02:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727144638; cv=none; b=TNInepRfU7Ajk5jfTS0MLtLiEdjcTu6aTJft5P4XcxtoonjPbwLaCy49R46hCuamZ3nv9DI2JBqqxN/vBbhc77W2WQZzoWZY2XgSdKcgwc+nbp2LgubUwyvB+2aMtViIm/rBBiHuuSf8sdE+sZorPMNX3Aar9jqvZ6JbUh0aWiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727144638; c=relaxed/simple;
	bh=eE1WQYJYPs+pEjUW0wmKO++/WbnTS9HCN1KXikSW+Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAo9HWiXvCeE+hkA6KkNOH9HBCwmpkWtVD0qpEPn1YjPLRYbaoCRRJAzF9CR4VlSLqGsJe3P9ysb5RwQb4nra8ZbzRqzvsqtjFPwQzZDimwhBq0wppLPrghwC8YohF4NdaehqsoxZqHi5EsFMWMg0CpLhMpMBRmKUogDl0XoTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJk2blnO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJk2blnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727144635; x=1758680635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eE1WQYJYPs+pEjUW0wmKO++/WbnTS9HCN1KXikSW+Fc=;
  b=SJk2blnOkwYe2Ywuo5M6kyx3i8SSO0ozLvwsVK8qBjak5fYne/3WWZES
   G2gphKXgMoQtrRcdmqgobC7bw5yW1eKmHfnQhadmBrFKpUbp7FG1l90Rx
   7xNQGWHx/pFGkqzKooxoE7tNmV7d075FB0LXlgT42B62gU+EN1IltaqJt
   DTGJ8TXOtw1YauLCa383Mwu7xm0O6AUs36AuSF2xe8/YAycByGYoFw9x/
   RTZtHOjOE9wZDRnPZc2FvVd4ubvp+gPc+i2sKdzGCfCCYLR4jQ0Lqgut1
   TIoP20ILWtCA41LSpbeSAmGSAo4L45YU68ppNSpb2T8GRsUytdblBoRsQ
   A==;
X-CSE-ConnectionGUID: kv1uqYb8S9iwsRrKRDUcug==
X-CSE-MsgGUID: Dh2XjLaMSjuTKT+4o6gWRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26072047"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="26072047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 19:23:55 -0700
X-CSE-ConnectionGUID: as1hlDBHQlmY1SJYMj96cA==
X-CSE-MsgGUID: UrdGLmLjRxOTfAdDNJjZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="102099345"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2024 19:23:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvDT-000Hob-2b;
	Tue, 24 Sep 2024 02:23:51 +0000
Date: Tue, 24 Sep 2024 10:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21355/23742]
 drivers/gpio/gpio-phytium-core.c:346:5: warning: "CONFIG_SMP" is not
 defined, evaluates to 0
Message-ID: <202409241018.HxSSkSip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f2ffc6afa458c9c8ddacf5000e60c1be28e095e1
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [21355/23742] gpio: add phytium gpio driver
config: x86_64-randconfig-r063-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241018.HxSSkSip-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241018.HxSSkSip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241018.HxSSkSip-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-phytium-core.c:346:5: warning: "CONFIG_SMP" is not defined, evaluates to 0 [-Wundef]
     346 | #if CONFIG_SMP
         |     ^~~~~~~~~~
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
