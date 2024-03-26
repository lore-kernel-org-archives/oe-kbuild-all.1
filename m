Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025C65C61F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711459254; cv=none; b=a7c3u8rml6t6CkRKS67ZDS1f9n4sim+22g00AT/v0AxfxjHUvJhBHUD7oqbwxanbNswo6VkrBqa+MG3J/9o57+tJXMtY6+vrPAOOpNpyih5A4avFtSqlVdGnx7/3pgYrzMqweCiCiCzOOdYJJIYE4/Y6LZ9Dw0IX1S2KjkSHKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711459254; c=relaxed/simple;
	bh=fcuI6SE5HuNXzPIjQfsZzor2tYA5KhaZREU7msoIPM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XwMdelRH1tDVuVIil7+klW4cBT2nGpY13dtvm2V+EvaRrnqSofEp2fxWtmMXZqbNX9NeC2SWbYHr6Yk+z40Jl0e7L+XTr7ti0Vj/O6bbroEnAujmZ0PmKo3zpNgsn7SvxMwvdPPGYoTwNMH50eryKejncChe+/X5DQs1lIBFdJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no/MAi7+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no/MAi7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711459253; x=1742995253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcuI6SE5HuNXzPIjQfsZzor2tYA5KhaZREU7msoIPM4=;
  b=no/MAi7+WKCvUekIfapIrNwbw2C+8yUTB1BHGbTnX0+JUaIhWfHZPY7s
   ET6MXirovMNQqk8RNM8LXkRu5mhCau7Y8oHpXLtNN+fAjPUavHOxhL9v3
   TVqRprOXS+ZegARDsl/L81PUeqzfS2VlnBjMU3xGIt/zhMx9dGoDPOsHs
   YxO36JcYjtpm1ED9o6rWeSZTXI3/f8gRKSa+rpNYq9NuuGla5QJxXEBY7
   AWKL3W3neUWrKXowDJHacCG/tlFvVd59bnPQk8zG/XMjx2TvHN/YkpPGe
   boDhamusJcK0vgAKB3usWggppqeJVuxdyZuYc4LW9JoHt+BcNu9HSZ2rJ
   g==;
X-CSE-ConnectionGUID: Bu5wMN7pSpGkqs63iPa4dw==
X-CSE-MsgGUID: UyLYI4vKQGaA4BPJRnNbfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17895785"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17895785"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 06:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="46976865"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2024 06:20:47 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp6jN-00004g-0l;
	Tue, 26 Mar 2024 13:20:45 +0000
Date: Tue, 26 Mar 2024 21:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 70/98] mm/memcontrol.c:5103:5: error: call to
 undeclared function 'mem_cgroup_nr_lru_pages'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202403262134.kuaI7FnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   52ae166cfe3d5af2e826d4bc7f68dd3f4b1bf410
commit: 59c5cf91d231ec8de8e71b6a9e65a63365a5e731 [70/98] memcg: add meminfo and vmstat show
config: x86_64-randconfig-071-20240326 (https://download.01.org/0day-ci/archive/20240326/202403262134.kuaI7FnX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403262134.kuaI7FnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403262134.kuaI7FnX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:5103:5: error: call to undeclared function 'mem_cgroup_nr_lru_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5103 |                 K(mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_ANON)) +
         |                   ^
   mm/memcontrol.c:5103:5: note: did you mean 'mem_cgroup_trylock_pages'?
   include/linux/memcontrol.h:967:20: note: 'mem_cgroup_trylock_pages' declared here
     967 | static inline bool mem_cgroup_trylock_pages(struct mem_cgroup *memcg)
         |                    ^
   mm/memcontrol.c:5161:3: error: expected expression
    5161 |                 );
         |                 ^
   mm/memcontrol.c:5199:29: error: call to undeclared function 'mem_cgroup_nr_lru_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5199 |         v[NR_ZONE_INACTIVE_ANON] = mem_cgroup_nr_lru_pages(memcg, BIT(LRU_INACTIVE_ANON));
         |                                    ^
   mm/memcontrol.c:5222:7: error: use of undeclared identifier 'NR_VM_NUMA_STAT_ITEMS'; did you mean 'NR_VM_NODE_STAT_ITEMS'?
    5222 |         v += NR_VM_NUMA_STAT_ITEMS;
         |              ^~~~~~~~~~~~~~~~~~~~~
         |              NR_VM_NODE_STAT_ITEMS
   include/linux/mmzone.h:210:2: note: 'NR_VM_NODE_STAT_ITEMS' declared here
     210 |         NR_VM_NODE_STAT_ITEMS
         |         ^
   4 errors generated.


