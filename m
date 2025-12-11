Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819782BE05A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 01:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416506; cv=none; b=YvmWD4L7U6pe+oUSXXVOj6riFXQKNNVAeU60do3eOP314lVpoNHAODms2ZK2lYwFtIMUxHU3TKxz4t0yzuLZhMBwr0c1NzCdS6uASG6hg/gM92jK8w3jcfGruway+xfnrK2XJdBm3A9G/DVrGPl2DVwgzHsldWgWZTTR2gSe3PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416506; c=relaxed/simple;
	bh=xEtJOwmjrnQEycV1Gp0Bxrp/zOcTkyEX8GbbXaRPVxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iRKMYeYdH8kZxf+KV1scYajE74b8GVUiS1qzQCl2SYRZ2x/xTDHo8SeD4hoWQl8e+WACQRYeHupbVUhcar3gNRxnSyYsY13nQe+iVCQ7mxGUvQX8GwqIDBCYDarGUf5Z0rmgqvmE4AmZ/Z0AENU+6rRUL5Fx5m+l3yXo0CKl0BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XR4eZEe+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XR4eZEe+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765416505; x=1796952505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xEtJOwmjrnQEycV1Gp0Bxrp/zOcTkyEX8GbbXaRPVxk=;
  b=XR4eZEe+A48GU1VdguSoy7S2f9gNYYK8NHhC0WUgX4YrhyzPhTZcMkqk
   NHkvjqPFDP8+rj7CQ80xa4tpQPzW52kPVSft7wxDyGhamc5nINPhd8i2K
   4Mto2YML3oi7AYw/WZjizWm7uUbOTvruGo/oIkbXlujab8jmjFm9YAtax
   1J0aX6HodIYNonL86q8ROHNi+vfZl7jyyKxLNl4xZWBzmGrGdAxVx/spj
   245aZSPskOlss5o7BVABENVjmLGpEvxP7ueEXLUAMNrUZEpET4KJhHPmd
   EXaq3SPlJuCY/4rYm503BUzQd2DOGlCe/mPjpOisBew1YWrYSL6dB0x7T
   g==;
X-CSE-ConnectionGUID: 1QBofypNSFuSj7WkCZ2zoA==
X-CSE-MsgGUID: XfIYwxGlRx6thhsNJeK/8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84804448"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84804448"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 17:28:24 -0800
X-CSE-ConnectionGUID: 6uBYE3oASA6cGcPZJqVRbw==
X-CSE-MsgGUID: J9dVCB+MTzy/tsGIwvT9HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="220007974"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 17:28:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTVTg-000000003xz-21ws;
	Thu, 11 Dec 2025 01:28:20 +0000
Date: Thu, 11 Dec 2025 09:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 net/netfilter/nft_set_rbtree.c:634:33: warning: variable 'nft_net' set but
 not used
Message-ID: <202512110901.OVoeoeUo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: c80fcb6caa9bfca2486e2b66b54786089f203afc [25/25] netfilter: nft_set_rbtree: prefer sync gc to async worker
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251211/202512110901.OVoeoeUo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110901.OVoeoeUo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110901.OVoeoeUo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/nft_set_rbtree.c: In function 'nft_rbtree_gc':
>> net/netfilter/nft_set_rbtree.c:634:33: warning: variable 'nft_net' set but not used [-Wunused-but-set-variable]
     634 |         struct nftables_pernet *nft_net;
         |                                 ^~~~~~~


vim +/nft_net +634 net/netfilter/nft_set_rbtree.c

