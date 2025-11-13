Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D5E28EA72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009425; cv=none; b=gL7hv5cSXb810hn292QDl++xizQuq1Hn4z8CZkDFTH3KuMOTXYnE2vBkA5pU127nnVSWlEPqk7xO91ujKT4BP1Q9vnvNgT5t/zOeVjIK0Z9yHNWe8SOwZV/0l296wrL1OcDviMMj6Nn5EIkqT7J6Mh1nG4x3TMNGNtIyIPvl3U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009425; c=relaxed/simple;
	bh=2B1FnSeDSzqW5wDi7ZtbuShEjUnrVbJ5/SmqKgCoE/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUXhT6H+VcBIsF6YrF5hWYOquQ6Z8+dOFDxxrCPUaw/ZgTml97fsekO5CcZMciCbGbNPmjrbNEKvMuL7tmo7fAda3PB+xZlPkBEm5WzforIBQ9K47wrpRe8KKkl3umos5e8shp70V1I1AOdgzhYRFRRCCxLK22UuDqDQzc2lP4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvN1ijHP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvN1ijHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009424; x=1794545424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2B1FnSeDSzqW5wDi7ZtbuShEjUnrVbJ5/SmqKgCoE/E=;
  b=SvN1ijHPK2y/39CLVSXAHrjN/EpLfaC9eZXfo35m66EGi7QJeCQbVf+Y
   mpKYaz+k0QRvXR+vmBscZ3a4NFUH0K9CA8v0j7Bk2wRhcr5F5p8kS53ZK
   ErvIhz5TfCCvFTQaNjOwsMFcUskcWAQu1AK1QIyLfn8Kh0KXJis+9mkJx
   1Hx+85lGXK2dSSsKIftOTGgjTkT3CuqEESnox8wx141L+QXxRc0Xrkapm
   Hl7XdE+mNmJTUAffYveyWRt/GTTV+zFZn3ymGAHdEazj+eWajiC6Ns5AO
   20Hc+X/DnbRVlNgJdujFqz/a4ZHvfZ9oouhFupSY9/XOI5YwilJjgCwd9
   w==;
X-CSE-ConnectionGUID: JrSkbal7Sl6tafMTjsSmFw==
X-CSE-MsgGUID: yfMIjEXQSUGmWjib1Ks4oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68947821"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="68947821"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:50:22 -0800
X-CSE-ConnectionGUID: M8erVcacRdW4wA9uX6Thzg==
X-CSE-MsgGUID: 7I9vNk7TScyA8IMUnMGa7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="212789113"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2025 20:50:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPHm-0004t0-2j;
	Thu, 13 Nov 2025 04:50:18 +0000
Date: Thu, 13 Nov 2025 12:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 19/20] drivers/pinctrl/pinctrl-mpfs-mssio.c:300:23:
 error: implicit declaration of function 'pinctrl_generic_add_group'
