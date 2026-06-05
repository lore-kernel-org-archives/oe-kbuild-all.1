Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D76397B1D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669793; cv=none; b=J6GxYbNN4yGf8dKvkcIp0jzlkfkFtceI0IRhLT9LjdaeQZ4JxQx4jMLvlFaWEtnAFGv1jlyaGgfhyZQe41gAJrDabAJF0dX22ppne8LgByepLB0M4LHfnUvjLfDmzL2SkEWgR4jRniIs+/v3k8pZV4bv1hoVrI5XtTv0p/o7SUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669793; c=relaxed/simple;
	bh=2rSk08Vx3CgL/QsQCAzpcyF2PYXvPAP103xXdK5fulE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uxsgTClO6Ufc0Th3tyY2Sld76JZel2wrcc4qoJuh92zt7/9r7OjXvFRLnBTBwsz8R4aYo7XOFWdAHWK5epwwO6/xfqpxNLSuxTW8xP6cBc/p8d1DbbfFJsgFR3RPgQioiJ2xPFrJ+3velrvWkqW7IL3Zm1FyyFdofpyDzq5IPss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1Gv3iLk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1Gv3iLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780669790; x=1812205790;
  h=date:from:to:cc:subject:message-id;
  bh=2rSk08Vx3CgL/QsQCAzpcyF2PYXvPAP103xXdK5fulE=;
  b=k1Gv3iLkF65+Ce01UXnakHQ25/YDciAeAzHVhyMC8DFEEzPE0PvXJb0x
   Z1MxBwbFDMwJXp4gVEimzXMwbGGU5JmO0/7V8I5xIk1M6FovSIZujTuL5
   7FNtkyV8nZ542FH+eVkaUl+KY6goZuQbSg2YZhyzkPP/3SacQI39pGY//
   vunIo7yZNY3mTZ5x/nd4s1lDYQerUL9D0Vyq0/ssOyGuiA3HUftZy4Oed
   LKk6mn23q66IGwhkPl/GTmc/SlHQDVifDC+7JVmCmSJcbpdqy1gEhZi9m
   9nL5UK4oDCgGkEDg+OHsCMnNuIDf1VKO52eT9OoxxP8g4+408l1bbEPJ9
   Q==;
X-CSE-ConnectionGUID: pBGkL9PtRYe/opVn639rAQ==
X-CSE-MsgGUID: jYk59EzpQoWAfNVdFNaNKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69035894"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="69035894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:29:49 -0700
X-CSE-ConnectionGUID: uOcXj2AwSNy4sDK16++nQA==
X-CSE-MsgGUID: 140T9v8YSOORBhven1/OQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="244921631"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jun 2026 07:29:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVYO-00000000G7a-0V0M;
	Fri, 05 Jun 2026 14:29:44 +0000
Date: Fri, 05 Jun 2026 22:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2026-03 1/1]
 include/linux/tracepoint.h:328:27: error: '__tracepoint_rcu_stall_warning'
 undeclared here (not in a function); did you mean
 '__tracepoint_rcu_utilization'?
Message-ID: <202606052236.NwqEG09d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinglin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2026-03
head:   ee14e912296b14b0139b3bb277734965473e209b
commit: 4cb1881c45939c3e9415e76765b756f412f0fbe3 [1/1] ANDROID: rcu: allow hooks into rcu stall warning
config: i386-randconfig-004-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052236.NwqEG09d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052236.NwqEG09d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052236.NwqEG09d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from kernel/rcu/update.c:21:
>> include/linux/tracepoint.h:328:27: error: '__tracepoint_rcu_stall_warning' undeclared here (not in a function); did you mean '__tracepoint_rcu_utilization'?
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint.h:329:27: error: '__traceiter_rcu_stall_warning' undeclared here (not in a function); did you mean '__tracepoint_rcu_stall_warning'?
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:329:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:9:41: error: '__SCK__tp_func_rcu_stall_warning' undeclared here (not in a function); did you mean '__SCK__tp_func_rcu_utilization'?
       9 | #define STATIC_CALL_KEY_PREFIX          __SCK__
         |                                         ^~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:261:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     261 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:12:41: note: in expansion of macro '__PASTE'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:12:49: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:261:27: note: in expansion of macro 'STATIC_CALL_KEY'
     261 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:330:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     330 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: '__SCT__tp_func_rcu_stall_warning' undeclared here (not in a function); did you mean '__SCK__tp_func_rcu_stall_warning'?
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:262:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     262 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:262:27: note: in expansion of macro 'STATIC_CALL_TRAMP'
     262 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:330:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     330 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +328 include/linux/tracepoint.h

