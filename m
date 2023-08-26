Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCCE389
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 01:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693012914; x=1724548914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=koOH8lTATpDPOLiLiy7OAgxQ1u6vu60sD4ypzKmwh/o=;
  b=UD7X5/XaMRQzkl/5D5MfgTVvEvhx8zbE3nYGageziUFhbUU986FJwaBD
   W4lpDFr0hcIYFZYpoG2DW7Yeu4bkneDHVII1P89xSyYxWTRmj/dL+E1fT
   PfRcu7UbIdJhep3d7XyWX54jMQAwLRl/+4Ro8CPoJIIqso8P/tGZGKPjY
   xuio0cknfuJnyj22CEBQknLRKusgbP8Enfh4UQN0F59YRxOYP/wtm5w7c
   Y43qvgaUGbIF4i4S1o2/rcDCOL1eBef9qMoO3prgAN+n6Gei6CnJ75hzO
   nbUJTDfTTD6zR8dKqZdxMHeun+fObGPJMDKfMUI/xmT4hmOzQVJt2EWFk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373707702"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="373707702"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 18:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="740796294"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="740796294"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Aug 2023 18:21:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZhzq-0004DD-2L;
	Sat, 26 Aug 2023 01:21:50 +0000
Date: Sat, 26 Aug 2023 09:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
Message-ID: <202308260938.lXj4ClGy-lkp@intel.com>
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
[cannot apply to mptcp/export-net linus/master v6.5-rc7 next-20230825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/mptcp-add-set-get-params-wrappers/20230823-190626
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/486891cb494ba4e9eeb02b6e220ca670dbc80866.1692788531.git.geliang.tang%40suse.com
patch subject: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
config: powerpc-randconfig-r131-20230823 (https://download.01.org/0day-ci/archive/20230826/202308260938.lXj4ClGy-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260938.lXj4ClGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260938.lXj4ClGy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/mptcp/sched.c:212:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const * @@     got char [noderef] __rcu * @@
   net/mptcp/sched.c:212:39: sparse:     expected char const *
   net/mptcp/sched.c:212:39: sparse:     got char [noderef] __rcu *
>> net/mptcp/sched.c:215:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct bpf_map *map @@     got struct bpf_map [noderef] __rcu * @@
   net/mptcp/sched.c:215:70: sparse:     expected struct bpf_map *map
   net/mptcp/sched.c:215:70: sparse:     got struct bpf_map [noderef] __rcu *
   net/mptcp/sched.c:240:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const * @@     got char [noderef] __rcu * @@
   net/mptcp/sched.c:240:39: sparse:     expected char const *
   net/mptcp/sched.c:240:39: sparse:     got char [noderef] __rcu *
   net/mptcp/sched.c:243:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct bpf_map *map @@     got struct bpf_map [noderef] __rcu * @@
   net/mptcp/sched.c:243:70: sparse:     expected struct bpf_map *map
   net/mptcp/sched.c:243:70: sparse:     got struct bpf_map [noderef] __rcu *
>> net/mptcp/sched.c:211:37: sparse: sparse: dereference of noderef expression
   net/mptcp/sched.c:212:23: sparse: sparse: dereference of noderef expression
   net/mptcp/sched.c:215:54: sparse: sparse: dereference of noderef expression
   net/mptcp/sched.c:239:37: sparse: sparse: dereference of noderef expression
   net/mptcp/sched.c:240:23: sparse: sparse: dereference of noderef expression
   net/mptcp/sched.c:243:54: sparse: sparse: dereference of noderef expression

vim +212 net/mptcp/sched.c

   203	
   204	int mptcp_sched_get_params(struct mptcp_sock *msk)
   205	{
   206		struct sock *sk = (struct sock *)msk;
   207	
   208		if (msk->sched == &mptcp_sched_default)
   209			return msk->snd_burst;
   210	
 > 211		if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
 > 212		    !strcmp(sk->sk_bpf_storage->smap->map.name, "mptcp_burst_map")) {
   213			struct bpf_local_storage_data *sdata;
   214	
 > 215			sdata = bpf_sk_storage_lookup(sk, &sk->sk_bpf_storage->smap->map, true);
   216			if (sdata) {
   217				struct mptcp_burst_storage {
   218					int snd_burst;
   219				} *ptr;
   220	
   221				ptr = (struct mptcp_burst_storage *)sdata->data;
   222				if (ptr)
   223					return ptr->snd_burst;
   224			}
   225		}
   226	
   227		return 0;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
