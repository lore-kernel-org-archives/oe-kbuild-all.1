Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAF01C7012
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763862146; cv=none; b=E0dnHIL0DiO2L1PmVoCfA/rhbcz+cKEfqxDabye7LGXC/581MF0KGO4sPGmnAe1IjveZ/yihsVXNrTG6Dz+DxzgDluJ+UvgBJGBVFN80BmCJemNwRVxUGif/Vu+vcGOdTsRND7BWTaFq4fYsiO2VyvwaVH5JAQQRg0k+77NMCtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763862146; c=relaxed/simple;
	bh=2CISEA/mMC86k5iRfgeW0lD3iruR4mAPdLDG3JtHLB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pw6QRSTYlB7lQbLYWPsUVxpHJmd5B+fiYEy77vLjXZpyI6PKQIrKI4EwbeDNsvPC4rWZo8ikOhec4XWU6fOC63VnXxVZiK9e/3qgCT5P6KAGBlgrvfzqSYG9yeJasnomdYSBdqFnBDf4Cw1AZk4P5nNUnAZahJwy0elvgfYaD8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5d9qB7h; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5d9qB7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763862144; x=1795398144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2CISEA/mMC86k5iRfgeW0lD3iruR4mAPdLDG3JtHLB0=;
  b=a5d9qB7hxW5RUPF8GUU/MQEWS4jGyG+LVSL3VJcm0eFv+zt6eKgRDEE7
   YfaCtnnge+Uw7ruRL5fOESvrLAup3n57AE21sqqNA95yu7emaYvSopMod
   47W04paXqiXUE+WEaw78DS3IXm6Esbw8OWBUji9Zx2eD52sv1RcConrTm
   RGcuGx420dTXxW3ItxcjAqnSldKWywMHKn8qSccKnP2XG7wPuW/K/Kbd+
   JJh0NMosEMqw7BiPKHS7I7Tzt9kjfGSu/8i/AUZyN4NRNrAG++nt+W9x2
   7ioCRxPjsaEBIdUC3zNlSceF3Z8pZOSBK339p6rCniJLr3amPII2klSfC
   A==;
X-CSE-ConnectionGUID: KU6XDAX4Rwuvj9xNDmZ8qA==
X-CSE-MsgGUID: mPbYV6voTymhP4oGgaBNfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83528980"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="83528980"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:42:23 -0800
X-CSE-ConnectionGUID: 39jr07H4RwO1ZZjtsgl5pg==
X-CSE-MsgGUID: 1ToDYJk3S+GO+xY/lIHOPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191196635"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2025 17:42:23 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMz7M-0007yB-0p;
	Sun, 23 Nov 2025 01:42:20 +0000
Date: Sun, 23 Nov 2025 09:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 35/43] drivers/mfd/sec-irq.c:307:2-3: Unneeded
 semicolon
Message-ID: <202511230909.zk7EkTnb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   0e056211b8c92b9a051915afbc0409bc1cadc341
commit: ee19b52c31b3b111f140c1affd88eca1ed11edd0 [35/43] mfd: sec: Use chained IRQs for s2mpg10
config: riscv-randconfig-r052-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230909.zk7EkTnb-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230909.zk7EkTnb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mfd/sec-irq.c:307:2-3: Unneeded semicolon

vim +307 drivers/mfd/sec-irq.c

   289	
   290	static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
   291	{
   292		const struct regmap_irq_chip *irq_chip, *chained_irq_chip;
   293		struct regmap_irq_chip_data *irq_data;
   294		struct regmap *regmap_common;
   295		int chained_pirq;
   296		int ret;
   297	
   298		switch (sec_pmic->device_type) {
   299		case S2MPG10:
   300			irq_chip = &s2mpg10_irq_chip;
   301			chained_irq_chip = &s2mpg10_irq_chip_pmic;
   302			chained_pirq = S2MPG10_COMMON_IRQ_PMIC;
   303			break;
   304		default:
   305			return dev_err_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
   306					     sec_pmic->device_type);
 > 307		};
   308	
   309		regmap_common = dev_get_regmap(sec_pmic->dev, "common");
   310		if (!regmap_common)
   311			return dev_err_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\n",
   312					     sec_pmic->device_type);
   313	
   314		ret = devm_regmap_add_irq_chip(sec_pmic->dev, regmap_common, sec_pmic->irq, IRQF_ONESHOT, 0,
   315					       irq_chip, &irq_data);
   316		if (ret)
   317			return dev_err_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
   318					     irq_chip->name);
   319	
   320		return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic, chained_pirq,
   321						    irq_data, chained_irq_chip, &sec_pmic->irq_data);
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
