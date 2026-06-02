Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F6638A714
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419411; cv=none; b=XYkrEBMX/gFAukiFNbTF3ZYkmb086Nl/gJz94R5FCXAmclEmFVHUf9LWS9vw5TErMqqshhq6UMZyo6Wd2+OYSE2A6z3RSrjGhbjfZIV58+Oo9fBr3NUUuCo9lVuYroK8ppDeRwkcabbIj3taQz/9Sk8Mzep7cBvoHEYYaXmp5AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419411; c=relaxed/simple;
	bh=xrS+/EDBZOi+7kITwH/Q5LBGkF3+5R19qwwlzrqMxD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pwnCVtCefDEsiPR64b+w8JkRTIAUbKsg+22YvSilYd4+cfL2l4FWoEfzYvGC4gFU0oRd4q2RU0VnsSB9PZhLHiRURwKVRbF7FCG8bTYzBVPL5fY9tTsQ2kl3btSs84y/ihtgTq9yOQkku1O298dZFGdOk70yVERme8xKM759VTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLPhG/yq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLPhG/yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780419410; x=1811955410;
  h=date:from:to:cc:subject:message-id;
  bh=xrS+/EDBZOi+7kITwH/Q5LBGkF3+5R19qwwlzrqMxD8=;
  b=dLPhG/yqewQTDDPiErl1f7hyEzLCP3aweyek3x6Ga/wW0lTaZhzF4pVa
   Sv+szA4agYltbbtayYzZSOzi0OjYOggps+kjN50UE+NBPSW9txqkcdr2W
   9SWw7pVY6gB73K8uygOY1JXHS2e2NAaGtZK6i8sIdYwYZgvDcAAXlOxqx
   WLUETp9ITkCRCIgxU/8i7/0VoXVFF9nAY1X9z1B3vOagt28KudbNWEWCC
   rYMcJEB+YRfyLIZ3T1hvDjW0ulzQgva+kvJgqciooVPHjBILuQO5G4KOV
   G0tH1KzItAe/+mgOsi6umGdRGgS3worPU4Vd6OCxFh2mBGsxT5AAHd6H/
   w==;
X-CSE-ConnectionGUID: UmmQUfl9SX+sQA+2jgsmGw==
X-CSE-MsgGUID: 3UDcH3HZR96to5QoWuq6gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91898435"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="91898435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:56:47 -0700
X-CSE-ConnectionGUID: 3U4leaOoSrywnvn/7CHmKg==
X-CSE-MsgGUID: t0jzBMDCSc25oKvrltFG1w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jun 2026 09:56:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUSQ0-00000000CJi-07qk;
	Tue, 02 Jun 2026 16:56:44 +0000
Date: Wed, 03 Jun 2026 00:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 net/netfilter/nft_set_rbtree.c:634:26: warning: variable 'nft_net' set but
 not used
Message-ID: <202606030013.ZsS4JAKp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Florian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   99556d6f90332715f214ad982a1ac3abc25f141b
commit: c80fcb6caa9bfca2486e2b66b54786089f203afc [1/1] netfilter: nft_set_rbtree: prefer sync gc to async worker
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606030013.ZsS4JAKp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030013.ZsS4JAKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030013.ZsS4JAKp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/netfilter/nft_set_rbtree.c:13:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> net/netfilter/nft_set_rbtree.c:634:26: warning: variable 'nft_net' set but not used [-Wunused-but-set-variable]
     634 |         struct nftables_pernet *nft_net;
         |                                 ^
   5 warnings generated.


vim +/nft_net +634 net/netfilter/nft_set_rbtree.c

c80fcb6caa9bfc Florian Westphal  2023-10-13  629  
c80fcb6caa9bfc Florian Westphal  2023-10-13  630  static void nft_rbtree_gc(struct nft_set *set)
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  631  {
c80fcb6caa9bfc Florian Westphal  2023-10-13  632  	struct nft_rbtree *priv = nft_set_priv(set);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  633  	struct nft_rbtree_elem *rbe, *rbe_end = NULL;
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09 @634  	struct nftables_pernet *nft_net;
c80fcb6caa9bfc Florian Westphal  2023-10-13  635  	struct rb_node *node, *next;
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  636  	struct nft_trans_gc *gc;
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  637  	struct net *net;
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  638  
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  639  	set  = nft_set_container_of(priv);
5d235d6ce75c12 Pablo Neira Ayuso 2023-01-14  640  	net  = read_pnet(&set->net);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  641  	nft_net = nft_pernet(net);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  642  
c80fcb6caa9bfc Florian Westphal  2023-10-13  643  	gc = nft_trans_gc_alloc(set, 0, GFP_KERNEL);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  644  	if (!gc)
c80fcb6caa9bfc Florian Westphal  2023-10-13  645  		return;
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  646  
c80fcb6caa9bfc Florian Westphal  2023-10-13  647  	for (node = rb_first(&priv->root); node ; node = next) {
c80fcb6caa9bfc Florian Westphal  2023-10-13  648  		next = rb_next(node);
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
c80fcb6caa9bfc Florian Westphal  2023-10-13  663  		gc = nft_trans_gc_queue_sync(gc, GFP_KERNEL);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  664  		if (!gc)
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  665  			goto try_later;
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  666  
c80fcb6caa9bfc Florian Westphal  2023-10-13  667  		/* end element needs to be removed first, it has
c80fcb6caa9bfc Florian Westphal  2023-10-13  668  		 * no timeout extension.
c80fcb6caa9bfc Florian Westphal  2023-10-13  669  		 */
c80fcb6caa9bfc Florian Westphal  2023-10-13  670  		if (rbe_end) {
c80fcb6caa9bfc Florian Westphal  2023-10-13  671  			nft_rbtree_gc_remove(net, set, priv, rbe_end);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  672  			nft_trans_gc_elem_add(gc, rbe_end);
a13f814a67b12a Taehee Yoo        2018-08-30  673  			rbe_end = NULL;
c80fcb6caa9bfc Florian Westphal  2023-10-13  674  		}
c80fcb6caa9bfc Florian Westphal  2023-10-13  675  
c80fcb6caa9bfc Florian Westphal  2023-10-13  676  		gc = nft_trans_gc_queue_sync(gc, GFP_KERNEL);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  677  		if (!gc)
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  678  			goto try_later;
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  679  
c80fcb6caa9bfc Florian Westphal  2023-10-13  680  		nft_rbtree_gc_remove(net, set, priv, rbe);
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  681  		nft_trans_gc_elem_add(gc, rbe);
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  682  	}
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  683  
f6c383b8c31a93 Pablo Neira Ayuso 2023-08-09  684  try_later:
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  685  
c80fcb6caa9bfc Florian Westphal  2023-10-13  686  	if (gc) {
c80fcb6caa9bfc Florian Westphal  2023-10-13  687  		gc = nft_trans_gc_catchall_sync(gc);
c80fcb6caa9bfc Florian Westphal  2023-10-13  688  		nft_trans_gc_queue_sync_done(gc);
c80fcb6caa9bfc Florian Westphal  2023-10-13  689  		priv->last_gc = jiffies;
c80fcb6caa9bfc Florian Westphal  2023-10-13  690  	}
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  691  }
8d8540c4f5e03d Pablo Neira Ayuso 2018-05-16  692  

:::::: The code at line 634 was first introduced by commit
:::::: f6c383b8c31a93752a52697f8430a71dcbc46adf netfilter: nf_tables: adapt set backend to use GC transaction API

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
