Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B11633EF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777684929; cv=none; b=e7QQ+BUGaXUp4Q/592a6hVFrLZWlCjXHtTUgvcDUDjgsUS/5t0i//Pw+/8tKX/JMysYOeCQOH28Qa5v8AWjg5+A8WghrRizVmIHeTT6uZ929CEeXpk5/t868bA0tQgwBpeD1WH1tLb3/E61KNj9PEycGiQ3uPBc66DCHBxnNDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777684929; c=relaxed/simple;
	bh=E35KpeeAa2VlLiUkU5FVYNqmyXHzIlGNs1CdgipBvZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEgBJRrwQ4I47FmrBuHkzQD1KScu8f4Nj/xbE2lBiICb1Hxz/hzHUnfG0FHOD5+0oPZs+Ioa09nW9aVy6Z+5+o7DRDGAtYn7MRiyqwJ7bVnt5JYD9bTb1VkhsuIo7Jwfca6YP0s9/rb455XBYcYgDiqGSsvIzSX790qig41P+MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hY3HucSp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hY3HucSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777684928; x=1809220928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E35KpeeAa2VlLiUkU5FVYNqmyXHzIlGNs1CdgipBvZc=;
  b=hY3HucSpANLHmHieapq9KIoHLWuJiNmuTmeMn6RbV3I2I+Rp5/ye4Q+4
   +cN71hnA8gOvTglQMFjMKDRBQazC51oqNCkO2ve1sX0+AIjsdLAtS+Bob
   QVituo2ONyIqOY3VzpbbJ4IdHuSmaEIUo6q8VezlH8EiouCIAj/0Wm5yk
   h1Ri6XHJ53z7LwZpXEitNHKsXrsmcugTI7Cm3F/6PUF/jo7Je9lwI8O5t
   e4E5U4t9IKWkGbPuoPqXXnYW9OGAQZf03cIjpdUiKpVBJ3YrCNuMYuXQ/
   z6/GuRYjaohsAH97AublAoAALyXSWYr7vzR59kimJEjf1Jsd38Oz2DTY+
   g==;
X-CSE-ConnectionGUID: h9ITEMdLQ1qsDV9uUm5IvQ==
X-CSE-MsgGUID: lfYTNXBZRduQS80y5/o+Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="90023614"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="90023614"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 18:22:08 -0700
X-CSE-ConnectionGUID: hTy+gLRWTO+5KWzotouuYQ==
X-CSE-MsgGUID: 258+rH7PSViC5cEzBKLe7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="258616400"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2026 18:22:06 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIz3U-0000000012v-2ZaR;
	Sat, 02 May 2026 01:22:04 +0000
Date: Sat, 2 May 2026 09:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] mm: vmscan: keep anon scanning enabled when
 swapcache folios are present
Message-ID: <202605020936.BWbySFnE-lkp@intel.com>
References: <20260427103532.5623-2-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427103532.5623-2-thomas.hellstrom@linux.intel.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/mm-vmscan-keep-anon-scanning-enabled-when-swapcache-folios-are-present/20260428-183540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260427103532.5623-2-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH 1/1] mm: vmscan: keep anon scanning enabled when swapcache folios are present
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605020936.BWbySFnE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020936.BWbySFnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020936.BWbySFnE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:2937,
                    from mm/vmscan.c:15:
   mm/vmscan.c: In function 'can_reclaim_anon_pages':
>> mm/vmscan.c:365:45: error: 'NR_SWAPCACHE' undeclared (first use in this function)
     365 |         if (node_page_state(NODE_DATA(nid), NR_SWAPCACHE) > 0)
         |                                             ^~~~~~~~~~~~
   include/linux/vmstat.h:265:60: note: in definition of macro 'node_page_state'
     265 | #define node_page_state(node, item) global_node_page_state(item)
         |                                                            ^~~~
   mm/vmscan.c:365:45: note: each undeclared identifier is reported only once for each function it appears in
     365 |         if (node_page_state(NODE_DATA(nid), NR_SWAPCACHE) > 0)
         |                                             ^~~~~~~~~~~~
   include/linux/vmstat.h:265:60: note: in definition of macro 'node_page_state'
     265 | #define node_page_state(node, item) global_node_page_state(item)
         |                                                            ^~~~


vim +/NR_SWAPCACHE +365 mm/vmscan.c

   341	
   342	static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
   343						  int nid,
   344						  struct scan_control *sc)
   345	{
   346		if (memcg == NULL) {
   347			/*
   348			 * For non-memcg reclaim, is there
   349			 * space in any swap device?
   350			 */
   351			if (get_nr_swap_pages() > 0)
   352				return true;
   353		} else {
   354			/* Is the memcg below its swap limit? */
   355			if (mem_cgroup_get_nr_swap_pages(memcg) > 0)
   356				return true;
   357		}
   358	
   359		/*
   360		 * Even with no free swap slots, anon folios already in the swap cache
   361		 * carry a pre-allocated slot and can be written back and freed from RAM
   362		 * without consuming a new one.  Do not suppress anon scanning when such
   363		 * folios are present on this node.
   364		 */
 > 365		if (node_page_state(NODE_DATA(nid), NR_SWAPCACHE) > 0)
   366			return true;
   367	
   368		/*
   369		 * The page can not be swapped.
   370		 *
   371		 * Can it be reclaimed from this node via demotion?
   372		 */
   373		return can_demote(nid, sc, memcg);
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
