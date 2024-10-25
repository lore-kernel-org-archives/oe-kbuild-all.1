Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B38228B4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859529; cv=none; b=aIaeiISIgsIETjeZ3A8reMNDug2/HkUDovDxh8oRxqbJWbZz010HNLcoyZs0Eeg65eqKu3DIjcozZIG6i0YSfdvkr/zU+UNkydLP4tnHlCJO5fH5mHsYe8K+USylu6E92kJessKDqsDs8d5/x0Y6BB9yPp+Z6Sy3LR7kSQ7ROIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859529; c=relaxed/simple;
	bh=4j3yVcbcqqR13wu2ooYOANC0T2uJkkHYNXmlI0puUAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUBVQ0VwXrqpxfrSK9gjZeFZlQMHZqKsKGqfTZDDiIwo9/+iMY/tgLi/aIdM3A+0eGlmBUp3ukasDJHbtKWUBZlWWFI6N8xE9E9yaWNWSfRFmaxv+z4n97ytVBQhlnW4cQXonvb19S9WIyex1XfqH07EhWyp5abceVCt9ryyFLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5IfV6rU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5IfV6rU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729859526; x=1761395526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4j3yVcbcqqR13wu2ooYOANC0T2uJkkHYNXmlI0puUAw=;
  b=V5IfV6rUKftGNkHDAiZxy71LMSFh42ZIynVLb7oSPuRgrL/QHdzkvU7J
   U4W4aW3p8iaPsN1sXC40IsVKGq7nsCNASNKC2rMiV5mjOwoDhB/tZ0nCa
   R1C2ye8RwaRCteaHEnR5VKaRVfNvkDyreDtUatMkLyxw4AKa+W9rjeyv0
   axJkYcEAdjQwgri0bPyusKh8cd2BrseyXwrIhbYpLdzMUyv8x4k3R+cRD
   fkOe169f55VgKOLLAy7L5ovOaB0X0//3k1c+pCZwSWbNxeoeuLhehZovL
   kbGsj+DT8W3r9FydgDU5hehsRQZp8KAp2ZRHgQmUp+JOaqSkU3W2RT5Ba
   Q==;
X-CSE-ConnectionGUID: X4ccmVfKQwWIHjBXtvYu2Q==
X-CSE-MsgGUID: q4ZiiCL5SfWHZ89mFOpKog==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29644333"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="29644333"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:32:05 -0700
X-CSE-ConnectionGUID: REoa30bZT7mO3/qQmzrVMw==
X-CSE-MsgGUID: SS6U8q9gTrSerPSMxgeBhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="118363933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2024 05:32:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4JU2-000YFc-1h;
	Fri, 25 Oct 2024 12:32:02 +0000
Date: Fri, 25 Oct 2024 20:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 5/17] kernel/unwind/user.c:210:15: error: 'struct
 unwind_user_info' has no member named 'nr_entries'; did you mean 'entries'?
Message-ID: <202410252008.wd0pPsI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   7f54f6a91246a746ba799c52c97effb41e28a88b
commit: f16e616d9fd58524e2200a34c267279e578816a7 [5/17] unwind: Add deferred userspace unwinding API
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241025/202410252008.wd0pPsI3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252008.wd0pPsI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252008.wd0pPsI3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from arch/x86/include/asm/percpu.h:616,
                    from arch/x86/include/asm/current.h:11,
                    from include/linux/sched.h:12,
                    from kernel/unwind/user.c:8:
   kernel/unwind/user.c: In function 'unwind_user_deferred':
   kernel/unwind/user.c:150:47: error: 'unwind_ctx_ctr' undeclared (first use in this function)
     150 |                 u64 ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
         |                                               ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu_size_call_return'
     318 |         typeof(variable) pscr_ret__;                                    \
         |                ^~~~~~~~
   include/linux/percpu-defs.h:433:9: note: in expansion of macro 'raw_cpu_read'
     433 |         raw_cpu_read(pcp);                                              \
         |         ^~~~~~~~~~~~
   kernel/unwind/user.c:150:31: note: in expansion of macro '__this_cpu_read'
     150 |                 u64 ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
         |                               ^~~~~~~~~~~~~~~
   kernel/unwind/user.c:150:47: note: each undeclared identifier is reported only once for each function it appears in
     150 |                 u64 ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
         |                                               ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu_size_call_return'
     318 |         typeof(variable) pscr_ret__;                                    \
         |                ^~~~~~~~
   include/linux/percpu-defs.h:433:9: note: in expansion of macro 'raw_cpu_read'
     433 |         raw_cpu_read(pcp);                                              \
         |         ^~~~~~~~~~~~
   kernel/unwind/user.c:150:31: note: in expansion of macro '__this_cpu_read'
     150 |                 u64 ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
         |                               ^~~~~~~~~~~~~~~
   kernel/unwind/user.c: In function 'unwind_user_task_work':
   kernel/unwind/user.c:195:43: error: 'unwind_ctx_ctr' undeclared (first use in this function)
     195 |                 ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
         |                                           ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu_size_call_return'
     318 |         typeof(variable) pscr_ret__;                                    \
         |                ^~~~~~~~
   include/linux/percpu-defs.h:433:9: note: in expansion of macro 'raw_cpu_read'
     433 |         raw_cpu_read(pcp);                                              \
         |         ^~~~~~~~~~~~
   kernel/unwind/user.c:195:27: note: in expansion of macro '__this_cpu_read'
     195 |                 ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
         |                           ^~~~~~~~~~~~~~~
