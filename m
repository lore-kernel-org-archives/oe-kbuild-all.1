Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD28D1C9B61
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 20:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729976012; cv=none; b=PgMuminLZqVwTaJYgUC4fgIzEr4P9dOcSNtbTmliREgQVuXfXTbRZcNTmZCtthF8S6TwCsq5IjnvU4/wogIMrw086R4w6t8RfNP8b/dQVwQF9o37W9W8uKkf+mGEKakjK53c15pVwmVJfmfCjwiof2mozlOkOPSIeiAAWjGYPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729976012; c=relaxed/simple;
	bh=X4h4AOgAB1VlxGLsVDstAxc4RIcv/Ze/lkh2ANMgaeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKCIJ5iwH77y5U5LlaIaV6osSR/1xrImpMrKAlUyxppGm4SQIQxHqFvTXdAjYAxoC2XTJ+ecDYEatamhdLvj8xq3zOVfAkidcMXOSnzz4MAvZ/AgYjzFdLTeksKMCcHhPL70Ju6ugzTECULT7rJCchg7Mg3Bd3kk/a4CyQDjR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETMzB0xk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETMzB0xk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729976010; x=1761512010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4h4AOgAB1VlxGLsVDstAxc4RIcv/Ze/lkh2ANMgaeQ=;
  b=ETMzB0xkyD/OYC/0dBn7SHfk3nrzCijoxCZ3iy8gmlV3+nq7ofyvzOKX
   NC9afo5Lk1G4DG443dpFJ0GJAdnWNZcIURibhgUXPS/KkcjS5UI0f+Ip8
   g6WO5aZmmtlSe4krantsBejXE9Gq1XfHOpB/wONZ4EQFYfo+zjRTgy7nT
   LdH7WTDC4b7S553DzNt5p0OknMMvS0BxzDLuk1cZ9W5qAU3qI+m5cbneC
   ZCVGkcg0Oxa2abYcizFv7/FxlwcBJAE2Q+9psElaMhd6FRm3KqTb56bGV
   au8Mfa2wJTwfiMwrIHM/Uo6hzBYE1KLpaeTItBvL3NmhJ5ybKH4zVpTvM
   Q==;
X-CSE-ConnectionGUID: WVCl3PboRcqV6c+9i8Zgsw==
X-CSE-MsgGUID: x9ByTFZrRz+A5oShBXvFuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="40995281"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="40995281"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 13:53:24 -0700
X-CSE-ConnectionGUID: tQPl/O/fSeS3f1GSv/sf8g==
X-CSE-MsgGUID: Donf3nyVQLO5vNRQqW9S2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="82068841"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2024 13:53:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4nmi-000a22-1W;
	Sat, 26 Oct 2024 20:53:20 +0000
Date: Sun, 27 Oct 2024 04:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16561/23866] mm/pin_mem.c:228:31:
 error: 'HUGETLB_PAGE_DTOR' undeclared; did you mean 'HUGETLB_PAGE_ORDER'?
Message-ID: <202410270402.9XpA0lvS-lkp@intel.com>
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
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 1a378b87531ea80e7847bf0105adedff28a73080 [16561/23866] mm: add pin memory method for checkpoint add restore
config: arm64-randconfig-002-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270402.9XpA0lvS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270402.9XpA0lvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270402.9XpA0lvS-lkp@intel.com/

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
