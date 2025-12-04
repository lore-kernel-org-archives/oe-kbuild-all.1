Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411C43218CC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881497; cv=none; b=hCRvSBcarRQLaGbpR5MnJwMMnUIe54CwIuKsx0ms0RXzUSUbAZ259uZbugWJid1nYPdXLTphrhBwXtpFjsFEjx89ThB4JOQ92/lVPixEhP9NvI/fM1FXdUb/rKrBFKQYthyro8cTkEdOFLeP6ntAFv7vSmW+F/A/Wbx8mdzeIGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881497; c=relaxed/simple;
	bh=s6+W0jApWgSHRu9SQbDumv8NeWKjFPdNTFhHVZslJfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fTIG8wn8GuOLVAL3z/iyQNguXrKhoWl6BT6PYoOVC9fbpOAKNqkXAu+3tngUe61/+S/MMgSK7KBopudfsqvcxZX7RK9UiChMG7yGg07KnSJQqVs/MlOStgp5IXTH7QruPqC0TvhZsx101G5vthuUoE6NjpWDZdktFC1LbTP/070=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSvhVWgs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSvhVWgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764881495; x=1796417495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6+W0jApWgSHRu9SQbDumv8NeWKjFPdNTFhHVZslJfA=;
  b=bSvhVWgsM6bFgDvhiAre2EnN4U0/DTuEYdvmm1HSFLJlI+GtVAzKuQLO
   MGsd7TUo6Xg9+CUVjaSl2EbPN26IcX8JoZWb2u9CyyosPOEMHho33VQNr
   aN1sPqBevRUNa0WgJvJUMq/ten+DaGmvqxag32xn+Z4YFuoUsbynWzjfv
   J4B6fPlS/+SIDEjTHsNlVHAXF3Y0kh03izODYQCIGDx0b2rxIP0+S9fM+
   uNv5VBzrxuu3KdlZ2YaAs5JSJI3cntY+awes64ypT3uwt0koQn0Xy4EAW
   YjfwzEKROJxNlC6/pFSutAOebDdRRBT1yY/gfH3fQ+gkfLWeU3T/vp6kX
   g==;
X-CSE-ConnectionGUID: w/c77a99Tj6aCvAOjcM9KA==
X-CSE-MsgGUID: 3yiBvjUJSKa7l05t8s4/vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66103219"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66103219"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 12:51:35 -0800
X-CSE-ConnectionGUID: NyWoCvqIQ+2VPgPq3JsPMw==
X-CSE-MsgGUID: M3THHq1GT5KyEfPBEAMZ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="195119621"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Dec 2025 12:51:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRGIU-00000000EC5-1KLy;
	Thu, 04 Dec 2025 20:51:30 +0000
Date: Fri, 5 Dec 2025 04:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 include/linux/tracepoint.h:374:27: error:
 '__tracepoint_device_pm_callback_start' undeclared here (not in a function)
Message-ID: <202512050451.u5PMS4vp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   7bb2e16a882b9b59295e567a3f7d685b0fbc01d1
commit: 380603d5f29a2265cb058a9ce5f2171f096ccca1 [1/1] Merge 2be6a7503d32 ("Merge tag 'trace-unused-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace") into android-mainline
config: i386-randconfig-051-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050451.u5PMS4vp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050451.u5PMS4vp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050451.u5PMS4vp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:382,
                    from kernel/trace/power-traces.c:8:
>> include/linux/tracepoint.h:374:27: error: '__tracepoint_device_pm_callback_start' undeclared here (not in a function)
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:374:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/power-traces.c:20:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      20 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint.h:375:27: error: '__traceiter_device_pm_callback_start' undeclared here (not in a function); did you mean '__tracepoint_device_pm_callback_start'?
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/power-traces.c:20:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      20 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:9:41: error: '__SCK__tp_func_device_pm_callback_start' undeclared here (not in a function); did you mean '__tracepoint_device_pm_callback_start'?
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
   include/linux/tracepoint.h:376:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/power-traces.c:20:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      20 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: '__SCT__tp_func_device_pm_callback_start' undeclared here (not in a function); did you mean '__SCK__tp_func_device_pm_callback_start'?
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
   include/linux/tracepoint.h:376:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/power-traces.c:20:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      20 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_start);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint.h:374:27: error: '__tracepoint_device_pm_callback_end' undeclared here (not in a function); did you mean '__tracepoint_device_pm_callback_start'?
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:374:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/power-traces.c:21:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      21 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint.h:375:27: error: '__traceiter_device_pm_callback_end' undeclared here (not in a function); did you mean '__tracepoint_device_pm_callback_end'?
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/power-traces.c:21:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      21 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:9:41: error: '__SCK__tp_func_device_pm_callback_end' undeclared here (not in a function); did you mean '__SCK__tp_func_device_pm_callback_start'?
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
   include/linux/tracepoint.h:376:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/power-traces.c:21:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      21 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: '__SCT__tp_func_device_pm_callback_end' undeclared here (not in a function); did you mean '__SCK__tp_func_device_pm_callback_end'?
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
   include/linux/tracepoint.h:376:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/power-traces.c:21:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      21 | EXPORT_TRACEPOINT_SYMBOL_GPL(device_pm_callback_end);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__tracepoint_device_pm_callback_start +374 include/linux/tracepoint.h

