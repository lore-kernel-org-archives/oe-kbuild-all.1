Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB9E11CB7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUwlHQXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698070635; x=1729606635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AcDcENftsmHH23+A28dS4jZYOEikejnP6RBX7v+vbgk=;
  b=CUwlHQXOVR/ZCphD+qFDqJxSxJxYoXKIMOvuG4NLUYpr7hkqvou2msWn
   hYClnaQLpZviJ9KaHDAeUsfOXrsUl06BoTmZ0OzMlQNvpQeD6DVNtMJWI
   Cg5hIOUM5ynFqDGz3ulOiXzmgJlraUsh49KMZqQMabw0xTy2DRRcb/Us3
   3khjgQuQevGc9z235IgU6GpaWRE0UT/hCiKL33OB0hpYd/KFp+hCuTiFt
   9x/XGJRAjDMjUTZ8d42UDH4xbsejrOOp4ItPAY4IK3EG4UGL1PCuqLUZy
   Ed+/3SzK2/Tmr2cwgM87gehX1BzpZanw2f693bc25lbYhal1/o/TuFOsU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="389695109"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="389695109"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 07:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="874712511"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="874712511"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2023 07:16:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quvjf-0006y9-2H;
	Mon, 23 Oct 2023 14:16:51 +0000
Date: Mon, 23 Oct 2023 22:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Nogueira <victor@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v2 1/1] net: sched: Disambiguate verdict
 from return code
Message-ID: <202310232151.gWaJgPWd-lkp@intel.com>
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
[also build test ERROR on linus/master v6.6-rc7]
[cannot apply to net-next/main next-20231023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Victor-Nogueira/net-sched-Disambiguate-verdict-from-return-code/20231017-134937
base:   net/main
patch link:    https://lore.kernel.org/r/20231014180921.833820-1-victor%40mojatatu.com
patch subject: [PATCH RFC net-next v2 1/1] net: sched: Disambiguate verdict from return code
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231023/202310232151.gWaJgPWd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310232151.gWaJgPWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310232151.gWaJgPWd-lkp@intel.com/

All errors (new ones prefixed by >>):

         |              ^~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3854:12: error: invalid storage class for function 'tcf_qevent_parse_block_index'
    3854 | static int tcf_qevent_parse_block_index(struct nlattr *block_index_attr,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:3889:15: error: non-static declaration of 'tcf_qevent_init' follows static declaration
    3889 | EXPORT_SYMBOL(tcf_qevent_init);
         |               ^~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/sched/cls_api.c:3889:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3889 | EXPORT_SYMBOL(tcf_qevent_init);
         | ^~~~~~~~~~~~~
   net/sched/cls_api.c:3867:5: note: previous definition of 'tcf_qevent_init' with type 'int(struct tcf_qevent *, struct Qdisc *, enum flow_block_binder_type,  struct nlattr *, struct netlink_ext_ack *)'
    3867 | int tcf_qevent_init(struct tcf_qevent *qe, struct Qdisc *sch,
         |     ^~~~~~~~~~~~~~~
   net/sched/cls_api.c:3896:15: error: non-static declaration of 'tcf_qevent_destroy' follows static declaration
    3896 | EXPORT_SYMBOL(tcf_qevent_destroy);
         |               ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
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
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
>> include/linux/compiler.h:215:60: error: initializer element is not constant
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                                            ^
   include/linux/compiler.h:217:9: note: in expansion of macro '___ADDRESSABLE'
     217 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__ADDRESSABLE'
     256 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:261:9: note: in expansion of macro '__define_initcall_stub'
     261 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:274:9: note: in expansion of macro '____define_initcall'
     274 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
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
   net/sched/cls_api.c:592:12: warning: 'tc_chain_notify' used but never defined
     592 | static int tc_chain_notify(struct tcf_chain *chain, struct sk_buff *oskb,
         |            ^~~~~~~~~~~~~~~
   net/sched/cls_api.c:648:13: warning: 'tc_chain_tmplt_del' used but never defined
     648 | static void tc_chain_tmplt_del(const struct tcf_proto_ops *tmplt_ops,
         |             ^~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:650:12: warning: 'tc_chain_notify_delete' used but never defined
     650 | static int tc_chain_notify_delete(const struct tcf_proto_ops *tmplt_ops,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c: In function 'tcf_classify':
   net/sched/cls_api.c:4019: error: control reaches end of non-void function [-Werror=return-type]
   net/sched/cls_api.c: At top level:
   net/sched/cls_api.c:2994:13: warning: 'tc_chain_tmplt_del' defined but not used [-Wunused-function]
    2994 | static void tc_chain_tmplt_del(const struct tcf_proto_ops *tmplt_ops,
         |             ^~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:2933:12: warning: 'tc_chain_notify_delete' defined but not used [-Wunused-function]
    2933 | static int tc_chain_notify_delete(const struct tcf_proto_ops *tmplt_ops,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +215 include/linux/compiler.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  206  
7290d58095712a Ard Biesheuvel 2018-08-21  207  /*
7290d58095712a Ard Biesheuvel 2018-08-21  208   * Force the compiler to emit 'sym' as a symbol, so that we can reference
7290d58095712a Ard Biesheuvel 2018-08-21  209   * it from inline assembler. Necessary in case 'sym' could be inlined
7290d58095712a Ard Biesheuvel 2018-08-21  210   * otherwise, or eliminated entirely due to lack of references that are
7290d58095712a Ard Biesheuvel 2018-08-21  211   * visible to the compiler.
7290d58095712a Ard Biesheuvel 2018-08-21  212   */
92efda8eb15295 Sami Tolvanen  2022-09-08  213  #define ___ADDRESSABLE(sym, __attrs) \
92efda8eb15295 Sami Tolvanen  2022-09-08  214  	static void * __used __attrs \
563a02b0c9704f Josh Poimboeuf 2020-08-18 @215  		__UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
92efda8eb15295 Sami Tolvanen  2022-09-08  216  #define __ADDRESSABLE(sym) \
92efda8eb15295 Sami Tolvanen  2022-09-08  217  	___ADDRESSABLE(sym, __section(".discard.addressable"))
7290d58095712a Ard Biesheuvel 2018-08-21  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
