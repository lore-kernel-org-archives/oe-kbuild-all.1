Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B34E33F8AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 05:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784353660; cv=none; b=Ce8Ad1x/Z0i9lL+3o2ZJWgZOYw2cc/WNsqHgVqbRswAKkWA13KTWjJXY3aHD2G/MzicUmYU/BOSw0J1rNpjQmbubP7wpuzah3RH1HtDrKfgUNUwrO5PUYHYGEA+b4hhGXSQW99qqCO9WUMRfy43vedwk/eNginBuRUfKl4WZrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784353660; c=relaxed/simple;
	bh=v/mtkuW+HtFBaD+g+aEuM7xFLXf+bTupeqYBmsrC6RQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jdw45VcLWxozKrqoxAEuVSVbcPJ3Q+4uXa0t/ROtSPG86Hf4N7nRSnOEKxxnJCM2RECN6ob7DqBEH4PpGkEra4ya+Awce0x70xHW/hq4PJ+y2LOYj997SInRmqnmQp9bwAC8uiIgWK7d+XUXAg8Rjia1zHINba1VZXB5xUSQC0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyK+MLZj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyK+MLZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784353658; x=1815889658;
  h=date:from:to:cc:subject:message-id;
  bh=v/mtkuW+HtFBaD+g+aEuM7xFLXf+bTupeqYBmsrC6RQ=;
  b=eyK+MLZjkJjoweTTnroJVzp1S+2YAYG2D8t3r+srNQY+azcndF273CZM
   qw6848day+4EvP0cOWlItHEV3v6QctzTLN5uLk4S6wxSz/emIoCP3rWjt
   ZI489U+48q65AJV1YCyhpqZ7CsPrfWnTK2thi6iW0Gtzwe24FtscrSdJf
   etSPUpSCeMbCKJRr/Dw3X0H57g9evODFT7GLJO3hKinYvpo5wV6sNCTSz
   hA53E3+bSXS0ks9uoIH6nCgyTKSXsUkqo2qRZWXs1M94vhO3P3oZQ9Rly
   QdA9IwkCAOcVFLM5LfsGlUjFmuXB+rqHeEupt3KvxpFwZHQWA1AfK8XiF
   g==;
X-CSE-ConnectionGUID: tFcEUo0qSgigDxBvWYh0NQ==
X-CSE-MsgGUID: h3WvHvGsRw+dDIzo2qUM2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87559331"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="87559331"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 22:47:37 -0700
X-CSE-ConnectionGUID: 9RG20VyBTk6rVx2eb25Rxg==
X-CSE-MsgGUID: AandytRIQHmcb1AHoVqmGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="254330396"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2026 22:47:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkxtd-00000000TTz-2RRV;
	Sat, 18 Jul 2026 05:47:33 +0000
Date: Sat, 18 Jul 2026 13:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 include/linux/tracepoint.h:344:27: error: '__tracepoint_rcu_stall_warning'
 undeclared here (not in a function); did you mean
 '__tracepoint_rcu_utilization'?
