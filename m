Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262664;
	b=4AfdSGDr9SwG9DhBieUE0bZRSq2zxHQ0O60hyL8wuF8rz6L7e1agxHySohbMIgGVbwdR
	 xx7c/ssMVGmanyvxXIm2S7wt4bnZvM7BwvVkj396F9xG25sTvj2DTfFPJZUcELwqq20sa
	 2E5nOH0KNheDDiIop/+HaSiaXAmAFJR3LLQl4RWRw/v+r8Lp2YSOi71boHZxWoneiiN94
	 LmwHRpdB4KtwADcL6TpSTxFEoxRjK4BhIFv2fgCUQIBDFBAI1CaROIS2XdzeEreHW+5dN
	 RXU+6CGFGMkmERO43hGKekhg9ZjINpNKYEwweGXcgpqhEEATF0yNG8WUk92zbUvujcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262664;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8XwtdwbZYFdmmX1DSJG9P7gRtCoB3o3/Wv87V3JsG8c=;
	b=2HYkEasj4CskEJ3jacTPYJMaqUFeyETMbHrgYo5SAb1WvJeVzuicbVlGezfBU6+tSbPs
	 EdUm7TenyPooRVeXQy9LF2WyACJ6/8NwE10n8J72/sfZEK+DUKbP/C56xQPJ8T5C9Iv/o
	 7+TT6j+RBmJoFJInXWkkk1bDh0Dk5vat4iR/af/yFFNbva3RanhI5tUDQYsKC26X5qeF0
	 5WcQHSqmSQgDqHUME6xW3U0MATfMW6knd7Xrwccq0hgGeXjYjvYoCi6XtUlZSKKA1a6zx
	 dTFhE45f1UsIcWqy021HNkZHrNS7Vft4CFywF6BIYIHea5WFqZTZJf/CKrucQd9N1xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GnJjNdV4;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC5606A320
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 12:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FBC5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GnJjNdV4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795262664; x=1826798664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKdeB+wr3Nzs08DbegGP73NUWcovwjcle7gER9Hs2oU=;
  b=GnJjNdV4RPUfuCzhT2bu25kqBuGZ8FbX+zxSWsgWsHIO+odLJufsgGD0
   AaclUZ6D+fGvvpJOOnOjUU9J6OwlrQxrpMt9jOaJ82JeJTQ9282MojHGJ
   xJOUKrvgqpFC2GyHGaueHJLkgqOp4EZUcNvkP3m11l/LJMcLj6qA2jesO
   27hSUDu7qwXkFkAJLd1YwDjv3vJMo7AN7FnILr31yWuTUl6klLnhVA4mg
   KLZdxVDP14BbAzcrZLBicj01AQ+U/pfV86vFG2HiM0cM7V9NVd82sXU9O
   c5jLqTuhMvsGTk4ZhJ5ObUZgGh9rCDZIsAp49K6KhuQNmulXiS6PsduWf
   Q==;
X-CSE-ConnectionGUID: v45jmWecTzGjk1zlAhchjw==
X-CSE-MsgGUID: 3PuTcLyJRZa8VVZSTK1lGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4230894"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4230894"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 04:04:18 -0800
X-CSE-ConnectionGUID: KG/XGnIkSiKaHwllfgg6gA==
X-CSE-MsgGUID: YCGXuvyeRl+S6jfxEcF6oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10806193"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2026 04:04:05 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUjp2-00000001K07-37dQ;
	Sat, 21 Nov 2026 12:04:00 +0000
Date: Sat, 21 Nov 2026 20:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price via B4 Relay <devnull+gourry.gourry.net@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Byungchul Park <byungchul@sk.com>,
	Alistair Popple <apopple@nvidia.com>, SJ Park <sj@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 54/60] mm/migrate: route explicit NUMA migration to
 private nodes
Message-ID: <202611211932.YlkRbmjS-lkp@intel.com>
References: <20261120-private_nodes_v6-v1-54-74f5f9a115c2@gourry.net>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-private_nodes_v6-v1-54-74f5f9a115c2@gourry.net>

Hi Gregory,

kernel test robot noticed the following build errors:

[auto build test ERROR on 15f114dac9a7bde1796f0e54e22726fd31cfa8a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price-via-B4-Relay/nodemask-add-node-state-iterators/20261120-130852
base:   15f114dac9a7bde1796f0e54e22726fd31cfa8a5
patch link:    https://lore.kernel.org/r/20261120-private_nodes_v6-v1-54-74f5f9a115c2%40gourry.net
patch subject: [PATCH 54/60] mm/migrate: route explicit NUMA migration to private nodes
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261121/202611211932.YlkRbmjS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211932.YlkRbmjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611211932.YlkRbmjS-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate.c: In function 'alloc_migration_target':
>> mm/migrate.c:2254:24: error: implicit declaration of function '__folio_alloc_flags'; did you mean 'folio_alloc_swap'? [-Wimplicit-function-declaration]
    2254 |                 return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
         |                        ^~~~~~~~~~~~~~~~~~~
         |                        folio_alloc_swap
>> mm/migrate.c:2254:24: error: returning 'int' from a function with return type 'struct folio *' makes pointer from integer without a cast [-Wint-conversion]
    2254 |                 return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2255 |                                            mtc->alloc_flags);
         |                                            ~~~~~~~~~~~~~~~~~


vim +2254 mm/migrate.c

  2216	
  2217	struct folio *alloc_migration_target(struct folio *src, unsigned long private)
  2218	{
  2219		struct migration_target_control *mtc;
  2220		gfp_t gfp_mask;
  2221		unsigned int order = 0;
  2222		int nid;
  2223		enum zone_type zidx;
  2224	
  2225		mtc = (struct migration_target_control *)private;
  2226		gfp_mask = mtc->gfp_mask;
  2227		nid = mtc->nid;
  2228		if (nid == NUMA_NO_NODE)
  2229			nid = folio_nid(src);
  2230	
  2231		if (folio_test_hugetlb(src)) {
  2232			struct hstate *h = folio_hstate(src);
  2233	
  2234			gfp_mask = htlb_modify_alloc_mask(h, gfp_mask);
  2235			return alloc_hugetlb_folio_nodemask(h, nid,
  2236							mtc->nmask, gfp_mask,
  2237							htlb_allow_alloc_fallback(mtc->reason));
  2238		}
  2239	
  2240		if (folio_test_large(src)) {
  2241			/*
  2242			 * clear __GFP_RECLAIM to make the migration callback
  2243			 * consistent with regular THP allocations.
  2244			 */
  2245			gfp_mask &= ~__GFP_RECLAIM;
  2246			gfp_mask |= GFP_TRANSHUGE;
  2247			order = folio_order(src);
  2248		}
  2249		zidx = folio_zonenum(src);
  2250		if (is_highmem_idx(zidx) || zidx == ZONE_MOVABLE)
  2251			gfp_mask |= __GFP_HIGHMEM;
  2252	
  2253		if (mtc->alloc_flags)
> 2254			return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
  2255						   mtc->alloc_flags);
  2256		return __folio_alloc(gfp_mask, order, nid, mtc->nmask);
  2257	}
  2258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