7ece55a4a3a04a Josh Triplett            2012-09-04  228  
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  229  /*
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  230   * Make sure the alignment of the structure in the __tracepoints section will
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  231   * not add unwanted padding between the beginning of the section and the
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  232   * structure. Force alignment to the same alignment as the section start.
3a630178fd5f30 Dave Hansen              2014-08-07  233   *
9b9a118cc428b0 Steven Rostedt (Google   2023-03-10  234)  * When lockdep is enabled, we make sure to always test if RCU is
9b9a118cc428b0 Steven Rostedt (Google   2023-03-10  235)  * "watching" regardless if the tracepoint is enabled or not. Tracepoints
9b9a118cc428b0 Steven Rostedt (Google   2023-03-10  236)  * require RCU to be active, and it should always warn at the tracepoint
9b9a118cc428b0 Steven Rostedt (Google   2023-03-10  237)  * site if it is not watching, as it will need to be active when the
9b9a118cc428b0 Steven Rostedt (Google   2023-03-10  238)  * tracepoint is enabled.
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  239   */
1746fd4416ed55 Steven Rostedt (VMware   2021-02-08  240) #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
de394e7568ce2c peterz@infradead.org     2020-09-08  241  	extern int __traceiter_##name(data_proto);			\
de394e7568ce2c peterz@infradead.org     2020-09-08  242  	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
7e066fb870fcd1 Mathieu Desnoyers        2008-11-14  243  	extern struct tracepoint __tracepoint_##name;			\
41a4dab305d06a Shaleen Agrawal          2021-09-24  244  	static inline void __nocfi trace_##name(proto)				\
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  245  	{								\
c5905afb0ee655 Ingo Molnar              2012-02-24  246  		if (static_key_false(&__tracepoint_##name.key))		\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  247) 			__DO_TRACE(name,				\
1746fd4416ed55 Steven Rostedt (VMware   2021-02-08  248) 				TP_ARGS(args),				\
d54b6eeb553c89 Steven Rostedt (VMware   2017-04-07  249) 				TP_CONDITION(cond), 0);			\
a05d59a5673339 Steven Rostedt (Red Hat  2015-02-06  250) 		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
9b9a118cc428b0 Steven Rostedt (Google   2023-03-10  251) 			WARN_ON_ONCE(!rcu_is_watching());		\
3a630178fd5f30 Dave Hansen              2014-08-07  252  		}							\
2fbb90db1b8fcc Steven Rostedt           2012-02-07  253  	}								\
7ece55a4a3a04a Josh Triplett            2012-09-04  254  	__DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),		\
1746fd4416ed55 Steven Rostedt (VMware   2021-02-08  255) 			    PARAMS(cond))				\
38516ab59fbc5b Steven Rostedt           2010-04-20  256  	static inline int						\
38516ab59fbc5b Steven Rostedt           2010-04-20  257  	register_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  258  	{								\
de7b2973903c6c Mathieu Desnoyers        2014-04-08  259  		return tracepoint_probe_register(&__tracepoint_##name,	\
de7b2973903c6c Mathieu Desnoyers        2014-04-08  260  						(void *)probe, data);	\
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  261  	}								\
38516ab59fbc5b Steven Rostedt           2010-04-20  262  	static inline int						\
7904b5c4988e18 Steven Rostedt (Red Hat  2015-09-22  263) 	register_trace_prio_##name(void (*probe)(data_proto), void *data,\
7904b5c4988e18 Steven Rostedt (Red Hat  2015-09-22  264) 				   int prio)				\
7904b5c4988e18 Steven Rostedt (Red Hat  2015-09-22  265) 	{								\
7904b5c4988e18 Steven Rostedt (Red Hat  2015-09-22  266) 		return tracepoint_probe_register_prio(&__tracepoint_##name, \
7904b5c4988e18 Steven Rostedt (Red Hat  2015-09-22  267) 					      (void *)probe, data, prio); \
7904b5c4988e18 Steven Rostedt (Red Hat  2015-09-22  268) 	}								\
7904b5c4988e18 Steven Rostedt (Red Hat  2015-09-22  269) 	static inline int						\
38516ab59fbc5b Steven Rostedt           2010-04-20  270  	unregister_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  271  	{								\
de7b2973903c6c Mathieu Desnoyers        2014-04-08  272  		return tracepoint_probe_unregister(&__tracepoint_##name,\
de7b2973903c6c Mathieu Desnoyers        2014-04-08  273  						(void *)probe, data);	\
53da59aa6dd881 Mathieu Desnoyers        2010-04-30  274  	}								\
38516ab59fbc5b Steven Rostedt           2010-04-20  275  	static inline void						\
38516ab59fbc5b Steven Rostedt           2010-04-20  276  	check_trace_callback_type_##name(void (*cb)(data_proto))	\
53da59aa6dd881 Mathieu Desnoyers        2010-04-30  277  	{								\
7c65bbc7dcface Steven Rostedt (Red Hat  2014-05-06  278) 	}								\
7c65bbc7dcface Steven Rostedt (Red Hat  2014-05-06  279) 	static inline bool						\
7c65bbc7dcface Steven Rostedt (Red Hat  2014-05-06  280) 	trace_##name##_enabled(void)					\
7c65bbc7dcface Steven Rostedt (Red Hat  2014-05-06  281) 	{								\
7c65bbc7dcface Steven Rostedt (Red Hat  2014-05-06  282) 		return static_key_false(&__tracepoint_##name.key);	\
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  283  	}
97e1c18e8d17bd Mathieu Desnoyers        2008-07-18  284  
654986462939cd Mathieu Desnoyers        2011-01-26  285  /*
654986462939cd Mathieu Desnoyers        2011-01-26  286   * We have no guarantee that gcc and the linker won't up-align the tracepoint
654986462939cd Mathieu Desnoyers        2011-01-26  287   * structures, so we create an array of pointers that will be used for iteration
654986462939cd Mathieu Desnoyers        2011-01-26  288   * on the tracepoints.
654986462939cd Mathieu Desnoyers        2011-01-26  289   */
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  290) #define DEFINE_TRACE_FN(_name, _reg, _unreg, proto, args)		\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  291) 	static const char __tpstrtab_##_name[]				\
33def8498fdde1 Joe Perches              2020-10-21  292  	__section("__tracepoints_strings") = #_name;			\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  293) 	extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name);	\
de394e7568ce2c peterz@infradead.org     2020-09-08  294  	int __traceiter_##_name(void *__data, proto);			\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  295) 	struct tracepoint __tracepoint_##_name	__used			\
33def8498fdde1 Joe Perches              2020-10-21  296  	__section("__tracepoints") = {					\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  297) 		.name = __tpstrtab_##_name,				\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  298) 		.key = STATIC_KEY_INIT_FALSE,				\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  299) 		.static_call_key = &STATIC_CALL_KEY(tp_func_##_name),	\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  300) 		.static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
de394e7568ce2c peterz@infradead.org     2020-09-08  301  		.iterator = &__traceiter_##_name,			\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  302) 		.regfunc = _reg,					\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  303) 		.unregfunc = _unreg,					\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  304) 		.funcs = NULL };					\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  305) 	__TRACEPOINT_ENTRY(_name);					\
41a4dab305d06a Shaleen Agrawal          2021-09-24  306  	int __nocfi __traceiter_##_name(void *__data, proto)			\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  307) 	{								\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  308) 		struct tracepoint_func *it_func_ptr;			\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  309) 		void *it_func;						\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  310) 									\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  311) 		it_func_ptr =						\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  312) 			rcu_dereference_raw((&__tracepoint_##_name)->funcs); \
c8b186a8d54d7e Alexey Kardashevskiy     2021-02-02  313  		if (it_func_ptr) {					\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  314) 			do {						\
7211f0a25781ac Steven Rostedt (VMware   2021-02-04  315) 				it_func = READ_ONCE((it_func_ptr)->func); \
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  316) 				__data = (it_func_ptr)->data;		\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  317) 				((void(*)(void *, proto))(it_func))(__data, args); \
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  318) 			} while ((++it_func_ptr)->func);		\
c8b186a8d54d7e Alexey Kardashevskiy     2021-02-02  319  		}							\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  320) 		return 0;						\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  321) 	}								\
de394e7568ce2c peterz@infradead.org     2020-09-08  322  	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
97419875865859 Josh Stone               2009-08-24  323  
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  324) #define DEFINE_TRACE(name, proto, args)		\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  325) 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
7e066fb870fcd1 Mathieu Desnoyers        2008-11-14  326  
7e066fb870fcd1 Mathieu Desnoyers        2008-11-14  327  #define EXPORT_TRACEPOINT_SYMBOL_GPL(name)				\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18 @328) 	EXPORT_SYMBOL_GPL(__tracepoint_##name);				\
de394e7568ce2c peterz@infradead.org     2020-09-08 @329  	EXPORT_SYMBOL_GPL(__traceiter_##name);				\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  330) 	EXPORT_STATIC_CALL_GPL(tp_func_##name)
7e066fb870fcd1 Mathieu Desnoyers        2008-11-14  331  #define EXPORT_TRACEPOINT_SYMBOL(name)					\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  332) 	EXPORT_SYMBOL(__tracepoint_##name);				\
de394e7568ce2c peterz@infradead.org     2020-09-08  333  	EXPORT_SYMBOL(__traceiter_##name);				\
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  334) 	EXPORT_STATIC_CALL(tp_func_##name)
d25e37d89dd2f4 Steven Rostedt (VMware   2020-08-18  335) 
7e066fb870fcd1 Mathieu Desnoyers        2008-11-14  336  

:::::: The code at line 328 was first introduced by commit
:::::: d25e37d89dd2f41d7acae0429039d2f0ae8b4a07 tracepoint: Optimize using static_call()

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