Message-ID: <202511122104.jsRGqy61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   0f0b8ab0b2d5245d9b9f4d73a6d28421de5c8b7d
commit: 24262b12792e95c94625a991f3009abb9e3c349e [19/20] pinctrl: add polarfire soc mssio pinctrl driver
config: um-randconfig-001-20251112 (https://download.01.org/0day-ci/archive/20251112/202511122104.jsRGqy61-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511122104.jsRGqy61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511122104.jsRGqy61-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-mpfs-mssio.c: In function 'mpfs_pinctrl_dt_node_to_map':
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:300:23: error: implicit declaration of function 'pinctrl_generic_add_group' [-Wimplicit-function-declaration]
     300 |                 ret = pinctrl_generic_add_group(pctrl_dev, group_name, pins, npins, pinmuxs);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:320:15: error: implicit declaration of function 'pinmux_generic_add_function'; did you mean 'pinmux_generic_free_functions'? [-Wimplicit-function-declaration]
     320 |         ret = pinmux_generic_add_function(pctrl_dev, np->name, group_names, ngroups, NULL);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               pinmux_generic_free_functions
   drivers/pinctrl/pinctrl-mpfs-mssio.c: At top level:
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:333:29: error: 'pinctrl_generic_get_group_count' undeclared here (not in a function)
     333 |         .get_groups_count = pinctrl_generic_get_group_count,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:334:27: error: 'pinctrl_generic_get_group_name' undeclared here (not in a function)
     334 |         .get_group_name = pinctrl_generic_get_group_name,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:335:27: error: 'pinctrl_generic_get_group_pins' undeclared here (not in a function); did you mean 'pinctrl_get_group_pins'?
     335 |         .get_group_pins = pinctrl_generic_get_group_pins,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           pinctrl_get_group_pins
   drivers/pinctrl/pinctrl-mpfs-mssio.c: In function 'mpfs_pinctrl_set_mux':
   drivers/pinctrl/pinctrl-mpfs-mssio.c:369:17: error: implicit declaration of function 'pinctrl_generic_get_group' [-Wimplicit-function-declaration]
     369 |         group = pinctrl_generic_get_group(pctrl_dev, gsel);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:369:15: error: assignment to 'const struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     369 |         group = pinctrl_generic_get_group(pctrl_dev, gsel);
         |               ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:373:24: error: invalid use of undefined type 'const struct group_desc'
     373 |         configs = group->data;
         |                        ^~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:375:34: error: invalid use of undefined type 'const struct group_desc'
     375 |         for (int i = 0; i < group->grp.npins; i++)
         |                                  ^~
   drivers/pinctrl/pinctrl-mpfs-mssio.c: At top level:
   drivers/pinctrl/pinctrl-mpfs-mssio.c:381:35: error: 'pinmux_generic_get_function_count' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     381 |         .get_functions_count    = pinmux_generic_get_function_count,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   pinmux_generic_free_functions
   drivers/pinctrl/pinctrl-mpfs-mssio.c:382:35: error: 'pinmux_generic_get_function_name' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     382 |         .get_function_name      = pinmux_generic_get_function_name,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   pinmux_generic_free_functions
   drivers/pinctrl/pinctrl-mpfs-mssio.c:383:35: error: 'pinmux_generic_get_function_groups' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     383 |         .get_function_groups    = pinmux_generic_get_function_groups,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   pinmux_generic_free_functions
   drivers/pinctrl/pinctrl-mpfs-mssio.c: In function 'mpfs_pinctrl_pinconf_group_set':
   drivers/pinctrl/pinctrl-mpfs-mssio.c:644:15: error: assignment to 'const struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     644 |         group = pinctrl_generic_get_group(pctrl_dev, gsel);
         |               ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:652:20: error: invalid use of undefined type 'const struct group_desc'
     652 |         pin = group->grp.pins[0];
         |                    ^~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:658:34: error: invalid use of undefined type 'const struct group_desc'
     658 |         for (int i = 0; i < group->grp.npins; i++)
         |                                  ^~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:659:57: error: invalid use of undefined type 'const struct group_desc'
     659 |                 mpfs_pinctrl_pin_set_config(pctrl, group->grp.pins[i], val);
         |                                                         ^~


vim +/pinctrl_generic_add_group +300 drivers/pinctrl/pinctrl-mpfs-mssio.c

   223	
   224	static int mpfs_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev, struct device_node *np,
   225						 struct pinctrl_map **maps, unsigned int *num_maps)
   226	{
   227		struct mpfs_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
   228		struct device *dev = pctrl->dev;
   229		struct device_node *child;
   230		struct pinctrl_map *map;
   231		const char **group_names;
   232		const char *group_name;
   233		int ngroups = 0;
   234		int nmaps = 0;
   235		int ret;
   236	
   237		for_each_available_child_of_node(np, child)
   238			ngroups += 1;
   239	
   240		group_names = devm_kcalloc(dev, ngroups, sizeof(*group_names), GFP_KERNEL);
   241		if (!group_names)
   242			return -ENOMEM;
   243	
   244		map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
   245		if (!map)
   246			return -ENOMEM;
   247	
   248		ngroups = 0;
   249		guard(mutex)(&pctrl->mutex);
   250		for_each_available_child_of_node_scoped(np, child) {
   251			struct mpfs_pinctrl_mux_config *pinmuxs;
   252			const char *function_name;
   253			unsigned int pin, *pins;
   254			int function, npins;
   255	
   256			npins = of_property_count_u32_elems(child, "pins");
   257	
   258			if (npins < 1) {
   259				dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
   260					np, child, npins);
   261				return npins;
   262			}
   263	
   264			group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
   265						 np, child);
   266			if (!group_name)
   267				return -ENOMEM;
   268	
   269			group_names[ngroups++] = group_name;
   270	
   271			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
   272			if (!pins)
   273				return -ENOMEM;
   274	
   275			pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
   276			if (!pinmuxs)
   277				return -ENOMEM;
   278	
   279			for (int i = 0; i < npins; i++) {
   280				ret = of_property_read_u32_index(child, "pins", i, &pin);
   281				if (ret)
   282					return ret;
   283	
   284				pins[i] = pin;
   285				pinmuxs[i].pin = pin;
   286	
   287				ret = of_property_read_string(child, "function", &function_name);
   288				function = mpfs_pinctrl_function_map(function_name);
   289				if (function < 0)
   290					return dev_err_probe(dev, function, "invalid function %s\n",
   291							     function_name);
   292				pinmuxs[i].function = function;
   293			}
   294	
   295			map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
   296			map[nmaps].data.mux.function = np->name;
   297			map[nmaps].data.mux.group = group_name;
   298			nmaps += 1;
   299	
 > 300			ret = pinctrl_generic_add_group(pctrl_dev, group_name, pins, npins, pinmuxs);
   301			if (ret < 0)
   302				return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
   303						     group_name, ret);
   304	
   305			ret = pinconf_generic_parse_dt_config(child, pctrl_dev,
   306							      &map[nmaps].data.configs.configs,
   307							      &map[nmaps].data.configs.num_configs);
   308			if (ret)
   309				return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
   310					group_name);
   311	
   312			if (map[nmaps].data.configs.num_configs == 0)
   313				continue;
   314	
   315			map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
   316			map[nmaps].data.configs.group_or_pin = group_name;
   317			nmaps += 1;
   318		}
   319	
 > 320		ret = pinmux_generic_add_function(pctrl_dev, np->name, group_names, ngroups, NULL);
   321		if (ret < 0) {
   322			pinctrl_utils_free_map(pctrl_dev, map, nmaps);
   323			return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
   324		}
   325	
   326		*maps = map;
   327		*num_maps = nmaps;
   328	
   329		return 0;
   330	};
   331	
   332	static struct pinctrl_ops mpfs_pinctrl_ops = {
 > 333		.get_groups_count = pinctrl_generic_get_group_count,
 > 334		.get_group_name	= pinctrl_generic_get_group_name,
 > 335		.get_group_pins	= pinctrl_generic_get_group_pins,
   336		.pin_dbg_show = mpfs_pinctrl_dbg_show,
   337		.dt_node_to_map = mpfs_pinctrl_dt_node_to_map,
   338		.dt_free_map = pinctrl_utils_free_map,
   339	};
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
