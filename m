Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99070823
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747564464; cv=none; b=WsOAsYQrLOpxeas+0pTwoun16EnOH6nsT0rYk0+8Jlde7/nT/KkH3onOresN6h4kl2hUK90eDWSEFu8EvDrjcVekLJuXhokly72SRufpAyVr8//HgfGmF36Hdh2Q81o2Y7oqXhroV0vE4cfHBSDlrbGWe3hQ7EZt/hLpupHCYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747564464; c=relaxed/simple;
	bh=Kate86N6FcsCD8ebbzyq3yN0UdfP+nX8QHQ/i416Sew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3jRKISK8ZK4EpP+tDGD/X2Thfv8MvX6t0OSuGaZ2yR61qChF8RHS4Bsw79zB2qPS9kYrZAyKhVsWO0lJrwRMuRIcWvwhDx+xhS4bD2lu/cGSr3yv66TQBcznoavMpa0xpsda2UuExC8tSZj5lcm29pY67bp3/6oGXj3XGwYxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAJDFhYa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAJDFhYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747564462; x=1779100462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kate86N6FcsCD8ebbzyq3yN0UdfP+nX8QHQ/i416Sew=;
  b=AAJDFhYaNK80gjw2dObqrGTpz2HHJjZNbxkduEDvT57w+ZOdh7ya1qCI
   tnUGzuL/JWgQ1vlbJHt1Z2NGYubNSGy6ZHzHWmZg1C8E1117SM4mt86Vl
   twKpVtaL8y2O5tFVS53FvyDe5YTDS8kezNGUoB4SIwlacL+0ZrMMZ54Ur
   ZImAREFh/e7fh1QUpgGPC2hx/hX+HvKqzit5NZAN1/smR/puh5zct7/5u
   yCJGwKS15VmOLlnXz+bTButKEOWlycch1TaCtVbpViQKF9PtiVgEmAOtx
   vTB+rYo07voW/S+np+4oUn6xFsqWNAc5ynMJsZjmj9eJCoF0WQ/0joUlw
   w==;
X-CSE-ConnectionGUID: VIwnMSOKSfeHASba1zoKug==
X-CSE-MsgGUID: YszDZqMuRHinUB/B/inZhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49584556"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49584556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 03:34:21 -0700
X-CSE-ConnectionGUID: LAnrxQwgQMSLbAW+JclBIQ==
X-CSE-MsgGUID: WU8r1B0eT2uD1x659DAXGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="170033362"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 May 2025 03:34:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGbLV-000KkR-1J;
	Sun, 18 May 2025 10:34:17 +0000
Date: Sun, 18 May 2025 18:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: Or Har-Toov <ohartoov@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Michael Guralnik <michaelgur@nvidia.com>
Subject: [leon-rdma:rdma-next 20/44]
 drivers/infiniband/core/umem_odp.c:146:15: error: non-static declaration of
 'ib_umem_odp_alloc_implicit' follows static declaration
Message-ID: <202505181859.o8h4XaZH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   775e414cae844afbf0cf348ecd129e34fbdb3570
commit: ff1d56cd0215cc41f531d6ccb895ded5dc0b7e17 [20/44] IB/core: Annotate umem_mutex acquisition under fs_reclaim for lockdep
config: i386-buildonly-randconfig-003-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181859.o8h4XaZH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181859.o8h4XaZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181859.o8h4XaZH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/infiniband/core/umem_odp.c: In function 'ib_init_umem_odp':
>> drivers/infiniband/core/umem_odp.c:93:31: warning: unused variable 'npfns' [-Wunused-variable]
      93 |                 size_t ndmas, npfns;
         |                               ^~~~~
>> drivers/infiniband/core/umem_odp.c:93:24: warning: unused variable 'ndmas' [-Wunused-variable]
      93 |                 size_t ndmas, npfns;
         |                        ^~~~~
>> drivers/infiniband/core/umem_odp.c:90:24: warning: unused variable 'page_size' [-Wunused-variable]
      90 |                 size_t page_size = 1UL << umem_odp->page_shift;
         |                        ^~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from drivers/infiniband/core/umem_odp.c:34:
