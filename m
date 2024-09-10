Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B933338DD3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 05:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725945214; cv=none; b=TsCEha6NApaPOURCeOrI5IqbrwzjJGSsxtVHNDrSsbrmBt/kfFiED+xqIgCHUWtYuwlAkBXmtR0fS/LBnS+dFReAnRWH30oqpTpbv0aOB74LeWFDTCNHF6HbrPm1jjLo9NxDAOxLGHDDKsVJJarDgcJSkx0UmgXTH3ESWNZ0CG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725945214; c=relaxed/simple;
	bh=DrgGpy4mnmwHjZ8/6d60Kei+X8aeLq72Fr1HjCN8VVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4ABDQ4LtXSB7nPazOoRXJBLOs7EmgWFuMK4qvIwjknv5SbU9wTngvNdzOlQq0qurnEx70rfvq0OV41f/Khp89UL7npmkkIHMLWtRG39hVisfj2L3Gwr0jXYLh9xfGm/nKEvluk1qT9gb4DXaJMdjj6INx2/An438F2v3kovs5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VA8XyrWb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VA8XyrWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725945212; x=1757481212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DrgGpy4mnmwHjZ8/6d60Kei+X8aeLq72Fr1HjCN8VVc=;
  b=VA8XyrWbas6tZxBA8NU4W8iF0Mq/QLYsWgOIoJLINDfJWqafYlSdxAGz
   hpcnLybZTUwd1ctLVPBCGLcowhNkh/zaTkC4IRpHuv93+3xPV4hY4GGS4
   5nJQTm98gcXS146PUpaf5bZyY4LrWN4JHSL7QVkyZ3D4w3uoAB3duT0re
   naF5FPRmtKivhTMaS/71wFkyFPKKG3Oar7hF1xjuuF6q9Bu7XljpamjCp
   buinHQDnCzn2/VK6Eo+GVkfVV4r2P9XJZHgoeJCubWhxFbEKG2VG1dfZ6
   iwfM+poBD3U23X4Njr4qns4ydLrBA4kuewf7B1ux4/d75OaLAGmRkAUNe
   w==;
X-CSE-ConnectionGUID: RK3nJjg1SK69aQ5bxnsr3A==
X-CSE-MsgGUID: Sg2doU6oRgangfR0wLa5tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24814206"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24814206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 22:13:31 -0700
X-CSE-ConnectionGUID: ZMzgRAzNQUS5sfiyQ2nRyg==
X-CSE-MsgGUID: Yb0VKN2mRBy/15Te0IZMyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66924554"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2024 22:13:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sntBu-000062-1n;
	Tue, 10 Sep 2024 05:13:26 +0000
Date: Tue, 10 Sep 2024 13:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <202409101313.N8NhlsM1-lkp@intel.com>
References: <20240902-th1520-pinctrl-v1-2-639bf83ef50a@tenstorrent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-th1520-pinctrl-v1-2-639bf83ef50a@tenstorrent.com>

Hi Drew,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/dt-bindings-pinctrl-Add-thead-th1520-pinctrl-bindings/20240903-121111
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240902-th1520-pinctrl-v1-2-639bf83ef50a%40tenstorrent.com
patch subject: [PATCH 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
config: hexagon-randconfig-r111-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101313.N8NhlsM1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce: (https://download.01.org/0day-ci/archive/20240910/202409101313.N8NhlsM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101313.N8NhlsM1-lkp@intel.com/

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
>> drivers/pinctrl/pinctrl-th1520.c:461:9: error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     461 |                 ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
         |                       ^
   drivers/pinctrl/pinctrl-th1520.c:461:9: note: did you mean 'pinconf_generic_dump_config'?
   drivers/pinctrl/pinconf.h:117:6: note: 'pinconf_generic_dump_config' declared here
     117 | void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
         |      ^
   6 warnings and 1 error generated.


vim +/pinconf_generic_parse_dt_config +461 drivers/pinctrl/pinctrl-th1520.c

   417	
   418	static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
   419						 struct device_node *np,
   420						 struct pinctrl_map **maps,
   421						 unsigned int *num_maps)
   422	{
   423		struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
   424		struct device_node *child;
   425		struct pinctrl_map *map;
   426		unsigned long *configs;
   427		unsigned int nconfigs;
   428		unsigned int nmaps;
   429		int ret;
   430	
   431		nmaps = 0;
   432		for_each_available_child_of_node(np, child) {
   433			int npins = of_property_count_strings(child, "pins");
   434	
   435			if (npins <= 0) {
   436				of_node_put(child);
   437				dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
   438					np, child);
   439				return -EINVAL;
   440			}
   441			nmaps += npins;
   442			if (of_property_present(child, "function"))
   443				nmaps += npins;
   444		}
   445	
   446		map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
   447		if (!map)
   448			return -ENOMEM;
   449	
   450		nmaps = 0;
   451		mutex_lock(&thp->mutex);
   452		for_each_available_child_of_node(np, child) {
   453			unsigned int rollback = nmaps;
   454			enum th1520_muxtype muxtype;
   455			struct property *prop;
   456			const char *funcname;
   457			const char **pgnames;
   458			const char *pinname;
   459			int npins;
   460	
 > 461			ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
   462			if (ret) {
   463				dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
   464					np, child);
   465				goto put_child;
   466			}
   467	
   468			if (!of_property_read_string(child, "function", &funcname)) {
   469				muxtype = th1520_muxtype_get(funcname);
   470				if (!muxtype) {
   471					dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
   472						np, child, funcname);
   473					ret = -EINVAL;
   474					goto free_configs;
   475				}
   476	
   477				funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
   478							  np, child);
   479				if (!funcname) {
   480					ret = -ENOMEM;
   481					goto free_configs;
   482				}
   483	
   484				npins = of_property_count_strings(child, "pins");
   485				pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
   486				if (!pgnames) {
   487					ret = -ENOMEM;
   488					goto free_configs;
   489				}
   490			} else {
   491				funcname = NULL;
   492			}
   493	
   494			npins = 0;
   495			of_property_for_each_string(child, "pins", prop, pinname) {
   496				unsigned int i;
   497	
   498				for (i = 0; i < thp->desc.npins; i++) {
   499					if (!strcmp(pinname, thp->desc.pins[i].name))
   500						break;
   501				}
   502				if (i == thp->desc.npins) {
   503					nmaps = rollback;
   504					dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
   505						np, child, pinname);
   506					goto free_configs;
   507				}
   508	
   509				if (nconfigs) {
   510					map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
   511					map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
   512					map[nmaps].data.configs.configs = configs;
   513					map[nmaps].data.configs.num_configs = nconfigs;
   514					nmaps += 1;
   515				}
   516				if (funcname) {
   517					pgnames[npins++] = thp->desc.pins[i].name;
   518					map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
   519					map[nmaps].data.mux.function = funcname;
   520					map[nmaps].data.mux.group = thp->desc.pins[i].name;
   521					nmaps += 1;
   522				}
   523			}
   524	
   525			if (funcname) {
   526				ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
   527								  npins, (void *)muxtype);
   528				if (ret < 0) {
   529					dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
   530					goto put_child;
   531				}
   532			}
   533		}
   534	
   535		*maps = map;
   536		*num_maps = nmaps;
   537		mutex_unlock(&thp->mutex);
   538		return 0;
   539	
   540	free_configs:
   541		kfree(configs);
   542	put_child:
   543		of_node_put(child);
   544		th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
   545		mutex_unlock(&thp->mutex);
   546		return ret;
   547	}
   548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
