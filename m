Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058F3481B1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 00:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515079; cv=none; b=Y6MbovDJWD59TQpUB0TYluFV6EMb3zRFq1k0soBwUh8wnyKa8i885Wy3gaZanYQfYGPMbbka1QAmWWATX1BFq/L1Xj967XZxEu3R8jiw4bZ0sP2pji1jKgIp4NKRFsDRHJ6LAYZ6Vbmt8stHyLu1LW699gxHySGhtfahWvP5WA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515079; c=relaxed/simple;
	bh=WeGRs8e4D4BCZNnoSq43GGMjJk4LP4r7l2Unq1K26Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AoWM/FDldj6hPqFuYDrS4JLPHUaP7xWJXUPz9mAAAzajXOVlsyzHqnKXQ6rFYGvZfPJMwdyJJCOTxRSVBHSHsfzoUihXj1XXp0UgEBf6fK0hi0ntchNBmqPx188TVqX+Wa8uud6+2JbjvpyAnuAjtzQgPXV1g7ck5FnitghgoS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A55Nfgbq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A55Nfgbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749515077; x=1781051077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WeGRs8e4D4BCZNnoSq43GGMjJk4LP4r7l2Unq1K26Hc=;
  b=A55NfgbqpPijnNUoH9/hqPZYKZV+M7xG/EDKSYm6QDzkJh15Tf5EWNP9
   QPKaqYpVwtgM8Db4YqHSsAoKyGtS/KywW+kv02wOzpSEME4tUERaY9r/I
   Xpi8uy3QCzxTO/C68dY9gMlKxkuLDrZHDLQGT04m57Jy1etRdYrA+wZq9
   pOe0Njek83W6uv01GQS6XjpECyBJL5SNbRAAQ2acSrK2CpER31btB7c7e
   BSLSPrfpGkEJiFn+Iu7GGP0ZAVbnN87n+kEsdYzMSpczIA+jv6Jcd1r0w
   PiQY+ksYqOqUpEBMHB22V35QHExEb3jup3HNePxPN8ZZgOKtGTjM2kGxo
   g==;
X-CSE-ConnectionGUID: eG5onAoXSEOhUVni8NQLhg==
X-CSE-MsgGUID: UC8NcV40TEiZPSC12/3a5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62963111"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="62963111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 17:24:36 -0700
X-CSE-ConnectionGUID: MCAqGqy4QViW/DyryxnMWw==
X-CSE-MsgGUID: m2EG8EphSuesBuOjA1VFKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="169846594"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2025 17:24:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOmn2-0007a1-0K;
	Tue, 10 Jun 2025 00:24:32 +0000
Date: Tue, 10 Jun 2025 08:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yushan Wang <wangyushan12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2380/2380]
 drivers/soc/hisilicon/hisi_soc_cache_framework.c:199:31: sparse: sparse:
 dereference of noderef expression
Message-ID: <202506100815.v13KJR58-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a7f4bf73c34996ee6cdda292e8f906a9c30879de
commit: e6ecc3b028b8c3151c7ca3f4bd53e6385db72f93 [2380/2380] soc cache: Add framework driver for HiSilicon SoC cache
config: arm64-randconfig-r112-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100815.v13KJR58-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250610/202506100815.v13KJR58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100815.v13KJR58-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/soc/hisilicon/hisi_soc_cache_framework.c:43:5: sparse: sparse: context imbalance in 'hisi_soc_cache_maintain' - different lock contexts for basic block
   drivers/soc/hisilicon/hisi_soc_cache_framework.c:148:9: sparse: sparse: context imbalance in 'hisi_soc_cache_inst_del' - wrong count at exit
>> drivers/soc/hisilicon/hisi_soc_cache_framework.c:199:31: sparse: sparse: dereference of noderef expression
   drivers/soc/hisilicon/hisi_soc_cache_framework.c:205:39: sparse: sparse: dereference of noderef expression
   drivers/soc/hisilicon/hisi_soc_cache_framework.c:205:39: sparse: sparse: dereference of noderef expression
   drivers/soc/hisilicon/hisi_soc_cache_framework.c:206:21: sparse: sparse: dereference of noderef expression
   drivers/soc/hisilicon/hisi_soc_cache_framework.c:315:9: sparse: sparse: context imbalance in 'hisi_soc_cache_dbg_get_inst_num' - different lock contexts for basic block

