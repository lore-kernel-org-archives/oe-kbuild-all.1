Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BAF39C653
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731311; cv=none; b=mo0HAAHYDEEix/Gt2ZQnkE8JqVcIee3Hzy7W4FmZntPVlICgWtfjkUkGYc5rMP3lF4vohO003GbbEKWUwtSNfW0mDEjGI81HJ5SG141Igfw2CJjimgca8nrEyJWqTJqBpOrukjHQY5FTFj459tbWBE7YlODR62f+6hgnEk7iQGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731311; c=relaxed/simple;
	bh=cA0ZqrjKU4Pvi23sNS+mvoCif4u5QQMxWfvijavxiJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NUT2fbpUZ/p7OUQiL+F2RJbmcQOwZXXEoEagM6DkO8zONbbFCgmOkXuzJIZHO0bb6klEAag90nsA06NQC+9FEoQsJpQDSDTca5p1whx9FAMvckAd9ihqAEqUHpNLZXMdos/JAawQAqcwZHlQe/VLDPnzcDGTODWXtXhSWlS2g3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nb0ESeLb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nb0ESeLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772731308; x=1804267308;
  h=date:from:to:cc:subject:message-id;
  bh=cA0ZqrjKU4Pvi23sNS+mvoCif4u5QQMxWfvijavxiJU=;
  b=nb0ESeLbimbs17ByrkO+wr0I0UrWP8no/4WYsG8EM/K66ge7PR6M+Qph
   hc0q+OtsOP9DvegH0udFB5f/IXgXYkd1phBvEGkSdE6z7BO0ly6mM53tL
   TBxo5oGbcYLN+qvzqfmrDCyFw/M0Mr+wfjNdj1IAjxI18sEPEEbxOS8lu
   vVfa0z5WFwnmjO6LH9tRYmnjE9KzO0JAAR3WIvoanFEPdrbQ0QyqC5fuh
   8XbF3cg1S/7CorwhxgwoYa53y5p4N+z9iPitHgLtWpeEcAMeWdu9rxla1
   8kyJLdqmlscsUhw4dXpeU+YMmE0MY84bcLflYO0NntbQ6B7BHibAJ77Td
   Q==;
X-CSE-ConnectionGUID: 6wOA55HRSi2U/bzcyEEAjg==
X-CSE-MsgGUID: zmMu6j0vSySCKXJNXG5eCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85299450"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="85299450"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:21:48 -0800
X-CSE-ConnectionGUID: wQA2NiI5QamUj9/B5B9f6A==
X-CSE-MsgGUID: SiAVL41wTWagUCFs1gNEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218728936"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2026 09:21:46 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyCON-0000000022H-2phV;
	Thu, 05 Mar 2026 17:21:43 +0000
Date: Thu, 05 Mar 2026 18:21:35 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-05-5 87/88]
 include/trace/events/asoc.h:31:114: error: invalid use of undefined type
 'struct snd_soc_component'
Message-ID: <202603051825.sxMPQCVv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-05-5
head:   bfb54f3735c9a8e0faed8d460d5051dd1a1eda2d
commit: 4245653edad7843d44522649c3af92184db6d306 [87/88] move component
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260305/202603051825.sxMPQCVv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051825.sxMPQCVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051825.sxMPQCVv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/asoc.h:280,
                    from sound/soc/soc-core.c:43:
   include/trace/events/asoc.h: In function 'trace_event_get_offsets_snd_soc_dapm':
>> include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/linux/fortify-string.h:256:31: note: in expansion of macro '__is_constexpr'
     256 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
         |                               ^~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:60:21: note: in expansion of macro 'strlen'
      60 |                     strlen(__string_src(src)) + 1)                      \
         |                     ^~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
>> include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:60:21: note: in expansion of macro 'strlen'
      60 |                     strlen(__string_src(src)) + 1)                      \
         |                     ^~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
>> include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:60:21: note: in expansion of macro 'strlen'
      60 |                     strlen(__string_src(src)) + 1)                      \
         |                     ^~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
>> include/linux/fortify-string.h:256:9: error: first argument to '__builtin_choose_expr' not a constant
     256 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:59:29: note: in expansion of macro '__dynamic_array'
      59 | #define __string(item, src) __dynamic_array(char, item,                 \
         |                             ^~~~~~~~~~~~~~~
   include/trace/stages/stage5_get_offsets.h:60:21: note: in expansion of macro 'strlen'
      60 |                     strlen(__string_src(src)) + 1)                      \
         |                     ^~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