vim +/mem_cgroup_nr_lru_pages +5103 mm/memcontrol.c

  5012	
  5013	static int mem_cgroup_meminfo_read(struct seq_file *m, void *v)
  5014	{
  5015		struct mem_cgroup *memcg = mem_cgroup_from_css(seq_css(m));
  5016		u64 mem_limit, mem_usage;
  5017		u64 mem_swap, mem_swap_usage;
  5018	
  5019		/*
  5020		 * We only need mem_cgroup_css_rstat_flush, but the only
  5021		 * safe and easy call chain starts with cgroup_rstat_flush,
  5022		 * this flushes CPU/Block cgroup stats too which bring extra
  5023		 * overhead, but accetable in most cases.
  5024		 */
  5025		cgroup_rstat_flush(memcg->css.cgroup);
  5026	
  5027		mem_limit = memcg->memory.max;
  5028		/* if limit not set, use host ram total size*/
  5029		if (mem_limit == PAGE_COUNTER_MAX)
  5030			mem_limit = totalram_pages() * PAGE_SIZE;
  5031		else
  5032			mem_limit = mem_limit * PAGE_SIZE;
  5033		mem_usage = (u64)mem_cgroup_usage(memcg, false) * PAGE_SIZE;
  5034		mem_swap = memcg->memsw.max;
  5035	
  5036		if (mem_swap == PAGE_COUNTER_MAX)
  5037			mem_swap = total_swap_pages * PAGE_SIZE;
  5038		else
  5039			mem_swap = mem_swap * PAGE_SIZE;
  5040		mem_swap_usage = (u64)mem_cgroup_usage(memcg, true) * PAGE_SIZE - mem_usage;
  5041	
  5042		/*
  5043		 * Tagged format, for easy grepping and expansion.
  5044		 */
  5045		seq_printf(m,
  5046			"MemTotal:       %8lu kB\n"
  5047			"MemFree:        %8lu kB\n"
  5048			"Buffers:        %8lu kB\n"
  5049			"Cached:         %8lu kB\n"
  5050			"SwapCached:     %8lu kB\n"
  5051			"Active:         %8lu kB\n"
  5052			"Inactive:       %8lu kB\n"
  5053			"Active(anon):   %8lu kB\n"
  5054			"Inactive(anon): %8lu kB\n"
  5055			"Active(file):   %8lu kB\n"
  5056			"Inactive(file): %8lu kB\n"
  5057			"Unevictable:    %8lu kB\n"
  5058			"Mlocked:        %8lu kB\n"
  5059	#ifdef CONFIG_HIGHMEM
  5060			"HighTotal:      %8lu kB\n"
  5061			"HighFree:       %8lu kB\n"
  5062			"LowTotal:       %8lu kB\n"
  5063			"LowFree:        %8lu kB\n"
  5064	#endif
  5065	#ifndef CONFIG_MMU
  5066			"MmapCopy:       %8lu kB\n"
  5067	#endif
  5068			"SwapTotal:      %8lu kB\n"
  5069			"SwapFree:       %8lu kB\n"
  5070			"Dirty:          %8lu kB\n"
  5071			"Writeback:      %8lu kB\n"
  5072			"AnonPages:      %8lu kB\n"
  5073			"Mapped:         %8lu kB\n"
  5074			"Shmem:          %8lu kB\n"
  5075			"Slab:           %8lu kB\n"
  5076			"SReclaimable:   %8lu kB\n"
  5077			"SUnreclaim:     %8lu kB\n"
  5078			"KernelStack:    %8lu kB\n"
  5079			"PageTables:     %8lu kB\n"
  5080	#ifdef CONFIG_QUICKLIST
  5081			"Quicklists:     %8lu kB\n"
  5082	#endif
  5083			"NFS_Unstable:   %8lu kB\n"
  5084			"Bounce:         %8lu kB\n"
  5085			"WritebackTmp:   %8lu kB\n"
  5086			"CommitLimit:    %8lu kB\n"
  5087			"Committed_AS:   %8lu kB\n"
  5088			"VmallocTotal:   %8lu kB\n"
  5089			"VmallocUsed:    %8lu kB\n"
  5090			"VmallocChunk:   %8lu kB\n"
  5091	#ifdef CONFIG_MEMORY_FAILURE
  5092			"HardwareCorrupted: %5lu kB\n"
  5093	#endif
  5094	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  5095			"AnonHugePages:  %8lu kB\n"
  5096	#endif
  5097			,
  5098			(unsigned long)(mem_limit / 1024),
  5099			(unsigned long)((mem_limit - mem_usage) / 1024),
  5100			(unsigned long)0,
  5101			K(memcg_page_state_local(memcg, NR_FILE_PAGES)),
  5102			K(memcg_page_state_local(memcg, MEMCG_SWAP)),//MEMCG_SWAP
> 5103			K(mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_ANON)) +
  5104					mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_FILE))),//K(pages[LRU_ACTIVE_ANON]   + pages[LRU_ACTIVE_FILE]),
  5105			K(mem_cgroup_nr_lru_pages(memcg, BIT(LRU_INACTIVE_ANON)) +
  5106				mem_cgroup_nr_lru_pages(memcg, BIT(LRU_INACTIVE_FILE))),//K(pages[LRU_INACTIVE_ANON] + pages[LRU_INACTIVE_FILE]),
  5107			K(mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_ANON))),//K(pages[LRU_ACTIVE_ANON]),
  5108			K(mem_cgroup_nr_lru_pages(memcg, BIT(LRU_INACTIVE_ANON))),//K(pages[LRU_INACTIVE_ANON]),
  5109			K(mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_FILE))),//K(pages[LRU_ACTIVE_FILE]),
  5110			K(mem_cgroup_nr_lru_pages(memcg, BIT(LRU_INACTIVE_FILE))),//K(pages[LRU_INACTIVE_FILE]),
  5111			K(mem_cgroup_nr_lru_pages(memcg, BIT(LRU_UNEVICTABLE))),//K(pages[LRU_UNEVICTABLE]),
  5112			(unsigned long)0,//K(global_page_state(NR_MLOCK)),
  5113	#ifdef CONFIG_HIGHMEM
  5114			(unsigned long)0,//K(i.totalhigh),
  5115			(unsigned long)0,//K(i.freehigh),
  5116			(unsigned long)0,//K(i.totalram-i.totalhigh),
  5117			(unsigned long)0,//K(i.freeram-i.freehigh),
  5118	#endif
  5119	#ifndef CONFIG_MMU
  5120			(unsigned long)0,//K((unsigned long) atomic_long_read(&mmap_pages_allocated)),
  5121	#endif
  5122			(unsigned long)(mem_swap / 1024),
  5123			(unsigned long)((mem_swap - mem_swap_usage) / 1024),
  5124			(unsigned long)0,//K(global_page_state(NR_FILE_DIRTY)),
  5125			(unsigned long)0,//K(global_page_state(NR_WRITEBACK)),
  5126	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  5127			K(memcg_page_state(memcg, memcg1_stats[1])
  5128				+ memcg_page_state(memcg, memcg1_stats[2]) *
  5129				HPAGE_PMD_NR),
  5130			//K(global_page_state(NR_ANON_PAGES)
  5131			 // + global_page_state(NR_ANON_TRANSPARENT_HUGEPAGES) *
  5132			  //HPAGE_PMD_NR),
  5133	#else
  5134			 K(memcg_page_state(memcg, memcg1_stats[1])), //K(global_page_state(NR_ANON_PAGES)),
  5135	#endif
  5136			K(memcg_page_state(memcg, memcg1_stats[4])),//K(global_page_state(NR_FILE_MAPPED)),
  5137			(unsigned long)0, //K(global_page_state(NR_SHMEM)),
  5138			(unsigned long)0, //K(global_page_state(NR_SLAB_RECLAIMABLE) +
  5139					//global_page_state(NR_SLAB_UNRECLAIMABLE)),
  5140			(unsigned long)0, //K(global_page_state(NR_SLAB_RECLAIMABLE)),
  5141			(unsigned long)0, //K(global_page_state(NR_SLAB_UNRECLAIMABLE)),
  5142			(unsigned long)0, //global_page_state(NR_KERNEL_STACK) * THREAD_SIZE / 1024,
  5143			(unsigned long)0, //K(global_page_state(NR_PAGETABLE)),
  5144	#ifdef CONFIG_QUICKLIST
  5145			(unsigned long)0, //K(quicklist_total_size()),
  5146	#endif
  5147			(unsigned long)0, //K(global_page_state(NR_UNSTABLE_NFS)),
  5148			(unsigned long)0, //K(global_page_state(NR_BOUNCE)),
  5149			(unsigned long)0, //K(global_page_state(NR_WRITEBACK_TEMP)),
  5150			(unsigned long)0, //K(vm_commit_limit()),
  5151			(unsigned long)0, //K(committed),
  5152			(unsigned long)0, //(unsigned long)VMALLOC_TOTAL >> 10,
  5153			(unsigned long)0, //vmi.used >> 10,
  5154			(unsigned long)0, //vmi.largest_chunk >> 10
  5155	#ifdef CONFIG_MEMORY_FAILURE
  5156			(unsigned long)0, //,atomic_long_read(&num_poisoned_pages) << (PAGE_SHIFT - 10)
  5157	#endif
  5158	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  5159			K(memcg_page_state(memcg, memcg1_stats[2]) * HPAGE_PMD_NR)
  5160	#endif
  5161			);
  5162	
  5163		//hugetlb_report_meminfo(m);
  5164	
  5165		//arch_report_meminfo(m);
  5166	
  5167		return 0;
  5168	}
  5169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
