Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B4E14F73
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 22:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696198821; x=1727734821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tR8nljjphbzr5vayUCkhoRzJT+R8zpbXj5I1S4Qj+7s=;
  b=jB9oK7kpfdnDA0YkkNh5sC8FMEiKWpAhAsWZj/SuQtg1FUmX43G7y2UQ
   OJGT2iztmzP6fve/zaHZ03m6u8bdvLTWYtfF6UHoSrvQkx6GsOrYls2uA
   lDVIlUehdmOgu2g0f3aw3ZC7QDakZG2e0QN2EqERhPynSEWmMdOEM5lTK
   uayJp5Z1mbBrSwnmK0dxlu1mdkh0M59l8A6+Ts6yhtsrNBmLaFGALZou5
   AUgtY6XKjR+UvU/FDp3Kb8ncqhvHGbKZ/JuF0F5uPBCRLP5Zwdadg6tWY
   gaoxnsxD/ffVL0GWh9lmJOMlsbA8lwl4EPtE/8Aet6f/wX27pZwYQvny8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="381441344"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="381441344"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 15:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="840824835"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="840824835"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2023 15:19:53 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn4n0-0005TJ-38;
	Sun, 01 Oct 2023 22:19:50 +0000
Date: Mon, 2 Oct 2023 06:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fwestphal-nf:nft_set_gc_query_08 2/9]
 net/netfilter/nft_set_pipapo.c:1556: warning: Function parameter or member
 'set' not described in 'pipapo_gc'
Message-ID: <202310020613.Ey8XWZP8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fwestphal/nf.git nft_set_gc_query_08
head:   a55eb7fa0cf0fd120ed2a36c12278b57f23e9c6c
commit: fa0c5ad207acc0aaaf399f59b95919aa068dffc0 [2/9] netfilter: nf_tables: de-constify set commit ops function argument
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231002/202310020613.Ey8XWZP8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310020613.Ey8XWZP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310020613.Ey8XWZP8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_set_pipapo.c:1556: warning: Function parameter or member 'set' not described in 'pipapo_gc'
>> net/netfilter/nft_set_pipapo.c:1556: warning: Excess function parameter '_set' description in 'pipapo_gc'


vim +1556 net/netfilter/nft_set_pipapo.c

