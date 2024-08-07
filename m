Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24560823D1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723041499; cv=none; b=uUqslqUuRM/VmDOQ1W/KTc2DrFBFc89Rmw/LGMOncZyrMMku5Xhm530K8nZPWySoNWX7Hix81DMSxTk1L13NrajcuDDo1Vj7dvbe1i/5Rb5YqnOSKTOa1s8+XJO3DHGRan7Wz93nXJkgvQyU19sz5JkxFHAW31cWvTdnE/IwkGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723041499; c=relaxed/simple;
	bh=zRQpdo7BBTTcsSC2liKlqKKUzttqnArW5lEZumdXuq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFy0D5lt/A0Kn7BDm7lNMsqGWhV7EMnKyeqq/SvoWMykZHapCuDMjyg1vAu5nyr5JQzdqZP4FYxLbXwhuX0vUeP63GAEZZXOIDgkK+pnHN3/rUWTxjOvImWqYb/+6LpFHzS2szDyaTnsIdKRCG6NiOSPbaMkMVFeYc4mTmcQCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyiixmBR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyiixmBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723041497; x=1754577497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zRQpdo7BBTTcsSC2liKlqKKUzttqnArW5lEZumdXuq4=;
  b=OyiixmBRc6O7V0v0zTtjpSbzGtjJcsCsZKgxb/AT1R3CwolO582xe/1c
   reOoOQKsr3lbRySznlAQPQ0VDr4YIJiSXSfKsCrN0p1OTkdczJNi8s90i
   TtsGBhfIZTQ6NluSUSuu9nGavmW8OuBZ1RfygnFuRp6o6KCLFL/sMqRlV
   8aDr1fUXfA2BDfBWJ5zF5duQgGtW4+Vw0KxakFuvUkeW8fywFKvhwuCyo
   du+rDXNTbI6vZkN0ZdoKpBSk24S4qQGw1Od4sbrNdBkdBHoBPHESyyar5
   tIIWIBQqb+k+aIp93FK7r8rZisghk7XMRJAMjtJsQCZpSxfc5skni4LTP
   w==;
X-CSE-ConnectionGUID: sTHOCfT1Rea2qRqkjcfDjQ==
X-CSE-MsgGUID: iL2QqaayRkW9y3luapo6hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20970314"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="20970314"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 07:38:09 -0700
X-CSE-ConnectionGUID: RNoCPyQUTCKzhWtyOGo7bw==
X-CSE-MsgGUID: uPksUnPQQqyPAYU6qBC+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61756935"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2024 07:38:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbhnC-0005Sq-0Z;
	Wed, 07 Aug 2024 14:37:40 +0000
Date: Wed, 7 Aug 2024 22:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, willy@infradead.org,
	aruna.ramakrishna@oracle.com
Subject: Re: [PATCH 3/4] mm/mempolicy: Remove alloc_pages_mpol_noprof()
Message-ID: <202408072152.nuStNgLu-lkp@intel.com>
References: <20240805163120.5971-3-aruna.ramakrishna@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805163120.5971-3-aruna.ramakrishna@oracle.com>

Hi Aruna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2b820b576dfc4aa9b65f18b68f468cb5b38ece84]

url:    https://github.com/intel-lab-lkp/linux/commits/Aruna-Ramakrishna/mm-mempolicy-Make-alloc_pages_mpol_noprof-static/20240806-004215
base:   2b820b576dfc4aa9b65f18b68f468cb5b38ece84
patch link:    https://lore.kernel.org/r/20240805163120.5971-3-aruna.ramakrishna%40oracle.com
patch subject: [PATCH 3/4] mm/mempolicy: Remove alloc_pages_mpol_noprof()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240807/202408072152.nuStNgLu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408072152.nuStNgLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072152.nuStNgLu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mempolicy.c:2221: warning: expecting prototype for folio_alloc_mpol_noprof(). Prototype was for folio_alloc_mpol() instead


vim +2221 mm/mempolicy.c

