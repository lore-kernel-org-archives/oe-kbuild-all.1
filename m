Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ABA1BD9E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731490133; cv=none; b=foZY0A17MY2EaxmZAO+x2E47ULwclZ8UlhXi6HruvDdKD3mLcpzKNmESWn+3Reem7iiAvyvC/80r2cH3x7s1REbO+6R1NpLgv0dA1qApLl4Own4wzujbobwktU5J4B7vOYjPLi+MmX3FbozrW+BbohpjKYEU5UDgnVjv7YTGumo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731490133; c=relaxed/simple;
	bh=WvewV6NQfc75vQJGSzRQMdl24PUh+BJCxUzCHnraLc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHpv0Eo4bTMJlsZ1zQSsjXiBgYz/7fELSe5vtptyCV9NFdq1i/KqZQXuORPq7YLXEDqBjh0uS8f9yVguiePSCSxmFqz4m6RUTzFe5ZObTCsd+PWqqEVfij8TryWRwAnQNtcR+U0y/a/zlz8YnUXl5+qJeUFsMvCbc31HI9fdUWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTcMGISF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTcMGISF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731490131; x=1763026131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvewV6NQfc75vQJGSzRQMdl24PUh+BJCxUzCHnraLc8=;
  b=NTcMGISFdOcjXw5sTkVcrwqFrSw8bCi5GuCGRbRYwPCUMHg0r7IU6CEG
   t0g3K5HgHwCEoz4C9HGtC26Y/YjFK9fmzIE6jb2lUuqJX8umXWsJYFWa1
   GoYyjztTxVbCizpWE4PVpp0EXmF01Nc39t+cMoVg+jcgUc1l9QBu7EpMi
   B+iNWd084+I4I4AWupSHQxj9ZDw7qs0XDkermu1cXeF/QqlVTJpkplCts
   5odbwjtwVqmbFdd6xrgpdssr4U5muoQfu9yaH/uBpqpMRa+Wz6vCJoBPd
   Wanl23q5db9BNqPbsQsXa7GmzP4D5k+vH8fpV0C2xsg/rtnU+Eimarpo/
   w==;
X-CSE-ConnectionGUID: c791m438TmuZ6S6VKIbBZw==
X-CSE-MsgGUID: CH41ewbzQDeedOYT0ewt9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30772343"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="30772343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 01:28:50 -0800
X-CSE-ConnectionGUID: bskk5mhlQKGYh5FsWrrPBw==
X-CSE-MsgGUID: 0bWa0AiNQu27BaLcBMvtFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="91858843"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2024 01:28:48 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB9g6-0000C1-2h;
	Wed, 13 Nov 2024 09:28:46 +0000
Date: Wed, 13 Nov 2024 17:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, Drew Fustini <dfustini@tenstorrent.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [esmil:th1520 2/48] drivers/pinctrl/pinctrl-th1520.c:457:9: error:
 call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202411131732.BNe0iugn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: a731cec45ec032408be9a21ab8e1ecc5a1f33ce1 [2/48] pinctrl: Add driver for the T-Head TH1520 SoC
config: hexagon-randconfig-r053-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131732.BNe0iugn-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131732.BNe0iugn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131732.BNe0iugn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/pinctrl-th1520.c:13:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pinctrl/pinctrl-th1520.c:13:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pinctrl/pinctrl-th1520.c:13:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/pinctrl/pinctrl-th1520.c:457:9: error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     457 |                 ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
         |                       ^
   drivers/pinctrl/pinctrl-th1520.c:457:9: note: did you mean 'pinconf_generic_dump_config'?
   drivers/pinctrl/pinconf.h:117:6: note: 'pinconf_generic_dump_config' declared here
     117 | void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
         |      ^
   6 warnings and 1 error generated.


vim +/pinconf_generic_parse_dt_config +457 drivers/pinctrl/pinctrl-th1520.c

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