c80fcb6caa9bfca Florian Westphal  2023-10-13  629  
c80fcb6caa9bfca Florian Westphal  2023-10-13  630  static void nft_rbtree_gc(struct nft_set *set)
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  631  {
c80fcb6caa9bfca Florian Westphal  2023-10-13  632  	struct nft_rbtree *priv = nft_set_priv(set);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  633  	struct nft_rbtree_elem *rbe, *rbe_end = NULL;
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09 @634  	struct nftables_pernet *nft_net;
c80fcb6caa9bfca Florian Westphal  2023-10-13  635  	struct rb_node *node, *next;
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  636  	struct nft_trans_gc *gc;
5d235d6ce75c12a Pablo Neira Ayuso 2023-01-14  637  	struct net *net;
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  638  
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  639  	set  = nft_set_container_of(priv);
5d235d6ce75c12a Pablo Neira Ayuso 2023-01-14  640  	net  = read_pnet(&set->net);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  641  	nft_net = nft_pernet(net);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  642  
c80fcb6caa9bfca Florian Westphal  2023-10-13  643  	gc = nft_trans_gc_alloc(set, 0, GFP_KERNEL);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  644  	if (!gc)
c80fcb6caa9bfca Florian Westphal  2023-10-13  645  		return;
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  646  
c80fcb6caa9bfca Florian Westphal  2023-10-13  647  	for (node = rb_first(&priv->root); node ; node = next) {
c80fcb6caa9bfca Florian Westphal  2023-10-13  648  		next = rb_next(node);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  649  
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  650  		rbe = rb_entry(node, struct nft_rbtree_elem, node);
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  651  
5d235d6ce75c12a Pablo Neira Ayuso 2023-01-14  652  		/* elements are reversed in the rbtree for historical reasons,
5d235d6ce75c12a Pablo Neira Ayuso 2023-01-14  653  		 * from highest to lowest value, that is why end element is
5d235d6ce75c12a Pablo Neira Ayuso 2023-01-14  654  		 * always visited before the start element.
5d235d6ce75c12a Pablo Neira Ayuso 2023-01-14  655  		 */
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  656  		if (nft_rbtree_interval_end(rbe)) {
a13f814a67b12a2 Taehee Yoo        2018-08-30  657  			rbe_end = rbe;
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  658  			continue;
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  659  		}
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  660  		if (!nft_set_elem_expired(&rbe->ext))
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  661  			continue;
5d235d6ce75c12a Pablo Neira Ayuso 2023-01-14  662  
c80fcb6caa9bfca Florian Westphal  2023-10-13  663  		gc = nft_trans_gc_queue_sync(gc, GFP_KERNEL);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  664  		if (!gc)
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  665  			goto try_later;
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  666  
c80fcb6caa9bfca Florian Westphal  2023-10-13  667  		/* end element needs to be removed first, it has
c80fcb6caa9bfca Florian Westphal  2023-10-13  668  		 * no timeout extension.
c80fcb6caa9bfca Florian Westphal  2023-10-13  669  		 */
c80fcb6caa9bfca Florian Westphal  2023-10-13  670  		if (rbe_end) {
c80fcb6caa9bfca Florian Westphal  2023-10-13  671  			nft_rbtree_gc_remove(net, set, priv, rbe_end);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  672  			nft_trans_gc_elem_add(gc, rbe_end);
a13f814a67b12a2 Taehee Yoo        2018-08-30  673  			rbe_end = NULL;
c80fcb6caa9bfca Florian Westphal  2023-10-13  674  		}
c80fcb6caa9bfca Florian Westphal  2023-10-13  675  
c80fcb6caa9bfca Florian Westphal  2023-10-13  676  		gc = nft_trans_gc_queue_sync(gc, GFP_KERNEL);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  677  		if (!gc)
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  678  			goto try_later;
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  679  
c80fcb6caa9bfca Florian Westphal  2023-10-13  680  		nft_rbtree_gc_remove(net, set, priv, rbe);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  681  		nft_trans_gc_elem_add(gc, rbe);
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  682  	}
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  683  
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  684  try_later:
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  685  
c80fcb6caa9bfca Florian Westphal  2023-10-13  686  	if (gc) {
c80fcb6caa9bfca Florian Westphal  2023-10-13  687  		gc = nft_trans_gc_catchall_sync(gc);
c80fcb6caa9bfca Florian Westphal  2023-10-13  688  		nft_trans_gc_queue_sync_done(gc);
c80fcb6caa9bfca Florian Westphal  2023-10-13  689  		priv->last_gc = jiffies;
c80fcb6caa9bfca Florian Westphal  2023-10-13  690  	}
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  691  }
8d8540c4f5e03d8 Pablo Neira Ayuso 2018-05-16  692  

:::::: The code at line 634 was first introduced by commit
:::::: f6c383b8c31a93752a52697f8430a71dcbc46adf netfilter: nf_tables: adapt set backend to use GC transaction API

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
