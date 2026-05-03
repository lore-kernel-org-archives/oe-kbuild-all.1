Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6563B18FDBE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 00:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769573; cv=none; b=ZN4ZXk0tsxnGY2u6RDwEcFCYz0AUchpi1+hWVQhjwKkiBIyeNhryaC7vkgzB9Q/qSx5LibOwbIqJp7a5ol/hYFxMXWPEucwJLIxBH/XiwOYVjQtX8Q4SZQ8UTFl4NPQelY6hVlVGaQZA4GCgFUwC90cmx8hV2SoM+A+QxeXKFUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769573; c=relaxed/simple;
	bh=CSHk8rSoHRwYzG0I6kw7o1gNnf37Qe1vWDGzmLVL4A8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qFMgwH+WO/1B7h7RqoNJlvE7qbOR/iBO1W7V/8L4XgbN6YVE4P69wKOCpXy6worUjuplABc7TGdXQLxELHnsJ+cLX1d1ir0FpZ6V/ldPfHNKuMOvabpcTWUi11mTQ5Fwc9DRyvVjuvkYaNxQZq69Y8H8JWEAnubreg7o0RGwKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F02pl5Gj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F02pl5Gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777769572; x=1809305572;
  h=date:from:to:cc:subject:message-id;
  bh=CSHk8rSoHRwYzG0I6kw7o1gNnf37Qe1vWDGzmLVL4A8=;
  b=F02pl5Gj5FhYJ0IJjUyRSxClP5ysvqPu4ppovk1GFcpc5EDc2i0fgQ6+
   9Gno+XfPTkf0VxyQsRTuN7PW5DYSmNuQgSoRNZg4PPWcoLGcSd/l/Q9H7
   6njRv74hJ+VfM5iqn7UIE6C12wKl8VQa5Q9DnDvA26MEstilKctzBN4VO
   3BAvK9SqmG9fhBnqcjfTeDzbErKFwFwf9fZG3NHxM5AC9Kuj/iWioQ3KA
   JRO+uhtpWjcDARdieMNPqtNJmpe9eKAKdV+ZIJtA2u9BEnQ1hL0jZ2iHM
   zn1ffAzJlXFPvomIXIRJZMBa9xSH7u8jFQDGG3e4hT40jLrBZd49BfICA
   w==;
X-CSE-ConnectionGUID: Jvw9T+fzQ1qolQd+EXojXw==
X-CSE-MsgGUID: c+LPJnCCT/e8a/4avNOzNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="66211545"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="66211545"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:52:51 -0700
X-CSE-ConnectionGUID: 2uBBL8bIR7Kexe1RdEFKvg==
X-CSE-MsgGUID: qgPJgWcdSN2OKk9x50ksig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="232044937"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 May 2026 17:52:49 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJL4h-000000001xx-0OKg;
	Sun, 03 May 2026 00:52:47 +0000
Date: Sun, 03 May 2026 08:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:spacemit-pinctrl 2/4]
 drivers/pinctrl/spacemit/pinctrl-k1.c:443:12: warning:
 'spacemit_pctrl_dt_node_to_map' defined but not used
Message-ID: <202605030826.HXJd7qyV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git spacemit-pinctrl
head:   a49d8a3621634269a26e67a0ab38cbd3b7a900ce
commit: dffd260dc3eb37c144f6399608300af8d78edc4c [2/4] move spacemit stuff over to generic function
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605030826.HXJd7qyV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030826.HXJd7qyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030826.HXJd7qyV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/spacemit/pinctrl-k1.c:547:35: error: 'pinctrl_generic_pinmux_dt_node_to_map' undeclared here (not in a function); did you mean 'pinctrl_generic_pins_function_dt_node_to_map'?
     547 |         .dt_node_to_map         = pinctrl_generic_pinmux_dt_node_to_map,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   pinctrl_generic_pins_function_dt_node_to_map
