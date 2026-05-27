Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3973B27F017
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 01:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779844608; cv=none; b=ELff6oVkf19ZBhgCCJR1x91NuqpdMK9DsrEY32lzQU3yL0yBcfuKIfxDrhROKjLmW19TcBmufUjarYmEx3qm6xpXGt6L+bQ60ygGvae2NaS1IqaocqzUATi2dUyujKhGISWzEhW0FTkjRPXkyOSV+9dHbmVTh0ll/4zbfTEMu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779844608; c=relaxed/simple;
	bh=aqx9jpUBj81toi74XHWtp7bJVnkEUSoSnaUGidFECkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1al7pdG35bFBRFPylV62SL9dFUXs0SvBKR9sYRumEsurzrC1lRrcstVtaV3cTv7JuLfKcn5xSScIOoMtE+ArkXtBOC62/BDdGsIqwacXTTfrjuzGYkOjF+eXnWbfDTJSv22VHAcnmiIEUJQMhXCRarGHOzadFer487FQn9nMEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLjwxY5S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLjwxY5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779844605; x=1811380605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aqx9jpUBj81toi74XHWtp7bJVnkEUSoSnaUGidFECkQ=;
  b=aLjwxY5SGTtOSPU/Q82wPFqbD0bHL36R0scTvwgJDSdMErNuqd3w0CSV
   BN2bZ0E6HTeOVzznG84/a3QuHKMpHrdc2Ihd7X0V/wN3PMYUwdSq5Z2Hn
   33D9GLuq7pBdEN8edpSRu8NfJoGS1zjU3Li11ZoE6m1eQh4AJQhOR0o6y
   Fky+lwHhno9sEYQfKZ6j/jWM7n3CEcn3pyKXURxCiiRHmPoU8aOfLYUnd
   btkO7Fq5pK1JY6PQ884xRAm2/2BbufEmNFQg/YiHgIt42mwEwx65zNhkm
   s5l5FIyLzVY2+99ITZfOKriixPEI4m2wOOJjP1tACcXScf0jVYLpWLB4R
   A==;
X-CSE-ConnectionGUID: s3ptObkOTYKDEjZH+puwIA==
X-CSE-MsgGUID: 0To9F0VAQWSIlRZna+QxjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98244663"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="98244663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 18:16:44 -0700
X-CSE-ConnectionGUID: mEADMT7kTu+zPGa4bVP36w==
X-CSE-MsgGUID: OUICdcFTSmmrb4xh22G3IQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 May 2026 18:16:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS2sx-00000000Caf-1hK4;
	Wed, 27 May 2026 01:16:39 +0000
Date: Wed, 27 May 2026 03:16:15 +0200
From: kernel test robot <lkp@intel.com>
To: Li kunyu <likunyu10@163.com>, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Li kunyu <likunyu10@163.com>
Subject: Re: [PATCH] kernel/sched/fair: Fix the issue of virtual runtime
 conversion error
Message-ID: <202605270352.wVynZOtB-lkp@intel.com>
References: <20260526071537.17460-1-likunyu10@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526071537.17460-1-likunyu10@163.com>

Hi Li,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on peterz-queue/sched/core linus/master v7.1-rc5 next-20260526]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-kunyu/kernel-sched-fair-Fix-the-issue-of-virtual-runtime-conversion-error/20260526-151853
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260526071537.17460-1-likunyu10%40163.com
patch subject: [PATCH] kernel/sched/fair: Fix the issue of virtual runtime conversion error
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260527/202605270352.wVynZOtB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270352.wVynZOtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270352.wVynZOtB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/fair.o: in function `hrtick_start_fair':
>> kernel/sched/fair.c:7633:(.text+0x701): undefined reference to `__udivdi3'


vim +7633 kernel/sched/fair.c

  7603	
  7604	/**************************************************
  7605	 * CFS operations on tasks:
  7606	 */
  7607	
  7608	#ifdef CONFIG_SCHED_HRTICK
  7609	static void hrtick_start_fair(struct rq *rq, struct task_struct *p)
  7610	{
  7611		struct sched_entity *se = &p->se;
  7612		unsigned long scale = 1024;
  7613		unsigned long util = 0;
  7614		u64 vdelta;
  7615		u64 delta;
  7616	
  7617		WARN_ON_ONCE(task_rq(p) != rq);
  7618	
  7619		if (rq->cfs.h_nr_queued <= 1)
  7620			return;
  7621	
  7622		/*
  7623		 * Compute time until virtual deadline
  7624		 */
  7625		vdelta = se->deadline - se->vruntime;
  7626		if ((s64)vdelta < 0) {
  7627			if (task_current_donor(rq, p))
  7628				resched_curr(rq);
  7629			return;
  7630		}
  7631	
  7632		if (unlikely(se->load.weight != NICE_0_LOAD))
> 7633			delta = (NICE_0_LOAD * vdelta) / se->load.weight;
  7634	
  7635		/*
  7636		 * Correct for instantaneous load of other classes.
  7637		 */
  7638		util += cpu_util_irq(rq);
  7639		if (util && util < 1024) {
  7640			scale *= 1024;
  7641			scale /= (1024 - util);
  7642		}
  7643	
  7644		hrtick_start(rq, (scale * delta) / 1024);
  7645	}
  7646	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
