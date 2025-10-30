Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55EA22F74E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 04:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761797823; cv=none; b=pkPdl9v8qgKe+yB1zwej1evEAvUiB1hH2jBAxzaYXCEpjy6/jfeacAjCMHaZSoamGf1oVlpl4nVBKA2Oxdfa7lwuIXpYDH2PvXTK+L1KO93QjsXijUe6oIDq5F1O6YtSQixB+ZyhX3UqTr1a2X7vS+43cNNeN9R3T/zdavA2/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761797823; c=relaxed/simple;
	bh=0dhk2VBZc2L7JM3fiTEYhT4e5U4rdkn7d381ks7CqMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyqHTPYSFWllnmZSceVYZOYkVPA97zZ0zAjIm8lRnNXqaWl04BjUnP2pPHhhFNuyHd19tdj4JAkTBQ44XsDeNTx3Bi3AGerwnrtUDA4DD945oZsvLHBNIwlvoxQBCeMlEegkFQ1h67tQhOYOEtA8ImwJc5uRuucpHWxHvXIa52k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QhS2YaBC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhS2YaBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761797821; x=1793333821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0dhk2VBZc2L7JM3fiTEYhT4e5U4rdkn7d381ks7CqMg=;
  b=QhS2YaBCSPp6R2nJCbW++Nwje9mR/PPrBsC9vitFMN8FpVxNsS8Pm/8Z
   OUBlHac9BVoQloO/TLMsv+/r5d2+dCqGxJ6jjP70nV6/Ivo05Pfq67jjQ
   IIMnAEt5VywwcwNdOIgGX0VBv+nN/RaY1aeMLnAgs415dcS5hn687Pfg/
   qun3XK9PoaAuzgsfwK+BDS+4Aoxf2XVby2mLp4hVjBZQOtz0h6y61fOZT
   sqNkRaRCz9ZVWCJRL43yKZWdc7p5FjgJL1MxDsV7VmAWJnYWUJnoVHyuh
   EQYHomQMg178XWnbL+NPfJIkgLP0qt50ZYeiW3eRJYHDDXbYrA9sEtot2
   A==;
X-CSE-ConnectionGUID: 2tTJRfR8TfWf8KibBRNfiA==
X-CSE-MsgGUID: pSg2ay5TQuWU9KLlk07dpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67792133"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="67792133"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:17:00 -0700
X-CSE-ConnectionGUID: U2C9mlkvRtqTMB8eNT4JXQ==
X-CSE-MsgGUID: S/AyhtbtTGGkeCFPnedj8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189919055"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 21:16:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEK5h-000LSW-1G;
	Thu, 30 Oct 2025 04:16:51 +0000
Date: Thu, 30 Oct 2025 12:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 15/19] drivers/pinctrl/pinctrl-mpfs-mssio.c:282:9:
 error: call to undeclared function 'pinctrl_generic_add_group'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202510301225.fgJ0TEeE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   4f58eff7ed5c30309e34f45a438261a8d549ff32
