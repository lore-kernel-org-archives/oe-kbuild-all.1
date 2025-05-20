Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DDA1C8603
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759994; cv=none; b=N4X8PQ3DWYaUxpwPNXk0CtDDfQI07zzZRUazAliNElSenJzRxWP/7YarutRiilCaz2Q47lVe5wafZGUpv1lc7KTA/zbpxRTK3wR7XCxCsaZqDJ2zBn1Lm5yS8EjCY8syyg/Ha/CqT+ICpAeEFA2wkIK6z17jt/cIoBHXuQ58JKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759994; c=relaxed/simple;
	bh=daTJ3sNvDAZAxWdBrblqqVgPeMQaCqa3z28zVnJqHUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uigmTTKMM0oU3ZvpQ1v278StMbyWHvQyNy8DNp7Va713mmFfxhRTAPft7+FYet0UgZDve9vUdpE6s6C6QWVu2qM/4qIAhUYpPsq2VJJRRel+FDLMJQuAh0hLaXFawHJkfyB7cuWcHorszX543TP/0KboYvqD9rTM257wHwn5Ick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKQoZZaA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKQoZZaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747759993; x=1779295993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=daTJ3sNvDAZAxWdBrblqqVgPeMQaCqa3z28zVnJqHUo=;
  b=hKQoZZaA7CK6hfY+R/1RY0G1mM/bFrEMU6Ws9MK6Wr1EWEk0cId+S+R7
   u6JarDnrElGXrsp65YBlsWfta24yACZr2Y3osVq544DrrsKURZ/os6uaZ
   FXASI7xQIbNMEL865Lq/CM+zWMttRGcYvwDzVBP4MSJFA3/Y0lxGhZiA2
   nYplf+7femlUxgN/8sb7lhHpOe5InlihP2ZgnH8eoVCaVDwLRT7QyEg9J
   RGpFPiv8SvB2hDfZaOuNMcr9pyG1ZQP36XAtf7RBTN7dLczX7aMXwtD+M
   miOnU3hiwBnV+zqw0gjNkvJfgXZkwy4Qeac3dNERfL94Fwrxiq3DV8is8
   Q==;
X-CSE-ConnectionGUID: xr2Qt6BRQ8O3LHzu/Ejb+w==
X-CSE-MsgGUID: Sv4WJVC7Qu2s65ZC2ro0gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="72221338"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="72221338"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:53:12 -0700
X-CSE-ConnectionGUID: ZSQE61c3TgmqIiHbNI0Dfw==
X-CSE-MsgGUID: UE3ZC+4ETE2a67SgGARUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140676993"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2025 09:53:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHQDE-000NNo-2c;
	Tue, 20 May 2025 16:53:08 +0000
Date: Wed, 21 May 2025 00:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] mm/madvise: add PMADV_SKIP_ERRORS
 process_madvise() flag
Message-ID: <202505210009.7TcFMYKJ-lkp@intel.com>
References: <516daa1c1ec4b22f45d266d5786375e6d59572d1.1747686021.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <516daa1c1ec4b22f45d266d5786375e6d59572d1.1747686021.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20250516]
[cannot apply to linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-madvise-refactor-madvise_populate/20250520-045528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/516daa1c1ec4b22f45d266d5786375e6d59572d1.1747686021.git.lorenzo.stoakes%40oracle.com
patch subject: [RFC PATCH 2/5] mm/madvise: add PMADV_SKIP_ERRORS process_madvise() flag
config: parisc-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210009.7TcFMYKJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210009.7TcFMYKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210009.7TcFMYKJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'madvise_populate':
>> mm/madvise.c:969:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
     969 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c:969:48: note: each undeclared identifier is reported only once for each function it appears in
   mm/madvise.c: In function 'madvise_vma_behavior':
   mm/madvise.c:1374:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1374 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'madvise_inject_error':
   mm/madvise.c:1393:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1393 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'vector_madvise':
   mm/madvise.c:1883:33: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1883 |         bool can_skip = flags & PMADV_SKIP_ERRORS;
         |                                 ^~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'check_process_madvise_flags':
   mm/madvise.c:1953:29: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1953 |         unsigned int mask = PMADV_SKIP_ERRORS;
         |                             ^~~~~~~~~~~~~~~~~


vim +/PMADV_SKIP_ERRORS +969 mm/madvise.c

   964	
   965	static long madvise_populate(struct mm_struct *mm, unsigned long start,
   966			unsigned long end, struct madvise_behavior *madv_behavior)
   967	{
   968		int behavior = madv_behavior->behavior;
 > 969		bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
   970		const bool write = behavior == MADV_POPULATE_WRITE;
   971		int locked = 1;
   972		long pages;
   973	
   974		for (; start < end; start += pages * PAGE_SIZE) {
   975			/* Populate (prefault) page tables readable/writable. */
   976			pages = faultin_page_range(mm, start, end, write, &locked);
   977			if (!locked) {
   978				mmap_read_lock(mm);
   979				locked = 1;
   980			}
   981	
   982			if (pages >= 0)
   983				continue;
   984	
   985			if (can_skip) {
   986				/* Simply try the next page. */
   987				pages = 1;
   988				madv_behavior->saw_error = true;
   989				continue;
   990			}
   991	
   992			switch (pages) {
   993			case -EINTR:
   994				return -EINTR;
   995			case -EINVAL: /* Incompatible mappings / permissions. */
   996				return -EINVAL;
   997			case -EHWPOISON:
   998				return -EHWPOISON;
   999			case -EFAULT: /* VM_FAULT_SIGBUS or VM_FAULT_SIGSEGV */
  1000				return -EFAULT;
  1001			default:
  1002				pr_warn_once("%s: unhandled return value: %ld\n",
  1003					     __func__, pages);
  1004				fallthrough;
  1005			case -ENOMEM: /* No VMA or out of memory. */
  1006				return -ENOMEM;
  1007			}
  1008		}
  1009		return 0;
  1010	}
  1011	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
