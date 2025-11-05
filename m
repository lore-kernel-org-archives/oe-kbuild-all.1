Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142743043DA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347128; cv=none; b=kmnW9pl4VfLpiNnaZFLbBDMX+7vOYS9jPm0YU2q+4W8527gg7UejiqRJ+iREqtxCio2V7LHJC/FA9PwlDwZT4PlHvpZNHo08TGXFKn6VTnvRy9QU0u2toSmezPzG9ZJ8gk0JHcY81uHwQ6Ru47wSmpYgngsnSQK67zB/UHCrq5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347128; c=relaxed/simple;
	bh=iQciRVDChfoQfYbkayTXCDvUmwTWAqjHaN7dxEYA3mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S3POHsZzaH0TP+gMADF9rVh01Lz5aed69dlYmDEcu9uQoUgMPtdbE6EtSUlZ+NTnoxsDLWejkGOZ17e9A3+S48rjDVTdyGy7ZniUr4RdQgt6BPfWcuOMlVCAy4Sq6ILK1/YT4XkGDrl4q2/m8afwU48vqxuQsqSOPJv7kbhYV4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5U3zzyy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5U3zzyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762347126; x=1793883126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQciRVDChfoQfYbkayTXCDvUmwTWAqjHaN7dxEYA3mQ=;
  b=N5U3zzyyNA0VsOi/QXaTmLjzpG5wlrNE21hJx34z+n7okki1wnmanZT8
   ngMIvMBvd7tuP1/MJ5MEa0dfwoPT/fzFKwvv5ufM8nxj1yl3iQ/4RtDKW
   SIK1TYyXLCU4+vcszIvnkLf+5hqat9vmEN54ZAwlrgbdmRsDifPLAQV61
   USbEqHKyp8m92nPIgjzjk1AYnG+sA9XlQjJQIBIhyc9nHja4eVcZ+JoTa
   EeQXIdw88LpzbarWBt5gM4g50UlF+ROudGUjGk+nuLkmK5+jqndaVS8Oa
   dZrxNf44WAcenQ37e1+gVLZ+y5WIkcxMwwSvvasmtlj2qBPFrIddRfPk9
   Q==;
X-CSE-ConnectionGUID: e61lnv5yQKi5DEZvqWnbJg==
X-CSE-MsgGUID: VMCECFU8RpG34Ti2ml2L+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64490750"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64490750"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 04:52:05 -0800
X-CSE-ConnectionGUID: TqNmCRsMT16QZSQAj7mayg==
X-CSE-MsgGUID: j0DKSCUjRJW7JW9zNigcng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="186698383"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Nov 2025 04:52:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGcza-000SZD-02;
	Wed, 05 Nov 2025 12:52:02 +0000
Date: Wed, 5 Nov 2025 20:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3103/3103] mm/swap.h:66:26: error: implicit
 declaration of function 'swp_offset'; did you mean 'pud_offset'?
Message-ID: <202511052045.6ZI8bKFl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kairui,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b2b8512ca97108929f3aca5405875d91577b8c80
commit: 5a72d2e54e8ff7c7f9510de875cf201ad18f36c4 [3103/3103] mm/shmem, swap: fix softlockup with mTHP swapin
config: x86_64-randconfig-005-20251105 (https://download.01.org/0day-ci/archive/20251105/202511052045.6ZI8bKFl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052045.6ZI8bKFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052045.6ZI8bKFl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/shmem.c:43:
   mm/swap.h: In function 'non_swapcache_batch':
>> mm/swap.h:66:26: error: implicit declaration of function 'swp_offset'; did you mean 'pud_offset'? [-Wimplicit-function-declaration]
      66 |         pgoff_t offset = swp_offset(entry);
         |                          ^~~~~~~~~~
         |                          pud_offset
   In file included from mm/shmem.c:68:
   include/linux/swapops.h: At top level:
>> include/linux/swapops.h:107:23: error: conflicting types for 'swp_offset'; have 'long unsigned int(swp_entry_t)'
     107 | static inline pgoff_t swp_offset(swp_entry_t entry)
         |                       ^~~~~~~~~~
   mm/swap.h:66:26: note: previous implicit declaration of 'swp_offset' with type 'int()'
      66 |         pgoff_t offset = swp_offset(entry);
         |                          ^~~~~~~~~~


vim +66 mm/swap.h

    62	
    63	static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
    64	{
    65		struct swap_info_struct *si = swp_swap_info(entry);
  > 66		pgoff_t offset = swp_offset(entry);
    67		int i;
    68	
    69		/*
    70		 * While allocating a large folio and doing mTHP swapin, we need to
    71		 * ensure all entries are not cached, otherwise, the mTHP folio will
    72		 * be in conflict with the folio in swap cache.
    73		 */
    74		for (i = 0; i < max_nr; i++) {
    75			if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
    76				return i;
    77		}
    78	
    79		return i;
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