>> drivers/pinctrl/spacemit/pinctrl-k1.c:443:12: warning: 'spacemit_pctrl_dt_node_to_map' defined but not used [-Wunused-function]
     443 | static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/spacemit/pinctrl-k1.c:231:12: warning: 'spacemit_dt_get_pin_mux' defined but not used [-Wunused-function]
     231 | static u16 spacemit_dt_get_pin_mux(u32 value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/spacemit_pctrl_dt_node_to_map +443 drivers/pinctrl/spacemit/pinctrl-k1.c

450e2487d5a2826 Troy Mitchell  2026-01-08  442  
a83c29e1d145cca Yixun Lan      2024-10-16 @443  static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
a83c29e1d145cca Yixun Lan      2024-10-16  444  					 struct device_node *np,
a83c29e1d145cca Yixun Lan      2024-10-16  445  					 struct pinctrl_map **maps,
a83c29e1d145cca Yixun Lan      2024-10-16  446  					 unsigned int *num_maps)
a83c29e1d145cca Yixun Lan      2024-10-16  447  {
a83c29e1d145cca Yixun Lan      2024-10-16  448  	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
a83c29e1d145cca Yixun Lan      2024-10-16  449  	struct device *dev = pctrl->dev;
a83c29e1d145cca Yixun Lan      2024-10-16  450  	struct device_node *child;
a83c29e1d145cca Yixun Lan      2024-10-16  451  	struct pinctrl_map *map;
a83c29e1d145cca Yixun Lan      2024-10-16  452  	const char **grpnames;
a83c29e1d145cca Yixun Lan      2024-10-16  453  	const char *grpname;
a83c29e1d145cca Yixun Lan      2024-10-16  454  	int ngroups = 0;
a83c29e1d145cca Yixun Lan      2024-10-16  455  	int nmaps = 0;
a83c29e1d145cca Yixun Lan      2024-10-16  456  	int ret;
a83c29e1d145cca Yixun Lan      2024-10-16  457  
a83c29e1d145cca Yixun Lan      2024-10-16  458  	for_each_available_child_of_node(np, child)
a83c29e1d145cca Yixun Lan      2024-10-16  459  		ngroups += 1;
a83c29e1d145cca Yixun Lan      2024-10-16  460  
a83c29e1d145cca Yixun Lan      2024-10-16  461  	grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
a83c29e1d145cca Yixun Lan      2024-10-16  462  	if (!grpnames)
a83c29e1d145cca Yixun Lan      2024-10-16  463  		return -ENOMEM;
a83c29e1d145cca Yixun Lan      2024-10-16  464  
bf4afc53b77aeaa Linus Torvalds 2026-02-21  465  	map = kzalloc_objs(*map, ngroups * 2);
a83c29e1d145cca Yixun Lan      2024-10-16  466  	if (!map)
a83c29e1d145cca Yixun Lan      2024-10-16  467  		return -ENOMEM;
a83c29e1d145cca Yixun Lan      2024-10-16  468  
a83c29e1d145cca Yixun Lan      2024-10-16  469  	ngroups = 0;
a83c29e1d145cca Yixun Lan      2024-10-16  470  	guard(mutex)(&pctrl->mutex);
a83c29e1d145cca Yixun Lan      2024-10-16  471  	for_each_available_child_of_node_scoped(np, child) {
a83c29e1d145cca Yixun Lan      2024-10-16  472  		unsigned int config, *pins;
a83c29e1d145cca Yixun Lan      2024-10-16  473  		int i, npins;
a83c29e1d145cca Yixun Lan      2024-10-16  474  
a83c29e1d145cca Yixun Lan      2024-10-16  475  		npins = of_property_count_u32_elems(child, "pinmux");
a83c29e1d145cca Yixun Lan      2024-10-16  476  
a83c29e1d145cca Yixun Lan      2024-10-16  477  		if (npins < 1) {
a83c29e1d145cca Yixun Lan      2024-10-16  478  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn\n",
a83c29e1d145cca Yixun Lan      2024-10-16  479  				np, child);
a83c29e1d145cca Yixun Lan      2024-10-16  480  			return -EINVAL;
a83c29e1d145cca Yixun Lan      2024-10-16  481  		}
a83c29e1d145cca Yixun Lan      2024-10-16  482  
a83c29e1d145cca Yixun Lan      2024-10-16  483  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
a83c29e1d145cca Yixun Lan      2024-10-16  484  					 np, child);
a83c29e1d145cca Yixun Lan      2024-10-16  485  		if (!grpname)
a83c29e1d145cca Yixun Lan      2024-10-16  486  			return -ENOMEM;
a83c29e1d145cca Yixun Lan      2024-10-16  487  
a83c29e1d145cca Yixun Lan      2024-10-16  488  		grpnames[ngroups++] = grpname;
a83c29e1d145cca Yixun Lan      2024-10-16  489  
a83c29e1d145cca Yixun Lan      2024-10-16  490  		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
a83c29e1d145cca Yixun Lan      2024-10-16  491  		if (!pins)
a83c29e1d145cca Yixun Lan      2024-10-16  492  			return -ENOMEM;
a83c29e1d145cca Yixun Lan      2024-10-16  493  
a83c29e1d145cca Yixun Lan      2024-10-16  494  		for (i = 0; i < npins; i++) {
a83c29e1d145cca Yixun Lan      2024-10-16  495  			ret = of_property_read_u32_index(child, "pinmux",
a83c29e1d145cca Yixun Lan      2024-10-16  496  							 i, &config);
a83c29e1d145cca Yixun Lan      2024-10-16  497  
a83c29e1d145cca Yixun Lan      2024-10-16  498  			if (ret)
a83c29e1d145cca Yixun Lan      2024-10-16  499  				return -EINVAL;
a83c29e1d145cca Yixun Lan      2024-10-16  500  
a83c29e1d145cca Yixun Lan      2024-10-16  501  			pins[i] = spacemit_dt_get_pin(config);
a83c29e1d145cca Yixun Lan      2024-10-16  502  		}
a83c29e1d145cca Yixun Lan      2024-10-16  503  
a83c29e1d145cca Yixun Lan      2024-10-16  504  		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
a83c29e1d145cca Yixun Lan      2024-10-16  505  		map[nmaps].data.mux.function = np->name;
a83c29e1d145cca Yixun Lan      2024-10-16  506  		map[nmaps].data.mux.group = grpname;
a83c29e1d145cca Yixun Lan      2024-10-16  507  		nmaps += 1;
a83c29e1d145cca Yixun Lan      2024-10-16  508  
a83c29e1d145cca Yixun Lan      2024-10-16  509  		ret = pinctrl_generic_add_group(pctldev, grpname,
dffd260dc3eb37c Conor Dooley   2026-04-24  510  						pins, npins, &config);
a83c29e1d145cca Yixun Lan      2024-10-16  511  		if (ret < 0)
a83c29e1d145cca Yixun Lan      2024-10-16  512  			return dev_err_probe(dev, ret, "failed to add group %s: %d\n", grpname, ret);
a83c29e1d145cca Yixun Lan      2024-10-16  513  
a83c29e1d145cca Yixun Lan      2024-10-16  514  		ret = pinconf_generic_parse_dt_config(child, pctldev,
a83c29e1d145cca Yixun Lan      2024-10-16  515  						      &map[nmaps].data.configs.configs,
a83c29e1d145cca Yixun Lan      2024-10-16  516  						      &map[nmaps].data.configs.num_configs);
a83c29e1d145cca Yixun Lan      2024-10-16  517  		if (ret)
a83c29e1d145cca Yixun Lan      2024-10-16  518  			return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
a83c29e1d145cca Yixun Lan      2024-10-16  519  				grpname);
a83c29e1d145cca Yixun Lan      2024-10-16  520  
a83c29e1d145cca Yixun Lan      2024-10-16  521  		if (map[nmaps].data.configs.num_configs == 0)
a83c29e1d145cca Yixun Lan      2024-10-16  522  			continue;
a83c29e1d145cca Yixun Lan      2024-10-16  523  
a83c29e1d145cca Yixun Lan      2024-10-16  524  		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
a83c29e1d145cca Yixun Lan      2024-10-16  525  		map[nmaps].data.configs.group_or_pin = grpname;
a83c29e1d145cca Yixun Lan      2024-10-16  526  		nmaps += 1;
a83c29e1d145cca Yixun Lan      2024-10-16  527  	}
a83c29e1d145cca Yixun Lan      2024-10-16  528  
a83c29e1d145cca Yixun Lan      2024-10-16  529  	ret = pinmux_generic_add_function(pctldev, np->name,
a83c29e1d145cca Yixun Lan      2024-10-16  530  					  grpnames, ngroups, NULL);
a83c29e1d145cca Yixun Lan      2024-10-16  531  	if (ret < 0) {
a83c29e1d145cca Yixun Lan      2024-10-16  532  		pinctrl_utils_free_map(pctldev, map, nmaps);
a83c29e1d145cca Yixun Lan      2024-10-16  533  		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
a83c29e1d145cca Yixun Lan      2024-10-16  534  	}
a83c29e1d145cca Yixun Lan      2024-10-16  535  
a83c29e1d145cca Yixun Lan      2024-10-16  536  	*maps = map;
a83c29e1d145cca Yixun Lan      2024-10-16  537  	*num_maps = nmaps;
a83c29e1d145cca Yixun Lan      2024-10-16  538  
a83c29e1d145cca Yixun Lan      2024-10-16  539  	return 0;
a83c29e1d145cca Yixun Lan      2024-10-16  540  }
a83c29e1d145cca Yixun Lan      2024-10-16  541  
a83c29e1d145cca Yixun Lan      2024-10-16  542  static const struct pinctrl_ops spacemit_pctrl_ops = {
a83c29e1d145cca Yixun Lan      2024-10-16  543  	.get_groups_count	= pinctrl_generic_get_group_count,
a83c29e1d145cca Yixun Lan      2024-10-16  544  	.get_group_name		= pinctrl_generic_get_group_name,
a83c29e1d145cca Yixun Lan      2024-10-16  545  	.get_group_pins		= pinctrl_generic_get_group_pins,
a83c29e1d145cca Yixun Lan      2024-10-16  546  	.pin_dbg_show		= spacemit_pctrl_dbg_show,
dffd260dc3eb37c Conor Dooley   2026-04-24 @547  	.dt_node_to_map		= pinctrl_generic_pinmux_dt_node_to_map,
a83c29e1d145cca Yixun Lan      2024-10-16  548  	.dt_free_map		= pinctrl_utils_free_map,
a83c29e1d145cca Yixun Lan      2024-10-16  549  };
a83c29e1d145cca Yixun Lan      2024-10-16  550  

:::::: The code at line 443 was first introduced by commit
:::::: a83c29e1d145cca5240952100acd1cd60f25fb5f pinctrl: spacemit: add support for SpacemiT K1 SoC

:::::: TO: Yixun Lan <dlan@gentoo.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
