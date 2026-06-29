Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866973B1B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 05:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782712362; cv=none; b=LMHf8c3Ag4+bL5gAGXYJrrazpgDEKN8GWGAxJKyYC8JO13UMMH/xHXYvdL0ltqwPdRXxbjzEiPBeVEUxRowhytlbuQsF5/MG13I1pvIq9Y/BF4jCF9FLhWuqgTmHMaWQJqbbCnlG63eA+pp5krTx75jw23ZE3iXz04RKmaEwOG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782712362; c=relaxed/simple;
	bh=RUPYwElSsxpBBUGohXFnfhwN23Vlr6N5zjR3aFLkQmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pIJ9hsGandokQKnmJDWRJDCuXA3CbQc0JHZZZ+rml/0T/j42ty4FEjXv5B7RKB6aHA3QW6303SFRbDdoGksQ5b6wDWqgxb3elz/94NVCFd7oM9qmwrrL3F9FvjGslQnaTQyqzsZppVBn3EPQs8tzJ9jHahVEKLR6E+GdgWNdias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXiiVAyO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXiiVAyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782712361; x=1814248361;
  h=date:from:to:cc:subject:message-id;
  bh=RUPYwElSsxpBBUGohXFnfhwN23Vlr6N5zjR3aFLkQmg=;
  b=LXiiVAyOif5nLQZYko0PrjFWAwcG3Ebq799JY23U9v12NLMgF/08zgfF
   VS149wiNX0Krdj5upOFh5LCMClzvUMoJxh5bWxBE++KFVZGW3fbAwdh6A
   F8M3RQnJpOpRjE5gjjHtj5XfGxoPPTNUFVxay4dn+Uz+uGANNjqlXKqfe
   0MphRF6Qo109ZSowUD9cKOuK4DbwR6349aDTieyMOMCMc88b851VK1kXk
   Jl7EjOOR/gQB+T8L7qp2gGfp7rgRtqWf/Pxa9eBOFxO9SiOEZyUvKgfCp
   ODf0Pr71mFoDCpmnwfJctJC9oHbVeUq+FMLQ0YO0HTHDpSagmO861LhRs
   Q==;
X-CSE-ConnectionGUID: v6KWm0qrQMq8l9jLM1fUdw==
X-CSE-MsgGUID: Thx8V5cxR72/Rcb1cZdntQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="93744188"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="93744188"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 22:52:40 -0700
X-CSE-ConnectionGUID: Zo+OG3qAT1iZqKnW24psjA==
X-CSE-MsgGUID: hCcbZ/88R4+SH+elEkLH1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="255820609"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Jun 2026 22:52:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we4v6-00000000735-1UkR;
	Mon, 29 Jun 2026 05:52:36 +0000
Date: Mon, 29 Jun 2026 13:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-main 166/166]
 include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier'
 defined but not used
Message-ID: <202606291356.YmL2vpUv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-main
head:   6e50e153eb2b19f7ccc5aad3545bee4a7b6faea0
commit: 7e58cf54169b7bb649742efbbf4a76f2185f07db [166/166] net: ethernet: mediatek: mtkmux: harden mux/phylink lifecycle
config: sh-randconfig-002-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291356.YmL2vpUv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291356.YmL2vpUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291356.YmL2vpUv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   include/linux/pcs/pcs.h:107:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
     107 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      95 | static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pcs/pcs.h:90:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      90 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:8103: Error: offset to unaligned destination
   {standard input}:9134: Error: offset to unaligned destination

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +/unregister_fwnode_pcs_notifier +95 include/linux/pcs/pcs.h

    94	
  > 95	static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
    96	{
    97		return -EOPNOTSUPP;
    98	}
    99	
   100	static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
   101							 int index)
   102	{
   103		return ERR_PTR(-ENOENT);
   104	}
   105	
   106	static struct phylink_pcs *
 > 107	fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
   108					   struct fwnode_handle *pcs_fwnode)
   109	{
   110		return ERR_PTR(-ENOENT);
   111	}
   112	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
