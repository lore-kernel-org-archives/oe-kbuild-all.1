Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0C342C06
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqViVKQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697547792; x=1729083792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J3Onf22mBwvfx7/uEoW5eAfsnyAtyIPoCF1CYHMxaAw=;
  b=JqViVKQh3tq5Tkn2HbOHJqVQDjLjNQqRU8Tn5/A4/0B9bvD6hmfkHqY+
   2DL+632SVTkUZhZLNh44aL5p5u+6rynByWtFrTVboGaF9mIYLrFfPs4uM
   Wqh1pT+Oaj1tQb18BCbf8QmsqX8pkpSn9/zBA4GlsFb08WWHKKOjnUkEH
   4BqOnF07Y5cQRFOwrwvXYC9sEGbhc4HHF6UCryEr6sWaBEM/WqDFLU130
   CgLuJnjP1AVOeiX9Ea7wmzfbrHeaBk+Kqa9znd1fEvMseLVcIzUC0MVeS
   Lf7JX/ExRyKbhWrGAdQZ0gTVtVzR9mzpfwBS+yM+KRzbZYfGUKm0vpbel
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472000552"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="472000552"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 06:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="705991417"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="705991417"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2023 06:03:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsjj1-0009cJ-2a;
	Tue, 17 Oct 2023 13:03:07 +0000
Date: Tue, 17 Oct 2023 21:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Nogueira <victor@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v2 1/1] net: sched: Disambiguate verdict
 from return code
