Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520E1139579
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735331383; cv=none; b=fPjjaUbWl5xz1JJ5eR63krok1c7ZB4hWwJbLcNX+SpvLzLV0ah6Pu1Jqdu3YFMGWZoM71QjNVolo/hMy1adhnegzsqUmUcNEpJw4pn0Cg3aBwMW6cp0yzPMI5cC4il/J4setIr6BiWoDuXCdgv5x5P9xK2GUE2O5UFunQ1spa/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735331383; c=relaxed/simple;
	bh=khZ1h0TMCPATFnIe90jvZcwncvrWz1NIabzcsf05rI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFdadeEIXfXRJTQrENzN9Q0EKeCDY94CQDJarTkXBA4HBFrFp7DbuK0V5VI1zQ6CXdUz/MY6EzI67STzaa+J1UUKGpndHN+tPirWgibVuDiBh/3/PcHvm6rRyGzS1BPt63fxTjQUnY9Wbe8hhw0mMQ5PMG972ZofgS049AtL1E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZn1aGre; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZn1aGre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735331381; x=1766867381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=khZ1h0TMCPATFnIe90jvZcwncvrWz1NIabzcsf05rI4=;
  b=DZn1aGre+LUPpnUqpN5cxYzIb8AV3UvtI3dYNsNZDYYZnsw2EsFl37HU
   P9f3P9L4WoEsZELBqYbnEdCgeZboJeUlz4KN/QeST39YezYAZSw20N8bG
   guACh0PtYFH0qSIuNs8wGo683P0QX27Xns6AThBk2Np7VQhhFKdPeLtT5
   9rKKUQmQ4ww7aEu7p7dCz2AUC+lu5ORnBA/GiyRNX8St10d1Y6nZpDXPt
   d+vpTrA1zcuz7YkonniISauJ1HwR9MH8PH/84eGWmP6XLEY26xMeYuKG/
   /VBOOSARLs838x9NjHybhtsUylcA+LZ0+tXDKwD9MMXbQbGD6dsPEBnNT
   w==;
X-CSE-ConnectionGUID: iBmx6WjNR3GJNh4ZJfERig==
X-CSE-MsgGUID: p/MRRj4jTpKwMd8kYACJ6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="53259997"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="53259997"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 12:29:41 -0800
X-CSE-ConnectionGUID: ZH3tZmAGSAK7Ykl2zqBK5w==
X-CSE-MsgGUID: ULsQiLklT52delkcAdLHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137574719"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2024 12:29:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRGxl-0003aJ-07;
	Fri, 27 Dec 2024 20:29:37 +0000
Date: Sat, 28 Dec 2024 04:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1355/1355] mm/pin_mem.c:34:14: sparse:
 sparse: symbol 'max_pin_pid_num' was not declared. Should it be static?
