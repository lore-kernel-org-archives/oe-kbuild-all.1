Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58972360
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 00:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754009817; cv=none; b=LOIbdSC8gQuUZnIvBFbcktEzuJlJa/9sCfOu1HSUtkxOX1pcDNNMSA1qK2NpR1Vlc56g83l83SecxcLk8HY0oFZCFbe0GTmqXCOp4OruSOJkK9slgzn3v1gFVNUf7WR1okzzfoHOQ05j54dTVJX9eLFWO+7dHlhJC4qvA0iZy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754009817; c=relaxed/simple;
	bh=90n9yuixckVkCi+zVctEyrgvHppI8VTysHpb/KncHnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQgx8LJkqA60XCF1EKnGMuTxw7/ZKWCTI8UdhKObxY99TAEtdEpL+B8TzIqRnP0wOjKcyZm0bVoPy4qwJ6VckIhhVXOIWrKfCaoqaawVDhdWX4GjgHSZIw5qiLKnJPtWKKgJtWXSrpLa+AFEspXLtgzcnFpCVJrYfTuyETvJMDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lmqew8fq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lmqew8fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754009815; x=1785545815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90n9yuixckVkCi+zVctEyrgvHppI8VTysHpb/KncHnQ=;
  b=Lmqew8fqrBh/CPxkqzOmatfFuvMp8G2Kz3d/on0j/ZSN6J3YA4BrLzXj
   PqEdWQfnUkJPQmMurbSSPOTqzi14aaY2FFcoi6YPrqEFlSkKijvT6O1yf
   PhhpXI+Zu6yOMeH9E7B2N6BzNNCBplbYWszQBNyj5p08iqVDNdo5mRGaF
   iw1/mGyO8EEEN2iHQcJkOGitoMZ0HYthr3gmEOOUlwL27IUOjh2HeMW7/
   hS2LnA99QfoClORqM6kDatv6j60aEK0MbYXhngUFVy4xzRIvdVirfWRwo
   IaHG06fYoGx7ezdudt8Tpe+g6MHqdb/NQAoWSEyw7nTUjLgIL5p3wrgBJ
   A==;
X-CSE-ConnectionGUID: P8Eby8NIR1u5ulHPLmB9Qw==
X-CSE-MsgGUID: zll1APxSS4K+Bm6SXD/w5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56285569"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56285569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 17:56:54 -0700
X-CSE-ConnectionGUID: e1UNOTTfQz+Okhl5YfcrZg==
X-CSE-MsgGUID: QlPlbivTTfuJBQV57hTbBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="168803864"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Jul 2025 17:56:54 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhe4p-0004GQ-0p;
	Fri, 01 Aug 2025 00:56:51 +0000
Date: Fri, 1 Aug 2025 08:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/4] kernel/sched/fair.c:4146:6:
 warning: no previous prototype for 'set_group_prefer_node'
Message-ID: <202508010844.sMps3s9t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   80d98c12d49f8632c6899a04f5bf44f818378777
commit: f1cb904d4a612d9b8d5f062c13c99f252b5ba920 [0/4] anolis: sched: add Numa Affine feature
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250801/202508010844.sMps3s9t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010844.sMps3s9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010844.sMps3s9t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:4146:6: warning: no previous prototype for 'set_group_prefer_node' [-Wmissing-prototypes]
    4146 | void set_group_prefer_node(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_group_prefer_node':
   kernel/sched/fair.c:4175:33: error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'? [-Werror=implicit-function-declaration]
    4175 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
         |                                 cpu_of
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:7324:22: error: conflicting types for 'cpu_load'; have 'long unsigned int(struct rq *)'
    7324 | static unsigned long cpu_load(struct rq *rq)
         |                      ^~~~~~~~
   kernel/sched/fair.c:4175:33: note: previous implicit declaration of 'cpu_load' with type 'int()'
    4175 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/set_group_prefer_node +4146 kernel/sched/fair.c

  4137	
  4138	static inline u64 cfs_rq_last_update_time(struct cfs_rq *cfs_rq)
  4139	{
  4140		return u64_u32_load_copy(cfs_rq->avg.last_update_time,
  4141					 cfs_rq->last_update_time_copy);
  4142	}
  4143	#ifdef CONFIG_FAIR_GROUP_SCHED
  4144	DEFINE_PER_CPU(struct cpumask, cpus_allowed_alt);
  4145	/* Decide which node for @tg to run on*/
> 4146	void set_group_prefer_node(struct task_group *tg)
  4147	{
  4148		int cpu, node;
  4149		unsigned long min_load = ULONG_MAX, now = jiffies, load;
  4150		static int prev_node;
  4151		static unsigned long prev_jiffies;
  4152	
  4153		/* Choose Round-Robin way with frequent call */
  4154		if (now - prev_jiffies < HZ) {
  4155			prev_jiffies = now;
  4156	
  4157			prev_node = next_online_node(prev_node);
  4158			if (prev_node >= 0 && prev_node < MAX_NUMNODES) {
  4159				tg->prefer_node = prev_node;
  4160				return;
  4161			}
  4162	
  4163			prev_node = first_online_node;
  4164			tg->prefer_node = prev_node;
  4165			return;
  4166		}
  4167	
  4168		prev_jiffies = now;
  4169	
  4170		/* find the idlest node */
  4171		prev_node = first_online_node;
  4172		for_each_online_node(node) {
  4173			load = ULONG_MAX;
  4174			for_each_cpu(cpu, cpumask_of_node(node))
  4175				load += cpu_load(cpu_rq(cpu));
  4176			if (load < min_load) {
  4177				min_load = load;
  4178				prev_node = node;
  4179			}
  4180		}
  4181	
  4182		tg->prefer_node = prev_node;
  4183	}
  4184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
