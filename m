Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0EC29B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732152008; cv=none; b=COrXuxtJPFFI1vF9dG1BSxW6tYzfTP5vVn7sdWLy3EoPqk84Md2FJHaVEAvFwOIgntOwXcv22sFaNaUuRqraA7T9eQtxyiwvCiY1ucEDctwDaRlwTzq58siGJ2hN9oiY4rXTu0odFGqC3IhsE/B47/AjxYbRLMzvACFirO8N1OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732152008; c=relaxed/simple;
	bh=cRNucalwbAkljL8d4csf+YAnpdQdBqgBJITpZEVtI6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAn9OEnKk7y9sMZc0c5CW1TwLmpz+wY784kwTG/wRjA210z3KM3Aa+zfp9IHdkprah2wLx1rk+LKXH/+vA25fUg+uYgCe24J/kDfJsqqb2Q/7d3ARygVbJ8W8FnQC2OgB9s3zAAxmUG367V/Z4bK/f3tUBZfLFXBhfuo6l03ndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iL1XXqrS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iL1XXqrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732152007; x=1763688007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRNucalwbAkljL8d4csf+YAnpdQdBqgBJITpZEVtI6Y=;
  b=iL1XXqrSSZwokGOlzzed8M2AnO7wIb8OKSoseI6zRAjy63XzR3xapC3L
   dRQrOytQetenzaf5ZpusI96fHmxh8tGLzfmtCsP12zMsinZMXjPAbvMlk
   rz1bAPkPtawbfCuwUI233qT5ciJleq+szXu2MO72/T8hTEf5CEP6fQ9C6
   XW5iQvjjCf+fQcGJE6hznj0q5f/uMLIiLzs9zqcGbVsjRAQvfsHJvxOLi
   +rd3EobY3fFiyBMcMyCnSvjFH2HTnHnxTMVSGdwcXxDtD4afQUE0N5b0d
   lW33dvcFHuSFdXmOhJ/eq+rj2Q1rJc90TbWMCn7wuH8o1RUJG+e/0rsdR
   Q==;
X-CSE-ConnectionGUID: I5Wj0UBiRXiCUBht8Srj+A==
X-CSE-MsgGUID: l5qLumN2Qdi9fqIwtICWCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31606590"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="31606590"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 17:20:05 -0800
X-CSE-ConnectionGUID: tinxmBcjSrSgk7DkjZUfBA==
X-CSE-MsgGUID: AyKerkIYQh+gvOxoqMAEqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90076894"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2024 17:20:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDvrV-0001H7-0x;
	Thu, 21 Nov 2024 01:20:01 +0000
Date: Thu, 21 Nov 2024 09:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 4/4] (.text+0x14d8): multiple
 definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first
 defined here
Message-ID: <202411210945.Q4Ly4IEr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   22a918e8984faca048ec24295ed20e91b682a03e
commit: 22a918e8984faca048ec24295ed20e91b682a03e [4/4] migrate,sysfs: add pagecache promotion
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241121/202411210945.Q4Ly4IEr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210945.Q4Ly4IEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210945.Q4Ly4IEr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:21:
>> include/linux/sched/numa_balancing.h:56:5: warning: no previous prototype for 'numa_hint_fault_latency' [-Wmissing-prototypes]
      56 | int numa_hint_fault_latency(struct folio *folio)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c: In function '__do_sys_clone3':
   kernel/fork.c:3075:2: warning: #warning clone3() entry point is missing, please fix [-Wcpp]
    3075 | #warning clone3() entry point is missing, please fix
         |  ^~~~~~~
--
   In file included from include/trace/events/sched.h:9,
                    from kernel/exit.c:57:
>> include/linux/sched/numa_balancing.h:56:5: warning: no previous prototype for 'numa_hint_fault_latency' [-Wmissing-prototypes]
      56 | int numa_hint_fault_latency(struct folio *folio)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   sh4-linux-ld: kernel/exit.o: in function `numa_hint_fault_latency':
>> (.text+0x14d8): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/kthread.o: in function `numa_hint_fault_latency':
   (.text+0x1df8): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/sched/core.o: in function `numa_hint_fault_latency':
   (.text+0x7e34): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/sched/fair.o: in function `numa_hint_fault_latency':
   (.text+0x1f9c): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/sched/build_policy.o: in function `numa_hint_fault_latency':
   (.text+0x5608): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/sched/build_utility.o: in function `numa_hint_fault_latency':
   (.text+0x5cac): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/hung_task.o: in function `numa_hint_fault_latency':
   (.text+0x838): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/trace/ftrace.o: in function `numa_hint_fault_latency':
   ftrace.c:(.text+0x92a4): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/trace/trace_sched_switch.o: in function `numa_hint_fault_latency':
   trace_sched_switch.c:(.text+0x1354): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/trace/trace_sched_wakeup.o: in function `numa_hint_fault_latency':
   trace_sched_wakeup.c:(.text+0x35c8): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/trace/trace_osnoise.o: in function `numa_hint_fault_latency':
   trace_osnoise.c:(.text+0xa584): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/trace/fgraph.o: in function `numa_hint_fault_latency':
   fgraph.c:(.text+0x192c): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/trace/trace_events.o: in function `numa_hint_fault_latency':
   trace_events.c:(.text+0xb0b4): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: kernel/trace/rv/monitors/wwnr/wwnr.o: in function `numa_hint_fault_latency':
   (.text+0x670): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: fs/exec.o: in function `numa_hint_fault_latency':
   (.text+0x2338): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: fs/coredump.o: in function `numa_hint_fault_latency':
   (.text+0x1588): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here
   sh4-linux-ld: fs/proc/array.o: in function `numa_hint_fault_latency':
   (.text+0xc94): multiple definition of `numa_hint_fault_latency'; kernel/fork.o:(.text+0x1750): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
