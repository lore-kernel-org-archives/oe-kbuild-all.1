Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BB241690
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779545304; cv=none; b=SM3f4fWhvvV9TUegtOlBakumADPJtd6YKU7YT7Wx490TW2+B90+ZqjjBcJiRm/wMEWIDDu8MT55mOSBoa6idCtSH+iA5lKI8lnL/Ec9usUqVESoDhxTrFqIzhQlzkxt+j87XCdRxBKSbe2WSnxgqOKAkyExLinin1PZx69u8L2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779545304; c=relaxed/simple;
	bh=Ev9fatmmGUAtSlWYHdp9EMymXTPzIjqf5CkZkAe3Rio=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kk8zZGZHx6Dbp4sad/Dg8nAx+OCUSuhEE8RiQ29a7qtEcLZRqUzHNocmL6y8feToPZiwA+nXTFrMdMjuvYHwytZ1ABpDTAY0NiMK/dSHcm8D/NnHyUqBWVpwTcoIL3Xfey8G4UOGBCeqP7wlElJ/qqmEgE7bRKfBMiYc+I5o7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2sjKmYF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2sjKmYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779545303; x=1811081303;
  h=date:from:to:cc:subject:message-id;
  bh=Ev9fatmmGUAtSlWYHdp9EMymXTPzIjqf5CkZkAe3Rio=;
  b=J2sjKmYFWJiBxaZflTTmkmEuSy4mhS+H7IOyS68rxLvYkXwdz0PyXOWQ
   KxWhRh0NBGqkdaQhx6SZ9sEyPRzFIt5atFTYQRmzfBZ+N+WYSy+fVbws/
   Mq5lII6sSVytJanY7pBe1Ruemrt8/N0VUnz7CpaETd/WxzO4FkiOBFK9h
   OsUrngD2JVjouNd8PDsL4Avp5t1Kp3/0w8bYyAXO14GmZVIeXOK+M77gO
   n//8NgyCbTJ2NO0I/azr4i7Hin8+jLRgpR1jx96CZ8k52wC9+3JikQY78
   owrMBM5vXcIY/T9r9IWO/W0dCYNkWURYcIE5kphsZaXKKkTNXcykeZkWj
   g==;
X-CSE-ConnectionGUID: 3vC6YqCHRbWotRa5NPoSAA==
X-CSE-MsgGUID: s5HV6MPaQCq76uSrADKMhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80481808"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="80481808"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 07:08:23 -0700
X-CSE-ConnectionGUID: H2nhjExCQ1qTq8VNYcqGnw==
X-CSE-MsgGUID: 7JstkZBnQQyWIhU9GCcf3A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO cef7325a8999) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 May 2026 07:08:21 -0700
Received: from kbuild by cef7325a8999 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQn1X-0000000006z-07Up;
	Sat, 23 May 2026 14:08:19 +0000
Date: Sat, 23 May 2026 22:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void
 function
Message-ID: <202605232252.jECSQ62Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lokesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   35aa7a801190f6d004ce42904cbd1a003ff9c97e
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [2/2] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: arm64-randconfig-003-20260523 (https://download.01.org/0day-ci/archive/20260523/202605232252.jECSQ62Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605232252.jECSQ62Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605232252.jECSQ62Q-lkp@intel.com/

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