Message-ID: <202412280440.AeTCi8Kt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a8a9daf97ebc8e303e039402fe784e7bd4e5a9bb
commit: 1a378b87531ea80e7847bf0105adedff28a73080 [1355/1355] mm: add pin memory method for checkpoint add restore
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280440.AeTCi8Kt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280440.AeTCi8Kt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280440.AeTCi8Kt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/pin_mem.c:34:14: sparse: sparse: symbol 'max_pin_pid_num' was not declared. Should it be static?
>> mm/pin_mem.c:35:15: sparse: sparse: symbol 'redirect_space_size' was not declared. Should it be static?
>> mm/pin_mem.c:171:6: sparse: sparse: symbol 'reserve_page_from_buddy' was not declared. Should it be static?
>> mm/pin_mem.c:254:6: sparse: sparse: symbol 'free_user_map_pages' was not declared. Should it be static?
>> mm/pin_mem.c:311:6: sparse: sparse: symbol 'check_redirect_end_valid' was not declared. Should it be static?
>> mm/pin_mem.c:392:5: sparse: sparse: symbol 'calculate_pin_mem_digest' was not declared. Should it be static?
>> mm/pin_mem.c:481:5: sparse: sparse: symbol 'collect_pmd_huge_pages' was not declared. Should it be static?
>> mm/pin_mem.c:544:5: sparse: sparse: symbol 'collect_normal_pages' was not declared. Should it be static?
>> mm/pin_mem.c:610:6: sparse: sparse: symbol 'free_pin_pages' was not declared. Should it be static?
>> mm/pin_mem.c:770:12: sparse: sparse: symbol 'remap_normal_pages' was not declared. Should it be static?
>> mm/pin_mem.c:857:12: sparse: sparse: symbol 'remap_huge_pmd_pages' was not declared. Should it be static?
>> mm/pin_mem.c:844:63: sparse: sparse: not addressable
   mm/pin_mem.c:846:63: sparse: sparse: not addressable
   mm/pin_mem.c:848:71: sparse: sparse: not addressable
   mm/pin_mem.c:851:65: sparse: sparse: not addressable
   mm/pin_mem.c:171:6: warning: no previous prototype for 'reserve_page_from_buddy' [-Wmissing-prototypes]
     171 | void reserve_page_from_buddy(unsigned long nr_pages, struct page *page)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
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
   mm/pin_mem.c: In function 'get_hugepage_gfpmask':
   mm/pin_mem.c:844:63: error: lvalue required as unary '&' operand
     844 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepage_flags))
         |                                                               ^
   mm/pin_mem.c:846:63: error: lvalue required as unary '&' operand
     846 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepage_flags))
         |                                                               ^
   mm/pin_mem.c:848:71: error: lvalue required as unary '&' operand
     848 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transparent_hugepage_flags))
         |                                                                       ^
   mm/pin_mem.c:851:65: error: lvalue required as unary '&' operand
     851 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hugepage_flags))
         |                                                                 ^
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:857:12: warning: no previous prototype for 'remap_huge_pmd_pages' [-Wmissing-prototypes]
     857 | vm_fault_t remap_huge_pmd_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~~~

