Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D737F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 01:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693014303; x=1724550303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dd4PEBX9NFrnpGQRJj06iJ3e8sQ+dnFC3AmjSyH8NZo=;
  b=X9IZcBRAaFo3HwEOvQ66VZiVES3pVwAZjH/Duff3XSnVgin1N54+512r
   V2itJxwYZxRPzIYh/pOYv/IOCVnIbihXqe8f301eH4s442ssAeJU0vp7a
   6bCziEreihDiiPgoMPWV4StY7hu5ec+Lsl8IKTVGgMxRUuQOfNOr4BPQJ
   spyAb+r30jBtigGUU6Hou1vrwrBX0rqyRf7haeZcnwlVb66cAeHhJWW3z
   KoafaRT8Ijd3yNvSqLC4XocbtTEpvjFzDAikGwPlklYOaqqTXrxcIZNUa
   xmK5wDvjYiunUTfwqaVFfGjLkYA5ki3br3TOJSWH5JLTSzrnkQurfW299
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354363416"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="354363416"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 18:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="714526072"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="714526072"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 18:45:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZiMF-0004EZ-2Q;
	Sat, 26 Aug 2023 01:44:59 +0000
Date: Sat, 26 Aug 2023 09:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
Message-ID: <202308260904.H4nGzNq6-lkp@intel.com>
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
config: i386-randconfig-061-20230823 (https://download.01.org/0day-ci/archive/20230826/202308260904.H4nGzNq6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260904.H4nGzNq6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260904.H4nGzNq6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/mptcp/sched.c:212:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *cs @@     got char [noderef] __rcu * @@
   net/mptcp/sched.c:212:39: sparse:     expected char const *cs
   net/mptcp/sched.c:212:39: sparse:     got char [noderef] __rcu *
   net/mptcp/sched.c:215:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct bpf_map *map @@     got struct bpf_map [noderef] __rcu * @@
   net/mptcp/sched.c:215:70: sparse:     expected struct bpf_map *map
   net/mptcp/sched.c:215:70: sparse:     got struct bpf_map [noderef] __rcu *
   net/mptcp/sched.c:240:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *cs @@     got char [noderef] __rcu * @@
   net/mptcp/sched.c:240:39: sparse:     expected char const *cs
   net/mptcp/sched.c:240:39: sparse:     got char [noderef] __rcu *
   net/mptcp/sched.c:243:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct bpf_map *map @@     got struct bpf_map [noderef] __rcu * @@
   net/mptcp/sched.c:243:70: sparse:     expected struct bpf_map *map
   net/mptcp/sched.c:243:70: sparse:     got struct bpf_map [noderef] __rcu *
   net/mptcp/sched.c:211:37: sparse: sparse: dereference of noderef expression
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
   211		if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
 > 212		    !strcmp(sk->sk_bpf_storage->smap->map.name, "mptcp_burst_map")) {
   213			struct bpf_local_storage_data *sdata;
   214	
   215			sdata = bpf_sk_storage_lookup(sk, &sk->sk_bpf_storage->smap->map, true);
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
