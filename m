Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61A502BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729043408; cv=none; b=V7Z9CmduWaGIuP+76KvWjGBfAm1skrhbEMHEqxLlTTy0iA49G9Oucjp34HRUjjH9NYZdUiUb6UIZBi2UhMhjCNAJwaZ0Om0HAW08ORvLY2/dBxyBY+YQZJ2qw5JQyN71+6pb84urIwwKYIkA5hs9zPKj9RzsVrFvXIGBASya2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729043408; c=relaxed/simple;
	bh=Bshvfdj7euntKocUwKZdrvhD5zR+T3MRFGYP+CEJLlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXsaizzwW6MKz4H+aVT/uTfgrSIxdCdQbvELMVvgSq1cCnaigOKnTBkBNQCMWrVpy5MD8NY98nO9y9/S8k61+xMUnRES77u1azZI8PWfKbeNJ1nKyO5DXP5yZcxSy2ANGIwwvAnkklXFYWnGLsSrHhtKAApIgIFwfRaJd73xKDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQINxWUA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQINxWUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729043407; x=1760579407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bshvfdj7euntKocUwKZdrvhD5zR+T3MRFGYP+CEJLlk=;
  b=DQINxWUABw/txo8ynI/CHRAy2UKuboEid7ZeEyKLAaBy5wMNlplWufwO
   KbtK07XFuovzM/a2d00feeL9Osrwff5m1dr06iyHXwYQsCyPg5jIa+FxM
   08Yn9LBjiO6HPyqhFlDPSti5TtKhl1Ef4fFb1Uw39FI3nQT3NxS6Bqf3D
   F2GbXtECfynNRQ11U13WzdcfmRlhPFQju5enE3RdM4vwEJ64ehVMq4p8Z
   T3HWrtxXmsuEU9iRxIeYSMn9zerHQR5jAES8R3x6VG171btbmxfk/oyEb
   ugnOOlr/sUpcs3SK7z1O4zqvu+XgueKvFdtKlPmEjoRlUYGjrD0eSQe4y
   g==;
X-CSE-ConnectionGUID: kjJN+A5LSiyLiu/NfbZ1TQ==
X-CSE-MsgGUID: MRpfveCIR5SP8oE5bFRETg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28568950"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="28568950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 18:50:06 -0700
X-CSE-ConnectionGUID: ZAUOEMZNQuWGzjUvfU6rSQ==
X-CSE-MsgGUID: MUY432r0QRuR3FgLrq6ZRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78028951"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Oct 2024 18:50:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0tAo-000K9P-1m;
	Wed, 16 Oct 2024 01:50:02 +0000
Date: Wed, 16 Oct 2024 09:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.11/main 283/1854] kernel/sched/cputime.c:256:24: error: use
 of undeclared identifier 'paravirt_steal_enabled'
