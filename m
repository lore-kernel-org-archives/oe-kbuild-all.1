Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658D6AAC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 22:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690150681; x=1721686681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20mNq1La9Y7ooumY/uLQ2SUizOyz6ydbFfZUfEdIcCY=;
  b=N/sJ07fy7vhipEv9IpZsmAoTPkPMqahdeLr47TmRTb4uTugZK2tvEUpT
   BBdcVK7qOSryNmhT08uu4BuEFj3N5XWSkp5ZyxQVjnn5E2YWkot/mhoWu
   HhUWW3rtDdqpgdV4Mo2JhDoCu+8qCcgLjFCv4who4A0xFWvHDURfKWqXS
   PnqDEjO6WTSiFIRP78T3VW07qhHkkEggFzyCVq4VHG0LQQrQ/qzGmY54l
   iSd+Oi7o5Tswo09Vmsu4D2ZwbwlH+oMlH2ugC1L8Qj7nKQezrmkQLiUrA
   wzqU6tJwdmjggUOVgfE6e2xWlyVXX4xRfn5pYB+otNR9+8b5wUonr1Umb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="370913678"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="370913678"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 15:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="1056197859"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="1056197859"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2023 15:17:59 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNhOo-0009Ip-2F;
	Sun, 23 Jul 2023 22:17:58 +0000
Date: Mon, 24 Jul 2023 06:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 483/507] kernel/bpf/verifier.c:3815:9:
 error: 'for' loop initial declarations are only allowed in C99 or C11 mode
Message-ID: <202307240639.NOCbDVDR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   2151fafc303ca2ee1be74a5197a5e3afa227f26c
commit: d487fdc3008aebf4e68bde2d83dd55bcf3beb45f [483/507] bpf: Repeat check_max_stack_depth for async callbacks
config: arc-randconfig-r043-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240639.NOCbDVDR-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240639.NOCbDVDR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240639.NOCbDVDR-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_max_stack_depth':
>> kernel/bpf/verifier.c:3815:9: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
    3815 |         for (int i = 0; i < env->subprog_cnt; i++) {
         |         ^~~
   kernel/bpf/verifier.c:3815:9: note: use option '-std=c99', '-std=gnu99', '-std=c11' or '-std=gnu11' to compile your code
   In file included from include/linux/bpf_verifier.h:9,
                    from kernel/bpf/verifier.c:12:
   kernel/bpf/verifier.c: In function 'jit_subprogs':
   include/linux/filter.h:366:18: warning: cast between incompatible function types from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     366 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:12580:37: note: in expansion of macro 'BPF_CAST_CALL'
   12580 |                         insn->imm = BPF_CAST_CALL(func[subprog]->bpf_func) -
         |                                     ^~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'do_misc_fixups':
   include/linux/filter.h:366:18: warning: cast between incompatible function types from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     366 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:13065:45: note: in expansion of macro 'BPF_CAST_CALL'
   13065 |                                 insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:366:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *, void *, u64)' {aka 'int (*)(struct bpf_map *, void *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     366 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:13069:45: note: in expansion of macro 'BPF_CAST_CALL'
   13069 |                                 insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:366:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     366 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:13073:45: note: in expansion of macro 'BPF_CAST_CALL'
   13073 |                                 insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:366:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *, u64)' {aka 'int (*)(struct bpf_map *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     366 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:13077:45: note: in expansion of macro 'BPF_CAST_CALL'
   13077 |                                 insn->imm = BPF_CAST_CALL(ops->map_push_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:366:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     366 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:13081:45: note: in expansion of macro 'BPF_CAST_CALL'
   13081 |                                 insn->imm = BPF_CAST_CALL(ops->map_pop_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:366:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     366 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:13085:45: note: in expansion of macro 'BPF_CAST_CALL'
   13085 |                                 insn->imm = BPF_CAST_CALL(ops->map_peek_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:366:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, u32,  u64)' {aka 'int (*)(struct bpf_map *, unsigned int,  long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     366 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:13089:45: note: in expansion of macro 'BPF_CAST_CALL'
   13089 |                                 insn->imm = BPF_CAST_CALL(ops->map_redirect) -
         |                                             ^~~~~~~~~~~~~


vim +/for +3815 kernel/bpf/verifier.c

  3809	
  3810	static int check_max_stack_depth(struct bpf_verifier_env *env)
  3811	{
  3812		struct bpf_subprog_info *si = env->subprog_info;
  3813		int ret;
  3814	
> 3815		for (int i = 0; i < env->subprog_cnt; i++) {
  3816			if (!i || si[i].is_async_cb) {
  3817				ret = check_max_stack_depth_subprog(env, i);
  3818				if (ret < 0)
  3819					return ret;
  3820			}
  3821			continue;
  3822		}
  3823		return 0;
  3824	}
  3825	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
