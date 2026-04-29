Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF07346A08
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 19:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777491889; cv=none; b=Qoo46iAJ6NgiTRqWPxzRGcgWMosdb21kWdOV52o1UYG9gKbyQfEwuegKR9DkWD56HKmDXWdqlv9qTkD2SdPEgfmt3nhe81brtNDRIfnlleGmXN9ws6dvP2GtWLWIJcZfL/Zw/H9/GCd+gi+evD8k9nHaTU/VV+FGEnccaG29IIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777491889; c=relaxed/simple;
	bh=qGoptySPy3VOVbBf72u8dDvWmjrPVi8JOKqTJHkviaA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e6ke4oAgTcJ9sV/NsrlmpVnrvzyAxXc2zFMavM0EVTeyMAUtyXbNgSkEqopXv1lHShsiX2GieUT0F8d0/laYTMsqjvm2I+0tfEyPq4kt9NWwY3WKjgngVVzeAKyDbO2MQnBpjsZsiTCq6wxtyIASWXgoCAqA7ipR1pDC+H4qYa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwBwKjCO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwBwKjCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777491888; x=1809027888;
  h=date:from:to:cc:subject:message-id;
  bh=qGoptySPy3VOVbBf72u8dDvWmjrPVi8JOKqTJHkviaA=;
  b=mwBwKjCOobBGNMBNxCfrEyzYwOq1Mqk9ixUbmhlBesnDxCM2dbS//MWx
   RJSMXqSqDvMkKeZDbcynBrMSDHLMbdBmfp7NUt9EtbPJjiI5ab/9Vg16/
   hFG/ClebryHdS85J9H18ptJ8hKNOGkdqFlkcyDukmo88yggmsJiqJhFHG
   D4ma+kCElCQtw8Exo2ZvYw6R0IrRNeykX9jkuD1A3zzjXZv8ShyGe+OvX
   K61G0CwmBuZ6OcgDM/T58cuxr4rs1CHm21fblwN9aNcRF3YafoAt4W3Vl
   wzyFZoFmaKoOiQtkZlCvklOtkzhCvT5tgL2tDR7b8hzsdKSmPf4bokRs8
   g==;
X-CSE-ConnectionGUID: hS6UoxV+QQae4U6KZo2oww==
X-CSE-MsgGUID: rapr+80LRzyNy6p5AHi7Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78304168"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78304168"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:44:47 -0700
X-CSE-ConnectionGUID: Kn5bxYOPTWuAEhSyzel/Yw==
X-CSE-MsgGUID: hBqOBzXOTzWS6/JagK0ISQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="264748878"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2026 12:44:46 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIApv-00000000BTH-49Tf;
	Wed, 29 Apr 2026 19:44:43 +0000
Date: Thu, 30 Apr 2026 03:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:core/rseq 5/11]
 kernel/sched/membarrier.c:208:13: error: implicit declaration of function
 'rseq_v2'
Message-ID: <202604300352.QpmP1xf9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git core/rseq
head:   9a2253d7640f6b319562dda1a87cee3416c5d332
commit: a86e32c235afd7ea34ee7ecca5ce532b918930c2 [5/11] rseq: Revert to historical performance killing behaviour
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300352.QpmP1xf9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300352.QpmP1xf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300352.QpmP1xf9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/membarrier.c: In function 'ipi_rseq':
>> kernel/sched/membarrier.c:208:13: error: implicit declaration of function 'rseq_v2' [-Wimplicit-function-declaration]
     208 |         if (rseq_v2(current))
         |             ^~~~~~~


vim +/rseq_v2 +208 kernel/sched/membarrier.c

   191	
   192	static void ipi_rseq(void *info)
   193	{
   194		/*
   195		 * Ensure that all stores done by the calling thread are visible
   196		 * to the current task before the current task resumes.  We could
   197		 * probably optimize this away on most architectures, but by the
   198		 * time we've already sent an IPI, the cost of the extra smp_mb()
   199		 * is negligible.
   200		 */
   201		smp_mb();
   202		/*
   203		 * Legacy mode requires that IDs are written and the critical section is
   204		 * evaluated. V2 optimized mode handles the critical section and IDs are
   205		 * only updated if they change as a consequence of preemption after
   206		 * return from this IPI.
   207		 */
 > 208		if (rseq_v2(current))
   209			rseq_sched_switch_event(current);
   210		else
   211			rseq_force_update();
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
