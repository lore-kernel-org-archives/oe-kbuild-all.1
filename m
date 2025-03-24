Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CC133C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742835400; cv=none; b=XdkxED14Ss1w4B4tSvEc/8Wy937Dh52wCM6MUMEP2xJAmOtjmGrz+o87GzqDuCSZOlH9nq2XQ7qlYmeyIf7gMPOXg2PHxBV0OllmjVzLBktvAnq1rwTzJXYKMtpp+Ce0GA4vLxSGRgGrp5z2nGZoqHpCKxlWq11PZNYpBasPiO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742835400; c=relaxed/simple;
	bh=Z6n6JfoT7nEbhUv8JBwouVcimTlZLa6SFQB6/TY1IrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+kjytT87ozxKMVMPWNYwDxt1Soi9Dkl7Oec+uwTWqJT4bqi5BpMPWz2bk/8WweRiqJGD+HZSYCfxAtw5LbuqpcHdpOMy1ne+ifICnOrpUP2u3JFXQGCYhOy7nESUq5fpC/I0NF1qrohE74sBvpjImCQypy4w2MAaQegQJzsovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HL/d/I2I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HL/d/I2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742835396; x=1774371396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6n6JfoT7nEbhUv8JBwouVcimTlZLa6SFQB6/TY1IrU=;
  b=HL/d/I2IqZNDrnqQF5c4JzuIgNFdW5MCM21nD/DAcGnyl+WGCX5AOh1w
   /6Z0YmHOP4R/p4wWIbWKce8HQtztzzS6JviFxHdwLEQSkt8/QeBLRdJXF
   xtF0/c7JKWK+lNuw5IopAOC/DpWhfC5zi0yKMedpZ1wmiT1eMAh+RFPWA
   5tDF38Wh0FqFJ04VWv8dMziynhs28Bss3bYwMulIJ8SCteSRFRflz7iBH
   PAfeZHTAgHrQqY/k85XzQHRF89pqXbEjIe1Kl3mfd3LJOKqNOLeiQ5Yyy
   g714KGzb3wb4f08ghCE4SpbwEMYT5R9xLTfiA274V0/1SeNaHPEw6UUhC
   A==;
X-CSE-ConnectionGUID: +ahasXIUTYSMDVyc/8WT3w==
X-CSE-MsgGUID: 2LNIqFmlRXK0/hfEEolgGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47710575"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="47710575"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 09:56:35 -0700
X-CSE-ConnectionGUID: pzWHP1UsRmWRGZk53C05jg==
X-CSE-MsgGUID: wUbAZzJxQiiVcjqm2U43GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="124132812"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Mar 2025 09:56:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twl6F-0003m1-36;
	Mon, 24 Mar 2025 16:56:31 +0000
Date: Tue, 25 Mar 2025 00:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 include/linux/userfaultfd_k.h:82:1: error: control reaches end of non-void
 function
Message-ID: <202503250020.w9z35NlP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   79690c1514e424a9e114b551db43e02068191cf0
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [1/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: arm-randconfig-002-20250324 (https://download.01.org/0day-ci/archive/20250325/202503250020.w9z35NlP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250020.w9z35NlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250020.w9z35NlP-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> include/linux/userfaultfd_k.h:82:1: error: control reaches end of non-void function [-Werror=return-type]
    }
    ^
   cc1: some warnings being treated as errors


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