vim +199 drivers/soc/hisilicon/hisi_soc_cache_framework.c

    42	
  > 43	int hisi_soc_cache_maintain(phys_addr_t addr, size_t size,
    44				    enum hisi_soc_cache_maint_type mnt_type)
    45	{
    46		struct hisi_soc_comp_inst *inst;
    47		struct list_head *head;
    48		int ret = -EOPNOTSUPP;
    49	
    50		if (mnt_type >= HISI_CACHE_MAINT_MAX)
    51			return -EINVAL;
    52	
    53		guard(spinlock)(&soc_cache_devs[HISI_SOC_HHA].lock);
    54	
    55		head = &soc_cache_devs[HISI_SOC_HHA].node;
    56		list_for_each_entry(inst, head, node) {
    57			ret = inst->comp->ops->do_maintain(inst->comp, addr, size,
    58							   mnt_type);
    59			if (ret)
    60				return ret;
    61		}
    62	
    63		list_for_each_entry(inst, head, node) {
    64			ret = inst->comp->ops->poll_maintain_done(inst->comp, addr,
    65								  size, mnt_type);
    66			if (ret)
    67				return ret;
    68		}
    69	
    70		return ret;
    71	}
    72	EXPORT_SYMBOL_GPL(hisi_soc_cache_maintain);
    73	
    74	static int hisi_soc_cache_maint_pte_entry(pte_t *pte, unsigned long addr,
    75					unsigned long next, struct mm_walk *walk)
    76	{
    77	#ifdef HISI_SOC_CACHE_LLT
    78		unsigned int mnt_type = *((unsigned int *)walk->priv);
    79	#else
    80		unsigned int mnt_type = *((unsigned int *)walk->private);
    81	#endif
    82		size_t size = next - addr;
    83		phys_addr_t paddr;
    84	
    85		if (!pte_present(ptep_get(pte)))
    86			return -EINVAL;
    87	
    88		paddr = PFN_PHYS(pte_pfn(*pte)) + offset_in_page(addr);
    89	
    90		return hisi_soc_cache_maintain(paddr, size, mnt_type);
    91	}
    92	
    93	static const struct mm_walk_ops hisi_soc_cache_maint_walk = {
    94		.pte_entry = hisi_soc_cache_maint_pte_entry,
    95		.walk_lock = PGWALK_RDLOCK,
    96	};
    97	
    98	static int hisi_soc_cache_inst_check(const struct hisi_soc_comp *comp,
    99					     enum hisi_soc_comp_type comp_type)
   100	{
   101		/* Different types of component could have different ops. */
   102		switch (comp_type) {
   103		case HISI_SOC_HHA:
   104			if (!comp->ops->do_maintain || !comp->ops->poll_maintain_done)
   105				return -EINVAL;
   106			break;
   107		default:
   108			return -EINVAL;
   109		}
   110	
   111		return 0;
   112	}
   113	
   114	static int hisi_soc_cache_inst_add(struct hisi_soc_comp *comp,
   115					   enum hisi_soc_comp_type comp_type)
   116	{
   117		struct hisi_soc_comp_inst *comp_inst;
   118		int ret;
   119	
   120		ret = hisi_soc_cache_inst_check(comp, comp_type);
   121		if (ret)
   122			return ret;
   123	
   124		comp_inst = kzalloc(sizeof(*comp_inst), GFP_KERNEL);
   125		if (!comp_inst)
   126			return -ENOMEM;
   127	
   128		comp_inst->comp = comp;
   129	
   130		scoped_guard(spinlock, &soc_cache_devs[comp_type].lock) {
   131			list_add_tail(&comp_inst->node,
   132				      &soc_cache_devs[comp_type].node);
   133			soc_cache_devs[comp_type].inst_num++;
   134		}
   135	
   136		return 0;
   137	}
   138	
   139	/*
   140	 * When @comp is NULL, it means to delete all instances of @comp_type.
   141	 */
   142	static void hisi_soc_cache_inst_del(struct hisi_soc_comp *comp,
   143					    enum hisi_soc_comp_type comp_type)
   144	{
   145		struct hisi_soc_comp_inst *inst, *tmp;
   146	
   147		guard(spinlock)(&soc_cache_devs[comp_type].lock);
   148		list_for_each_entry_safe(inst, tmp, &soc_cache_devs[comp_type].node,
   149					 node) {
   150			if (comp && comp != inst->comp)
   151				continue;
   152	
   153			if (soc_cache_devs[comp_type].inst_num > 0)
   154				soc_cache_devs[comp_type].inst_num--;
   155	
   156			list_del(&inst->node);
   157			kfree(inst);
   158	
   159			/* Stop the loop if we have already deleted @comp. */
   160			if (comp)
   161				break;
   162		}
   163	}
   164	
   165	int hisi_soc_comp_inst_add(struct hisi_soc_comp *comp)
   166	{
   167		int ret, i = 0;
   168	
   169		if (!comp || !comp->ops || comp->comp_type == 0)
   170			return -EINVAL;
   171	
   172		for_each_set_bit_from(i, &comp->comp_type, SOC_COMP_TYPE_MAX) {
   173			ret = hisi_soc_cache_inst_add(comp, i);
   174			if (ret)
   175				return ret;
   176		}
   177	
   178		return 0;
   179	}
   180	EXPORT_SYMBOL_GPL(hisi_soc_comp_inst_add);
   181	
   182	int hisi_soc_comp_inst_del(struct hisi_soc_comp *comp)
   183	{
   184		int i;
   185	
   186		if (!comp)
   187			return -EINVAL;
   188	
   189		for_each_set_bit(i, &comp->comp_type, SOC_COMP_TYPE_MAX)
   190			hisi_soc_cache_inst_del(comp, i);
   191	
   192		return 0;
   193	}
   194	EXPORT_SYMBOL_GPL(hisi_soc_comp_inst_del);
   195	
   196	static int __hisi_soc_cache_maintain(unsigned long __user vaddr, size_t size,
   197					     enum hisi_soc_cache_maint_type mnt_type)
   198	{
 > 199		unsigned long start = untagged_addr(vaddr);
   200		struct vm_area_struct *vma;
   201		int ret = 0;
   202	
   203		mmap_read_lock_killable(current->mm);
   204	
   205		vma = vma_lookup(current->mm, vaddr);
   206		if (!vma || vaddr + size > vma->vm_end || !size) {
   207			ret = -EINVAL;
   208			goto out;
   209		}
   210	
   211		/* User should have the write permission of target memory */
   212		if (!(vma->vm_flags & VM_WRITE)) {
   213			ret = -EINVAL;
   214			goto out;
   215		}
   216	
   217		ret = walk_page_range(current->mm, start, start + size,
   218				&hisi_soc_cache_maint_walk, &mnt_type);
   219	
   220	out:
   221		mmap_read_unlock(current->mm);
   222		return ret;
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
