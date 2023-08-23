Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D6C139
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692811333; x=1724347333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FLgj4DpDhOeFCG+aKkxZ3n75nIB1P9N0cHMQqAKrrFM=;
  b=UxtU/+KGwcrGYB48VJ2nG6gECU32vZh968xvcWb7rMy2fcRKDeOAZ8nj
   5DNvHJYRo4+B3eRcI1G2VoeA+a39veia02dWturBUNG6trj7NCwwEvzjh
   XXmjf2GNvvd3SrlBf/9DjtX714HxTSELMOTZTXZ36wxh0Sz5a1tgjT2Ty
   fVlReW15kVaoNJpNFS+R8EHq1dA1IfmUmDBqnD91k6e69B89xhRV2b72W
   1xXx4BhYcFZCrxm4KFv1L0gzcj2Ooz4vqr7hVwpe0/Jmqzdxe51VY8J1V
   b/FMUUJQieGVF7CzZbV8NlgVxN/BU7mgzXcoSSpAZL1648HppsoPc5Lzk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377976887"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377976887"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 10:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730284635"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730284635"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 10:22:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYrYY-0001N4-2r;
	Wed, 23 Aug 2023 17:22:10 +0000
Date: Thu, 24 Aug 2023 01:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
Message-ID: <202308240153.ie0mgvgb-lkp@intel.com>
References: <486891cb494ba4e9eeb02b6e220ca670dbc80866.1692788531.git.geliang.tang@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <486891cb494ba4e9eeb02b6e220ca670dbc80866.1692788531.git.geliang.tang@suse.com>

Hi Geliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mptcp/export]
[cannot apply to mptcp/export-net linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/mptcp-add-set-get-params-wrappers/20230823-190626
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/486891cb494ba4e9eeb02b6e220ca670dbc80866.1692788531.git.geliang.tang%40suse.com
patch subject: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20230824/202308240153.ie0mgvgb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240153.ie0mgvgb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240153.ie0mgvgb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/mptcp/sched.c:14:
>> include/net/bpf_sk_storage.h:64:1: warning: no previous prototype for 'bpf_sk_storage_lookup' [-Wmissing-prototypes]
      64 | bpf_sk_storage_lookup(struct sock *sk, struct bpf_map *map, bool cacheit_lockit)
         | ^~~~~~~~~~~~~~~~~~~~~
   net/mptcp/sched.c: In function 'mptcp_sched_get_params':
   net/mptcp/sched.c:211:15: error: 'struct sock' has no member named 'sk_bpf_storage'
     211 |         if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
         |               ^~
   net/mptcp/sched.c:211:37: error: 'struct sock' has no member named 'sk_bpf_storage'
     211 |         if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
         |                                     ^~
   net/mptcp/sched.c:212:23: error: 'struct sock' has no member named 'sk_bpf_storage'
     212 |             !strcmp(sk->sk_bpf_storage->smap->map.name, "mptcp_burst_map")) {
         |                       ^~
   net/mptcp/sched.c:215:54: error: 'struct sock' has no member named 'sk_bpf_storage'
     215 |                 sdata = bpf_sk_storage_lookup(sk, &sk->sk_bpf_storage->smap->map, true);
         |                                                      ^~
   net/mptcp/sched.c: In function 'mptcp_sched_set_params':
   net/mptcp/sched.c:239:15: error: 'struct sock' has no member named 'sk_bpf_storage'
     239 |         if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
         |               ^~
   net/mptcp/sched.c:239:37: error: 'struct sock' has no member named 'sk_bpf_storage'
     239 |         if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
         |                                     ^~
   net/mptcp/sched.c:240:23: error: 'struct sock' has no member named 'sk_bpf_storage'
     240 |             !strcmp(sk->sk_bpf_storage->smap->map.name, "mptcp_burst_map")) {
         |                       ^~
   net/mptcp/sched.c:243:54: error: 'struct sock' has no member named 'sk_bpf_storage'
     243 |                 sdata = bpf_sk_storage_lookup(sk, &sk->sk_bpf_storage->smap->map, true);
         |                                                      ^~


vim +/bpf_sk_storage_lookup +64 include/net/bpf_sk_storage.h

    30	
    31	#ifdef CONFIG_BPF_SYSCALL
    32	int bpf_sk_storage_clone(const struct sock *sk, struct sock *newsk);
    33	struct bpf_sk_storage_diag *
    34	bpf_sk_storage_diag_alloc(const struct nlattr *nla_stgs);
    35	void bpf_sk_storage_diag_free(struct bpf_sk_storage_diag *diag);
    36	int bpf_sk_storage_diag_put(struct bpf_sk_storage_diag *diag,
    37				    struct sock *sk, struct sk_buff *skb,
    38				    int stg_array_type,
    39				    unsigned int *res_diag_size);
    40	struct bpf_local_storage_data *
    41	bpf_sk_storage_lookup(struct sock *sk, struct bpf_map *map, bool cacheit_lockit);
    42	#else
    43	static inline int bpf_sk_storage_clone(const struct sock *sk,
    44					       struct sock *newsk)
    45	{
    46		return 0;
    47	}
    48	static inline struct bpf_sk_storage_diag *
    49	bpf_sk_storage_diag_alloc(const struct nlattr *nla)
    50	{
    51		return NULL;
    52	}
    53	static inline void bpf_sk_storage_diag_free(struct bpf_sk_storage_diag *diag)
    54	{
    55	}
    56	static inline int bpf_sk_storage_diag_put(struct bpf_sk_storage_diag *diag,
    57						  struct sock *sk, struct sk_buff *skb,
    58						  int stg_array_type,
    59						  unsigned int *res_diag_size)
    60	{
    61		return 0;
    62	}
    63	struct bpf_local_storage_data *
  > 64	bpf_sk_storage_lookup(struct sock *sk, struct bpf_map *map, bool cacheit_lockit)
    65	{
    66		return NULL;
    67	}
    68	#endif
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
