Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1CB3CDBA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461400; cv=none; b=BXSpC2Ke0sOSOHEQvQdZpo95sIhYG0jxWa2nQbMnbcHSyMCbxUC3m7iA8GhjxascnLTr63YIQR7+xjdsOgnb1L9YPXrXoxmlVd1+LejyRHYIA4mE9A6mDnbxjWJOSsjOLIwglzs2DLb+yR5bZnwl/CTUYhG+MsdzQs++eXWHPyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461400; c=relaxed/simple;
	bh=zghFeocSHaBvqyEUwZ5NwKQp3sj5aIWXBrCQvZRQ0rE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AoKyGmRCb0l5DywOgxJHUgCJwfTlorCdXGeDk9GSP6wcd6u6Olm4exywx455BhaHGcUp0kKHSyh+HU6UaWRGNw6ZpghxgZRYu71pXO0uCz2HjKnmUMxj//QtUyAzeK3Li/KmT3AyWzcK/1VVUcJVJlFCeRXTv3pKNnEQRFCfck0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DseDfVhs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DseDfVhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789461398; x=1820997398;
  h=date:from:to:cc:subject:message-id;
  bh=zghFeocSHaBvqyEUwZ5NwKQp3sj5aIWXBrCQvZRQ0rE=;
  b=DseDfVhsenlyhsGt3bOjTPNwWB+XmZviWzpMhMNhTeMTfeyjabL1V6K/
   f4sPR4hj5g1I3/IxRHe8JtVYeh6PBh6FDGYDIUl4fsrk5SUG7ex8LKFYg
   1k8IaUQG8oJA7LyZhFsDtf60v/5CTR9h55KYtI+hMmXdDtgBNNydfim2d
   A+Ghqkk4uEHc5/loiuCJ63iVMzinSYbKHsX3B7Vhrz/kOzeyTNuV3s6XR
   PLpVsRQ4HQWkEDVFcOBkuxkfkIbgZ5K3WauospxfyIHIRmGwAI39jLc80
   nKoopFywLvKwyUqsiewSUUn9j9tDgwGaKLNu2eX5Fvn4OhBDsG7vEcNvw
   w==;
X-CSE-ConnectionGUID: iMZNiStJSGWUxetUDbrhvw==
X-CSE-MsgGUID: tvMe4LQGQLC5IW6jpXzt/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112585883"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112585883"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:36:37 -0700
X-CSE-ConnectionGUID: 6XbjkFIlT5eavbLvZZPiCA==
X-CSE-MsgGUID: C0cJAR4dSUKw/bN8LhZEUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270267738"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2026 01:36:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6OeV-000000004Fh-0b7E;
	Tue, 15 Sep 2026 08:36:31 +0000
Date: Tue, 15 Sep 2026 16:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/iommu.c:153:58: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202609151626.e4d1AZ0S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: 9dabecc2a2c31f11239b0853839bfc860de071e0 [1/1] ANDROID: KVM: arm64: iommu: Add memcache for guest pvIOMMU
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260915/202609151626.e4d1AZ0S-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151626.e4d1AZ0S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151626.e4d1AZ0S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/iommu.c:153:58: sparse: sparse: Using plain integer as NULL pointer
   arch/arm64/kvm/iommu.c:162:50: sparse: sparse: Using plain integer as NULL pointer

