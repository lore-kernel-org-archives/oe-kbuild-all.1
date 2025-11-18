Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268BF2DCC01
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446371; cv=none; b=rwBRTBizbDXRNzI2tRVTCrpKBYpVs3kl0Mnrz4OpJYRuSTR4HS3Uijp+2rYs0T77JsCT6oGkToi4OcI2+xRcJaxGjnR6gBaOM1pwPbGxscNNkD9oxQX22u16inNDCoTQ4MGEDGPvt5Wt9vC8nMMby8+8s7wsHDt80LIqJsoWZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446371; c=relaxed/simple;
	bh=F4IqzDRNb6EAbw0p1hm6RKNPkhCGvTS72A9x6a/FMbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJmTL4bA0JkAqK8xl2oUuvsf1VIliuerm+DJgBiSEpGL5y63hMseh81f6AaFF1hnu6/fZ9aOKaKrQPbnNu2hRnhumr3lk29/bWkZOte4B3xXPQAZddI+202rSG+urBPHI8n1XwBh269wuxBk9eDnynnHgureOjWvuzYTi2CRPqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXRBvZZ/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXRBvZZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763446368; x=1794982368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4IqzDRNb6EAbw0p1hm6RKNPkhCGvTS72A9x6a/FMbo=;
  b=QXRBvZZ/zVS6D0Saio119I/yeTxedcHFvae7mEE0Cb0BMoVINkDLPG7M
   +vBiqxtxN0bPQP4DbFjHV42AcMKycCJd7u4yNiYb5Xx5IIPpLYNWDi+7X
   p7cLakK0PZa7nC8NVf2x65HvQp+KtOMKkFQzL+PNUXaV93tSuiyfy6Jc/
   Fh52wIi/9B0Ny/zkMwKI8hjC+y79bEcJZlmLGj1SiWFRBI5aNiVJ8Uuz8
   bDvwDQ5MjxDzoljY6Xn3A9Y+rmghKMHaD3SB9vkwxgcDxT+VyOpuRQCM5
   3BAAsayyv4EpzECHg3bLkYHdlg+530vj+is7mOHvZnr0cI49LaoLmQX0P
   Q==;
X-CSE-ConnectionGUID: NtkFHaFHTZi2sIEUOU3mqg==
X-CSE-MsgGUID: UNFSxkMYS4CXkBfkakCVyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65614822"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65614822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 22:12:47 -0800
X-CSE-ConnectionGUID: 0Q5grkLHTmSMCoTS0HJNQQ==
X-CSE-MsgGUID: 9yxnMxlpR8aIuPKX2nAuMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190832482"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2025 22:12:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLExH-0001Nw-0t;
	Tue, 18 Nov 2025 06:12:43 +0000
Date: Tue, 18 Nov 2025 14:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214] mm/gmem_phys.c:245:19: sparse: sparse:
 symbol 'gm_evict_page_locked' was not declared. Should it be static?
Message-ID: <202511181354.QrCo9qqP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c1201208f61f497ac8e2b9826e822e261af1d334
commit: 8f4f66a9d851f366942e8ee319292e41ad2baa95 [3214/3214] gmem: support swapping heterogeneous memory
config: x86_64-randconfig-r111-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181354.QrCo9qqP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181354.QrCo9qqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181354.QrCo9qqP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/gmem_phys.c:21:1: sparse: sparse: symbol 'hnode_lock' was not declared. Should it be static?
>> mm/gmem_phys.c:245:19: sparse: sparse: symbol 'gm_evict_page_locked' was not declared. Should it be static?
>> mm/gmem_phys.c:345:19: sparse: sparse: symbol 'gm_evict_page' was not declared. Should it be static?