Message-ID: <202310172017.0AiVu6E9-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on linus/master v6.6-rc6]
[cannot apply to net-next/main next-20231017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Victor-Nogueira/net-sched-Disambiguate-verdict-from-return-code/20231017-134937
base:   net/main
patch link:    https://lore.kernel.org/r/20231014180921.833820-1-victor%40mojatatu.com
patch subject: [PATCH RFC net-next v2 1/1] net: sched: Disambiguate verdict from return code
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310172017.0AiVu6E9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172017.0AiVu6E9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172017.0AiVu6E9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/cls_api.c: In function 'tcf_classify':
   net/sched/cls_api.c:1776:59: error: 'SKB_TC_EXT_COOKIE_NOTFOUND' undeclared (first use in this function); did you mean 'SKB_DROP_REASON_TC_EXT_COOKIE_NOTFOUND'?
    1776 |                                         u32 drop_reason = SKB_TC_EXT_COOKIE_NOTFOUND;
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                           SKB_DROP_REASON_TC_EXT_COOKIE_NOTFOUND
   net/sched/cls_api.c:1776:59: note: each undeclared identifier is reported only once for each function it appears in
   net/sched/cls_api.c:1813:51: error: 'SKB_TC_ALLOC_SKB_EXT' undeclared (first use in this function)
    1813 |                                 u32 drop_reason = SKB_TC_ALLOC_SKB_EXT;
         |                                                   ^~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1837:26: error: invalid storage class for function 'tcf_chain_tp_prev'
    1837 | static struct tcf_proto *tcf_chain_tp_prev(struct tcf_chain *chain,
         |                          ^~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1843:12: error: invalid storage class for function 'tcf_chain_tp_insert'
    1843 | static int tcf_chain_tp_insert(struct tcf_chain *chain,
         |            ^~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1859:13: error: invalid storage class for function 'tcf_chain_tp_remove'
    1859 | static void tcf_chain_tp_remove(struct tcf_chain *chain,
         |             ^~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1871:26: error: invalid storage class for function 'tcf_chain_tp_find'
    1871 | static struct tcf_proto *tcf_chain_tp_find(struct tcf_chain *chain,
         |                          ^~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1881:26: error: invalid storage class for function 'tcf_chain_tp_insert_unique'
    1881 | static struct tcf_proto *tcf_chain_tp_insert_unique(struct tcf_chain *chain,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c: In function 'tcf_chain_tp_insert_unique':
   net/sched/cls_api.c:1898:14: error: implicit declaration of function 'tcf_chain_tp_find'; did you mean 'tcf_chain_tp_prev'? [-Werror=implicit-function-declaration]
    1898 |         tp = tcf_chain_tp_find(chain, &chain_info,
         |              ^~~~~~~~~~~~~~~~~
         |              tcf_chain_tp_prev
>> net/sched/cls_api.c:1898:12: warning: assignment to 'struct tcf_proto *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1898 |         tp = tcf_chain_tp_find(chain, &chain_info,
         |            ^
   net/sched/cls_api.c: In function 'tcf_classify':
   net/sched/cls_api.c:1915:13: error: invalid storage class for function 'tcf_chain_tp_delete_empty'
    1915 | static void tcf_chain_tp_delete_empty(struct tcf_chain *chain,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1956:26: error: invalid storage class for function 'tcf_chain_tp_find'
    1956 | static struct tcf_proto *tcf_chain_tp_find(struct tcf_chain *chain,
         |                          ^~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1989:12: error: invalid storage class for function 'tcf_fill_node'
    1989 | static int tcf_fill_node(struct net *net, struct sk_buff *skb,
         |            ^~~~~~~~~~~~~
   net/sched/cls_api.c:2050:12: error: invalid storage class for function 'tfilter_notify'
    2050 | static int tfilter_notify(struct net *net, struct sk_buff *oskb,
         |            ^~~~~~~~~~~~~~
   net/sched/cls_api.c:2079:12: error: invalid storage class for function 'tfilter_del_notify'
    2079 | static int tfilter_del_notify(struct net *net, struct sk_buff *oskb,
         |            ^~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:2118:13: error: invalid storage class for function 'tfilter_notify_chain'
    2118 | static void tfilter_notify_chain(struct net *net, struct sk_buff *oskb,
         |             ^~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:2132:13: error: invalid storage class for function 'tfilter_put'
    2132 | static void tfilter_put(struct tcf_proto *tp, void *fh)
         |             ^~~~~~~~~~~
   net/sched/cls_api.c:2138:13: error: invalid storage class for function 'is_qdisc_ingress'
    2138 | static bool is_qdisc_ingress(__u32 classid)
         |             ^~~~~~~~~~~~~~~~
   net/sched/cls_api.c:2143:12: error: invalid storage class for function 'tc_new_tfilter'
    2143 | static int tc_new_tfilter(struct sk_buff *skb, struct nlmsghdr *n,
         |            ^~~~~~~~~~~~~~
   net/sched/cls_api.c:2377:12: error: invalid storage class for function 'tc_del_tfilter'
    2377 | static int tc_del_tfilter(struct sk_buff *skb, struct nlmsghdr *n,
         |            ^~~~~~~~~~~~~~
   net/sched/cls_api.c:2534:12: error: invalid storage class for function 'tc_get_tfilter'
    2534 | static int tc_get_tfilter(struct sk_buff *skb, struct nlmsghdr *n,
         |            ^~~~~~~~~~~~~~
   net/sched/cls_api.c:2666:12: error: invalid storage class for function 'tcf_node_dump'
    2666 | static int tcf_node_dump(struct tcf_proto *tp, void *n, struct tcf_walker *arg)
         |            ^~~~~~~~~~~~~
   net/sched/cls_api.c:2677:13: error: invalid storage class for function 'tcf_chain_dump'
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
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:17,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
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
--
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3896:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3896 | EXPORT_SYMBOL(tcf_qevent_destroy);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3891:6: note: previous definition of 'tcf_qevent_destroy' with type 'void(struct tcf_qevent *, struct Qdisc *)'
    3891 | void tcf_qevent_destroy(struct tcf_qevent *qe, struct Qdisc *sch)
         |      ^~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3919:15: error: non-static declaration of 'tcf_qevent_validate_change' follows static declaration
    3919 | EXPORT_SYMBOL(tcf_qevent_validate_change);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3919:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3919 | EXPORT_SYMBOL(tcf_qevent_validate_change);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3898:5: note: previous definition of 'tcf_qevent_validate_change' with type 'int(struct tcf_qevent *, struct nlattr *, struct netlink_ext_ack *)'
    3898 | int tcf_qevent_validate_change(struct tcf_qevent *qe, struct nlattr *block_index_attr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3952:15: error: non-static declaration of 'tcf_qevent_handle' follows static declaration
    3952 | EXPORT_SYMBOL(tcf_qevent_handle);
         |               ^~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3952:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3952 | EXPORT_SYMBOL(tcf_qevent_handle);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3921:17: note: previous definition of 'tcf_qevent_handle' with type 'struct sk_buff *(struct tcf_qevent *, struct Qdisc *, struct sk_buff *, struct sk_buff **, int *)'
    3921 | struct sk_buff *tcf_qevent_handle(struct tcf_qevent *qe, struct Qdisc *sch, struct sk_buff *skb,
         |                 ^~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3960:15: error: non-static declaration of 'tcf_qevent_dump' follows static declaration
    3960 | EXPORT_SYMBOL(tcf_qevent_dump);
         |               ^~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3960:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3960 | EXPORT_SYMBOL(tcf_qevent_dump);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3954:5: note: previous definition of 'tcf_qevent_dump' with type 'int(struct sk_buff *, int,  struct tcf_qevent *)'
    3954 | int tcf_qevent_dump(struct sk_buff *skb, int attr_name, struct tcf_qevent *qe)
         |     ^~~~~~~~~~~~~~~
   net/sched/cls_api.c:3963:23: error: invalid storage class for function 'tcf_net_init'
    3963 | static __net_init int tcf_net_init(struct net *net)
         |                       ^~~~~~~~~~~~
   net/sched/cls_api.c:3972:24: error: invalid storage class for function 'tcf_net_exit'
    3972 | static void __net_exit tcf_net_exit(struct net *net)
         |                        ^~~~~~~~~~~~
   net/sched/cls_api.c:3980:17: error: initializer element is not constant
    3980 |         .init = tcf_net_init,
         |                 ^~~~~~~~~~~~
   net/sched/cls_api.c:3980:17: note: (near initialization for 'tcf_net_ops.init')
   net/sched/cls_api.c:3981:17: error: initializer element is not constant
    3981 |         .exit = tcf_net_exit,
         |                 ^~~~~~~~~~~~
   net/sched/cls_api.c:3981:17: note: (near initialization for 'tcf_net_ops.exit')
   net/sched/cls_api.c:3986:19: error: invalid storage class for function 'tc_filter_init'
    3986 | static int __init tc_filter_init(void)
         |                   ^~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79:
   net/sched/cls_api.c:4018:17: error: initializer element is not constant
    4018 | subsys_initcall(tc_filter_init);
         |                 ^~~~~~~~~~~~~~
   include/linux/init.h:270:55: note: in definition of macro '____define_initcall'
     270 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define subsys_initcall(fn)             __define_initcall(fn, 4)
         |                                         ^~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:4018:1: note: in expansion of macro 'subsys_initcall'
    4018 | subsys_initcall(tc_filter_init);
         | ^~~~~~~~~~~~~~~
   net/sched/cls_api.c:4018:1: error: expected declaration or statement at end of input
   net/sched/cls_api.c: At top level:
>> net/sched/cls_api.c:592:12: warning: 'tc_chain_notify' used but never defined
     592 | static int tc_chain_notify(struct tcf_chain *chain, struct sk_buff *oskb,
         |            ^~~~~~~~~~~~~~~
>> net/sched/cls_api.c:648:13: warning: 'tc_chain_tmplt_del' used but never defined
     648 | static void tc_chain_tmplt_del(const struct tcf_proto_ops *tmplt_ops,
         |             ^~~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:650:12: warning: 'tc_chain_notify_delete' used but never defined
     650 | static int tc_chain_notify_delete(const struct tcf_proto_ops *tmplt_ops,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c: In function 'tcf_classify':
   net/sched/cls_api.c:4019: error: control reaches end of non-void function [-Werror=return-type]
   net/sched/cls_api.c: At top level:
>> net/sched/cls_api.c:2994:13: warning: 'tc_chain_tmplt_del' defined but not used [-Wunused-function]
    2994 | static void tc_chain_tmplt_del(const struct tcf_proto_ops *tmplt_ops,
         |             ^~~~~~~~~~~~~~~~~~
>> net/sched/cls_api.c:2933:12: warning: 'tc_chain_notify_delete' defined but not used [-Wunused-function]
    2933 | static int tc_chain_notify_delete(const struct tcf_proto_ops *tmplt_ops,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1898 net/sched/cls_api.c

2190d1d0944f84 Jiri Pirko  2017-05-17  1870  
8b64678e0af8f4 Vlad Buslov 2019-02-11  1871  static struct tcf_proto *tcf_chain_tp_find(struct tcf_chain *chain,
8b64678e0af8f4 Vlad Buslov 2019-02-11  1872  					   struct tcf_chain_info *chain_info,
8b64678e0af8f4 Vlad Buslov 2019-02-11  1873  					   u32 protocol, u32 prio,
8b64678e0af8f4 Vlad Buslov 2019-02-11  1874  					   bool prio_allocate);
8b64678e0af8f4 Vlad Buslov 2019-02-11  1875  
8b64678e0af8f4 Vlad Buslov 2019-02-11  1876  /* Try to insert new proto.
8b64678e0af8f4 Vlad Buslov 2019-02-11  1877   * If proto with specified priority already exists, free new proto
8b64678e0af8f4 Vlad Buslov 2019-02-11  1878   * and return existing one.
8b64678e0af8f4 Vlad Buslov 2019-02-11  1879   */
8b64678e0af8f4 Vlad Buslov 2019-02-11  1880  
8b64678e0af8f4 Vlad Buslov 2019-02-11  1881  static struct tcf_proto *tcf_chain_tp_insert_unique(struct tcf_chain *chain,
8b64678e0af8f4 Vlad Buslov 2019-02-11  1882  						    struct tcf_proto *tp_new,
12db03b65c2b90 Vlad Buslov 2019-02-11  1883  						    u32 protocol, u32 prio,
12db03b65c2b90 Vlad Buslov 2019-02-11  1884  						    bool rtnl_held)
8b64678e0af8f4 Vlad Buslov 2019-02-11  1885  {
8b64678e0af8f4 Vlad Buslov 2019-02-11  1886  	struct tcf_chain_info chain_info;
8b64678e0af8f4 Vlad Buslov 2019-02-11  1887  	struct tcf_proto *tp;
726d061286ceee Vlad Buslov 2019-02-11  1888  	int err = 0;
8b64678e0af8f4 Vlad Buslov 2019-02-11  1889  
8b64678e0af8f4 Vlad Buslov 2019-02-11  1890  	mutex_lock(&chain->filter_chain_lock);
8b64678e0af8f4 Vlad Buslov 2019-02-11  1891  
59eb87cb52c9f7 John Hurley 2019-11-02  1892  	if (tcf_proto_exists_destroying(chain, tp_new)) {
59eb87cb52c9f7 John Hurley 2019-11-02  1893  		mutex_unlock(&chain->filter_chain_lock);
59eb87cb52c9f7 John Hurley 2019-11-02  1894  		tcf_proto_destroy(tp_new, rtnl_held, false, NULL);
59eb87cb52c9f7 John Hurley 2019-11-02  1895  		return ERR_PTR(-EAGAIN);
59eb87cb52c9f7 John Hurley 2019-11-02  1896  	}
59eb87cb52c9f7 John Hurley 2019-11-02  1897  
8b64678e0af8f4 Vlad Buslov 2019-02-11 @1898  	tp = tcf_chain_tp_find(chain, &chain_info,
8b64678e0af8f4 Vlad Buslov 2019-02-11  1899  			       protocol, prio, false);
8b64678e0af8f4 Vlad Buslov 2019-02-11  1900  	if (!tp)
726d061286ceee Vlad Buslov 2019-02-11  1901  		err = tcf_chain_tp_insert(chain, &chain_info, tp_new);
8b64678e0af8f4 Vlad Buslov 2019-02-11  1902  	mutex_unlock(&chain->filter_chain_lock);
8b64678e0af8f4 Vlad Buslov 2019-02-11  1903  
8b64678e0af8f4 Vlad Buslov 2019-02-11  1904  	if (tp) {
59eb87cb52c9f7 John Hurley 2019-11-02  1905  		tcf_proto_destroy(tp_new, rtnl_held, false, NULL);
8b64678e0af8f4 Vlad Buslov 2019-02-11  1906  		tp_new = tp;
726d061286ceee Vlad Buslov 2019-02-11  1907  	} else if (err) {
59eb87cb52c9f7 John Hurley 2019-11-02  1908  		tcf_proto_destroy(tp_new, rtnl_held, false, NULL);
726d061286ceee Vlad Buslov 2019-02-11  1909  		tp_new = ERR_PTR(err);
8b64678e0af8f4 Vlad Buslov 2019-02-11  1910  	}
8b64678e0af8f4 Vlad Buslov 2019-02-11  1911  
8b64678e0af8f4 Vlad Buslov 2019-02-11  1912  	return tp_new;
8b64678e0af8f4 Vlad Buslov 2019-02-11  1913  }
8b64678e0af8f4 Vlad Buslov 2019-02-11  1914  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
