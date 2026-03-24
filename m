Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6247E384222
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 02:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319141; cv=none; b=G3v4p/38J6OanMPPsGzKxvOWPFSGh7SV9gZ4qlr0myuF6VfT4kiJj6JYeNFkhUOU7Hn1bdRggzi/DzeQ2cQDnlfBRtFipfBHqA/KS8vHmHDRc++yUfDj6dBRJi9LbRQ6HJDSCVY6YRfTwCFXbG3fE26wHZsqrrxQJfCWMi5mP0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319141; c=relaxed/simple;
	bh=snPllhfD8YIOdQCOSiPcMHZMzAxVMvanLdRpD7LiZfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Al0JANdpsq8SWEKeH1plsEG10ViO/iGU0f8k1emDIist8thnfNUAlZrV86J9H44jcdlBw04cbBhn8pwS5qgl39O3wa73oEYNOH0l8bkImxrRppwfPzisPsbPE9YX792mus1YjGpaQY/ccZ2smmr+CjTLzGjS9WnnZ/ISGTJG+NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPz+aYpA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPz+aYpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774319139; x=1805855139;
  h=date:from:to:cc:subject:message-id;
  bh=snPllhfD8YIOdQCOSiPcMHZMzAxVMvanLdRpD7LiZfQ=;
  b=CPz+aYpA8YmuIJabbKGS69sbHkYW1hXlFShWdiJajfVEw7XoJVGkx8ht
   bOUU9adqWOw/oIw7BMOjSrV3He37nLnJz1fJbzVM7VrPVopiWX3SI+UTZ
   USYl5iX1N4URpBguW/6KWgjPzMd3PxD9jD4tieTY1G++rdITzeCGvgT04
   WICnNtQ4emyQORLUXV+s1NnKLnUL4QoTgVTl5LFx8RYi7aU/51LK4mlut
   OBxd3UdJTAQAY4CyECiIRoZ/0AMP5y2xKQYcqMJ/N6brDl/alyn5UAUMJ
   D0W+6tiDRdBAT+bdrS3znQ8NvjFbUH/B5YrUZ0LayrkDTvTUD6798mJew
   Q==;
X-CSE-ConnectionGUID: /vTizkaTSWWstB5MxHwQrA==
X-CSE-MsgGUID: xQoN/1URQfiC6wf+73C++Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100783793"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100783793"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 19:25:37 -0700
X-CSE-ConnectionGUID: TzcWXysAQ9KlVr+v/YwkJg==
X-CSE-MsgGUID: WFB30Mw/QaGeYFgJHzReoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223430155"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2026 19:25:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4rSW-000000003aX-1zru;
	Tue, 24 Mar 2026 02:25:32 +0000
Date: Tue, 24 Mar 2026 10:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3]
 include/linux/tracepoint.h:344:27: error:
 '__tracepoint_android_rvh_blk_mq_has_request' undeclared here (not in a
 function); did you mean 'trace_android_rvh_blk_mq_has_request'?
Message-ID: <202603241056.qSTwjPvz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: f7f28e6be255caed90a67df47625ba2296183ece [3/3] ANDROID: block: Introduce the android_rvh_blk_mq_has_request() vendor hook
config: i386-buildonly-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241056.qSTwjPvz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241056.qSTwjPvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241056.qSTwjPvz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from block/blk-mq.c:8:
>> include/linux/tracepoint.h:344:27: error: '__tracepoint_android_rvh_blk_mq_has_request' undeclared here (not in a function); did you mean 'trace_android_rvh_blk_mq_has_request'?
     344 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~
   include/linux/export.h:80:23: note: in definition of macro '__EXPORT_SYMBOL'
      80 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:93:41: note: in expansion of macro '_EXPORT_SYMBOL'
      93 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:344:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     344 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |         ^~~~~~~~~~~~~~~~~
   block/blk-mq.c:3573:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
    3573 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint.h:345:27: error: '__traceiter_android_rvh_blk_mq_has_request' undeclared here (not in a function); did you mean '__tracepoint_android_rvh_blk_mq_has_request'?
     345 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:80:23: note: in definition of macro '__EXPORT_SYMBOL'
      80 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:93:41: note: in expansion of macro '_EXPORT_SYMBOL'
      93 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:345:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     345 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   block/blk-mq.c:3573:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
    3573 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:9:41: error: '__SCK__tp_func_android_rvh_blk_mq_has_request' undeclared here (not in a function); did you mean '__tracepoint_android_rvh_blk_mq_has_request'?
       9 | #define STATIC_CALL_KEY_PREFIX          __SCK__
         |                                         ^~~~~~~
   include/linux/export.h:80:23: note: in definition of macro '__EXPORT_SYMBOL'
      80 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:93:41: note: in expansion of macro '_EXPORT_SYMBOL'
      93 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:277:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     277 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:88:22: note: in expansion of macro '___PASTE'
      88 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:12:41: note: in expansion of macro '__PASTE'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:12:49: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:277:27: note: in expansion of macro 'STATIC_CALL_KEY'
     277 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:346:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     346 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:3573:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
    3573 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: '__SCT__tp_func_android_rvh_blk_mq_has_request' undeclared here (not in a function); did you mean '__SCK__tp_func_android_rvh_blk_mq_has_request'?
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:80:23: note: in definition of macro '__EXPORT_SYMBOL'
      80 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:93:41: note: in expansion of macro '_EXPORT_SYMBOL'
      93 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:278:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:88:22: note: in expansion of macro '___PASTE'
      88 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:278:27: note: in expansion of macro 'STATIC_CALL_TRAMP'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:346:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     346 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:3573:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
    3573 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +344 include/linux/tracepoint.h

