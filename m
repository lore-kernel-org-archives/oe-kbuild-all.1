Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572563597B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 01:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761529988; cv=none; b=kPriYGi1W0edJpXG90NwmEqU6ny3QCyiAsRawSH8A+MGylSgZqXSaM/n1EWNYntKecavF4fETT5rKS6dcNCzVh3thZ+5jAioopVi7K/tDRSeH49DzY0Tu4Elp5fLUAPZpLqcxKevSRNhHiRse1KzbmCmPTw5QMkgH2YjZXOm2HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761529988; c=relaxed/simple;
	bh=/F0JEet6ig/Fbl6LyRtWgwXhGAhdDhHpiDdkylxKpUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFBOQPFrHSIcWcXpthYTWyPGxNW0USQlVqFvqR9Urxc7yj6ghA6Ro4NJBpUIsFAWFs/uH+wVuocg25i5gfEXtN6EozNjXe9vy0qiYdQNJl8Zno20VNIpM+qN9GtFAwpIcU7bhWB1UvVbStubiiDSgADtC5Nns7tRWMiWPKPQwNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHokZ2t8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHokZ2t8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761529986; x=1793065986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/F0JEet6ig/Fbl6LyRtWgwXhGAhdDhHpiDdkylxKpUY=;
  b=RHokZ2t8ZlSuvtZKJmDlfSUtedpruiKTjxkCjvD7n5dNZbBzkW9eVk+K
   2DXjYWRD5bGcPKO0twSqKUTQdkTc5dPSGFU6hivtN8VW+3s3ycliZXybX
   GoOHyExr6rzTwC+FRanHtdKe/2GH48ZD6w1e9CeehNcVAyM/3m0Yq4u0g
   CESojgmiw+5imHNlGzh5hD2FA6RQDe0QgOZkVZdU9hbNbwV18+si032kU
   LSUUsmAbWZfKrs1SoK2k5BAnSZpaJMgx2Tr6duWSWfsdXNQhPN/YO9cUu
   0Eo8YMnrFN2y4O1Xg31f/dGBwpN1x6hFOJV3JNU4u7tu1tFAqTP525rFP
   A==;
X-CSE-ConnectionGUID: Brlnl5HcQk2KF5fgFEPIsQ==
X-CSE-MsgGUID: eTkHyX2uR56D4iM8gtTiAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63702177"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="63702177"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 18:53:05 -0700
X-CSE-ConnectionGUID: s1TV5jMrSuazBiM3sqJ5iw==
X-CSE-MsgGUID: ZbR+GB4hR0C65p/Pl7NBMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="189229398"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Oct 2025 18:53:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDCPt-000GS9-0d;
	Mon, 27 Oct 2025 01:53:01 +0000
Date: Mon, 27 Oct 2025 09:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 3/3] kernel/sched/fair.c:4175:33:
 error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'?
Message-ID: <202510270937.zyDN0a6M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   fa657921dedd55f9e25e42a54067b0615f308e5f
commit: a0afbf3c5d0386fa940ad3ee5e5cda8ad0e3eced [3/3] anolis: sched: add Numa Affine feature
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251027/202510270937.zyDN0a6M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270937.zyDN0a6M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270937.zyDN0a6M-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:4146:6: warning: no previous prototype for 'set_group_prefer_node' [-Wmissing-prototypes]
    4146 | void set_group_prefer_node(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_group_prefer_node':
>> kernel/sched/fair.c:4175:33: error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'? [-Wimplicit-function-declaration]
    4175 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
         |                                 cpu_of
   kernel/sched/fair.c: At top level:
>> kernel/sched/fair.c:7324:22: error: conflicting types for 'cpu_load'; have 'long unsigned int(struct rq *)'
    7324 | static unsigned long cpu_load(struct rq *rq)
         |                      ^~~~~~~~
   kernel/sched/fair.c:4175:33: note: previous implicit declaration of 'cpu_load' with type 'int()'
    4175 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~


vim +4175 kernel/sched/fair.c

  4137	
  4138	static inline u64 cfs_rq_last_update_time(struct cfs_rq *cfs_rq)
  4139	{
  4140		return u64_u32_load_copy(cfs_rq->avg.last_update_time,
  4141					 cfs_rq->last_update_time_copy);
  4142	}
  4143	#ifdef CONFIG_FAIR_GROUP_SCHED
  4144	DEFINE_PER_CPU(struct cpumask, cpus_allowed_alt);
  4145	/* Decide which node for @tg to run on*/
  4146	void set_group_prefer_node(struct task_group *tg)
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
> 4175				load += cpu_load(cpu_rq(cpu));
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
