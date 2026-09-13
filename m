Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF79184
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 00:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789257978; cv=none; b=mDDDq++MsFgKLOSZj0Rq56G+weGNvhJtzatVXLw8BYwRdKWawT0PQzjbmyjEBiyAzhuKzAx/8qCYME4rgvvoVqThrQ4Gri5jyQECXEnPUdNugzg6IHNjflqbR85bL3slQwIiPo1XCTWnnuWUN1qQDhdJMZDkFEHrKGFBV2gi7uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789257978; c=relaxed/simple;
	bh=bXXVyWRvkAqF/QaiKyBBxnkAQ2lK86TM7MTqOdOu1rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q+dpcWQSAap3Crw4IrUeqCoz3Z5pKS28xCfT9BZHL6vJMVPfucG6xMQH0MM6EAp26KLT6B0DJG8eCYlcFWwHdwxL3P5h5YIqh7DhthQyB5knxtR1horlSP8ZrqR8hjet8Uze5zpGq+OGFV6/oPZdp8xixj0rOu/rQeFW/VQoCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCEDQmo4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCEDQmo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789257975; x=1820793975;
  h=date:from:to:cc:subject:message-id;
  bh=bXXVyWRvkAqF/QaiKyBBxnkAQ2lK86TM7MTqOdOu1rg=;
  b=LCEDQmo4InYuZ+RBr8shgcohB4UuLWCW4YDxI3+WmypJ0zAI5jPvGRrV
   xDo/IEG+k84kkE9DQsJlsiHoKdrHsW6oljM4oa2tlsuEcaZQ+HgfsqYWk
   EV67T24KHwJmXkiNebegGA292EMB9pinOqy8LpHqjXdbOjkUPHJ4Mrd08
   atsWGG9gja7PQjfbZpkWSGVauEj+ew8ad8GtoMIEu2v9mIGphu1/PVXLZ
   j8MiJKcIb054OKueT0ILFjimY0AhjHJKhBoLnxZrT4lXBN8M/i8Px09rq
   CsXjp9eeJp5erMeqNJHd7C5DtveCRGxDrU6EwxGzzjJB/gHVVG/l7RSyN
   w==;
X-CSE-ConnectionGUID: Z7cB+96mQauNtudtJcWhpQ==
X-CSE-MsgGUID: /mJrFr69RWeDBtsk5a3X8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="88815033"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="88815033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 17:06:15 -0700
X-CSE-ConnectionGUID: n+fRXsdzSKeN/Ba72Y1PjA==
X-CSE-MsgGUID: HKobDs3ARLO54FptqQIfFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="271782993"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Sep 2026 17:06:13 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5XjX-000000003Rx-0b3g;
	Sun, 13 Sep 2026 00:06:11 +0000
Date: Sun, 13 Sep 2026 08:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void
 function
Message-ID: <202609130713.NuVP6RXC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   f598b4e36c5884e38780f70315660738694c035d
commit: ee9964b308a6ee11d1cf5ee778dc91030f084489 [1/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: arm-randconfig-r121-20260910 (https://download.01.org/0day-ci/archive/20260913/202609130713.NuVP6RXC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130713.NuVP6RXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130713.NuVP6RXC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/rbtree.h:24:0,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
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
ee9964b308a6ee Lokesh Gidra     2024-01-16  81  	return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
932b18e0aec65a Andrea Arcangeli 2015-09-04 @82  }
932b18e0aec65a Andrea Arcangeli 2015-09-04  83  

:::::: The code at line 82 was first introduced by commit
:::::: 932b18e0aec65acb089f4bd8761ee85e70f8eb6a userfaultfd: linux/userfaultfd_k.h

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
