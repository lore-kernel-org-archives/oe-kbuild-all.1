Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DF03BE156
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 04:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780548653; cv=none; b=K/pUExxdDEDLYPVSaHPz+up5sJ67km+LvPxK0PgktaJBY6K4zFprPVQScuSFTMiht+U2c3Whws9MdRrQ7DbKawhWNRT9bACqR65PVyD7qX5+q5mu/+JT5TSNLK4xViIeATWunlwAARfghIqUYfqOtN1NFRHfGAW62ztCCMaH1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780548653; c=relaxed/simple;
	bh=aGOf5+GQvUNfHW3JK7Yg+DBvLhPmGOreMH7sqv/9xJw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i+wOC6GntVyQZGzYM+pnpYTO+bR8uIOdrah/x1EqERKTaE0G7ioYjFtHcJic8Wj/MfLHnNEVnaXO6Nvg2p1x0Q/JEsnUqOLcKzmoMybc5Y4sXT5XD6w5d20sbDBgGq/5yH21bqgBJ+F30ZEdbYCrE6gTrbxka7a0wAjruchXCb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZjMSGY9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZjMSGY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780548651; x=1812084651;
  h=date:from:to:cc:subject:message-id;
  bh=aGOf5+GQvUNfHW3JK7Yg+DBvLhPmGOreMH7sqv/9xJw=;
  b=UZjMSGY9PQzg5MB5WNEP/cf4dF2XaxTXBzZ2ASqRAKJ/BD2JSATUwud1
   S9zB3ZnSRIf6HYbddl2xRrtrXeyZ4FD0syWb0D0Is1QKVpFDp1IIuIY9a
   yyRM5D3LOn5PVRsp1/IDb+3PvS1P10UA8zyz6JQErTZtlP5egEnxdCpUr
   WKaiepauJre7oHXPfr0uL0Fq5IrsOLDYJA0RMDZFSzrr2DLs4s3HyeOf+
   MLsWsXYr77PxA6XTU6+0zN0sAgq08uMBxf6zIIHQ+3/hxSmQCRt99gv0g
   5XleHEfwnl0frxHhrZp5rE33k1CSCpNDFT9Q8kFkLbe+NGiajUNS3qCTy
   Q==;
X-CSE-ConnectionGUID: //NuauTRT4SLzOQdvqbNdA==
X-CSE-MsgGUID: C6/o6No6SkiRSEIi1Q51dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81367010"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81367010"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 21:50:51 -0700
X-CSE-ConnectionGUID: FJh2Bx+VTEyt6nDrJUkGMA==
X-CSE-MsgGUID: NJVA8YhbS1W7y+8i4i3s0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="238103218"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2026 21:50:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV02X-00000000EIQ-3JES;
	Thu, 04 Jun 2026 04:50:45 +0000
Date: Thu, 04 Jun 2026 12:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
 Tim Chen <tim.c.chen@linux.intel.com>
Subject: [linux-next:master 4928/10715]
 kernel/sched/topology.c:1030:38: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202606041216.oQHGJC5e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a225caacc36546a09586e3ece36c0313146e7da9
commit: 5beff4f087277901444787d4b7af6b3a93c34c54 [4928/10715] sched/cache: Fix cache aware scheduling enabling for multi LLCs system
config: nios2-randconfig-r132-20260604 (https://download.01.org/0day-ci/archive/20260604/202606041216.oQHGJC5e-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606041216.oQHGJC5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041216.oQHGJC5e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:788:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:788:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:788:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:1129:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1129:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1129:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:1129:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:1129:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:1129:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/topology.c:118:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:118:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:118:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:137:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:137:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:137:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:160:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:160:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:160:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:470:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:470:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:470:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:650:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:650:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:650:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:737:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:737:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:737:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:752:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:752:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:752:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:765:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:765:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:765:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:770:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:770:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:770:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:803:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:803:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:803:13: sparse:     got struct sched_domain [noderef] __rcu *sd
>> kernel/sched/topology.c:1030:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1030:38: sparse:     expected struct sched_domain *sdp
   kernel/sched/topology.c:1030:38: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/topology.c:1037:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sdp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1037:21: sparse:     expected struct sched_domain *sdp
   kernel/sched/topology.c:1037:21: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1184:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1184:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1184:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1213:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1213:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1213:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1259:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1259:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1259:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1261:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1261:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1261:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1269:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1269:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1269:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1271:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1271:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1271:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1341:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1341:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1341:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1445:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1445:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1445:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1583:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1583:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1583:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1840:52: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1840:52: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1840:52: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1950:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1950:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1950:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2749:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2749:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2749:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2877:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent @@
   kernel/sched/topology.c:2877:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2877:16: sparse:     got struct sched_domain [noderef] __rcu *[noderef] __rcu parent
   kernel/sched/topology.c:2879:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2879:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2879:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2884:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2884:16: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2884:16: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2889:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2889:24: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:2889:24: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3018:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3018:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3018:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3037:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3037:28: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3037:28: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:3067:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:3067:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:3067:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2401:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2401:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2401:25: sparse:    struct task_struct *

vim +1030 kernel/sched/topology.c

  1010	
  1011	/*
  1012	 * Return true if @sd belongs to an LLC group whose enclosing
  1013	 * partition spans more than one LLC. @sd must be the topmost
  1014	 * SD_SHARE_LLC domain.
  1015	 *
  1016	 * Any duplicated parent domains with the same span as @sd are
  1017	 * skipped: before cpu_attach_domain() degeneration these still
  1018	 * exist, after degeneration the loop is a no-op. This makes the
  1019	 * helper usable both during sched domain build and against an
  1020	 * already-attached domain tree.
  1021	 *
  1022	 * Note: For systems with a single LLC per node, cache-aware
  1023	 * scheduling is still enabled when multiple nodes exist.
  1024	 * However, NUMA balancing decisions take precedence over
  1025	 * cache-aware scheduling. Conversely, if there is only one
  1026	 * LLC per partition, cache-aware scheduling should be disabled.
  1027	 */
  1028	static bool sd_in_multi_llcs(struct sched_domain *sd)
  1029	{
> 1030		struct sched_domain *sdp = sd->parent;
  1031	
  1032		/* it does not make sense to aggregate to 1 CPU */
  1033		if (sd->span_weight == 1)
  1034			return false;
  1035	
  1036		while (sdp && sdp->span_weight == sd->span_weight)
> 1037			sdp = sdp->parent;
  1038	
  1039		return !!sdp;
  1040	}
  1041	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
