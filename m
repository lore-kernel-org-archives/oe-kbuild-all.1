Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2A3C461
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 22:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAsKQkaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700088079; x=1731624079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QofitB4ZNi+TXbaxNZknQGnGmlLVOHd1OKJzFC74FY0=;
  b=SAsKQkaY/f8o0G3LGCS/MEui7CUuWepGMIENhwM5t4oIQVOLHbC/saum
   uDD8Ne95LFKlbp2H8NSEeWbMbcO+j7ON8/MQgVedggY2rwwBd9jLK2+Yn
   gZ1ryuzAO+zcQn88blkqfmd2Rv+pcD1u+Rpn9/rs8aSGHaEgcyz6/ft6w
   +pD8hVn0y5X5+LoEWC6Ze97F6YbONO+U0PKnxFzCSGwN5SVVYOrV6i0m5
   zgVipuIDsWCc+wkIubcIXqfngbrn2WQK7AvTtJFVLVIHDuerN/b97udb9
   iV7lzt+82pjCG7PL9DIklS3wnmaUeP9SleArDP2jjILgHnlweWiM3/+dk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9610160"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="9610160"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855788474"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="855788474"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2023 14:41:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OZI-0000vI-2k;
	Wed, 15 Nov 2023 22:41:08 +0000
Date: Thu, 16 Nov 2023 06:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Matthew Wilcox <willy@infradead.org>, Yu Zhao <yuzhao@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/14] mm: Batch-copy PTE ranges during fork()
Message-ID: <202311160652.wBj0hbPP-lkp@intel.com>
References: <20231115163018.1303287-2-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115163018.1303287-2-ryan.roberts@arm.com>

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.7-rc1 next-20231115]
[cannot apply to arm64/for-next/core efi/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/mm-Batch-copy-PTE-ranges-during-fork/20231116-010123
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231115163018.1303287-2-ryan.roberts%40arm.com
patch subject: [PATCH v2 01/14] mm: Batch-copy PTE ranges during fork()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231116/202311160652.wBj0hbPP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160652.wBj0hbPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160652.wBj0hbPP-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'folio_nr_pages_cont_mapped':
   mm/memory.c:969:16: error: implicit declaration of function 'pte_pgprot'; did you mean 'ptep_get'? [-Werror=implicit-function-declaration]
     969 |         prot = pte_pgprot(pte_mkold(pte_mkclean(ptent)));
         |                ^~~~~~~~~~
         |                ptep_get
>> mm/memory.c:969:16: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
>> arch/alpha/include/asm/page.h:38:29: error: request for member 'pgprot' in something not a structure or union
      38 | #define pgprot_val(x)   ((x).pgprot)
         |                             ^
   mm/memory.c:981:21: note: in expansion of macro 'pgprot_val'
     981 |                     pgprot_val(pte_pgprot(ptent)) != pgprot_val(prot))
         |                     ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +969 mm/memory.c

   950	
   951	static int folio_nr_pages_cont_mapped(struct folio *folio,
   952					      struct page *page, pte_t *pte,
   953					      unsigned long addr, unsigned long end,
   954					      pte_t ptent, bool *any_dirty)
   955	{
   956		int floops;
   957		int i;
   958		unsigned long pfn;
   959		pgprot_t prot;
   960		struct page *folio_end;
   961	
   962		if (!folio_test_large(folio))
   963			return 1;
   964	
   965		folio_end = &folio->page + folio_nr_pages(folio);
   966		end = min(page_cont_mapped_vaddr(folio_end, page, addr), end);
   967		floops = (end - addr) >> PAGE_SHIFT;
   968		pfn = page_to_pfn(page);
 > 969		prot = pte_pgprot(pte_mkold(pte_mkclean(ptent)));
   970	
   971		*any_dirty = pte_dirty(ptent);
   972	
   973		pfn++;
   974		pte++;
   975	
   976		for (i = 1; i < floops; i++) {
   977			ptent = ptep_get(pte);
   978			ptent = pte_mkold(pte_mkclean(ptent));
   979	
   980			if (!pte_present(ptent) || pte_pfn(ptent) != pfn ||
   981			    pgprot_val(pte_pgprot(ptent)) != pgprot_val(prot))
   982				break;
   983	
   984			if (pte_dirty(ptent))
   985				*any_dirty = true;
   986	
   987			pfn++;
   988			pte++;
   989		}
   990	
   991		return i;
   992	}
   993	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
