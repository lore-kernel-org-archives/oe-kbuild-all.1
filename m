Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA005364927
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 21:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777585723; cv=none; b=NdBHgq2Wwo+Yn39qymyGbMHynIcCBx3ayUSbGLkzI5V5wLxAhB5WGW5lH3RRiRftqPNmddU1m+aW1cgMlcXgnTtbGVl1g5WW/gy0nqSMvMju+t2XZlhm8GAMGL6VNJ9w8Ct8WiGT4xJSLRzYGf3cjMWPf2OuXaNKoBh223A/xZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777585723; c=relaxed/simple;
	bh=cFV3OT/aq+lr4g9AvoUZm9oXDnPq2vdXS27uYoyi5BE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mV7uHp0ASzdmT+eY7+0CWtDan18SZL/u2lQulsZEqAc3drOt1FyX5QZNJ4mJdTZDuzdb/VeFw+dmMZ+4Ei6ueyUY6UOoOeFAvLvGzVhI7pBbA5oOqJHgMcybpUIpTvLHkJ+ptgF1uAwkveCtAJb49TSsj+9cI2RTyesKR2vZztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bu6wtzQd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bu6wtzQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777585722; x=1809121722;
  h=date:from:to:cc:subject:message-id;
  bh=cFV3OT/aq+lr4g9AvoUZm9oXDnPq2vdXS27uYoyi5BE=;
  b=Bu6wtzQdlq+Yh4jbK+vMvYfv/vAa57koF2r/gUNeximufj+FjZzWI3j7
   ENjApQyYm07yFfPFLd3HfpthBmNg1U/fK2JKo9zMX9jxYMR6Gpz4klF7L
   ICmUtHVa7I/0rN7Crh9UZv1I5O3NZo1KrG6MjMdt4FVoLOpuXpt8s1NkW
   6KJlLdJ97enemVR84TqfoyLX/T7ITTHQvh7dzxRWm6dvuPmCovD5ynB4T
   J4iXczN0txrpjhw+u0smMvGSkBeRsE1klKBKos4P+rzm8NMBIjiLF1r6x
   AYq9PDT2hUxNVhiSu6jTdgXsKlIm/+d6+Qs9Yfr6NoX5Z2JDsTnmZjcNe
   A==;
X-CSE-ConnectionGUID: z5hSxBIFSeibXvJ0Lqhvcw==
X-CSE-MsgGUID: uM510M9MRDO0ZIkZ1pNGcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82418720"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="82418720"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 14:48:42 -0700
X-CSE-ConnectionGUID: kbMTBbI/QBqgyVnKV7xNtA==
X-CSE-MsgGUID: k84LxXnbSaa0FJ+x3Ur4rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="230101217"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2026 14:48:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIZFO-000000004tV-18X5;
	Thu, 30 Apr 2026 21:48:38 +0000
Date: Thu, 30 Apr 2026 23:48:17 +0200
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/leafops.h:105:13: error: implicit
 declaration of function 'pmd_swp_exclusive'; did you mean
 'pte_swp_exclusive'?
Message-ID: <202604302356.yr69nqUo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-add-softleaf_to_pmd-and-convert-existing-callers/20260430-233124
head:   62010337c75b14016955c092466110e39a5ee1a0
commit: 66f97c2502af85f1ebfa1006c2a970b2eda0d5c0 mm: add PMD swap entry detection support
date:   6 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604302356.yr69nqUo-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302356.yr69nqUo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302356.yr69nqUo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/userfaultfd_k.h:19,
                    from ./include/linux/shmem_fs.h:12,
                    from init/main.c:82:
   ./include/linux/leafops.h: In function 'softleaf_from_pmd':
>> ./include/linux/leafops.h:105:13: error: implicit declaration of function 'pmd_swp_exclusive'; did you mean 'pte_swp_exclusive'? [-Wimplicit-function-declaration]
     105 |         if (pmd_swp_exclusive(pmd))
         |             ^~~~~~~~~~~~~~~~~
         |             pte_swp_exclusive
>> ./include/linux/leafops.h:106:23: error: implicit declaration of function 'pmd_swp_clear_exclusive'; did you mean 'pte_swp_clear_exclusive'? [-Wimplicit-function-declaration]
     106 |                 pmd = pmd_swp_clear_exclusive(pmd);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
         |                       pte_swp_clear_exclusive
>> ./include/linux/leafops.h:106:23: error: incompatible types when assigning to type 'pmd_t' from type 'int'


vim +105 ./include/linux/leafops.h

    83	
    84	#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
    85	/**
    86	 * softleaf_from_pmd() - Obtain a leaf entry from a PMD entry.
    87	 * @pmd: PMD entry.
    88	 *
    89	 * If @pmd is present (therefore not a leaf entry) the function returns an empty
    90	 * leaf entry. Otherwise, it returns a leaf entry.
    91	 *
    92	 * Returns: Leaf entry.
    93	 */
    94	static inline softleaf_t softleaf_from_pmd(pmd_t pmd)
    95	{
    96		softleaf_t arch_entry;
    97	
    98		if (pmd_present(pmd) || pmd_none(pmd))
    99			return softleaf_mk_none();
   100	
   101		if (pmd_swp_soft_dirty(pmd))
   102			pmd = pmd_swp_clear_soft_dirty(pmd);
   103		if (pmd_swp_uffd_wp(pmd))
   104			pmd = pmd_swp_clear_uffd_wp(pmd);
 > 105		if (pmd_swp_exclusive(pmd))
 > 106			pmd = pmd_swp_clear_exclusive(pmd);
   107		arch_entry = __pmd_to_swp_entry(pmd);
   108	
   109		/* Temporary until swp_entry_t eliminated. */
   110		return swp_entry(__swp_type(arch_entry), __swp_offset(arch_entry));
   111	}
   112	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