Message-ID: <202607181332.gWeMA5PX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinglin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   501d3d8ac1cdbcaa1ffdd48ab2c2f0e34184e79b
commit: 3750795f060bc2a41c082b911955dbe87e6f678d [0/1] ANDROID: rcu: allow hooks into rcu stall warning
config: i386-randconfig-012-20260716 (https://download.01.org/0day-ci/archive/20260718/202607181332.gWeMA5PX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181332.gWeMA5PX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181332.gWeMA5PX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from kernel/rcu/update.c:21:
>> include/linux/tracepoint.h:344:27: error: '__tracepoint_rcu_stall_warning' undeclared here (not in a function); did you mean '__tracepoint_rcu_utilization'?
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
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint.h:345:27: error: '__traceiter_rcu_stall_warning' undeclared here (not in a function); did you mean '__tracepoint_rcu_stall_warning'?
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
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:9:41: error: '__SCK__tp_func_rcu_stall_warning' undeclared here (not in a function); did you mean '__SCK__tp_func_rcu_utilization'?
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
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
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
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: '__SCT__tp_func_rcu_stall_warning' undeclared here (not in a function); did you mean '__SCK__tp_func_rcu_stall_warning'?
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
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
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
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +344 include/linux/tracepoint.h

7ece55a4a3a04a Josh Triplett             2012-09-04  239  
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  240  /*
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  241   * Make sure the alignment of the structure in the __tracepoints section will
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  242   * not add unwanted padding between the beginning of the section and the
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  243   * structure. Force alignment to the same alignment as the section start.
3a630178fd5f30 Dave Hansen               2014-08-07  244   *
c2679254b9c998 Steven Rostedt (Google    2023-03-10  245)  * When lockdep is enabled, we make sure to always test if RCU is
c2679254b9c998 Steven Rostedt (Google    2023-03-10  246)  * "watching" regardless if the tracepoint is enabled or not. Tracepoints
c2679254b9c998 Steven Rostedt (Google    2023-03-10  247)  * require RCU to be active, and it should always warn at the tracepoint
c2679254b9c998 Steven Rostedt (Google    2023-03-10  248)  * site if it is not watching, as it will need to be active when the
c2679254b9c998 Steven Rostedt (Google    2023-03-10  249)  * tracepoint is enabled.
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  250   */
1746fd4416ed55 Steven Rostedt (VMware    2021-02-08  251) #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
de394e7568ce2c peterz@infradead.org      2020-09-08  252  	extern int __traceiter_##name(data_proto);			\
de394e7568ce2c peterz@infradead.org      2020-09-08  253  	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  254  	extern struct tracepoint __tracepoint_##name;			\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  255  	static inline void trace_##name(proto)				\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  256  	{								\
c5905afb0ee655 Ingo Molnar               2012-02-24  257  		if (static_key_false(&__tracepoint_##name.key))		\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  258) 			__DO_TRACE(name,				\
1746fd4416ed55 Steven Rostedt (VMware    2021-02-08  259) 				TP_ARGS(args),				\
d54b6eeb553c89 Steven Rostedt (VMware    2017-04-07  260) 				TP_CONDITION(cond), 0);			\
a05d59a5673339 Steven Rostedt (Red Hat   2015-02-06  261) 		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
c2679254b9c998 Steven Rostedt (Google    2023-03-10  262) 			WARN_ON_ONCE(!rcu_is_watching());		\
3a630178fd5f30 Dave Hansen               2014-08-07  263  		}							\
2fbb90db1b8fcc Steven Rostedt            2012-02-07  264  	}								\
7ece55a4a3a04a Josh Triplett             2012-09-04  265  	__DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),		\
1746fd4416ed55 Steven Rostedt (VMware    2021-02-08  266) 			    PARAMS(cond))				\
38516ab59fbc5b Steven Rostedt            2010-04-20  267  	static inline int						\
38516ab59fbc5b Steven Rostedt            2010-04-20  268  	register_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  269  	{								\
de7b2973903c6c Mathieu Desnoyers         2014-04-08  270  		return tracepoint_probe_register(&__tracepoint_##name,	\
de7b2973903c6c Mathieu Desnoyers         2014-04-08  271  						(void *)probe, data);	\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  272  	}								\
38516ab59fbc5b Steven Rostedt            2010-04-20  273  	static inline int						\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  274) 	register_trace_prio_##name(void (*probe)(data_proto), void *data,\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  275) 				   int prio)				\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  276) 	{								\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  277) 		return tracepoint_probe_register_prio(&__tracepoint_##name, \
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  278) 					      (void *)probe, data, prio); \
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  279) 	}								\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  280) 	static inline int						\
38516ab59fbc5b Steven Rostedt            2010-04-20  281  	unregister_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  282  	{								\
de7b2973903c6c Mathieu Desnoyers         2014-04-08  283  		return tracepoint_probe_unregister(&__tracepoint_##name,\
de7b2973903c6c Mathieu Desnoyers         2014-04-08  284  						(void *)probe, data);	\
53da59aa6dd881 Mathieu Desnoyers         2010-04-30  285  	}								\
38516ab59fbc5b Steven Rostedt            2010-04-20  286  	static inline void						\
38516ab59fbc5b Steven Rostedt            2010-04-20  287  	check_trace_callback_type_##name(void (*cb)(data_proto))	\
53da59aa6dd881 Mathieu Desnoyers         2010-04-30  288  	{								\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  289) 	}								\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  290) 	static inline bool						\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  291) 	trace_##name##_enabled(void)					\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  292) 	{								\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  293) 		return static_key_false(&__tracepoint_##name.key);	\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  294  	}
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  295  
654986462939cd Mathieu Desnoyers         2011-01-26  296  /*
654986462939cd Mathieu Desnoyers         2011-01-26  297   * We have no guarantee that gcc and the linker won't up-align the tracepoint
654986462939cd Mathieu Desnoyers         2011-01-26  298   * structures, so we create an array of pointers that will be used for iteration
654986462939cd Mathieu Desnoyers         2011-01-26  299   * on the tracepoints.
654986462939cd Mathieu Desnoyers         2011-01-26  300   */
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  301) #define DEFINE_TRACE_FN(_name, _reg, _unreg, proto, args)		\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  302) 	static const char __tpstrtab_##_name[]				\
33def8498fdde1 Joe Perches               2020-10-21  303  	__section("__tracepoints_strings") = #_name;			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  304) 	extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name);	\
de394e7568ce2c peterz@infradead.org      2020-09-08  305  	int __traceiter_##_name(void *__data, proto);			\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  306) 	void __probestub_##_name(void *__data, proto);			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  307) 	struct tracepoint __tracepoint_##_name	__used			\
33def8498fdde1 Joe Perches               2020-10-21  308  	__section("__tracepoints") = {					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  309) 		.name = __tpstrtab_##_name,				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  310) 		.key = STATIC_KEY_INIT_FALSE,				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  311) 		.static_call_key = &STATIC_CALL_KEY(tp_func_##_name),	\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  312) 		.static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
de394e7568ce2c peterz@infradead.org      2020-09-08  313  		.iterator = &__traceiter_##_name,			\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  314) 		.probestub = &__probestub_##_name,			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  315) 		.regfunc = _reg,					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  316) 		.unregfunc = _unreg,					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  317) 		.funcs = NULL };					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  318) 	__TRACEPOINT_ENTRY(_name);					\
de394e7568ce2c peterz@infradead.org      2020-09-08  319  	int __traceiter_##_name(void *__data, proto)			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  320) 	{								\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  321) 		struct tracepoint_func *it_func_ptr;			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  322) 		void *it_func;						\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  323) 									\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  324) 		it_func_ptr =						\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  325) 			rcu_dereference_raw((&__tracepoint_##_name)->funcs); \
c8b186a8d54d7e Alexey Kardashevskiy      2021-02-02  326  		if (it_func_ptr) {					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  327) 			do {						\
7211f0a25781ac Steven Rostedt (VMware    2021-02-04  328) 				it_func = READ_ONCE((it_func_ptr)->func); \
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  329) 				__data = (it_func_ptr)->data;		\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  330) 				((void(*)(void *, proto))(it_func))(__data, args); \
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  331) 			} while ((++it_func_ptr)->func);		\
c8b186a8d54d7e Alexey Kardashevskiy      2021-02-02  332  		}							\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  333) 		return 0;						\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  334) 	}								\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  335) 	void __probestub_##_name(void *__data, proto)			\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  336) 	{								\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  337) 	}								\
de394e7568ce2c peterz@infradead.org      2020-09-08  338  	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
97419875865859 Josh Stone                2009-08-24  339  
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  340) #define DEFINE_TRACE(name, proto, args)		\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  341) 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  342  
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  343  #define EXPORT_TRACEPOINT_SYMBOL_GPL(name)				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18 @344) 	EXPORT_SYMBOL_GPL(__tracepoint_##name);				\
de394e7568ce2c peterz@infradead.org      2020-09-08 @345  	EXPORT_SYMBOL_GPL(__traceiter_##name);				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  346) 	EXPORT_STATIC_CALL_GPL(tp_func_##name)
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  347  #define EXPORT_TRACEPOINT_SYMBOL(name)					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  348) 	EXPORT_SYMBOL(__tracepoint_##name);				\
de394e7568ce2c peterz@infradead.org      2020-09-08  349  	EXPORT_SYMBOL(__traceiter_##name);				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  350) 	EXPORT_STATIC_CALL(tp_func_##name)
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  351) 
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  352  

:::::: The code at line 344 was first introduced by commit
:::::: d25e37d89dd2f41d7acae0429039d2f0ae8b4a07 tracepoint: Optimize using static_call()

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
