Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A625680
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727619395; cv=none; b=Bmf/rl7gMxzSymBw+GXWTnTMLdk1FO91Og2f2n+SS2kitpforiNvSkMs4KgxA/46ER8cF6qTFG7vKLKZdAxr1t5focP17jFDe95WrGmp2UBP4s+TAaVnG5csA6r5PQ0/wF8618j3X69kg7xktohJHC21ZqqQlzcWJmn43JmUOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727619395; c=relaxed/simple;
	bh=UJekgKfbDstuDK3ruUIVocLxdDow5IPtCNom1K0bHtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sek56hjuBPdsUYn5Us4D+MD3X+bX3wifTE3c3pY5TIzmNETDyhtJi0jGqvEpd1bJvtFiYTG2azASDFJ1upUOVF7InWqr+fjENqgm5I1CecxSBuvJIfFjNOKJulg+7RnFlTvaEGw07dNRYM9a8yDdrnaBWEnoMTAcABzkK5LjHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHsdUlBQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHsdUlBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727619393; x=1759155393;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UJekgKfbDstuDK3ruUIVocLxdDow5IPtCNom1K0bHtE=;
  b=hHsdUlBQ1cpP4XXIXkVu4k0h19zcYuyT+HrH+HzJ7STrgp8SbuyU12Ug
   cPX+Xx/0CpZd57Q73kZgRbPpQNxnI+lDNg2d0/u6qZ0Ri+30Eo7nkZSQj
   o1vBa3Wlx81TqzMCaGlpwcsFnCPjzez7W/iskZPR9/kleOkT//sCOq6eu
   0uyJyYKYU1sSX7KLOHxDJ/kFd15A3jT/YSL6SHYdMlAnRTeWHsbx7i4Jp
   +5zCT9yW6b4/Mdo1lXUadyhwXapIoBqxM0Px2DVeNYLv1569x5nBHdSzT
   9QMGCYL07upKo80xmPBsqSVQWw1VqKYzx+1lYieREcmoUA/2s1muSH71F
   w==;
X-CSE-ConnectionGUID: 8fZuBASqTUaP/aYRCsdB/Q==
X-CSE-MsgGUID: YBYrLzwiTV6BnbebrxytEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="44231297"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="44231297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 07:16:32 -0700
X-CSE-ConnectionGUID: MowzJNgETgmKylsOGLXudg==
X-CSE-MsgGUID: etEhEa1nRc6XUljHjh8ZYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="96361715"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2024 07:16:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suuiq-000OL7-2s;
	Sun, 29 Sep 2024 14:16:28 +0000
Date: Sun, 29 Sep 2024 22:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3730/16788]
 drivers/spi/spi-nxp-fspi.c:1398:12: error: use of undeclared identifier
 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202409292240.jEZS4yl1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: d75346f7d4e000543bb01cb5d719277629167d0f [3730/16788] spi: spi-nxp-fspi: enable runtime pm for fspi
config: arm-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409292240.jEZS4yl1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292240.jEZS4yl1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292240.jEZS4yl1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-nxp-fspi.c:59:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/spi/spi-nxp-fspi.c:1398:12: error: use of undeclared identifier 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
    1398 |                 .pm =   &nxp_fspi_pm_ops,
         |                          ^~~~~~~~~~~~~~~
         |                          nxp_fspi_mem_ops
   drivers/spi/spi-nxp-fspi.c:1148:44: note: 'nxp_fspi_mem_ops' declared here
    1148 | static const struct spi_controller_mem_ops nxp_fspi_mem_ops = {
         |                                            ^
>> drivers/spi/spi-nxp-fspi.c:1398:11: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'const struct spi_controller_mem_ops *' [-Werror,-Wincompatible-pointer-types]
    1398 |                 .pm =   &nxp_fspi_pm_ops,
         |                         ^~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +1398 drivers/spi/spi-nxp-fspi.c

55ab8487e01d18 kuldip dwivedi      2020-09-11  1392  
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1393  static struct platform_driver nxp_fspi_driver = {
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1394  	.driver = {
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1395  		.name	= "nxp-fspi",
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1396  		.of_match_table = nxp_fspi_dt_ids,
55ab8487e01d18 kuldip dwivedi      2020-09-11  1397  		.acpi_match_table = ACPI_PTR(nxp_fspi_acpi_ids),
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15 @1398  		.pm =   &nxp_fspi_pm_ops,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1399  	},
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1400  	.probe          = nxp_fspi_probe,
2dd82e32c20b57 Uwe Kleine-König    2023-03-03  1401  	.remove_new	= nxp_fspi_remove,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1402  };
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1403  module_platform_driver(nxp_fspi_driver);
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1404  

:::::: The code at line 1398 was first introduced by commit
:::::: a5356aef6a907c2e2aed0caaa2b88b6021394471 spi: spi-mem: Add driver for NXP FlexSPI controller

:::::: TO: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
