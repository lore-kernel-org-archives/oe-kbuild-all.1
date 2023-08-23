Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98EA1C3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692825188; x=1724361188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tcb65uxbIPl+5ljnTMo3m9T+BxDMvqtLuF7URnuFNFE=;
  b=Epvn4IYZrIEtpZY+h5a6Ys67bTU1zkiI9ZphTNQ2a8vbRFFr92Euy5C9
   KRLZ+11kF+lw39LiYLfn7bAHNStMTa8NaMmlMAillTmQkxVVqrG4U5wBe
   zX6SkV2noGJjB4MtuF60sk0NJRvtHF+INvTSABhQOinyH/y+tCgB6ImlX
   4BzICfSxRVAB6qP+XTyA5Yd/Q9IkdfpGJTPCnGsO/nUBpDYAAQsoIMG5c
   WZbVU0R2NhD1aNaBi/Xdgas8H8uheJw6MuO6qYjN76EhJbLFd8uyqwOwp
   RS5J0HDTLMuHOd2NGDMWQfxNel4/NX6tiNr7bY1o73iXfjg2PeBJiQXli
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378026732"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="378026732"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 14:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736804038"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="736804038"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Aug 2023 14:13:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYvA2-0001Vt-0i;
	Wed, 23 Aug 2023 21:13:06 +0000
Date: Thu, 24 Aug 2023 05:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
Message-ID: <202308240536.xHdtOcPf-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on mptcp/export]
[cannot apply to mptcp/export-net linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/mptcp-add-set-get-params-wrappers/20230823-190626
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/486891cb494ba4e9eeb02b6e220ca670dbc80866.1692788531.git.geliang.tang%40suse.com
patch subject: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20230824/202308240536.xHdtOcPf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240536.xHdtOcPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240536.xHdtOcPf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/mptcp/sched.c:14:
   include/net/bpf_sk_storage.h:64:1: warning: no previous prototype for 'bpf_sk_storage_lookup' [-Wmissing-prototypes]
      64 | bpf_sk_storage_lookup(struct sock *sk, struct bpf_map *map, bool cacheit_lockit)
         | ^~~~~~~~~~~~~~~~~~~~~
   net/mptcp/sched.c: In function 'mptcp_sched_get_params':
>> net/mptcp/sched.c:211:15: error: 'struct sock' has no member named 'sk_bpf_storage'
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


vim +211 net/mptcp/sched.c

   203	
   204	int mptcp_sched_get_params(struct mptcp_sock *msk)
   205	{
   206		struct sock *sk = (struct sock *)msk;
   207	
   208		if (msk->sched == &mptcp_sched_default)
   209			return msk->snd_burst;
   210	
 > 211		if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
   212		    !strcmp(sk->sk_bpf_storage->smap->map.name, "mptcp_burst_map")) {
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
