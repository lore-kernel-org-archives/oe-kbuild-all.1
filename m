Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D13A452C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899117; cv=none; b=arpQkYrMTSdCFv/8Fep6HbcoIFhgT+1sOgPXOaPfJf3n2Yk7G1Q47g3PPoo4dOO28eyLMG03aG58OdxYH/JMizoYxTZsPV68hPvi7gmz9MhMcIIVLoA0XNRvZ2p53b+i+ZZ/Z1FhyFYIOLtfEzHEmMEgo3mHr1PvbX/Ro4K2+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899117; c=relaxed/simple;
	bh=hxKrOiXxLSXlbGKaZ2Q3XpvMOvRWSJtn5zTqPr8DN74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKn8S1tIUbpAaLx0gqgMTSePDIPURVRa+HY5YoFUQxx3YTe/F9RHfWLDGSiCs6e566V3PaJqAyJpYxscAwIPGtkSNkDXfUIj59ih3W+aDR342LlnH6OU3ouqF9tP5dRZ0BXZIOd+FtNYUA+VSKKeRInZSwGg1SKeMQaBS6o7duc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aoy+GX80; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aoy+GX80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772899114; x=1804435114;
  h=date:from:to:cc:subject:message-id;
  bh=hxKrOiXxLSXlbGKaZ2Q3XpvMOvRWSJtn5zTqPr8DN74=;
  b=Aoy+GX80hgK9eEFXsH14NsBTZ88Vjn594i36pzLIA0vI1AOhPY+nDvxO
   Ma/SiQsQywvw2slPVf+G82DhcXm/xYeo8FidHBwZpHzMowPLLkf02g6YT
   6I+4ChzG4s/afV1T7661jkgPdoMA0uenYfAEqH50SgjKJPmvqYMDpfapy
   l3b1gtRp61wy9I2y7yFH/xTqcw3Tx7lPzBNcqcY1CvqBerodHpkp7mWKw
   Ysi5Zhfd6+EIZWhCi8RUec7HSq36q5CfebZWN2MQ/ZV1wcb0wSwII3M33
   evtdd5qqRl58gXMbi2BPMsZD7/mhigU/S1VIIC6yq6s4QOO7iBkuJbccP
   w==;
X-CSE-ConnectionGUID: l1t03YzbRiubzyYiGHBodw==
X-CSE-MsgGUID: l0eYrOvPTmmnraGu2dvW+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="91557557"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="91557557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 07:58:31 -0800
X-CSE-ConnectionGUID: HnSuYsYLSN2nH/1CW+2Tqg==
X-CSE-MsgGUID: OxRWJPMgSkWZgKS9RbQbpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="218522876"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2026 07:58:29 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyu2s-0000000028V-2Qae;
	Sat, 07 Mar 2026 15:58:26 +0000
Date: Sat, 07 Mar 2026 23:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-05-5 88/88]
 sound/soc/soc-dapm.c:988:1: warning: control reaches end of non-void function
