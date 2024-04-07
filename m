Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B883B78B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712496675; cv=none; b=XRZ652tGn3EosjYsBP4vYCxmp/5ow49rloqPT2qmaiRaXcBXHKvK6pedMXIvuCoMqi/Be3Rr+YvpDkIXSeL5C8PW4mWRyEZRq4jTLxe2jC3Z97QiQnkCBNWdNk25m38gKOzlpK1j/4XFVmynhR3U1pr267YwIXdHg3ukLwc3zgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712496675; c=relaxed/simple;
	bh=bGGisWPz9jQybNsnxva23Jeorqj0aQBNbUoXDHAGUdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCRlDwfZYbe5+zXt3R2Gh6BP587zmRquKhl2cHsVjNr1gLclxpK+mhy87WrjY6PHqBpLE1rhe7BtOueIXydoaCRuNoEopqlbp18ZVQlS9tSzJMA8UdUD/0XOcg0R26nxzwa1XRoRPn7d/IiDxikACK5MpmgXKzPA4XjjXT8qQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4pf/iYA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4pf/iYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712496672; x=1744032672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGGisWPz9jQybNsnxva23Jeorqj0aQBNbUoXDHAGUdQ=;
  b=N4pf/iYAkXOYJN1la2itdMNyGE0rnhbGbwOGwwcL8xEKuN2tg3wT97Rj
   TmQfnrht1tgcibF7GgXTbOSKzmyX/ncG4JM+YyZ/mFWrm8nymQzqa2JR/
   QJ3jvirEoj3dutJvmsDQGxdxjQgqAV/Q9SiA6TwOl+FWwZ7l7KEC3mHu+
   ZjZQ2RW2gcYpmAPt2h47bnPebhz1PbRATff3XZsix1K5/sDWem55RNebo
   U62DXTXlGlpAz5gpe5LssWPM8QOCPPTFYc2X6L+rrk6BfzZOB4af3bpVt
   Hi/kClkhdSM4wbWYPEdjy+t3G/udFAQbAP2kTvXX84yWnkMP0ibmbKgyL
   A==;
X-CSE-ConnectionGUID: P/FvKuqsQAWOeKmpdEY0YA==
X-CSE-MsgGUID: wtA3yqAXSrq63qwDLl77zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7654152"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="7654152"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 06:31:12 -0700
X-CSE-ConnectionGUID: usUIo1jkT5u69WixQBc8Uw==
X-CSE-MsgGUID: cerGhkfFTKOLlZSt3LmMRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="20065059"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2024 06:31:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtSbz-0004Nm-1n;
	Sun, 07 Apr 2024 13:31:07 +0000
Date: Sun, 7 Apr 2024 21:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Subject: [jolsa-perf:mhiramat_topic/fprobe-on-fgraph 28/36]
 kernel/trace/trace_fprobe.c:313:33: error: expected '=', ',', ';', 'asm' or
 '__attribute__' before ')' token
Message-ID: <202404072122.shBfk2YE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git mhiramat_topic/fprobe-on-fgraph
head:   88c3d7110e647fa5277f3499184c5424be431c59
commit: 5a634383954631fc0ee614522a03a62de3d84f71 [28/36] tracing/fprobe: Enable fprobe events with CONFIG_DYNAMIC_FTRACE_WITH_ARGS
config: i386-randconfig-004-20240404 (https://download.01.org/0day-ci/archive/20240407/202404072122.shBfk2YE-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404072122.shBfk2YE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404072122.shBfk2YE-lkp@intel.com/

Note: the jolsa-perf/mhiramat_topic/fprobe-on-fgraph HEAD 88c3d7110e647fa5277f3499184c5424be431c59 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/trace/trace_fprobe.c: In function 'fexit_perf_func':
>> kernel/trace/trace_fprobe.c:313:33: error: expected '=', ',', ';', 'asm' or '__attribute__' before ')' token
     313 |                 void *entry_data)
         |                                 ^
   In file included from arch/x86/include/asm/kprobes.h:12,
                    from include/linux/kprobes.h:31,
                    from kernel/trace/trace_probe.h:21,
                    from kernel/trace/trace_fprobe.c:17:
>> include/asm-generic/kprobes.h:14:9: error: storage class specified for parameter '_kbl_addr_fexit_perf_func'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |         ^~~~~~~~~~
   include/asm-generic/kprobes.h:15:33: note: in expansion of macro '__NOKPROBE_SYMBOL'
      15 | # define NOKPROBE_SYMBOL(fname) __NOKPROBE_SYMBOL(fname)
         |                                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:343:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     343 | NOKPROBE_SYMBOL(fexit_perf_func);
         | ^~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:343:1: error: parameter '_kbl_addr_fexit_perf_func' is initialized
   kernel/trace/trace_fprobe.c:343:1: warning: 'used' attribute ignored [-Wattributes]
>> include/asm-generic/kprobes.h:14:9: error: section attribute not allowed for '_kbl_addr_fexit_perf_func'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |         ^~~~~~~~~~
   include/asm-generic/kprobes.h:15:33: note: in expansion of macro '__NOKPROBE_SYMBOL'
      15 | # define NOKPROBE_SYMBOL(fname) __NOKPROBE_SYMBOL(fname)
         |                                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:343:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     343 | NOKPROBE_SYMBOL(fexit_perf_func);
         | ^~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:343:33: error: expected declaration specifiers before ';' token
     343 | NOKPROBE_SYMBOL(fexit_perf_func);
         |                                 ^
