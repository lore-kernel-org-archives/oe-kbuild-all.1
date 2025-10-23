Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A684C2AEF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 02:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186390; cv=none; b=fBnn/sMD2D/Bv/HeL0TEWi87ayEOoVl2CRVawVa/og+NOQgEymBByl64/is+rWQfBmTuZmacTvpXeNVzhMXcBZh4jai6EPMSvLCkbdFK/n7HFPB9+lsnWH6jfUeopv4fT4r2x4kOi1r91WJwX8fyEf/VbdQW78bbO2kNbfLlEEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186390; c=relaxed/simple;
	bh=1mvjcdErKl2lBHrGs4AZftlJc7x4JpE6cGzG+ahmRiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtEuFW6/cUy6DNqJxltP1+yvXe68PXWr3yJ3IrIEn5tbZRZ2seOPuZckVp8gYAI6ylz7uB09PcjKiYHOK0k21FQmiOMEi3K1tnPni2pTIXkjKBSH5LUMAbfnxs8UrdRnP3DJXd126MZqoCSyqAQu/pFQFcX/1TMLpFOWKPxWGG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgeUQAlP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgeUQAlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761186388; x=1792722388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1mvjcdErKl2lBHrGs4AZftlJc7x4JpE6cGzG+ahmRiw=;
  b=KgeUQAlPcFLpzzNfwjkhZrLGmTxB9v1ixib1AnF6Sfnygudp4yeyD9tq
   fZZrir7URZ97FJDjB067Ys7qwNZvNGrM5i9R9Vi0L1GrDEhKkA9qQX997
   lKwaz9ep8BtE+Gs90ATJGdvqZU+zxWu1smN7OSB7/LJ4EYJ5q7gJI7CSE
   sbMHUhMeXgPBn9vdqyDzBGUhrK0C7iQb3FSem4w8ocv4TuQ8stqJmiTVd
   vr1JEodMDcIl/FD0KkpxFG0MdCl9X7i/PlWF1Vhc27X5njdbDXjvh9MVu
   +kQU/Sh8hExbTvNiq0ssNcHYH0SwyHG3yO6Vwu80ZXXchb0rSeFoiVV8z
   A==;
X-CSE-ConnectionGUID: Zyu/kQqCQpausR3RshAWyQ==
X-CSE-MsgGUID: J7ZLfOp2Tf+kNtT4/PwsZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63385211"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63385211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:26:28 -0700
X-CSE-ConnectionGUID: 2nw1JX/BTve1hBT6TFMhAA==
X-CSE-MsgGUID: SOZLCXBpRJ+J0vjW542Xqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188433603"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2025 19:26:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBl21-000Cw1-0C;
	Thu, 23 Oct 2025 02:26:25 +0000
Date: Thu, 23 Oct 2025 10:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-05 9/9]
 include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void
 function
Message-ID: <202510231010.X304a3YQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lokesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-05
head:   e41b7a3e22fae065033adacf0f93a164ff468a28
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [9/9] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: arm64-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251023/202510231010.X304a3YQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231010.X304a3YQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231010.X304a3YQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/mm_types.h:6,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from mm/mmap.c:13:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
   include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     391 |  typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |         ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
     501 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
      81 |  return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
         |         ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/hugetlb.h:15,
                    from mm/mmap.c:29:
>> include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void function [-Wreturn-type]
      82 | }
         | ^


vim +82 include/linux/userfaultfd_k.h

f619147104c8ea7 Axel Rasmussen   2021-05-04  58  
7d64ae3ab648a96 Axel Rasmussen   2021-06-30  59  extern int mfill_atomic_install_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
7d64ae3ab648a96 Axel Rasmussen   2021-06-30  60  				    struct vm_area_struct *dst_vma,
7d64ae3ab648a96 Axel Rasmussen   2021-06-30  61  				    unsigned long dst_addr, struct page *page,
7d64ae3ab648a96 Axel Rasmussen   2021-06-30  62  				    bool newly_allocated, bool wp_copy);
7d64ae3ab648a96 Axel Rasmussen   2021-06-30  63  
c1a4de99fada21e Andrea Arcangeli 2015-09-04  64  extern ssize_t mcopy_atomic(struct mm_struct *dst_mm, unsigned long dst_start,
df2cc96e77011cf Mike Rapoport    2018-06-07  65  			    unsigned long src_start, unsigned long len,
a759a909d42d727 Nadav Amit       2021-09-02  66  			    atomic_t *mmap_changing, __u64 mode);
c1a4de99fada21e Andrea Arcangeli 2015-09-04  67  extern ssize_t mfill_zeropage(struct mm_struct *dst_mm,
c1a4de99fada21e Andrea Arcangeli 2015-09-04  68  			      unsigned long dst_start,
df2cc96e77011cf Mike Rapoport    2018-06-07  69  			      unsigned long len,
a759a909d42d727 Nadav Amit       2021-09-02  70  			      atomic_t *mmap_changing);
f619147104c8ea7 Axel Rasmussen   2021-05-04  71  extern ssize_t mcopy_continue(struct mm_struct *dst_mm, unsigned long dst_start,
a759a909d42d727 Nadav Amit       2021-09-02  72  			      unsigned long len, atomic_t *mmap_changing);
ffd05793963a44b Shaohua Li       2020-04-06  73  extern int mwriteprotect_range(struct mm_struct *dst_mm,
ffd05793963a44b Shaohua Li       2020-04-06  74  			       unsigned long start, unsigned long len,
a759a909d42d727 Nadav Amit       2021-09-02  75  			       bool enable_wp, atomic_t *mmap_changing);
c1a4de99fada21e Andrea Arcangeli 2015-09-04  76  
932b18e0aec65ac Andrea Arcangeli 2015-09-04  77  /* mm helpers */
932b18e0aec65ac Andrea Arcangeli 2015-09-04  78  static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
932b18e0aec65ac Andrea Arcangeli 2015-09-04  79  					struct vm_userfaultfd_ctx vm_ctx)
932b18e0aec65ac Andrea Arcangeli 2015-09-04  80  {
9b613572d6246da Lokesh Gidra     2024-01-16 @81  	return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
932b18e0aec65ac Andrea Arcangeli 2015-09-04 @82  }
932b18e0aec65ac Andrea Arcangeli 2015-09-04  83  

:::::: The code at line 82 was first introduced by commit
:::::: 932b18e0aec65acb089f4bd8761ee85e70f8eb6a userfaultfd: linux/userfaultfd_k.h

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