Message-ID: <202603072347.XCJZtOY3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-05-5
head:   bfb54f3735c9a8e0faed8d460d5051dd1a1eda2d
commit: 4245653edad7843d44522649c3af92184db6d306 [88/88] move component
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260307/202603072347.XCJZtOY3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603072347.XCJZtOY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603072347.XCJZtOY3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/list.h:773:37: note: in definition of macro 'list_entry_is_head'
     773 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   include/sound/soc.h:1115:9: note: in expansion of macro 'list_for_each_entry'
    1115 |         list_for_each_entry(w, &card->widgets, list)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:2758:9: note: in expansion of macro 'for_each_card_widgets'
    2758 |         for_each_card_widgets(component->card, w) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_widget_name_cmp':
   sound/soc/soc-dapm.c:3096:35: error: invalid use of undefined type 'struct snd_soc_component'
    3096 |         if (component && component->name_prefix)
         |                                   ^~
   In file included from include/linux/build_bug.h:5:
   sound/soc/soc-dapm.c:3097:42: error: invalid use of undefined type 'struct snd_soc_component'
    3097 |                 wname += strlen(component->name_prefix) + 1; /* plus space */
         |                                          ^~
   include/linux/compiler.h:326:55: note: in definition of macro '__is_constexpr'
     326 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   sound/soc/soc-dapm.c:3097:26: note: in expansion of macro 'strlen'
    3097 |                 wname += strlen(component->name_prefix) + 1; /* plus space */
         |                          ^~~~~~
   In file included from include/linux/string.h:386,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18:
   sound/soc/soc-dapm.c:3097:42: error: invalid use of undefined type 'struct snd_soc_component'
    3097 |                 wname += strlen(component->name_prefix) + 1; /* plus space */
         |                                          ^~
   include/linux/fortify-string.h:257:34: note: in definition of macro 'strlen'
     257 |                 __builtin_strlen(p), __fortify_strlen(p))
         |                                  ^
   sound/soc/soc-dapm.c:3097:42: error: invalid use of undefined type 'struct snd_soc_component'
    3097 |                 wname += strlen(component->name_prefix) + 1; /* plus space */
         |                                          ^~
   include/linux/fortify-string.h:257:55: note: in definition of macro 'strlen'
     257 |                 __builtin_strlen(p), __fortify_strlen(p))
         |                                                       ^
   include/linux/fortify-string.h:256:9: error: first argument to '__builtin_choose_expr' not a constant
     256 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:3097:26: note: in expansion of macro 'strlen'
    3097 |                 wname += strlen(component->name_prefix) + 1; /* plus space */
         |                          ^~~~~~
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/um/asm/barrier.h:6,
                    from include/linux/list.h:11:
   sound/soc/soc-dapm.c: In function 'dapm_connect_dai_routes':
   sound/soc/soc-dapm.c:4481:30: error: invalid use of undefined type 'struct snd_soc_component'
    4481 |                 src_component->name, src->name,
         |                              ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:4480:9: note: in expansion of macro 'dev_dbg'
    4480 |         dev_dbg(dev, "connected DAI link %s:%s -> %s:%s\n",
         |         ^~~~~~~
   sound/soc/soc-dapm.c:4482:31: error: invalid use of undefined type 'struct snd_soc_component'
    4482 |                 sink_component->name, sink->name);
         |                               ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:4480:9: note: in expansion of macro 'dev_dbg'
    4480 |         dev_dbg(dev, "connected DAI link %s:%s -> %s:%s\n",
         |         ^~~~~~~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_init':
   sound/soc/soc-dapm.c:4894:52: error: invalid use of undefined type 'struct snd_soc_component'
    4894 |                 dapm->idle_bias         = component->driver->idle_bias_on;
         |                                                    ^~
   sound/soc/soc-dapm.c: In function 'dapm_prefix':
>> sound/soc/soc-dapm.c:988:1: warning: control reaches end of non-void function [-Wreturn-type]
     988 | }
         | ^
--
   sound/soc/soc-utils.c: In function 'dummy_dma_open':
   sound/soc/soc-utils.c:153:30: error: invalid use of undefined type 'struct snd_soc_component'
     153 |                 if (component->driver == &dummy_platform)
         |                              ^~
   sound/soc/soc-utils.c: In function 'snd_soc_component_is_dummy':
   sound/soc/soc-utils.c:247:27: error: invalid use of undefined type 'struct snd_soc_component'
     247 |         return ((component->driver == &dummy_platform) ||
         |                           ^~
   sound/soc/soc-utils.c:248:27: error: invalid use of undefined type 'struct snd_soc_component'
     248 |                 (component->driver == &dummy_codec));
         |                           ^~
>> sound/soc/soc-utils.c:249:1: warning: control reaches end of non-void function [-Wreturn-type]
     249 | }
         | ^
