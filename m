Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504C19899
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 23:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692140978; x=1723676978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MfwE8bnlfj8CBSKfD+NeeyU5pPd59msgQTpYycbol4E=;
  b=av0cPdTA+HuaR8x4gAvv9yvjxD4yh0OGi88DGfskpjqCMaak66R71EpF
   ebCx4GwVY4zvBHtKuZs4yrSolgcF5qIWP1D7RI/HFh65f7qP9+Tkia+3Q
   vB8ilrnDfY81DepfS+t4GdnZDCSd1MyKiKuRB3rUfjXJqPaCweVROJhR/
   VKXNd2guw+eRtLfMIL5SLN2h0egqDIbMQdN589R8XDwFTAiHouCBQmcok
   G1R65h5iim5Gd2yOMY4cM+NwaJqE5MkU1B+bo06oXJPnOga9uh629oLAJ
   Wa86pVFTjI+6MaxMpy0EVrR8UJ+I8YtRwXXvHDKbfj98X9QulyrQYIfAx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375168006"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="375168006"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 16:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768984366"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="768984366"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 16:09:35 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW3AM-0001J9-2S;
	Tue, 15 Aug 2023 23:09:34 +0000
Date: Wed, 16 Aug 2023 07:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 2/3] Expose tc block ports to the datapath
Message-ID: <202308160724.yOVR5pmi-lkp@intel.com>
References: <20230815162530.150994-3-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815162530.150994-3-jhs@mojatatu.com>

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/Introduce-tc-block-netdev-tracking-infra/20230816-002903
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230815162530.150994-3-jhs%40mojatatu.com
patch subject: [PATCH RFC net-next 2/3] Expose tc block ports to the datapath
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230816/202308160724.yOVR5pmi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160724.yOVR5pmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160724.yOVR5pmi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/cls_api.c: In function 'tcf_classify':
>> net/sched/cls_api.c:1741:30: warning: unused variable 'qdisc_cb' [-Wunused-variable]
    1741 |         struct qdisc_skb_cb *qdisc_cb = qdisc_skb_cb(skb);
         |                              ^~~~~~~~


vim +/qdisc_cb +1741 net/sched/cls_api.c

  1735	
  1736	int tcf_classify(struct sk_buff *skb,
  1737			 const struct tcf_block *block,
  1738			 const struct tcf_proto *tp,
  1739			 struct tcf_result *res, bool compat_mode)
  1740	{
> 1741		struct qdisc_skb_cb *qdisc_cb = qdisc_skb_cb(skb);
  1742	#if !IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
  1743		u32 last_executed_chain = 0;
  1744	
  1745		qdisc_cb->block_index = block->index;
  1746	
  1747		return __tcf_classify(skb, tp, tp, res, compat_mode, NULL, 0,
  1748				      &last_executed_chain);
  1749	#else
  1750		u32 last_executed_chain = tp ? tp->chain->index : 0;
  1751		struct tcf_exts_miss_cookie_node *n = NULL;
  1752		const struct tcf_proto *orig_tp = tp;
  1753		struct tc_skb_ext *ext;
  1754		int act_index = 0;
  1755		int ret;
  1756	
  1757		if (block) {
  1758			ext = skb_ext_find(skb, TC_SKB_EXT);
  1759	
  1760			if (ext && (ext->chain || ext->act_miss)) {
  1761				struct tcf_chain *fchain;
  1762				u32 chain;
  1763	
  1764				if (ext->act_miss) {
  1765					n = tcf_exts_miss_cookie_lookup(ext->act_miss_cookie,
  1766									&act_index);
  1767					if (!n)
  1768						return TC_ACT_SHOT;
  1769	
  1770					chain = n->chain_index;
  1771				} else {
  1772					chain = ext->chain;
  1773				}
  1774	
  1775				fchain = tcf_chain_lookup_rcu(block, chain);
  1776				if (!fchain)
  1777					return TC_ACT_SHOT;
  1778	
  1779				/* Consume, so cloned/redirect skbs won't inherit ext */
  1780				skb_ext_del(skb, TC_SKB_EXT);
  1781	
  1782				tp = rcu_dereference_bh(fchain->filter_chain);
  1783				last_executed_chain = fchain->index;
  1784			}
  1785		}
  1786	
  1787		ret = __tcf_classify(skb, tp, orig_tp, res, compat_mode, n, act_index,
  1788				     &last_executed_chain);
  1789	
  1790		if (tc_skb_ext_tc_enabled()) {
  1791			/* If we missed on some chain */
  1792			if (ret == TC_ACT_UNSPEC && last_executed_chain) {
  1793				struct tc_skb_cb *cb = tc_skb_cb(skb);
  1794	
  1795				ext = tc_skb_ext_alloc(skb);
  1796				if (WARN_ON_ONCE(!ext))
  1797					return TC_ACT_SHOT;
  1798				ext->chain = last_executed_chain;
  1799				ext->mru = cb->mru;
  1800				ext->post_ct = cb->post_ct;
  1801				ext->post_ct_snat = cb->post_ct_snat;
  1802				ext->post_ct_dnat = cb->post_ct_dnat;
  1803				ext->zone = cb->zone;
  1804			}
  1805		}
  1806	
  1807		return ret;
  1808	#endif
  1809	}
  1810	EXPORT_SYMBOL(tcf_classify);
  1811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
