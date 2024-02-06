Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2634F4BAA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707229935; cv=none; b=lVsXxzz48qax8TCgJjLP5u3BjdO9aOh5pRoWjK+wOYQr4imf4D0jre01hICrT6aRqQfg8/h1O0oKUbqU+treSsBic19ed2izZtCrvoKadxi0QDaLFnreMFd7MrnNWOny2MvKVWhGfuYg954yZbZvBNhm37K29PxWLFiSQr5UavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707229935; c=relaxed/simple;
	bh=xOvTt7nA3MNiKdOzlIYLlawdMHY4GzYIcAqHTOxCoMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jh6zx04stXA3GoxlUBz0grPMeSnIIiSKlbau4kOPXOnR8NDwMZI/+iQcPj47NHoi07AqW3tZMS2xOI4K+o+iIoBNJkOvhzeKYxHfJVnPpZLfEkH1xzpO/nU7NZ6zvfNiGizsVGKHWyPrPx5knJFVfCtlOnZoAQ6YgdLaHXnOM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeoNQtdx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeoNQtdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707229934; x=1738765934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOvTt7nA3MNiKdOzlIYLlawdMHY4GzYIcAqHTOxCoMk=;
  b=EeoNQtdxCzaqRaG/gu0d498WsUiQ5bBVDR3FCiRnB9yvk4T1tTsLwhr4
   07fBZWAkCujGhHCqYu3lTi2ekJ9dn/H7wQ4WG0PoaLNFvqHhplsdwwnSY
   86VdhuVX7oLRmaJ+XkbRvSMRyaGHy1WuTOqhihp+jzKBU69GmxgZqPmB2
   z2KlUo5zIB2UPZ0H9XXlYGi2nLOCEc5Sif4OpuejY1+eYnU6mklp8Z+FP
   yPp5QCZyHt7s2Snb9hAFwuEgP+dIyiCwdE5gEtNhk5FXr2ouRgpcJ+PP2
   BuDYECWqZ40sGRanw8VG7JcUZfy8IlS8zyC32knef9KxpfK15Cra5JcZA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4637565"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4637565"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1032141"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2024 06:32:08 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXMUX-0001Tg-0h;
	Tue, 06 Feb 2024 14:32:05 +0000
Date: Tue, 6 Feb 2024 22:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-cleanups 542/548]
 fs/bcachefs/io_write.c:91:29: error: passing argument 1 of
 '__time_stats_update' from incompatible pointer type
Message-ID: <202402062245.phtWoJqn-lkp@intel.com>
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
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240206/202402062245.phtWoJqn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062245.phtWoJqn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062245.phtWoJqn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:208,
                    from fs/bcachefs/io_write.c:7:
   fs/bcachefs/bcachefs_format.h:221:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     221 |         struct bversion version;
         |                         ^~~~~~~
   fs/bcachefs/io_write.c: In function 'bch2_latency_acct':
>> fs/bcachefs/io_write.c:91:29: error: passing argument 1 of '__time_stats_update' from incompatible pointer type [-Werror=incompatible-pointer-types]
      91 |         __time_stats_update(&ca->io_latency[rw], submit_time, now);
         |                             ^~~~~~~~~~~~~~~~~~~
         |                             |
         |                             struct time_stats_quantiles *
   In file included from fs/bcachefs/bcachefs.h:203:
   include/linux/time_stats.h:111:45: note: expected 'struct time_stats *' but argument is of type 'struct time_stats_quantiles *'
     111 | void __time_stats_update(struct time_stats *stats, u64, u64);
         |                          ~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/__time_stats_update +91 fs/bcachefs/io_write.c

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
