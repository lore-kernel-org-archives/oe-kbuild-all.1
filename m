Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E7136663
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 05:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726636141; cv=none; b=LVJHB7c/uVsEHCOto3Md83Z10/fhBmSVxgbC3PMfwPhflP4wixDz4jWILTf7PwsdV+nqhenyeNFcIe0AG6VLtx1LDyQKtPfgAinxj9EBup/uqYmyEunT9pRTqPmcMtD7osIiCjODtA3+s1YkV5KkxiFgSo0XQup91owHOcz5RD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726636141; c=relaxed/simple;
	bh=VANSrgJhnd8vlDS2qGuVERpUxlgC2gEJskeNzMOerXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7n4IK4LMWkRWrR3ouwwY1Zeh4eYHxIQL5/+5Aw1bBugpFDNMVeWKJ9nP9O2MUZbGr4K7tF3svYrz8FCIWlyoF7bVoopZT+0UEwuouQROOlEP0pKQYXxXo8kO/BUQnqP8QGncq4kYlEeb9pu92590q1akVhJUtICEh/iFwp6LGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grd7j2vB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grd7j2vB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726636140; x=1758172140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VANSrgJhnd8vlDS2qGuVERpUxlgC2gEJskeNzMOerXs=;
  b=grd7j2vBX8MWTjDDTCSmBBCMXIkMphX/vdsnaYuNbHzugaSmDVmlgKxg
   mRktAxQf7zRl7eCmf5v0wcyy69wCBZ0HJVXXoo6ELjk61wVRGShA3DY9m
   CaVoVp5WPxv6yd9cBWnxtJWsw2u4k9LCmAeosEcVOt4XAHF8CQSET0ekX
   Y/6BZHDeBU5rH6/9ZilKTNp2xsFzK6QOIvFANEa6QXzcOOTwJHchDuaGh
   2PFP0Xvrjm1mCNbd68TGJSoQBp67XKnqWfDHfJ1quoWdOO6CLBPMVTCoP
   W4FFTDEIeGeLDQJJEdT5PX7wPIVdxeBYAeyUhU4m6ImJmx696Pu+9P/3H
   g==;
X-CSE-ConnectionGUID: P+Roa0wyShCb8Yczx4chMA==
X-CSE-MsgGUID: XVf64pdrTTCjI+RUXQ3t0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25470506"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25470506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 22:09:00 -0700
X-CSE-ConnectionGUID: 4YdcdvIGQsSuAXglY6kS4w==
X-CSE-MsgGUID: t3hNFmNjRAqxM3503ONzwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73976512"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2024 22:08:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqmvv-000Bt2-1v;
	Wed, 18 Sep 2024 05:08:55 +0000
Date: Wed, 18 Sep 2024 13:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Josef Bacik <josef@toxicpanda.com>,
	"Darrick J. Wong" <djwong@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [jlayton:mgtime 7/12] fs/inode.c:2755:58: error: macro
 "mgtime_counter_inc" passed 1 arguments, but takes just 0
Message-ID: <202409181245.Jp27U6pb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   70acbf7bd012d16994dccb4070cf18ac9b8c0923
commit: 1cce6091bbab563762f4a4d6b662613d831b4388 [7/12] fs: add percpu counters for significant multigrain timestamp events
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20240918/202409181245.Jp27U6pb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409181245.Jp27U6pb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181245.Jp27U6pb-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/inode.c: In function 'inode_set_ctime_current':
>> fs/inode.c:2755:58: error: macro "mgtime_counter_inc" passed 1 arguments, but takes just 0
    2755 |                         mgtime_counter_inc(mg_fine_stamps);
         |                                                          ^
   fs/inode.c:166: note: macro "mgtime_counter_inc" defined here
     166 | #define mgtime_counter_inc()    do { } while (0)
         | 
>> fs/inode.c:2755:25: error: 'mgtime_counter_inc' undeclared (first use in this function); did you mean 'percpu_counter_inc'?
    2755 |                         mgtime_counter_inc(mg_fine_stamps);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         percpu_counter_inc
   fs/inode.c:2755:25: note: each undeclared identifier is reported only once for each function it appears in
   fs/inode.c:2758:44: error: macro "mgtime_counter_inc" passed 1 arguments, but takes just 0
    2758 |         mgtime_counter_inc(mg_ctime_updates);
         |                                            ^
   fs/inode.c:166: note: macro "mgtime_counter_inc" defined here
     166 | #define mgtime_counter_inc()    do { } while (0)
         | 
   fs/inode.c:2772:50: error: macro "mgtime_counter_inc" passed 1 arguments, but takes just 0
    2772 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                                                  ^
   fs/inode.c:166: note: macro "mgtime_counter_inc" defined here
     166 | #define mgtime_counter_inc()    do { } while (0)
         | 
   fs/inode.c: In function 'inode_set_ctime_deleg':
   fs/inode.c:2845:50: error: macro "mgtime_counter_inc" passed 1 arguments, but takes just 0
    2845 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                                                  ^
   fs/inode.c:166: note: macro "mgtime_counter_inc" defined here
     166 | #define mgtime_counter_inc()    do { } while (0)
         | 
   fs/inode.c:2845:17: error: 'mgtime_counter_inc' undeclared (first use in this function); did you mean 'percpu_counter_inc'?
    2845 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 percpu_counter_inc
