Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642D53016F3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009608; cv=none; b=CsjPEaagpO+JjnWBDBDisfK6KqHj0sF8SACOBfxjbZZrsvcN4fHXSjN/i50adjNVMjNhnfViZ+RUUTirebnpOLoTLo1ykRbzX6xjos75ItGYbd5VhtbWa9MqMGoHlC2fAF7SkRNyxTsj9EG7UbTYILNov4yAN1Vb+1nxiTc+3yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009608; c=relaxed/simple;
	bh=phfNPxny8RWXAHIm3gzPC2YHzQhlvyN/vB172RgFFU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtEcJksviuxgHtDh6rIAMglFXDitXdQI7GacTzmSvI0INm3HJGy1ueRixsS6RCpYwAGdbUlz4U/w60VxwYU/Z1TTAYWQkszvEtSwJDeqxxU1YuXsgWuYAphvOO6aTdC+3WB2i+S9EfCgLELOF5v53NkeOEzhpwme4/bJNEJy2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8TNGRO+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8TNGRO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009606; x=1794545606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phfNPxny8RWXAHIm3gzPC2YHzQhlvyN/vB172RgFFU4=;
  b=I8TNGRO+kqmkFBAn3NbzOyghErmlgjWtHJTsytOMHwbG4kv0NP6gqZpX
   WultD2HIYG/fgmM88K6nENwNvIcjeEjvCvdh4iIgrCTWcj6ZXMHC181QT
   df1PTYI+OhwIzC0nv67poArVIx60GHcTdi0uj9Z5E1Mn6IX3dExHD3lzr
   eqojLK8OT6SsLwEkJjumU40a6pk9xjw/Bk1N7BysQnhN7vq+xnW9YF0uF
   4jFz823zYY9InGUoXe3XYCda3EvymMWjMhWPRiHl7Bfzyo2I3fdPbyKbu
   12h6S9jf0H3AP7NRGXGa8Q90FLGnTpDx1qhfjmUMWNjUlKbmjbzU4Yu0U
   g==;
X-CSE-ConnectionGUID: A0bPAxCnQ0Ode2MM7JrzCw==
X-CSE-MsgGUID: YhZN58UDQrqZb11+L6wL5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65175891"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65175891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:23 -0800
X-CSE-ConnectionGUID: M01eIRNlRqyjVWBV70QpTA==
X-CSE-MsgGUID: ORWe4whuTQOIUJfrQNpEzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="190138860"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2025 20:53:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004uC-1e;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3135/3135] mm/gmem_phys.c:245:19: warning: no
 previous prototype for function 'gm_evict_page_locked'
Message-ID: <202511130834.0qWsUngh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbfb361fe93de1a562df2ace860f64c4067abfdc
commit: 8f4f66a9d851f366942e8ee319292e41ad2baa95 [3135/3135] gmem: support swapping heterogeneous memory
config: arm64-randconfig-001-20251112 (https://download.01.org/0day-ci/archive/20251113/202511130834.0qWsUngh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130834.0qWsUngh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130834.0qWsUngh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/gmem_phys.c:245:19: warning: no previous prototype for function 'gm_evict_page_locked' [-Wmissing-prototypes]
     245 | enum gm_evict_ret gm_evict_page_locked(struct gm_page *gm_page)
         |                   ^
   mm/gmem_phys.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | enum gm_evict_ret gm_evict_page_locked(struct gm_page *gm_page)
         | ^
         | static 
>> mm/gmem_phys.c:345:19: warning: no previous prototype for function 'gm_evict_page' [-Wmissing-prototypes]
     345 | enum gm_evict_ret gm_evict_page(struct gm_page *gm_page)
         |                   ^
   mm/gmem_phys.c:345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     345 | enum gm_evict_ret gm_evict_page(struct gm_page *gm_page)
         | ^
         | static 
   3 warnings generated.


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
