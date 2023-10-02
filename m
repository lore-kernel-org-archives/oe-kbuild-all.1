Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221C0369
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 01:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696209373; x=1727745373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1PVsOwtDEMdJumqKi8LbcdAWbtH3A5B94K+SiDIBP0w=;
  b=hVMz6xp8EwHa/MhNVl/YbSsLsagIZih+rN3z71zWAmMtPCMDV3Z9g5Yj
   asxCmnlcibp4GKLsNYiHFuKyTlAQ8Aqv6hIf2cJRo0mi04lAHtAeLvyhV
   we/BodlCAMff2orhXJRjVTOnvFJ4LS4OynXqrMreh2BLEYFTjPO6wlIGQ
   5HVM93Aq6R2Rz32yzFjtWKGJhctopfx2TJrI86KMMfdC8m2HgudbQgw/1
   9CAc+EoWbvRGDLSN98uSJWG5FOykJmj9F06JC4CqEn7M7lCStR2o5r45I
   qbxnvoW4vGNEruuTn5qFwJ92VWMnLDei5HdKqAnyLoMqErxYlj56pqxsY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379846218"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="379846218"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 18:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="753916655"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="753916655"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2023 18:16:10 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn7Xc-0005dJ-2I;
	Mon, 02 Oct 2023 01:16:08 +0000
Date: Mon, 2 Oct 2023 09:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fwestphal-nf:nft_set_gc_query_08 9/9]
 net/netfilter/nft_set_hash.c:324:21: warning: variable 'net' set but not
 used
Message-ID: <202310020932.38ojNiEU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fwestphal/nf.git nft_set_gc_query_08
head:   31c7936ee2d43d6522af7d7becc1c7fb2d1a3d2a
commit: a55eb7fa0cf0fd120ed2a36c12278b57f23e9c6c [9/9] netfilter: nf_tables: remove gc sequence counter
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231002/202310020932.38ojNiEU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310020932.38ojNiEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310020932.38ojNiEU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/nft_set_hash.c: In function 'nft_rhash_gc':
>> net/netfilter/nft_set_hash.c:324:21: warning: variable 'net' set but not used [-Wunused-but-set-variable]
     324 |         struct net *net;
         |                     ^~~


vim +/net +324 net/netfilter/nft_set_hash.c

563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  316  
5fc6ced958db70 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2017-05-22  317  static void nft_rhash_gc(struct work_struct *work)
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  318  {
3dd0673ac3cd7d net/netfilter/nft_hash.c     Patrick McHardy   2015-04-05  319  	struct nft_set *set;
5fc6ced958db70 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2017-05-22  320  	struct nft_rhash_elem *he;
5fc6ced958db70 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2017-05-22  321  	struct nft_rhash *priv;
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  322  	struct rhashtable_iter hti;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  323  	struct nft_trans_gc *gc;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09 @324  	struct net *net;
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  325  
5fc6ced958db70 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2017-05-22  326  	priv = container_of(work, struct nft_rhash, gc_work.work);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  327  	set  = nft_set_container_of(priv);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  328  	net  = read_pnet(&set->net);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  329  
a55eb7fa0cf0fd net/netfilter/nft_set_hash.c Florian Westphal  2023-09-27  330  	gc = nft_trans_gc_alloc(set, GFP_KERNEL);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  331  	if (!gc)
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  332  		goto done;
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  333  
0de22baabc97f7 net/netfilter/nft_set_hash.c Taehee Yoo        2018-09-14  334  	rhashtable_walk_enter(&priv->ht, &hti);
97a6ec4ac021f7 net/netfilter/nft_set_hash.c Tom Herbert       2017-12-04  335  	rhashtable_walk_start(&hti);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  336  
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  337  	while ((he = rhashtable_walk_next(&hti))) {
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  338  		if (IS_ERR(he)) {
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  339  			nft_trans_gc_destroy(gc);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  340  			gc = NULL;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  341  			goto try_later;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  342  		}
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  343  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  344  		if (nft_set_elem_is_dead(&he->ext))
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  345  			goto dead_elem;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  346  
563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  347  		if (nft_set_ext_exists(&he->ext, NFT_SET_EXT_EXPRESSIONS) &&
563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  348  		    nft_rhash_expr_needs_gc_run(set, &he->ext))
563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  349  			goto needs_gc_run;
79b174ade16d90 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2018-06-02  350  
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  351  		if (!nft_set_elem_expired(&he->ext))
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  352  			continue;
563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  353  needs_gc_run:
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  354  		nft_set_elem_dead(&he->ext);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  355  dead_elem:
a55eb7fa0cf0fd net/netfilter/nft_set_hash.c Florian Westphal  2023-09-27  356  		gc = nft_trans_gc_queue_async(gc, GFP_ATOMIC);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  357  		if (!gc)
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  358  			goto try_later;
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  359  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  360  		nft_trans_gc_elem_add(gc, he);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  361  	}
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  362  
a55eb7fa0cf0fd net/netfilter/nft_set_hash.c Florian Westphal  2023-09-27  363  	gc = nft_trans_gc_catchall_async(gc);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  364  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  365  try_later:
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  366  	/* catchall list iteration requires rcu read side lock. */
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  367  	rhashtable_walk_stop(&hti);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  368  	rhashtable_walk_exit(&hti);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  369  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  370  	if (gc)
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  371  		nft_trans_gc_queue_async_done(gc);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  372  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  373  done:
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  374  	queue_delayed_work(system_power_efficient_wq, &priv->gc_work,
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  375  			   nft_set_gc_interval(set));
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  376  }
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  377  

:::::: The code at line 324 was first introduced by commit
:::::: f6c383b8c31a93752a52697f8430a71dcbc46adf netfilter: nf_tables: adapt set backend to use GC transaction API

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
