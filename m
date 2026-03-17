Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B73A6F1D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 23:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791220; cv=none; b=DYocb4cENJpA2OdowrZ9dkKrfcG8IFW2k10rbHsi5UvfO1TWO5sCIn5In+RW8rtUijpLKyyVj4GKm4RtbmB1tkilpyhVNVsTKSviTfbLCcLexCNw4xakEjKCPOQ3mXfpI828lPi4W+VVJHGXARPuCHwKIYs+SvNCiZQp8J+2co8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791220; c=relaxed/simple;
	bh=3nSj3vx52NBlBKYgVX8quCRUMqA7Y0v1yZ0XKbWtzyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eMYLfP2MmglBgStRDaSNP2GkkVFuhqCAejYW6YxagcngAAMNwaosOZg/NAIdq4L8uv5es0qo5tvg9U8ATMG6bT4S86SASQm/EKwkkmAimokNR00zaxV+EOE5itUqhP1o/+4vrBM3lKDLYnnykd9kl5H8K8NCG3wk4QDdIQ/Q9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpPRvDjz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpPRvDjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773791218; x=1805327218;
  h=date:from:to:cc:subject:message-id;
  bh=3nSj3vx52NBlBKYgVX8quCRUMqA7Y0v1yZ0XKbWtzyY=;
  b=OpPRvDjzsZawO0t96lIoNQvJCBxhh7oBem3RxImyYISZ8gZWG52x/O5x
   Jtpz911bO32f3gyeY7WrFNaYQq24p2fsTEkeF0PpCG82dTsdpzTJA/Q9c
   roMzfyRIXx8i0PqXHGPnqITIFQhC6IVzNJKS+ZWXxJjBA1RstAd3b2T+4
   FQ2axkohc4DAGumSDqVpD81UIqXJlLmN6QzPq3fXyT0MaH4a926dEnyWl
   mHLrJj9JI0yngMpRW8Q2EDWJjpDEecgZtjRyNdUnIYN1EyGpHVk7H1/TC
   cXrrrv1VtbKSIYBxbXx2wQdoUsGr3wJKT1wEqTFwXdYroRLjVJN4A0Bvc
   Q==;
X-CSE-ConnectionGUID: TNd1xDGYTmOgCp2KzN/DKA==
X-CSE-MsgGUID: qGxrPrppStO2bdyCAUPNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="73857997"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="73857997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 16:46:55 -0700
X-CSE-ConnectionGUID: NOthhwp2Q7iNzxQMBIohaQ==
X-CSE-MsgGUID: STS2tPe0Tpirw+f7XLnPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="227103865"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 16:46:54 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2e7f-000000002BR-0f4u;
	Tue, 17 Mar 2026 23:46:51 +0000
Date: Wed, 18 Mar 2026 07:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: drivers/regulator/mt6363-regulator.c:877:11: error: implicit
 declaration of function 'irq_find_host'; did you mean 'ida_find_first'?
Message-ID: <202603180705.ANjjwz5m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi AngeloGioacchino,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0caa1d49cc07b30a7e2f104d3853ec6dc1c3cad
commit: 3c36965df80801344850388592e95033eceea05b regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
date:   4 months ago
config: s390-randconfig-r112-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180705.ANjjwz5m-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180705.ANjjwz5m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180705.ANjjwz5m-lkp@intel.com/

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
