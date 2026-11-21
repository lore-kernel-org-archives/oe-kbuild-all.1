Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247219;
	b=J/J5GtrxoXeDy4obbj9X5qN/Z1ltsJrzrgMIC41prVlD96bgHaxzf3YoT7fV+j/eqP6p
	 1bDjvClYlw9XKSmkM3FPkPl+sUIHXKPbb7N2Rbt/KqoUdB8LiNUTaxn7MTlbJSekMbaYe
	 zYN3JQ+zFZ4VOIjN6UlmI/o0y/V8gRU+k9i1O2z4VJE2m3pRoCdSxqdepiI5RIvy5Manq
	 JeJEJ1UHv/NfWvT7Reffrl6TxuzTLcJkidITXVpBO06LBIReMzAYkOSaD4BZENGvYL+Qg
	 t/22NRNpQKg1evtkQaJxiqcZ61ybMqTwUhMLnDcjw+HbU5PgN0VIFwbpSOkxRM97xiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247219;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WUt3ilp/MbYiddXzWat/1cfv3L8ANihyCynGRUpxkj0=;
	b=KCnFkjVo5kOQQ+8MDjdIZG5i/hirZnBcW9VdCCEwpR3BG408r24yzBjly6r5t+ioHjNc
	 cjN9roquqzVTBS5L/9bxENlwvWWEDvStZL9RZDY+SSG9Fx1mKcyWyxSjhNypOIpOlE6Ib
	 QOrmDOFaE80fJq1sXTfBiN2lJ11ahDwNWD5HgZTNwtFl+ZjpcAIvRtM9Za0ssfiHaWXJe
	 NJpJJel5NzTwDVyaSLqVH/KEJtfo/QJNBevN85pDocFQq00JzAd1M/5CUHqssMstBqBrA
	 O3PsZ7olVtEZpsR5nkNSkmMNDETkbugRrBdv2/dBnE6VL3Pngz1gc58BLQL9ORi4HkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O1LiuYRL;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F96606A320
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 07:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F96606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O1LiuYRL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795247218; x=1826783218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Pg1BhUYFt8ZDrzTh0ylBvqkYCJh/9VFw/AThGXyM5I=;
  b=O1LiuYRLwZFaOZDCuEAtGyPza0WLUdLuCnpi0lCmbUL3km0kG/vE+EV6
   kdZdT/LOihcUk/pg73KfLW84I6wA8Qh0VxgZgzoS5EL/Pum8KXy4V211x
   z4/jrA7FiUVtwMMcreo4/OjcRzGpuQPMwfmPtTslZJ7r4vpw7elBGI6GL
   erNAbPVP9Cw6vI2Y2YUjw+/6p5532VimeBQz9YTggqpK5oKFBwspFDW0f
   Eo4FKl3c9wUz3zlzh+W+DgJkMuJLX2QHwB5RMm+DLhIWOEOINXVRr64oF
   Xx3eq0BRaBEHf+KtcIaKstGJJl7K6NOaL77QcaT8W9tGokfBXfqjABXKW
   Q==;
X-CSE-ConnectionGUID: bz2AGTT+RZOWIpTjWTJDRA==
X-CSE-MsgGUID: dZ1KvO0ZS6ucAkZQ0NOV9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4119035"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4119035"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 23:46:58 -0800
X-CSE-ConnectionGUID: /A1rNDpfSRKPQJZ/G5VcoA==
X-CSE-MsgGUID: rKyVTveQSDmIR0gpKJ/nNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10869395"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2026 23:46:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUfo7-00000001Jjv-3U8J;
	Sat, 21 Nov 2026 07:46:47 +0000
Date: Sat, 21 Nov 2026 15:46:32 +0800
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
Message-ID: <202611211523.63iOZgBX-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 15f114dac9a7bde1796f0e54e22726fd31cfa8a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price-via-B4-Relay/nodemask-add-node-state-iterators/20261120-130852
base:   15f114dac9a7bde1796f0e54e22726fd31cfa8a5
patch link:    https://lore.kernel.org/r/20261120-private_nodes_v6-v1-54-74f5f9a115c2%40gourry.net
patch subject: [PATCH 54/60] mm/migrate: route explicit NUMA migration to private nodes
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20261121/202611211523.63iOZgBX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211523.63iOZgBX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611211523.63iOZgBX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/migrate.c: In function 'alloc_migration_target':
   mm/migrate.c:2254:24: error: implicit declaration of function '__folio_alloc_flags'; did you mean 'folio_alloc_swap'? [-Werror=implicit-function-declaration]
    2254 |                 return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
         |                        ^~~~~~~~~~~~~~~~~~~
         |                        folio_alloc_swap
>> mm/migrate.c:2254:24: warning: returning 'int' from a function with return type 'struct folio *' makes pointer from integer without a cast [-Wint-conversion]
    2254 |                 return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2255 |                                            mtc->alloc_flags);
         |                                            ~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
