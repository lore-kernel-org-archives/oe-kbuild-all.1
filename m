Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB824340DA5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471286; cv=none; b=ARnRPl+UIdsHHMVhDKuQmiE+TSEqcsydwr4vHEXjjiIQAKZrpk181ZaonoQgqcQpo9gV2kK7PpcMUwH1uY9FZhD8LXKMTavjq+kNTz8Jn5M4WDYiXpmnG0QRkfaitnnjNseQLuGJpJAjflbe4C1gDjUT5NgdNQxA0Ay9Q+69yIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471286; c=relaxed/simple;
	bh=zsP/lBwYcCdAyd4zn4l4vlaAsqxJXNnDGFpPFWSF+D0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LYCYfBLEmHPnCIP/68+rsPStWfEoXWQeI+sFj6FcQDC8OdyO9aYcjYN72/a69zAR2ICuGCVRwRMj0pydqaxPC4NKIhDKDYoYnuUr3QRoEdmKu/J0A7+kK/UyUKkP88ssRB6qmDAehfXHHJZKoJKFqVcdYnvfwvy25WGU7uKbMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdtn2hsc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdtn2hsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770471287; x=1802007287;
  h=date:from:to:cc:subject:message-id;
  bh=zsP/lBwYcCdAyd4zn4l4vlaAsqxJXNnDGFpPFWSF+D0=;
  b=mdtn2hsc+oG9G78jRCo7M2EEgmd1V0XWEEgAxydvmxJQ3rsygfs2Ea3x
   0SbYGJZ4uwLu2IpZRVIxB4Dsxwh7tO6cXjQ0MQlmMywtRbtpDV13n5rAq
   Lz1MGEkudfcXW+U9ohDOGwAXIuhxRcKm28u/BAoxjIfwVcM71hDFSHjsS
   JsU6WXk20wQoZ0uIuvZ2w4GoLOpjSBkyN1jZhM3r2eIZ/Zbl56Y+enkqi
   4WfH2+VRxWoAMPZV8QA1+qW6cj9SFr6iidxCrbJztjDBDfStrFXHmqvy3
   532E5kC8rbmSAa2ysy9lfe/dDBTDhAmZQnMEwaV8JuTfgmQpCVEzWNTcK
   A==;
X-CSE-ConnectionGUID: wn1hrMGCSDSDENM7FrlKFA==
X-CSE-MsgGUID: szp+AQDeRdu1zjjAz2uQDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71839738"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71839738"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 05:34:46 -0800
X-CSE-ConnectionGUID: dQ0yt/vpTdmhDgrOYfGFSg==
X-CSE-MsgGUID: 7B2t12ZGSSKrL5syl6flGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210920363"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2026 05:34:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voiSQ-00000000lfc-1frm;
	Sat, 07 Feb 2026 13:34:42 +0000
Date: Sat, 07 Feb 2026 21:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-12 2/2]
 include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void
 function
Message-ID: <202602072144.jVq07vKQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lokesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-12
head:   3af317d1a3d8e6dc60a8d368bd15e12ec72b51fe
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [2/2] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: arm-randconfig-003-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072144.jVq07vKQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072144.jVq07vKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072144.jVq07vKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/mm_types.h:6,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from mm/mmap.c:13:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
   include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/hugetlb.h:15:0,
                    from mm/mmap.c:29:
>> include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +82 include/linux/userfaultfd_k.h

f619147104c8ea Axel Rasmussen   2021-05-04  58  
7d64ae3ab648a9 Axel Rasmussen   2021-06-30  59  extern int mfill_atomic_install_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
7d64ae3ab648a9 Axel Rasmussen   2021-06-30  60  				    struct vm_area_struct *dst_vma,
7d64ae3ab648a9 Axel Rasmussen   2021-06-30  61  				    unsigned long dst_addr, struct page *page,
7d64ae3ab648a9 Axel Rasmussen   2021-06-30  62  				    bool newly_allocated, bool wp_copy);
7d64ae3ab648a9 Axel Rasmussen   2021-06-30  63  
c1a4de99fada21 Andrea Arcangeli 2015-09-04  64  extern ssize_t mcopy_atomic(struct mm_struct *dst_mm, unsigned long dst_start,
df2cc96e77011c Mike Rapoport    2018-06-07  65  			    unsigned long src_start, unsigned long len,
a759a909d42d72 Nadav Amit       2021-09-02  66  			    atomic_t *mmap_changing, __u64 mode);
c1a4de99fada21 Andrea Arcangeli 2015-09-04  67  extern ssize_t mfill_zeropage(struct mm_struct *dst_mm,
c1a4de99fada21 Andrea Arcangeli 2015-09-04  68  			      unsigned long dst_start,
df2cc96e77011c Mike Rapoport    2018-06-07  69  			      unsigned long len,
a759a909d42d72 Nadav Amit       2021-09-02  70  			      atomic_t *mmap_changing);
f619147104c8ea Axel Rasmussen   2021-05-04  71  extern ssize_t mcopy_continue(struct mm_struct *dst_mm, unsigned long dst_start,
a759a909d42d72 Nadav Amit       2021-09-02  72  			      unsigned long len, atomic_t *mmap_changing);
ffd05793963a44 Shaohua Li       2020-04-06  73  extern int mwriteprotect_range(struct mm_struct *dst_mm,
ffd05793963a44 Shaohua Li       2020-04-06  74  			       unsigned long start, unsigned long len,
a759a909d42d72 Nadav Amit       2021-09-02  75  			       bool enable_wp, atomic_t *mmap_changing);
c1a4de99fada21 Andrea Arcangeli 2015-09-04  76  
932b18e0aec65a Andrea Arcangeli 2015-09-04  77  /* mm helpers */
932b18e0aec65a Andrea Arcangeli 2015-09-04  78  static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
932b18e0aec65a Andrea Arcangeli 2015-09-04  79  					struct vm_userfaultfd_ctx vm_ctx)
932b18e0aec65a Andrea Arcangeli 2015-09-04  80  {
9b613572d6246d Lokesh Gidra     2024-01-16  81  	return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
932b18e0aec65a Andrea Arcangeli 2015-09-04 @82  }
932b18e0aec65a Andrea Arcangeli 2015-09-04  83  

:::::: The code at line 82 was first introduced by commit
:::::: 932b18e0aec65acb089f4bd8761ee85e70f8eb6a userfaultfd: linux/userfaultfd_k.h

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
