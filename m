Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360D622F167
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740661874; cv=none; b=nVoJSMwlK7MdAokNjncH4i2z8Zaim2XKka31ap+OqvU7/mA0Xnd1w81cQ6LMAJGLNybAg5zHwrqCMvls7UZaTGkB7tKpDBIkV6ZvwXKkpjkdsocgRQgSum3DrflV9MgNNNLGJI1hq1iF4NNE1mEzUsT/iCOUhuPnH18I0e7TA30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740661874; c=relaxed/simple;
	bh=F/5ZRyYa37EUn/4cnmoR9x07uPAuHO3YwgjwPhE5gQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbXlNcaulsk0eZarJsSchKQyCEgcGWO0S3I5XvwYZ2oLoJ6UEOej6ysA4tt0tUZhyng3Iy8OnoAIlGyPbYctmGQUOSgTqKUJMbnzA/jLEOiWCWETsZrMFC9egWaQCnh6y0wCbFziWgKA+icrH7WLX7VWuw5WyUmI8GmBvSsHfXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDDmIur7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDDmIur7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740661873; x=1772197873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F/5ZRyYa37EUn/4cnmoR9x07uPAuHO3YwgjwPhE5gQw=;
  b=NDDmIur71hG07iPVUCedqJfQtGElkBgnkKjjNCV/J4FKdumUxLpZPErN
   0X0Ja1k1H06/aUkgCS96Xgtyr33oKiQbbpcYHNKUVGbPLZO5xlGEvollS
   LpxQl5ch+2U5kjCjwSducJe2EIGIijilTR5FzgkIT3Q3XX1q5AJnQ841T
   pbLOQNS2W0S+8Z061Y9oSAgVHW/WxIeIleAAa3Tn7rIZbfEsVNnC58VGW
   tYEgwEdvOTgahOE8aIWK9P7N0t5sxLTASSXs4/sf+WupZw3EW9wM4hCRm
   V2N5CY8KyrytUyMoMDuxZLU2JO/tSYxKGfYGoFsBJGhrLDqmdAauV04bv
   Q==;
X-CSE-ConnectionGUID: CetFp2+1St2+XhHRB69ECQ==
X-CSE-MsgGUID: BN/T9ru+T8SlGyl0W+x7cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41680682"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41680682"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 05:11:12 -0800
X-CSE-ConnectionGUID: pldlnvLCT8WQh63aywd86g==
X-CSE-MsgGUID: H3Vnl71XQmqLn/px/eaFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117667490"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Feb 2025 05:11:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tndfQ-000DO6-0A;
	Thu, 27 Feb 2025 13:11:08 +0000
Date: Thu, 27 Feb 2025 21:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Haifeng Xu <haifeng.xu@shopee.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] io_uring: fix the dead lock between io_uring and core dump
Message-ID: <202502272014.3MUGtfQ4-lkp@intel.com>
References: <20250226113936.385747-1-haifeng.xu@shopee.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226113936.385747-1-haifeng.xu@shopee.com>

Hi Haifeng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haifeng-Xu/io_uring-fix-the-dead-lock-between-io_uring-and-core-dump/20250226-194045
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250226113936.385747-1-haifeng.xu%40shopee.com
patch subject: [RFC] io_uring: fix the dead lock between io_uring and core dump
config: i386-buildonly-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272014.3MUGtfQ4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272014.3MUGtfQ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272014.3MUGtfQ4-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'sched_submit_work':
>> kernel/sched/core.c:6791:45: error: 'struct task_struct' has no member named 'io_uring'
    6791 |         struct io_uring_task *io_uring = tsk->io_uring;
         |                                             ^~


vim +6791 kernel/sched/core.c

  6786	
  6787	static inline void sched_submit_work(struct task_struct *tsk)
  6788	{
  6789		static DEFINE_WAIT_OVERRIDE_MAP(sched_map, LD_WAIT_CONFIG);
  6790		unsigned int task_flags;
> 6791		struct io_uring_task *io_uring = tsk->io_uring;
  6792	
  6793		/*
  6794		 * Establish LD_WAIT_CONFIG context to ensure none of the code called
  6795		 * will use a blocking primitive -- which would lead to recursion.
  6796		 */
  6797		lock_map_acquire_try(&sched_map);
  6798	
  6799		task_flags = tsk->flags;
  6800		/*
  6801		 * If a worker goes to sleep, notify and ask workqueue whether it
  6802		 * wants to wake up a task to maintain concurrency.
  6803		 */
  6804		if (task_flags & PF_WQ_WORKER)
  6805			wq_worker_sleeping(tsk);
  6806		else if (task_flags & PF_IO_WORKER)
  6807			io_wq_worker_sleeping(tsk);
  6808		else if ((task_flags & PF_DUMPCORE) && io_uring) {
  6809			struct io_wq *wq = io_uring->io_wq;
  6810	
  6811			io_wq_cancel_tw_create(wq);
  6812		}
  6813	
  6814		/*
  6815		 * spinlock and rwlock must not flush block requests.  This will
  6816		 * deadlock if the callback attempts to acquire a lock which is
  6817		 * already acquired.
  6818		 */
  6819		SCHED_WARN_ON(current->__state & TASK_RTLOCK_WAIT);
  6820	
  6821		/*
  6822		 * If we are going to sleep and we have plugged IO queued,
  6823		 * make sure to submit it to avoid deadlocks.
  6824		 */
  6825		blk_flush_plug(tsk->plug, true);
  6826	
  6827		lock_map_release(&sched_map);
  6828	}
  6829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
