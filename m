Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C20A17D4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 03:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681097948; x=1712633948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tSg/I0fkHOOB5S+q06f59wMsiLEtIebFxMDh6U0StEc=;
  b=AGdmqe7QDbaei5G8S0G5El/tjfJ5+qwJBseArFWrYE3GWx6Bs8Fe9KMp
   Ia7U27RjBH22puJ4wmN+Jz1456s2jDoyjfNQ0wiodzQMPKtp1fXQ4GdIT
   q6LVwEBCy4wLS+C1PaHM62l+TGapQX+qKyHJHvV34NWOsPAttqG65e7HI
   GUUgo8eFDHsbCVxAZBFoHPMrN8u7Zn8IJnl1WE2ZL7/JO1C4hpBJkDMTD
   AAlwQN+ZG7iNToStr4LYg2CVFbV6+ViqDinjvkvN/D3uI7TjRz8hgOzk4
   wDvRQ26EQphvMmgdlAYN/bzFIYlbjD7is8EH0jpmLFMNj2hTphMVTTBL0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="340767452"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="340767452"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 20:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="831796596"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="831796596"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2023 20:39:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pliMz-000V0T-3B;
	Mon, 10 Apr 2023 03:39:05 +0000
Date: Mon, 10 Apr 2023 11:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-event-ext 5/5]
 include/linux/tracepoint.h:345:27: error: '__probestub_nvme_sq' undeclared
 here (not in a function); did you mean '__traceiter_nvme_sq'?
Message-ID: <202304101152.EAtIkswA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   dba0fb8da5621907bcbc624b94b6b3350e824317
commit: dba0fb8da5621907bcbc624b94b6b3350e824317 [5/5] tracing: Add tracepoint support on fprobe_event
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230410/202304101152.EAtIkswA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git/commit/?id=dba0fb8da5621907bcbc624b94b6b3350e824317
        git remote add mhiramat https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git
        git fetch --no-tags mhiramat topic/fprobe-event-ext
        git checkout dba0fb8da5621907bcbc624b94b6b3350e824317
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101152.EAtIkswA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/uuid.h:11,
                    from include/linux/nvme.h:12,
                    from drivers/nvme/host/trace.h:13,
                    from drivers/nvme/host/trace.c:8:
>> include/linux/tracepoint.h:345:27: error: '__probestub_nvme_sq' undeclared here (not in a function); did you mean '__traceiter_nvme_sq'?
     345 |         EXPORT_SYMBOL_GPL(__probestub_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:87:23: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:151:41: note: in expansion of macro '_EXPORT_SYMBOL'
     151 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:345:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     345 |         EXPORT_SYMBOL_GPL(__probestub_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   drivers/nvme/host/trace.c:357:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     357 | EXPORT_TRACEPOINT_SYMBOL_GPL(nvme_sq);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +345 include/linux/tracepoint.h

   239	
   240	/*
   241	 * Make sure the alignment of the structure in the __tracepoints section will
   242	 * not add unwanted padding between the beginning of the section and the
   243	 * structure. Force alignment to the same alignment as the section start.
   244	 *
   245	 * When lockdep is enabled, we make sure to always test if RCU is
   246	 * "watching" regardless if the tracepoint is enabled or not. Tracepoints
   247	 * require RCU to be active, and it should always warn at the tracepoint
   248	 * site if it is not watching, as it will need to be active when the
   249	 * tracepoint is enabled.
   250	 */
   251	#define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
   252		extern int __traceiter_##name(data_proto);			\
   253		DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
   254		extern struct tracepoint __tracepoint_##name;			\
   255		static inline void trace_##name(proto)				\
   256		{								\
   257			if (static_key_false(&__tracepoint_##name.key))		\
   258				__DO_TRACE(name,				\
   259					TP_ARGS(args),				\
   260					TP_CONDITION(cond), 0);			\
   261			if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
   262				WARN_ON_ONCE(!rcu_is_watching());		\
   263			}							\
   264		}								\
   265		__DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),		\
   266				    PARAMS(cond))				\
   267		static inline int						\
   268		register_trace_##name(void (*probe)(data_proto), void *data)	\
   269		{								\
   270			return tracepoint_probe_register(&__tracepoint_##name,	\
   271							(void *)probe, data);	\
   272		}								\
   273		static inline int						\
   274		register_trace_prio_##name(void (*probe)(data_proto), void *data,\
   275					   int prio)				\
   276		{								\
   277			return tracepoint_probe_register_prio(&__tracepoint_##name, \
   278						      (void *)probe, data, prio); \
   279		}								\
   280		static inline int						\
   281		unregister_trace_##name(void (*probe)(data_proto), void *data)	\
   282		{								\
   283			return tracepoint_probe_unregister(&__tracepoint_##name,\
   284							(void *)probe, data);	\
   285		}								\
   286		static inline void						\
   287		check_trace_callback_type_##name(void (*cb)(data_proto))	\
   288		{								\
   289		}								\
   290		static inline bool						\
   291		trace_##name##_enabled(void)					\
   292		{								\
   293			return static_key_false(&__tracepoint_##name.key);	\
   294		}
   295	
   296	/*
   297	 * We have no guarantee that gcc and the linker won't up-align the tracepoint
   298	 * structures, so we create an array of pointers that will be used for iteration
   299	 * on the tracepoints.
   300	 */
   301	#define DEFINE_TRACE_FN(_name, _reg, _unreg, proto, args)		\
   302		static const char __tpstrtab_##_name[]				\
   303		__section("__tracepoints_strings") = #_name;			\
   304		extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name);	\
   305		int __traceiter_##_name(void *__data, proto);			\
   306		void __probestub_##_name(void *, proto);			\
   307		struct tracepoint __tracepoint_##_name	__used			\
   308		__section("__tracepoints") = {					\
   309			.name = __tpstrtab_##_name,				\
   310			.key = STATIC_KEY_INIT_FALSE,				\
   311			.static_call_key = &STATIC_CALL_KEY(tp_func_##_name),	\
   312			.static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
   313			.iterator = &__traceiter_##_name,			\
   314			.regfunc = _reg,					\
   315			.unregfunc = _unreg,					\
   316			.funcs = NULL };					\
   317		__TRACEPOINT_ENTRY(_name);					\
   318		int __traceiter_##_name(void *__data, proto)			\
   319		{								\
   320			struct tracepoint_func *it_func_ptr;			\
   321			void *it_func;						\
   322										\
   323			it_func_ptr =						\
   324				rcu_dereference_raw((&__tracepoint_##_name)->funcs); \
   325			if (it_func_ptr) {					\
   326				do {						\
   327					it_func = READ_ONCE((it_func_ptr)->func); \
   328					__data = (it_func_ptr)->data;		\
   329					((void(*)(void *, proto))(it_func))(__data, args); \
   330				} while ((++it_func_ptr)->func);		\
   331			}							\
   332			return 0;						\
   333		}								\
   334		void __probestub_##_name(void *__data, proto)			\
   335		{								\
   336		}								\
   337		DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
   338	
   339	#define DEFINE_TRACE(name, proto, args)		\
   340		DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
   341	
   342	#define EXPORT_TRACEPOINT_SYMBOL_GPL(name)				\
   343		EXPORT_SYMBOL_GPL(__tracepoint_##name);				\
   344		EXPORT_SYMBOL_GPL(__traceiter_##name);				\
 > 345		EXPORT_SYMBOL_GPL(__probestub_##name);				\
   346		EXPORT_STATIC_CALL_GPL(tp_func_##name)
   347	#define EXPORT_TRACEPOINT_SYMBOL(name)					\
   348		EXPORT_SYMBOL(__tracepoint_##name);				\
   349		EXPORT_SYMBOL(__traceiter_##name);				\
   350		EXPORT_SYMBOL(__probestub_##name);				\
   351		EXPORT_STATIC_CALL(tp_func_##name)
   352	
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
