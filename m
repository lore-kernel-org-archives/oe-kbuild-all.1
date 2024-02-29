Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920558118
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198184; cv=none; b=j/WUZ/AtcKrlg1hab+JuvVeu3CPEngkyajYVzjKMYYbK+r62zAwA4ie/wvRwbRmCcvcYCxvnz+qqXqetzNrP0umC4g6XHNO0RhxI8PAJylSPWxKThCHyWVL7wwOVzDoDPATBbf3zs/LkJwPjk960XKPih9MDbniqCwS6qnUXjhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198184; c=relaxed/simple;
	bh=3M/HcTvPvvs6rsgsp/Whn96VrSx/P3m229kGXhTnz6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LWTclMjXkj2T5x5nq/RS+J/HYqNbineb5TynypEh8J1LUbSCJT6qBMUqmgd9EjuX/iIchQb0hoPJBHV/lKxpQ7RBr2oOHHCDVdt1FVoBYDViTO0flM32yxdZV4AwZSx684853vFISDyOWFwaJImsSwZ+YbK3yASz8uCUYK8PgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1nr9Ibv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1nr9Ibv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709198182; x=1740734182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3M/HcTvPvvs6rsgsp/Whn96VrSx/P3m229kGXhTnz6w=;
  b=k1nr9IbvPsAP5W5U4qU18iXsxVjeMTq5IAH55KoXE515y4rpIj1HTBlo
   jmWjJoU2dGCdke1m6iMGQuWNUF+7qZsCdB+dqfggrkqA4J/k0syeUhbIV
   HcUhJg+KYuGyDjJSORV9WjdjMHtC35U4EmOGQ6CY4/Qf12h63HtEoWv4s
   T+2sduYHMwpzMacoT1eWiNmOEL8FVPlCNPU2t0RowCxb7rqLPOrlNX1UO
   J8q4/40XIfNVO1nZXywUR8ZIa8GdLB4pjxgCqeGi8JGbgTU/KpmrXa19d
   c7aCeBabYD2qP0qG/Ba+sqEAnrcFNWUCuvzLX7EkwPDup8liTxqgFV9PO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="15066756"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="15066756"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 01:16:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7675537"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Feb 2024 01:16:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfcWF-000CoP-1L;
	Thu, 29 Feb 2024 09:16:07 +0000
Date: Thu, 29 Feb 2024 17:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void
 function
Message-ID: <202402291709.icBG9TaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   582c6d188ec138d8ed9c6ef235bf5698d80d7d6b
commit: 582c6d188ec138d8ed9c6ef235bf5698d80d7d6b [1/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: i386-randconfig-012-20240229 (https://download.01.org/0day-ci/archive/20240229/202402291709.icBG9TaS-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291709.icBG9TaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291709.icBG9TaS-lkp@intel.com/

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
                    from mm/mmap.c:29:
>> include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +82 include/linux/userfaultfd_k.h

4a5cf92412ab1a Axel Rasmussen   2021-03-18  58  
0b161cf6fc3df5 Axel Rasmussen   2021-05-11  59  extern int mfill_atomic_install_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
0b161cf6fc3df5 Axel Rasmussen   2021-05-11  60  				    struct vm_area_struct *dst_vma,
0b161cf6fc3df5 Axel Rasmussen   2021-05-11  61  				    unsigned long dst_addr, struct page *page,
0b161cf6fc3df5 Axel Rasmussen   2021-05-11  62  				    bool newly_allocated, bool wp_copy);
0b161cf6fc3df5 Axel Rasmussen   2021-05-11  63  
c1a4de99fada21 Andrea Arcangeli 2015-09-04  64  extern ssize_t mcopy_atomic(struct mm_struct *dst_mm, unsigned long dst_start,
df2cc96e77011c Mike Rapoport    2018-06-07  65  			    unsigned long src_start, unsigned long len,
72981e0e7b609c Andrea Arcangeli 2020-04-06  66  			    bool *mmap_changing, __u64 mode);
c1a4de99fada21 Andrea Arcangeli 2015-09-04  67  extern ssize_t mfill_zeropage(struct mm_struct *dst_mm,
c1a4de99fada21 Andrea Arcangeli 2015-09-04  68  			      unsigned long dst_start,
df2cc96e77011c Mike Rapoport    2018-06-07  69  			      unsigned long len,
df2cc96e77011c Mike Rapoport    2018-06-07  70  			      bool *mmap_changing);
4a5cf92412ab1a Axel Rasmussen   2021-03-18  71  extern ssize_t mcopy_continue(struct mm_struct *dst_mm, unsigned long dst_start,
4a5cf92412ab1a Axel Rasmussen   2021-03-18  72  			      unsigned long len, bool *mmap_changing);
ffd05793963a44 Shaohua Li       2020-04-06  73  extern int mwriteprotect_range(struct mm_struct *dst_mm,
ffd05793963a44 Shaohua Li       2020-04-06  74  			       unsigned long start, unsigned long len,
ffd05793963a44 Shaohua Li       2020-04-06  75  			       bool enable_wp, bool *mmap_changing);
c1a4de99fada21 Andrea Arcangeli 2015-09-04  76  
932b18e0aec65a Andrea Arcangeli 2015-09-04  77  /* mm helpers */
932b18e0aec65a Andrea Arcangeli 2015-09-04  78  static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
932b18e0aec65a Andrea Arcangeli 2015-09-04  79  					struct vm_userfaultfd_ctx vm_ctx)
932b18e0aec65a Andrea Arcangeli 2015-09-04  80  {
582c6d188ec138 Lokesh Gidra     2024-01-16 @81  	return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
932b18e0aec65a Andrea Arcangeli 2015-09-04 @82  }
932b18e0aec65a Andrea Arcangeli 2015-09-04  83  

:::::: The code at line 82 was first introduced by commit
:::::: 932b18e0aec65acb089f4bd8761ee85e70f8eb6a userfaultfd: linux/userfaultfd_k.h

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
