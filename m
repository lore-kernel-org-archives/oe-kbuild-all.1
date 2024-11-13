Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3E16DEB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731525090; cv=none; b=QcFxYRUs9sIqMvJNgTm5kxk8dRCzbK4v0Yr5YfPDulxNZQTC0hOYl1k3JQrh9f94qHMSsnUrWKKsskPOB18UcWYF4ws0IdsXNCKPFuv0XNwj6wJuD9f2Sk7pum59ahGrVEz1XgqhTXEkBmVVCpSSPCoLomWHUtS0nYc2o2YHgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731525090; c=relaxed/simple;
	bh=opC9bo8TvGX+GYwCG7OrA4ZEMCyN2cpgX8MZJr40KvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTv4QK4fMEfex7+Un6jmCopqAfBnBvFxbtal7maHtweDIuoIz8lZzV5kDjUVuW2PpBWM3E1nShk+SuJsgbPFYs5RpkRiBpYyORwm2qZzvDiDP7yD48OO0vL+nraDwcOppmQvxmL1H2gdUkweCea/EtpBiMZsrQHFEOdyRkbVESs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjpP/YZj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjpP/YZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731525088; x=1763061088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=opC9bo8TvGX+GYwCG7OrA4ZEMCyN2cpgX8MZJr40KvU=;
  b=KjpP/YZjiDNUXPPo4NpZPn8mXl/s+7bq/jn3aKmTSfbVeUAZIwnBd4C6
   z+88h3BaYoC8KxT/awgLdEZFwTo0kfZKyYUM19JkhGiypoSYC6Q+0ZqpV
   Xu3L30iRI1N3pup7UazWq9obaxUbGzxua8hmR2KAh5PjvTYwVlORfPg1h
   sw0TcfRGlBRJY18mJSq9wOfDxz+/RbiF64J1O+Ykh9VVwsyORU23xdDvI
   LSsVtXpW6ETo64pT12bTmqvM6u1D6VrjJieAkKFIYHTpJDw7YHJxE20Hj
   5/So9sMBSDWA0rgjJD/4KeHj998I955toHx3399CKGBFTh+CqmIRw/xlc
   w==;
X-CSE-ConnectionGUID: vGjpUjC4TBqndpIfxTYKsg==
X-CSE-MsgGUID: sYVRM238Sf6ae1sJ3jZv3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31319018"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="31319018"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 11:11:26 -0800
X-CSE-ConnectionGUID: QHKHUyxkQxKpyCwFUISeiw==
X-CSE-MsgGUID: znwOfBSSRyy4wqsWH9liBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="87854361"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Nov 2024 11:11:25 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBIlv-0000eJ-0B;
	Wed, 13 Nov 2024 19:11:23 +0000
Date: Thu, 14 Nov 2024 03:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294] mm/pin_mem.c:228:31: error:
 'HUGETLB_PAGE_DTOR' undeclared; did you mean 'HUGETLB_PAGE_ORDER'?
Message-ID: <202411140310.K66HPDjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jingxian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: 1a378b87531ea80e7847bf0105adedff28a73080 [1294/1294] mm: add pin memory method for checkpoint add restore
config: arm64-randconfig-003-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140310.K66HPDjK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140310.K66HPDjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140310.K66HPDjK-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pin_mem.c:171:6: warning: no previous prototype for 'reserve_page_from_buddy' [-Wmissing-prototypes]
     171 | void reserve_page_from_buddy(unsigned long nr_pages, struct page *page)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c: In function 'init_huge_pmd_pages':
>> mm/pin_mem.c:228:31: error: 'HUGETLB_PAGE_DTOR' undeclared (first use in this function); did you mean 'HUGETLB_PAGE_ORDER'?
     228 |         page->compound_dtor = HUGETLB_PAGE_DTOR + 1;
         |                               ^~~~~~~~~~~~~~~~~
         |                               HUGETLB_PAGE_ORDER
   mm/pin_mem.c:228:31: note: each undeclared identifier is reported only once for each function it appears in
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:254:6: warning: no previous prototype for 'free_user_map_pages' [-Wmissing-prototypes]
     254 | void free_user_map_pages(unsigned int pid_index, unsigned int entry_index, unsigned int page_index)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:311:6: warning: no previous prototype for 'check_redirect_end_valid' [-Wmissing-prototypes]
     311 | bool check_redirect_end_valid(struct redirect_info *redirect_start,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:392:5: warning: no previous prototype for 'calculate_pin_mem_digest' [-Wmissing-prototypes]
     392 | int calculate_pin_mem_digest(struct pin_mem_dump_info *pmdi, char *digest)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:481:5: warning: no previous prototype for 'collect_pmd_huge_pages' [-Wmissing-prototypes]
     481 | int collect_pmd_huge_pages(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:544:5: warning: no previous prototype for 'collect_normal_pages' [-Wmissing-prototypes]
     544 | int collect_normal_pages(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c: In function 'collect_normal_pages':
   mm/pin_mem.c:549:26: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
     549 |         unsigned long i, nr_pages;
         |                          ^~~~~~~~
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:610:6: warning: no previous prototype for 'free_pin_pages' [-Wmissing-prototypes]
     610 | void free_pin_pages(struct page_map_entry *pme)
         |      ^~~~~~~~~~~~~~
   mm/pin_mem.c:770:12: warning: no previous prototype for 'remap_normal_pages' [-Wmissing-prototypes]
     770 | vm_fault_t remap_normal_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:857:12: warning: no previous prototype for 'remap_huge_pmd_pages' [-Wmissing-prototypes]
     857 | vm_fault_t remap_huge_pmd_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~~~


vim +228 mm/pin_mem.c

   211	
   212	static void init_huge_pmd_pages(struct page *head_page)
   213	{
   214		int i = 0;
   215		struct page *page = head_page;
   216		unsigned long *temp;
   217		unsigned long compound_pad = COMPOUND_PAD_START;
   218	
   219		__set_bit(PG_head, &page->flags);
   220		__set_bit(PG_active, &page->flags);
   221		atomic_set(&page->_refcount, 1);
   222		page++;
   223		i++;
   224		page->compound_head = (unsigned long)head_page + 1;
   225		page->_compound_pad_2 = (unsigned long)head_page & COMPOUND_PAD_MASK;
   226		temp = (unsigned long *)(&(page->_compound_pad_2));
   227		temp[1] = LIST_POISON4;
 > 228		page->compound_dtor = HUGETLB_PAGE_DTOR + 1;
   229		page->compound_order = HPAGE_PMD_ORDER;
   230		page++;
   231		i++;
   232		page->compound_head = (unsigned long)head_page + 1;
   233		page->_compound_pad_2 = (unsigned long)head_page + compound_pad;
   234		i++;
   235	
   236		INIT_LIST_HEAD(&(page->deferred_list));
   237		for (; i < HPAGE_PMD_NR; i++) {
   238			page = head_page + i;
   239			page->compound_head = (unsigned long)head_page + 1;
   240			compound_pad += COMPOUND_PAD_DELTA;
   241			page->_compound_pad_2 = (unsigned long)head_page + compound_pad;
   242			temp = (unsigned long *)(&(page->_compound_pad_2));
   243			temp[1] = LIST_POISON4;
   244		}
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
