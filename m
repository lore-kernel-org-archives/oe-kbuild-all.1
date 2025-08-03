Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63E312E7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256690; cv=none; b=Ksfd+8kPtGSBJGPRw+g0EV5wLek5n+S6cqolYEN6KVvRugOw0xAeV6d/ZGa98FCCuAql6UHCOS91iNDnr4GPYxGLxDt7XCjrltqz2Xi8lRZVGspLNZR45SZ5LpnMA0bMAufbqHBTto1bzDmnd6kc3/Nb+CObdy1HaPLO098TS5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256690; c=relaxed/simple;
	bh=bTAc0PONfZxp4ZtIR6V4pewldP8eEoNQDHH/hhE3WsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8/q0YAl1K+DsM8lQKGuJTpWBCOp6m7NxoywPU+t3uBEtPzf8AbsmyxnN3HIvZ/Ejp5DPcCE7rSNGBqbahwmZAHp+bFSQ2niCWlRHY5FUWCng+f5mTJRNmh+0IHU472xgT40Qa2RHWVBxESIztZ9fx6lV0XlQxBFq+eC1tpvq+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rf3u14xF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rf3u14xF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754256689; x=1785792689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bTAc0PONfZxp4ZtIR6V4pewldP8eEoNQDHH/hhE3WsQ=;
  b=Rf3u14xFCM9mR4P6y3ID/UjM3hCXU8J6NRnxgAFgfRi0OOQ1XpzMsLrG
   q67pvflHxczSe6bhNdzkuFxOg8K7RQS0S6yQppdfGCmwnXp+LXqJjZILI
   tnajHwkcR/Err9M+skpJbtw6EVfL+rCYxY46d3QTPRUdK7wNvr+Ey1zWp
   VLfl64bGo1UbdcHKu5NQkT0ljpkqteZYnOTpzPU+PJhPEyYh0+Sbcga5a
   h+dTOBNROFmEE/2xeN55OxCIC+9luN4hX7TW2MPRH55JP4W55Vg2W1tx0
   q8zHKdUQSjR8/4lgw0GSVBse5CpMdmaokQcy2QFm+WKTneFBMMZFUnRT4
   w==;
X-CSE-ConnectionGUID: b1h/jN3jSpmGKdNv+4s/vA==
X-CSE-MsgGUID: NS6pfceESuOUkrAGdoMhmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67210512"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67210512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 14:31:28 -0700
X-CSE-ConnectionGUID: YDe+M5/8QTuK64FRcNRE5g==
X-CSE-MsgGUID: dj6mp8TgRJuzLn3YrUcgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163271115"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Aug 2025 14:31:20 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uigIX-0006e8-1h;
	Sun, 03 Aug 2025 21:31:17 +0000
Date: Mon, 4 Aug 2025 05:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.16/prjc 563/573] kernel/sched/alt_core.c:5739:12: warning:
 array index -1 is before the beginning of the array
Message-ID: <202508040553.1sHPSqiT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.16/prjc
head:   9c89892c1b23ef0227b09601fbd77ba0047aedac
commit: 0ce6427b65aca6bfe66b7301a9c15f2f7ac96685 [563/573] sched/alt: Priority balance
config: i386-buildonly-randconfig-003-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040553.1sHPSqiT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040553.1sHPSqiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040553.1sHPSqiT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:4556:7: error: call to undeclared function 'preempt_mask_check'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4556 |         if (!preempt_mask_check(&mask, avail_mask, task_sched_prio(p)))
         |              ^
   kernel/sched/alt_core.c:4560:10: error: call to undeclared function 'best_mask_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4560 |                 return best_mask_cpu(task_cpu(p), &mask);
         |                        ^
   kernel/sched/alt_core.c:4560:10: note: did you mean 'set_task_cpu'?
   include/linux/sched.h:2224:20: note: 'set_task_cpu' declared here
    2224 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^
   kernel/sched/alt_core.c:4585:11: error: no member named 'online' in 'struct rq'
    4585 |         if (!rq->online)
         |              ~~  ^
