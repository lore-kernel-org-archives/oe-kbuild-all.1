Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D9B2F4321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 04:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749701593; cv=none; b=oxzIa26yc/PJJxyUlviD9a2v+nS86WfdHKtbUAJ0D4QZcjYVRC3lAbV+JsGHttiiGXurt/JCY2U4HRUhPsHEIQLLTNkWgHBzSHrMKrz7DTmNchaf2M0IAD94BnNIpBKTrzWpvqRPi0nVGNV9OP5sz7Y9NcoVGMhtGnPD2pEJkfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749701593; c=relaxed/simple;
	bh=Gum3wHNb4cwolonSErnzQydPWTVX278YkBBP393GskQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R2GITd+3dV5aUdF5AyStV1A2WJEWojxGeL3jG5PnqdwfEV59QQinKR63XhN7BQeLE45Hiw1V5/SS02+4IWJ8xhMZxNS3Tqn4IqMv+oSFE0fy3pHFknQHHhmBg6Kg/k/sC33UZksngAwPcwepKUNlNsMNH4JVKofqSJVkBurA1vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1PGhg6z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1PGhg6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749701592; x=1781237592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gum3wHNb4cwolonSErnzQydPWTVX278YkBBP393GskQ=;
  b=H1PGhg6zm97GJ4et6QSZ99FBXjippGnHsj8Kn5F5YVk4Vi6kBIAKf4ke
   tuoLmnQ6PMNxBcgPENC12f88+WjI3Vb3i430xMCh1PBDUlSNM1fpRrjps
   GPbyJycA8ISjITm/Qp2Z3HaZGrlJm7ARSIEIqGVhIFmqyBewYPylwWOUm
   R5y1m6OrVDlDw1s7R4w3TlD9Y70ImiTIrIUlpNemZJIXqqYc5eppWpjQY
   DLylRMOdkSIdn6SZJmrkZ2QGxzIIzqIeKuPVmktpP/RoHXLxTKPvb/r/r
   xMDST2karm5K+mZO6RiFUl8oyED1WC1uwvOPlbh2/Nz35yzak+FxijP97
   w==;
X-CSE-ConnectionGUID: +86RMnXGQhS4Rjct+gYaLg==
X-CSE-MsgGUID: jQiZ46LjSVG/Fnu4Bvlu7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55533176"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="55533176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 21:13:11 -0700
X-CSE-ConnectionGUID: 0j9C4fV8TNOeOr5eSR6mJQ==
X-CSE-MsgGUID: cleAG23OQgKElc4p/CZd2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="152677355"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2025 21:13:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPZJK-000B6y-2Y;
	Thu, 12 Jun 2025 04:13:06 +0000
Date: Thu, 12 Jun 2025 12:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 2/2] mm/memory.c:1807:15: warning:
 variable 'mapped_pte' set but not used
Message-ID: <202506121247.9pw7QLzd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miaohe,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   de3036f041b742dfd2b0d86fc50ce61aaeca0aa1
commit: 67a982ee20d20e112f15eff98592a718de7c652e [2/2] mm/memory.c: fix potential pte_unmap_unlock pte error
config: arm-randconfig-004-20250612 (https://download.01.org/0day-ci/archive/20250612/202506121247.9pw7QLzd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121247.9pw7QLzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121247.9pw7QLzd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'copy_pte_range':
   mm/memory.c:800:24: warning: variable 'orig_dst_pte' set but not used [-Wunused-but-set-variable]
     pte_t *orig_src_pte, *orig_dst_pte;
                           ^~~~~~~~~~~~
   mm/memory.c:800:9: warning: variable 'orig_src_pte' set but not used [-Wunused-but-set-variable]
     pte_t *orig_src_pte, *orig_dst_pte;
            ^~~~~~~~~~~~
   mm/memory.c: In function 'remap_pte_range':
>> mm/memory.c:1807:15: warning: variable 'mapped_pte' set but not used [-Wunused-but-set-variable]
     pte_t *pte, *mapped_pte;
                  ^~~~~~~~~~


vim +/mapped_pte +1807 mm/memory.c

  1797	
  1798	/*
  1799	 * maps a range of physical memory into the requested pages. the old
  1800	 * mappings are removed. any references to nonexistent pages results
  1801	 * in null mappings (currently treated as "copy-on-access")
  1802	 */
  1803	static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
  1804				unsigned long addr, unsigned long end,
  1805				unsigned long pfn, pgprot_t prot)
  1806	{
> 1807		pte_t *pte, *mapped_pte;
  1808		spinlock_t *ptl;
  1809		int err = 0;
  1810	
  1811		mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
  1812		if (!pte)
  1813			return -ENOMEM;
  1814		arch_enter_lazy_mmu_mode();
  1815		do {
  1816			BUG_ON(!pte_none(*pte));
  1817			if (!pfn_modify_allowed(pfn, prot)) {
  1818				err = -EACCES;
  1819				break;
  1820			}
  1821			set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
  1822			pfn++;
  1823		} while (pte++, addr += PAGE_SIZE, addr != end);
  1824		arch_leave_lazy_mmu_mode();
  1825		pte_unmap_unlock(mapped_pte, ptl);
  1826		return err;
  1827	}
  1828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
