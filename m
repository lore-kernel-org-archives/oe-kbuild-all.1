Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EAB1B393C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735897846; cv=none; b=bl9iQiRgBaEwHXjstrCFKXQqJJrI/qbXfmYDg1g4xdmPZfk+sd4Dt7Yg8FMdamgtkfmtsndkyJFE71Qq69+FCDb4ogxqvg5klAck2X8fzrsuAcv8pMqRuc4a24OhT0jhsZhvWB8v7+AyD0kPqvBYoAYrI0ptS5ahXxJGZU+Z/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735897846; c=relaxed/simple;
	bh=iBuGK6GiGFs97pmazNPaJhsJf5uyQnmQA+/y40c+bcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XWoiAHew9zS7UosoSTl1QEN271xrDHQFy/NfLLYhfe4dvteaj3zKG3LAWL+sLoH00h/tdhjkJePo8GdSjyghMDnFvQ57lIxd4n+rpK4h9QLuxtMCbXi0hl3MFWf452jrqTohGNUlfXcfAB1Zo/xLs0EYZBCjcWYgmzjkzGmtOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpnGU9SX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpnGU9SX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735897845; x=1767433845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iBuGK6GiGFs97pmazNPaJhsJf5uyQnmQA+/y40c+bcQ=;
  b=CpnGU9SXf53Tv3KAFfhfkP2vdXWwvc7byPfAnRYU51DYTH6TpsQ4S4gy
   U3ET7my2lIELL3zmvVskhXihAaedwKqGkrZdNNmxCnUmrx4YSON6PqD8g
   P6v+bve7opSOSyCYQFbjvT8IQThpcm4fNuCbOntGuT8JHAlAcnzN86phX
   2aV3vEfLxeXsf4341GHhomOd7CkoDjl0fq/Zd0/zeT99fx0zhB+wTMxdr
   EjLC9hHaaCaifWfbNFEvbbU7p9oOUPzUsQePHdOiiFivoFrjIjGolwwb8
   KpQW18phuruhL37Lsw/QD0CFPqXztExvmMwvP1LlArTs9+Xzaj/BdqIoB
   g==;
X-CSE-ConnectionGUID: b37+++PdRAOauqsxoahtMQ==
X-CSE-MsgGUID: M9SODRnIQvC0mFcHiUWVHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36259934"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36259934"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 01:50:45 -0800
X-CSE-ConnectionGUID: i4MCMfZ2RbycecxW7hSo3g==
X-CSE-MsgGUID: TPjn/D3eSpeyceziuY/QtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106384577"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jan 2025 01:50:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTeKG-0009XP-1o;
	Fri, 03 Jan 2025 09:50:40 +0000
Date: Fri, 3 Jan 2025 17:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: sound/soc/codecs/rt5514-spi.c:496:34: warning: 'rt5514_of_match'
 defined but not used
Message-ID: <202501031724.GqTW66FA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk framework to be selectable
date:   4 years, 8 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250103/202501031724.GqTW66FA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031724.GqTW66FA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031724.GqTW66FA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:95,
                    from include/linux/scatterlist.h:8,
                    from include/linux/spi/spi.h:14,
                    from sound/soc/codecs/rt5514-spi.c:11:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:96:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      96 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_pte_at'
     322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:202:9: note: in expansion of macro 'pte_clear'
     202 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:96:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      96 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:641:9: note: in expansion of macro 'set_pte_at'
     641 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   sound/soc/codecs/rt5514-spi.c: At top level:
>> sound/soc/codecs/rt5514-spi.c:496:34: warning: 'rt5514_of_match' defined but not used [-Wunused-const-variable=]
     496 | static const struct of_device_id rt5514_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/rt5514_of_match +496 sound/soc/codecs/rt5514-spi.c

58f1c07d23cddb oder_chiou@realtek.com 2017-11-08  495  
6eebf35b0e4a02 Oder Chiou             2016-06-06 @496  static const struct of_device_id rt5514_of_match[] = {
6eebf35b0e4a02 Oder Chiou             2016-06-06  497  	{ .compatible = "realtek,rt5514", },
6eebf35b0e4a02 Oder Chiou             2016-06-06  498  	{},
6eebf35b0e4a02 Oder Chiou             2016-06-06  499  };
6eebf35b0e4a02 Oder Chiou             2016-06-06  500  MODULE_DEVICE_TABLE(of, rt5514_of_match);
6eebf35b0e4a02 Oder Chiou             2016-06-06  501  

:::::: The code at line 496 was first introduced by commit
:::::: 6eebf35b0e4a02248f7dba5d1719c6896afe41ba ASoC: rt5514: add rt5514 SPI driver

:::::: TO: Oder Chiou <oder_chiou@realtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
