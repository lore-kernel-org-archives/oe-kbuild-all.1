Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313624EAA2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690622; cv=none; b=DBlOJbOBfnuRbX6qEmHDgDqgnE49yBM3r/fkreQP6pZSDZjpycwx4P5GplsvHLEDk/PenYvwPCN3Ml8+OY1twH5Y6YEWqA86x4n5vpUoA/lSMfv3ERhXPW1klhoQHN32rv3jxcGJVetDjTeqK4vnZxIybH0zr8sCSw5L12da/bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690622; c=relaxed/simple;
	bh=TVsSRx9QynlJfBafWHZrcF5aLohLqyQw3NetePgLW6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8FR4PCUT4wGgg5xsnQ1CQCdkOJmitD+aoLDgpJmLQpn0OK80eJ/zCeBk+I0DNoBrZHBLrtO5JxRWeQ6DgMH5T96nJh5nbyksNcNiJk4VWhZSm1/tkUtAK88HKmidzMSnoLXZgCBufl7ucPUKaDOWwFg/Tbzjn0Ng9KJNhULDIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2kpWIHi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2kpWIHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743690621; x=1775226621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVsSRx9QynlJfBafWHZrcF5aLohLqyQw3NetePgLW6o=;
  b=S2kpWIHiQ97SEbcJlc/NE7A9DrQsAqC/+QwdZB8foLobjStrfdBsWvL2
   ohosT34P4jg3TVGubD4u2ISKzmVmBoh0fsMenBKYwActoVYOMh/sTaxhM
   f2/hmYug9pM1Q5hRauR0oQFjQsq9ZR0QPQ06ZafLkAFNw9GvPj15HYlk3
   0tAdUFIyCc+3Ax3jV/gL1bpQ4fiWe3/wEHu1cmsTFdW5G7vXALOBnAe0T
   zQZmdn/N701cBCdqvc2sTr0cbJNdb8tf7JZbT9/4KNYX7woQEg9kHX8Ur
   ZpAf66LIgiXmB1MJM7Y4NLdO076siF/xndE1FaZQAo+jsMaKMqoR7XT+M
   A==;
X-CSE-ConnectionGUID: g3Ez5K5ORSOMpLSaE62Eaw==
X-CSE-MsgGUID: VyQO88QKQ1mofOLV6RSD5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45015239"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45015239"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:30:18 -0700
X-CSE-ConnectionGUID: xnLZBVMgQbCNYPyVycQ+aA==
X-CSE-MsgGUID: wfx6Bk03RKq+g0EJiGY2+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131738206"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2025 07:30:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0LaA-0000Sn-2P;
	Thu, 03 Apr 2025 14:30:14 +0000
Date: Thu, 3 Apr 2025 22:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/hrtick 1/6] kernel/sched/fair.c:6813:17: error:
 implicit declaration of function 'cpu_util_dl'; did you mean 'cpu_util_irq'?
Message-ID: <202504032218.WqQFUgr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/hrtick
head:   7ca06092f4a1b8dfd501b5cb1749854a13d5a898
commit: deebcd729d011e54806d9026965fcb0c18111129 [1/6] sched/eevdf: Fix HRTICK duration
config: sh-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504032218.WqQFUgr5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032218.WqQFUgr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032218.WqQFUgr5-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'hrtick_start_fair':
>> kernel/sched/fair.c:6813:17: error: implicit declaration of function 'cpu_util_dl'; did you mean 'cpu_util_irq'? [-Wimplicit-function-declaration]
    6813 |         util += cpu_util_dl(rq);
         |                 ^~~~~~~~~~~
         |                 cpu_util_irq
>> kernel/sched/fair.c:6814:17: error: implicit declaration of function 'cpu_util_rt'; did you mean 'cpu_util_irq'? [-Wimplicit-function-declaration]
    6814 |         util += cpu_util_rt(rq);
         |                 ^~~~~~~~~~~
         |                 cpu_util_irq


vim +6813 kernel/sched/fair.c

  6780	
  6781	/**************************************************
  6782	 * CFS operations on tasks:
  6783	 */
  6784	
  6785	#ifdef CONFIG_SCHED_HRTICK
  6786	static void hrtick_start_fair(struct rq *rq, struct task_struct *p)
  6787	{
  6788		struct sched_entity *se = &p->se;
  6789		unsigned long scale = 1024;
  6790		unsigned long util = 0;
  6791		u64 vdelta;
  6792		u64 delta;
  6793	
  6794		WARN_ON_ONCE(task_rq(p) != rq);
  6795	
  6796		if (rq->cfs.h_nr_queued <= 1)
  6797			return;
  6798	
  6799		/*
  6800		 * Compute time until virtual deadline
  6801		 */
  6802		vdelta = se->deadline - se->vruntime;
  6803		if ((s64)vdelta < 0) {
  6804			if (task_current_donor(rq, p))
  6805				resched_curr(rq);
  6806			return;
  6807		}
  6808		delta = (se->load.weight * vdelta) / NICE_0_LOAD;
  6809	
  6810		/*
  6811		 * Correct for instantaneous load of other classes.
  6812		 */
> 6813		util += cpu_util_dl(rq);
> 6814		util += cpu_util_rt(rq);
  6815		util += cpu_util_irq(rq);
  6816		if (util && util < 1024) {
  6817			scale *= 1024;
  6818			scale /= (1024 - util);
  6819		}
  6820	
  6821		hrtick_start(rq, (scale * delta) / 1024);
  6822	}
  6823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
