Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3815A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Feb 2024 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707960893; cv=none; b=SVAn4A9XLhBKFtVcJ2hJ7on9EqK/MOBDedBspD+yfvPVxngwTCMfAcihxlXsFizYRROY9prU/gmIc9NcBF4//4i/XFEY06Uv86uyw9yYNvJJCcVDe3pjAsJ/jrzSh8jubfdUarZSf2Pt+UKnp6X29pATGbW8Ojw0nIBofagxSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707960893; c=relaxed/simple;
	bh=+gCfBEwqPQJbeOEdssoZWyIH9lXMeMLibfm4LByuPNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1tx2kYodVKuf4klon0kCQEuYSWfSkMBE0g5/COJF7uvLCl0eUO6difJZNPs2YY3ahD5XejwTytAD+8y42ddBx3epKe9C7rzw0NerFrF4XJujvW3/5Vek0237nMW1wYOOXd6E9oNPoFH3Ea6JWEOQsybX4rgEGGVlvemXs7g6YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lh+iSfNz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lh+iSfNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707960891; x=1739496891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+gCfBEwqPQJbeOEdssoZWyIH9lXMeMLibfm4LByuPNU=;
  b=Lh+iSfNz/9ki/8UKCc7FlZ0qBi5Bex6i4fC5Zww4sL67kK7ADJPDrJUD
   WM6gjPhgrojUeb5xTtnHSqV9n8BiOeIUrXtWIh+Umw4gMDubSXepRDJEa
   CsENfSLQg8oFP54l2ZAC2Cr5XgTRiuKpFw/FjTmGApx2AA56v3v+mbGKA
   oeTrZIcU9SB2LWZUadDRbqyKZSNXXOQmModNTDEvMxVm/NEct9IBTzjSN
   KGEaGm5escy3k+pdeRHZlZKVXrHd7vWrqlcpDqkBAgXtLQEjtzSm+i1VV
   CsLKvlFzR7otIFofDiN/6F2Fo2LRot5DhLTjYDlQxmI0WIWqe3V+SQrsL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2423320"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2423320"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 17:34:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3363292"
Received: from lkp-server02.sh.intel.com (HELO 94d82249bd8f) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2024 17:34:49 -0800
Received: from kbuild by 94d82249bd8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raQeE-00005Q-22;
	Thu, 15 Feb 2024 01:34:46 +0000
Date: Thu, 15 Feb 2024 09:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 16/41] kernel/sched/fair_eevdf.c:5900
 enqueue_task_fair() warn: inconsistent indenting
Message-ID: <202402150915.rVSmBp3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   3438e9b25df17b11a33eb480f57fdf0d81bd80e8
commit: e865e3abb45cea830f107c69a227ed07b28c0b43 [16/41] CHROMIUM: sched/eevdf: Adding fair_eevdf.c
config: i386-randconfig-141-20240214 (https://download.01.org/0day-ci/archive/20240215/202402150915.rVSmBp3i-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402150915.rVSmBp3i-lkp@intel.com/

smatch warnings:
kernel/sched/fair_eevdf.c:5900 enqueue_task_fair() warn: inconsistent indenting
kernel/sched/fair_eevdf.c:6675 select_idle_sibling() error: uninitialized symbol 'task_util'.
kernel/sched/fair_eevdf.c:6675 select_idle_sibling() error: uninitialized symbol 'util_min'.
kernel/sched/fair_eevdf.c:6675 select_idle_sibling() error: uninitialized symbol 'util_max'.

vim +5900 kernel/sched/fair_eevdf.c

  5851	
  5852		/*
  5853		 * If in_iowait is set, the code below may not trigger any cpufreq
  5854		 * utilization updates, so do it here explicitly with the IOWAIT flag
  5855		 * passed.
  5856		 */
  5857		if (p->in_iowait)
  5858			cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
  5859	
  5860		for_each_sched_entity(se) {
  5861			if (se->on_rq)
  5862				break;
  5863			cfs_rq = cfs_rq_of(se);
  5864			enqueue_entity(cfs_rq, se, flags);
  5865	
  5866			cfs_rq->h_nr_running++;
  5867			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  5868	
  5869			if (cfs_rq_is_idle(cfs_rq))
  5870				idle_h_nr_running = 1;
  5871	
  5872			/* end evaluation on encountering a throttled cfs_rq */
  5873			if (cfs_rq_throttled(cfs_rq))
  5874				goto enqueue_throttle;
  5875	
  5876			flags = ENQUEUE_WAKEUP;
  5877		}
  5878	
  5879		for_each_sched_entity(se) {
  5880			cfs_rq = cfs_rq_of(se);
  5881	
  5882			update_load_avg(cfs_rq, se, UPDATE_TG);
  5883			se_update_runnable(se);
  5884			update_cfs_group(se);
  5885	
  5886			cfs_rq->h_nr_running++;
  5887			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  5888	
  5889			if (cfs_rq_is_idle(cfs_rq))
  5890				idle_h_nr_running = 1;
  5891	
  5892			/* end evaluation on encountering a throttled cfs_rq */
  5893			if (cfs_rq_throttled(cfs_rq))
  5894				goto enqueue_throttle;
  5895	
  5896	               /*
  5897	                * One parent has been throttled and cfs_rq removed from the
  5898	                * list. Add it back to not break the leaf list.
  5899	                */
> 5900	               if (throttled_hierarchy(cfs_rq))
  5901	                       list_add_leaf_cfs_rq(cfs_rq);
  5902		}
  5903	
  5904		/* At this point se is NULL and we are at root level*/
  5905		add_nr_running(rq, 1);
  5906	
  5907		/*
  5908		 * Since new tasks are assigned an initial util_avg equal to
  5909		 * half of the spare capacity of their CPU, tiny tasks have the
  5910		 * ability to cross the overutilized threshold, which will
  5911		 * result in the load balancer ruining all the task placement
  5912		 * done by EAS. As a way to mitigate that effect, do not account
  5913		 * for the first enqueue operation of new tasks during the
  5914		 * overutilized flag detection.
  5915		 *
  5916		 * A better way of solving this problem would be to wait for
  5917		 * the PELT signals of tasks to converge before taking them
  5918		 * into account, but that is not straightforward to implement,
  5919		 * and the following generally works well enough in practice.
  5920		 */
  5921		if (!task_new)
  5922			update_overutilized_status(rq);
  5923	
  5924	enqueue_throttle:
  5925		if (cfs_bandwidth_used()) {
  5926			/*
  5927			 * When bandwidth control is enabled; the cfs_rq_throttled()
  5928			 * breaks in the above iteration can result in incomplete
  5929			 * leaf list maintenance, resulting in triggering the assertion
  5930			 * below.
  5931			 */
  5932			for_each_sched_entity(se) {
  5933				cfs_rq = cfs_rq_of(se);
  5934	
  5935				if (list_add_leaf_cfs_rq(cfs_rq))
  5936					break;
  5937			}
  5938		}
  5939	
  5940		assert_list_leaf_cfs_rq(rq);
  5941	
  5942		hrtick_update(rq);
  5943	}
  5944	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
