Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F60B395275
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393788; cv=none; b=ntr6e7KZPkWMzlblX6aQEuUty9NgGqtyCeB5qC3WLnUFe+bMqLMXL6jhcfxYopfp19qcDsEbArcuc7vjyvHF1bdJKbp3llEP5JGP8irg112Jak7Ckw+2MpkBx6FnJzbz8bvIDtjF080sB0y/rVFClutJ2gXvPbNMXTxYSRwiUZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393788; c=relaxed/simple;
	bh=rC60G7qE4bqTQjGWSF+PKnvnxMpsHgRBVTTw0SwfC88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p4AejucEOvzpT27FDKS4+6rTqyuQkugQkwyJLmo/NMAQafyEvzTe6S9dsgoXwgK+mR58kD9krXt6KjsXfuhOhXXKMBJkih/MPNFwHC2AaM8rNFy5L/G/RATonwIuU6716jVJWJkLBpf07BIxBadWWn4CMaOgTevbDGV86eoKRvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdMBlRaQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdMBlRaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768393786; x=1799929786;
  h=date:from:to:cc:subject:message-id;
  bh=rC60G7qE4bqTQjGWSF+PKnvnxMpsHgRBVTTw0SwfC88=;
  b=AdMBlRaQtlgxldJgR9Mq17Krjoiea0Ecim7rktkJoD/fzT9pn09FeN4k
   rFnfIFewj2jDg+iLHPM+iyd7VG5+HTnrk0sGqj8ObflYQbkircMEziFIu
   Lt74i/7HmNN9qULXlhV9eu2WgTPZHelkULXZOG9+zmCSEsP5SqPnZMfhv
   oSX6AFO2OIjhSz+jO5uAyq1N9DInIXuffxey4xo/duyyoBM8alLGBGrfV
   zi6Cvewo6oJ/vwbnyBUjI+bgRWY9Ql7zYppFbzWg/FwRZAJfBb5nw3oWO
   7turGqtm8DteeOMQpos+Iy1gv6MLRR6ZXdokartStIkTG4zJeFknuCtdu
   Q==;
X-CSE-ConnectionGUID: BeH10O88TZmT5LUDQS85Pg==
X-CSE-MsgGUID: bwLTWIg8RGWFb2wizSbhYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73544453"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73544453"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:29:44 -0800
X-CSE-ConnectionGUID: ACK1pyFHRLKtW6nKtt/q7w==
X-CSE-MsgGUID: 961mvMCOSEy2qGkPdmAJIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204688603"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 04:29:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg00J-00000000GMk-0u5n;
	Wed, 14 Jan 2026 12:29:39 +0000
Date: Wed, 14 Jan 2026 20:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 10/15] mm/bpf_oom.c:40:36: error: no
 member named 'bpf_oom_link' in 'struct cgroup_bpf'
Message-ID: <202601142031.oHaorPQa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   0096e4611728d881621b8fa5bf9f6cd849c88d14
commit: 77f0b096f685662730887bb2162e4f507c4986e1 [10/15] mm: introduce BPF OOM struct ops
config: i386-randconfig-003-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142031.oHaorPQa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142031.oHaorPQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142031.oHaorPQa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/bpf_oom.c:40:36: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
      40 |                 st_link = memcg->css.cgroup->bpf.bpf_oom_link;
         |                           ~~~~~~~~~~~~~~~~~~~~~~ ^
   mm/bpf_oom.c:103:16: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     103 |         if (cgrp->bpf.bpf_oom_link) {
         |             ~~~~~~~~~ ^
   mm/bpf_oom.c:106:32: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     106 |                 rcu_assign_pointer(cgrp->bpf.bpf_oom_link, st_link);
         |                                    ~~~~~~~~~ ^
   include/linux/rcupdate.h:594:15: note: expanded from macro 'rcu_assign_pointer'
     594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
         |                             ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:630:22: note: expanded from macro 'compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:618:23: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:610:9: note: expanded from macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/bpf_oom.c:106:32: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     106 |                 rcu_assign_pointer(cgrp->bpf.bpf_oom_link, st_link);
         |                                    ~~~~~~~~~ ^
   include/linux/rcupdate.h:594:15: note: expanded from macro 'rcu_assign_pointer'
     594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
         |                             ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:630:22: note: expanded from macro 'compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:618:23: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:610:9: note: expanded from macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/bpf_oom.c:106:32: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     106 |                 rcu_assign_pointer(cgrp->bpf.bpf_oom_link, st_link);
         |                                    ~~~~~~~~~ ^
   include/linux/rcupdate.h:594:15: note: expanded from macro 'rcu_assign_pointer'
     594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
         |                             ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:630:22: note: expanded from macro 'compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:618:23: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:610:9: note: expanded from macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/bpf_oom.c:106:32: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     106 |                 rcu_assign_pointer(cgrp->bpf.bpf_oom_link, st_link);
         |                                    ~~~~~~~~~ ^
   include/linux/rcupdate.h:594:15: note: expanded from macro 'rcu_assign_pointer'
     594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
         |                             ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:630:22: note: expanded from macro 'compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:618:23: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:610:9: note: expanded from macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/bpf_oom.c:106:32: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     106 |                 rcu_assign_pointer(cgrp->bpf.bpf_oom_link, st_link);
         |                                    ~~~~~~~~~ ^
   include/linux/rcupdate.h:594:15: note: expanded from macro 'rcu_assign_pointer'
     594 |                 WRITE_ONCE((p), (typeof(p))(_r_a_p__v));                      \
         |                             ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'


vim +40 mm/bpf_oom.c

    28	
    29	bool bpf_handle_oom(struct oom_control *oc)
    30	{
    31		struct bpf_struct_ops_link *st_link;
    32		struct bpf_oom_ops *bpf_oom_ops;
    33		struct mem_cgroup *memcg;
    34		int ret = 0;
    35	
    36		rcu_read_lock_trace();
    37	
    38		/* Find the nearest bpf_oom_ops traversing the cgroup tree upwards */
    39		for (memcg = oc->memcg; memcg; memcg = parent_mem_cgroup(memcg), ret = 0) {
  > 40			st_link = memcg->css.cgroup->bpf.bpf_oom_link;
    41			if (!st_link)
    42				continue;
    43	
    44			bpf_oom_ops = (struct bpf_oom_ops *)bpf_struct_ops_link_to_ops(st_link);
    45			if (!bpf_oom_ops)
    46				continue;
    47	
    48			/* Call BPF OOM handler */
    49			ret = bpf_ops_handle_oom(bpf_oom_ops, st_link, oc);
    50			if (ret && oc->bpf_memory_freed)
    51				break;
    52		}
    53	
    54		rcu_read_unlock_trace();
    55	
    56		return ret && oc->bpf_memory_freed;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
