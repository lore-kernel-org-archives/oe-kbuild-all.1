Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BBD29A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 00:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766189007; cv=none; b=M4P/7/jAzFDwB2g3869t290DIgUm5ETt8bIAUv3K7Q3t2Kdv6d5sowB0Xg9VcgYdeO2Wi/hZ0fI7oHV0WuQOYH2KMac99nropTNO0Y0aJUqeaV1GraEW5T8aMqrXb8M13Fpgih/vB5cz6qVjMCFmccjVmSV3SypqnoZi6Nq/kpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766189007; c=relaxed/simple;
	bh=NnW+u9wahSTyOHRQO34xFLEXqccoDllQigGs2QZ0cqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dh9Xt9ZMErLhdNA2tV5gm2Q/LwMMPCU9VxIypTt/UTsMwqsE+rkuETJG059aIrBhySEoQJVaVAE3Z+55x9juwAvZ+I4T34+oc2Reez2JYI5mZU9IkqgwT1EyGFAansOusLhInp2dhcYWu/Lv5Z+KZ9DSHSLorpsfNRKaCtTjBUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1abls29; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1abls29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766189005; x=1797725005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NnW+u9wahSTyOHRQO34xFLEXqccoDllQigGs2QZ0cqg=;
  b=c1abls293bvtaT3+494pfOVx3WAY3PTCct8BLEvQwESnWXrbgtNEML6b
   60J5YD/Dc+GiMFIRzLlDPmSrY4dkzycnh2GzhNDTr2WJ85bEm0WJDMDlP
   KOZj8m0DcAmFJhLm0byq+OMB1UOaHmYjAjes1N10R8qKIQgHyFnoQNGpS
   2TdJvgqyEE7AKawqQWiZ8704W2nYmC+Wb7gI5z6r6XnaIj3DGk9J3V3V+
   MuEM/qp2Qs0xtJrdsqS57yNQl8UjEWDD2Yaj5O2r8iXS/5TyhFZ0l6b15
   lMuMTheHiblzboQG3b8AMbdZFC5EXYSpt34N3itfQ5v9cX6AasuRp5SQX
   A==;
X-CSE-ConnectionGUID: o1RleMkTQuiHW+zAurDV7g==
X-CSE-MsgGUID: HJc3Uy+YTACLXOB7IcGo/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79518108"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="79518108"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 16:03:25 -0800
X-CSE-ConnectionGUID: HvuqtpkrSD+4yA0UdvkCRQ==
X-CSE-MsgGUID: TocsblCRSymEQ+Uy1A21Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="229667171"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Dec 2025 16:03:23 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWkRN-00000000485-0OSE;
	Sat, 20 Dec 2025 00:03:21 +0000
Date: Sat, 20 Dec 2025 08:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-Uncore-sysfs-ANBZ26617 18/18]
 kernel/sched/fair.c:4175:33: error: implicit declaration of function
 'cpu_load'; did you mean 'cpu_of'?
Message-ID: <202512200830.QLeichoS-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-Uncore-sysfs-ANBZ26617
head:   ca5ab61a687caf05d0e5c5b4a24434fa6fe362b0
commit: a0afbf3c5d0386fa940ad3ee5e5cda8ad0e3eced [18/18] anolis: sched: add Numa Affine feature
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251220/202512200830.QLeichoS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200830.QLeichoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200830.QLeichoS-lkp@intel.com/

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
