Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA3331326B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 01:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046096; cv=none; b=lHuFF8pfKCXGLydwnqAI1YtGbMS9lPxu26hbcynChapkIZhxvFMvWna6c8/gjImNBQzUimyBUkQYtdrFFkT/S2NxQ0hYsqUWQbZ2A5pAaCD9a7RbyesVFiXa5xyVWKBkuAgBf0NpJA1eY7dup6NC5Ee+YH1OlgoRzWwYyzzqVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046096; c=relaxed/simple;
	bh=JWGvAlmTsoMUirZ5fb4puhc0IXjiF8BHE2CTlNYhK6E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A1wT0fuzrRvONtqrV0zYyDR4tcLaCbfnvrbHkus2Cfeq4auiFfLhe3V7gvJb1JUquaX4u1UpK5D1bnBj+ltv344NZiDOfjopat74Db/ZV9ClpS4WQPdwxdGV8jgpJ71nY2p1FGXL0HLG4+irDeovLR8dWiL1sYvpWY8vCtWFGWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O882hY1G; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O882hY1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769046094; x=1800582094;
  h=date:from:to:cc:subject:message-id;
  bh=JWGvAlmTsoMUirZ5fb4puhc0IXjiF8BHE2CTlNYhK6E=;
  b=O882hY1GDfT9uKVhm66SQTbiy/48KMAyuRV9VhlWphy1/5FkogWOHovu
   MElCbDQFUCYI4I8UN42UYilM+LRY2VWkAqF2zPUlMcyi/r6i7HWlR5QbN
   TBnGruhwuwGK1++cRWSrON1EoyGnQvQqIpJuaI+TCTE2ONPEscq+S1RUz
   3tuirBOz0L9JOqne0JdKobv/BjkCvqbvKODixPWraOAHBSx89AOB93PRd
   iodYvROhzz7Ny41bh5Xs5rDym3yTFa5k1prczhgn9DjQ3dqaAPgryoBmq
   XKjffwdbIwWWtE8UW158RD2i8i8cWC6KLwd7TiiSxYXEo0zZ6Oag/6Yud
   g==;
X-CSE-ConnectionGUID: C/pkXPqBSNOOT5gfgi+1yA==
X-CSE-MsgGUID: jdRayoiISHOz7HeflgG92Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70449828"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70449828"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:41:33 -0800
X-CSE-ConnectionGUID: jLaKlmlwQ6Kbdl6LgLmGRg==
X-CSE-MsgGUID: XCB5BfOzS0GOGWFf8p6gHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="205844267"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Jan 2026 17:41:32 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vijhR-000000000Pt-0nVX;
	Thu, 22 Jan 2026 01:41:29 +0000
Date: Thu, 22 Jan 2026 02:41:11 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 26/31] slice_test.c:70:20: warning:
 overflow in expression; result is 705'032'704 with type 'long'
Message-ID: <202601220246.iRqmV1p7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   81b74125144d2db6f40a345b875f085addbcd230
commit: 50ec9f1ddac81e9b447b98db2da519728735aa79 [26/31] selftests/rseq: Implement time slice extension test
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601220246.iRqmV1p7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220246.iRqmV1p7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220246.iRqmV1p7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> slice_test.c:70:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
      70 |         .total_nsecs    =  5 * NSEC_PER_SEC,
         |                            ~~^~~~~~~~~~~~~~
   slice_test.c:78:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
      78 |         .total_nsecs    =  5 * NSEC_PER_SEC,
         |                            ~~^~~~~~~~~~~~~~
   slice_test.c:86:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
      86 |         .total_nsecs    =  5 * NSEC_PER_SEC,
         |                            ~~^~~~~~~~~~~~~~
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
