Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7733640BF5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 02:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734748610; cv=none; b=JSn7GGuQMPx/vBl6wA7H+HtiJBVEMkqofPCLCDjqTd1lv8P43YyMB5Pb0QfYpcMzFYIHZuxl4m832ma3xrE/1nCSzpyWeRnU1bfa0tNXtowjt/BZBfkz1FYBm5hq5jNlb2sIzbLDfqzBJ1JmvOE3+bxkQSY9g2CMq1dgt8Az7qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734748610; c=relaxed/simple;
	bh=WdZM0GfGSN2UUn+BEAxxdyQZqk0ypzsGVOoLzQK4Avk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN4rLg1Tvuve4e+Ds4pjjbyVNj0/DLIKiJohsDWlHVv136vADLRRaxEiFFx85vWRi3jZeauUXV2nOgitQ/GPEVrvz6dh/elbUDzyvxm3Nq+zK12815+578yTeJcPLIPlZR8k6lFLgo3Jauh/NTIR2HFNxT+2qhnfr3SigRJ+k4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUVvpAjS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUVvpAjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734748608; x=1766284608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WdZM0GfGSN2UUn+BEAxxdyQZqk0ypzsGVOoLzQK4Avk=;
  b=TUVvpAjSkWxbPN4JqA8Fzdnqt+vY1WSTpdOgyKXO45siufCNCpdNsQc2
   e+Xo7ovCcoqcRBeromEXuTYw+09DjgjoaQWilLFl10qAkcfJiGJnsQ5lN
   cALx1U6mdOxCtROSL1eYCEAQINKi39pQ0AAs/iOpcJ/BfRr2ThWCKUlNz
   w0w5TWkd1nM6CuWSHv+Re4wk5leeiWUg1+wWFmmEcZpRwVD+noECEbnky
   6+Hl6S8sMWPI9dN8LZ4y5KCAfLMu2yIi6FrTRgZsrKPqeyeUaEJos4Q/Y
   qgrQqSJJLJbdsCbGfXcVrH2Xx1uuM12/2w1WRr1EqAUDWEWPRCZyy/OS+
   w==;
X-CSE-ConnectionGUID: yWRDsHvMQIGeGCu1Eufyww==
X-CSE-MsgGUID: Fs7HGKJzRn2zCO52Ci3wLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34622120"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="34622120"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 18:36:47 -0800
X-CSE-ConnectionGUID: YdLfPWEpS3OkH9vLPiVpMg==
X-CSE-MsgGUID: MMYOyeO9S5WViMDJD0AkHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99514935"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2024 18:36:44 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOpM9-0001rt-0N;
	Sat, 21 Dec 2024 02:36:41 +0000
Date: Sat, 21 Dec 2024 10:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>, akpm@linux-foundation.org,
	mhocko@suse.com, hannes@cmpxchg.org, yosryahmed@google.com,
	yuzhao@google.com, david@redhat.com, willy@infradead.org,
	ryan.roberts@arm.com, baohua@kernel.org, 21cnbao@gmail.com,
	wangkefeng.wang@huawei.com
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, chenridong@huawei.com,
	wangweiyang2@huawei.com, xieym_ict@hotmail.com
Subject: Re: [PATCH -next v5] mm: vmscan: retry folios written back while
 isolated for traditional LRU
Message-ID: <202412211023.UIBZqNFK-lkp@intel.com>
References: <20241220010931.3603111-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220010931.3603111-1-chenridong@huaweicloud.com>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/mm-vmscan-retry-folios-written-back-while-isolated-for-traditional-LRU/20241220-092147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241220010931.3603111-1-chenridong%40huaweicloud.com
patch subject: [PATCH -next v5] mm: vmscan: retry folios written back while isolated for traditional LRU
config: i386-buildonly-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241221/202412211023.UIBZqNFK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211023.UIBZqNFK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211023.UIBZqNFK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/migrate.h:8,
                    from mm/vmscan.c:42:
   include/linux/hugetlb.h:1063:5: warning: no previous prototype for 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'find_folios_written_back':
>> mm/vmscan.c:313:43: error: implicit declaration of function 'lru_gen_distance'; did you mean 'node_distance'? [-Werror=implicit-function-declaration]
     313 |                 if (lru_gen_enabled() && !lru_gen_distance(folio, false))
         |                                           ^~~~~~~~~~~~~~~~
         |                                           node_distance
   cc1: some warnings being treated as errors


vim +313 mm/vmscan.c

   285	
   286	/**
   287	 * find_folios_written_back - Find and move the written back folios to a new list.
   288	 * @list: filios list
   289	 * @clean: the written back folios list
   290	 * @is_retried: whether the list has already been retried.
   291	 */
   292	static inline void find_folios_written_back(struct list_head *list,
   293			struct list_head *clean, bool is_retried)
   294	{
   295		struct folio *folio;
   296		struct folio *next;
   297	
   298		list_for_each_entry_safe_reverse(folio, next, list, lru) {
   299			if (!folio_evictable(folio)) {
   300				list_del(&folio->lru);
   301				folio_putback_lru(folio);
   302				continue;
   303			}
   304	
   305			/* retry folios that may have missed folio_rotate_reclaimable() */
   306			if (!is_retried && !folio_test_active(folio) && !folio_mapped(folio) &&
   307			    !folio_test_dirty(folio) && !folio_test_writeback(folio)) {
   308				list_move(&folio->lru, clean);
   309				continue;
   310			}
   311	
   312			/* don't add rejected folios to the oldest generation */
 > 313			if (lru_gen_enabled() && !lru_gen_distance(folio, false))
   314				set_mask_bits(&folio->flags, LRU_REFS_FLAGS, BIT(PG_active));
   315		}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
