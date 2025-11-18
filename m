Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCD2EACEE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448292; cv=none; b=D5Ev/plNd6E/KDRcDybbQqRP2WfkanyCGbPksyaf2lgczllrUFRIreW1TMVMxVs+cmQj/cZlVJM2XLJr/WFo2BCPIb23exCvmuLUlAp4mxqhk9EkMw+625atXFtUtKUKnvR50GNCipyh8/WQZ7hE8MS8XtMIR+bRRqHzZ5kyMWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448292; c=relaxed/simple;
	bh=IAvnJtAP0csdn50vchkxF76tMwUFkFpiV1whgiONJ6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdsMeaZzP9MQLWufo+ZHh9c9fFOnmwmj79xT9tYHmaFwm941hdQfG3TFAffz9wF3RDzSEbK1YiVfVBnFKGtNz518Mg6qYBpk2njyVgipkZftixCPVHcj5Lm3Stc4WqQD/aMx3+cOZeEaECXtPnrBNdA6eNIy41yiDVgJqX/sVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qgoq4EQu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qgoq4EQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763448291; x=1794984291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAvnJtAP0csdn50vchkxF76tMwUFkFpiV1whgiONJ6E=;
  b=Qgoq4EQuIMKDz7m47xl/VMCKIVFky/me9zHP1Ch7XqTjjSIYp7/F7yhT
   2u/QR85TWoabBSndndh6aWwYMjf2gJ3MtSOTZdUfayXt8byfwgiU82hO3
   NnjYcuVpUs6GdwOdCzq7l6m+vcE0nPlXd/11ii03czmiWmy5MFVZfI8Py
   1qr7sLzDs3w7xlA7+vtQpj2QlD06GuUJdE29ctnfnJ6/rf3KnqEsJRCDt
   NyXDihiKvwp6Cyy7EhxgWudp1OIeF1KgR5S06BgD0L/yZhC5aoNqpX7++
   8hE1TXFsXL2OPABifNGXWkOrNU1djRpcJpppBCL9dMlPb7bMbhdf9NAZk
   g==;
X-CSE-ConnectionGUID: Vp1EoZeqR62/FhsEiNZE9A==
X-CSE-MsgGUID: 4sN7oymjQLqjhSljvYF2YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76137710"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76137710"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 22:44:50 -0800
X-CSE-ConnectionGUID: cSlIMYP6TnGrpV29EZOwig==
X-CSE-MsgGUID: /VAIbOT+STGsRkPPdglNSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190903666"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2025 22:44:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLFSI-0001PX-2H;
	Tue, 18 Nov 2025 06:44:46 +0000
Date: Tue, 18 Nov 2025 14:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 20/20] kernel/sched/fair.c:4175:33:
 error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'?
Message-ID: <202511181416.RfaOj6nU-lkp@intel.com>
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
head:   9d34d6ebdb86ead0a87c19b7054416f8da8a0b77
commit: a0afbf3c5d0386fa940ad3ee5e5cda8ad0e3eced [20/20] anolis: sched: add Numa Affine feature
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251118/202511181416.RfaOj6nU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181416.RfaOj6nU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181416.RfaOj6nU-lkp@intel.com/

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
