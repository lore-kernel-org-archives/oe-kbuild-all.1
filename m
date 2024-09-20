Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94D529CEB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 04:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726805311; cv=none; b=gRVZfn5L87RFXY2MaYBEDF8z3wIvzNpDCG3RPM/9t317u+pu7VSJUYR+kIwunXJB+cFqn3+7QZl7W25svoV7s1LY5i/OUG0NF62JLE203jozGEHlqoQkbk3x/r6caBbjjy1/TE8cDW2qGhiUvDuW8cCvehEwLdXQpGwB+bzJJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726805311; c=relaxed/simple;
	bh=32bhA9CA8BEtip1u1utcWE5sNZt8fnS5pcsP0Y7/DEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o4eJza4sKtvU8G09pDbptdwWRALPx0KDf9d2P3KWmotx1uSTBHH8pB8jMRiZNSzkQ48+PqRZGLgrdvkcUMOEbeTDjhQxwIJwq2szRgrpzVIzJMurif6PmenPBZh1Ytm8cL2RCwFrx8DRMVxA9lKwVsbXYrLMkPB3f+tR3zh9uMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LuXBHqqm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuXBHqqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726805310; x=1758341310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32bhA9CA8BEtip1u1utcWE5sNZt8fnS5pcsP0Y7/DEE=;
  b=LuXBHqqmtf+eQx8YE/DSZhGaPF2FfdCViRhgq2Po0ISq5GusyiuJAsia
   pC89LUSGg8tO61Dw3kz7Ijdwo2Dh7CmxBSBBNyvtDoroVYApKdSF7qgzQ
   scIZBXRAMw3nTvzw9i1oKGrJ5Qg+vkesT4IyW/xBYVNp/ACzvGo78JqOy
   nDXSc1RZthtPgev7RqiSuw/Pz9pdtbzEp8DaOqK8uqJ4thfkFPKQBClXn
   GdEUSq6zU1LxY1wrJXZ5/r6+c215le2Tz2wz9KAXaK5aOcYtfKqsJLadx
   kOY2GB9S/zmQ0bPOvn020yy4KohPi/1Le8DT4qBvMD48ASbqJ66H4rSmd
   A==;
X-CSE-ConnectionGUID: G7DqRRqXTvGz9wRmaxYSGg==
X-CSE-MsgGUID: gz6631UQTIaDAgdMhewHnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29534605"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="29534605"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 21:08:27 -0700
X-CSE-ConnectionGUID: /1wkPDl/Rg+mmXwA99MvqA==
X-CSE-MsgGUID: 7cGgZqGPRYS2WdEsUwvZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="74266945"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Sep 2024 21:08:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srUwR-000Dwg-2u;
	Fri, 20 Sep 2024 04:08:23 +0000
Date: Fri, 20 Sep 2024 12:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18192/23720] mm/memory.c:1546:10:
 error: implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'
Message-ID: <202409201222.m2Vt8TXh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bacbf9a9f0df34d979a8029d5a7a7e5dc91460b9
commit: 18f49509eef01d1ee6ed81899298994f2f88dd2a [18192/23720] ascend: share_pool: Use remap_pfn_range to share kva to uva
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240920/202409201222.m2Vt8TXh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201222.m2Vt8TXh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201222.m2Vt8TXh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:51:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memory.c:1546:10: error: implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa' [-Werror,-Wimplicit-function-declaration]
    1546 |                 return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
         |                        ^
   mm/memory.c:1546:10: note: did you mean 'hugetlb_insert__hugepage_pte_by_pa'?
   include/linux/hugetlb.h:658:19: note: 'hugetlb_insert__hugepage_pte_by_pa' declared here
     658 | static inline int hugetlb_insert__hugepage_pte_by_pa(struct mm_struct *mm,
         |                   ^
   1 warning and 1 error generated.


vim +/hugetlb_insert_hugepage_pte_by_pa +1546 mm/memory.c

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