7ece55a4a3a04ab Josh Triplett             2012-09-04  239  
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  240  /*
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  241   * Make sure the alignment of the structure in the __tracepoints section will
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  242   * not add unwanted padding between the beginning of the section and the
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  243   * structure. Force alignment to the same alignment as the section start.
3a630178fd5f30c Dave Hansen               2014-08-07  244   *
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  245)  * When lockdep is enabled, we make sure to always test if RCU is
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  246)  * "watching" regardless if the tracepoint is enabled or not. Tracepoints
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  247)  * require RCU to be active, and it should always warn at the tracepoint
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  248)  * site if it is not watching, as it will need to be active when the
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  249)  * tracepoint is enabled.
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  250   */
1746fd4416ed551 Steven Rostedt (VMware    2021-02-08  251) #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
de394e7568ce2cd peterz@infradead.org      2020-09-08  252  	extern int __traceiter_##name(data_proto);			\
de394e7568ce2cd peterz@infradead.org      2020-09-08  253  	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  254  	extern struct tracepoint __tracepoint_##name;			\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  255  	static inline void trace_##name(proto)				\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  256  	{								\
c5905afb0ee6550 Ingo Molnar               2012-02-24  257  		if (static_key_false(&__tracepoint_##name.key))		\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  258) 			__DO_TRACE(name,				\
1746fd4416ed551 Steven Rostedt (VMware    2021-02-08  259) 				TP_ARGS(args),				\
d54b6eeb553c89e Steven Rostedt (VMware    2017-04-07  260) 				TP_CONDITION(cond), 0);			\
a05d59a5673339e Steven Rostedt (Red Hat   2015-02-06  261) 		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  262) 			WARN_ON_ONCE(!rcu_is_watching());		\
3a630178fd5f30c Dave Hansen               2014-08-07  263  		}							\
2fbb90db1b8fcc7 Steven Rostedt            2012-02-07  264  	}								\
7ece55a4a3a04ab Josh Triplett             2012-09-04  265  	__DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),		\
1746fd4416ed551 Steven Rostedt (VMware    2021-02-08  266) 			    PARAMS(cond))				\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  267  	static inline int						\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  268  	register_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  269  	{								\
de7b2973903c6cc Mathieu Desnoyers         2014-04-08  270  		return tracepoint_probe_register(&__tracepoint_##name,	\
de7b2973903c6cc Mathieu Desnoyers         2014-04-08  271  						(void *)probe, data);	\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  272  	}								\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  273  	static inline int						\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  274) 	register_trace_prio_##name(void (*probe)(data_proto), void *data,\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  275) 				   int prio)				\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  276) 	{								\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  277) 		return tracepoint_probe_register_prio(&__tracepoint_##name, \
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  278) 					      (void *)probe, data, prio); \
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  279) 	}								\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  280) 	static inline int						\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  281  	unregister_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  282  	{								\
de7b2973903c6cc Mathieu Desnoyers         2014-04-08  283  		return tracepoint_probe_unregister(&__tracepoint_##name,\
de7b2973903c6cc Mathieu Desnoyers         2014-04-08  284  						(void *)probe, data);	\
53da59aa6dd881f Mathieu Desnoyers         2010-04-30  285  	}								\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  286  	static inline void						\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  287  	check_trace_callback_type_##name(void (*cb)(data_proto))	\
53da59aa6dd881f Mathieu Desnoyers         2010-04-30  288  	{								\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  289) 	}								\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  290) 	static inline bool						\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  291) 	trace_##name##_enabled(void)					\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  292) 	{								\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  293) 		return static_key_false(&__tracepoint_##name.key);	\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  294  	}
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  295  
654986462939cd7 Mathieu Desnoyers         2011-01-26  296  /*
654986462939cd7 Mathieu Desnoyers         2011-01-26  297   * We have no guarantee that gcc and the linker won't up-align the tracepoint
654986462939cd7 Mathieu Desnoyers         2011-01-26  298   * structures, so we create an array of pointers that will be used for iteration
654986462939cd7 Mathieu Desnoyers         2011-01-26  299   * on the tracepoints.
654986462939cd7 Mathieu Desnoyers         2011-01-26  300   */
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  301) #define DEFINE_TRACE_FN(_name, _reg, _unreg, proto, args)		\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  302) 	static const char __tpstrtab_##_name[]				\
33def8498fdde18 Joe Perches               2020-10-21  303  	__section("__tracepoints_strings") = #_name;			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  304) 	extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name);	\
de394e7568ce2cd peterz@infradead.org      2020-09-08  305  	int __traceiter_##_name(void *__data, proto);			\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  306) 	void __probestub_##_name(void *__data, proto);			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  307) 	struct tracepoint __tracepoint_##_name	__used			\
33def8498fdde18 Joe Perches               2020-10-21  308  	__section("__tracepoints") = {					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  309) 		.name = __tpstrtab_##_name,				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  310) 		.key = STATIC_KEY_INIT_FALSE,				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  311) 		.static_call_key = &STATIC_CALL_KEY(tp_func_##_name),	\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  312) 		.static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
de394e7568ce2cd peterz@infradead.org      2020-09-08  313  		.iterator = &__traceiter_##_name,			\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  314) 		.probestub = &__probestub_##_name,			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  315) 		.regfunc = _reg,					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  316) 		.unregfunc = _unreg,					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  317) 		.funcs = NULL };					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  318) 	__TRACEPOINT_ENTRY(_name);					\
de394e7568ce2cd peterz@infradead.org      2020-09-08  319  	int __traceiter_##_name(void *__data, proto)			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  320) 	{								\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  321) 		struct tracepoint_func *it_func_ptr;			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  322) 		void *it_func;						\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  323) 									\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  324) 		it_func_ptr =						\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  325) 			rcu_dereference_raw((&__tracepoint_##_name)->funcs); \
c8b186a8d54d7e1 Alexey Kardashevskiy      2021-02-02  326  		if (it_func_ptr) {					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  327) 			do {						\
7211f0a25781ace Steven Rostedt (VMware    2021-02-04  328) 				it_func = READ_ONCE((it_func_ptr)->func); \
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  329) 				__data = (it_func_ptr)->data;		\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  330) 				((void(*)(void *, proto))(it_func))(__data, args); \
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  331) 			} while ((++it_func_ptr)->func);		\
c8b186a8d54d7e1 Alexey Kardashevskiy      2021-02-02  332  		}							\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  333) 		return 0;						\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  334) 	}								\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  335) 	void __probestub_##_name(void *__data, proto)			\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  336) 	{								\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  337) 	}								\
de394e7568ce2cd peterz@infradead.org      2020-09-08  338  	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
97419875865859f Josh Stone                2009-08-24  339  
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  340) #define DEFINE_TRACE(name, proto, args)		\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  341) 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  342  
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  343  #define EXPORT_TRACEPOINT_SYMBOL_GPL(name)				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18 @344) 	EXPORT_SYMBOL_GPL(__tracepoint_##name);				\
de394e7568ce2cd peterz@infradead.org      2020-09-08 @345  	EXPORT_SYMBOL_GPL(__traceiter_##name);				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  346) 	EXPORT_STATIC_CALL_GPL(tp_func_##name)
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  347  #define EXPORT_TRACEPOINT_SYMBOL(name)					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  348) 	EXPORT_SYMBOL(__tracepoint_##name);				\
de394e7568ce2cd peterz@infradead.org      2020-09-08  349  	EXPORT_SYMBOL(__traceiter_##name);				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  350) 	EXPORT_STATIC_CALL(tp_func_##name)
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  351) 
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  352  

:::::: The code at line 344 was first introduced by commit
:::::: d25e37d89dd2f41d7acae0429039d2f0ae8b4a07 tracepoint: Optimize using static_call()

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
