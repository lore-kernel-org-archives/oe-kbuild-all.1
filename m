Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608A01F419B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756910189; cv=none; b=m8lO670UjT24MQMpfX8W7icErYT2tQK7bOdlRpFq/8DGue8wIfswSkVVeosdY6EtmNrYev4ZluZlc7ShbHhIaEfBrSjwgLZXQv8kBobiQ0xCC5hOWfYpZd4hxJIPrBLvZAEm7qHqSXZLpzyMclM/2Vq5JvPkmfdxPcU8PzeH8mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756910189; c=relaxed/simple;
	bh=pHEds+uF0QwjkXJTphLTmXk7w0lXROFPS53O6CJxa1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uYQOTN+gJBjDa26JIEaK87gEe4RCE+xYcRFAZuibVTyzHaLAh3SswmeY/3/j+8uWyDejP5HnXLQEPrWS/ucLuwukEAfgbZshwufOpS/hKGHAt8x3RrzGG/0Rsj1bb5YxvdLdkvM7Bv4RUV4OILjB/eDFlqbKPQOe1lXMba8XKUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wj6QeUU4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wj6QeUU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756910187; x=1788446187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHEds+uF0QwjkXJTphLTmXk7w0lXROFPS53O6CJxa1s=;
  b=Wj6QeUU4VsPIRJe43sBU+Yqdywrsw4LgtCa5s94M1c8OE86hqs46dXiE
   BfeK9Bl1Rw9JviJvQPtFFJic9cnhkqmLxi5aewo53aOMhsvs9vfQ3WFJV
   spHjd7XjGWgi4TLew6w5vcAVjyyoHclo6dfXj+upwGDKMyP1fHXxAP0Qh
   4/L6CuHENrGa9nvtqCnA/uFFd2gsu4+FOr0YQviEbPUbfb20dzsYxySRH
   2WuUHp0WKM5x2CVUSgzi2dc6mZ9J1IqJDbHOUCJiFUkvbdyCBdukDTB1H
   tK2dv9MdcPNu7EPD1BlCH2d3cOaaziZ1euwas4u5/w4yy2WfjVxHaYe6f
   g==;
X-CSE-ConnectionGUID: WJgXxVRLRd+nYphhz820Gg==
X-CSE-MsgGUID: 32PQgW+GQQ6VHeOWEDbygw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="63044357"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="63044357"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:36:27 -0700
X-CSE-ConnectionGUID: QORY7JXtRXqP/8N3PZinwg==
X-CSE-MsgGUID: bXQsUgZZSBuRxdgGWwG+BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="208809548"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 03 Sep 2025 07:36:25 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utob1-0003Yt-1W;
	Wed, 03 Sep 2025 14:36:23 +0000
Date: Wed, 3 Sep 2025 16:35:55 +0200
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-hier-prototype 9/14]
 include/linux/sched/ext.h:214:42: warning: declaration of 'struct
 task_sturct' will not be visible outside of this function
Message-ID: <202509031639.E72qf2xU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-hier-prototype
head:   7443f4ccb9e360cd50e991db81d27e3514f1be65
commit: 9c899613efcfc4e07c3b6a57e45ad3f95e637bdb [9/14] sched_ext: Keep dying tasks on a separate list
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250903/202509031639.E72qf2xU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509031639.E72qf2xU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509031639.E72qf2xU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
   In file included from arch/x86/include/asm/msr.h:16:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:88:
>> include/linux/sched/ext.h:214:42: warning: declaration of 'struct task_sturct' will not be visible outside of this function [-Wvisibility]
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^
   1 warning generated.
--
>> clang diag: include/linux/sched/ext.h:214:42: warning: declaration of 'struct task_sturct' will not be visible outside of this function [-Wvisibility]


vim +214 include/linux/sched/ext.h

   213	
 > 214	static inline void sched_ext_exit(struct task_sturct *p) {}
   215	static inline void sched_ext_free(struct task_struct *p) {}
   216	static inline void print_scx_info(const char *log_lvl, struct task_struct *p) {}
   217	static inline void scx_softlockup(u32 dur_s) {}
   218	static inline bool scx_rcu_cpu_stall(void) { return false; }
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
