Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21889359A6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330338; cv=none; b=cMDBzWqiiQCXl+FMNO2xfeI/fV8WscZ9UG14HbkPmPCo7bt6W8aLGLpOU8O9qLdyIQVOfN+3hAD2fPWI7JJ7KUUX5w8C8uxdE6aqigqTXvI/f4NvPmRa0AZ2fTMLpa48jeY6aWZvAFi85rkCSGnf/dnGH43zVH4/xQyv3Pmzxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330338; c=relaxed/simple;
	bh=TSAY36WIjv+eskzWaz4dk+KxUsEL81rJzrKk7VHmznM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Za7g7ZdXrkoThAW8vIhNDZotoLOU65QlSWtXZV5sxl2ohL3zuTOqv5YOgc9VCBw2M/Ge/dJf2TnGb7YL/8ByCDvuAntW+RsJ3IIsJOvQrX3T90RQaL85yGqTCl1/tiXJjWCu6UexWOvu55tt2O7MnpPShJ9p1cMrG9WKx9+DenQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT+rOAiG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT+rOAiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787330336; x=1818866336;
  h=date:from:to:cc:subject:message-id;
  bh=TSAY36WIjv+eskzWaz4dk+KxUsEL81rJzrKk7VHmznM=;
  b=jT+rOAiG5cKVIEyVvSxrcnyo0PxnZQZtGQ4K+grA8gFiG0ShMELv9gTn
   +J81tswAeS3aJ3qsCdUIl3RtAQXWvp7NwYRzVKGad/zvNy09E2USF4A4t
   /SuC974Uylifj2sWgn5VWCskeXZ4/CEeugggfuKyX0VHoyOgsHw3q+mK+
   EPfPwaQ3ShtPE6gqh9OaJeNXYWaIAKwj7SwZT4pl15p2sLetz6z2n8lMs
   CEBx3EezN6eWnLp2g/46GK2lWV6VWRcjHZcqQzq7ZGlclExVxrTRqB3qP
   tZg584qh9IDzTIdg759JlyaNrwZz4SUw/PpcFmiJL2F9LV0H07bjjvYGd
   g==;
X-CSE-ConnectionGUID: EAfMNqjoSP23Q6nIRSB3sg==
X-CSE-MsgGUID: FR3yT4kMTrO0kkmwk3gW0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="98216385"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="98216385"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:38:56 -0700
X-CSE-ConnectionGUID: BcS7yw4URY60z6j76QwMzw==
X-CSE-MsgGUID: PhFiUlEST/2cePeLPS4a0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="266452428"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2026 09:38:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxSGZ-00000000qDF-3tai;
	Fri, 21 Aug 2026 16:38:51 +0000
Date: Sat, 22 Aug 2026 00:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 0/5]
 include/linux/tracepoint.h:385:27: error: '__tracepoint_rcu_stall_warning'
 undeclared here (not in a function); did you mean
 '__tracepoint_rcu_utilization'?
