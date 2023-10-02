Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C018F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 00:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696205628; x=1727741628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dnRZ4OeQn5pCHYVKZUtMS6DOXX2I89avCTu/xOpHZ8I=;
  b=TPr4TnQyZu3RnxLrZzw+Qg96WqvT08w25cc+AtVxlqbN6FHRg2Wd3UsF
   BejcwPMz473EoTzIm6vGNygMW6Gy53Fn0EowEfhi5IWPDUJeJMaORyNze
   JJpHRzknsAXKDDeMUsrTi9G7va7x666kTLP2HXOYeUicq+ke0ZyGpIbfu
   7SBu3ZgPs8NXfpfgw7y1WfUq/+swxnHCIbJbnxQ8TFIHuwaNRMiKX3Dmn
   j5grI+m1IEQHdl7/0mNKqdWEIUkYnSaIOxHVusvl/s/vGZBPVHhSOwmue
   Lk+aQmCmwZ07ZpSToOaDzMUnpoICtvHJJu2F+vJfMDB1/1JoGa8m+ENFQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="381446730"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="381446730"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 17:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="743988493"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="743988493"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 01 Oct 2023 17:13:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn6Z8-0005a5-29;
	Mon, 02 Oct 2023 00:13:39 +0000
Date: Mon, 2 Oct 2023 08:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fwestphal-nf:nft_set_gc_query_08 4/9]
 net/netfilter/nft_set_rbtree.c:634:33: warning: variable 'nft_net' set but
 not used
Message-ID: <202310020837.8axnDARq-lkp@intel.com>
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
commit: a749fd6776c6e28b873270a1fc449432b5a7571d [4/9] netfilter: nft_set_rbtree: prefer sync gc to async worker
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231002/202310020837.8axnDARq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310020837.8axnDARq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310020837.8axnDARq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/nft_set_rbtree.c: In function 'nft_rbtree_gc':
>> net/netfilter/nft_set_rbtree.c:634:33: warning: variable 'nft_net' set but not used [-Wunused-but-set-variable]
     634 |         struct nftables_pernet *nft_net;
         |                                 ^~~~~~~


vim +/nft_net +634 net/netfilter/nft_set_rbtree.c

a749fd6776c6e2 Florian Westphal  2023-09-21  629  
a749fd6776c6e2 Florian Westphal  2023-09-21  630  static void nft_rbtree_gc(struct nft_set *set)
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  631  {
a749fd6776c6e2 Florian Westphal  2023-09-21  632  	struct nft_rbtree *priv = nft_set_priv(set);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  633  	struct nft_rbtree_elem *rbe, *rbe_end = NULL;
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09 @634  	struct nftables_pernet *nft_net;
a749fd6776c6e2 Florian Westphal  2023-09-21  635  	struct rb_node *node, *next;
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  636  	struct nft_trans_gc *gc;
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  637  	struct net *net;
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  638  
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  639  	set  = nft_set_container_of(priv);
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  640  	net  = read_pnet(&set->net);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  641  	nft_net = nft_pernet(net);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  642  
a749fd6776c6e2 Florian Westphal  2023-09-21  643  	gc = nft_trans_gc_alloc(set, 0, GFP_KERNEL);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  644  	if (!gc)
a749fd6776c6e2 Florian Westphal  2023-09-21  645  		return;
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  646  
a749fd6776c6e2 Florian Westphal  2023-09-21  647  	for (node = rb_first(&priv->root); node != NULL; node = next) {
a749fd6776c6e2 Florian Westphal  2023-09-21  648  		next = rb_next(node);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  649  
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  650  		rbe = rb_entry(node, struct nft_rbtree_elem, node);
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  651  
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  652  		/* elements are reversed in the rbtree for historical reasons,
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  653  		 * from highest to lowest value, that is why end element is
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  654  		 * always visited before the start element.
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  655  		 */
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  656  		if (nft_rbtree_interval_end(rbe)) {
a13f814a67b12a Taehee Yoo        2018-08-30  657  			rbe_end = rbe;
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  658  			continue;
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  659  		}
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  660  		if (!nft_set_elem_expired(&rbe->ext))
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  661  			continue;
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  662  
a749fd6776c6e2 Florian Westphal  2023-09-21  663  		gc = nft_trans_gc_queue_sync(gc, GFP_KERNEL);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  664  		if (!gc)
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  665  			goto try_later;
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  666  
a749fd6776c6e2 Florian Westphal  2023-09-21  667  		/* end element needs to be removed first, it has
a749fd6776c6e2 Florian Westphal  2023-09-21  668  		 * no timeout extension.
a749fd6776c6e2 Florian Westphal  2023-09-21  669  		 */
a749fd6776c6e2 Florian Westphal  2023-09-21  670  		if (rbe_end) {
a749fd6776c6e2 Florian Westphal  2023-09-21  671  			nft_rbtree_gc_remove(net, set, priv, rbe_end);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  672  			nft_trans_gc_elem_add(gc, rbe_end);
a13f814a67b12a Taehee Yoo        2018-08-30  673  			rbe_end = NULL;
a749fd6776c6e2 Florian Westphal  2023-09-21  674  		}
a749fd6776c6e2 Florian Westphal  2023-09-21  675  
a749fd6776c6e2 Florian Westphal  2023-09-21  676  		gc = nft_trans_gc_queue_sync(gc, GFP_KERNEL);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  677  		if (!gc)
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  678  			goto try_later;
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  679  
a749fd6776c6e2 Florian Westphal  2023-09-21  680  		nft_rbtree_gc_remove(net, set, priv, rbe);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  681  		nft_trans_gc_elem_add(gc, rbe);
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  682  	}
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  683  
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  684  try_later:
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  685  
a749fd6776c6e2 Florian Westphal  2023-09-21  686  	if (gc) {
a749fd6776c6e2 Florian Westphal  2023-09-21  687  		gc = nft_trans_gc_catchall_sync(gc);
a749fd6776c6e2 Florian Westphal  2023-09-21  688  		nft_trans_gc_queue_sync_done(gc);
a749fd6776c6e2 Florian Westphal  2023-09-21  689  		priv->last_gc = jiffies;
a749fd6776c6e2 Florian Westphal  2023-09-21  690  	}
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  691  }
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  692  

:::::: The code at line 634 was first introduced by commit
:::::: f6c383b8c31a93752a52697f8430a71dcbc46adf netfilter: nf_tables: adapt set backend to use GC transaction API

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
