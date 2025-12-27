Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9A128312F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837261; cv=none; b=Y/v4wLFnk8fEWhROOM0sfT/qUMQw/nhPYuKM9I70oz+aiyDL2Fx8c57L63+m0q1xn7XhVWvHS/A/Ubu+O4eZZrW7QQdgQCUvzeqTlAL9Tw39RyDaM/F0FzWeQvVh4br6Mh+pZTiA3U0cYCav+rt1M1Y1EoFEwwtS0QNcS1O6tDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837261; c=relaxed/simple;
	bh=s4b9r5NIyqqfqzbb3LYstNQBl0kIBy3/RHlRwMABQjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JIDIf3lExIXH3cv3z2GUQVrJDciEEDNeHbs/jotzZL1ibO+y1GzmoTofXfWj5C9akHIS0/Y7VxRpXht24Wt+TcHCbCR7EvTFZsqswGqqbw8QrnqP7HT4yCQ287Li9uagTnx2NaZh+Mi7iPmIf7geQiATEhYlBlaRyxKSlGUamK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gg7XuOJt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gg7XuOJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766837259; x=1798373259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4b9r5NIyqqfqzbb3LYstNQBl0kIBy3/RHlRwMABQjM=;
  b=gg7XuOJtg9KiQG3jryC5w7JA/BpIwHSYUwr45YEVMeGJ+aOeAwkVurPw
   dwbHmzadMSsvuIbZc1CpCPhw9hinnFxjcle0Vw0JzKcq+3aKIKx+JNHgC
   4eUcBBAiyoRxo2+IfsAHo15iDCdtV80OLe6k+K15NONQS9II794KUYyxz
   XjBlBg4J6g9U72ePcj/8Fivxb0GnujXu0WMWtMGVZ7BzKC01gCYRjnbdm
   7z9FmrKFk5rSC5rI6eLAScdD2Y/q8jLZVgfzzfEfIoxzCyrLC0kevk7/b
   soNQ9g5VmQ8JFcuKFU8aqGezpZB3YkNOUXcPZukYHDc8vxNO6YKhD7aEt
   g==;
X-CSE-ConnectionGUID: CGudRs2GSXiUy/y2AG/fSA==
X-CSE-MsgGUID: 44L2rtGxQDmX6m8QJtDXGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79175303"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79175303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 04:07:39 -0800
X-CSE-ConnectionGUID: rxawn3sPSuGITeL1//eCag==
X-CSE-MsgGUID: jnJzhko7QE6YYHqE4sGTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205076322"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2025 04:07:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZT56-000000007BQ-0L9a;
	Sat, 27 Dec 2025 12:07:36 +0000
Date: Sat, 27 Dec 2025 13:06:44 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pmdunify 1/6] include/trace/stages/init.h:29:9: error:
 redefinition of '__TRACE_SYSTEM_pmdval_t'
Message-ID: <202512271314.2CRoMcEA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/alexshi/linux.git pmdunify
head:   694b5dc7bcd7ba28db0bc95b24a78861bdffefc7
commit: 7c4dfaf03d4105a4daf3dc7baa6070bcab92a7fb [1/6] replace pudval_t by pmdval_t
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251227/202512271314.2CRoMcEA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271314.2CRoMcEA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271314.2CRoMcEA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/events/xen.h:459,
                    from arch/x86/xen/trace.c:21:
>> include/trace/stages/init.h:29:9: error: redefinition of '__TRACE_SYSTEM_pmdval_t'
      29 |         __##TRACE_SYSTEM##_##a =                        \
         |         ^~
   include/trace/events/xen.h:204:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     204 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:29:9: note: previous definition of '__TRACE_SYSTEM_pmdval_t' with type 'struct trace_eval_map'
      29 |         __##TRACE_SYSTEM##_##a =                        \
         |         ^~
   include/trace/events/xen.h:156:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     156 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
>> include/trace/stages/init.h:37:10: error: redefinition of 'TRACE_SYSTEM_pmdval_t'
      37 |         *TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
         |          ^~~~~~~~~~~~
   include/trace/events/xen.h:204:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     204 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:37:10: note: previous definition of 'TRACE_SYSTEM_pmdval_t' with type 'struct trace_eval_map *'
      37 |         *TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
         |          ^~~~~~~~~~~~
   include/trace/events/xen.h:156:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     156 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~


vim +/__TRACE_SYSTEM_pmdval_t +29 include/trace/stages/init.h

af6b9668e85ffd Steven Rostedt (Google  2022-03-03  12) 
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  13) #undef TRACE_DEFINE_ENUM
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  14) #define TRACE_DEFINE_ENUM(a)				\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  15) 	static struct trace_eval_map __used __initdata	\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  16) 	__##TRACE_SYSTEM##_##a =			\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  17) 	{						\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  18) 		.system = TRACE_SYSTEM_STRING,		\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  19) 		.eval_string = #a,			\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  20) 		.eval_value = a				\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  21) 	};						\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  22) 	static struct trace_eval_map __used		\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  23) 	__section("_ftrace_eval_map")			\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  24) 	*TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  25) 
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  26) #undef TRACE_DEFINE_SIZEOF
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  27) #define TRACE_DEFINE_SIZEOF(a)				\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  28) 	static struct trace_eval_map __used __initdata	\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03 @29) 	__##TRACE_SYSTEM##_##a =			\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  30) 	{						\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  31) 		.system = TRACE_SYSTEM_STRING,		\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  32) 		.eval_string = "sizeof(" #a ")",	\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  33) 		.eval_value = sizeof(a)			\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  34) 	};						\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  35) 	static struct trace_eval_map __used		\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  36) 	__section("_ftrace_eval_map")			\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03 @37) 	*TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a

:::::: The code at line 29 was first introduced by commit
:::::: af6b9668e85ffd1502aada8036ccbf4dbd481708 tracing: Move the defines to create TRACE_EVENTS into their own files

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