Message-ID: <202608220023.SizpYswy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinglin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   5922ee2e751845b0716e158317a1dd492c6f7c39
commit: 5019ece9a34a655ee3def1159956106b706cde5e [0/5] ANDROID: rcu: allow hooks into rcu stall warning
config: i386-randconfig-011-20260821 (https://download.01.org/0day-ci/archive/20260822/202608220023.SizpYswy-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220023.SizpYswy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220023.SizpYswy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from kernel/rcu/update.c:21:
>> include/linux/tracepoint.h:385:27: error: '__tracepoint_rcu_stall_warning' undeclared here (not in a function); did you mean '__tracepoint_rcu_utilization'?
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:385:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:53:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint.h:386:27: error: '__traceiter_rcu_stall_warning' undeclared here (not in a function); did you mean '__tracepoint_rcu_stall_warning'?
     386 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:386:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     386 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:53:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:9:41: error: '__SCK__tp_func_rcu_stall_warning' undeclared here (not in a function); did you mean '__SCK__tp_func_rcu_utilization'?
       9 | #define STATIC_CALL_KEY_PREFIX          __SCK__
         |                                         ^~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:277:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     277 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
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
   include/linux/tracepoint.h:387:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:53:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: error: '__SCT__tp_func_rcu_stall_warning' undeclared here (not in a function); did you mean '__SCK__tp_func_rcu_stall_warning'?
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:278:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
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
   include/linux/tracepoint.h:387:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:53:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +385 include/linux/tracepoint.h

7ece55a4a3a04a Josh Triplett             2012-09-04  259  
5de92a7ae4fd32 Alice Ryhl                2024-10-30  260  /*
5de92a7ae4fd32 Alice Ryhl                2024-10-30  261   * Declare an exported function that Rust code can call to trigger this
5de92a7ae4fd32 Alice Ryhl                2024-10-30  262   * tracepoint. This function does not include the static branch; that is done
5de92a7ae4fd32 Alice Ryhl                2024-10-30  263   * in Rust to avoid a function call when the tracepoint is disabled.
5de92a7ae4fd32 Alice Ryhl                2024-10-30  264   */
5de92a7ae4fd32 Alice Ryhl                2024-10-30  265  #define DEFINE_RUST_DO_TRACE(name, proto, args)
5de92a7ae4fd32 Alice Ryhl                2024-10-30  266  #define __DEFINE_RUST_DO_TRACE(name, proto, args)			\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  267  	notrace void rust_do_trace_##name(proto)			\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  268  	{								\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  269  		__rust_do_trace_##name(args);				\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  270  	}
5de92a7ae4fd32 Alice Ryhl                2024-10-30  271  
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  272  /*
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  273   * Make sure the alignment of the structure in the __tracepoints section will
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  274   * not add unwanted padding between the beginning of the section and the
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  275   * structure. Force alignment to the same alignment as the section start.
3a630178fd5f30 Dave Hansen               2014-08-07  276   *
c2679254b9c998 Steven Rostedt (Google    2023-03-10  277)  * When lockdep is enabled, we make sure to always test if RCU is
c2679254b9c998 Steven Rostedt (Google    2023-03-10  278)  * "watching" regardless if the tracepoint is enabled or not. Tracepoints
c2679254b9c998 Steven Rostedt (Google    2023-03-10  279)  * require RCU to be active, and it should always warn at the tracepoint
c2679254b9c998 Steven Rostedt (Google    2023-03-10  280)  * site if it is not watching, as it will need to be active when the
c2679254b9c998 Steven Rostedt (Google    2023-03-10  281)  * tracepoint is enabled.
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  282   */
1746fd4416ed55 Steven Rostedt (VMware    2021-02-08  283) #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
de394e7568ce2c peterz@infradead.org      2020-09-08  284  	extern int __traceiter_##name(data_proto);			\
de394e7568ce2c peterz@infradead.org      2020-09-08  285  	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  286  	extern struct tracepoint __tracepoint_##name;			\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  287  	extern void rust_do_trace_##name(proto);			\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  288  	static inline void __rust_do_trace_##name(proto)		\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  289  	{								\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  290  		__DO_TRACE(name,					\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  291  			TP_ARGS(args),					\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  292  			TP_CONDITION(cond), 0);				\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  293  	}								\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  294  	static inline void trace_##name(proto)				\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  295  	{								\
c5905afb0ee655 Ingo Molnar               2012-02-24  296  		if (static_key_false(&__tracepoint_##name.key))		\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  297) 			__DO_TRACE(name,				\
1746fd4416ed55 Steven Rostedt (VMware    2021-02-08  298) 				TP_ARGS(args),				\
d54b6eeb553c89 Steven Rostedt (VMware    2017-04-07  299) 				TP_CONDITION(cond), 0);			\
a05d59a5673339 Steven Rostedt (Red Hat   2015-02-06  300) 		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
1b273124107cc8 Steven Rostedt (Google    2024-02-28  301) 			WARN_ONCE(!rcu_is_watching(),			\
1b273124107cc8 Steven Rostedt (Google    2024-02-28  302) 				  "RCU not watching for tracepoint");	\
3a630178fd5f30 Dave Hansen               2014-08-07  303  		}							\
2fbb90db1b8fcc Steven Rostedt            2012-02-07  304  	}								\
7ece55a4a3a04a Josh Triplett             2012-09-04  305  	__DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),		\
1746fd4416ed55 Steven Rostedt (VMware    2021-02-08  306) 			    PARAMS(cond))				\
38516ab59fbc5b Steven Rostedt            2010-04-20  307  	static inline int						\
38516ab59fbc5b Steven Rostedt            2010-04-20  308  	register_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  309  	{								\
de7b2973903c6c Mathieu Desnoyers         2014-04-08  310  		return tracepoint_probe_register(&__tracepoint_##name,	\
de7b2973903c6c Mathieu Desnoyers         2014-04-08  311  						(void *)probe, data);	\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  312  	}								\
38516ab59fbc5b Steven Rostedt            2010-04-20  313  	static inline int						\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  314) 	register_trace_prio_##name(void (*probe)(data_proto), void *data,\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  315) 				   int prio)				\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  316) 	{								\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  317) 		return tracepoint_probe_register_prio(&__tracepoint_##name, \
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  318) 					      (void *)probe, data, prio); \
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  319) 	}								\
7904b5c4988e18 Steven Rostedt (Red Hat   2015-09-22  320) 	static inline int						\
38516ab59fbc5b Steven Rostedt            2010-04-20  321  	unregister_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  322  	{								\
de7b2973903c6c Mathieu Desnoyers         2014-04-08  323  		return tracepoint_probe_unregister(&__tracepoint_##name,\
de7b2973903c6c Mathieu Desnoyers         2014-04-08  324  						(void *)probe, data);	\
53da59aa6dd881 Mathieu Desnoyers         2010-04-30  325  	}								\
38516ab59fbc5b Steven Rostedt            2010-04-20  326  	static inline void						\
38516ab59fbc5b Steven Rostedt            2010-04-20  327  	check_trace_callback_type_##name(void (*cb)(data_proto))	\
53da59aa6dd881 Mathieu Desnoyers         2010-04-30  328  	{								\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  329) 	}								\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  330) 	static inline bool						\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  331) 	trace_##name##_enabled(void)					\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  332) 	{								\
7c65bbc7dcface Steven Rostedt (Red Hat   2014-05-06  333) 		return static_key_false(&__tracepoint_##name.key);	\
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  334  	}
97e1c18e8d17bd Mathieu Desnoyers         2008-07-18  335  
654986462939cd Mathieu Desnoyers         2011-01-26  336  /*
654986462939cd Mathieu Desnoyers         2011-01-26  337   * We have no guarantee that gcc and the linker won't up-align the tracepoint
654986462939cd Mathieu Desnoyers         2011-01-26  338   * structures, so we create an array of pointers that will be used for iteration
654986462939cd Mathieu Desnoyers         2011-01-26  339   * on the tracepoints.
654986462939cd Mathieu Desnoyers         2011-01-26  340   */
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  341) #define DEFINE_TRACE_FN(_name, _reg, _unreg, proto, args)		\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  342) 	static const char __tpstrtab_##_name[]				\
33def8498fdde1 Joe Perches               2020-10-21  343  	__section("__tracepoints_strings") = #_name;			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  344) 	extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name);	\
de394e7568ce2c peterz@infradead.org      2020-09-08  345  	int __traceiter_##_name(void *__data, proto);			\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  346) 	void __probestub_##_name(void *__data, proto);			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  347) 	struct tracepoint __tracepoint_##_name	__used			\
33def8498fdde1 Joe Perches               2020-10-21  348  	__section("__tracepoints") = {					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  349) 		.name = __tpstrtab_##_name,				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  350) 		.key = STATIC_KEY_INIT_FALSE,				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  351) 		.static_call_key = &STATIC_CALL_KEY(tp_func_##_name),	\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  352) 		.static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
de394e7568ce2c peterz@infradead.org      2020-09-08  353  		.iterator = &__traceiter_##_name,			\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  354) 		.probestub = &__probestub_##_name,			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  355) 		.regfunc = _reg,					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  356) 		.unregfunc = _unreg,					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  357) 		.funcs = NULL };					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  358) 	__TRACEPOINT_ENTRY(_name);					\
de394e7568ce2c peterz@infradead.org      2020-09-08  359  	int __traceiter_##_name(void *__data, proto)			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  360) 	{								\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  361) 		struct tracepoint_func *it_func_ptr;			\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  362) 		void *it_func;						\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  363) 									\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  364) 		it_func_ptr =						\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  365) 			rcu_dereference_raw((&__tracepoint_##_name)->funcs); \
c8b186a8d54d7e Alexey Kardashevskiy      2021-02-02  366  		if (it_func_ptr) {					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  367) 			do {						\
7211f0a25781ac Steven Rostedt (VMware    2021-02-04  368) 				it_func = READ_ONCE((it_func_ptr)->func); \
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  369) 				__data = (it_func_ptr)->data;		\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  370) 				((void(*)(void *, proto))(it_func))(__data, args); \
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  371) 			} while ((++it_func_ptr)->func);		\
c8b186a8d54d7e Alexey Kardashevskiy      2021-02-02  372  		}							\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  373) 		return 0;						\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  374) 	}								\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  375) 	void __probestub_##_name(void *__data, proto)			\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  376) 	{								\
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  377) 	}								\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  378  	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);	\
5de92a7ae4fd32 Alice Ryhl                2024-10-30  379  	DEFINE_RUST_DO_TRACE(_name, TP_PROTO(proto), TP_ARGS(args))
97419875865859 Josh Stone                2009-08-24  380  
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  381) #define DEFINE_TRACE(name, proto, args)		\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  382) 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  383  
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  384  #define EXPORT_TRACEPOINT_SYMBOL_GPL(name)				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18 @385) 	EXPORT_SYMBOL_GPL(__tracepoint_##name);				\
de394e7568ce2c peterz@infradead.org      2020-09-08 @386  	EXPORT_SYMBOL_GPL(__traceiter_##name);				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  387) 	EXPORT_STATIC_CALL_GPL(tp_func_##name)
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  388  #define EXPORT_TRACEPOINT_SYMBOL(name)					\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  389) 	EXPORT_SYMBOL(__tracepoint_##name);				\
de394e7568ce2c peterz@infradead.org      2020-09-08  390  	EXPORT_SYMBOL(__traceiter_##name);				\
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  391) 	EXPORT_STATIC_CALL(tp_func_##name)
d25e37d89dd2f4 Steven Rostedt (VMware    2020-08-18  392) 
7e066fb870fcd1 Mathieu Desnoyers         2008-11-14  393  

:::::: The code at line 385 was first introduced by commit
:::::: d25e37d89dd2f41d7acae0429039d2f0ae8b4a07 tracepoint: Optimize using static_call()

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
