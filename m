Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F2311715
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 03:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706327125; cv=none; b=utGrKetAPPktP6jdWNx/J847wpoTT8InKTBZqLIldTIJSy0wU14M8w1vGkWhMT9S4MiM4KYGiTgi2QiNmUXSTfTtarq9zesnKUyLectbdrApbDtVVE63q16ICQqUlIeJEDIytgRotKjlwj8LUhXT5iDB/uyU+bzc1u5tnwmT/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706327125; c=relaxed/simple;
	bh=V5kKv9hdbfptFiY14SmnES/WCLFaNHAyIguz6TyBsJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UYXo0YRLSfugqxkgNTPxYWMeErorGbjQRdYQbJaxtDDAnVvHDbBGCa6btG//fGMj8Bsj1QcmWCig4L+PTC9YAn0IcPRQIzpCD3130LNa7qvm2NuPmzmsQgNLDp9XAIqDZ/f3rVhZVrYU4U2/XpxvvJLa97GZ6iImD8wClZpcSBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQ39hNpo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQ39hNpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706327123; x=1737863123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V5kKv9hdbfptFiY14SmnES/WCLFaNHAyIguz6TyBsJg=;
  b=FQ39hNpo3jp+quGPKB3+r9sGF7opIEAEN1u7O8YobmSoEy0B8qKv8khB
   d3V79ia2zhuviISTCoBt/bjAgkwDrcjmInzSZfyPgH7ejWCrFuMQUdAKk
   fmobIKbFWDdE5Rve9PpsHqQPwkKA5VL3m8HWozi4XmTPIAMeYEntc+X2i
   38RHfb7cjLqdJck2J2iZmhjuDTfcAuwi5GFbI9ddlZuWyBrtoj0Gxq66w
   +NG0axeyb3qLvgyIVRybALaZO3C9iBMaTIbtbF09RSFlRkVq2kHUdmJOz
   hpRE8uA1BhSfPqI/4ArJCUBHB9WxlNDGSnrt41mvJiCgSn2jytamj5ZLB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9297945"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9297945"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 19:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821344791"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="821344791"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Jan 2024 19:45:21 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTZd9-0001bw-0l;
	Sat, 27 Jan 2024 03:45:19 +0000
Date: Sat, 27 Jan 2024 11:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16561/21577] mm/pin_mem.c:228:31:
 error: 'HUGETLB_PAGE_DTOR' undeclared; did you mean 'HUGETLB_PAGE_ORDER'?
Message-ID: <202401271117.5DMuyrks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   992b5fc139d3aa14b25613b06adee4bb9c110b28
commit: 1a378b87531ea80e7847bf0105adedff28a73080 [16561/21577] mm: add pin memory method for checkpoint add restore
config: arm64-randconfig-003-20240125 (https://download.01.org/0day-ci/archive/20240127/202401271117.5DMuyrks-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401271117.5DMuyrks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401271117.5DMuyrks-lkp@intel.com/

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
