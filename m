Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7412E718B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 20:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507704; cv=none; b=nRCsAYXA0r+L7Xpj4nqKk9JVuGJLSdBZZLUyaaIJ9HyPPXa1ubb4emrIAxcG96gWsGAyeeuWWQPcPRBvunhvjzlGI5UtuD35Iv2s0sgMfliicQz0e+MKzsY5n08P+5VkYo/Kia/NF5asyE8NeNrBCUDIkKAo+PdcWaXuE6PIgPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507704; c=relaxed/simple;
	bh=Q5C2XofYqU243pisZ054khWCA8N9uFy3uVDJfZ/uAhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmxAd7S/5m7IXXLGxB/B/xU2sxQP2A4sFg9jjG+q9McdV8rPVa00UCtpcjItae2H5YEx5VGPGRAOlFr3dIgYoB2/oD1w5nJIAjjz3onCRTkWp6dEliMKeq/qCY+ZK/3Be/V6FUtmW/xGELCYC3T2NI1kALnh6CB9VD0w4SbUnUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSc8x4w7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSc8x4w7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768507703; x=1800043703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q5C2XofYqU243pisZ054khWCA8N9uFy3uVDJfZ/uAhY=;
  b=YSc8x4w70+wL0SEGbfUgB6tvfVot3XYMhjjjCYz/TypX5Bw6gPmCeNcr
   qygTzPujTPYNi17Ubd/4hNKdC568Xi3T/tSKK+ZsTuuT1oRNnwa5R+kCu
   8EXeF0w6/HX+ptqgZzBqWZl6Mq93e+73PfxaGm5RZgzOd3aUpBmBMU8YW
   U0iUGpHU3u3iGP7L5EMek/JHGlEKtk7QklDF6rs17wFOMJsMLWujAJXa1
   rl4QBhqxkNbtr6e+W6cszAcPCXHVtLlZYVrnDj0LC/qtKRAO+ZQZnzJvr
   pNz0YMQtqbwo1vFOuIZhH+ItmfocCS4ynmDhMzfLjWODNuusiJ5j4z5Hx
   Q==;
X-CSE-ConnectionGUID: 8RnMTTYsTvWi0gf7HXjL6w==
X-CSE-MsgGUID: XnAyguVSR9qkGCVvNRlxVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69872539"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69872539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 12:08:22 -0800
X-CSE-ConnectionGUID: iFRhQ7E4TOyJh/m2i7Xs/g==
X-CSE-MsgGUID: yl5Fr9LNT9e1fGL6INOang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="205319611"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 12:08:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgTda-00000000Jwq-3U3G;
	Thu, 15 Jan 2026 20:08:10 +0000
Date: Fri, 16 Jan 2026 04:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/3] sched: add helpers for numa balancing
Message-ID: <202601160350.o0ePJUOJ-lkp@intel.com>
References: <20260113121238.11300-2-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113121238.11300-2-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/sched-add-helpers-for-numa-balancing/20260113-201425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260113121238.11300-2-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 1/3] sched: add helpers for numa balancing
config: s390-randconfig-r073-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160350.o0ePJUOJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160350.o0ePJUOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160350.o0ePJUOJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'pgdat_balanced':
>> mm/vmscan.c:6776:21: error: implicit declaration of function 'task_numab_mode_tiering' [-Werror=implicit-function-declaration]
    6776 |                 if (task_numab_mode_tiering())
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   mm/migrate.c: In function 'folio_migrate_flags':
>> mm/migrate.c:806:13: error: implicit declaration of function 'task_numab_mode_tiering' [-Werror=implicit-function-declaration]
     806 |         if (task_numab_mode_tiering()) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/task_numab_mode_tiering +6776 mm/vmscan.c

  6757	
  6758	/*
  6759	 * Returns true if there is an eligible zone balanced for the request order
  6760	 * and highest_zoneidx
  6761	 */
  6762	static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
  6763	{
  6764		int i;
  6765		unsigned long mark = -1;
  6766		struct zone *zone;
  6767	
  6768		/*
  6769		 * Check watermarks bottom-up as lower zones are more likely to
  6770		 * meet watermarks.
  6771		 */
  6772		for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
  6773			enum zone_stat_item item;
  6774			unsigned long free_pages;
  6775	
> 6776			if (task_numab_mode_tiering())
  6777				mark = promo_wmark_pages(zone);
  6778			else
  6779				mark = high_wmark_pages(zone);
  6780	
  6781			/*
  6782			 * In defrag_mode, watermarks must be met in whole
  6783			 * blocks to avoid polluting allocator fallbacks.
  6784			 *
  6785			 * However, kswapd usually cannot accomplish this on
  6786			 * its own and needs kcompactd support. Once it's
  6787			 * reclaimed a compaction gap, and kswapd_shrink_node
  6788			 * has dropped order, simply ensure there are enough
  6789			 * base pages for compaction, wake kcompactd & sleep.
  6790			 */
  6791			if (defrag_mode && order)
  6792				item = NR_FREE_PAGES_BLOCKS;
  6793			else
  6794				item = NR_FREE_PAGES;
  6795	
  6796			/*
  6797			 * When there is a high number of CPUs in the system,
  6798			 * the cumulative error from the vmstat per-cpu cache
  6799			 * can blur the line between the watermarks. In that
  6800			 * case, be safe and get an accurate snapshot.
  6801			 *
  6802			 * TODO: NR_FREE_PAGES_BLOCKS moves in steps of
  6803			 * pageblock_nr_pages, while the vmstat pcp threshold
  6804			 * is limited to 125. On many configurations that
  6805			 * counter won't actually be per-cpu cached. But keep
  6806			 * things simple for now; revisit when somebody cares.
  6807			 */
  6808			free_pages = zone_page_state(zone, item);
  6809			if (zone->percpu_drift_mark && free_pages < zone->percpu_drift_mark)
  6810				free_pages = zone_page_state_snapshot(zone, item);
  6811	
  6812			if (__zone_watermark_ok(zone, order, mark, highest_zoneidx,
  6813						0, free_pages))
  6814				return true;
  6815		}
  6816	
  6817		/*
  6818		 * If a node has no managed zone within highest_zoneidx, it does not
  6819		 * need balancing by definition. This can happen if a zone-restricted
  6820		 * allocation tries to wake a remote kswapd.
  6821		 */
  6822		if (mark == -1)
  6823			return true;
  6824	
  6825		return false;
  6826	}
  6827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