vim +/gm_evict_page_locked +245 mm/gmem_phys.c

   244	
 > 245	enum gm_evict_ret gm_evict_page_locked(struct gm_page *gm_page)
   246	{
   247		struct gm_dev *gm_dev;
   248		struct gm_mapping *gm_mapping;
   249		struct vm_area_struct *vma;
   250		struct mm_struct *mm;
   251		struct page *page;
   252		struct device *dma_dev;
   253		unsigned long va;
   254		struct folio *folio = NULL;
   255		struct gm_fault_t gmf = {
   256			.size = HPAGE_SIZE,
   257			.copy = true
   258		};
   259		enum gm_evict_ret ret = GM_EVICT_SUCCESS;
   260		enum gm_ret gm_ret;
   261	
   262		gm_dev = get_gm_dev(gm_page->hnid);
   263		if (!gm_dev)
   264			return GM_EVICT_DEVERR;
   265	
   266		spin_lock(&gm_page->rmap_lock);
   267		if (!gm_page->mm) {
   268			/* Evicting gm_page conflicts with unmap.*/
   269			ret = GM_EVICT_UNMAP;
   270			goto rmap_unlock;
   271		}
   272	
   273		mm = gm_page->mm;
   274		va = gm_page->va;
   275		vma = find_vma(mm, va);
   276		if (!vma || !vma->vm_obj) {
   277			gmem_err("%s: cannot find vma or vma->vm_obj is null for va %lx", __func__, va);
   278			ret = GM_EVICT_UNMAP;
   279			goto rmap_unlock;
   280		}
   281	
   282		gm_mapping = vm_object_lookup(vma->vm_obj, va);
   283		if (!gm_mapping) {
   284			gmem_err("%s: no gm_mapping for va %lx", __func__, va);
   285			ret = GM_EVICT_UNMAP;
   286			goto rmap_unlock;
   287		}
   288	
   289		spin_unlock(&gm_page->rmap_lock);
   290	
   291		mutex_lock(&gm_mapping->lock);
   292		if (!gm_mapping_device(gm_mapping)) {
   293			/* Evicting gm_page conflicts with unmap.*/
   294			ret = GM_EVICT_UNMAP;
   295			goto gm_mapping_unlock;
   296		}
   297	
   298		if (gm_mapping->gm_page != gm_page) {
   299			/* gm_mapping maps to another gm_page. */
   300			ret = GM_EVICT_UNMAP;
   301			goto gm_mapping_unlock;
   302		}
   303	
   304		folio = vma_alloc_folio(GFP_TRANSHUGE, HPAGE_PMD_ORDER, vma, va, true);
   305		if (!folio) {
   306			gmem_err("%s: allocate host page failed.", __func__);
   307			ret = GM_EVICT_FALLBACK;
   308			goto gm_mapping_unlock;
   309		}
   310		page = &folio->page;
   311	
   312		gmf.mm = mm;
   313		gmf.va = va;
   314		gmf.dev = gm_dev;
   315		gmf.pfn = gm_page->dev_pfn;
   316		dma_dev = gm_dev->dma_dev;
   317		gmf.dma_addr = dma_map_page(dma_dev, page, 0, HPAGE_SIZE, DMA_BIDIRECTIONAL);
   318		if (dma_mapping_error(dma_dev, gmf.dma_addr)) {
   319			gmem_err("%s: dma map failed.", __func__);
   320			ret = GM_EVICT_FALLBACK;
   321			goto gm_mapping_unlock;
   322		}
   323	
   324		gm_ret = gm_dev->mmu->peer_unmap(&gmf);
   325		if (gm_ret != GM_RET_SUCCESS) {
   326			gmem_err("%s: peer_unmap failed.", __func__);
   327			ret = GM_EVICT_DEVERR;
   328			goto dma_unmap;
   329		}
   330	
   331		gm_mapping_flags_set(gm_mapping, GM_MAPPING_CPU);
   332		gm_page_remove_rmap(gm_page);
   333		gm_mapping->page = page;
   334		put_gm_page(gm_page);
   335	dma_unmap:
   336		dma_unmap_page(dma_dev, gmf.dma_addr, HPAGE_SIZE, DMA_BIDIRECTIONAL);
   337	gm_mapping_unlock:
   338		mutex_unlock(&gm_mapping->lock);
   339		return ret;
   340	rmap_unlock:
   341		spin_unlock(&gm_page->rmap_lock);
   342		return ret;
   343	}
   344	
 > 345	enum gm_evict_ret gm_evict_page(struct gm_page *gm_page)
   346	{
   347		struct mm_struct *mm = gm_page->mm;
   348		enum gm_evict_ret ret;
   349	
   350		mmap_read_lock(mm);
   351		ret = gm_evict_page_locked(gm_page);
   352		mmap_read_unlock(mm);
   353		return ret;
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
