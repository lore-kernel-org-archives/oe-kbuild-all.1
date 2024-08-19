Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC6613D243
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724049388; cv=none; b=qe5Av3Er43+PdbReTN0nMhV4pKi9QzXh6LVFNH7B0v85JyQePjGTbvNXW73TbuHzy9dp6obWD4C+igiYMxXEEbgIKQD5fTjA2ZUdJcZobvzUfy0cdeajdJyc+H0we97PHoza3yK82vtowuqBAdPA9ucAa6Pl99ubDMfbTzHbpZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724049388; c=relaxed/simple;
	bh=fjekVTmvf28YXmdIWRb2N1fO0rPxzWEZLmEOLyGfOkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gs9uXCxg054yG+3z5c8cwjao/JGf6+AUN/CQQJ8Ubb3WbvcorSRpe+MCEwhf8KJEmcno/W6iPUWXpMuWnBLfmgzN5BFGYZLJItrAzQ1XlflI5thdI4w5P1597kBWVD5g6G4HlkG0MZ+TvD6lWkthHp5hQXsaz+jTgDP9tPY/Jxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxWl8EkC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxWl8EkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724049386; x=1755585386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjekVTmvf28YXmdIWRb2N1fO0rPxzWEZLmEOLyGfOkk=;
  b=OxWl8EkCuuGqv6i/r5I0wmqPMeMYFgngFFMQr4mk4xoi1BqkeEo2QlS9
   tc3AGAnxFe869zQdoBDgZS9ShRhxrNJFNM5KAJRwcIuFyEq7Z+y2VJluJ
   vjIgUwRXMHnUebirlwAlTE5yLxD1a9/jSQ8cJA8RFS5lajfuMPkof0KMz
   jE/WIAAJ6QJ21TEjcK42jXH3LY1jFvIp33oKmdmLmksXt5NvYrKtXBhfx
   xkT2IQhPOlU4FRWS7e+wyIh1o+HKZhyvvFanFocLK5MWUSrN5raG4dVdk
   fQKMeadOoN+LCWvFmxLoN8nknwUFkB6Su1oG7RMbuQteappjMAXoBtwge
   A==;
X-CSE-ConnectionGUID: Ym2NGJu8RiiAJAe93pzSaQ==
X-CSE-MsgGUID: L0E/jL7FT6CUrp5Z4Slg1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22093715"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="22093715"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 23:36:26 -0700
X-CSE-ConnectionGUID: aFbGXjuYQB+EOR05sbfVfA==
X-CSE-MsgGUID: oUQzT+yVQp2g7V0tgEnGtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="60263951"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2024 23:36:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfw06-0008hG-2B;
	Mon, 19 Aug 2024 06:36:22 +0000
Date: Mon, 19 Aug 2024 14:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 24/34] mm/vmscan.c:3414:67: warning:
 iteration 3 invokes undefined behavior
Message-ID: <202408191456.zk9Rs3I8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   6a133dc6e8e68425c1cece567147608d8ba2e606
commit: c5999e6682517877977a01466899e96eeff62f61 [24/34] CHROMIUM: mm/mglru: age at different rates
config: i386-buildonly-randconfig-003-20240819 (https://download.01.org/0day-ci/archive/20240819/202408191456.zk9Rs3I8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408191456.zk9Rs3I8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408191456.zk9Rs3I8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1379:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1379 |         int err;
         |             ^~~
   mm/vmscan.c: In function 'reset_ctrl_pos':
>> mm/vmscan.c:3414:67: warning: iteration 3 invokes undefined behavior [-Waggressive-loop-optimizations]
    3414 |                 total_nr_pages += lrugen->nr_pages[next_gen][type][tier];
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   mm/vmscan.c:3401:29: note: within this loop
    3401 |         for (tier = 0; tier < MAX_NR_TIERS; tier++) {


vim +3414 mm/vmscan.c

  3387	
  3388	static void reset_ctrl_pos(struct lruvec *lruvec, int type)
  3389	{
  3390		int hist, tier;
  3391		struct lru_gen_page *lrugen = &lruvec->lrugen;
  3392		unsigned long carry_from_seq = lrugen->min_seq[type];
  3393		unsigned long next_seq = carry_from_seq + 1;
  3394		unsigned long next_gen = lru_gen_from_seq(next_seq);
  3395		long total_nr_pages = 0;
  3396	
  3397		lockdep_assert_held(&lruvec->lru_lock);
  3398	
  3399		hist = lru_hist_from_seq(carry_from_seq);
  3400	
  3401		for (tier = 0; tier < MAX_NR_TIERS; tier++) {
  3402			unsigned long sum;
  3403	
  3404			sum = lrugen->avg_refaulted[type][tier] +
  3405			      atomic_long_read(&lrugen->refaulted[hist][type][tier]);
  3406			WRITE_ONCE(lrugen->avg_refaulted[type][tier], sum / 2);
  3407	
  3408			sum = lrugen->avg_total[type][tier] +
  3409			      atomic_long_read(&lrugen->evicted[hist][type][tier]);
  3410			if (tier)
  3411				sum += lrugen->protected[hist][type][tier - 1];
  3412			WRITE_ONCE(lrugen->avg_total[type][tier], sum / 2);
  3413	
> 3414			total_nr_pages += lrugen->nr_pages[next_gen][type][tier];
  3415		}
  3416		/* nr_pages is eventually consistent, so fix up the estimate if it's negative. */
  3417		total_nr_pages = max(total_nr_pages, 0);
  3418	
  3419		if (NR_HIST_GENS == 1)
  3420			reset_histograms(lruvec, type, carry_from_seq);
  3421	
  3422		hist = lru_hist_from_seq(next_seq);
  3423		WRITE_ONCE(lrugen->victim_seq[hist][type], READ_ONCE(lrugen->min_seq[!type]));
  3424		WRITE_ONCE(lrugen->oldest_gen_size[hist][type], total_nr_pages);
  3425	}
  3426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