vim +/max_pin_pid_num +34 mm/pin_mem.c

    33	
  > 34	unsigned int max_pin_pid_num __read_mostly;
  > 35	unsigned long redirect_space_size __read_mostly;
    36	static unsigned long redirect_space_start;
    37	static void *pin_mem_pagewalk;
    38	static unsigned long *pagemap_buffer;
    39	static int reserve_user_map_pages_fail;
    40	
    41	static int __init setup_max_pin_pid_num(char *str)
    42	{
    43		int ret;
    44	
    45		if (!str)
    46			return 0;
    47	
    48		ret = kstrtouint(str, 10, &max_pin_pid_num);
    49		if (ret) {
    50			pr_warn("Unable to parse max pin pid num.\n");
    51		} else {
    52			if (max_pin_pid_num > MAX_PIN_PID_NUM) {
    53				max_pin_pid_num = 0;
    54				pr_warn("Input max_pin_pid_num is too large.\n");
    55			}
    56		}
    57		return ret;
    58	}
    59	early_param("max_pin_pid_num", setup_max_pin_pid_num);
    60	
    61	static int __init setup_redirect_space_size(char *str)
    62	{
    63		if (!str)
    64			return 0;
    65	
    66		redirect_space_size = memparse(str, NULL);
    67		if (!redirect_space_size) {
    68			pr_warn("Unable to parse redirect space size, use the default value.\n");
    69			redirect_space_size = DEFAULT_REDIRECT_SPACE_SIZE;
    70		}
    71		return 0;
    72	}
    73	early_param("redirect_space_size", setup_redirect_space_size);
    74	
    75	struct page_map_info *create_page_map_info(int pid)
    76	{
    77		struct page_map_info *new;
    78	
    79		if (!user_space_reserve_start)
    80			return NULL;
    81	
    82		if (pin_pid_num >= max_pin_pid_num) {
    83			pr_warn("Pin pid num too large than max_pin_pid_num, fail create: %d!", pid);
    84			return NULL;
    85		}
    86		new = (struct page_map_info *)(user_space_reserve_start + pin_pid_num);
    87		new->pid = pid;
    88		new->pme = NULL;
    89		new->entry_num = 0;
    90		new->pid_reserved = false;
    91		new->disable_free_page = false;
    92		(*pin_pid_num_addr)++;
    93		pin_pid_num++;
    94		return new;
    95	}
    96	EXPORT_SYMBOL_GPL(create_page_map_info);
    97	
    98	struct page_map_info *get_page_map_info(int pid)
    99	{
   100		int i;
   101	
   102		if (!user_space_reserve_start)
   103			return NULL;
   104	
   105		for (i = 0; i < pin_pid_num; i++) {
   106			if (user_space_reserve_start[i].pid == pid)
   107				return &(user_space_reserve_start[i]);
   108		}
   109		return NULL;
   110	}
   111	EXPORT_SYMBOL_GPL(get_page_map_info);
   112	
   113	static struct page *find_head_page(struct page *page)
   114	{
   115		struct page *p = page;
   116	
   117		while (!PageBuddy(p)) {
   118			if (PageLRU(p))
   119				return NULL;
   120			p--;
   121		}
   122		return p;
   123	}
   124	
   125	static void spilt_page_area_left(struct zone *zone, struct free_area *area, struct page *page,
   126		unsigned long size, int order)
   127	{
   128		unsigned long cur_size = 1 << order;
   129		unsigned long total_size = 0;
   130	
   131		while (size && cur_size > size) {
   132			cur_size >>= 1;
   133			order--;
   134			area--;
   135			if (cur_size <= size) {
   136				list_add(&page[total_size].lru, &area->free_list[MIGRATE_MOVABLE]);
   137				atomic_set(&(page[total_size]._mapcount), PAGE_BUDDY_MAPCOUNT_VALUE);
   138				set_page_private(&page[total_size], order);
   139				set_pageblock_migratetype(&page[total_size], MIGRATE_MOVABLE);
   140				area->nr_free++;
   141				total_size += cur_size;
   142				size -= cur_size;
   143			}
   144		}
   145	}
   146	
   147	static void spilt_page_area_right(struct zone *zone, struct free_area *area, struct page *page,
   148			unsigned long size, int order)
   149	{
   150		unsigned long cur_size = 1 << order;
   151		struct page *right_page, *head_page;
   152	
   153		right_page = page + size;
   154		while (size && cur_size > size) {
   155			cur_size >>= 1;
   156			order--;
   157			area--;
   158			if (cur_size <= size) {
   159				head_page = right_page - cur_size;
   160				list_add(&head_page->lru, &area->free_list[MIGRATE_MOVABLE]);
   161				atomic_set(&(head_page->_mapcount), PAGE_BUDDY_MAPCOUNT_VALUE);
   162				set_page_private(head_page, order);
   163				set_pageblock_migratetype(head_page, MIGRATE_MOVABLE);
   164				area->nr_free++;
   165				size -= cur_size;
   166				right_page = head_page;
   167			}
   168		}
   169	}
   170	
 > 171	void reserve_page_from_buddy(unsigned long nr_pages, struct page *page)
   172	{
   173		unsigned int current_order;
   174		struct page *page_end;
   175		struct free_area *area;
   176		struct zone *zone;
   177		struct page *head_page;
   178	
   179		head_page = find_head_page(page);
   180		if (!head_page) {
   181			pr_warn("Find page head fail.");
   182			return;
   183		}
   184	
   185		current_order = head_page->private;
   186		page_end = head_page + (1 << current_order);
   187		zone = page_zone(head_page);
   188		area = &(zone->free_area[current_order]);
   189		list_del(&head_page->lru);
   190		atomic_set(&head_page->_mapcount, -1);
   191		set_page_private(head_page, 0);
   192		area->nr_free--;
   193	
   194		if (head_page != page)
   195			spilt_page_area_left(zone, area, head_page,
   196				(unsigned long)(page - head_page), current_order);
   197		page = page + nr_pages;
   198		if (page < page_end) {
   199			spilt_page_area_right(zone, area, page,
   200				(unsigned long)(page_end - page), current_order);
   201		} else if (page > page_end) {
   202			pr_warn("Find page end smaller than page.");
   203		}
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
