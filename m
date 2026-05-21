Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D293955E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345089; cv=none; b=sKGeICqgply38jCdxCMqUfqV2ztwVz7Prhg7uIw/SpZnvtCOm+kjEXM1GaB0h6Mme+FfAckjqrFZd8MyPq8bTx0tPVB7ztbE7LLsk88+F07pVvuyqJBiahr2ZpZRIErziwPAyheZv1QGKFMNA5vvsgSpd+3n4a0F3YfuaCnwQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345089; c=relaxed/simple;
	bh=R7Q1Hq0rU9GdP2qfT3DR9ZMS7bVryLd+iEtplBDSecU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iB9YSTvV7HZ5OhtzaQR1whJf8qydw8eb9Ka6aI9VghdUh30lIRZBSc++y7z46aQ8geSs2ZPOsK+o6TmhRDhmRMj5oCtDkhjVW+ssTTlIxwUdJDYn48U8M0TvRUs8iEQPScPAVq8WXcZ2eNobYHdAfcHfZjTPrWQWwSMzbljHLFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4cxQ/F4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4cxQ/F4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779345087; x=1810881087;
  h=date:from:to:cc:subject:message-id;
  bh=R7Q1Hq0rU9GdP2qfT3DR9ZMS7bVryLd+iEtplBDSecU=;
  b=L4cxQ/F4ToFkgnYHHqICmHom3ZVS0v81DpSPjR+6C5yzjt7L9ORPY+p6
   nEDAf78QOisZzcyjhDZ7L/hbDZIuYeHGNf5QUPjp45MsAD+xkyvet2/NU
   QnHOKa3DSqd0aNlP6Kyke2liTqTmM1ibV2Ez0tGfQ2iaZppQzjLqxdM/W
   Gkm6/i1KW6SaEnQJJqSo+hS5aBkr9uNSrUAoyQOSmim1tZ5MxNR9GaErb
   YfO8FG9WWZVJCOsvIxfq092kembYw2319Vr8GzTb1n0WaxZ+LWqPZjIPh
   HKiWkLZ3bz/KHdDS6YgqFshDy9cctovO2VDuLaIZcEjitHhhDNrkje3Dz
   A==;
X-CSE-ConnectionGUID: tL1xXWlsS1+FoVX9Ds3aHg==
X-CSE-MsgGUID: 5OBkSbsETK2JR71cJFLfPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91365384"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91365384"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 23:31:26 -0700
X-CSE-ConnectionGUID: 8OvTZbYLSv6mPt1de+bFPg==
X-CSE-MsgGUID: RyPIhwGlQzm/zfHxjEBjuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="239432827"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2026 23:31:25 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPwvG-000000004Wf-1F3w;
	Thu, 21 May 2026 06:30:33 +0000
Date: Thu, 21 May 2026 14:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1041/1130]
 arch/riscv/mm/init.c:1179:15: warning: unused variable 'base'
Message-ID: <202605211409.Xhdo8tUs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 48f331391ec79fde4f8d61b0c39124cd52c089a4 [1041/1130] cheri: compat64: Prepare binfmt code for compat64 support
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211409.Xhdo8tUs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211409.Xhdo8tUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211409.Xhdo8tUs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/mm/init.c: In function 'pt_ops_set_fixmap':
>> arch/riscv/mm/init.c:1179:15: warning: unused variable 'base' [-Wunused-variable]
    1179 |         void *base = NULL;
         |               ^~~~


vim +/base +1179 arch/riscv/mm/init.c

840125a97abc7e67 Alexandre Ghiti       2021-12-06  1167  
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1168  /*
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1169   * MMU is enabled but page table setup is not complete yet.
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1170   * fixmap page table alloc functions must be used as a means to temporarily
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1171   * map the allocated physical pages since the linear mapping does not exist yet.
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1172   *
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1173   * Note that this is called with MMU disabled, hence kernel_mapping_pa_to_va,
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1174   * but it will be used as described above.
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1175   */
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1176  static void __init __PI pt_ops_set_fixmap(void)
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1177  {
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1178  	/* FIXCHERI: split is wrong for 32-bit. */
d457e20dfb187dfb Christian Ehrhardt    2024-09-19 @1179  	void *base = NULL;
48f331391ec79fde Christian A. Ehrhardt 2025-11-18  1180  #ifdef CONFIG_CHERI_KERNEL
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1181  	ptraddr_t split = 1ULL << 63;
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1182  	base = cheri_address_set(kernel_data_cap, split);
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1183  	base = cheri_bounds_set(base, split);
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1184  	base = cheri_perms_and(base, CHERI_PERMS_READ | CHERI_PERMS_EXEC);
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1185  #endif
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1186  
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1187  	pt_ops.alloc_pte = (void *)cheri_address_set(base, __c_pa(kernel_mapping_pa_to_va(alloc_pte_fixmap)));
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1188  	pt_ops.get_pte_virt = (void *)cheri_address_set(base, __c_pa(kernel_mapping_pa_to_va(get_pte_virt_fixmap)));
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1189  #ifndef __PAGETABLE_PMD_FOLDED
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1190  	pt_ops.alloc_pmd = (void *)cheri_address_set(base, __c_pa(kernel_mapping_pa_to_va(alloc_pmd_fixmap)));
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1191  	pt_ops.get_pmd_virt = (void *)cheri_address_set(base, __c_pa(kernel_mapping_pa_to_va(get_pmd_virt_fixmap)));
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1192  	pt_ops.alloc_pud = (void *)cheri_address_set(base, __c_pa(kernel_mapping_pa_to_va(alloc_pud_fixmap)));
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1193  	pt_ops.get_pud_virt = (void *)cheri_address_set(base, __c_pa(kernel_mapping_pa_to_va(get_pud_virt_fixmap)));
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1194  	pt_ops.alloc_p4d = (void *)cheri_address_set(base, __c_pa(kernel_mapping_pa_to_va(alloc_p4d_fixmap)));
d457e20dfb187dfb Christian Ehrhardt    2024-09-19  1195  	pt_ops.get_p4d_virt = (void *)cheri_address_set(base, __c_pa(kernel_mapping_pa_to_va(get_p4d_virt_fixmap)));
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1196  #endif
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1197  }
840125a97abc7e67 Alexandre Ghiti       2021-12-06  1198  

:::::: The code at line 1179 was first introduced by commit
:::::: d457e20dfb187dfb7a8ee4284afbf7c57c182686 riscv: cheri: Adapt memory init code to CHERI

:::::: TO: Christian Ehrhardt <christian.ehrhardt@codasip.com>
:::::: CC: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
