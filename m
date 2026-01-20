Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04D53382DD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 03:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768881578; cv=none; b=PfQeQRlbn5XazUa9RWhysUqcJ9XpbLJD6ERGfAlD079j8TdkgX4mAYUoBX7nEUKIzjnPOVHy+2qv8qjzl8StheeHXoE6jbnCFItjLZEzr7CeGQ8jYotRyr1cBqa+ZIfLaSUPwiPwGoYfQh/L9qlGlSn9zNih8AAudtgzvylfAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768881578; c=relaxed/simple;
	bh=LQvkxIkz0yJXRKATAf4Qkph+uzXwa4U2a8m1lV6UQpw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JUPU2jJXFKL0Uwz8Jo7JZZf2WC6QwHAhma7P7tQX/bVKs9XeIQcFtjhgPTAaqypOnf0XFRtVvvkjJ7unvXnS8ZuTdsp4VwHCobtOiyfbzrCCDd5n8WxEpuzK7Srgz49TstYYEiGMQtT7EMNU5AuSZpjdwkkXKXNM5nJ5LvoV+Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsc8UXJX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsc8UXJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768881575; x=1800417575;
  h=date:from:to:cc:subject:message-id;
  bh=LQvkxIkz0yJXRKATAf4Qkph+uzXwa4U2a8m1lV6UQpw=;
  b=dsc8UXJXuE/zQd/3n31XDg0JdwWW6GXtUYq6VCGosPGbyq/tkm2KvAZT
   Wj7NykLakb9v0fd3JoH3b/0WrNij1HMlw3pcMBdHfeFFoE4TMR0rwDniw
   iQs8TZwv9MAxUBmKdrLTn4jNa2FyMzUF+eEML+Vpor/psxAxi2k+D4cF8
   GqPnUSwcjnJ+EadXscXP6k2HuJWu3YZCJrP/WpyC7+rrNI2ZRP86FMFiv
   /6c2whDziaB24JNRmI/ta43+QvtsWq2xqY6Z1cKZEghjv+Y0kK2AUHfhq
   BYtZPxrViwjyPVfDslO6ffM3Xe8mDso8pPK0FhgcPuEzX1CUk89xai0fK
   Q==;
X-CSE-ConnectionGUID: b4/EkhekTL2vj0mmTwwQUg==
X-CSE-MsgGUID: +EYZPKqKQU+N0kdmWMBtnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95557228"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="95557228"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 19:59:34 -0800
X-CSE-ConnectionGUID: uk72luuPSAipGGeWcOt8/A==
X-CSE-MsgGUID: 0HUipgjJTjyUecZ/h2reWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="228936043"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 19:59:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi2tu-00000000OXP-1rHr;
	Tue, 20 Jan 2026 03:59:30 +0000
Date: Tue, 20 Jan 2026 11:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: drivers/regulator/mt6363-regulator.c:877:11: error: implicit
 declaration of function 'irq_find_host'; did you mean 'ida_find_first'?
Message-ID: <202601201117.SkLEZ6Dg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 3c36965df80801344850388592e95033eceea05b regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
date:   3 months ago
config: s390-randconfig-r113-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201117.SkLEZ6Dg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201117.SkLEZ6Dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201117.SkLEZ6Dg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/regulator/mt6363-regulator.c: In function 'mt6363_regulator_probe':
>> drivers/regulator/mt6363-regulator.c:877:11: error: implicit declaration of function 'irq_find_host'; did you mean 'ida_find_first'? [-Werror=implicit-function-declaration]
     domain = irq_find_host(interrupt_parent);
              ^~~~~~~~~~~~~
              ida_find_first
>> drivers/regulator/mt6363-regulator.c:877:9: warning: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     domain = irq_find_host(interrupt_parent);
            ^
>> drivers/regulator/mt6363-regulator.c:889:16: error: implicit declaration of function 'irq_create_fwspec_mapping'; did you mean 'irq_create_of_mapping'? [-Werror=implicit-function-declaration]
      info->virq = irq_create_fwspec_mapping(&fwspec);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
                   irq_create_of_mapping
   cc1: some warnings being treated as errors


vim +877 drivers/regulator/mt6363-regulator.c

   853	
   854	static int mt6363_regulator_probe(struct platform_device *pdev)
   855	{
   856		struct device_node *interrupt_parent;
   857		struct regulator_config config = {};
   858		struct mt6363_regulator_info *info;
   859		struct device *dev = &pdev->dev;
   860		struct regulator_dev *rdev;
   861		struct irq_domain *domain;
   862		struct irq_fwspec fwspec;
   863		struct spmi_device *sdev;
   864		int i, ret;
   865	
   866		config.regmap = mt6363_spmi_register_regmap(dev);
   867		if (IS_ERR(config.regmap))
   868			return dev_err_probe(dev, PTR_ERR(config.regmap),
   869					     "Cannot get regmap\n");
   870		config.dev = dev;
   871		sdev = to_spmi_device(dev->parent);
   872	
   873		interrupt_parent = of_irq_find_parent(dev->of_node);
   874		if (!interrupt_parent)
   875			return dev_err_probe(dev, -EINVAL, "Cannot find IRQ parent\n");
   876	
 > 877		domain = irq_find_host(interrupt_parent);
   878		of_node_put(interrupt_parent);
   879		fwspec.fwnode = domain->fwnode;
   880	
   881		fwspec.param_count = 3;
   882		fwspec.param[0] = sdev->usid;
   883		fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
   884	
   885		for (i = 0; i < ARRAY_SIZE(mt6363_regulators); i++) {
   886			info = &mt6363_regulators[i];
   887	
   888			fwspec.param[1] = info->hwirq;
 > 889			info->virq = irq_create_fwspec_mapping(&fwspec);
   890			if (!info->virq)
   891				return dev_err_probe(dev, -EINVAL,
   892						     "Failed to map IRQ%d\n", info->hwirq);
   893	
   894			ret = devm_add_action_or_reset(dev, mt6363_irq_remove, &info->virq);
   895			if (ret) {
   896				irq_dispose_mapping(info->hwirq);
   897				return ret;
   898			}
   899	
   900			config.driver_data = info;
   901			INIT_DELAYED_WORK(&info->oc_work, mt6363_oc_irq_enable_work);
   902	
   903			rdev = devm_regulator_register(dev, &info->desc, &config);
   904			if (IS_ERR(rdev))
   905				return dev_err_probe(dev, PTR_ERR(rdev),
   906						     "failed to register %s\n", info->desc.name);
   907	
   908			if (info->lp_imax_uA) {
   909				ret = mt6363_backup_op_setting(config.regmap, info);
   910				if (ret) {
   911					dev_warn(dev, "Failed to backup op_setting for %s\n",
   912						 info->desc.name);
   913					info->lp_imax_uA = 0;
   914				}
   915			}
   916		}
   917	
   918		return 0;
   919	}
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