>> drivers/infiniband/core/umem_odp.c:146:15: error: non-static declaration of 'ib_umem_odp_alloc_implicit' follows static declaration
     146 | EXPORT_SYMBOL(ib_umem_odp_alloc_implicit);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL'
     146 | EXPORT_SYMBOL(ib_umem_odp_alloc_implicit);
         | ^~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:124:21: note: previous definition of 'ib_umem_odp_alloc_implicit' with type 'struct ib_umem_odp *(struct ib_device *, int)'
     124 | struct ib_umem_odp *ib_umem_odp_alloc_implicit(struct ib_device *device,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/core/umem_odp.c:209:15: error: non-static declaration of 'ib_umem_odp_alloc_child' follows static declaration
     209 | EXPORT_SYMBOL(ib_umem_odp_alloc_child);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:209:1: note: in expansion of macro 'EXPORT_SYMBOL'
     209 | EXPORT_SYMBOL(ib_umem_odp_alloc_child);
         | ^~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:159:1: note: previous definition of 'ib_umem_odp_alloc_child' with type 'struct ib_umem_odp *(struct ib_umem_odp *, long unsigned int,  size_t,  const struct mmu_interval_notifier_ops *)' {aka 'struct ib_umem_odp *(struct ib_umem_odp *, long unsigned int,  unsigned int,  const struct mmu_interval_notifier_ops *)'}
     159 | ib_umem_odp_alloc_child(struct ib_umem_odp *root, unsigned long addr,
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/core/umem_odp.c:262:15: error: non-static declaration of 'ib_umem_odp_get' follows static declaration
     262 | EXPORT_SYMBOL(ib_umem_odp_get);
         |               ^~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:262:1: note: in expansion of macro 'EXPORT_SYMBOL'
     262 | EXPORT_SYMBOL(ib_umem_odp_get);
         | ^~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:224:21: note: previous definition of 'ib_umem_odp_get' with type 'struct ib_umem_odp *(struct ib_device *, long unsigned int,  size_t,  int,  const struct mmu_interval_notifier_ops *)' {aka 'struct ib_umem_odp *(struct ib_device *, long unsigned int,  unsigned int,  int,  const struct mmu_interval_notifier_ops *)'}
     224 | struct ib_umem_odp *ib_umem_odp_get(struct ib_device *device,
         |                     ^~~~~~~~~~~~~~~
>> drivers/infiniband/core/umem_odp.c:264:13: error: invalid storage class for function 'ib_umem_odp_free'
     264 | static void ib_umem_odp_free(struct ib_umem_odp *umem_odp)
         |             ^~~~~~~~~~~~~~~~
>> drivers/infiniband/core/umem_odp.c:290:15: error: non-static declaration of 'ib_umem_odp_release' follows static declaration
     290 | EXPORT_SYMBOL(ib_umem_odp_release);
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:290:1: note: in expansion of macro 'EXPORT_SYMBOL'
     290 | EXPORT_SYMBOL(ib_umem_odp_release);
         | ^~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:282:6: note: previous definition of 'ib_umem_odp_release' with type 'void(struct ib_umem_odp *)'
     282 | void ib_umem_odp_release(struct ib_umem_odp *umem_odp)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/core/umem_odp.c:417:15: error: non-static declaration of 'ib_umem_odp_map_dma_and_lock' follows static declaration
     417 | EXPORT_SYMBOL(ib_umem_odp_map_dma_and_lock);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:417:1: note: in expansion of macro 'EXPORT_SYMBOL'
     417 | EXPORT_SYMBOL(ib_umem_odp_map_dma_and_lock);
         | ^~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:311:5: note: previous definition of 'ib_umem_odp_map_dma_and_lock' with type 'int(struct ib_umem_odp *, u64,  u64,  u64,  bool)' {aka 'int(struct ib_umem_odp *, long long unsigned int,  long long unsigned int,  long long unsigned int,  _Bool)'}
     311 | int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/core/umem_odp.c:456:15: error: non-static declaration of 'ib_umem_odp_unmap_dma_pages' follows static declaration
     456 | EXPORT_SYMBOL(ib_umem_odp_unmap_dma_pages);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:83:41: note: in expansion of macro '_EXPORT_SYMBOL'
      83 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:456:1: note: in expansion of macro 'EXPORT_SYMBOL'
     456 | EXPORT_SYMBOL(ib_umem_odp_unmap_dma_pages);
         | ^~~~~~~~~~~~~
   drivers/infiniband/core/umem_odp.c:419:6: note: previous definition of 'ib_umem_odp_unmap_dma_pages' with type 'void(struct ib_umem_odp *, u64,  u64)' {aka 'void(struct ib_umem_odp *, long long unsigned int,  long long unsigned int)'}
     419 | void ib_umem_odp_unmap_dma_pages(struct ib_umem_odp *umem_odp, u64 virt,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/core/umem_odp.c:456:1: error: expected declaration or statement at end of input
     456 | EXPORT_SYMBOL(ib_umem_odp_unmap_dma_pages);
         | ^~~~~~~~~~~~~
>> drivers/infiniband/core/umem_odp.c:63:23: warning: variable 'start' set but not used [-Wunused-but-set-variable]
      63 |         unsigned long start;
         |                       ^~~~~


vim +/ib_umem_odp_alloc_implicit +146 drivers/infiniband/core/umem_odp.c

f25a546e65292b Jason Gunthorpe 2019-11-12   57  
15a9f67e286b37 Leon Romanovsky 2025-04-28   58  static int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
15a9f67e286b37 Leon Romanovsky 2025-04-28   59  			    const struct mmu_interval_notifier_ops *ops)
15a9f67e286b37 Leon Romanovsky 2025-04-28   60  {
15a9f67e286b37 Leon Romanovsky 2025-04-28   61  	struct ib_device *dev = umem_odp->umem.ibdev;
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   62  	size_t page_size = 1UL << umem_odp->page_shift;
f25a546e65292b Jason Gunthorpe 2019-11-12  @63  	unsigned long start;
f25a546e65292b Jason Gunthorpe 2019-11-12   64  	unsigned long end;
15a9f67e286b37 Leon Romanovsky 2025-04-28   65  	int ret;
15a9f67e286b37 Leon Romanovsky 2025-04-28   66  
15a9f67e286b37 Leon Romanovsky 2025-04-28   67  	umem_odp->umem.is_odp = 1;
15a9f67e286b37 Leon Romanovsky 2025-04-28   68  	mutex_init(&umem_odp->umem_mutex);
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   69  
f25a546e65292b Jason Gunthorpe 2019-11-12   70  	start = ALIGN_DOWN(umem_odp->umem.address, page_size);
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   71  	if (check_add_overflow(umem_odp->umem.address,
15a9f67e286b37 Leon Romanovsky 2025-04-28   72  			       (unsigned long)umem_odp->umem.length, &end))
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   73  		return -EOVERFLOW;
f25a546e65292b Jason Gunthorpe 2019-11-12   74  	end = ALIGN(end, page_size);
f25a546e65292b Jason Gunthorpe 2019-11-12   75  	if (unlikely(end < page_size))
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   76  		return -EOVERFLOW;
ff1d56cd0215cc Or Har-Toov     2025-05-08   77  	/*
ff1d56cd0215cc Or Har-Toov     2025-05-08   78  	 * The mmu notifier can be called within reclaim contexts and takes the
ff1d56cd0215cc Or Har-Toov     2025-05-08   79  	 * umem_mutex. This is rare to trigger in testing, teach lockdep about
ff1d56cd0215cc Or Har-Toov     2025-05-08   80  	 * it.
ff1d56cd0215cc Or Har-Toov     2025-05-08   81  	 */
ff1d56cd0215cc Or Har-Toov     2025-05-08   82  	if (IS_ENABLED(CONFIG_LOCKDEP)) {
ff1d56cd0215cc Or Har-Toov     2025-05-08   83  		fs_reclaim_acquire(GFP_KERNEL);
ff1d56cd0215cc Or Har-Toov     2025-05-08   84  		mutex_lock(&umem_odp->umem_mutex);
ff1d56cd0215cc Or Har-Toov     2025-05-08   85  		mutex_unlock(&umem_odp->umem_mutex);
ff1d56cd0215cc Or Har-Toov     2025-05-08   86  		fs_reclaim_release(GFP_KERNEL);
ff1d56cd0215cc Or Har-Toov     2025-05-08   87  	}
ff1d56cd0215cc Or Har-Toov     2025-05-08   88  
ff1d56cd0215cc Or Har-Toov     2025-05-08   89  	if (!umem_odp->is_implicit_odp) {
ff1d56cd0215cc Or Har-Toov     2025-05-08  @90  		size_t page_size = 1UL << umem_odp->page_shift;
ff1d56cd0215cc Or Har-Toov     2025-05-08   91  		unsigned long start;
ff1d56cd0215cc Or Har-Toov     2025-05-08   92  		unsigned long end;
ff1d56cd0215cc Or Har-Toov     2025-05-08  @93  		size_t ndmas, npfns;
204e3e5630c5d4 Jason Gunthorpe 2019-08-19   94  
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   95  	ret = hmm_dma_map_alloc(dev->dma_device, &umem_odp->map,
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   96  				(end - start) >> PAGE_SHIFT,
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   97  				1 << umem_odp->page_shift);
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   98  	if (ret)
1efe8c0670d6a6 Leon Romanovsky 2025-04-28   99  		return ret;
d07d1d70ce1ad1 Artemy Kovalyov 2017-01-18  100  
f25a546e65292b Jason Gunthorpe 2019-11-12  101  	ret = mmu_interval_notifier_insert(&umem_odp->notifier,
15a9f67e286b37 Leon Romanovsky 2025-04-28  102  					   umem_odp->umem.owning_mm, start,
15a9f67e286b37 Leon Romanovsky 2025-04-28  103  					   end - start, ops);
f25a546e65292b Jason Gunthorpe 2019-11-12  104  	if (ret)
1efe8c0670d6a6 Leon Romanovsky 2025-04-28  105  		goto out_free_map;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  106  
22d79c9a912c9d Jason Gunthorpe 2019-08-19  107  	return 0;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  108  
1efe8c0670d6a6 Leon Romanovsky 2025-04-28  109  out_free_map:
1efe8c0670d6a6 Leon Romanovsky 2025-04-28  110  	hmm_dma_map_free(dev->dma_device, &umem_odp->map);
22d79c9a912c9d Jason Gunthorpe 2019-08-19  111  	return ret;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  112  }
22d79c9a912c9d Jason Gunthorpe 2019-08-19  113  
f20bef6a951b6e Jason Gunthorpe 2019-08-19  114  /**
f20bef6a951b6e Jason Gunthorpe 2019-08-19  115   * ib_umem_odp_alloc_implicit - Allocate a parent implicit ODP umem
f20bef6a951b6e Jason Gunthorpe 2019-08-19  116   *
f20bef6a951b6e Jason Gunthorpe 2019-08-19  117   * Implicit ODP umems do not have a VA range and do not have any page lists.
f20bef6a951b6e Jason Gunthorpe 2019-08-19  118   * They exist only to hold the per_mm reference to help the driver create
f20bef6a951b6e Jason Gunthorpe 2019-08-19  119   * children umems.
f20bef6a951b6e Jason Gunthorpe 2019-08-19  120   *
c320e527e15483 Moni Shoua      2020-01-15  121   * @device: IB device to create UMEM
f20bef6a951b6e Jason Gunthorpe 2019-08-19  122   * @access: ib_reg_mr access flags
f20bef6a951b6e Jason Gunthorpe 2019-08-19  123   */
c320e527e15483 Moni Shoua      2020-01-15  124  struct ib_umem_odp *ib_umem_odp_alloc_implicit(struct ib_device *device,
f20bef6a951b6e Jason Gunthorpe 2019-08-19  125  					       int access)
f20bef6a951b6e Jason Gunthorpe 2019-08-19  126  {
f20bef6a951b6e Jason Gunthorpe 2019-08-19  127  	struct ib_umem *umem;
f20bef6a951b6e Jason Gunthorpe 2019-08-19  128  	struct ib_umem_odp *umem_odp;
f20bef6a951b6e Jason Gunthorpe 2019-08-19  129  
f20bef6a951b6e Jason Gunthorpe 2019-08-19  130  	if (access & IB_ACCESS_HUGETLB)
f20bef6a951b6e Jason Gunthorpe 2019-08-19  131  		return ERR_PTR(-EINVAL);
f20bef6a951b6e Jason Gunthorpe 2019-08-19  132  
f20bef6a951b6e Jason Gunthorpe 2019-08-19  133  	umem_odp = kzalloc(sizeof(*umem_odp), GFP_KERNEL);
f20bef6a951b6e Jason Gunthorpe 2019-08-19  134  	if (!umem_odp)
f20bef6a951b6e Jason Gunthorpe 2019-08-19  135  		return ERR_PTR(-ENOMEM);
f20bef6a951b6e Jason Gunthorpe 2019-08-19  136  	umem = &umem_odp->umem;
c320e527e15483 Moni Shoua      2020-01-15  137  	umem->ibdev = device;
f20bef6a951b6e Jason Gunthorpe 2019-08-19  138  	umem->writable = ib_access_writable(access);
f20bef6a951b6e Jason Gunthorpe 2019-08-19  139  	umem->owning_mm = current->mm;
f20bef6a951b6e Jason Gunthorpe 2019-08-19  140  	umem_odp->page_shift = PAGE_SHIFT;
f20bef6a951b6e Jason Gunthorpe 2019-08-19  141  
f25a546e65292b Jason Gunthorpe 2019-11-12  142  	umem_odp->tgid = get_task_pid(current->group_leader, PIDTYPE_PID);
15a9f67e286b37 Leon Romanovsky 2025-04-28  143  	ib_init_umem_implicit_odp(umem_odp);
f20bef6a951b6e Jason Gunthorpe 2019-08-19  144  	return umem_odp;
f20bef6a951b6e Jason Gunthorpe 2019-08-19  145  }
f20bef6a951b6e Jason Gunthorpe 2019-08-19 @146  EXPORT_SYMBOL(ib_umem_odp_alloc_implicit);
f20bef6a951b6e Jason Gunthorpe 2019-08-19  147  
f20bef6a951b6e Jason Gunthorpe 2019-08-19  148  /**
f20bef6a951b6e Jason Gunthorpe 2019-08-19  149   * ib_umem_odp_alloc_child - Allocate a child ODP umem under an implicit
f20bef6a951b6e Jason Gunthorpe 2019-08-19  150   *                           parent ODP umem
f20bef6a951b6e Jason Gunthorpe 2019-08-19  151   *
f20bef6a951b6e Jason Gunthorpe 2019-08-19  152   * @root: The parent umem enclosing the child. This must be allocated using
f20bef6a951b6e Jason Gunthorpe 2019-08-19  153   *        ib_alloc_implicit_odp_umem()
f20bef6a951b6e Jason Gunthorpe 2019-08-19  154   * @addr: The starting userspace VA
f20bef6a951b6e Jason Gunthorpe 2019-08-19  155   * @size: The length of the userspace VA
11708142bc3689 Colton Lewis    2020-06-21  156   * @ops: MMU interval ops, currently only @invalidate
f20bef6a951b6e Jason Gunthorpe 2019-08-19  157   */
f25a546e65292b Jason Gunthorpe 2019-11-12  158  struct ib_umem_odp *
f25a546e65292b Jason Gunthorpe 2019-11-12  159  ib_umem_odp_alloc_child(struct ib_umem_odp *root, unsigned long addr,
f25a546e65292b Jason Gunthorpe 2019-11-12  160  			size_t size,
f25a546e65292b Jason Gunthorpe 2019-11-12  161  			const struct mmu_interval_notifier_ops *ops)
22d79c9a912c9d Jason Gunthorpe 2019-08-19  162  {
22d79c9a912c9d Jason Gunthorpe 2019-08-19  163  	/*
22d79c9a912c9d Jason Gunthorpe 2019-08-19  164  	 * Caller must ensure that root cannot be freed during the call to
22d79c9a912c9d Jason Gunthorpe 2019-08-19  165  	 * ib_alloc_odp_umem.
22d79c9a912c9d Jason Gunthorpe 2019-08-19  166  	 */
22d79c9a912c9d Jason Gunthorpe 2019-08-19  167  	struct ib_umem_odp *odp_data;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  168  	struct ib_umem *umem;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  169  	int ret;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  170  
f20bef6a951b6e Jason Gunthorpe 2019-08-19  171  	if (WARN_ON(!root->is_implicit_odp))
f20bef6a951b6e Jason Gunthorpe 2019-08-19  172  		return ERR_PTR(-EINVAL);
f20bef6a951b6e Jason Gunthorpe 2019-08-19  173  
22d79c9a912c9d Jason Gunthorpe 2019-08-19  174  	odp_data = kzalloc(sizeof(*odp_data), GFP_KERNEL);
22d79c9a912c9d Jason Gunthorpe 2019-08-19  175  	if (!odp_data)
22d79c9a912c9d Jason Gunthorpe 2019-08-19  176  		return ERR_PTR(-ENOMEM);
22d79c9a912c9d Jason Gunthorpe 2019-08-19  177  	umem = &odp_data->umem;
47f725ee7b5f5c Jason Gunthorpe 2019-08-06  178  	umem->ibdev = root->umem.ibdev;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  179  	umem->length     = size;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  180  	umem->address    = addr;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  181  	umem->writable   = root->umem.writable;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  182  	umem->owning_mm  = root->umem.owning_mm;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  183  	odp_data->page_shift = PAGE_SHIFT;
f25a546e65292b Jason Gunthorpe 2019-11-12  184  	odp_data->notifier.ops = ops;
22d79c9a912c9d Jason Gunthorpe 2019-08-19  185  
a4e63bce1414df Jason Gunthorpe 2020-02-27  186  	/*
a4e63bce1414df Jason Gunthorpe 2020-02-27  187  	 * A mmget must be held when registering a notifier, the owming_mm only
a4e63bce1414df Jason Gunthorpe 2020-02-27  188  	 * has a mm_grab at this point.
a4e63bce1414df Jason Gunthorpe 2020-02-27  189  	 */
a4e63bce1414df Jason Gunthorpe 2020-02-27  190  	if (!mmget_not_zero(umem->owning_mm)) {
a4e63bce1414df Jason Gunthorpe 2020-02-27  191  		ret = -EFAULT;
a4e63bce1414df Jason Gunthorpe 2020-02-27  192  		goto out_free;
a4e63bce1414df Jason Gunthorpe 2020-02-27  193  	}
a4e63bce1414df Jason Gunthorpe 2020-02-27  194  
f25a546e65292b Jason Gunthorpe 2019-11-12  195  	odp_data->tgid = get_pid(root->tgid);
f25a546e65292b Jason Gunthorpe 2019-11-12  196  	ret = ib_init_umem_odp(odp_data, ops);
a4e63bce1414df Jason Gunthorpe 2020-02-27  197  	if (ret)
a4e63bce1414df Jason Gunthorpe 2020-02-27  198  		goto out_tgid;
a4e63bce1414df Jason Gunthorpe 2020-02-27  199  	mmput(umem->owning_mm);
a4e63bce1414df Jason Gunthorpe 2020-02-27  200  	return odp_data;
a4e63bce1414df Jason Gunthorpe 2020-02-27  201  
a4e63bce1414df Jason Gunthorpe 2020-02-27  202  out_tgid:
f25a546e65292b Jason Gunthorpe 2019-11-12  203  	put_pid(odp_data->tgid);
a4e63bce1414df Jason Gunthorpe 2020-02-27  204  	mmput(umem->owning_mm);
a4e63bce1414df Jason Gunthorpe 2020-02-27  205  out_free:
d07d1d70ce1ad1 Artemy Kovalyov 2017-01-18  206  	kfree(odp_data);
d07d1d70ce1ad1 Artemy Kovalyov 2017-01-18  207  	return ERR_PTR(ret);
d07d1d70ce1ad1 Artemy Kovalyov 2017-01-18  208  }
f20bef6a951b6e Jason Gunthorpe 2019-08-19 @209  EXPORT_SYMBOL(ib_umem_odp_alloc_child);
d07d1d70ce1ad1 Artemy Kovalyov 2017-01-18  210  
f20bef6a951b6e Jason Gunthorpe 2019-08-19  211  /**
261dc53f8ee037 Jason Gunthorpe 2019-08-19  212   * ib_umem_odp_get - Create a umem_odp for a userspace va
f20bef6a951b6e Jason Gunthorpe 2019-08-19  213   *
c320e527e15483 Moni Shoua      2020-01-15  214   * @device: IB device struct to get UMEM
261dc53f8ee037 Jason Gunthorpe 2019-08-19  215   * @addr: userspace virtual address to start at
261dc53f8ee037 Jason Gunthorpe 2019-08-19  216   * @size: length of region to pin
261dc53f8ee037 Jason Gunthorpe 2019-08-19  217   * @access: IB_ACCESS_xxx flags for memory being pinned
11708142bc3689 Colton Lewis    2020-06-21  218   * @ops: MMU interval ops, currently only @invalidate
261dc53f8ee037 Jason Gunthorpe 2019-08-19  219   *
261dc53f8ee037 Jason Gunthorpe 2019-08-19  220   * The driver should use when the access flags indicate ODP memory. It avoids
261dc53f8ee037 Jason Gunthorpe 2019-08-19  221   * pinning, instead, stores the mm for future page fault handling in
261dc53f8ee037 Jason Gunthorpe 2019-08-19  222   * conjunction with MMU notifiers.
f20bef6a951b6e Jason Gunthorpe 2019-08-19  223   */
c320e527e15483 Moni Shoua      2020-01-15  224  struct ib_umem_odp *ib_umem_odp_get(struct ib_device *device,
c320e527e15483 Moni Shoua      2020-01-15  225  				    unsigned long addr, size_t size, int access,
f25a546e65292b Jason Gunthorpe 2019-11-12  226  				    const struct mmu_interval_notifier_ops *ops)
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  227  {
261dc53f8ee037 Jason Gunthorpe 2019-08-19  228  	struct ib_umem_odp *umem_odp;
261dc53f8ee037 Jason Gunthorpe 2019-08-19  229  	int ret;
261dc53f8ee037 Jason Gunthorpe 2019-08-19  230  
f25a546e65292b Jason Gunthorpe 2019-11-12  231  	if (WARN_ON_ONCE(!(access & IB_ACCESS_ON_DEMAND)))
261dc53f8ee037 Jason Gunthorpe 2019-08-19  232  		return ERR_PTR(-EINVAL);
261dc53f8ee037 Jason Gunthorpe 2019-08-19  233  
261dc53f8ee037 Jason Gunthorpe 2019-08-19  234  	umem_odp = kzalloc(sizeof(struct ib_umem_odp), GFP_KERNEL);
261dc53f8ee037 Jason Gunthorpe 2019-08-19  235  	if (!umem_odp)
261dc53f8ee037 Jason Gunthorpe 2019-08-19  236  		return ERR_PTR(-ENOMEM);
261dc53f8ee037 Jason Gunthorpe 2019-08-19  237  
c320e527e15483 Moni Shoua      2020-01-15  238  	umem_odp->umem.ibdev = device;
261dc53f8ee037 Jason Gunthorpe 2019-08-19  239  	umem_odp->umem.length = size;
261dc53f8ee037 Jason Gunthorpe 2019-08-19  240  	umem_odp->umem.address = addr;
261dc53f8ee037 Jason Gunthorpe 2019-08-19  241  	umem_odp->umem.writable = ib_access_writable(access);
1eb23d04320a0b Colin Ian King  2021-12-04  242  	umem_odp->umem.owning_mm = current->mm;
f25a546e65292b Jason Gunthorpe 2019-11-12  243  	umem_odp->notifier.ops = ops;
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  244  
d2183c6f1958e6 Jason Gunthorpe 2019-05-20  245  	umem_odp->page_shift = PAGE_SHIFT;
74f75cda754eb6 Arnd Bergmann   2020-01-09  246  #ifdef CONFIG_HUGETLB_PAGE
9ff1b6466a291a Yishai Hadas    2019-12-22  247  	if (access & IB_ACCESS_HUGETLB)
9ff1b6466a291a Yishai Hadas    2019-12-22  248  		umem_odp->page_shift = HPAGE_SHIFT;
74f75cda754eb6 Arnd Bergmann   2020-01-09  249  #endif
0008b84ea9afe6 Artemy Kovalyov 2017-04-05  250  
f25a546e65292b Jason Gunthorpe 2019-11-12  251  	umem_odp->tgid = get_task_pid(current->group_leader, PIDTYPE_PID);
f25a546e65292b Jason Gunthorpe 2019-11-12  252  	ret = ib_init_umem_odp(umem_odp, ops);
261dc53f8ee037 Jason Gunthorpe 2019-08-19  253  	if (ret)
f25a546e65292b Jason Gunthorpe 2019-11-12  254  		goto err_put_pid;
261dc53f8ee037 Jason Gunthorpe 2019-08-19  255  	return umem_odp;
261dc53f8ee037 Jason Gunthorpe 2019-08-19  256  
f25a546e65292b Jason Gunthorpe 2019-11-12  257  err_put_pid:
f25a546e65292b Jason Gunthorpe 2019-11-12  258  	put_pid(umem_odp->tgid);
261dc53f8ee037 Jason Gunthorpe 2019-08-19  259  	kfree(umem_odp);
261dc53f8ee037 Jason Gunthorpe 2019-08-19  260  	return ERR_PTR(ret);
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  261  }
261dc53f8ee037 Jason Gunthorpe 2019-08-19 @262  EXPORT_SYMBOL(ib_umem_odp_get);
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  263  
15a9f67e286b37 Leon Romanovsky 2025-04-28 @264  static void ib_umem_odp_free(struct ib_umem_odp *umem_odp)
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  265  {
1efe8c0670d6a6 Leon Romanovsky 2025-04-28  266  	struct ib_device *dev = umem_odp->umem.ibdev;
1efe8c0670d6a6 Leon Romanovsky 2025-04-28  267  
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  268  	/*
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  269  	 * Ensure that no more pages are mapped in the umem.
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  270  	 *
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  271  	 * It is the driver's responsibility to ensure, before calling us,
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  272  	 * that the hardware will not attempt to access the MR any more.
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  273  	 */
9dc775e7f5508f Jason Gunthorpe 2019-10-01  274  	mutex_lock(&umem_odp->umem_mutex);
d2183c6f1958e6 Jason Gunthorpe 2019-05-20  275  	ib_umem_odp_unmap_dma_pages(umem_odp, ib_umem_start(umem_odp),
d2183c6f1958e6 Jason Gunthorpe 2019-05-20  276  				    ib_umem_end(umem_odp));
9dc775e7f5508f Jason Gunthorpe 2019-10-01  277  	mutex_unlock(&umem_odp->umem_mutex);
f25a546e65292b Jason Gunthorpe 2019-11-12  278  	mmu_interval_notifier_remove(&umem_odp->notifier);
1efe8c0670d6a6 Leon Romanovsky 2025-04-28  279  	hmm_dma_map_free(dev->dma_device, &umem_odp->map);
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  280  }
15a9f67e286b37 Leon Romanovsky 2025-04-28  281  
15a9f67e286b37 Leon Romanovsky 2025-04-28  282  void ib_umem_odp_release(struct ib_umem_odp *umem_odp)
15a9f67e286b37 Leon Romanovsky 2025-04-28  283  {
15a9f67e286b37 Leon Romanovsky 2025-04-28  284  	if (!umem_odp->is_implicit_odp)
15a9f67e286b37 Leon Romanovsky 2025-04-28  285  		ib_umem_odp_free(umem_odp);
15a9f67e286b37 Leon Romanovsky 2025-04-28  286  
0f9826f4753f74 Jason Gunthorpe 2020-03-04  287  	put_pid(umem_odp->tgid);
0446cad9ca385c Jason Gunthorpe 2019-08-19  288  	kfree(umem_odp);
fd7dbf035edcfb Jason Gunthorpe 2019-08-19  289  }
0446cad9ca385c Jason Gunthorpe 2019-08-19 @290  EXPORT_SYMBOL(ib_umem_odp_release);
8ada2c1c0c1d75 Shachar Raindel 2014-12-11  291  

:::::: The code at line 146 was first introduced by commit
:::::: f20bef6a951b6ef619655ed846113f706d0824d7 RDMA/odp: Make the three ways to create a umem_odp clear

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