d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  211) 
ad37bcd965fda43 Alice Ryhl                2024-10-30  212  /*
ad37bcd965fda43 Alice Ryhl                2024-10-30  213   * Declare an exported function that Rust code can call to trigger this
ad37bcd965fda43 Alice Ryhl                2024-10-30  214   * tracepoint. This function does not include the static branch; that is done
ad37bcd965fda43 Alice Ryhl                2024-10-30  215   * in Rust to avoid a function call when the tracepoint is disabled.
ad37bcd965fda43 Alice Ryhl                2024-10-30  216   */
ad37bcd965fda43 Alice Ryhl                2024-10-30  217  #define DEFINE_RUST_DO_TRACE(name, proto, args)
ad37bcd965fda43 Alice Ryhl                2024-10-30  218  #define __DEFINE_RUST_DO_TRACE(name, proto, args)			\
ad37bcd965fda43 Alice Ryhl                2024-10-30  219  	notrace void rust_do_trace_##name(proto)			\
ad37bcd965fda43 Alice Ryhl                2024-10-30  220  	{								\
cff6d93eab00bac Alice Ryhl                2024-12-12  221  		__do_trace_##name(args);				\
ad37bcd965fda43 Alice Ryhl                2024-10-30  222  	}
ad37bcd965fda43 Alice Ryhl                2024-10-30  223  
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  224  /*
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  225   * Make sure the alignment of the structure in the __tracepoints section will
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  226   * not add unwanted padding between the beginning of the section and the
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  227   * structure. Force alignment to the same alignment as the section start.
3a630178fd5f30c Dave Hansen               2014-08-07  228   *
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  229)  * When lockdep is enabled, we make sure to always test if RCU is
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  230)  * "watching" regardless if the tracepoint is enabled or not. Tracepoints
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  231)  * require RCU to be active, and it should always warn at the tracepoint
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  232)  * site if it is not watching, as it will need to be active when the
c2679254b9c9980 Steven Rostedt (Google    2023-03-10  233)  * tracepoint is enabled.
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  234   */
ef0d4186083127d Mathieu Desnoyers         2024-11-23  235  #define __DECLARE_TRACE_COMMON(name, proto, args, data_proto)		\
de394e7568ce2cd peterz@infradead.org      2020-09-08  236  	extern int __traceiter_##name(data_proto);			\
de394e7568ce2cd peterz@infradead.org      2020-09-08  237  	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  238  	extern struct tracepoint __tracepoint_##name;			\
ad37bcd965fda43 Alice Ryhl                2024-10-30  239  	extern void rust_do_trace_##name(proto);			\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  240  	static inline int						\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  241  	register_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  242  	{								\
de7b2973903c6cc Mathieu Desnoyers         2014-04-08  243  		return tracepoint_probe_register(&__tracepoint_##name,	\
de7b2973903c6cc Mathieu Desnoyers         2014-04-08  244  						(void *)probe, data);	\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  245  	}								\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  246  	static inline int						\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  247) 	register_trace_prio_##name(void (*probe)(data_proto), void *data,\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  248) 				   int prio)				\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  249) 	{								\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  250) 		return tracepoint_probe_register_prio(&__tracepoint_##name, \
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  251) 					      (void *)probe, data, prio); \
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  252) 	}								\
7904b5c4988e18b Steven Rostedt (Red Hat   2015-09-22  253) 	static inline int						\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  254  	unregister_trace_##name(void (*probe)(data_proto), void *data)	\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  255  	{								\
de7b2973903c6cc Mathieu Desnoyers         2014-04-08  256  		return tracepoint_probe_unregister(&__tracepoint_##name,\
de7b2973903c6cc Mathieu Desnoyers         2014-04-08  257  						(void *)probe, data);	\
53da59aa6dd881f Mathieu Desnoyers         2010-04-30  258  	}								\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  259  	static inline void						\
38516ab59fbc5b3 Steven Rostedt            2010-04-20  260  	check_trace_callback_type_##name(void (*cb)(data_proto))	\
53da59aa6dd881f Mathieu Desnoyers         2010-04-30  261  	{								\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  262) 	}								\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  263) 	static inline bool						\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  264) 	trace_##name##_enabled(void)					\
7c65bbc7dcface0 Steven Rostedt (Red Hat   2014-05-06  265) 	{								\
4a8840af5f53f29 Josh Poimboeuf            2024-10-08  266  		return static_branch_unlikely(&__tracepoint_##name.key);\
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  267  	}
97e1c18e8d17bd8 Mathieu Desnoyers         2008-07-18  268  
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  269  #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
ef0d4186083127d Mathieu Desnoyers         2024-11-23  270  	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
cff6d93eab00bac Alice Ryhl                2024-12-12  271  	static inline void __do_trace_##name(proto)			\
ad37bcd965fda43 Alice Ryhl                2024-10-30  272  	{								\
7af08b57bcb9ebf Linus Torvalds            2024-11-28  273  		if (cond) {						\
7af08b57bcb9ebf Linus Torvalds            2024-11-28  274  			guard(preempt_notrace)();			\
7af08b57bcb9ebf Linus Torvalds            2024-11-28  275  			__DO_TRACE_CALL(name, TP_ARGS(args));		\
7af08b57bcb9ebf Linus Torvalds            2024-11-28  276  		}							\
ad37bcd965fda43 Alice Ryhl                2024-10-30  277  	}								\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  278  	static inline void trace_##name(proto)				\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  279  	{								\
cff6d93eab00bac Alice Ryhl                2024-12-12  280  		if (static_branch_unlikely(&__tracepoint_##name.key))	\
cff6d93eab00bac Alice Ryhl                2024-12-12  281  			__do_trace_##name(args);			\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  282  		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  283  			WARN_ONCE(!rcu_is_watching(),			\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  284  				  "RCU not watching for tracepoint");	\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  285  		}							\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  286  	}
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  287  
ef0d4186083127d Mathieu Desnoyers         2024-11-23  288  #define __DECLARE_TRACE_SYSCALL(name, proto, args, data_proto)		\
ef0d4186083127d Mathieu Desnoyers         2024-11-23  289  	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
cff6d93eab00bac Alice Ryhl                2024-12-12  290  	static inline void __do_trace_##name(proto)			\
ad37bcd965fda43 Alice Ryhl                2024-10-30  291  	{								\
7af08b57bcb9ebf Linus Torvalds            2024-11-28  292  		guard(rcu_tasks_trace)();				\
7af08b57bcb9ebf Linus Torvalds            2024-11-28  293  		__DO_TRACE_CALL(name, TP_ARGS(args));			\
ad37bcd965fda43 Alice Ryhl                2024-10-30  294  	}								\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  295  	static inline void trace_##name(proto)				\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  296  	{								\
ee3685a98ea9203 Mathieu Desnoyers         2024-10-31  297  		might_fault();						\
cff6d93eab00bac Alice Ryhl                2024-12-12  298  		if (static_branch_unlikely(&__tracepoint_##name.key))	\
cff6d93eab00bac Alice Ryhl                2024-12-12  299  			__do_trace_##name(args);			\
ef0d4186083127d Mathieu Desnoyers         2024-11-23  300  		if (IS_ENABLED(CONFIG_LOCKDEP)) {			\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  301  			WARN_ONCE(!rcu_is_watching(),			\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  302  				  "RCU not watching for tracepoint");	\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  303  		}							\
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  304  	}
0e6caab8db8bc93 Mathieu Desnoyers         2024-10-08  305  
654986462939cd7 Mathieu Desnoyers         2011-01-26  306  /*
654986462939cd7 Mathieu Desnoyers         2011-01-26  307   * We have no guarantee that gcc and the linker won't up-align the tracepoint
654986462939cd7 Mathieu Desnoyers         2011-01-26  308   * structures, so we create an array of pointers that will be used for iteration
654986462939cd7 Mathieu Desnoyers         2011-01-26  309   * on the tracepoints.
306d40aa53b671e Mathieu Desnoyers         2024-11-23  310   *
306d40aa53b671e Mathieu Desnoyers         2024-11-23  311   * it_func[0] is never NULL because there is at least one element in the array
306d40aa53b671e Mathieu Desnoyers         2024-11-23  312   * when the array itself is non NULL.
654986462939cd7 Mathieu Desnoyers         2011-01-26  313   */
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  314  #define __DEFINE_TRACE_EXT(_name, _ext, proto, args)			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  315) 	static const char __tpstrtab_##_name[]				\
33def8498fdde18 Joe Perches               2020-10-21  316  	__section("__tracepoints_strings") = #_name;			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  317) 	extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name);	\
de394e7568ce2cd peterz@infradead.org      2020-09-08  318  	int __traceiter_##_name(void *__data, proto);			\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  319) 	void __probestub_##_name(void *__data, proto);			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  320) 	struct tracepoint __tracepoint_##_name	__used			\
33def8498fdde18 Joe Perches               2020-10-21  321  	__section("__tracepoints") = {					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  322) 		.name = __tpstrtab_##_name,				\
4a8840af5f53f29 Josh Poimboeuf            2024-10-08  323  		.key = STATIC_KEY_FALSE_INIT,				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  324) 		.static_call_key = &STATIC_CALL_KEY(tp_func_##_name),	\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  325) 		.static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
de394e7568ce2cd peterz@infradead.org      2020-09-08  326  		.iterator = &__traceiter_##_name,			\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  327) 		.probestub = &__probestub_##_name,			\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  328  		.funcs = NULL,						\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  329  		.ext = _ext,						\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  330  	};								\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  331) 	__TRACEPOINT_ENTRY(_name);					\
de394e7568ce2cd peterz@infradead.org      2020-09-08  332  	int __traceiter_##_name(void *__data, proto)			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  333) 	{								\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  334) 		struct tracepoint_func *it_func_ptr;			\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  335) 		void *it_func;						\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  336) 									\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  337) 		it_func_ptr =						\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  338) 			rcu_dereference_raw((&__tracepoint_##_name)->funcs); \
c8b186a8d54d7e1 Alexey Kardashevskiy      2021-02-02  339  		if (it_func_ptr) {					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  340) 			do {						\
7211f0a25781ace Steven Rostedt (VMware    2021-02-04  341) 				it_func = READ_ONCE((it_func_ptr)->func); \
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  342) 				__data = (it_func_ptr)->data;		\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  343) 				((void(*)(void *, proto))(it_func))(__data, args); \
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  344) 			} while ((++it_func_ptr)->func);		\
c8b186a8d54d7e1 Alexey Kardashevskiy      2021-02-02  345  		}							\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  346) 		return 0;						\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  347) 	}								\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  348) 	void __probestub_##_name(void *__data, proto)			\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  349) 	{								\
e2d0d7b2f42dcaf Masami Hiramatsu (Google  2023-06-06  350) 	}								\
ad37bcd965fda43 Alice Ryhl                2024-10-30  351  	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);	\
ad37bcd965fda43 Alice Ryhl                2024-10-30  352  	DEFINE_RUST_DO_TRACE(_name, TP_PROTO(proto), TP_ARGS(args))
97419875865859f Josh Stone                2009-08-24  353  
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  354  #define DEFINE_TRACE_FN(_name, _reg, _unreg, _proto, _args)		\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  355  	static struct tracepoint_ext __tracepoint_ext_##_name = {	\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  356  		.regfunc = _reg,					\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  357  		.unregfunc = _unreg,					\
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  358  		.faultable = false,					\
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  359  	};								\
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  360  	__DEFINE_TRACE_EXT(_name, &__tracepoint_ext_##_name, PARAMS(_proto), PARAMS(_args));
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  361  
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  362  #define DEFINE_TRACE_SYSCALL(_name, _reg, _unreg, _proto, _args)	\
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  363  	static struct tracepoint_ext __tracepoint_ext_##_name = {	\
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  364  		.regfunc = _reg,					\
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  365  		.unregfunc = _unreg,					\
654ced4a13774e5 Mathieu Desnoyers         2024-10-31  366  		.faultable = true,					\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  367  	};								\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  368  	__DEFINE_TRACE_EXT(_name, &__tracepoint_ext_##_name, PARAMS(_proto), PARAMS(_args));
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  369  
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  370  #define DEFINE_TRACE(_name, _proto, _args)				\
a9cfb8778c43fc4 Mathieu Desnoyers         2024-10-31  371  	__DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  372  
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  373  #define EXPORT_TRACEPOINT_SYMBOL_GPL(name)				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18 @374) 	EXPORT_SYMBOL_GPL(__tracepoint_##name);				\
de394e7568ce2cd peterz@infradead.org      2020-09-08 @375  	EXPORT_SYMBOL_GPL(__traceiter_##name);				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  376) 	EXPORT_STATIC_CALL_GPL(tp_func_##name)
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  377  #define EXPORT_TRACEPOINT_SYMBOL(name)					\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  378) 	EXPORT_SYMBOL(__tracepoint_##name);				\
de394e7568ce2cd peterz@infradead.org      2020-09-08  379  	EXPORT_SYMBOL(__traceiter_##name);				\
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  380) 	EXPORT_STATIC_CALL(tp_func_##name)
d25e37d89dd2f41 Steven Rostedt (VMware    2020-08-18  381) 
7e066fb870fcd10 Mathieu Desnoyers         2008-11-14  382  

:::::: The code at line 374 was first introduced by commit
:::::: d25e37d89dd2f41d7acae0429039d2f0ae8b4a07 tracepoint: Optimize using static_call()

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
