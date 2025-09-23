Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C62C1E480
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 07:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758611397; cv=none; b=ttR9pcTw9URMNVOr/vhlZIUSUH9/FK/xEwqxS9Y2syZ0/zHUpK5cbsxGmTGURfmlCYYc9w96leMVmMcKsqbanIAYpeW0bdMjt7QWQNdMNlpkobO9BTipNmw+hmFxcMJCR12WnRUXaeaEP+FO+OoQg1Ko6rFs6SvSutT+JSBOojs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758611397; c=relaxed/simple;
	bh=7g/l0+cMwUZDzLZTDuyKFbBEqwaIGHK6IvfICdemXqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/coOwUjPUty3UMIclpVOJBx3T4m9G0FL0AeClW8jXMIrd9Acaj36Mo1jV0j9r2IY9sAy+XaFhsd82gfLVfHkyTAbcPCWFMlsPdYevwHItfzX8o8332fgzwWROIGQZRpcfKnwf8WE8rMBlEe/Nqt3gRdL/xp4jlS+Txb+zKwXcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+RMQ083; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+RMQ083"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758611395; x=1790147395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7g/l0+cMwUZDzLZTDuyKFbBEqwaIGHK6IvfICdemXqQ=;
  b=B+RMQ083lUxXIZgyuEZ1IIDTeOVy4CuwlCDsJ16oHdzC+ej0SD2XDA4I
   Uapv/rPCkHdMgD0gym9Nd7cN73kU5sJELD8hNqDrYiahUhiI5VZdBFVQL
   JVCnzTlJLIYW18ZdkH1gEtT3hXg0RCgA+Vafo+Zu7nqdljCsw6HpStdBQ
   aEd1KytnliGIYdhVNQlJeKYh0JaWoEC5qW5xX2SFWSmKbl5OBzD2Kmoz2
   Fpjri1/wF+VFd4emyAiHLDfvAsB0m7TMgN6xolI4F9SmlQuvlOMAoiCxQ
   n583/YAFtKLAvcT2VJZ6CzLGm0GjodRTMwGlXm9EIyGwjyFooiq1HvCSw
   w==;
X-CSE-ConnectionGUID: mDvbYp89SxS4KfcegayH0w==
X-CSE-MsgGUID: J9Rl1GKMSgGpwWqAnE7Kng==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59924092"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="59924092"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 00:09:54 -0700
X-CSE-ConnectionGUID: AQnfBSy1T5K0Lgvtp4TRNg==
X-CSE-MsgGUID: 8PmALX0JTwWL9bCUTNO7sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176527624"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Sep 2025 00:09:53 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0x9n-0002qd-32;
	Tue, 23 Sep 2025 07:09:49 +0000
Date: Tue, 23 Sep 2025 15:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2910/2910] mm/swap.h:66:26: error: implicit
 declaration of function 'swp_offset'; did you mean 'pud_offset'?
Message-ID: <202509231547.ijXKrDIl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   be758a5796c3d280deb877699c41fd0cd04e1deb
commit: 5a72d2e54e8ff7c7f9510de875cf201ad18f36c4 [2910/2910] mm/shmem, swap: fix softlockup with mTHP swapin
config: x86_64-buildonly-randconfig-002-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231547.ijXKrDIl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231547.ijXKrDIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231547.ijXKrDIl-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


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