>> kernel/sched/alt_core.c:5739:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    5739 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5714:1: note: array 'preempt_modes' declared here
    5714 | const char *preempt_modes[] = {
         | ^
   1 warning and 3 errors generated.


vim +5739 kernel/sched/alt_core.c

c418a00d98e2be Alfred Chen 2025-05-06  5717  
c418a00d98e2be Alfred Chen 2025-05-06  5718  const char *preempt_model_str(void)
c418a00d98e2be Alfred Chen 2025-05-06  5719  {
c418a00d98e2be Alfred Chen 2025-05-06  5720  	bool brace = IS_ENABLED(CONFIG_PREEMPT_RT) &&
c418a00d98e2be Alfred Chen 2025-05-06  5721  		(IS_ENABLED(CONFIG_PREEMPT_DYNAMIC) ||
c418a00d98e2be Alfred Chen 2025-05-06  5722  		 IS_ENABLED(CONFIG_PREEMPT_LAZY));
c418a00d98e2be Alfred Chen 2025-05-06  5723  	static char buf[128];
c418a00d98e2be Alfred Chen 2025-05-06  5724  
c418a00d98e2be Alfred Chen 2025-05-06  5725  	if (IS_ENABLED(CONFIG_PREEMPT_BUILD)) {
c418a00d98e2be Alfred Chen 2025-05-06  5726  		struct seq_buf s;
c418a00d98e2be Alfred Chen 2025-05-06  5727  
c418a00d98e2be Alfred Chen 2025-05-06  5728  		seq_buf_init(&s, buf, sizeof(buf));
c418a00d98e2be Alfred Chen 2025-05-06  5729  		seq_buf_puts(&s, "PREEMPT");
c418a00d98e2be Alfred Chen 2025-05-06  5730  
c418a00d98e2be Alfred Chen 2025-05-06  5731  		if (IS_ENABLED(CONFIG_PREEMPT_RT))
c418a00d98e2be Alfred Chen 2025-05-06  5732  			seq_buf_printf(&s, "%sRT%s",
c418a00d98e2be Alfred Chen 2025-05-06  5733  				       brace ? "_{" : "_",
c418a00d98e2be Alfred Chen 2025-05-06  5734  				       brace ? "," : "");
c418a00d98e2be Alfred Chen 2025-05-06  5735  
c418a00d98e2be Alfred Chen 2025-05-06  5736  		if (IS_ENABLED(CONFIG_PREEMPT_DYNAMIC)) {
c418a00d98e2be Alfred Chen 2025-05-06  5737  			seq_buf_printf(&s, "(%s)%s",
c418a00d98e2be Alfred Chen 2025-05-06  5738  				       preempt_dynamic_mode > 0 ?
c418a00d98e2be Alfred Chen 2025-05-06 @5739  				       preempt_modes[preempt_dynamic_mode] : "undef",
c418a00d98e2be Alfred Chen 2025-05-06  5740  				       brace ? "}" : "");
c418a00d98e2be Alfred Chen 2025-05-06  5741  			return seq_buf_str(&s);
c418a00d98e2be Alfred Chen 2025-05-06  5742  		}
c418a00d98e2be Alfred Chen 2025-05-06  5743  
c418a00d98e2be Alfred Chen 2025-05-06  5744  		if (IS_ENABLED(CONFIG_PREEMPT_LAZY)) {
c418a00d98e2be Alfred Chen 2025-05-06  5745  			seq_buf_printf(&s, "LAZY%s",
c418a00d98e2be Alfred Chen 2025-05-06  5746  				       brace ? "}" : "");
c418a00d98e2be Alfred Chen 2025-05-06  5747  			return seq_buf_str(&s);
c418a00d98e2be Alfred Chen 2025-05-06  5748  		}
c418a00d98e2be Alfred Chen 2025-05-06  5749  
c418a00d98e2be Alfred Chen 2025-05-06  5750  		return seq_buf_str(&s);
c418a00d98e2be Alfred Chen 2025-05-06  5751  	}
c418a00d98e2be Alfred Chen 2025-05-06  5752  
c418a00d98e2be Alfred Chen 2025-05-06  5753  	if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY_BUILD))
c418a00d98e2be Alfred Chen 2025-05-06  5754  		return "VOLUNTARY";
c418a00d98e2be Alfred Chen 2025-05-06  5755  
c418a00d98e2be Alfred Chen 2025-05-06  5756  	return "NONE";
c418a00d98e2be Alfred Chen 2025-05-06  5757  }
c418a00d98e2be Alfred Chen 2025-05-06  5758  

:::::: The code at line 5739 was first introduced by commit
:::::: c418a00d98e2be1856e334ecf9602622726d78ad sched/alt: [Sync] 8bdc5daaa01e sched: Add a generic function to return the preemption string

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