f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1549  
3c4287f62044a90 Stefano Brivio    2020-01-22  1550  /**
3c4287f62044a90 Stefano Brivio    2020-01-22  1551   * pipapo_gc() - Drop expired entries from set, destroy start and end elements
08713cb006b6f07 Florian Westphal  2023-08-10  1552   * @_set:	nftables API set representation
3c4287f62044a90 Stefano Brivio    2020-01-22  1553   * @m:		Matching data
3c4287f62044a90 Stefano Brivio    2020-01-22  1554   */
fa0c5ad207acc0a Florian Westphal  2023-09-21  1555  static void pipapo_gc(struct nft_set *set, struct nft_pipapo_match *m)
3c4287f62044a90 Stefano Brivio    2020-01-22 @1556  {
3c4287f62044a90 Stefano Brivio    2020-01-22  1557  	struct nft_pipapo *priv = nft_set_priv(set);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1558  	struct net *net = read_pnet(&set->net);
3c4287f62044a90 Stefano Brivio    2020-01-22  1559  	int rules_f0, first_rule = 0;
aaa31047a6d25da Pablo Neira Ayuso 2021-04-27  1560  	struct nft_pipapo_elem *e;
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1561  	struct nft_trans_gc *gc;
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1562  
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1563  	gc = nft_trans_gc_alloc(set, 0, GFP_KERNEL);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1564  	if (!gc)
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1565  		return;
3c4287f62044a90 Stefano Brivio    2020-01-22  1566  
3c4287f62044a90 Stefano Brivio    2020-01-22  1567  	while ((rules_f0 = pipapo_rules_same_key(m->f, first_rule))) {
3c4287f62044a90 Stefano Brivio    2020-01-22  1568  		union nft_pipapo_map_bucket rulemap[NFT_PIPAPO_MAX_FIELDS];
3c4287f62044a90 Stefano Brivio    2020-01-22  1569  		struct nft_pipapo_field *f;
3c4287f62044a90 Stefano Brivio    2020-01-22  1570  		int i, start, rules_fx;
3c4287f62044a90 Stefano Brivio    2020-01-22  1571  
3c4287f62044a90 Stefano Brivio    2020-01-22  1572  		start = first_rule;
3c4287f62044a90 Stefano Brivio    2020-01-22  1573  		rules_fx = rules_f0;
3c4287f62044a90 Stefano Brivio    2020-01-22  1574  
3c4287f62044a90 Stefano Brivio    2020-01-22  1575  		nft_pipapo_for_each_field(f, i, m) {
3c4287f62044a90 Stefano Brivio    2020-01-22  1576  			rulemap[i].to = start;
3c4287f62044a90 Stefano Brivio    2020-01-22  1577  			rulemap[i].n = rules_fx;
3c4287f62044a90 Stefano Brivio    2020-01-22  1578  
3c4287f62044a90 Stefano Brivio    2020-01-22  1579  			if (i < m->field_count - 1) {
3c4287f62044a90 Stefano Brivio    2020-01-22  1580  				rules_fx = f->mt[start].n;
3c4287f62044a90 Stefano Brivio    2020-01-22  1581  				start = f->mt[start].to;
3c4287f62044a90 Stefano Brivio    2020-01-22  1582  			}
3c4287f62044a90 Stefano Brivio    2020-01-22  1583  		}
3c4287f62044a90 Stefano Brivio    2020-01-22  1584  
3c4287f62044a90 Stefano Brivio    2020-01-22  1585  		/* Pick the last field, and its last index */
3c4287f62044a90 Stefano Brivio    2020-01-22  1586  		f--;
3c4287f62044a90 Stefano Brivio    2020-01-22  1587  		i--;
3c4287f62044a90 Stefano Brivio    2020-01-22  1588  		e = f->mt[rulemap[i].to].e;
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1589  
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1590  		/* synchronous gc never fails, there is no need to set on
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1591  		 * NFT_SET_ELEM_DEAD_BIT.
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1592  		 */
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1593  		if (nft_set_elem_expired(&e->ext)) {
3c4287f62044a90 Stefano Brivio    2020-01-22  1594  			priv->dirty = true;
3c4287f62044a90 Stefano Brivio    2020-01-22  1595  
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1596  			gc = nft_trans_gc_queue_sync(gc, GFP_ATOMIC);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1597  			if (!gc)
6d365eabce3c018 Pablo Neira Ayuso 2023-09-06  1598  				return;
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1599  
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1600  			nft_pipapo_gc_deactivate(net, set, e);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1601  			pipapo_drop(m, rulemap);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1602  			nft_trans_gc_elem_add(gc, e);
3c4287f62044a90 Stefano Brivio    2020-01-22  1603  
3c4287f62044a90 Stefano Brivio    2020-01-22  1604  			/* And check again current first rule, which is now the
3c4287f62044a90 Stefano Brivio    2020-01-22  1605  			 * first we haven't checked.
3c4287f62044a90 Stefano Brivio    2020-01-22  1606  			 */
3c4287f62044a90 Stefano Brivio    2020-01-22  1607  		} else {
3c4287f62044a90 Stefano Brivio    2020-01-22  1608  			first_rule += rules_f0;
3c4287f62044a90 Stefano Brivio    2020-01-22  1609  		}
3c4287f62044a90 Stefano Brivio    2020-01-22  1610  	}
3c4287f62044a90 Stefano Brivio    2020-01-22  1611  
4a9e12ea7e70223 Pablo Neira Ayuso 2023-09-06  1612  	gc = nft_trans_gc_catchall_sync(gc);
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1613  	if (gc) {
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1614  		nft_trans_gc_queue_sync_done(gc);
3c4287f62044a90 Stefano Brivio    2020-01-22  1615  		priv->last_gc = jiffies;
3c4287f62044a90 Stefano Brivio    2020-01-22  1616  	}
f6c383b8c31a937 Pablo Neira Ayuso 2023-08-09  1617  }
3c4287f62044a90 Stefano Brivio    2020-01-22  1618  

:::::: The code at line 1556 was first introduced by commit
:::::: 3c4287f62044a90e73a561aa05fc46e62da173da nf_tables: Add set type for arbitrary concatenation of ranges

:::::: TO: Stefano Brivio <sbrivio@redhat.com>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
