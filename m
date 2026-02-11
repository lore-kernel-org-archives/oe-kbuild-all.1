Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E372D5937
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 06:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770790830; cv=none; b=YRLwu0ONdaM3ea3vdQ0a29lqlO5DYd8fSvhFLOo9ZX0yAUsnENu1gu8P/z09sSSBDt5sokHWCVy72zJSrxBzgopsGH2ti12/oCIacOSdst1LYOyYtdZPnzHm1ciy1CzRM/AdA4ZolwVGMevsQaMhzH5hNggmclFTEmnsHgEJptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770790830; c=relaxed/simple;
	bh=kYqom4844t7p7UxlqNvZhDu9vLwhG40zWvHkQf6OxMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pRpteIWdRd6k2aeVtsRQJeaEA2tR/eeXa+2mNrMbVBV7224usosiL5JiB4wOSoclN8gmHkSpgDc37xPBuDLvRcLTYa63WKLNwsziazgnb5jOesiitkW3gVr4RwhHmzPEd5nG51EWCa4t13kSMFkgy2jQCVMhR3BCxYKJkwWethg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djNND6fP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djNND6fP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770790829; x=1802326829;
  h=date:from:to:cc:subject:message-id;
  bh=kYqom4844t7p7UxlqNvZhDu9vLwhG40zWvHkQf6OxMY=;
  b=djNND6fPsyWN++uRz71r/E7nMRpFz5BVPQuWssBgmpc6FPBAuOJcNrGV
   4KITYiILTWi5dit8fGTMvZiavyKOwg6rFuDeufE4GO8LmLjtCNIyYPCck
   j3LZsNEaB0IjLQU41hFCFRzz6PeJqPC9/qswfEZe4vWamNyTvmPszr9eG
   YZzC874kUyOYIdYU29oMsOu87/5OLXH3FB8Pw/p1XgW6xhEvoT6syTpW3
   zMLEU8BGVHJoPfDSF01kE9G0ouT2v1qAlXHfGlXW0RRkD6651HgjCExLS
   LKLcy9s5ESiml7q+ZNJpag7avLT2JfVni/maGrUztRqCvJIr5K3wue6ky
   w==;
X-CSE-ConnectionGUID: HdNeGZLFQn+Zbd6x4J4mxw==
X-CSE-MsgGUID: MDORuG6pQza5glLueiiYoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72116926"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72116926"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 22:20:24 -0800
X-CSE-ConnectionGUID: iSmqT87sS0WOf0knI8acgw==
X-CSE-MsgGUID: oRpilCH4TOGiaRy7dm6uUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211976508"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Feb 2026 22:20:24 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq3aH-0000000011j-0wcQ;
	Wed, 11 Feb 2026 06:20:21 +0000
Date: Wed, 11 Feb 2026 07:20:16 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 22/23] kernel/sched/core.c:978:17:
 error: implicit declaration of function '__hrtimer_rearm_deferred'; did you
 mean 'hrtimer_rearm_deferred'?
Message-ID: <202602110747.QkNMVKKP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   4977e2e73efc645e38259d70c86d3b8e80dd3ea5
commit: cdc7a4d6066dc34fdbb2cf8801a5287f31d60657 [22/23] sched: Optimize hrtimer handling
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602110747.QkNMVKKP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110747.QkNMVKKP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110747.QkNMVKKP-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'hrtick_schedule_exit':
>> kernel/sched/core.c:978:17: error: implicit declaration of function '__hrtimer_rearm_deferred'; did you mean 'hrtimer_rearm_deferred'? [-Wimplicit-function-declaration]
     978 |                 __hrtimer_rearm_deferred();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 hrtimer_rearm_deferred


vim +978 kernel/sched/core.c

   967	
   968	static inline void hrtick_schedule_exit(struct rq *rq)
   969	{
   970		if (rq->hrtick_sched & HRTICK_SCHED_START) {
   971			rq->hrtick_time = ktime_add_ns(ktime_get(), rq->hrtick_delay);
   972			__hrtick_restart(rq);
   973		} else if (idle_rq(rq)) {
   974			hrtick_clear(rq);
   975		}
   976	
   977		if (rq->hrtick_sched & HRTICK_SCHED_REARM_HRTIMER)
 > 978			__hrtimer_rearm_deferred();
   979	
   980		rq->hrtick_sched = HRTICK_SCHED_NONE;
   981	}
   982	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
