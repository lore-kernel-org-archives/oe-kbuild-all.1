Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF97E573
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744418; cv=none; b=aoWLg43Ntzgf70ljYwSTB7Mztf8Vbb+TAHWh5XtoKJzzJkHsHyhDkLDtBNzNbIUiAhkweNxO9Z6KHL8StijQFXfiWkYp3TgnOvqHS6anl2Qz3L9nUDP+6T/m8z9VY/M4k+1t6c4yUSxaB8KPL9CHmtnfBvWiDQ4mYEoK7hwI/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744418; c=relaxed/simple;
	bh=92p06Qe6o/7v7Eb/pyhArqM6ug2JOqFYAJVUlqrd9Js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MfJzTuaMdGCdjHIisky/nEECi6Rj4sT6GwRVz7qwTzvwouYJ1WlEr5bLvU59z6H6WXMkBFtTmpVLcdFHoB2QfA2V/7wDMTu7MNKourpgIkUtAAVKTh2er4ALRf2tRiUyK4qXkyHHO7juOSSwLJqsDi44Oma0htQD3mnpJxm5gr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7LPpluV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7LPpluV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747744416; x=1779280416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92p06Qe6o/7v7Eb/pyhArqM6ug2JOqFYAJVUlqrd9Js=;
  b=G7LPpluV9LRpPvzbdGHBxaktdVlms5Pj7fN73OBv48fg/bRzdHRb0UrI
   xSUutJfALQNRmwkj8IcldRl4ln26oe8XmbWU8PDEEtsgLSlzQsdhotZUY
   Aq+4gFUJhtqzcn1WBV9P+QZzBPkqbR8vHk5RW8uquAkFNxIuaWCPdqLn9
   F4kttk32zKocScdkTO3KOfsvt+lRuA4iwmsmKYg4/1vIat3D6DCL3CZxs
   PxmPCqXiWF2gErR3d3+qi85YIN+9U1rIQf9DtL9zxK5ZXATj0CSRrL267
   /KmetFfjcoIDB9yjuLernpdkws0Nlx3LrTP17BpHFKPUu8TqKAQ6N/EQx
   g==;
X-CSE-ConnectionGUID: o80b4XxRSneNc+OkxoLPrg==
X-CSE-MsgGUID: P0bOUEHvQCanaUpDLpWY5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49605986"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49605986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 05:33:35 -0700
X-CSE-ConnectionGUID: r1wr3wftSMaXmf8GltZLQQ==
X-CSE-MsgGUID: Ph5Hn/kkRPahPis3i2671w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140190430"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 May 2025 05:33:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHM9z-000MZk-32;
	Tue, 20 May 2025 12:33:31 +0000
Date: Tue, 20 May 2025 20:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202505202013.LEviLEVe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   daab5d890e9f319433eac9dc2895ce9ec873eb58
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [1/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: i386-randconfig-r133-20250520 (https://download.01.org/0day-ci/archive/20250520/202505202013.LEviLEVe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202013.LEviLEVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505202013.LEviLEVe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mmap.c: note: in included file (through include/linux/hugetlb.h):
>> include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx *
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx [noderef] __rcu *
>> include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx *
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx [noderef] __rcu *

vim +81 include/linux/userfaultfd_k.h

    58	
    59	extern int mfill_atomic_install_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
    60					    struct vm_area_struct *dst_vma,
    61					    unsigned long dst_addr, struct page *page,
    62					    bool newly_allocated, bool wp_copy);
    63	
    64	extern ssize_t mcopy_atomic(struct mm_struct *dst_mm, unsigned long dst_start,
    65				    unsigned long src_start, unsigned long len,
    66				    atomic_t *mmap_changing, __u64 mode);
    67	extern ssize_t mfill_zeropage(struct mm_struct *dst_mm,
    68				      unsigned long dst_start,
    69				      unsigned long len,
    70				      atomic_t *mmap_changing);
    71	extern ssize_t mcopy_continue(struct mm_struct *dst_mm, unsigned long dst_start,
    72				      unsigned long len, atomic_t *mmap_changing);
    73	extern int mwriteprotect_range(struct mm_struct *dst_mm,
    74				       unsigned long start, unsigned long len,
    75				       bool enable_wp, atomic_t *mmap_changing);
    76	
    77	/* mm helpers */
    78	static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
    79						struct vm_userfaultfd_ctx vm_ctx)
    80	{
  > 81		return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
