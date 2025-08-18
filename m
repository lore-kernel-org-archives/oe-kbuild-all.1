Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F7433C4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530248; cv=none; b=QL4FAxUuIbLOmaQqFBqlrlQ98YcavbHs189LF0b/jURpG5jm/YMvQzAtHzwtfA4GghPaOQsrr+AGsBxRiCeV7c9BKAME8v2gG2Ai2upaP4Z912Da5HwBNxhGLz0+rimPlHYeswg/3aohklTBoYuiKMEvrv0cjYtTItXc5FxBQD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530248; c=relaxed/simple;
	bh=Z5HeTwwaCKqoTLgOzH8s2TLVsGOCDzGCDZQzXmcjgmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YT+0LoYDlj6EgPhOoxmXfaAQC1DqmXLd+xNKtVXkx/RT9oIq4UaBZXDNjIV2UyaYYDIPqjcylZb4bVxOuQm+af2gIXhcI19qboTl7RpJuKgsI0abCSn1rBlFJaFvYV7GwX+zxvQEXzA9N8vnOkv1hrDb6KptGfXNvh2uGR6EWBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYRTBnvl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYRTBnvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755530247; x=1787066247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5HeTwwaCKqoTLgOzH8s2TLVsGOCDzGCDZQzXmcjgmI=;
  b=bYRTBnvlLmerkeGsE9O0nQyfxzhm53p5Ws2Dy4AnCJRTrO+D7lS+r9B2
   jg6FnBBi+94bRMDL8VGRYITgSSwX/R8hKRHqkl3MtxVt0N0ynWJuk+TBE
   mk7Z4KMd1C+wQ8GBFEzGh4pGaR0sBi/Y/XgnZcoDBeZ+0vhbzdqpKpAjZ
   RYNkH0ce3nuYOOYVYaKQ4cxIhYrmjCTxzgeUlJYT0tqUjD/9RxYIZIj22
   hByLBckrtgiWRzUdG1LmVapAPZCMgyk8caVb5l1FCepS7Iw5Q5Efrw7E3
   l25ky/S91vDoq3E7Q3aG9TW5P60eyqN2BvmBV4tk/zEVfjsyiQDDG+BM/
   g==;
X-CSE-ConnectionGUID: 0h4e1LvyQnOLi1iZJuAyow==
X-CSE-MsgGUID: ppfa7tlzSNSHgrM3OXMBCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69205470"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69205470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 08:17:26 -0700
X-CSE-ConnectionGUID: XUXilUEqT9qpCkdf+WztTA==
X-CSE-MsgGUID: J2BmJs/7RaG9UWrCi/msOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167219210"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2025 08:17:24 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo1bu-00016d-2X;
	Mon, 18 Aug 2025 15:17:22 +0000
Date: Mon, 18 Aug 2025 17:16:24 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] arch/x86/kernel/early-quirks.c:727:34:
 warning: no previous prototype for function 'kh40000_get_direct_dma_ops'
Message-ID: <202508181705.DNNoRr4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [2687/2687] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-buildonly-randconfig-2004-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181705.DNNoRr4o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181705.DNNoRr4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181705.DNNoRr4o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/early-quirks.c:13:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for function 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^
   arch/x86/kernel/early-quirks.c:722:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     722 | bool is_zhaoxin_kh40000(void)
         | ^
         | static 
>> arch/x86/kernel/early-quirks.c:727:34: warning: no previous prototype for function 'kh40000_get_direct_dma_ops' [-Wmissing-prototypes]
     727 | __weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
         |                                  ^
   arch/x86/kernel/early-quirks.c:727:14: note: declare 'static' if the function is not intended to be used outside of this translation unit
     727 | __weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
         |              ^
         |              static 
   3 warnings generated.


vim +/kh40000_get_direct_dma_ops +727 arch/x86/kernel/early-quirks.c

   726	
 > 727	__weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
   728	{
   729		return dma_ops;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
