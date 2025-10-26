Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965C42550CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761442681; cv=none; b=odWRJfxrlGjHqlsikPnXXxl1LucxN5dUn5jrft7d2334iW++XIswnJ9DFp15aNOAQYGSy2V2oCrG6EWdcmhQPUWt/7OXPtjpH2k0b5qa5+cY4PfsAYYfvkBz/j/uvZ5YTSBnJM6zg/52+3mx6IHwKZRA8ruialAQjhmVdFT27sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761442681; c=relaxed/simple;
	bh=ek6reChcCWgn27RZsrHurLmIxDCn+lvjjjabe5H4OZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pzafmB6UKK1K+nFVxrh7+cUnQMxyjZHtP/7aAVD8EB6TBv71GPVdyrJXGkaYw0n7NiVZHX+bAP9ikzWedRmj+cHB8iHlhBFQQtwljlvI9ppQ0zA2J5ibvgVHHdo5fXwHR885mpK1HP1jnQ+NIf3JuirOWBVrRCm9RaNeHm/reu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPo8TV6+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPo8TV6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761442679; x=1792978679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ek6reChcCWgn27RZsrHurLmIxDCn+lvjjjabe5H4OZ4=;
  b=SPo8TV6+/u204P8hSSEb+kTFAbZ+hquR0l0vxXZpKR+arQFDLh8xIE2O
   uAIqrU24Ut8hIxGXwoEgwHKi/nbRq5UTpgsWUZ1MLBD6FNlfS1CZsVjx0
   S5QkEsb4+caTMYDBobbHL55ukEkgGOzVNfQM2ARA2k/yFHSui5tEOX8cI
   AjSVPfe98+5Pt6ETRaytbboo/sXUj1v7l3F7nzu+MdAqJToMD7jnqThF8
   q6vybQOaCr+iCgeb4bSyL3P41WD6hL4WL7/IlD25jbMpRcKuTm9rqsoSn
   kVwlBflU1F8/tFOv/eVcT/NMefGTjKBkmtxDf5bNseN9OizJxOy/EsZYa
   A==;
X-CSE-ConnectionGUID: 1XmN4WJaQ5iwUYzyFf2+xg==
X-CSE-MsgGUID: pfOj3msOSDObuaL+b9WAew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86200218"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="86200218"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 18:37:59 -0700
X-CSE-ConnectionGUID: yP4jGFCBRYCViexeELUA1A==
X-CSE-MsgGUID: RMkve5ZrR5qn1QVW4jbdHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185095985"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2025 18:37:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCphi-000Fml-2q;
	Sun, 26 Oct 2025 01:37:54 +0000
Date: Sun, 26 Oct 2025 09:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1712/1712] mm/memory.c:1546:10: error:
 implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did
 you mean 'hugetlb_insert__hugepage_pte_by_pa'?
Message-ID: <202510260939.sMRD2n0t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ee55f6a88c1f70120d9cec8244c5cd10f0c4dce9
commit: 18f49509eef01d1ee6ed81899298994f2f88dd2a [1712/1712] ascend: share_pool: Use remap_pfn_range to share kva to uva
config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20251026/202510260939.sMRD2n0t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260939.sMRD2n0t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260939.sMRD2n0t-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'vm_insert_page':
>> mm/memory.c:1546:10: error: implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did you mean 'hugetlb_insert__hugepage_pte_by_pa'? [-Werror=implicit-function-declaration]
    1546 |   return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          hugetlb_insert__hugepage_pte_by_pa
   cc1: some warnings being treated as errors


vim +1546 mm/memory.c

  1504	
  1505	/**
  1506	 * vm_insert_page - insert single page into user vma
  1507	 * @vma: user vma to map to
  1508	 * @addr: target user address of this page
  1509	 * @page: source kernel page
  1510	 *
  1511	 * This allows drivers to insert individual pages they've allocated
  1512	 * into a user vma.
  1513	 *
  1514	 * The page has to be a nice clean _individual_ kernel allocation.
  1515	 * If you allocate a compound page, you need to have marked it as
  1516	 * such (__GFP_COMP), or manually just split the page up yourself
  1517	 * (see split_page()).
  1518	 *
  1519	 * NOTE! Traditionally this was done with "remap_pfn_range()" which
  1520	 * took an arbitrary page protection parameter. This doesn't allow
  1521	 * that. Your vma protection will have to be set up correctly, which
  1522	 * means that if you want a shared writable mapping, you'd better
  1523	 * ask for a shared writable mapping!
  1524	 *
  1525	 * The page does not need to be reserved.
  1526	 *
  1527	 * Usually this function is called from f_op->mmap() handler
  1528	 * under mm->mmap_sem write-lock, so it can change vma->vm_flags.
  1529	 * Caller must set VM_MIXEDMAP on vma if it wants to call this
  1530	 * function from other places, for example from page-fault handler.
  1531	 */
  1532	int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
  1533				struct page *page)
  1534	{
  1535		if (addr < vma->vm_start || addr >= vma->vm_end)
  1536			return -EFAULT;
  1537		if (!page_count(page))
  1538			return -EINVAL;
  1539		if (!(vma->vm_flags & VM_MIXEDMAP)) {
  1540			BUG_ON(down_read_trylock(&vma->vm_mm->mmap_sem));
  1541			BUG_ON(vma->vm_flags & VM_PFNMAP);
  1542			vma->vm_flags |= VM_MIXEDMAP;
  1543		}
  1544	
  1545		if (sp_check_hugepage(page))
> 1546			return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
  1547						vma->vm_page_prot, page_to_phys(page));
  1548		else
  1549			return insert_page(vma, addr, page, vma->vm_page_prot);
  1550	}
  1551	EXPORT_SYMBOL(vm_insert_page);
  1552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
