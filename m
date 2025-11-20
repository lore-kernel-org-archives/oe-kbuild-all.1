Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921B13D638
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763618372; cv=none; b=mTcPCcq+FMP3D1UeBRKwOdvfNoQ5DIQKo4JtRt6pC1wh1bm/66FsrZJtzf6OGfboF+MdSXqbrZ/4k+1i8qSGN3DBwsbWOMuYpe3vpY9WxPSe9cw19E9lbj3CtM/2fjQTb8NOBbT6WHzPb5VhtGA2eguME1AKxkO9x9OiOMccZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763618372; c=relaxed/simple;
	bh=D9uDXKmdkooGCsOZwFV2vP+RePsSRXucK3N93yluElg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R14wmIjxXa2n5YVepte7SKtbkqzhmdRVFDHBopb+4az2iIUtbc7H2t6wlrJ6fOeJKq7ayBGNivN8MQT695JLCT3KZ378pOsY30BP3zfBksmBkMJDnWPw/h8xuuX5LQ9AQvJSfxGqsLxGdCfqte2DEZTun5TrsIJjtZyFNZJVzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhpj/k0v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhpj/k0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763618370; x=1795154370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9uDXKmdkooGCsOZwFV2vP+RePsSRXucK3N93yluElg=;
  b=mhpj/k0vOl83d5RIxgUSb6FW+Jl+acI2bEQGVD1zwZM+K0HfgxIBnCgd
   0fgOcFKOhiQfsqAr21NUXMFRDcYD1hxmuFLhsEq7HAJaS0oI3cPC8YMWv
   kuQe0BbQpj1cYV5Z9dFZ01+/tIavBXQ67sQLSaOMNupipADDEsO+FlZD5
   kEV8Aw4eqaFaZ/D1svvzBSlwBefqjqtcOLPuECWlQlqaoqIoxb88ELWaW
   ahC8jCLoxeodQStDP91x/omkA2cXu/H6hK4SXsZRJ9FdPNtV8eVdYtZAR
   yeC8oLuSa1YPzr2OgoBl3up/rBfDL1dpsb0ybIuYtyf1BLPvexHdpt1Vd
   A==;
X-CSE-ConnectionGUID: X0iEw3tlRtCRsX+LEqqbdA==
X-CSE-MsgGUID: oO4ja0OYSPO+ntCKbs5diA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76003276"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="76003276"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 21:59:29 -0800
X-CSE-ConnectionGUID: J0Fz7DxSSQOB//RbKnaHUw==
X-CSE-MsgGUID: qAzAPHGmQwGFd6a3yhyFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="228582726"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 21:59:28 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLxhV-0003el-2c;
	Thu, 20 Nov 2025 05:59:25 +0000
Date: Thu, 20 Nov 2025 13:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 include/linux/tracepoint.h:385:27: error: '__tracepoint_rcu_stall_warning'
 undeclared here (not in a function); did you mean
 '__tracepoint_rcu_utilization'?
Message-ID: <202511201334.ZxBRMcXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   a15958de6871ffdaddb3c5736a489a5e3d6a3059
commit: 5019ece9a34a655ee3def1159956106b706cde5e [3/3] ANDROID: rcu: allow hooks into rcu stall warning
config: arm-randconfig-001-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201334.ZxBRMcXB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201334.ZxBRMcXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201334.ZxBRMcXB-lkp@intel.com/

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
   include/linux/static_call.h:348:41: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     348 | #define EXPORT_STATIC_CALL_GPL(name)    EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name))
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:12:41: note: in expansion of macro '__PASTE'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:12:49: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:348:59: note: in expansion of macro 'STATIC_CALL_KEY'
     348 | #define EXPORT_STATIC_CALL_GPL(name)    EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:387:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:53:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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
