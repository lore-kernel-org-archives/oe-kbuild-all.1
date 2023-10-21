Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49BD517
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSiHYL0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697928750; x=1729464750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BBJ/PUDVAXPcx9B7E4X94vZpKqJxAfLvZ+5qLomTrh0=;
  b=HSiHYL0rqSOlBkbuwOiVAy5UxhLr4pz3FxWOBT6MjOnTuT10KKer3snA
   CbGhSK3y5aNjb29tfjAjMY/wtr/Ji/jXPp69V7x9HGbj4PyCto/2gzJp7
   Ovl1OdOXMTACGTeRE8MUgm1VLnm4SHgfgHjyaWVBJXQXL68DXK+UAdIMB
   2PHglUYIBam26ck1GDlGQMdCGITzBvhjTD/zk/Rvl2vvU67yTBmMFCBVV
   ctTI2GG/XNobop2nR15thiJw0GjREuZmKNvwiXFmcKIRG+0hqCqa/II8q
   d/t3kfllvvzpDNvulazG5mUiElQ6haP2U7tLODsaGoIzkYxf9CPhMQywY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="5286242"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="5286242"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 15:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="881387424"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="881387424"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2023 15:52:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quKpV-0005Je-0c;
	Sat, 21 Oct 2023 22:52:25 +0000
Date: Sun, 22 Oct 2023 06:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Nogueira <victor@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v2 1/1] net: sched: Disambiguate verdict
 from return code
Message-ID: <202310220628.lUcXGGLq-lkp@intel.com>
References: <20231014180921.833820-1-victor@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231014180921.833820-1-victor@mojatatu.com>