>> kernel/trace/trace_fprobe.c:349:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     349 | {
         | ^
>> include/asm-generic/kprobes.h:14:9: error: storage class specified for parameter '_kbl_addr_fentry_dispatcher'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |         ^~~~~~~~~~
   include/asm-generic/kprobes.h:15:33: note: in expansion of macro '__NOKPROBE_SYMBOL'
      15 | # define NOKPROBE_SYMBOL(fname) __NOKPROBE_SYMBOL(fname)
         |                                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:362:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     362 | NOKPROBE_SYMBOL(fentry_dispatcher);
         | ^~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:362:1: error: parameter '_kbl_addr_fentry_dispatcher' is initialized
   kernel/trace/trace_fprobe.c:362:1: warning: 'used' attribute ignored [-Wattributes]
>> include/asm-generic/kprobes.h:14:9: error: section attribute not allowed for '_kbl_addr_fentry_dispatcher'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |         ^~~~~~~~~~
   include/asm-generic/kprobes.h:15:33: note: in expansion of macro '__NOKPROBE_SYMBOL'
      15 | # define NOKPROBE_SYMBOL(fname) __NOKPROBE_SYMBOL(fname)
         |                                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:362:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     362 | NOKPROBE_SYMBOL(fentry_dispatcher);
         | ^~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:362:17: error: 'fentry_dispatcher' undeclared (first use in this function); did you mean 'bpf_dispatcher'?
     362 | NOKPROBE_SYMBOL(fentry_dispatcher);
         |                 ^~~~~~~~~~~~~~~~~
   include/asm-generic/kprobes.h:14:44: note: in definition of macro '__NOKPROBE_SYMBOL'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |                                            ^~~~~
   kernel/trace/trace_fprobe.c:362:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     362 | NOKPROBE_SYMBOL(fentry_dispatcher);
         | ^~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:362:17: note: each undeclared identifier is reported only once for each function it appears in
     362 | NOKPROBE_SYMBOL(fentry_dispatcher);
         |                 ^~~~~~~~~~~~~~~~~
   include/asm-generic/kprobes.h:14:44: note: in definition of macro '__NOKPROBE_SYMBOL'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |                                            ^~~~~
   kernel/trace/trace_fprobe.c:362:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     362 | NOKPROBE_SYMBOL(fentry_dispatcher);
         | ^~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:362:35: error: expected declaration specifiers before ';' token
     362 | NOKPROBE_SYMBOL(fentry_dispatcher);
         |                                   ^
   kernel/trace/trace_fprobe.c:367:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     367 | {
         | ^
>> include/asm-generic/kprobes.h:14:9: error: storage class specified for parameter '_kbl_addr_fexit_dispatcher'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |         ^~~~~~~~~~
   include/asm-generic/kprobes.h:15:33: note: in expansion of macro '__NOKPROBE_SYMBOL'
      15 | # define NOKPROBE_SYMBOL(fname) __NOKPROBE_SYMBOL(fname)
         |                                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:377:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     377 | NOKPROBE_SYMBOL(fexit_dispatcher);
         | ^~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:377:1: error: parameter '_kbl_addr_fexit_dispatcher' is initialized
   kernel/trace/trace_fprobe.c:377:1: warning: 'used' attribute ignored [-Wattributes]
>> include/asm-generic/kprobes.h:14:9: error: section attribute not allowed for '_kbl_addr_fexit_dispatcher'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |         ^~~~~~~~~~
   include/asm-generic/kprobes.h:15:33: note: in expansion of macro '__NOKPROBE_SYMBOL'
      15 | # define NOKPROBE_SYMBOL(fname) __NOKPROBE_SYMBOL(fname)
         |                                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:377:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     377 | NOKPROBE_SYMBOL(fexit_dispatcher);
         | ^~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:377:17: error: 'fexit_dispatcher' undeclared (first use in this function); did you mean 'bpf_dispatcher'?
     377 | NOKPROBE_SYMBOL(fexit_dispatcher);
         |                 ^~~~~~~~~~~~~~~~
   include/asm-generic/kprobes.h:14:44: note: in definition of macro '__NOKPROBE_SYMBOL'
      14 |         _kbl_addr_##fname = (unsigned long)fname;
         |                                            ^~~~~
   kernel/trace/trace_fprobe.c:377:1: note: in expansion of macro 'NOKPROBE_SYMBOL'
     377 | NOKPROBE_SYMBOL(fexit_dispatcher);
         | ^~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:377:34: error: expected declaration specifiers before ';' token
     377 | NOKPROBE_SYMBOL(fexit_dispatcher);
         |                                  ^
   kernel/trace/trace_fprobe.c:380:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     380 | {
         | ^
   kernel/trace/trace_fprobe.c:397:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     397 | {
         | ^
   kernel/trace/trace_fprobe.c:430:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     430 | {
         | ^
   kernel/trace/trace_fprobe.c:442:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     442 | {
         | ^
   kernel/trace/trace_fprobe.c:450:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     450 | {
         | ^
   kernel/trace/trace_fprobe.c:466:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     466 | {
         | ^
   kernel/trace/trace_fprobe.c:501:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     501 | {
         | ^
   kernel/trace/trace_fprobe.c:537:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     537 | {
         | ^
   kernel/trace/trace_fprobe.c:567:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     567 | {
         | ^
   kernel/trace/trace_fprobe.c:601:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     601 | {
         | ^
   kernel/trace/trace_fprobe.c:616:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     616 | {
         | ^
>> kernel/trace/trace_fprobe.c:631:37: error: storage class specified for parameter 'fentry_funcs'
     631 | static struct trace_event_functions fentry_funcs = {
         |                                     ^~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:631:15: error: parameter 'fentry_funcs' is initialized
     631 | static struct trace_event_functions fentry_funcs = {
         |               ^~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:632:27: error: 'print_fentry_event' undeclared (first use in this function)
     632 |         .trace          = print_fentry_event
         |                           ^~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:635:37: error: storage class specified for parameter 'fexit_funcs'
     635 | static struct trace_event_functions fexit_funcs = {
         |                                     ^~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:635:15: error: parameter 'fexit_funcs' is initialized
     635 | static struct trace_event_functions fexit_funcs = {
         |               ^~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_fprobe.c:636:27: error: 'print_fexit_event' undeclared (first use in this function)
     636 |         .trace          = print_fexit_event
         |                           ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:639:34: error: storage class specified for parameter 'fentry_fields_array'
     639 | static struct trace_event_fields fentry_fields_array[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:639:15: error: parameter 'fentry_fields_array' is initialized
     639 | static struct trace_event_fields fentry_fields_array[] = {
         |               ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:639:58: error: variable-sized object may not be initialized except with an empty initializer
     639 | static struct trace_event_fields fentry_fields_array[] = {
         |                                                          ^
   kernel/trace/trace_fprobe.c:640:9: warning: braces around scalar initializer
     640 |         { .type = TRACE_FUNCTION_TYPE,
         |         ^
   kernel/trace/trace_fprobe.c:640:9: note: (near initialization for 'fentry_fields_array')
   kernel/trace/trace_fprobe.c:640:11: error: field name not in record or union initializer
     640 |         { .type = TRACE_FUNCTION_TYPE,
         |           ^
   kernel/trace/trace_fprobe.c:640:11: note: (near initialization for 'fentry_fields_array')
   In file included from kernel/trace/trace.h:17,
                    from kernel/trace/trace_dynevent.h:14,
                    from kernel/trace/trace_fprobe.c:16:
   include/linux/trace_events.h:279:29: error: initialization of 'struct trace_event_fields *' from incompatible pointer type 'const char *' [-Werror=incompatible-pointer-types]
     279 | #define TRACE_FUNCTION_TYPE ((const char *)~0UL)
         |                             ^
   kernel/trace/trace_fprobe.c:640:19: note: in expansion of macro 'TRACE_FUNCTION_TYPE'
     640 |         { .type = TRACE_FUNCTION_TYPE,
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/trace_events.h:279:29: note: (near initialization for 'fentry_fields_array')
     279 | #define TRACE_FUNCTION_TYPE ((const char *)~0UL)
         |                             ^
   kernel/trace/trace_fprobe.c:640:19: note: in expansion of macro 'TRACE_FUNCTION_TYPE'
     640 |         { .type = TRACE_FUNCTION_TYPE,
         |                   ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:641:11: error: field name not in record or union initializer
     641 |           .define_fields = fentry_event_define_fields },
         |           ^
   kernel/trace/trace_fprobe.c:641:11: note: (near initialization for 'fentry_fields_array')
   kernel/trace/trace_fprobe.c:641:28: error: 'fentry_event_define_fields' undeclared (first use in this function)
     641 |           .define_fields = fentry_event_define_fields },
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:641:28: warning: excess elements in scalar initializer
   kernel/trace/trace_fprobe.c:641:28: note: (near initialization for 'fentry_fields_array')
   kernel/trace/trace_fprobe.c:642:9: warning: braces around scalar initializer
     642 |         {}
         |         ^
   kernel/trace/trace_fprobe.c:642:9: note: (near initialization for 'fentry_fields_array')
   kernel/trace/trace_fprobe.c:642:9: warning: excess elements in scalar initializer
   kernel/trace/trace_fprobe.c:642:9: note: (near initialization for 'fentry_fields_array')
   kernel/trace/trace_fprobe.c:645:34: error: storage class specified for parameter 'fexit_fields_array'
     645 | static struct trace_event_fields fexit_fields_array[] = {
         |                                  ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:645:15: error: parameter 'fexit_fields_array' is initialized
     645 | static struct trace_event_fields fexit_fields_array[] = {
         |               ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:645:57: error: variable-sized object may not be initialized except with an empty initializer
     645 | static struct trace_event_fields fexit_fields_array[] = {
         |                                                         ^
   kernel/trace/trace_fprobe.c:646:9: warning: braces around scalar initializer
     646 |         { .type = TRACE_FUNCTION_TYPE,
         |         ^
   kernel/trace/trace_fprobe.c:646:9: note: (near initialization for 'fexit_fields_array')
   kernel/trace/trace_fprobe.c:646:11: error: field name not in record or union initializer
     646 |         { .type = TRACE_FUNCTION_TYPE,
         |           ^
   kernel/trace/trace_fprobe.c:646:11: note: (near initialization for 'fexit_fields_array')
   include/linux/trace_events.h:279:29: error: initialization of 'struct trace_event_fields *' from incompatible pointer type 'const char *' [-Werror=incompatible-pointer-types]
     279 | #define TRACE_FUNCTION_TYPE ((const char *)~0UL)
         |                             ^
   kernel/trace/trace_fprobe.c:646:19: note: in expansion of macro 'TRACE_FUNCTION_TYPE'
     646 |         { .type = TRACE_FUNCTION_TYPE,
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/trace_events.h:279:29: note: (near initialization for 'fexit_fields_array')
     279 | #define TRACE_FUNCTION_TYPE ((const char *)~0UL)
         |                             ^
   kernel/trace/trace_fprobe.c:646:19: note: in expansion of macro 'TRACE_FUNCTION_TYPE'
     646 |         { .type = TRACE_FUNCTION_TYPE,
         |                   ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:647:11: error: field name not in record or union initializer
     647 |           .define_fields = fexit_event_define_fields },
         |           ^
   kernel/trace/trace_fprobe.c:647:11: note: (near initialization for 'fexit_fields_array')
   kernel/trace/trace_fprobe.c:647:28: error: 'fexit_event_define_fields' undeclared (first use in this function)
     647 |           .define_fields = fexit_event_define_fields },
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:647:28: warning: excess elements in scalar initializer
   kernel/trace/trace_fprobe.c:647:28: note: (near initialization for 'fexit_fields_array')
   kernel/trace/trace_fprobe.c:648:9: warning: braces around scalar initializer
     648 |         {}
         |         ^
   kernel/trace/trace_fprobe.c:648:9: note: (near initialization for 'fexit_fields_array')
   kernel/trace/trace_fprobe.c:648:9: warning: excess elements in scalar initializer
   kernel/trace/trace_fprobe.c:648:9: note: (near initialization for 'fexit_fields_array')
   kernel/trace/trace_fprobe.c:651:12: error: storage class specified for parameter 'fprobe_register'
     651 | static int fprobe_register(struct trace_event_call *event,
         |            ^~~~~~~~~~~~~~~
   kernel/trace/trace_fprobe.c:655:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     655 | {
         | ^
   kernel/trace/trace_fprobe.c:671:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token


vim +313 kernel/trace/trace_fprobe.c

334e5519c37570 Masami Hiramatsu (Google  2023-06-06  309) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  310) static void
334e5519c37570 Masami Hiramatsu (Google  2023-06-06 @311) fexit_perf_func(struct trace_fprobe *tf, unsigned long entry_ip,
5a634383954631 Masami Hiramatsu (Google  2023-09-24  312) 		unsigned long ret_ip, struct ftrace_regs *fregs)
25f00e40ce7953 Masami Hiramatsu (Google  2024-03-04 @313) 		void *entry_data)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  314) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  315) 	struct trace_event_call *call = trace_probe_event_call(&tf->tp);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  316) 	struct fexit_trace_entry_head *entry;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  317) 	struct hlist_head *head;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  318) 	int size, __size, dsize;
5a634383954631 Masami Hiramatsu (Google  2023-09-24  319) 	struct pt_regs *regs;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  320) 	int rctx;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  321) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  322) 	head = this_cpu_ptr(call->perf_events);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  323) 	if (hlist_empty(head))
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  324) 		return;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  325) 
5a634383954631 Masami Hiramatsu (Google  2023-09-24  326) 	dsize = __get_data_size(&tf->tp, fregs, entry_data);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  327) 	__size = sizeof(*entry) + tf->tp.size + dsize;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  328) 	size = ALIGN(__size + sizeof(u32), sizeof(u64));
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  329) 	size -= sizeof(u32);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  330) 
5a634383954631 Masami Hiramatsu (Google  2023-09-24  331) 	entry = perf_trace_buf_alloc(size, &regs, &rctx);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  332) 	if (!entry)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  333) 		return;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  334) 
5a634383954631 Masami Hiramatsu (Google  2023-09-24  335) 	regs = ftrace_fill_perf_regs(fregs, regs);
5a634383954631 Masami Hiramatsu (Google  2023-09-24  336) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  337) 	entry->func = entry_ip;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  338) 	entry->ret_ip = ret_ip;
5a634383954631 Masami Hiramatsu (Google  2023-09-24  339) 	store_trace_args(&entry[1], &tf->tp, fregs, entry_data, sizeof(*entry), dsize);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  340) 	perf_trace_buf_submit(entry, size, rctx, call->event.type, 1, regs,
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  341) 			      head, NULL);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  342) }
334e5519c37570 Masami Hiramatsu (Google  2023-06-06 @343) NOKPROBE_SYMBOL(fexit_perf_func);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  344) #endif	/* CONFIG_PERF_EVENTS */
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  345) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  346) static int fentry_dispatcher(struct fprobe *fp, unsigned long entry_ip,
836402f8f4641f Masami Hiramatsu (Google  2023-11-03  347) 			     unsigned long ret_ip, struct ftrace_regs *fregs,
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  348) 			     void *entry_data)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06 @349) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  350) 	struct trace_fprobe *tf = container_of(fp, struct trace_fprobe, fp);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  351) 	int ret = 0;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  352) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  353) 	if (trace_probe_test_flag(&tf->tp, TP_FLAG_TRACE))
5a634383954631 Masami Hiramatsu (Google  2023-09-24  354) 		fentry_trace_func(tf, entry_ip, fregs);
5a634383954631 Masami Hiramatsu (Google  2023-09-24  355) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  356) #ifdef CONFIG_PERF_EVENTS
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  357) 	if (trace_probe_test_flag(&tf->tp, TP_FLAG_PROFILE))
5a634383954631 Masami Hiramatsu (Google  2023-09-24  358) 		ret = fentry_perf_func(tf, entry_ip, fregs);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  359) #endif
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  360) 	return ret;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  361) }
334e5519c37570 Masami Hiramatsu (Google  2023-06-06 @362) NOKPROBE_SYMBOL(fentry_dispatcher);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  363) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  364) static void fexit_dispatcher(struct fprobe *fp, unsigned long entry_ip,
acbe9991cea14b Masami Hiramatsu (Google  2023-11-03  365) 			     unsigned long ret_ip, struct ftrace_regs *fregs,
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  366) 			     void *entry_data)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  367) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  368) 	struct trace_fprobe *tf = container_of(fp, struct trace_fprobe, fp);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  369) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  370) 	if (trace_probe_test_flag(&tf->tp, TP_FLAG_TRACE))
5a634383954631 Masami Hiramatsu (Google  2023-09-24  371) 		fexit_trace_func(tf, entry_ip, ret_ip, fregs, entry_data);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  372) #ifdef CONFIG_PERF_EVENTS
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  373) 	if (trace_probe_test_flag(&tf->tp, TP_FLAG_PROFILE))
5a634383954631 Masami Hiramatsu (Google  2023-09-24  374) 		fexit_perf_func(tf, entry_ip, ret_ip, fregs, entry_data);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  375) #endif
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  376) }
334e5519c37570 Masami Hiramatsu (Google  2023-06-06 @377) NOKPROBE_SYMBOL(fexit_dispatcher);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  378) 

:::::: The code at line 313 was first introduced by commit
:::::: 25f00e40ce7953db197af3a59233711d154c9d80 tracing/probes: Support $argN in return probe (kprobe and fprobe)

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Masami Hiramatsu (Google) <mhiramat@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
