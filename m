Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493791C862F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 17:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759254628; cv=none; b=K4JAC5PcEVrltuUoK+7scnMJkl4SLCUj/eRcuy7TIbMLY4K0c64fFeZxfmStivDjky9pze+sOxhMbVrrqfGa6M8OfD+rM2K9R55YyKZaq2lVCiEKXusHcCpN5KUuDr4zmjNu2Kb/jIFK7r/ru2KwXB052CvdTd55ElisO/Kipq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759254628; c=relaxed/simple;
	bh=nUBg114Gst+dyJnGIGYOEQDrDhbGqHJOWoQl4ebM+M8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LksUishkx0lx/p0D1d/srutelJS8IqLfzC7o1OyjlN5Xg6yyYJfaJfud9HvqbciUNtZkUlgGqQIYhgQWjJeIcSetQgjkz9oatlHAzREt3NvQVCl9+K1TS4MrwPchNIuoHPm/v/gBGLxJp5BFyfQ8TmdMAaeGNrK1VrrqgQacPEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdZYO018; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdZYO018"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759254626; x=1790790626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nUBg114Gst+dyJnGIGYOEQDrDhbGqHJOWoQl4ebM+M8=;
  b=gdZYO018vpYAk3CjyDR7Tt4ck0meyRQ+cOtuI12Rzpus74AV7Ts9XMg0
   BDbWJ0HmYnLCCb0dQ5Voq13GlIVBt71j3idXlJ9FPSStg7yKlE21gYKFg
   JSFOMXDz3kE2yrED25B1+R7sqgww/f8nC4On1o/DusFzrmrBHzzGx0pAC
   Gp1NnlpBFfDY7GX5Uw/7ph8ndaxMlLbj7RmG/9sY1jU52+Pck+leqJiN3
   /PiKoCYh5aoydlIX2AgJsvVRtXAknhIMGZAKVqjacXdmqqLDqcD3lXdXa
   TGN0GhkfCtlwJlFYkhd61us+MrFUDZ1fzGwOGcUrYEV4aIxIyrjosuKNf
   w==;
X-CSE-ConnectionGUID: mdN+XnzrS2eLW/Gx+d42wQ==
X-CSE-MsgGUID: e/XaSBA2SgSMPblxBmVSFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49079775"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="49079775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 10:50:26 -0700
X-CSE-ConnectionGUID: Tx0gHZH7ScGGgAOW5FQm5A==
X-CSE-MsgGUID: jR0GSMm+TW2Kfnyb1yDaHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="178166386"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2025 10:50:24 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3eUX-0002OB-2T;
	Tue, 30 Sep 2025 17:50:21 +0000
Date: Wed, 1 Oct 2025 01:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 45/45] kernel/sched/fair.c:4175:33:
 error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'?
Message-ID: <202510010136.h3jnVoT9-lkp@intel.com>
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
head:   aa75e6da3895e56cacebbe71d2df72767d3e89e0
commit: a0afbf3c5d0386fa940ad3ee5e5cda8ad0e3eced [45/45] anolis: sched: add Numa Affine feature
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251001/202510010136.h3jnVoT9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010136.h3jnVoT9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010136.h3jnVoT9-lkp@intel.com/

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