Hi Victor,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on linus/master v6.6-rc6]
[cannot apply to net-next/main next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Victor-Nogueira/net-sched-Disambiguate-verdict-from-return-code/20231017-134937
base:   net/main
patch link:    https://lore.kernel.org/r/20231014180921.833820-1-victor%40mojatatu.com
patch subject: [PATCH RFC net-next v2 1/1] net: sched: Disambiguate verdict from return code
config: s390-debug_defconfig (https://download.01.org/0day-ci/archive/20231022/202310220628.lUcXGGLq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220628.lUcXGGLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220628.lUcXGGLq-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sched/cls_api.c: In function 'tcf_classify':
>> net/sched/cls_api.c:1776:59: error: 'SKB_TC_EXT_COOKIE_NOTFOUND' undeclared (first use in this function); did you mean 'SKB_DROP_REASON_TC_EXT_COOKIE_NOTFOUND'?
    1776 |                                         u32 drop_reason = SKB_TC_EXT_COOKIE_NOTFOUND;
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                           SKB_DROP_REASON_TC_EXT_COOKIE_NOTFOUND
   net/sched/cls_api.c:1776:59: note: each undeclared identifier is reported only once for each function it appears in
>> net/sched/cls_api.c:1813:51: error: 'SKB_TC_ALLOC_SKB_EXT' undeclared (first use in this function)
    1813 |                                 u32 drop_reason = SKB_TC_ALLOC_SKB_EXT;
         |                                                   ^~~~~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:1837:26: error: invalid storage class for function 'tcf_chain_tp_prev'
    1837 | static struct tcf_proto *tcf_chain_tp_prev(struct tcf_chain *chain,
         |                          ^~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:1843:12: error: invalid storage class for function 'tcf_chain_tp_insert'
    1843 | static int tcf_chain_tp_insert(struct tcf_chain *chain,
         |            ^~~~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:1859:13: error: invalid storage class for function 'tcf_chain_tp_remove'
    1859 | static void tcf_chain_tp_remove(struct tcf_chain *chain,
         |             ^~~~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:1871:26: error: invalid storage class for function 'tcf_chain_tp_find'
    1871 | static struct tcf_proto *tcf_chain_tp_find(struct tcf_chain *chain,
         |                          ^~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:1881:26: error: invalid storage class for function 'tcf_chain_tp_insert_unique'
    1881 | static struct tcf_proto *tcf_chain_tp_insert_unique(struct tcf_chain *chain,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c: In function 'tcf_chain_tp_insert_unique':
>> net/sched/cls_api.c:1898:14: error: implicit declaration of function 'tcf_chain_tp_find'; did you mean 'tcf_chain_tp_prev'? [-Werror=implicit-function-declaration]
    1898 |         tp = tcf_chain_tp_find(chain, &chain_info,
         |              ^~~~~~~~~~~~~~~~~
         |              tcf_chain_tp_prev
   net/sched/cls_api.c:1898:12: warning: assignment to 'struct tcf_proto *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1898 |         tp = tcf_chain_tp_find(chain, &chain_info,
         |            ^
   net/sched/cls_api.c: In function 'tcf_classify':
>> net/sched/cls_api.c:1915:13: error: invalid storage class for function 'tcf_chain_tp_delete_empty'
    1915 | static void tcf_chain_tp_delete_empty(struct tcf_chain *chain,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1956:26: error: invalid storage class for function 'tcf_chain_tp_find'
    1956 | static struct tcf_proto *tcf_chain_tp_find(struct tcf_chain *chain,
         |                          ^~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:1989:12: error: invalid storage class for function 'tcf_fill_node'
    1989 | static int tcf_fill_node(struct net *net, struct sk_buff *skb,
         |            ^~~~~~~~~~~~~
>> net/sched/cls_api.c:2050:12: error: invalid storage class for function 'tfilter_notify'
    2050 | static int tfilter_notify(struct net *net, struct sk_buff *oskb,
         |            ^~~~~~~~~~~~~~
>> net/sched/cls_api.c:2079:12: error: invalid storage class for function 'tfilter_del_notify'
    2079 | static int tfilter_del_notify(struct net *net, struct sk_buff *oskb,
         |            ^~~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:2118:13: error: invalid storage class for function 'tfilter_notify_chain'
    2118 | static void tfilter_notify_chain(struct net *net, struct sk_buff *oskb,
         |             ^~~~~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:2132:13: error: invalid storage class for function 'tfilter_put'
    2132 | static void tfilter_put(struct tcf_proto *tp, void *fh)
         |             ^~~~~~~~~~~
>> net/sched/cls_api.c:2138:13: error: invalid storage class for function 'is_qdisc_ingress'
    2138 | static bool is_qdisc_ingress(__u32 classid)
         |             ^~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:2143:12: error: invalid storage class for function 'tc_new_tfilter'
    2143 | static int tc_new_tfilter(struct sk_buff *skb, struct nlmsghdr *n,
         |            ^~~~~~~~~~~~~~
>> net/sched/cls_api.c:2377:12: error: invalid storage class for function 'tc_del_tfilter'
    2377 | static int tc_del_tfilter(struct sk_buff *skb, struct nlmsghdr *n,
         |            ^~~~~~~~~~~~~~
>> net/sched/cls_api.c:2534:12: error: invalid storage class for function 'tc_get_tfilter'
    2534 | static int tc_get_tfilter(struct sk_buff *skb, struct nlmsghdr *n,
         |            ^~~~~~~~~~~~~~
>> net/sched/cls_api.c:2666:12: error: invalid storage class for function 'tcf_node_dump'
    2666 | static int tcf_node_dump(struct tcf_proto *tp, void *n, struct tcf_walker *arg)
         |            ^~~~~~~~~~~~~
>> net/sched/cls_api.c:2677:13: error: invalid storage class for function 'tcf_chain_dump'
    2677 | static bool tcf_chain_dump(struct tcf_chain *chain, struct Qdisc *q, u32 parent,
         |             ^~~~~~~~~~~~~~
   net/sched/cls_api.c:2743:12: error: invalid storage class for function 'tc_dump_tfilter'
    2743 | static int tc_dump_tfilter(struct sk_buff *skb, struct netlink_callback *cb)
         |            ^~~~~~~~~~~~~~~
   net/sched/cls_api.c:2847:12: error: invalid storage class for function 'tc_chain_fill_node'
    2847 | static int tc_chain_fill_node(const struct tcf_proto_ops *tmplt_ops,
         |            ^~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:2903:12: error: invalid storage class for function 'tc_chain_notify'
    2903 | static int tc_chain_notify(struct tcf_chain *chain, struct sk_buff *oskb,
         |            ^~~~~~~~~~~~~~~
   net/sched/cls_api.c:2933:12: error: invalid storage class for function 'tc_chain_notify_delete'
    2933 | static int tc_chain_notify_delete(const struct tcf_proto_ops *tmplt_ops,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:2958:12: error: invalid storage class for function 'tc_chain_tmplt_add'
    2958 | static int tc_chain_tmplt_add(struct tcf_chain *chain, struct net *net,
         |            ^~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:2994:13: error: invalid storage class for function 'tc_chain_tmplt_del'
    2994 | static void tc_chain_tmplt_del(const struct tcf_proto_ops *tmplt_ops,
         |             ^~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3007:12: error: invalid storage class for function 'tc_ctl_chain'
    3007 | static int tc_ctl_chain(struct sk_buff *skb, struct nlmsghdr *n,
         |            ^~~~~~~~~~~~
   net/sched/cls_api.c:3139:12: error: invalid storage class for function 'tc_dump_chain'
    3139 | static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
         |            ^~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from arch/s390/include/asm/timex.h:13,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/sched/cls_api.c:12:
   net/sched/cls_api.c:3271:15: error: non-static declaration of 'tcf_exts_init_ex' follows static declaration
    3271 | EXPORT_SYMBOL(tcf_exts_init_ex);
         |               ^~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3271:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3271 | EXPORT_SYMBOL(tcf_exts_init_ex);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3232:5: note: previous definition of 'tcf_exts_init_ex' with type 'int(struct tcf_exts *, struct net *, int,  int,  struct tcf_proto *, u32,  bool)' {aka 'int(struct tcf_exts *, struct net *, int,  int,  struct tcf_proto *, unsigned int,  _Bool)'}
    3232 | int tcf_exts_init_ex(struct tcf_exts *exts, struct net *net, int action,
         |     ^~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3285:15: error: non-static declaration of 'tcf_exts_destroy' follows static declaration
    3285 | EXPORT_SYMBOL(tcf_exts_destroy);
         |               ^~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3285:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3285 | EXPORT_SYMBOL(tcf_exts_destroy);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3273:6: note: previous definition of 'tcf_exts_destroy' with type 'void(struct tcf_exts *)'
    3273 | void tcf_exts_destroy(struct tcf_exts *exts)
         |      ^~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3340:15: error: non-static declaration of 'tcf_exts_validate_ex' follows static declaration
    3340 | EXPORT_SYMBOL(tcf_exts_validate_ex);
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3340:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3340 | EXPORT_SYMBOL(tcf_exts_validate_ex);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3287:5: note: previous definition of 'tcf_exts_validate_ex' with type 'int(struct net *, struct tcf_proto *, struct nlattr **, struct nlattr *, struct tcf_exts *, u32,  u32,  struct netlink_ext_ack *)' {aka 'int(struct net *, struct tcf_proto *, struct nlattr **, struct nlattr *, struct tcf_exts *, unsigned int,  unsigned int,  struct netlink_ext_ack *)'}
    3287 | int tcf_exts_validate_ex(struct net *net, struct tcf_proto *tp, struct nlattr **tb,
         |     ^~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3349:15: error: non-static declaration of 'tcf_exts_validate' follows static declaration
    3349 | EXPORT_SYMBOL(tcf_exts_validate);
         |               ^~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3349:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3349 | EXPORT_SYMBOL(tcf_exts_validate);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3342:5: note: previous definition of 'tcf_exts_validate' with type 'int(struct net *, struct tcf_proto *, struct nlattr **, struct nlattr *, struct tcf_exts *, u32,  struct netlink_ext_ack *)' {aka 'int(struct net *, struct tcf_proto *, struct nlattr **, struct nlattr *, struct tcf_exts *, unsigned int,  struct netlink_ext_ack *)'}
    3342 | int tcf_exts_validate(struct net *net, struct tcf_proto *tp, struct nlattr **tb,
         |     ^~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3360:15: error: non-static declaration of 'tcf_exts_change' follows static declaration
    3360 | EXPORT_SYMBOL(tcf_exts_change);
         |               ^~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \


vim +1776 net/sched/cls_api.c

  1746	
  1747	int tcf_classify(struct sk_buff *skb,
  1748			 const struct tcf_block *block,
  1749			 const struct tcf_proto *tp,
  1750			 struct tcf_result *res, bool compat_mode)
  1751	{
  1752	#if !IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
  1753		u32 last_executed_chain = 0;
  1754	
  1755		return __tcf_classify(skb, tp, tp, res, compat_mode, NULL, 0,
  1756				      &last_executed_chain);
  1757	#else
  1758		u32 last_executed_chain = tp ? tp->chain->index : 0;
  1759		struct tcf_exts_miss_cookie_node *n = NULL;
  1760		const struct tcf_proto *orig_tp = tp;
  1761		struct tc_skb_ext *ext;
  1762		int act_index = 0;
  1763		int ret;
  1764	
  1765		if (block) {
  1766			ext = skb_ext_find(skb, TC_SKB_EXT);
  1767	
  1768			if (ext && (ext->chain || ext->act_miss)) {
  1769				struct tcf_chain *fchain;
  1770				u32 chain;
  1771	
  1772				if (ext->act_miss) {
  1773					n = tcf_exts_miss_cookie_lookup(ext->act_miss_cookie,
  1774									&act_index);
  1775					if (!n) {
> 1776						u32 drop_reason = SKB_TC_EXT_COOKIE_NOTFOUND;
  1777	
  1778						tcf_set_drop_reason(res, drop_reason);
  1779						return TC_ACT_SHOT;
  1780	
  1781					chain = n->chain_index;
  1782				} else {
  1783					chain = ext->chain;
  1784				}
  1785	
  1786				fchain = tcf_chain_lookup_rcu(block, chain);
  1787				if (!fchain) {
  1788					u32 drop_reason = SKB_DROP_REASON_TC_CHAIN_NOTFOUND;
  1789	
  1790					tcf_set_drop_reason(res, drop_reason);
  1791	
  1792					return TC_ACT_SHOT;
  1793				}
  1794	
  1795				/* Consume, so cloned/redirect skbs won't inherit ext */
  1796				skb_ext_del(skb, TC_SKB_EXT);
  1797	
  1798				tp = rcu_dereference_bh(fchain->filter_chain);
  1799				last_executed_chain = fchain->index;
  1800			}
  1801		}
  1802	
  1803		ret = __tcf_classify(skb, tp, orig_tp, res, compat_mode, n, act_index,
  1804				     &last_executed_chain);
  1805	
  1806		if (tc_skb_ext_tc_enabled()) {
  1807			/* If we missed on some chain */
  1808			if (ret == TC_ACT_UNSPEC && last_executed_chain) {
  1809				struct tc_skb_cb *cb = tc_skb_cb(skb);
  1810	
  1811				ext = tc_skb_ext_alloc(skb);
  1812				if (WARN_ON_ONCE(!ext)) {
> 1813					u32 drop_reason = SKB_TC_ALLOC_SKB_EXT;
  1814	
  1815					tcf_set_drop_reason(res, drop_reason);
  1816					return TC_ACT_SHOT;
  1817				}
  1818				ext->chain = last_executed_chain;
  1819				ext->mru = cb->mru;
  1820				ext->post_ct = cb->post_ct;
  1821				ext->post_ct_snat = cb->post_ct_snat;
  1822				ext->post_ct_dnat = cb->post_ct_dnat;
  1823				ext->zone = cb->zone;
  1824			}
  1825		}
  1826	
  1827		return ret;
  1828	#endif
  1829	}
  1830	EXPORT_SYMBOL(tcf_classify);
  1831	
  1832	struct tcf_chain_info {
  1833		struct tcf_proto __rcu **pprev;
  1834		struct tcf_proto __rcu *next;
  1835	};
  1836	
> 1837	static struct tcf_proto *tcf_chain_tp_prev(struct tcf_chain *chain,
  1838						   struct tcf_chain_info *chain_info)
  1839	{
  1840		return tcf_chain_dereference(*chain_info->pprev, chain);
  1841	}
  1842	
> 1843	static int tcf_chain_tp_insert(struct tcf_chain *chain,
  1844				       struct tcf_chain_info *chain_info,
  1845				       struct tcf_proto *tp)
  1846	{
  1847		if (chain->flushing)
  1848			return -EAGAIN;
  1849	
  1850		RCU_INIT_POINTER(tp->next, tcf_chain_tp_prev(chain, chain_info));
  1851		if (*chain_info->pprev == chain->filter_chain)
  1852			tcf_chain0_head_change(chain, tp);
  1853		tcf_proto_get(tp);
  1854		rcu_assign_pointer(*chain_info->pprev, tp);
  1855	
  1856		return 0;
  1857	}
  1858	
> 1859	static void tcf_chain_tp_remove(struct tcf_chain *chain,
  1860					struct tcf_chain_info *chain_info,
  1861					struct tcf_proto *tp)
  1862	{
  1863		struct tcf_proto *next = tcf_chain_dereference(chain_info->next, chain);
  1864	
  1865		tcf_proto_mark_delete(tp);
  1866		if (tp == chain->filter_chain)
  1867			tcf_chain0_head_change(chain, next);
  1868		RCU_INIT_POINTER(*chain_info->pprev, next);
  1869	}
  1870	
> 1871	static struct tcf_proto *tcf_chain_tp_find(struct tcf_chain *chain,
  1872						   struct tcf_chain_info *chain_info,
  1873						   u32 protocol, u32 prio,
  1874						   bool prio_allocate);
  1875	
  1876	/* Try to insert new proto.
  1877	 * If proto with specified priority already exists, free new proto
  1878	 * and return existing one.
  1879	 */
  1880	
> 1881	static struct tcf_proto *tcf_chain_tp_insert_unique(struct tcf_chain *chain,
  1882							    struct tcf_proto *tp_new,
  1883							    u32 protocol, u32 prio,
  1884							    bool rtnl_held)
  1885	{
  1886		struct tcf_chain_info chain_info;
  1887		struct tcf_proto *tp;
  1888		int err = 0;
  1889	
  1890		mutex_lock(&chain->filter_chain_lock);
  1891	
  1892		if (tcf_proto_exists_destroying(chain, tp_new)) {
  1893			mutex_unlock(&chain->filter_chain_lock);
  1894			tcf_proto_destroy(tp_new, rtnl_held, false, NULL);
  1895			return ERR_PTR(-EAGAIN);
  1896		}
  1897	
> 1898		tp = tcf_chain_tp_find(chain, &chain_info,
  1899				       protocol, prio, false);
  1900		if (!tp)
  1901			err = tcf_chain_tp_insert(chain, &chain_info, tp_new);
  1902		mutex_unlock(&chain->filter_chain_lock);
  1903	
  1904		if (tp) {
  1905			tcf_proto_destroy(tp_new, rtnl_held, false, NULL);
  1906			tp_new = tp;
  1907		} else if (err) {
  1908			tcf_proto_destroy(tp_new, rtnl_held, false, NULL);
  1909			tp_new = ERR_PTR(err);
  1910		}
  1911	
  1912		return tp_new;
  1913	}
  1914	
> 1915	static void tcf_chain_tp_delete_empty(struct tcf_chain *chain,
  1916					      struct tcf_proto *tp, bool rtnl_held,
  1917					      struct netlink_ext_ack *extack)
  1918	{
  1919		struct tcf_chain_info chain_info;
  1920		struct tcf_proto *tp_iter;
  1921		struct tcf_proto **pprev;
  1922		struct tcf_proto *next;
  1923	
  1924		mutex_lock(&chain->filter_chain_lock);
  1925	
  1926		/* Atomically find and remove tp from chain. */
  1927		for (pprev = &chain->filter_chain;
  1928		     (tp_iter = tcf_chain_dereference(*pprev, chain));
  1929		     pprev = &tp_iter->next) {
  1930			if (tp_iter == tp) {
  1931				chain_info.pprev = pprev;
  1932				chain_info.next = tp_iter->next;
  1933				WARN_ON(tp_iter->deleting);
  1934				break;
  1935			}
  1936		}
  1937		/* Verify that tp still exists and no new filters were inserted
  1938		 * concurrently.
  1939		 * Mark tp for deletion if it is empty.
  1940		 */
  1941		if (!tp_iter || !tcf_proto_check_delete(tp)) {
  1942			mutex_unlock(&chain->filter_chain_lock);
  1943			return;
  1944		}
  1945	
  1946		tcf_proto_signal_destroying(chain, tp);
  1947		next = tcf_chain_dereference(chain_info.next, chain);
  1948		if (tp == chain->filter_chain)
  1949			tcf_chain0_head_change(chain, next);
  1950		RCU_INIT_POINTER(*chain_info.pprev, next);
  1951		mutex_unlock(&chain->filter_chain_lock);
  1952	
  1953		tcf_proto_put(tp, rtnl_held, extack);
  1954	}
  1955	
> 1956	static struct tcf_proto *tcf_chain_tp_find(struct tcf_chain *chain,
  1957						   struct tcf_chain_info *chain_info,
  1958						   u32 protocol, u32 prio,
  1959						   bool prio_allocate)
  1960	{
  1961		struct tcf_proto **pprev;
  1962		struct tcf_proto *tp;
  1963	
  1964		/* Check the chain for existence of proto-tcf with this priority */
  1965		for (pprev = &chain->filter_chain;
  1966		     (tp = tcf_chain_dereference(*pprev, chain));
  1967		     pprev = &tp->next) {
  1968			if (tp->prio >= prio) {
  1969				if (tp->prio == prio) {
  1970					if (prio_allocate ||
  1971					    (tp->protocol != protocol && protocol))
  1972						return ERR_PTR(-EINVAL);
  1973				} else {
  1974					tp = NULL;
  1975				}
  1976				break;
  1977			}
  1978		}
  1979		chain_info->pprev = pprev;
  1980		if (tp) {
  1981			chain_info->next = tp->next;
  1982			tcf_proto_get(tp);
  1983		} else {
  1984			chain_info->next = NULL;
  1985		}
  1986		return tp;
  1987	}
  1988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