4c54d94908e089 Feng Tang               2021-09-02  2208  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2209  /**
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2210   * folio_alloc_mpol_noprof - Allocate pages according to NUMA mempolicy.
eb350739605107 Matthew Wilcox (Oracle  2021-04-29  2211)  * @gfp: GFP flags.
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2212   * @order: Order of the folio allocation.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2213   * @pol: Pointer to the NUMA mempolicy.
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2214   * @ilx: Index for interleave mempolicy (also distinguishes alloc_pages()).
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2215   * @nid: Preferred node (usually numa_node_id() but @mpol may override it).
eb350739605107 Matthew Wilcox (Oracle  2021-04-29  2216)  *
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2217   * Return: The folio on success or NULL if allocation fails.
^1da177e4c3f41 Linus Torvalds          2005-04-16  2218   */
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2219  struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2220  		struct mempolicy *pol, pgoff_t ilx, int nid)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @2221  {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2222  	nodemask_t *nodemask;
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2223  	struct folio *folio;
adf88aa8ea7ff1 Matthew Wilcox (Oracle  2022-05-12  2224) 
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2225  	gfp |= __GFP_COMP;
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2226  	nodemask = policy_nodemask(gfp, pol, ilx, &nid);
4c54d94908e089 Feng Tang               2021-09-02  2227  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2228  	if (pol->mode == MPOL_PREFERRED_MANY)
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2229  		return page_rmappable_folio(
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2230  				alloc_pages_preferred_many(gfp, order,
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2231  					nid, nodemask));
19deb7695e072d David Rientjes          2019-09-04  2232  
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2233  	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2234  	    /* filter "hugepage" allocation, unless from alloc_pages() */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2235  	    order == HPAGE_PMD_ORDER && ilx != NO_INTERLEAVE_INDEX) {
19deb7695e072d David Rientjes          2019-09-04  2236  		/*
19deb7695e072d David Rientjes          2019-09-04  2237  		 * For hugepage allocation and non-interleave policy which
19deb7695e072d David Rientjes          2019-09-04  2238  		 * allows the current node (or other explicitly preferred
19deb7695e072d David Rientjes          2019-09-04  2239  		 * node) we only try to allocate from the current/preferred
19deb7695e072d David Rientjes          2019-09-04  2240  		 * node and don't fall back to other nodes, as the cost of
19deb7695e072d David Rientjes          2019-09-04  2241  		 * remote accesses would likely offset THP benefits.
19deb7695e072d David Rientjes          2019-09-04  2242  		 *
b27abaccf8e8b0 Dave Hansen             2021-09-02  2243  		 * If the policy is interleave or does not allow the current
19deb7695e072d David Rientjes          2019-09-04  2244  		 * node in its nodemask, we allocate the standard way.
19deb7695e072d David Rientjes          2019-09-04  2245  		 */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2246  		if (pol->mode != MPOL_INTERLEAVE &&
fa3bea4e1f8202 Gregory Price           2024-02-02  2247  		    pol->mode != MPOL_WEIGHTED_INTERLEAVE &&
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2248  		    (!nodemask || node_isset(nid, *nodemask))) {
cc638f329ef605 Vlastimil Babka         2020-01-13  2249  			/*
cc638f329ef605 Vlastimil Babka         2020-01-13  2250  			 * First, try to allocate THP only on local node, but
cc638f329ef605 Vlastimil Babka         2020-01-13  2251  			 * don't reclaim unnecessarily, just compact.
cc638f329ef605 Vlastimil Babka         2020-01-13  2252  			 */
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2253  			folio = __folio_alloc_node_noprof(
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2254  					gfp | __GFP_THISNODE | __GFP_NORETRY,
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2255  					order, nid);
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2256  
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2257  			if (folio || !(gfp & __GFP_DIRECT_RECLAIM))
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2258  				return folio;
76e654cc91bbe6 David Rientjes          2019-09-04  2259  			/*
76e654cc91bbe6 David Rientjes          2019-09-04  2260  			 * If hugepage allocations are configured to always
76e654cc91bbe6 David Rientjes          2019-09-04  2261  			 * synchronous compact or the vma has been madvised
76e654cc91bbe6 David Rientjes          2019-09-04  2262  			 * to prefer hugepage backing, retry allowing remote
cc638f329ef605 Vlastimil Babka         2020-01-13  2263  			 * memory with both reclaim and compact as well.
76e654cc91bbe6 David Rientjes          2019-09-04  2264  			 */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2265  		}
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2266  	}
76e654cc91bbe6 David Rientjes          2019-09-04  2267  
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2268  	folio = __folio_alloc_noprof(gfp, order, nid, nodemask);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2269  
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2270  	if (unlikely(pol->mode == MPOL_INTERLEAVE) && folio) {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2271  		/* skip NUMA_INTERLEAVE_HIT update if numa stats is disabled */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2272  		if (static_branch_likely(&vm_numa_stat_key) &&
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2273  		    folio_nid(folio) == nid) {
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2274  			preempt_disable();
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2275  			__count_numa_event(folio_zone(folio), NUMA_INTERLEAVE_HIT);
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2276  			preempt_enable();
19deb7695e072d David Rientjes          2019-09-04  2277  		}
356ff8a9a78fb3 David Rientjes          2018-12-07  2278  	}
356ff8a9a78fb3 David Rientjes          2018-12-07  2279  
116fd18cc881fc Aruna Ramakrishna       2024-08-05  2280  	return folio;
a19621ed4e0ac9 Kefeng Wang             2024-05-15  2281  }
a19621ed4e0ac9 Kefeng Wang             2024-05-15  2282  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
