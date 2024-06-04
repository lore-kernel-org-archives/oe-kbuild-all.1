Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2D0145A06
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 11:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717501880; cv=none; b=Xg8cZIl9jnBLFfAl3AvGlI7Mrhyidx2yCN5dHeRVw/OZFbY33T0mHYWatrzsDxml+hPsFmyBP7ty7Jl53k8wk06tkBUScx9F+vSVSN9p8JSdeOPdgYE/a0bTViZCz3QdyF/zER6i2WwfnobkmO3/wFND53BLaYMTD+kqG3wSTbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717501880; c=relaxed/simple;
	bh=2AuH9E916sTnDLoUkdgN8eVxkwBr2pAo46w1qSgK1gM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kSzGTf+QeWOv+/updfWKzFWY4rJ4VoE2M9YcMkxYG2y3wS8GWWAI9eetrHroe1XCCWrNE3iEnfaRKaerrisrjBvbUrRH58NPcqJnGcLE4fHjp4QiU3khn1ip+ph6Z8jXsJB5ke8uPyCizhckL0JAMvpHXI+oVN+/1f7ttdQCQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7D/eQ8V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7D/eQ8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717501878; x=1749037878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2AuH9E916sTnDLoUkdgN8eVxkwBr2pAo46w1qSgK1gM=;
  b=m7D/eQ8VqnppXSbQGJywlrfZ4EyjCYNySUmrQMbfcsPNB50DLph2SJQW
   sZkfM/I/rUMAFTA1AdpdzHaStnPyoYbvn+56qstgmkGTZ+mtPjjklBs/a
   EpvRa2ouqDTxYKoc3B5bVMksBzcMHjTWqR+3d4PE24N1mKR1Zp1Ns6gh4
   vrEcn+UZsjN6AV4SzUtcDBDazrcoJl0PYaFmUU2/ykyCTLaaMp2SlH2Yt
   IbJp3bUKR5ZLplxsHdHcFMP+QLQesvAeJFeHe9NB70ajuEIAXjXdykuXr
   UowQbrJxUkxNgV1cdtlbE1WemMIh2+otIU/OJy2zGOWAXUl/hu/vukhbI
   w==;
X-CSE-ConnectionGUID: KxASllr9QgSRB0gBoSEevg==
X-CSE-MsgGUID: RjgS19efSKmT9bCXBPAcbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14232758"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="14232758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 04:51:18 -0700
X-CSE-ConnectionGUID: DR49bUrLQISHEBACmk0ZKQ==
X-CSE-MsgGUID: odqKZSCTTYyCM5sseuG1Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="60406377"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2024 04:51:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sESh8-000N9o-1Y;
	Tue, 04 Jun 2024 11:51:14 +0000
Date: Tue, 4 Jun 2024 19:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/eevdf 7/23] kernel/sched/core.c:1992:13: error:
 conflicting types for 'dequeue_task'; have 'bool(struct rq *, struct
 task_struct *, int)' {aka '_Bool(struct rq *, struct task_struct *, int)'}
Message-ID: <202406041902.gCmTFC4c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   642ed673fcd170ce20c64fb0e1970259fbb05cba
commit: e62a29c0e8a181ae8f53b5c637e28ec3f5e3703d [7/23] sched: Allow sched_class::dequeue_task() to fail
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240604/202406041902.gCmTFC4c-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041902.gCmTFC4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041902.gCmTFC4c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:1992:13: error: conflicting types for 'dequeue_task'; have 'bool(struct rq *, struct task_struct *, int)' {aka '_Bool(struct rq *, struct task_struct *, int)'}
    1992 | inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
         |             ^~~~~~~~~~~~
   In file included from kernel/sched/core.c:88:
   kernel/sched/sched.h:3561:13: note: previous declaration of 'dequeue_task' with type 'void(struct rq *, struct task_struct *, int)'
    3561 | extern void dequeue_task(struct rq *rq, struct task_struct *p, int flags);
         |             ^~~~~~~~~~~~


vim +1992 kernel/sched/core.c

  1988	
  1989	/*
  1990	 * Must only return false when DEQUEUE_SLEEP.
  1991	 */
> 1992	inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
  1993	{
  1994		if (sched_core_enabled(rq))
  1995			sched_core_dequeue(rq, p, flags);
  1996	
  1997		if (!(flags & DEQUEUE_NOCLOCK))
  1998			update_rq_clock(rq);
  1999	
  2000		if (!(flags & DEQUEUE_SAVE)) {
  2001			sched_info_dequeue(rq, p);
  2002			psi_dequeue(p, flags & DEQUEUE_SLEEP);
  2003		}
  2004	
  2005		uclamp_rq_dec(rq, p);
  2006		return p->sched_class->dequeue_task(rq, p, flags);
  2007	}
  2008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