--
   kernel/time/timekeeping.c: In function 'ktime_get_real_ts64_mg':
>> kernel/time/timekeeping.c:2467:50: error: macro "mgtime_counter_inc" passed 1 arguments, but takes just 0
    2467 |                 mgtime_counter_inc(mg_floor_swaps);
         |                                                  ^
   In file included from kernel/time/timekeeping.c:30:
   kernel/time/timekeeping_internal.h:18: note: macro "mgtime_counter_inc" defined here
      18 | #define mgtime_counter_inc()    do { } while (0)
         | 
>> kernel/time/timekeeping.c:2467:17: error: 'mgtime_counter_inc' undeclared (first use in this function); did you mean 'percpu_counter_inc'?
    2467 |                 mgtime_counter_inc(mg_floor_swaps);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 percpu_counter_inc
   kernel/time/timekeeping.c:2467:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/mgtime_counter_inc +2755 fs/inode.c

  2713	
  2714	/**
  2715	 * inode_set_ctime_current - set the ctime to current_time
  2716	 * @inode: inode
  2717	 *
  2718	 * Set the inode's ctime to the current value for the inode. Returns the
  2719	 * current value that was assigned. If this is not a multigrain inode, then we
  2720	 * set it to the later of the coarse time and floor value.
  2721	 *
  2722	 * If it is multigrain, then we first see if the coarse-grained timestamp is
  2723	 * distinct from what we have. If so, then we'll just use that. If we have to
  2724	 * get a fine-grained timestamp, then do so. After that, we try to swap the new
  2725	 * value into i_ctime_nsec. We take the resulting ctime, regardless of the
  2726	 * outcome of the swap.
  2727	 */
  2728	struct timespec64 inode_set_ctime_current(struct inode *inode)
  2729	{
  2730		struct timespec64 now;
  2731		u32 cns, cur;
  2732	
  2733		ktime_get_coarse_real_ts64_mg(&now);
  2734		now = timestamp_truncate(now, inode);
  2735	
  2736		/* Just return that if this is not a multigrain fs */
  2737		if (!is_mgtime(inode)) {
  2738			inode_set_ctime_to_ts(inode, now);
  2739			goto out;
  2740		}
  2741	
  2742		/*
  2743		 * We only need a fine-grained time if someone has queried it,
  2744		 * and the current coarse grained time isn't later than what's
  2745		 * already there.
  2746		 */
  2747		cns = smp_load_acquire(&inode->i_ctime_nsec);
  2748		if (cns & I_CTIME_QUERIED) {
  2749			struct timespec64 ctime = { .tv_sec = inode->i_ctime_sec,
  2750						    .tv_nsec = cns & ~I_CTIME_QUERIED };
  2751	
  2752			if (timespec64_compare(&now, &ctime) <= 0) {
  2753				ktime_get_real_ts64_mg(&now);
  2754				now = timestamp_truncate(now, inode);
> 2755				mgtime_counter_inc(mg_fine_stamps);
  2756			}
  2757		}
  2758		mgtime_counter_inc(mg_ctime_updates);
  2759	
  2760		/* No need to cmpxchg if it's exactly the same */
  2761		if (cns == now.tv_nsec && inode->i_ctime_sec == now.tv_sec) {
  2762			trace_ctime_xchg_skip(inode, &now);
  2763			goto out;
  2764		}
  2765		cur = cns;
  2766	retry:
  2767		/* Try to swap the nsec value into place. */
  2768		if (try_cmpxchg(&inode->i_ctime_nsec, &cur, now.tv_nsec)) {
  2769			/* If swap occurred, then we're (mostly) done */
  2770			inode->i_ctime_sec = now.tv_sec;
  2771			trace_ctime_ns_xchg(inode, cns, now.tv_nsec, cur);
  2772			mgtime_counter_inc(mg_ctime_swaps);
  2773		} else {
  2774			/*
  2775			 * Was the change due to someone marking the old ctime QUERIED?
  2776			 * If so then retry the swap. This can only happen once since
  2777			 * the only way to clear I_CTIME_QUERIED is to stamp the inode
  2778			 * with a new ctime.
  2779			 */
  2780			if (!(cns & I_CTIME_QUERIED) && (cns | I_CTIME_QUERIED) == cur) {
  2781				cns = cur;
  2782				goto retry;
  2783			}
  2784			/* Otherwise, keep the existing ctime */
  2785			now.tv_sec = inode->i_ctime_sec;
  2786			now.tv_nsec = cur & ~I_CTIME_QUERIED;
  2787		}
  2788	out:
  2789		return now;
  2790	}
  2791	EXPORT_SYMBOL(inode_set_ctime_current);
  2792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
