Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F2236B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711517719; cv=none; b=Pkm6d3C+0W4WfhKQjE66c9z+sbEk6hJR17LIeZbbSk721777gBIOYSd+pTg7pAhuduok/tovYvorr4bwtfV/YUZoAd7Bc5rhHSFdAkCWo/nEOmXiRD7uLH/GGYJlQVX2/NjxOWYq5YahDTXlNDyepnJ+R8K2WLzxz/X4RBSKHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711517719; c=relaxed/simple;
	bh=0Nho87T30oIPimyFol8DLVFXFokyDg1A52k1qdJfa7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlQ7xRoVNRlGHdgBUX25QCNgljab7Pw9KwrFGETT2mKaAOlXkKzFCpgcJ2l0GkX67mZ4GbuCfyoMbCVUhN0Cm/H9VIoM0AXXy+9fEGXTp58ngHofJh9oWSHXZivpHf8vOPs6zv9g5gxoShaKcKY7GjNZIC4lyFMp4ZzTAQA6qPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYsdsIZt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYsdsIZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711517715; x=1743053715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Nho87T30oIPimyFol8DLVFXFokyDg1A52k1qdJfa7s=;
  b=CYsdsIZtXd7LZ0ln8yTS3ItlJybtKw9J9cI7CnGphdctHrAPdJsBZMTD
   f3XGjLeQU/ITVf+o8X47mGgWzTi6URXhQXD/nMUF0j4xMFQOJ/LLR6JBA
   7MZcihbE8RXiXNQdoe+Wt/pQsWeyAq0+z1KjJ0rozPI8oPNJEvzLgE2AN
   uJ5YcftvC1Ft4Y8WzRCsZc2ZEK2DqYdyTGSvKFgTq2YsD51LO2Nn49GKA
   qH0JCQtTXC/CEeCLS/IJjOqhsUslqyCodyjzN8nW/ZKB4RZ6Q2rAKCWhJ
   iCgUi3rbauCs8jHj1rXiQdzTqhptS+9dhPFgQe6UYCmNW+iFNC5tCEr09
   w==;
X-CSE-ConnectionGUID: Z9RYgEGXRreN1MGnPN0ZSQ==
X-CSE-MsgGUID: cYLHmJb7TIaHQ5miZZ9CRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17142848"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17142848"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 22:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20905574"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Mar 2024 22:35:15 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpLwO-0000n8-2H;
	Wed, 27 Mar 2024 05:35:12 +0000
Date: Wed, 27 Mar 2024 13:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/4] tracing: add __print_sym() to replace
 __print_symbolic()
Message-ID: <202403271340.X3uVZhs3-lkp@intel.com>
References: <20240326202131.9d261d5bb667.I9bd2617499f0d170df58471bc51379742190f92d@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326202131.9d261d5bb667.I9bd2617499f0d170df58471bc51379742190f92d@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on arnd-asm-generic/master tip/timers/core net/main net-next/main linus/master horms-ipvs/master v6.9-rc1 next-20240326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20240327-032437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20240326202131.9d261d5bb667.I9bd2617499f0d170df58471bc51379742190f92d%40changeid
patch subject: [RFC PATCH v2 1/4] tracing: add __print_sym() to replace __print_symbolic()
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240327/202403271340.X3uVZhs3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271340.X3uVZhs3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271340.X3uVZhs3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/events/filemap.h:118,
                    from mm/filemap.c:54:
>> include/trace/stages/init.h:30: warning: "TRACE_DEFINE_SYM_FNS" redefined
      30 | #define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)                \
         | 
   In file included from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:93,
                    from mm/filemap.c:25:
   include/linux/tracepoint.h:130: note: this is the location of the previous definition
     130 | #define TRACE_DEFINE_SYM_FNS(...)
         | 
>> include/trace/stages/init.h:54: warning: "TRACE_DEFINE_SYM_LIST" redefined
      54 | #define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)                          \
         | 
   include/linux/tracepoint.h:131: note: this is the location of the previous definition
     131 | #define TRACE_DEFINE_SYM_LIST(...)
         | 
--
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/events/tlb.h:62,
                    from mm/rmap.c:82:
>> include/trace/stages/init.h:30: warning: "TRACE_DEFINE_SYM_FNS" redefined
      30 | #define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)                \
         | 
   In file included from include/trace/events/tlb.h:9:
   include/linux/tracepoint.h:130: note: this is the location of the previous definition
     130 | #define TRACE_DEFINE_SYM_FNS(...)
         | 
>> include/trace/stages/init.h:54: warning: "TRACE_DEFINE_SYM_LIST" redefined
      54 | #define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)                          \
         | 
   include/linux/tracepoint.h:131: note: this is the location of the previous definition
     131 | #define TRACE_DEFINE_SYM_LIST(...)
         | 
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/events/migrate.h:146,
                    from mm/rmap.c:83:
>> include/trace/stages/init.h:30: warning: "TRACE_DEFINE_SYM_FNS" redefined
      30 | #define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)                \
         | 
   In file included from include/trace/trace_events.h:112:
   include/trace/stages/stage2_data_offsets.h:9: note: this is the location of the previous definition
       9 | #define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)
         | 
>> include/trace/stages/init.h:54: warning: "TRACE_DEFINE_SYM_LIST" redefined
      54 | #define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)                          \
         | 
   include/trace/stages/stage2_data_offsets.h:12: note: this is the location of the previous definition
      12 | #define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)
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
