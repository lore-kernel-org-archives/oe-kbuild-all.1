Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306CDF6B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708871676; cv=none; b=Bubt2QhnnzUbiL0u8m5tdKXvfFQiMlgyjHLLB3xAYZjLTo65t8OsE8+fI68u8xpqD/8CzjBO2MF89ThCD39C/T7BH0P5GzjnhxbtaZup+o/PHfvInbwMgpy+JoFfoiucOI2dblzV4CUSZRno44cLUeIqZOvtsBLYwK9xGHFaK54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708871676; c=relaxed/simple;
	bh=FuN/LLlwUHngBM7jgsr1QFnynqGCjQsDNOhzfq8PRUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PwBaUCMbrML+8OFjv6L4gr/uCntQFua8linzbHvXvGtzQgLO2XvgJJXsY8HblJA7JxMl73gFIq5fp8wfQU+eJbKRDxNwW78Oj2gkTBu9Bbs2AdNpBU0ezZjjLr7I3MdunTDJ5VsFe4k4wDAzurUWzRjONfc9DmTV/c7enFmiX3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/grgcpK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/grgcpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708871674; x=1740407674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FuN/LLlwUHngBM7jgsr1QFnynqGCjQsDNOhzfq8PRUc=;
  b=i/grgcpK/QpWRSCn0qzzmy9TThoay++Lnti/Ac8Y6+E9kyhZQZ2EFSbf
   ES2vZl9bp1uFgi53i4s58CTaDT5yPuaYqO7qgZywRsRh9LETfzmze5kcp
   lVhwne+R8wZTwKmnrW5fzM05iVSzmhfu9PDD9/cjwNvtZhyTGSueeZb8K
   ymZgEpHRPLImhi7EnvLRLT8H7jFd2yg8ZsW5skLiT2Ql+ID2mn+elitnH
   Jtes7nE/TThFW+lysDgW0cNk8up70owiplIJstL8K0xV4P+s+ynIfec4t
   v6V5LAADSqitugu0EynfOWApeCd3o8vDLMwA01+uvkUmRviC6E1HwxFQh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3277427"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="3277427"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 06:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="29582879"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Feb 2024 06:34:32 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reFaI-0009ZQ-0S;
	Sun, 25 Feb 2024 14:34:30 +0000
Date: Sun, 25 Feb 2024 22:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 38/40] fs/xfs/xfs_zone_gc.c:307: undefined
 reference to `__udivdi3'
Message-ID: <202402252244.1BFoFw8Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   6ff8b97bc372c1b7cfea486b53b20d48f78bb987
commit: d1b56952cd4ddd3e67b03cffa9d1bbdccde4030d [38/40] xfs: support zoned RT devices
config: i386-randconfig-005-20240225 (https://download.01.org/0day-ci/archive/20240225/202402252244.1BFoFw8Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402252244.1BFoFw8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402252244.1BFoFw8Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zone_reclaim_pick':
>> fs/xfs/xfs_zone_gc.c:307: undefined reference to `__udivdi3'


vim +307 fs/xfs/xfs_zone_gc.c

   259	
   260	/*
   261	 * Iterate through all zones marked as reclaimable and find a candidate that is
   262	 * either good enough for instant reclaim, or the one with the least used space.
   263	 */
   264	static struct xfs_rtgroup *
   265	xfs_zone_reclaim_pick(
   266		struct xfs_mount	*mp)
   267	{
   268		u64			target_used = U64_MAX;
   269		struct xfs_rtgroup	*target_rtg = NULL, *rtg;
   270		unsigned long		index = 0;
   271		bool			easy = false;
   272	
   273		rcu_read_lock();
   274		xa_for_each_marked(&mp->m_rtgroups, index, rtg, XFS_RTG_RECLAIMABLE) {
   275			u64 used = *xfs_zone_used_counter(rtg);
   276	
   277			if (used >= target_used)
   278				continue;
   279			if (test_and_set_bit(RTG_F_UNDER_GC, &rtg->rtg_flags))
   280				continue;
   281			if (!atomic_inc_not_zero(&rtg->rtg_active_ref))
   282				continue;
   283	
   284			if (target_rtg) {
   285				clear_bit(RTG_F_UNDER_GC, &target_rtg->rtg_flags);
   286				xfs_rtgroup_rele(target_rtg);
   287			}
   288			target_rtg = rtg;
   289			target_used = used;
   290	
   291			/*
   292			 * Any zone that is less than 1 percent used is fair game for
   293			 * instant reclaim.
   294			 */
   295			if (used < rtg->rtg_blockcount / 100) {
   296				easy = true;
   297				break;
   298			}
   299		}
   300		rcu_read_unlock();
   301	
   302		if (target_rtg) {
   303			xfs_info(mp, "reclaiming zone %d, used = %lld/%u (%s)",
   304				target_rtg->rtg_rgno, target_used,
   305				target_rtg->rtg_blockcount,
   306				easy ? "easy" : "best");
 > 307			WRITE_ONCE(mp->m_reclaim_ratio, 100 * target_used /
   308				(target_rtg->rtg_blockcount - target_used));
   309		}
   310		return target_rtg;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
