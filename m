Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2493F9FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619623; cv=none; b=hDPLPqgBFrNWg42H+UNqM7BXKM6aTERoZDwI+EyXyx9BxS71wb4JzZb0NC9T0b1+a6Qz1K1TptDHjWotiYsfFy8bzD4qlLr0GkW2mSsGaqlIZe+fdCV66PiZZEa3LAQfhoi7g7C48JJNmA5zv46Zj+bxokB3ZlML1goU8Y913AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619623; c=relaxed/simple;
	bh=rPv1tCnkNa+VvwyXLvuBBya0JVOEQ1HbdTVUPPCL2CE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gQv/WK7mzxg9Le1oyKrUWHsZxDQeI6xB8Z+RYdycXLlimxproLVIZ4U4FHCuslSt0qnID5QZMnbfuZGhndNq3niomkC+bEnphJrFf+GzKBphEEAegfrZSc+ty9xZiDVp1ozf9bFHszw0sy4nWS/1EbPIuPwKWuuyoFfTfMNU6z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krBHkvSC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krBHkvSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774619622; x=1806155622;
  h=date:from:to:cc:subject:message-id;
  bh=rPv1tCnkNa+VvwyXLvuBBya0JVOEQ1HbdTVUPPCL2CE=;
  b=krBHkvSCSrvt1ITjhg000GqXEIByyXwlsBOjq92+U6XPlYNbRYcaqHzN
   TUzQ3f0XsmTScjPwttn1lhxGTZ2c1eg9yN8D0NcWmUf2lE3FAuV1a/aBW
   a1F1bZ5nuYlJZpPSQFrpwI9jZqhs4py51+rZKJAPeXNE/pqajdyD6I+Sp
   uK5EL2dQJ8gHkq3DHzRACM3eO1QFdb2JVzYB3cq7aIO8f8+6tT5mCj0gO
   tqBy3KHCwfy9mKN+7NxOFpHSnJmo6EUy1l24da9D5e2XlWWIxgDM3w5KN
   JxSyFg2lmsXsxmT/VJtKK1N09I73+ddfa+S2jHCGtrd0M28DIY862WMun
   A==;
X-CSE-ConnectionGUID: m3Br9mdVQQWtKIPPUyed7g==
X-CSE-MsgGUID: hbikG9LqQ6qn8HKs1Ug/Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98307704"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="98307704"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 06:53:41 -0700
X-CSE-ConnectionGUID: XS77X+HfRJ2E3ix5xDUY2g==
X-CSE-MsgGUID: UUfpFDZoQyGAkH1c9pEZAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="226919425"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2026 06:53:39 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w67d3-00000000ALB-15Cy;
	Fri, 27 Mar 2026 13:53:37 +0000
Date: Fri, 27 Mar 2026 21:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 4/4]
 include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202603272106.IALaEpg0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fc88a7504f0f262cc5b2e8a7f58b2a1108034856
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [4/4] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: i386-randconfig-r133-20260325 (https://download.01.org/0day-ci/archive/20260327/202603272106.IALaEpg0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272106.IALaEpg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272106.IALaEpg0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mmap.c: note: in included file (through include/linux/hugetlb.h):
>> include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx *
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx [noderef] __rcu *
>> include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx *
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx [noderef] __rcu *
--
>> fs/userfaultfd.c:757:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct userfaultfd_ctx [noderef] __rcu *ctx @@     got struct userfaultfd_ctx *[assigned] ctx @@
   fs/userfaultfd.c:757:29: sparse:     expected struct userfaultfd_ctx [noderef] __rcu *ctx
   fs/userfaultfd.c:757:29: sparse:     got struct userfaultfd_ctx *[assigned] ctx
>> fs/userfaultfd.c:771:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct userfaultfd_ctx *ctx @@     got struct userfaultfd_ctx [noderef] __rcu *ctx @@
   fs/userfaultfd.c:771:45: sparse:     expected struct userfaultfd_ctx *ctx
   fs/userfaultfd.c:771:45: sparse:     got struct userfaultfd_ctx [noderef] __rcu *ctx
>> fs/userfaultfd.c:1483:64: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct userfaultfd_ctx [noderef] __rcu *ctx @@     got struct userfaultfd_ctx *ctx @@
   fs/userfaultfd.c:1483:64: sparse:     expected struct userfaultfd_ctx [noderef] __rcu *ctx
   fs/userfaultfd.c:1483:64: sparse:     got struct userfaultfd_ctx *ctx

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