--
   sound/soc/soc-ops.c: In function 'snd_soc_bytes_info':
   sound/soc/soc-ops.c:477:52: error: invalid use of undefined type 'struct snd_soc_component'
     477 |         uinfo->count = params->num_regs * component->val_bytes;
         |                                                    ^~
   sound/soc/soc-ops.c: In function 'snd_soc_bytes_get':
   sound/soc/soc-ops.c:490:22: error: invalid use of undefined type 'struct snd_soc_component'
     490 |         if (component->regmap)
         |                      ^~
   sound/soc/soc-ops.c:491:48: error: invalid use of undefined type 'struct snd_soc_component'
     491 |                 ret = regmap_raw_read(component->regmap, params->base,
         |                                                ^~
   sound/soc/soc-ops.c:493:67: error: invalid use of undefined type 'struct snd_soc_component'
     493 |                                       params->num_regs * component->val_bytes);
         |                                                                   ^~
   sound/soc/soc-ops.c:499:34: error: invalid use of undefined type 'struct snd_soc_component'
     499 |                 switch (component->val_bytes) {
         |                                  ^~
   sound/soc/soc-ops.c: In function 'snd_soc_bytes_put':
   sound/soc/soc-ops.c:528:23: error: invalid use of undefined type 'struct snd_soc_component'
     528 |         if (!component->regmap || !params->num_regs)
         |                       ^~
   sound/soc/soc-ops.c:531:43: error: invalid use of undefined type 'struct snd_soc_component'
     531 |         len = params->num_regs * component->val_bytes;
         |                                           ^~
   sound/soc/soc-ops.c:544:44: error: invalid use of undefined type 'struct snd_soc_component'
     544 |                 ret = regmap_read(component->regmap, params->base, &val);
         |                                            ^~
   sound/soc/soc-ops.c:550:34: error: invalid use of undefined type 'struct snd_soc_component'
     550 |                 switch (component->val_bytes) {
         |                                  ^~
   sound/soc/soc-ops.c:557:57: error: invalid use of undefined type 'struct snd_soc_component'
     557 |                         ret = regmap_parse_val(component->regmap, &mask, &mask);
         |                                                         ^~
   sound/soc/soc-ops.c:563:57: error: invalid use of undefined type 'struct snd_soc_component'
     563 |                         ret = regmap_parse_val(component->regmap, &val, &val);
         |                                                         ^~
   sound/soc/soc-ops.c:571:57: error: invalid use of undefined type 'struct snd_soc_component'
     571 |                         ret = regmap_parse_val(component->regmap, &mask, &mask);
         |                                                         ^~
   sound/soc/soc-ops.c:577:57: error: invalid use of undefined type 'struct snd_soc_component'
     577 |                         ret = regmap_parse_val(component->regmap, &val, &val);
         |                                                         ^~
   sound/soc/soc-ops.c:588:42: error: invalid use of undefined type 'struct snd_soc_component'
     588 |         return regmap_raw_write(component->regmap, params->base, data, len);
         |                                          ^~
   sound/soc/soc-ops.c: In function 'snd_soc_get_xr_sx':
   sound/soc/soc-ops.c:675:43: error: invalid use of undefined type 'struct snd_soc_component'
     675 |         unsigned int regwshift = component->val_bytes * BITS_PER_BYTE;
         |                                           ^~
   sound/soc/soc-ops.c: In function 'snd_soc_put_xr_sx':
   sound/soc/soc-ops.c:719:43: error: invalid use of undefined type 'struct snd_soc_component'
     719 |         unsigned int regwshift = component->val_bytes * BITS_PER_BYTE;
         |                                           ^~
   sound/soc/soc-ops.c: In function 'snd_soc_bytes_put':
>> sound/soc/soc-ops.c:589:1: warning: control reaches end of non-void function [-Wreturn-type]
     589 | }
         | ^
--
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
   sound/soc/soc-topology.c:2170:64: error: invalid use of undefined type 'struct snd_soc_component'
    2170 |                 list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
         |                                                                ^~
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
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc-topology.c:2170:17: note: in expansion of macro 'list_for_each_entry_safe'
    2170 |                 list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-topology.c:2170:64: error: invalid use of undefined type 'struct snd_soc_component'
    2170 |                 list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
         |                                                                ^~
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
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc-topology.c:2170:17: note: in expansion of macro 'list_for_each_entry_safe'
    2170 |                 list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/soc-topology.c:2170:17: note: in expansion of macro 'list_for_each_entry_safe'
    2170 |                 list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/soc-topology.c:25:
   sound/soc/soc-topology.c:2170:64: error: invalid use of undefined type 'struct snd_soc_component'
    2170 |                 list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
         |                                                                ^~
   include/linux/list.h:773:37: note: in definition of macro 'list_entry_is_head'
     773 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   sound/soc/soc-topology.c:2170:17: note: in expansion of macro 'list_for_each_entry_safe'
    2170 |                 list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/sound/soc.h:15,
                    from sound/soc/soc-topology.c:28:
   sound/soc/soc-topology.c:2199:45: error: invalid use of undefined type 'struct snd_soc_component'
    2199 |                                 dev_err(comp->dev, "ASoC: invalid component type %d for removal\n",
         |                                             ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/soc-topology.c:2199:33: note: in expansion of macro 'dev_err'
    2199 |                                 dev_err(comp->dev, "ASoC: invalid component type %d for removal\n",
         |                                 ^~~~~~~
   sound/soc/soc-topology.c:2207:33: error: invalid use of undefined type 'struct snd_soc_component'
    2207 |         return !list_empty(&comp->dobj_list);
         |                                 ^~
   sound/soc/soc-topology.c: In function 'soc_tplg_add_kcontrol':
>> sound/soc/soc-topology.c:342:1: warning: control reaches end of non-void function [-Wreturn-type]
     342 | }
         | ^
   sound/soc/soc-topology.c: In function 'snd_soc_tplg_component_remove':
   sound/soc/soc-topology.c:2208:1: warning: control reaches end of non-void function [-Wreturn-type]
    2208 | }
         | ^
--
   In file included from sound/soc/soc-generic-dmaengine-pcm.c:16:
   include/sound/dmaengine_pcm.h:178:34: error: field 'component' has incomplete type
     178 |         struct snd_soc_component component;
         |                                  ^~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from sound/soc/soc-generic-dmaengine-pcm.c:6:
   include/sound/dmaengine_pcm.h: In function 'soc_component_to_pcm':
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
   include/sound/dmaengine_pcm.h:184:16: note: in expansion of macro 'container_of'
     184 |         return container_of(p, struct dmaengine_pcm, component);
         |                ^~~~~~~~~~~~
   sound/soc/soc-generic-dmaengine-pcm.c: In function 'dmaengine_pcm_new':
   sound/soc/soc-generic-dmaengine-pcm.c:224:39: error: invalid use of undefined type 'struct snd_soc_component'
     224 |         struct device *dev = component->dev;
         |                                       ^~
   In file included from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from sound/soc/soc-generic-dmaengine-pcm.c:8:
   sound/soc/soc-generic-dmaengine-pcm.c:254:42: error: invalid use of undefined type 'struct snd_soc_component'
     254 |                         dev_err(component->dev,
         |                                          ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/soc-generic-dmaengine-pcm.c:254:25: note: in expansion of macro 'dev_err'
     254 |                         dev_err(component->dev,
         |                         ^~~~~~~
   sound/soc/soc-generic-dmaengine-pcm.c: In function 'snd_dmaengine_pcm_unregister':
   sound/soc/soc-generic-dmaengine-pcm.c:499:62: error: invalid use of undefined type 'struct snd_soc_component'
     499 |         snd_soc_unregister_component_by_driver(dev, component->driver);
         |                                                              ^~
   include/sound/dmaengine_pcm.h: In function 'soc_component_to_pcm':
>> include/sound/dmaengine_pcm.h:185:1: warning: control reaches end of non-void function [-Wreturn-type]
     185 | }
         | ^
..


vim +988 sound/soc/soc-dapm.c

6c120e19fa5877 Liam Girdwood      2012-02-15  982  
af6d53db28e644 Kuninori Morimoto  2026-01-20  983  static const char *dapm_prefix(struct snd_soc_dapm_context *dapm)
94f99c875c109e Lars-Peter Clausen 2014-06-16  984  {
94f99c875c109e Lars-Peter Clausen 2014-06-16  985  	if (!dapm->component)
94f99c875c109e Lars-Peter Clausen 2014-06-16  986  		return NULL;
94f99c875c109e Lars-Peter Clausen 2014-06-16  987  	return dapm->component->name_prefix;
94f99c875c109e Lars-Peter Clausen 2014-06-16 @988  }
94f99c875c109e Lars-Peter Clausen 2014-06-16  989  

:::::: The code at line 988 was first introduced by commit
:::::: 94f99c875c109e51decf0d8c25ec2c946db20c56 ASoC: Move name_prefix from CODEC to component

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