commit: e837b2338def7f2bc3b43b11122c02c265689c28 [15/19] pinctrl: add polarfire soc mssio pinctrl driver
config: arm-sama7_defconfig (https://download.01.org/0day-ci/archive/20251030/202510301225.fgJ0TEeE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301225.fgJ0TEeE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301225.fgJ0TEeE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-mpfs-mssio.c:282:9: error: call to undeclared function 'pinctrl_generic_add_group'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     282 |                 ret = pinctrl_generic_add_group(pctrl_dev, grpname, pins, npins, pinmuxs);
         |                       ^
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:302:8: error: call to undeclared function 'pinmux_generic_add_function'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     302 |         ret = pinmux_generic_add_function(pctrl_dev, np->name, grpnames, ngroups, NULL);
         |               ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:302:8: note: did you mean 'pinmux_generic_free_functions'?
   drivers/pinctrl/pinmux.h:177:20: note: 'pinmux_generic_free_functions' declared here
     177 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:315:22: error: use of undeclared identifier 'pinctrl_generic_get_group_count'
     315 |         .get_groups_count = pinctrl_generic_get_group_count,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:316:20: error: use of undeclared identifier 'pinctrl_generic_get_group_name'
     316 |         .get_group_name = pinctrl_generic_get_group_name,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:317:20: error: use of undeclared identifier 'pinctrl_generic_get_group_pins'; did you mean 'pinctrl_get_group_pins'?
     317 |         .get_group_pins = pinctrl_generic_get_group_pins,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           pinctrl_get_group_pins
   include/linux/pinctrl/pinctrl.h:206:12: note: 'pinctrl_get_group_pins' declared here
     206 | extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
         |            ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:351:10: error: call to undeclared function 'pinctrl_generic_get_group'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     351 |         group = pinctrl_generic_get_group(pctrl_dev, gsel);
         |                 ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:351:8: error: incompatible integer to pointer conversion assigning to 'const struct group_desc *' from 'int' [-Wint-conversion]
     351 |         group = pinctrl_generic_get_group(pctrl_dev, gsel);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:355:17: error: incomplete definition of type 'const struct group_desc'
     355 |         configs = group->data;
         |                   ~~~~~^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:348:15: note: forward declaration of 'struct group_desc'
     348 |         const struct group_desc *group;
         |                      ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:357:27: error: incomplete definition of type 'const struct group_desc'
     357 |         for (int i = 0; i < group->grp.npins; i++) {
         |                             ~~~~~^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:348:15: note: forward declaration of 'struct group_desc'
     348 |         const struct group_desc *group;
         |                      ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:367:25: error: use of undeclared identifier 'pinmux_generic_get_function_count'; did you mean 'pinmux_generic_free_functions'?
     367 |         .get_functions_count    = pinmux_generic_get_function_count,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   pinmux_generic_free_functions
   drivers/pinctrl/pinmux.h:177:20: note: 'pinmux_generic_free_functions' declared here
     177 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:368:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
     368 |         .get_function_name      = pinmux_generic_get_function_name,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   pinmux_generic_free_functions
   drivers/pinctrl/pinmux.h:177:20: note: 'pinmux_generic_free_functions' declared here
     177 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:369:25: error: use of undeclared identifier 'pinmux_generic_get_function_groups'; did you mean 'pinmux_generic_free_functions'?
     369 |         .get_function_groups    = pinmux_generic_get_function_groups,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   pinmux_generic_free_functions
   drivers/pinctrl/pinmux.h:177:20: note: 'pinmux_generic_free_functions' declared here
     177 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:367:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     367 |         .get_functions_count    = pinmux_generic_get_function_count,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:368:23: error: incompatible function pointer types initializing 'const char *(*)(struct pinctrl_dev *, unsigned int)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     368 |         .get_function_name      = pinmux_generic_get_function_name,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:369:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *, unsigned int, const char *const **, unsigned int *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     369 |         .get_function_groups    = pinmux_generic_get_function_groups,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:632:10: error: call to undeclared function 'pinctrl_generic_get_group'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     632 |         group = pinctrl_generic_get_group(pctrl_dev, gsel);
         |                 ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:632:8: error: incompatible integer to pointer conversion assigning to 'const struct group_desc *' from 'int' [-Wint-conversion]
     632 |         group = pinctrl_generic_get_group(pctrl_dev, gsel);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:640:13: error: incomplete definition of type 'const struct group_desc'
     640 |         pin = group->grp.pins[0];
         |               ~~~~~^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:627:15: note: forward declaration of 'struct group_desc'
     627 |         const struct group_desc *group;
         |                      ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:646:27: error: incomplete definition of type 'const struct group_desc'
     646 |         for (int i = 0; i < group->grp.npins; i++)
         |                             ~~~~~^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:627:15: note: forward declaration of 'struct group_desc'
     627 |         const struct group_desc *group;
         |                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/pinctrl_generic_add_group +282 drivers/pinctrl/pinctrl-mpfs-mssio.c

   212	
   213	static int mpfs_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev, struct device_node *np,
   214						 struct pinctrl_map **maps, unsigned int *num_maps)
   215	{
   216		struct mpfs_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
   217		struct device *dev = pctrl->dev;
   218		struct device_node *child;
   219		struct pinctrl_map *map;
   220		const char **grpnames;
   221		const char *grpname;
   222		int ngroups = 0;
   223		int nmaps = 0;
   224		int ret;
   225	
   226		for_each_available_child_of_node(np, child)
   227			ngroups += 1;
   228	
   229		grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
   230		if (!grpnames)
   231			return -ENOMEM;
   232	
   233		map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
   234		if (!map)
   235			return -ENOMEM;
   236	
   237		ngroups = 0;
   238		guard(mutex)(&pctrl->mutex);
   239		for_each_available_child_of_node_scoped(np, child) {
   240			struct mpfs_pinctrl_mux_config *pinmuxs;
   241			unsigned int config, *pins;
   242			int i, npins;
   243	
   244			npins = of_property_count_u32_elems(child, "pinmux");
   245	
   246			if (npins < 1) {
   247				dev_err(dev, "invalid pinctrl group %pOFn.%pOFn\n",
   248					np, child);
   249				return -EINVAL;
   250			}
   251	
   252			grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
   253						 np, child);
   254			if (!grpname)
   255				return -ENOMEM;
   256	
   257			grpnames[ngroups++] = grpname;
   258	
   259			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
   260			if (!pins)
   261				return -ENOMEM;
   262	
   263			pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
   264			if (!pinmuxs)
   265				return -ENOMEM;
   266	
   267			for (i = 0; i < npins; i++) {
   268				ret = of_property_read_u32_index(child, "pinmux", i, &config);
   269				if (ret)
   270					return -EINVAL;
   271	
   272				pins[i] = config >> MPFS_PINCTRL_DT_PIN_OFFSET;
   273				pinmuxs[i].config = config & MPFS_PINCTRL_DT_FUNC_MASK;
   274				pinmuxs[i].pin = config >> MPFS_PINCTRL_DT_PIN_OFFSET;
   275			}
   276	
   277			map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
   278			map[nmaps].data.mux.function = np->name;
   279			map[nmaps].data.mux.group = grpname;
   280			nmaps += 1;
   281	
 > 282			ret = pinctrl_generic_add_group(pctrl_dev, grpname, pins, npins, pinmuxs);
   283			if (ret < 0)
   284				return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
   285						     grpname, ret);
   286	
   287			ret = pinconf_generic_parse_dt_config(child, pctrl_dev,
   288							      &map[nmaps].data.configs.configs,
   289							      &map[nmaps].data.configs.num_configs);
   290			if (ret)
   291				return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
   292					grpname);
   293	
   294			if (map[nmaps].data.configs.num_configs == 0)
   295				continue;
   296	
   297			map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
   298			map[nmaps].data.configs.group_or_pin = grpname;
   299			nmaps += 1;
   300		}
   301	
 > 302		ret = pinmux_generic_add_function(pctrl_dev, np->name, grpnames, ngroups, NULL);
   303		if (ret < 0) {
   304			pinctrl_utils_free_map(pctrl_dev, map, nmaps);
   305			return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
   306		}
   307	
   308		*maps = map;
   309		*num_maps = nmaps;
   310	
   311		return 0;
   312	};
   313	
   314	static struct pinctrl_ops mpfs_pinctrl_ops = {
 > 315		.get_groups_count = pinctrl_generic_get_group_count,
 > 316		.get_group_name	= pinctrl_generic_get_group_name,
 > 317		.get_group_pins	= pinctrl_generic_get_group_pins,
   318		.pin_dbg_show = mpfs_pinctrl_dbg_show,
   319		.dt_node_to_map = mpfs_pinctrl_dt_node_to_map,
   320		.dt_free_map = pinctrl_utils_free_map,
   321	};
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
