Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2BA1BB4D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690821821; x=1722357821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V56oW3Or1ZBd4DfDkEcG9LmX+w03i5iWCxj1j7br07k=;
  b=IWmV2sUyjAGVl54/JKQcRdRxPGELD0LcPl930nMhCc76ERHgMaQ/tT9U
   sNpCQ6ezCbiz3yBvPLQ3q7IIp7IByWAoVcdLGHfLLHb6uF/FnquGlqNvO
   yyQb/xugYE5uS3VmodlnDhr+i97cpURhyXeq4Dtpth+kIXUtm4ZuKqdP8
   5EBY428l+s1xELZRBaD8lXOL52qxhZTgMDatJxepqqA3r292+jP0JJm09
   ZFOLLEIvPtb/DCy22fUrwcT6lq95JbpkmP9UpjlopBGcgqDsRTM2HIKU/
   /M1h3JNvb+RmwtxvCAeJoqyG7224UzyZFhdjUqT0dTsWDv4+J+rkn5ZVC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="367970869"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="367970869"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 09:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798307174"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="798307174"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2023 09:43:36 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQVzc-0005Ep-0p;
	Mon, 31 Jul 2023 16:43:36 +0000
Date: Tue, 1 Aug 2023 00:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	Mina Almasry <almasrymina@google.com>, kirill@shutemov.name,
	joel@joelfernandes.org, william.kucharski@oracle.com,
	kaleshsingh@google.com
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 3/4] mm: mremap: use flush_pud_tlb_range in
 move_normal_pud()
Message-ID: <202308010022.uY01vAew-lkp@intel.com>
References: <20230731074829.79309-4-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731074829.79309-4-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm-perf/for-next/perf linus/master v6.5-rc4 next-20230731]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-hugetlb-use-flush_hugetlb_tlb_range-in-move_hugetlb_page_tables/20230731-154016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230731074829.79309-4-wangkefeng.wang%40huawei.com
patch subject: [PATCH 3/4] mm: mremap: use flush_pud_tlb_range in move_normal_pud()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230801/202308010022.uY01vAew-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010022.uY01vAew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010022.uY01vAew-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mremap.c: In function 'move_normal_pud':
>> mm/mremap.c:336:9: error: implicit declaration of function 'flush_pud_tlb_range'; did you mean 'flush_pmd_tlb_range'? [-Werror=implicit-function-declaration]
     336 |         flush_pud_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~
         |         flush_pmd_tlb_range
   cc1: some warnings being treated as errors


vim +336 mm/mremap.c

   302	
   303	#if CONFIG_PGTABLE_LEVELS > 2 && defined(CONFIG_HAVE_MOVE_PUD)
   304	static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
   305			  unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
   306	{
   307		spinlock_t *old_ptl, *new_ptl;
   308		struct mm_struct *mm = vma->vm_mm;
   309		pud_t pud;
   310	
   311		if (!arch_supports_page_table_move())
   312			return false;
   313		/*
   314		 * The destination pud shouldn't be established, free_pgtables()
   315		 * should have released it.
   316		 */
   317		if (WARN_ON_ONCE(!pud_none(*new_pud)))
   318			return false;
   319	
   320		/*
   321		 * We don't have to worry about the ordering of src and dst
   322		 * ptlocks because exclusive mmap_lock prevents deadlock.
   323		 */
   324		old_ptl = pud_lock(vma->vm_mm, old_pud);
   325		new_ptl = pud_lockptr(mm, new_pud);
   326		if (new_ptl != old_ptl)
   327			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
   328	
   329		/* Clear the pud */
   330		pud = *old_pud;
   331		pud_clear(old_pud);
   332	
   333		VM_BUG_ON(!pud_none(*new_pud));
   334	
   335		pud_populate(mm, new_pud, pud_pgtable(pud));
 > 336		flush_pud_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
   337		if (new_ptl != old_ptl)
   338			spin_unlock(new_ptl);
   339		spin_unlock(old_ptl);
   340	
   341		return true;
   342	}
   343	#else
   344	static inline bool move_normal_pud(struct vm_area_struct *vma,
   345			unsigned long old_addr, unsigned long new_addr, pud_t *old_pud,
   346			pud_t *new_pud)
   347	{
   348		return false;
   349	}
   350	#endif
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