>> include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                                                                                                                  ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/events/asoc.h:31:17: note: in expansion of macro '__string'
      31 |                 __string(       comp_name,      snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
         |                 ^~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from sound/soc/soc-core.c:20:
   sound/soc/soc-core.c: In function 'dai_list_show':
>> include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct snd_soc_component'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/build_bug.h:5:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct snd_soc_component'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/list.h:773:26: error: invalid use of undefined type 'struct snd_soc_component'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:783:15: note: in expansion of macro 'list_entry_is_head'
     783 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct snd_soc_component'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct snd_soc_component'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:132:9: note: in expansion of macro 'for_each_component'
     132 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c: In function 'component_list_show':
>> include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct snd_soc_component'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct snd_soc_component'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/list.h:773:26: error: invalid use of undefined type 'struct snd_soc_component'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:783:15: note: in expansion of macro 'list_entry_is_head'
     783 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct snd_soc_component'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct snd_soc_component'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:145:9: note: in expansion of macro 'for_each_component'
     145 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> sound/soc/soc-core.c:146:48: error: invalid use of undefined type 'struct snd_soc_component'
     146 |                 seq_printf(m, "%s\n", component->name);
         |                                                ^~
   sound/soc/soc-core.c: In function 'snd_soc_rtdcom_lookup':
   sound/soc/soc-core.c:227:55: error: invalid use of undefined type 'struct snd_soc_component'
     227 |                 const char *component_name = component->driver->name;
         |                                                       ^~
   sound/soc/soc-core.c: In function 'snd_soc_lookup_component_by_name':
>> include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct snd_soc_component'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct snd_soc_component'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/list.h:773:26: error: invalid use of undefined type 'struct snd_soc_component'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:783:15: note: in expansion of macro 'list_entry_is_head'
     783 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct snd_soc_component'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct snd_soc_component'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   sound/soc/soc.h:44:9: note: in expansion of macro 'list_for_each_entry'
      44 |         list_for_each_entry(component, soc_component_get_list_head(), list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-core.c:262:9: note: in expansion of macro 'for_each_component'
     262 |         for_each_component(component)
..


vim +31 include/trace/events/asoc.h

a8b1d34f3ee1bc Mark Brown              2010-11-03  24  
6ef46a69ec32fe Luca Ceresoli           2024-03-06  25  	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
84e909303dbd3c Mark Brown              2010-11-04  26  
6ef46a69ec32fe Luca Ceresoli           2024-03-06  27  	TP_ARGS(dapm, val),
84e909303dbd3c Mark Brown              2010-11-04  28  
84e909303dbd3c Mark Brown              2010-11-04  29  	TP_STRUCT__entry(
8855eb7d29400f Kuninori Morimoto       2025-11-11  30  		__string(	card_name,	snd_soc_dapm_to_card(dapm)->name)
8855eb7d29400f Kuninori Morimoto       2025-11-11 @31  		__string(	comp_name,	snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
84e909303dbd3c Mark Brown              2010-11-04  32  		__field(	int,		val)
84e909303dbd3c Mark Brown              2010-11-04  33  	),
84e909303dbd3c Mark Brown              2010-11-04  34  
84e909303dbd3c Mark Brown              2010-11-04  35  	TP_fast_assign(
2c92ca849fcc6e Steven Rostedt (Google  2024-05-16  36) 		__assign_str(card_name);
2c92ca849fcc6e Steven Rostedt (Google  2024-05-16  37) 		__assign_str(comp_name);
84e909303dbd3c Mark Brown              2010-11-04  38  		__entry->val = val;
84e909303dbd3c Mark Brown              2010-11-04  39  	),
84e909303dbd3c Mark Brown              2010-11-04  40  
6ef46a69ec32fe Luca Ceresoli           2024-03-06  41  	TP_printk("card=%s component=%s val=%d",
6ef46a69ec32fe Luca Ceresoli           2024-03-06  42  		  __get_str(card_name), __get_str(comp_name), (int)__entry->val)
84e909303dbd3c Mark Brown              2010-11-04  43  );
84e909303dbd3c Mark Brown              2010-11-04  44  

:::::: The code at line 31 was first introduced by commit
:::::: 8855eb7d29400fb7b2882da33725db2801c410e4 ASoC: asoc.h: convert to snd_soc_dapm_xxx()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
