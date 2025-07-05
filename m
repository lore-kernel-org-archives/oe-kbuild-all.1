Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE9249EB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751747438; cv=none; b=a++xgCUVrJEozj59uFUaoIMQ4RYW/z2c/Jy44MNcRvJBgM1o3bHeg51nfpTkAQWxngU1A9rK9YyTKztCqBJaq+e54PxF2wFeGLv4FwMvl+fvsXLp9mZ7H11Zz9fB6QiIYDsFYJMiaCjQ2eoi2MHzKWiDYPcfGsjw6GenWkC6IpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751747438; c=relaxed/simple;
	bh=8ZpTnVwVe06w2yeRsPf4qSke9UjWjcmvfiyMxaNzkAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNhjX2eexl0aa/mMa1UIgWXX4cEq2M6ECXqkXt0wu+MkF3pbDgM+xShtHI88eMGIn02qiFs/FKsU6JyzL6ZYFcJmNJM1IxTxb+d4HBYnYIKSBl2nPJujbKbr2gBtO2bRtko7Hv4hVtIKj6vnHm0FeyQnKQJpTsB0embN7MMYA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAz/pVa+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAz/pVa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751747436; x=1783283436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ZpTnVwVe06w2yeRsPf4qSke9UjWjcmvfiyMxaNzkAo=;
  b=UAz/pVa+WBV6m28W5hWs4od+6bu1NeqttOc9tFp0AdFwpAQfaT3TqtQG
   0/WzUnwkhjnHR00ThheMzfVvsIBPJPE+NsZUKIPQArNhmeAhr62tC58/x
   kn6iM5t1Oc5t35RYPq4c0LR/2KoKN+cNBAAL2TzoXr+NqtJxBuYqocuJ+
   br06WPKLrRH55/QLHY3O85Z5+jrlHu0bzUgVmx68WFN47in8BR2R+vFlh
   x1wGdtBSlNou6KReRJRfUq9KaUOzKn4QKIuPN2AB4ZCC3msV6TPTMLgaQ
   hII4nuAKHT7wXzok5bkDGKDfaBDg2+wWc+ySj66EJDd5G+iZffYyJ6bsF
   g==;
X-CSE-ConnectionGUID: tmuqKrrETLmEBd56MSKDFA==
X-CSE-MsgGUID: dn7x26aMSKOKL5o6Aikvkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53242640"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53242640"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 13:30:35 -0700
X-CSE-ConnectionGUID: tphkhP9+R3yc+pLJvW3GLw==
X-CSE-MsgGUID: uG+j87fmTuaynYp7VIQeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="154997342"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Jul 2025 13:30:34 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY9Wp-0004hz-2o;
	Sat, 05 Jul 2025 20:30:31 +0000
Date: Sun, 6 Jul 2025 04:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1712/1712] mm/memory.c:1546:10: error:
 implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did
 you mean 'hugetlb_insert__hugepage_pte_by_pa'?
Message-ID: <202507060451.ahHkbiES-lkp@intel.com>
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
head:   e6b6811414fe4cfc995369e8bda32fc1b4ee1d51
commit: 18f49509eef01d1ee6ed81899298994f2f88dd2a [1712/1712] ascend: share_pool: Use remap_pfn_range to share kva to uva
config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20250706/202507060451.ahHkbiES-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060451.ahHkbiES-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060451.ahHkbiES-lkp@intel.com/

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
