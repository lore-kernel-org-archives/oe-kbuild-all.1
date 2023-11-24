Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7D128DD1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adtoVGyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700832137; x=1732368137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lcQocdAk1u2AMqXY89Eui6s1fuUn25cLZXGN5Md+6o0=;
  b=adtoVGywsYADaqMlrYtKiidiAuKYNRuNWNlL53jkrRUshkIKZigfrE5p
   PA5H0YiNX3McANHDsTpqv7FhypuK4hHJhTseO/ki99hl2mJ/NPvkmQ8D0
   0VgmiMiAaEiOL/2KaBiCH6FYH32OAhclV57H82LRgs6Datywox1D/Kv6Y
   7YetyYwrbRRmewlkO/3hiufQJDs6BySxrEjWowULNNvwaB+OkBpDqqpfb
   tD45+8WJkS/uOUJrHDYX0jDq3czulj5LeVQfS4YBN00eWLsknAxSbCEhA
   O0xGYPD7JXXNMABtHMd4Ip8J5ZG4Y7V28wxP643ML7ODNGlSOaPyr/BAk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="389575392"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="389575392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:21:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="15632190"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Nov 2023 05:21:35 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6W7h-0002oO-06;
	Fri, 24 Nov 2023 13:21:33 +0000
Date: Fri, 24 Nov 2023 21:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 06/27] mm: page_alloc: Allow an arch to hook early
 into free_pages_prepare()
Message-ID: <202311241507.galUWYEB-lkp@intel.com>
References: <20231119165721.9849-7-alexandru.elisei@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231119165721.9849-7-alexandru.elisei@arm.com>

Hi Alexandru,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Elisei/arm64-mte-Rework-naming-for-tag-manipulation-functions/20231120-010227
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/20231119165721.9849-7-alexandru.elisei%40arm.com
patch subject: [PATCH RFC v2 06/27] mm: page_alloc: Allow an arch to hook early into free_pages_prepare()
config: arm-randconfig-002-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241507.galUWYEB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241507.galUWYEB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241507.galUWYEB-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'free_pages_prepare':
>> mm/page_alloc.c:1089:9: error: implicit declaration of function 'arch_free_pages_prepare'; did you mean 'free_pages_prepare'? [-Werror=implicit-function-declaration]
    1089 |         arch_free_pages_prepare(page, order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         free_pages_prepare
   mm/page_alloc.c: In function 'prep_new_page':
   mm/page_alloc.c:1548:15: error: implicit declaration of function 'arch_prep_new_page'; did you mean 'prep_new_page'? [-Werror=implicit-function-declaration]
    1548 |         ret = arch_prep_new_page(page, order, gfp_flags);
         |               ^~~~~~~~~~~~~~~~~~
         |               prep_new_page
   cc1: some warnings being treated as errors


vim +1089 mm/page_alloc.c

  1075	
  1076	static __always_inline bool free_pages_prepare(struct page *page,
  1077				unsigned int order, fpi_t fpi_flags)
  1078	{
  1079		int bad = 0;
  1080		bool skip_kasan_poison = should_skip_kasan_poison(page, fpi_flags);
  1081		bool init = want_init_on_free();
  1082		bool compound = PageCompound(page);
  1083	
  1084		VM_BUG_ON_PAGE(PageTail(page), page);
  1085	
  1086		trace_mm_page_free(page, order);
  1087		kmsan_free_page(page, order);
  1088	
> 1089		arch_free_pages_prepare(page, order);
  1090	
  1091		if (unlikely(PageHWPoison(page)) && !order) {
  1092			/*
  1093			 * Do not let hwpoison pages hit pcplists/buddy
  1094			 * Untie memcg state and reset page's owner
  1095			 */
  1096			if (memcg_kmem_online() && PageMemcgKmem(page))
  1097				__memcg_kmem_uncharge_page(page, order);
  1098			reset_page_owner(page, order);
  1099			page_table_check_free(page, order);
  1100			return false;
  1101		}
  1102	
  1103		VM_BUG_ON_PAGE(compound && compound_order(page) != order, page);
  1104	
  1105		/*
  1106		 * Check tail pages before head page information is cleared to
  1107		 * avoid checking PageCompound for order-0 pages.
  1108		 */
  1109		if (unlikely(order)) {
  1110			int i;
  1111	
  1112			if (compound)
  1113				page[1].flags &= ~PAGE_FLAGS_SECOND;
  1114			for (i = 1; i < (1 << order); i++) {
  1115				if (compound)
  1116					bad += free_tail_page_prepare(page, page + i);
  1117				if (is_check_pages_enabled()) {
  1118					if (free_page_is_bad(page + i)) {
  1119						bad++;
  1120						continue;
  1121					}
  1122				}
  1123				(page + i)->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
  1124			}
  1125		}
  1126		if (PageMappingFlags(page))
  1127			page->mapping = NULL;
  1128		if (memcg_kmem_online() && PageMemcgKmem(page))
  1129			__memcg_kmem_uncharge_page(page, order);
  1130		if (is_check_pages_enabled()) {
  1131			if (free_page_is_bad(page))
  1132				bad++;
  1133			if (bad)
  1134				return false;
  1135		}
  1136	
  1137		page_cpupid_reset_last(page);
  1138		page->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
  1139		reset_page_owner(page, order);
  1140		page_table_check_free(page, order);
  1141	
  1142		if (!PageHighMem(page)) {
  1143			debug_check_no_locks_freed(page_address(page),
  1144						   PAGE_SIZE << order);
  1145			debug_check_no_obj_freed(page_address(page),
  1146						   PAGE_SIZE << order);
  1147		}
  1148	
  1149		kernel_poison_pages(page, 1 << order);
  1150	
  1151		/*
  1152		 * As memory initialization might be integrated into KASAN,
  1153		 * KASAN poisoning and memory initialization code must be
  1154		 * kept together to avoid discrepancies in behavior.
  1155		 *
  1156		 * With hardware tag-based KASAN, memory tags must be set before the
  1157		 * page becomes unavailable via debug_pagealloc or arch_free_page.
  1158		 */
  1159		if (!skip_kasan_poison) {
  1160			kasan_poison_pages(page, order, init);
  1161	
  1162			/* Memory is already initialized if KASAN did it internally. */
  1163			if (kasan_has_integrated_init())
  1164				init = false;
  1165		}
  1166		if (init)
  1167			kernel_init_pages(page, 1 << order);
  1168	
  1169		/*
  1170		 * arch_free_page() can make the page's contents inaccessible.  s390
  1171		 * does this.  So nothing which can access the page's contents should
  1172		 * happen after this.
  1173		 */
  1174		arch_free_page(page, order);
  1175	
  1176		debug_pagealloc_unmap_pages(page, 1 << order);
  1177	
  1178		return true;
  1179	}
  1180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
