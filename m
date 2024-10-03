Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E994C3E499
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727941163; cv=none; b=HsxozfEL+jzFYPTftZNwRs65CSwt94vEWmowzOc0HN5PdArOw42Ceqnj238ZQHiwdj6j3+nGz9nj770e4lI4sleySjOC3xQVFbPly3Bt1ZgJtJohgbrJmETY5QETNqIpLp88zTW44MSw6KyXQGDYQiZnQDhho0QoyV8DuCOLRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727941163; c=relaxed/simple;
	bh=FubueRdmKAiqnE+c51kGuNWx9ds5hxLKTHiCG30IzIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EiBLzurDfTvUR0eHDSomHCRVWfsOTVWzfQMmm7IhkZsElCCwlMtGPgLrTsZwD5dbtGR0m9VB+CIgBCqUjqxz/9szD4w+lirqx5OjYMF+8BmhkxIRbku1CtFz3Jb7EUulmfCYRhHvRu7/3NmPRNMailwvl30F3yiBMpP1ldOh6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n02OiQQi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n02OiQQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727941162; x=1759477162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FubueRdmKAiqnE+c51kGuNWx9ds5hxLKTHiCG30IzIg=;
  b=n02OiQQil2Myc4QLiQp9aOiWwJ9koC0EKv4sT0dznqGWKFm/ube8bpqe
   W/RwFbp8fV/5c+YOn7Z813UkignHdIYgkROFfow79ucRjAd6onZd2jduB
   tUVqli6xjQuVQ16Ng8mj7yCWHKiXH2dbN455mlKlAg520jSp0tH9MwWNq
   icrY8mzzUzhWoDYrEl0YDlYRiJDVWhjbqRXAKlZZ4X/HcFYls7znp3QLV
   1ZLTwCgRX/hbW3pSVKPnwl1natwBb520/l06b6MTfoJCBCB9hgcBbMbCM
   fQ9QvscJS8K4abyyqnmoh2SWcoY1tDezKE0usMZWF7czeVO+bHTFbgeG1
   w==;
X-CSE-ConnectionGUID: c9v2782lRdms7KbRvFRT6A==
X-CSE-MsgGUID: Zcp+5wmoQKCzd4RYuP/iMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30918003"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="30918003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 00:39:22 -0700
X-CSE-ConnectionGUID: gRJiuRmJTeqDXn4nrhZ85A==
X-CSE-MsgGUID: wHxNTnTwT5KkK2XFPkTjxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74289261"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Oct 2024 00:39:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swGQf-0000AM-1s;
	Thu, 03 Oct 2024 07:39:17 +0000
Date: Thu, 3 Oct 2024 15:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: [linux-next:master 1524/2170]
 drivers/pinctrl/pinctrl-th1520.c:457:23: error: implicit declaration of
 function 'pinconf_generic_parse_dt_config'; did you mean
 'pinconf_generic_dump_config'?
Message-ID: <202410031519.M0tZ9Uwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c02d24a5af66a9806922391493205a344749f2c4
commit: bed5cd6f8a988389e987bcf5c1762ab7c53be317 [1524/2170] pinctrl: Add driver for the T-Head TH1520 SoC
config: m68k-randconfig-r112-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031519.M0tZ9Uwy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241003/202410031519.M0tZ9Uwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031519.M0tZ9Uwy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_map':
>> drivers/pinctrl/pinctrl-th1520.c:457:23: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Wimplicit-function-declaration]
     457 |                 ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       pinconf_generic_dump_config


vim +457 drivers/pinctrl/pinctrl-th1520.c

   413	
   414	static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
   415						 struct device_node *np,
   416						 struct pinctrl_map **maps,
   417						 unsigned int *num_maps)
   418	{
   419		struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
   420		struct device_node *child;
   421		struct pinctrl_map *map;
   422		unsigned long *configs;
   423		unsigned int nconfigs;
   424		unsigned int nmaps;
   425		int ret;
   426	
   427		nmaps = 0;
   428		for_each_available_child_of_node(np, child) {
   429			int npins = of_property_count_strings(child, "pins");
   430	
   431			if (npins <= 0) {
   432				of_node_put(child);
   433				dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
   434					np, child);
   435				return -EINVAL;
   436			}
   437			nmaps += npins;
   438			if (of_property_present(child, "function"))
   439				nmaps += npins;
   440		}
   441	
   442		map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
   443		if (!map)
   444			return -ENOMEM;
   445	
   446		nmaps = 0;
   447		mutex_lock(&thp->mutex);
   448		for_each_available_child_of_node(np, child) {
   449			unsigned int rollback = nmaps;
   450			enum th1520_muxtype muxtype;
   451			struct property *prop;
   452			const char *funcname;
   453			const char **pgnames;
   454			const char *pinname;
   455			int npins;
   456	
 > 457			ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
   458			if (ret) {
   459				dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
   460					np, child);
   461				goto put_child;
   462			}
   463	
   464			if (!of_property_read_string(child, "function", &funcname)) {
   465				muxtype = th1520_muxtype_get(funcname);
   466				if (!muxtype) {
   467					dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
   468						np, child, funcname);
   469					ret = -EINVAL;
   470					goto free_configs;
   471				}
   472	
   473				funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
   474							  np, child);
   475				if (!funcname) {
   476					ret = -ENOMEM;
   477					goto free_configs;
   478				}
   479	
   480				npins = of_property_count_strings(child, "pins");
   481				pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
   482				if (!pgnames) {
   483					ret = -ENOMEM;
   484					goto free_configs;
   485				}
   486			} else {
   487				funcname = NULL;
   488			}
   489	
   490			npins = 0;
   491			of_property_for_each_string(child, "pins", prop, pinname) {
   492				unsigned int i;
   493	
   494				for (i = 0; i < thp->desc.npins; i++) {
   495					if (!strcmp(pinname, thp->desc.pins[i].name))
   496						break;
   497				}
   498				if (i == thp->desc.npins) {
   499					nmaps = rollback;
   500					dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
   501						np, child, pinname);
   502					goto free_configs;
   503				}
   504	
   505				if (nconfigs) {
   506					map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
   507					map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
   508					map[nmaps].data.configs.configs = configs;
   509					map[nmaps].data.configs.num_configs = nconfigs;
   510					nmaps += 1;
   511				}
   512				if (funcname) {
   513					pgnames[npins++] = thp->desc.pins[i].name;
   514					map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
   515					map[nmaps].data.mux.function = funcname;
   516					map[nmaps].data.mux.group = thp->desc.pins[i].name;
   517					nmaps += 1;
   518				}
   519			}
   520	
   521			if (funcname) {
   522				ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
   523								  npins, (void *)muxtype);
   524				if (ret < 0) {
   525					dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
   526					goto put_child;
   527				}
   528			}
   529		}
   530	
   531		*maps = map;
   532		*num_maps = nmaps;
   533		mutex_unlock(&thp->mutex);
   534		return 0;
   535	
   536	free_configs:
   537		kfree(configs);
   538	put_child:
   539		of_node_put(child);
   540		th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
   541		mutex_unlock(&thp->mutex);
   542		return ret;
   543	}
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