>> kernel/unwind/user.c:210:15: error: 'struct unwind_user_info' has no member named 'nr_entries'; did you mean 'entries'?
     210 |         info->nr_entries = trace.nr;
         |               ^~~~~~~~~~
         |               entries
>> kernel/unwind/user.c:211:15: error: 'struct unwind_user_info' has no member named 'last_cookie'; did you mean 'last_cookies'?
     211 |         info->last_cookie = cookie;
         |               ^~~~~~~~~~~
         |               last_cookies
>> kernel/unwind/user.c:179:18: warning: variable 'ctx_ctr' set but not used [-Wunused-but-set-variable]
     179 |         u64 cpu, ctx_ctr;
         |                  ^~~~~~~
>> kernel/unwind/user.c:179:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     179 |         u64 cpu, ctx_ctr;
         |             ^~~
   kernel/unwind/user.c: At top level:
   kernel/unwind/user.c:27:28: warning: 'ctx_ctr' defined but not used [-Wunused-variable]
      27 | static DEFINE_PER_CPU(u64, ctx_ctr);
         |                            ^~~~~~~
   include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     104 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   kernel/unwind/user.c:27:8: note: in expansion of macro 'DEFINE_PER_CPU'
      27 | static DEFINE_PER_CPU(u64, ctx_ctr);
         |        ^~~~~~~~~~~~~~


vim +210 kernel/unwind/user.c

   172	
   173	static void unwind_user_task_work(struct callback_head *unused)
   174	{
   175		struct unwind_user_info *info = &current->unwind_user_info;
   176		struct unwind_stacktrace trace;
   177		unsigned long pending_callbacks;
   178		u64 cookie;
 > 179		u64 cpu, ctx_ctr;
   180		int i;
   181	
   182		BUILD_BUG_ON(UNWIND_MAX_CALLBACKS > 32);
   183	
   184		if (WARN_ON_ONCE(!info->ctx_cookie || !info->pending_callbacks))
   185			return;
   186	
   187		scoped_guard(irqsave) {
   188			pending_callbacks = info->pending_callbacks;
   189			cookie = info->ctx_cookie;
   190	
   191			info->pending_callbacks = 0;
   192			info->ctx_cookie = 0;
   193	
   194			cpu = raw_smp_processor_id();
   195			ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
   196		}
   197	
   198		if (!info->entries) {
   199			info->entries = kmalloc(UNWIND_MAX_ENTRIES * sizeof(long),
   200						GFP_KERNEL);
   201			if (!info->entries)
   202				return;
   203		}
   204	
   205		trace.entries = info->entries;
   206	
   207		trace.nr = 0;
   208		unwind_user(&trace, UNWIND_MAX_ENTRIES);
   209	
 > 210		info->nr_entries = trace.nr;
 > 211		info->last_cookie = cookie;
   212	
   213		guard(rwsem_read)(&callbacks_rwsem);
   214	
   215		for_each_set_bit(i, &pending_callbacks, UNWIND_MAX_CALLBACKS) {
   216			if (callbacks[i])
   217				callbacks[i]->func(&trace, cookie, info->privs[i]);
   218		}
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
