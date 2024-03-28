Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC6374EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711645102; cv=none; b=BSanjmB10dyEgWJHpNrmvvr2kYO4nAKsKS+/XfoyV8/d6/LleyOZLnj4aIJNfcFD8iZD5X91ng8HHvVd6a5l0GgSdPAAQF4YSKpS6CbeLBhCbnsf5yIb2RAvTmTWMRUkrTUTodcz1VASEImfNYLMkWCMnFeSUOtIFp/rXNQV0iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711645102; c=relaxed/simple;
	bh=Le6/APmdRErlI8fvbN7RxrMby23r/eqTtrfxMeOFxKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V98p0prDblsn20m67+Z74Oet4Cqg8V1ErNywr02WV1nRARqvwnS0SZBUQ6viBPx8iGngh820dKbolD22jWp0n+CnEtB6iqbwNxJuFxtBO9/fkEcb3exBC2lckRKJVFvOwUhxaMf/eBVtTLfayoaiimJ+xL8fIZeOd3Qm2tFu7yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2qs3Rs8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2qs3Rs8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711645100; x=1743181100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Le6/APmdRErlI8fvbN7RxrMby23r/eqTtrfxMeOFxKY=;
  b=l2qs3Rs87PFcveECJ9FEgLdsnh0I185szzf2PKL9B4YPQZf+Y1yb3RHz
   NtSP5rPVcjSE8FmZKZ7png0XexrWAMspn+26Tijkqx+VxBpsEtqiTyURq
   Agt7CieA+yrYdz3jdJf9NClJvh3h+w+MvZWyFTTXg2QaC3EIdi/rl0wOO
   zfk0mxy/KWhFlrxFS4NvZNTG1KjPLEvOPBbiswnhHYswxSYvA1Kpc4E9S
   4QRkfdIq3H/vnl2Y4sufHYP4qzuhfJsXwYR+JnenAX7ugkoeAstd45IaR
   nGpxUTsAgb35LRvzCTK0aeLTbqhToc8yG7O6EogR67TnP5GKsMe3eFv+1
   g==;
X-CSE-ConnectionGUID: q5SHpNU8S86cJ8Ofq1Dnaw==
X-CSE-MsgGUID: gnggz+7fRD63qm/rKs7heg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24261542"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="24261542"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 09:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21175078"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Mar 2024 09:58:16 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpt4w-0002Mo-0X;
	Thu, 28 Mar 2024 16:58:14 +0000
Date: Fri, 29 Mar 2024 00:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	willy@infradead.org, Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 5/6] mm: memory-failure: use isolate_movable_folio() in
 mf_isolate_folio()
Message-ID: <202403290000.hSRD3CAB-lkp@intel.com>
References: <20240327141034.3712697-6-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327141034.3712697-6-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.9-rc1]
[cannot apply to akpm-mm/mm-everything next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-migrate-add-isolate_movable_folio/20240327-221513
base:   linus/master
patch link:    https://lore.kernel.org/r/20240327141034.3712697-6-wangkefeng.wang%40huawei.com
patch subject: [PATCH 5/6] mm: memory-failure: use isolate_movable_folio() in mf_isolate_folio()
config: parisc-randconfig-r051-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290000.hSRD3CAB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290000.hSRD3CAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290000.hSRD3CAB-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory-failure.c: In function 'mf_isolate_folio':
>> mm/memory-failure.c:2631:58: error: passing argument 1 of 'isolate_movable_folio' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2631 |                         isolated = isolate_movable_folio(folio,
         |                                                          ^~~~~
         |                                                          |
         |                                                          struct folio *
   In file included from mm/memory-failure.c:51:
   include/linux/migrate.h:98:55: note: expected 'struct page *' but argument is of type 'struct folio *'
      98 | static inline bool isolate_movable_folio(struct page *page, isolate_mode_t mode)
         |                                          ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/isolate_movable_folio +2631 mm/memory-failure.c

  2618	
  2619	static bool mf_isolate_folio(struct folio *folio, struct list_head *pagelist)
  2620	{
  2621		bool isolated = false;
  2622	
  2623		if (folio_test_hugetlb(folio)) {
  2624			isolated = isolate_hugetlb(folio, pagelist);
  2625		} else {
  2626			bool lru = !__folio_test_movable(folio);
  2627	
  2628			if (lru)
  2629				isolated = folio_isolate_lru(folio);
  2630			else
> 2631				isolated = isolate_movable_folio(folio,
  2632								 ISOLATE_UNEVICTABLE);
  2633	
  2634			if (isolated) {
  2635				list_add(&folio->lru, pagelist);
  2636				if (lru)
  2637					node_stat_add_folio(folio, NR_ISOLATED_ANON +
  2638							    folio_is_file_lru(folio));
  2639			}
  2640		}
  2641	
  2642		/*
  2643		 * If we succeed to isolate the folio, we grabbed another refcount on
  2644		 * the folio, so we can safely drop the one we got from get_any_page().
  2645		 * If we failed to isolate the folio, it means that we cannot go further
  2646		 * and we will return an error, so drop the reference we got from
  2647		 * get_any_page() as well.
  2648		 */
  2649		folio_put(folio);
  2650		return isolated;
  2651	}
  2652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