Message-ID: <202410160946.QSSn4dl0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.11/main
head:   afade16a193faf08d100d52c254bb5c6c5605b8c
commit: 2ae95ea38f6e661cbb9693419f15a8b73e01aaa6 [283/1854] sched/alt: Headers cleanup
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241016/202410160946.QSSn4dl0-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160946.QSSn4dl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160946.QSSn4dl0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:56:
>> kernel/sched/cputime.c:256:24: error: use of undeclared identifier 'paravirt_steal_enabled'
     256 |         if (static_key_false(&paravirt_steal_enabled)) {
         |                               ^
   kernel/sched/cputime.c:259:11: error: call to undeclared function 'paravirt_steal_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     259 |                 steal = paravirt_steal_clock(smp_processor_id());
         |                         ^
   In file included from kernel/sched/build_policy.c:61:
   kernel/sched/syscalls.c:23:6: error: call to undeclared function 'dl_policy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      23 |         if (dl_policy(policy))
         |             ^
   kernel/sched/syscalls.c:24:10: error: use of undeclared identifier 'MAX_DL_PRIO'
      24 |                 prio = MAX_DL_PRIO - 1;
         |                        ^
   kernel/sched/syscalls.c:25:11: error: call to undeclared function 'rt_policy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      25 |         else if (rt_policy(policy))
         |                  ^
   kernel/sched/syscalls.c:77:2: error: unknown type name 'class_task_rq_lock_t'; did you mean 'class_task_lock_t'?
      77 |         CLASS(task_rq_lock, rq_guard)(p);
         |         ^
   include/linux/cleanup.h:122:2: note: expanded from macro 'CLASS'
     122 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:97:1: note: expanded from here
      97 | class_task_rq_lock_t
         | ^
   include/linux/sched/task.h:231:1: note: 'class_task_lock_t' declared here
     231 | DEFINE_GUARD(task_lock, struct task_struct *, task_lock(_T), task_unlock(_T))
         | ^
   include/linux/cleanup.h:155:2: note: expanded from macro 'DEFINE_GUARD'
     155 |         DEFINE_CLASS(_name, _type, if (_T) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^
   include/linux/cleanup.h:108:15: note: expanded from macro 'DEFINE_CLASS'
     108 | typedef _type class_##_name##_t;                                        \
         |               ^
   <scratch space>:27:1: note: expanded from here
      27 | class_task_lock_t
         | ^
   In file included from kernel/sched/build_policy.c:61:
   kernel/sched/syscalls.c:77:2: error: use of undeclared identifier 'class_task_rq_lock_destructor'; did you mean 'class_task_lock_destructor'?
      77 |         CLASS(task_rq_lock, rq_guard)(p);
         |         ^
   include/linux/cleanup.h:122:34: note: expanded from macro 'CLASS'
     122 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |                                         ^
   <scratch space>:99:1: note: expanded from here
      99 | class_task_rq_lock_destructor
         | ^
   include/linux/sched/task.h:231:1: note: 'class_task_lock_destructor' declared here
     231 | DEFINE_GUARD(task_lock, struct task_struct *, task_lock(_T), task_unlock(_T))
         | ^
   include/linux/cleanup.h:155:2: note: expanded from macro 'DEFINE_GUARD'
     155 |         DEFINE_CLASS(_name, _type, if (_T) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^
   include/linux/cleanup.h:109:20: note: expanded from macro 'DEFINE_CLASS'
     109 | static inline void class_##_name##_destructor(_type *p)                 \
         |                    ^
   <scratch space>:29:1: note: expanded from here
      29 | class_task_lock_destructor
         | ^
   In file included from kernel/sched/build_policy.c:61:
   kernel/sched/syscalls.c:77:2: error: call to undeclared function 'class_task_rq_lock_constructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |         CLASS(task_rq_lock, rq_guard)(p);
         |         ^
   include/linux/cleanup.h:123:3: note: expanded from macro 'CLASS'
     123 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:101:1: note: expanded from here
     101 | class_task_rq_lock_constructor
         | ^
   kernel/sched/syscalls.c:77:2: note: did you mean 'class_task_lock_constructor'?
   include/linux/cleanup.h:123:3: note: expanded from macro 'CLASS'
     123 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:101:1: note: expanded from here
     101 | class_task_rq_lock_constructor
         | ^
   include/linux/sched/task.h:231:1: note: 'class_task_lock_constructor' declared here
     231 | DEFINE_GUARD(task_lock, struct task_struct *, task_lock(_T), task_unlock(_T))
         | ^
   include/linux/cleanup.h:155:2: note: expanded from macro 'DEFINE_GUARD'
     155 |         DEFINE_CLASS(_name, _type, if (_T) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^
   include/linux/cleanup.h:111:21: note: expanded from macro 'DEFINE_CLASS'
     111 | static inline _type class_##_name##_constructor(_init_args)             \
         |                     ^
   <scratch space>:31:1: note: expanded from here
      31 | class_task_lock_constructor
         | ^
   In file included from kernel/sched/build_policy.c:61:
   kernel/sched/syscalls.c:77:22: error: incompatible integer to pointer conversion initializing 'class_task_lock_t' (aka 'struct task_struct *') with an expression of type 'int' [-Wint-conversion]
      77 |         CLASS(task_rq_lock, rq_guard)(p);
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/cleanup.h:122:20: note: expanded from macro 'CLASS'
     122 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |                           ^
   In file included from kernel/sched/build_policy.c:61:
   kernel/sched/syscalls.c:78:15: error: member reference type 'class_task_lock_t' (aka 'struct task_struct *') is a pointer; did you mean to use '->'?
      78 |         rq = rq_guard.rq;
         |              ~~~~~~~~^
         |                      ->
   kernel/sched/syscalls.c:78:16: error: no member named 'rq' in 'struct task_struct'


vim +/paravirt_steal_enabled +256 kernel/sched/cputime.c

1fcf54deb767d4 Josh Don            2022-06-29  247  
03cbc732639ddc Wanpeng Li          2016-08-17  248  /*
03cbc732639ddc Wanpeng Li          2016-08-17  249   * When a guest is interrupted for a longer amount of time, missed clock
03cbc732639ddc Wanpeng Li          2016-08-17  250   * ticks are not redelivered later. Due to that, this function may on
03cbc732639ddc Wanpeng Li          2016-08-17  251   * occasion account more time than the calling functions think elapsed.
03cbc732639ddc Wanpeng Li          2016-08-17  252   */
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  253  static __always_inline u64 steal_account_process_time(u64 maxtime)
73fbec604432e1 Frederic Weisbecker 2012-06-16  254  {
73fbec604432e1 Frederic Weisbecker 2012-06-16  255  #ifdef CONFIG_PARAVIRT
73fbec604432e1 Frederic Weisbecker 2012-06-16 @256  	if (static_key_false(&paravirt_steal_enabled)) {
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  257  		u64 steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  258  
73fbec604432e1 Frederic Weisbecker 2012-06-16  259  		steal = paravirt_steal_clock(smp_processor_id());
73fbec604432e1 Frederic Weisbecker 2012-06-16  260  		steal -= this_rq()->prev_steal_time;
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  261  		steal = min(steal, maxtime);
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  262  		account_steal_time(steal);
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  263  		this_rq()->prev_steal_time += steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  264  
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  265  		return steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  266  	}
73fbec604432e1 Frederic Weisbecker 2012-06-16  267  #endif
807e5b80687c06 Wanpeng Li          2016-06-13  268  	return 0;
73fbec604432e1 Frederic Weisbecker 2012-06-16  269  }
73fbec604432e1 Frederic Weisbecker 2012-06-16  270  

:::::: The code at line 256 was first introduced by commit
:::::: 73fbec604432e1fbfeb1bc59a110dac1f98160f6 sched: Move cputime code to its own file

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
