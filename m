Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F892E7193
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759372; cv=none; b=bR6IK7+glGIiL67pGSU89KJ7sB+FHjFeafWhujTu9ovJKiNdOXvEE+udzC9eVkDDStwKQjY8cw52P/0g8T3A1wd9ahL6ZJ8h8KudeZlUoZuO1BATJFbiIgdljvvuywM0Hdd6iCNYGmH677KOTMwfzLbH0gtp9g51YARILTVG4vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759372; c=relaxed/simple;
	bh=1GFqNFsObv7zigxVT9LMzK7sbSE5nFLCUJBpNV9fdJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CgVgN8/iCd6Skr+D2NefxxhOCMHmolvIYK3pJBNJzfa4ps4b1bWd5TqY2B9icX7+Lk3XvwWQvHMQo797ywz56HhTtJNkng9T3kGlcEN0FYHLOLbHfj/tPg5zMKqZ8nu4AqVIO4kmz/1+p8z0jW3Np/FILc0c8ws7Ke7xvzJg+Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfAFwyEj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfAFwyEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755759370; x=1787295370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GFqNFsObv7zigxVT9LMzK7sbSE5nFLCUJBpNV9fdJA=;
  b=JfAFwyEj/KEd/JdpvygtEbov3B2o7p7F414Dv6ifqhoc6jSblA3zSGzC
   rSoRhWLUQGXf35OYrR6VSI+9Re/imhrRSqEzKXjTRBj/wKVP0csE+UPaq
   hJfj/oa1+mRrqAOyQbsISXBYuWRmWZYfDVLcWkv3UAzUxMWVVVO5PBSpZ
   fHg+ZuOq/MTWK9riESTu10wLqYbJGzbRSGNLXczAOix3+rfmLQ7BpFZvR
   UtOE1zwWs3Jfsmm2rzaUSqOx8GZPflW7+YttxO/2FWRADSxQieAWNvnYv
   LaEaW4pQvX/zFE3T8CUnFAi9Y8nl5dviN9EoSNOI/ZsLKOMXQUJGqdR54
   A==;
X-CSE-ConnectionGUID: eGqWVv1jSGeyH+1jBkW22w==
X-CSE-MsgGUID: fo+ROXOmSF+GjeB95NLTEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57895511"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57895511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 23:56:10 -0700
X-CSE-ConnectionGUID: s8zGwWx/R4yFmhfltrBNOg==
X-CSE-MsgGUID: f4zkZNxbQMGrn61RxdEigw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2025 23:56:09 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uozDT-0001gZ-0j;
	Thu, 21 Aug 2025 06:56:07 +0000
Date: Thu, 21 Aug 2025 08:55:31 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 4/4]
 include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void
 function
Message-ID: <202508210809.WaxvHXtl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f405d5f9137b73c974509f22235b46df04196e22
commit: a905086c85cb076b98620df34ee237ece7c0599f [4/4] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: arm-randconfig-2006-20250821 (https://download.01.org/0day-ci/archive/20250821/202508210809.WaxvHXtl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210809.WaxvHXtl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210809.WaxvHXtl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/rbtree.h:22:0,
                    from include/linux/mm_types.h:10,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from mm/mmap.c:13:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
   include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/hugetlb.h:15:0,
                    from mm/mmap.c:28:
>> include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +82 include/linux/userfaultfd_k.h

4a5cf92412ab1a3 Axel Rasmussen   2021-03-18  58  
0b161cf6fc3df50 Axel Rasmussen   2021-05-11  59  extern int mfill_atomic_install_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
0b161cf6fc3df50 Axel Rasmussen   2021-05-11  60  				    struct vm_area_struct *dst_vma,
0b161cf6fc3df50 Axel Rasmussen   2021-05-11  61  				    unsigned long dst_addr, struct page *page,
0b161cf6fc3df50 Axel Rasmussen   2021-05-11  62  				    bool newly_allocated, bool wp_copy);
0b161cf6fc3df50 Axel Rasmussen   2021-05-11  63  
c1a4de99fada21e Andrea Arcangeli 2015-09-04  64  extern ssize_t mcopy_atomic(struct mm_struct *dst_mm, unsigned long dst_start,
df2cc96e77011cf Mike Rapoport    2018-06-07  65  			    unsigned long src_start, unsigned long len,
72981e0e7b609c7 Andrea Arcangeli 2020-04-06  66  			    bool *mmap_changing, __u64 mode);
c1a4de99fada21e Andrea Arcangeli 2015-09-04  67  extern ssize_t mfill_zeropage(struct mm_struct *dst_mm,
c1a4de99fada21e Andrea Arcangeli 2015-09-04  68  			      unsigned long dst_start,
df2cc96e77011cf Mike Rapoport    2018-06-07  69  			      unsigned long len,
df2cc96e77011cf Mike Rapoport    2018-06-07  70  			      bool *mmap_changing);
4a5cf92412ab1a3 Axel Rasmussen   2021-03-18  71  extern ssize_t mcopy_continue(struct mm_struct *dst_mm, unsigned long dst_start,
4a5cf92412ab1a3 Axel Rasmussen   2021-03-18  72  			      unsigned long len, bool *mmap_changing);
ffd05793963a44b Shaohua Li       2020-04-06  73  extern int mwriteprotect_range(struct mm_struct *dst_mm,
ffd05793963a44b Shaohua Li       2020-04-06  74  			       unsigned long start, unsigned long len,
ffd05793963a44b Shaohua Li       2020-04-06  75  			       bool enable_wp, bool *mmap_changing);
c1a4de99fada21e Andrea Arcangeli 2015-09-04  76  
932b18e0aec65ac Andrea Arcangeli 2015-09-04  77  /* mm helpers */
932b18e0aec65ac Andrea Arcangeli 2015-09-04  78  static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
932b18e0aec65ac Andrea Arcangeli 2015-09-04  79  					struct vm_userfaultfd_ctx vm_ctx)
932b18e0aec65ac Andrea Arcangeli 2015-09-04  80  {
a905086c85cb076 Lokesh Gidra     2024-01-16  81  	return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
932b18e0aec65ac Andrea Arcangeli 2015-09-04 @82  }
932b18e0aec65ac Andrea Arcangeli 2015-09-04  83  

:::::: The code at line 82 was first introduced by commit
:::::: 932b18e0aec65acb089f4bd8761ee85e70f8eb6a userfaultfd: linux/userfaultfd_k.h

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
