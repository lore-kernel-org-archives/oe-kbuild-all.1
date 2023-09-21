Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F54818058
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695325145; x=1726861145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HFC2XfBb+KWXjAkFqhgVnKWoDk0CL1ti/8UADkoGVQY=;
  b=fjkU7ZxvT3FtJPlJhrJTcf3K3EPFCbuX+3q6+tpUmgrs5d72TIZs0wvz
   1FW6GPELGns7gFIz3NADjFK/yCoRvWh4F6DmAU9AEA9kO/hN+UYQMrgbJ
   NldXg0+7jxwr2CpDJmO2cZGxCOyBLKKXbzb5xh8EaYLPN53g35mrANUUw
   Db9lhPRcr/3O7AH0810yYpj48y12LcJHF6ea8/IeCASQ2xacSWmxMQg/w
   +xuBmQC14+L4nMcdO43hBD/4NJWgAkPCdB+ensnduZy1Fa1bMFYH+P87H
   tb+BEYcNkjRqeUtYWqNFxgJ0tV/VGG624UthmQEZ7Iz2696BFdWjx1//U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="360884211"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="360884211"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 12:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="1078051844"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="1078051844"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2023 12:39:03 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjPVs-0000JL-37;
	Thu, 21 Sep 2023 19:39:00 +0000
Date: Fri, 22 Sep 2023 03:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] tracing: add __print_sym() to replace
 __print_symbolic()
Message-ID: <202309220337.vVAvNRuY-lkp@intel.com>
References: <20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on arnd-asm-generic/master net/main net-next/main linus/master horms-ipvs/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20230922-013527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d%40changeid
patch subject: [RFC PATCH 1/4] tracing: add __print_sym() to replace __print_symbolic()
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230922/202309220337.vVAvNRuY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220337.vVAvNRuY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220337.vVAvNRuY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/events/module.h:134,
                    from kernel/module/main.c:64:
>> include/trace/stages/init.h:30: warning: "TRACE_DEFINE_SYM_FNS" redefined
      30 | #define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)                \
         | 
   In file included from include/linux/trace_events.h:11,
                    from kernel/module/main.c:14:
   include/linux/tracepoint.h:130: note: this is the location of the previous definition
     130 | #define TRACE_DEFINE_SYM_FNS(...)
         | 
>> include/trace/stages/init.h:54: warning: "TRACE_DEFINE_SYM_LIST" redefined
      54 | #define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)                          \
         | 
   include/linux/tracepoint.h:131: note: this is the location of the previous definition
     131 | #define TRACE_DEFINE_SYM_LIST(...)
         | 


vim +/TRACE_DEFINE_SYM_FNS +30 include/trace/stages/init.h

    12	
    13	#undef TRACE_DEFINE_ENUM
    14	#define TRACE_DEFINE_ENUM(a)				\
    15		static struct trace_eval_map __used __initdata	\
    16		__##TRACE_SYSTEM##_##a =			\
    17		{						\
    18			.system = TRACE_SYSTEM_STRING,		\
    19			.eval_string = #a,			\
    20			.eval_value = a				\
    21		};						\
    22		static struct trace_eval_map __used		\
    23		__section("_ftrace_eval_map")			\
    24		*TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
    25	
    26	/*
    27	 * Define a symbol for __print_sym by giving lookup and
    28	 * show functions. See &struct trace_sym_def.
    29	 */
  > 30	#define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)		\
    31		_TRACE_DEFINE_SYM_FNS(TRACE_SYSTEM, _symbol_id, _lookup, _show)
    32	#define _TRACE_DEFINE_SYM_FNS(_system, _symbol_id, _lookup, _show)	\
    33		__TRACE_DEFINE_SYM_FNS(_system, _symbol_id, _lookup, _show)
    34	#define __TRACE_DEFINE_SYM_FNS(_system, _symbol_id, _lookup, _show)	\
    35		___TRACE_DEFINE_SYM_FNS(_system ## _ ## _symbol_id, _symbol_id,	\
    36					_lookup, _show)
    37	#define ___TRACE_DEFINE_SYM_FNS(_name, _symbol_id, _lookup, _show)	\
    38		static struct trace_sym_def					\
    39		__trace_sym_def_ ## _name = {					\
    40			.system = TRACE_SYSTEM_STRING,				\
    41			/* need the ) for later strcmp */			\
    42			.symbol_id = #_symbol_id ")",				\
    43			.lookup = _lookup,					\
    44			.show = _show,						\
    45		};								\
    46		static struct trace_sym_def 					\
    47		__section("_ftrace_sym_defs")					\
    48		*__trace_sym_def_p_ ## _name = &__trace_sym_def_ ## _name
    49	
    50	/*
    51	 * Define a symbol for __print_sym by giving lookup and
    52	 * show functions. See &struct trace_sym_def.
    53	 */
  > 54	#define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)				\
    55		_TRACE_DEFINE_SYM_LIST(TRACE_SYSTEM, _symbol_id, __VA_ARGS__)
    56	#define _TRACE_DEFINE_SYM_LIST(_system, _symbol_id, ...)		\
    57		__TRACE_DEFINE_SYM_LIST(_system, _symbol_id, __VA_ARGS__)
    58	#define __TRACE_DEFINE_SYM_LIST(_system, _symbol_id, ...)		\
    59		___TRACE_DEFINE_SYM_LIST(_system ## _ ## _symbol_id, _symbol_id,\
    60					 __VA_ARGS__)
    61	#define ___TRACE_DEFINE_SYM_LIST(_name, _symbol_id, ...)		\
    62		static struct trace_sym_entry					\
    63		__trace_sym_list_ ## _name[] = { __VA_ARGS__ };			\
    64		static const char *						\
    65		__trace_sym_lookup_ ## _name(unsigned long long value)		\
    66		{								\
    67			return trace_sym_lookup(__trace_sym_list_ ## _name,	\
    68				ARRAY_SIZE(__trace_sym_list_ ## _name), value);	\
    69		}								\
    70		static void							\
    71		__trace_sym_show_ ## _name(struct seq_file *m)			\
    72		{								\
    73			trace_sym_show(m, __trace_sym_list_ ## _name,		\
    74				       ARRAY_SIZE(__trace_sym_list_ ## _name));	\
    75		}								\
    76		___TRACE_DEFINE_SYM_FNS(_name, _symbol_id,			\
    77					__trace_sym_lookup_ ## _name,		\
    78					__trace_sym_show_ ## _name)
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
