Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9631D5AA7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990365; cv=none; b=gE73V2JQn3+AD6pCyjdYIOf7DLunhdhZcZ+rm6FvpfcKAPAhoqHNSZbGw8PjJG5Z6ues5ttNyydehfMvRtEgRN16jNabxKypSS60S5IzpkfIyMtWdrkPQL7OsT9S4+1IHW6d0jlXkS4qSB0lDsois5veNMKQN3YqdWxN8MwYoJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990365; c=relaxed/simple;
	bh=PdIK3DYmpWngvwHeKXGBb2vrfPkobj3ltwaeQiTwbl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcbl1KwAdkyrvwzGCdSJImetrgrTYN5/FTURX3eUKJGlgO3EujP4MHpbSH58ZcsT+fqwoYRtZ/ASbAcbv2VtDlRgcOhqJ014dNP70CGm5vS2xROSFyeefG+FmRNr6m6ou1fNAY0dSXZdlJry1LXW5c8XiPn8vKC/Es1CTdvRptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwEmR1SG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwEmR1SG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728990364; x=1760526364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PdIK3DYmpWngvwHeKXGBb2vrfPkobj3ltwaeQiTwbl4=;
  b=jwEmR1SGjUQaMLFLjyi1raFuDfw9Ai3dk5bOs08p4djHKakQacwytV05
   Cvc1aXMg9g9ybToFObyFUHsjqtw0d0tRmW1F5GH11oq0odad8cA1tbmLR
   dgbfnEQomUfOL4207dXDa5ml8XTYm7mKhYRUETQsRQvdx9X8A3kb7oRbT
   BvAaTT2PsdY1HC6RZx6RmKTxEAxYUCh7n8t3Q5yDSP4u6VhSC5YfXcUzd
   lGewpH+SAfeQm3jmK+UYBUVZVEKATxxZJhPVdFFZIDfx9zpLKne/JwJTM
   qDvw3XUbF22LNF3i1YMELrgq3J17zaUCbMeY+2w8zPmzhIBE/zMUBoX9r
   Q==;
X-CSE-ConnectionGUID: l2ScW0CKTD+UYukB6oJ2ig==
X-CSE-MsgGUID: gT6hD2lfS0uQG85yRU2V9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="15999971"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="15999971"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:05:50 -0700
X-CSE-ConnectionGUID: IxPC3T7sQNi5vodUt2YmhA==
X-CSE-MsgGUID: wxnRt4WBSp2GQV+SoEZK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="78312577"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2024 04:05:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0fN4-000I0M-0S;
	Tue, 15 Oct 2024 11:05:46 +0000
Date: Tue, 15 Oct 2024 19:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 1/7] locking/mutex: Remove wakeups from under
 mutex::wait_lock
Message-ID: <202410151849.PvAZr1Eu-lkp@intel.com>
References: <20241011232525.2513424-2-jstultz@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011232525.2513424-2-jstultz@google.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/locking/core tip/master linus/master v6.12-rc3 next-20241015]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/locking-mutex-Remove-wakeups-from-under-mutex-wait_lock/20241012-072911
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20241011232525.2513424-2-jstultz%40google.com
patch subject: [PATCH v13 1/7] locking/mutex: Remove wakeups from under mutex::wait_lock
config: arm64-randconfig-002-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151849.PvAZr1Eu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151849.PvAZr1Eu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151849.PvAZr1Eu-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/spinlock_rt.c: In function 'rwbase_rtmutex_slowlock_locked':
>> kernel/locking/spinlock_rt.c:168:9: error: too few arguments to function 'rtlock_slowlock_locked'
     168 |         rtlock_slowlock_locked(rtm);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/locking/spinlock_rt.c:25:
   kernel/locking/rtmutex.c:1819:21: note: declared here
    1819 | static void __sched rtlock_slowlock_locked(struct rt_mutex_base *lock,
         |                     ^~~~~~~~~~~~~~~~~~~~~~


vim +/rtlock_slowlock_locked +168 kernel/locking/spinlock_rt.c

8282947f673452 Thomas Gleixner 2021-08-15  163  
8282947f673452 Thomas Gleixner 2021-08-15  164  static __always_inline int
597df069dd0d6a Peter Zijlstra  2024-10-11  165  rwbase_rtmutex_slowlock_locked(struct rt_mutex_base *rtm, unsigned int state,
597df069dd0d6a Peter Zijlstra  2024-10-11  166  			       struct wake_q_head *wake_q)
8282947f673452 Thomas Gleixner 2021-08-15  167  {
8282947f673452 Thomas Gleixner 2021-08-15 @168  	rtlock_slowlock_locked(rtm);
8282947f673452 Thomas Gleixner 2021-08-15  169  	return 0;
8282947f673452 Thomas Gleixner 2021-08-15  170  }
8282947f673452 Thomas Gleixner 2021-08-15  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
