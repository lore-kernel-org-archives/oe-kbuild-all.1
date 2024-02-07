Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361ADEEDA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707269671; cv=none; b=DIq0gONY7nJfi5M3ueoQLqy8PLeYpRrp/KY570ebNW6osVxSyNUcfqHEK8SenHF1QEzoaK78UezCgOXtSPXmx6yGbS+rl6FmgudbFjW32x8P9s0BXrAc9xzbK+106APnEmKyEhmQDeFwTIlW//vYY3Koslv/zdEcCDaNBxC95+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707269671; c=relaxed/simple;
	bh=rvrPJK4G619kXzQpdO6yJGIjG7HESkRWGN4jM1ajWEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P8bykvLSlT3/IPoIvIdaLEq6VmHqtTSmH9g9DlyTiRt95BhmU4khbv/erePsFi1GwPEUZ+qkFhGN2oHmKm6NTfIAXQK7ozzM7/1UXZS5pTkTZ9osFJmud9TkhF6fSIxRsJ8KRtlvEQwRd3tqTeJjmCcPq01x1koM0ZR3qgT9vPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBx26T/h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBx26T/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707269669; x=1738805669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rvrPJK4G619kXzQpdO6yJGIjG7HESkRWGN4jM1ajWEY=;
  b=EBx26T/h6Pq8V4TojCF0tadayGK0iwX26rGqiDt+Lzo3PDYZqW2huvoW
   Cz7ZpVVrIlycA8q4zOSgdJaQX2UytfBtItX5i7/23nSkPT4HGeQcZmuVd
   N05ZTe30U47uaQ+zqchquvWbUzfAqJJXLjvSB6G8E9XhUIN+YsTOYget8
   qydBdTzIhF+l7fLCVCjTIoaj2kfWWXhgzbSWTJ1KP1HdE09/7khUrBj6R
   g4sQqC1rTt3HvMpUS+vg4bDB5AzS0+rZq3olh3DBbmLR96f8PnRFqTUkL
   HH2UNIDwOl3rFxFVxVPEc0Cxpxqa6QkgYAZU8f5quto2T3Nzsn9yeeb/5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11619955"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="11619955"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="32006389"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Feb 2024 17:34:26 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXWpT-0001xE-2q;
	Wed, 07 Feb 2024 01:34:23 +0000
Date: Wed, 7 Feb 2024 09:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-cleanups 542/548]
 fs/bcachefs/io_write.c:91:22: error: incompatible pointer types passing
 'struct time_stats_quantiles *' to parameter of type 'struct time_stats *'
Message-ID: <202402070937.SBvT1Rip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-cleanups
head:   d07e8ccdf01715f8c7fbbdea9d7910d89c6684fb
commit: 2305f6e0a722327c9e83a1a353ece28e101603fd [542/548] time_stats: split stats-with-quantiles into a separate structure
config: x86_64-buildonly-randconfig-002-20240206 (https://download.01.org/0day-ci/archive/20240207/202402070937.SBvT1Rip-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070937.SBvT1Rip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070937.SBvT1Rip-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/io_write.c:91:22: error: incompatible pointer types passing 'struct time_stats_quantiles *' to parameter of type 'struct time_stats *' [-Werror,-Wincompatible-pointer-types]
      91 |         __time_stats_update(&ca->io_latency[rw], submit_time, now);
         |                             ^~~~~~~~~~~~~~~~~~~
   include/linux/time_stats.h:111:45: note: passing argument to parameter 'stats' here
     111 | void __time_stats_update(struct time_stats *stats, u64, u64);
         |                                             ^
   1 error generated.


vim +91 fs/bcachefs/io_write.c

1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  64  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  65  void bch2_latency_acct(struct bch_dev *ca, u64 submit_time, int rw)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  66  {
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  67  	atomic64_t *latency = &ca->cur_latency[rw];
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  68  	u64 now = local_clock();
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  69  	u64 io_latency = time_after64(now, submit_time)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  70  		? now - submit_time
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  71  		: 0;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  72  	u64 old, new, v = atomic64_read(latency);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  73  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  74  	do {
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  75  		old = v;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  76  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  77  		/*
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  78  		 * If the io latency was reasonably close to the current
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  79  		 * latency, skip doing the update and atomic operation - most of
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  80  		 * the time:
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  81  		 */
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  82  		if (abs((int) (old - io_latency)) < (old >> 1) &&
2cd0563461b68b fs/bcachefs/io.c       Brett Holman    2021-05-16  83  		    now & ~(~0U << 5))
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  84  			break;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  85  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  86  		new = ewma_add(old, io_latency, 5);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  87  	} while ((v = atomic64_cmpxchg(latency, old, new)) != old);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  88  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  89  	bch2_congested_acct(ca, io_latency, now, rw);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  90  
753f4c53cf0ad1 fs/bcachefs/io_write.c Kent Overstreet 2024-02-01 @91  	__time_stats_update(&ca->io_latency[rw], submit_time, now);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  92  }
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  93  

:::::: The code at line 91 was first introduced by commit
:::::: 753f4c53cf0ad12ccf6cfef1681ec07b79fb0555 time_stats: Promote to lib/

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
