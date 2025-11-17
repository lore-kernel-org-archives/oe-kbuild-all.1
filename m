Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ECE32A3C0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763377313; cv=none; b=G7g26nL4nusDocaEkak5p2CQpfSk5H7hyr9IyHE57h06YY/tmznid0FLuh1rtlMrLX8t8f3jdkVG8bPZUtTWUvbSGSMqYJAxj0ghYP7ru0h3CG8quB4ykkvP/jidR2Tp/f9yZMtheXAc7PbsBX6xuACOnQwKn8MFsSuCrtHiRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763377313; c=relaxed/simple;
	bh=hRwi0JuEOG0/Q5wbZRQ9aEH8Xxaej/xNQwGvHlr0QlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv1DE65eLTHVWIC6sIHZnZiylJ2bwKtwgFy20dPVDSbCAiKqAb6BxSLKF/0CYXKl+eAK9TDWYIenTUcxab+xLLvCO1kKZCtA60QWlH0d+iO3D/tN7oe1xHH+7rmnKI3s1i+ea6NSzFsa2mIOIQh/UjMBLjlo/hBcDTaCD3hQM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRqJxrmn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRqJxrmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763377312; x=1794913312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hRwi0JuEOG0/Q5wbZRQ9aEH8Xxaej/xNQwGvHlr0QlY=;
  b=WRqJxrmn7amZZyxw3J3KW5TbeOB/+B0CAlLx2C+ofqnmudDO1VFfXO8d
   j83850/qTTLtxHSxFAV00lNQOeQ6JjYHs2f2Y8nTBqpVmvWZrm+RX/9vL
   qHoQo/Ob8DQIvj3KXFkJ7u3mee89WGSfqzynsFs11guXOIH7s1m1QI5Ri
   B7deK8oFFGAgl9WjUDTCntb0rYQSVFcnY6rhdHH605Y2giUkVkAiYi98w
   QSFibbkHASZ+SKY/nWOFJFak14y5Ou1OKi3xYtmviUmBCURofZAeWhgfT
   D9imiMtSjilAKCxV+VMULVVc2s3JO+RgqTspQZJDm+WS1/T1IOrI5EYpt
   w==;
X-CSE-ConnectionGUID: Sj/f+Oq5QkOM1l0TrwVivQ==
X-CSE-MsgGUID: 5bgboMOSRViT0qh5SC9riw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="88020542"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="88020542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:01:51 -0800
X-CSE-ConnectionGUID: AMVlskWeSsGBm+SpmLo+XA==
X-CSE-MsgGUID: UqsSUeOiTJOxvo5z479F8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194528105"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Nov 2025 03:01:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKwzQ-0000ST-25;
	Mon, 17 Nov 2025 11:01:44 +0000
Date: Mon, 17 Nov 2025 19:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pingfan Liu <piliu@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Chen Ridong <chenridong@huaweicloud.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com
Subject: Re: [PATCHv6 2/2] sched/deadline: Walk up cpuset hierarchy to decide
 root domain when hot-unplug
Message-ID: <202511171843.cLkhUJ9Q-lkp@intel.com>
References: <20251117092732.16419-3-piliu@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117092732.16419-3-piliu@redhat.com>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on tip/sched/core peterz-queue/sched/core linus/master v6.18-rc6 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/cgroup-cpuset-Introduce-cpuset_cpus_allowed_locked/20251117-173841
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20251117092732.16419-3-piliu%40redhat.com
patch subject: [PATCHv6 2/2] sched/deadline: Walk up cpuset hierarchy to decide root domain when hot-unplug
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251117/202511171843.cLkhUJ9Q-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171843.cLkhUJ9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171843.cLkhUJ9Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:58:
   kernel/sched/deadline.c: In function 'dl_get_task_effective_cpus':
>> kernel/sched/deadline.c:2937:9: error: implicit declaration of function 'cpuset_cpus_allowed_locked'; did you mean 'cpuset_cpus_allowed_fallback'? [-Werror=implicit-function-declaration]
    2937 |         cpuset_cpus_allowed_locked(p, cpus);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         cpuset_cpus_allowed_fallback
   cc1: some warnings being treated as errors


vim +2937 kernel/sched/deadline.c

  2910	
  2911	/*
  2912	 * This function always returns a non-empty bitmap in @cpus. This is because
  2913	 * if a root domain has reserved bandwidth for DL tasks, the DL bandwidth
  2914	 * check will prevent CPU hotplug from deactivating all CPUs in that domain.
  2915	 */
  2916	static void dl_get_task_effective_cpus(struct task_struct *p, struct cpumask *cpus)
  2917	{
  2918		const struct cpumask *hk_msk;
  2919	
  2920		hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
  2921		if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
  2922			if (!cpumask_intersects(p->cpus_ptr, hk_msk)) {
  2923				/*
  2924				 * CPUs isolated by isolcpu="domain" always belong to
  2925				 * def_root_domain.
  2926				 */
  2927				cpumask_andnot(cpus, cpu_active_mask, hk_msk);
  2928				return;
  2929			}
  2930		}
  2931	
  2932		/*
  2933		 * If a root domain holds a DL task, it must have active CPUs. So
  2934		 * active CPUs can always be found by walking up the task's cpuset
  2935		 * hierarchy up to the partition root.
  2936		 */
> 2937		cpuset_cpus_allowed_locked(p, cpus);
  2938	}
  2939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