vim +153 arch/arm64/kvm/iommu.c

    12	
  > 13	struct kvm_iommu_driver *iommu_driver;
    14	extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
    15	
    16	int kvm_iommu_register_driver(struct kvm_iommu_driver *kern_ops)
    17	{
    18		if (WARN_ON(!kern_ops))
    19			return -EINVAL;
    20	
    21		/*
    22		 * Paired with smp_load_acquire(&iommu_driver)
    23		 * Ensure memory stores happening during a driver
    24		 * init are observed before executing kvm iommu callbacks.
    25		 */
    26		return cmpxchg_release(&iommu_driver, NULL, kern_ops) ? -EBUSY : 0;
    27	}
    28	EXPORT_SYMBOL(kvm_iommu_register_driver);
    29	
    30	int kvm_iommu_init_hyp(struct kvm_iommu_ops *hyp_ops,
    31			       struct kvm_hyp_memcache *atomic_mc)
    32	{
    33		if (!hyp_ops)
    34			return -EINVAL;
    35	
    36		return kvm_call_hyp_nvhe(__pkvm_iommu_init, hyp_ops,
    37					 atomic_mc->head, atomic_mc->nr_pages);
    38	}
    39	EXPORT_SYMBOL(kvm_iommu_init_hyp);
    40	
    41	int kvm_iommu_init_driver(void)
    42	{
    43		if (!smp_load_acquire(&iommu_driver) || !iommu_driver->get_iommu_id_by_of) {
    44			kvm_err("pKVM enabled without an IOMMU driver, do not run confidential workloads in virtual machines\n");
    45			return 0;
    46		}
    47	
    48		kvm_hyp_iommu_domains = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
    49					get_order(KVM_IOMMU_DOMAINS_ROOT_SIZE));
    50		if (!kvm_hyp_iommu_domains)
    51			return -ENOMEM;
    52	
    53		kvm_hyp_iommu_domains = kern_hyp_va(kvm_hyp_iommu_domains);
    54	
    55		return iommu_driver->init_driver();
    56	}
    57	EXPORT_SYMBOL(kvm_iommu_init_driver);
    58	
    59	void kvm_iommu_remove_driver(void)
    60	{
    61		if (smp_load_acquire(&iommu_driver))
    62			iommu_driver->remove_driver();
    63	}
    64	
    65	
    66	pkvm_handle_t kvm_get_iommu_id_by_of(struct device_node *np)
    67	{
    68		if (!iommu_driver)
    69			return 0;
    70	
    71		return iommu_driver->get_iommu_id_by_of(np);
    72	}
    73	
    74	static pkvm_handle_t kvm_get_iommu_id(struct device *dev)
    75	{
    76		return kvm_get_iommu_id_by_of(dev_of_node(dev));
    77	}
    78	
    79	int pkvm_iommu_suspend(struct device *dev)
    80	{
    81		int device_id = kvm_get_iommu_id(dev);
    82	
    83		return kvm_call_hyp_nvhe(__pkvm_host_hvc_pd, device_id, 0);
    84	}
    85	EXPORT_SYMBOL(pkvm_iommu_suspend);
    86	
    87	int pkvm_iommu_resume(struct device *dev)
    88	{
    89		int device_id = kvm_get_iommu_id(dev);
    90	
    91		return kvm_call_hyp_nvhe(__pkvm_host_hvc_pd, device_id, 1);
    92	}
    93	EXPORT_SYMBOL(pkvm_iommu_resume);
    94	
    95	int kvm_iommu_share_hyp_sg(struct kvm_iommu_sg *sg, unsigned int nents)
    96	{
    97		size_t nr_pages = PAGE_ALIGN(sizeof(*sg) * nents) >> PAGE_SHIFT;
    98		phys_addr_t sg_pfn = virt_to_phys(sg) >> PAGE_SHIFT;
    99		int i;
   100		int ret;
   101	
   102		for (i = 0 ; i < nr_pages ; ++i) {
   103			ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, sg_pfn + i);
   104			if (ret)
   105				return ret;
   106		}
   107	
   108		return 0;
   109	}
   110	EXPORT_SYMBOL(kvm_iommu_share_hyp_sg);
   111	
   112	int kvm_iommu_unshare_hyp_sg(struct kvm_iommu_sg *sg, unsigned int nents)
   113	{
   114		size_t nr_pages = PAGE_ALIGN(sizeof(*sg) * nents) >> PAGE_SHIFT;
   115		phys_addr_t sg_pfn = virt_to_phys(sg) >> PAGE_SHIFT;
   116		int i;
   117		int ret;
   118	
   119		for (i = 0 ; i < nr_pages ; ++i) {
   120			ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, sg_pfn + i);
   121			if (ret)
   122				return ret;
   123		}
   124	
   125		return 0;
   126	}
   127	EXPORT_SYMBOL(kvm_iommu_unshare_hyp_sg);
   128	
   129	int kvm_iommu_device_num_ids(struct device *dev)
   130	{
   131		if (iommu_driver->get_device_iommu_num_ids)
   132			return iommu_driver->get_device_iommu_num_ids(dev);
   133		return 0;
   134	}
   135	EXPORT_SYMBOL_GPL(kvm_iommu_device_num_ids);
   136	
   137	int kvm_iommu_device_id(struct device *dev, u32 idx,
   138				pkvm_handle_t *out_iommu, u32 *out_sid)
   139	{
   140		if (iommu_driver->get_device_iommu_id)
   141			return iommu_driver->get_device_iommu_id(dev, idx, out_iommu, out_sid);
   142		return -ENODEV;
   143	}
   144	EXPORT_SYMBOL_GPL(kvm_iommu_device_id);
   145	
   146	int kvm_iommu_guest_alloc_mc(struct kvm_hyp_memcache *mc, u32 pgsize, u32 nr_pages)
   147	{
   148		u8 order = get_order(pgsize);
   149	
   150		/* Driver might have dedicated allocator especially if it needs large pages. */
   151		if (iommu_driver && iommu_driver->guest_alloc && iommu_driver->guest_free)
   152			return __topup_hyp_memcache(mc, nr_pages, iommu_driver->guest_alloc,
 > 153						    kvm_host_pa, 0, order);
   154	
   155		return topup_hyp_memcache(mc, nr_pages, order);
   156	}
   157	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
