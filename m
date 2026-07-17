Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6A721ABB1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 00:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784248714; cv=none; b=uTGPrlHGpLXaA9w57dpovbEO9XsFZqfXs2VXUsuV2wkK2HmL28e2ph1Qcc9hYlOj9zXEl7KM/cQkPLlYFsPKF6Gku3unSY05KmGzhWcZV6ettTnAdtH6P+vQDESaroGLKsiUp/ZP3uYPzpOfsYvj3u2DUxBgkw4xORkjL+5rPGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784248714; c=relaxed/simple;
	bh=B3dd22bHozVn++Vim6sottwYHHs9uURFecGNm17zBu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NyMPFKV77mxQY56Lr8GNiYFjja4Obzqtukgjf4xyM4V45I6Devr/EWyfjjpzPiBH0ITsN4R9iGDs/eUBZOmOqre2JLrfkLPEvuVxBZvTNfEIUJfW4tKept8nHiOrSaJLA5JwWwAmgXiov6/qdktLQri5mtEpr6yS1OnEEcCHDMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iguMFUUQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iguMFUUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784248712; x=1815784712;
  h=date:from:to:cc:subject:message-id;
  bh=B3dd22bHozVn++Vim6sottwYHHs9uURFecGNm17zBu8=;
  b=iguMFUUQbe81aAAsK7eBRPehtdrQX7bksqeOHV1l5rgsfzpwUDyHz+o4
   97xHJJPmK4K/S8P6iXJChCJ9GgzPNN48lmhOCpPmeUVuXXtUaKqPrj0+s
   Et6gSoorfvpsIbvGVZI/2URNS5wkFR3HNDmJIC3U+jriVuTaJGYAXEO+m
   /VZyXMBiTpBu3nBRxRJKzIiCbQci1A7dsaV+gszqXxClW4bU07u9GtEML
   xCLeJGTrsoo4OuWkXaBkkP7dahCGAamRpaQRCXmFEqbZ0bJuWW+3chV4P
   3aWbIJUtl1tAJzhgQmSsVgGLFIO7mI4XSNeUIGSVpAnLXpnDBKqNrLy+P
   A==;
X-CSE-ConnectionGUID: 2ahVeCJhT8ybc2++2KJvyQ==
X-CSE-MsgGUID: elydfWXaSOiVwFPxGmfxkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85116968"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="85116968"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 17:38:32 -0700
X-CSE-ConnectionGUID: a3vOfs/wSvWneEJjq1P+4A==
X-CSE-MsgGUID: ajzGOZ59RiSw7fisNrlv7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="255492774"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Jul 2026 17:38:29 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkWax-000000005EV-0rhk;
	Fri, 17 Jul 2026 00:38:27 +0000
Date: Fri, 17 Jul 2026 02:38:24 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 308/311]
 include/trace/events/asoc.h:31:114: error: invalid use of undefined type
 'struct snd_soc_component'
Message-ID: <202607170259.sGa6je1A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e5cb44e887fc27a5ca0bcbcc673b11edb01174f8 [308/311] ASoC: soc-component: capsuling Component
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260717/202607170259.sGa6je1A-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607170259.sGa6je1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607170259.sGa6je1A-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   include/linux/fortify-string.h:208:31: note: in expansion of macro '__is_constexpr'
     208 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
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
>> include/linux/fortify-string.h:208:9: error: first argument to '__builtin_choose_expr' not a constant
     208 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
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
--
   sound/soc/codecs/cs35l56.c: In function 'cs35l56_set_fw_suffix':
>> sound/soc/codecs/cs35l56.c:1323:57: error: invalid use of undefined type 'struct snd_soc_component'
    1323 |         if (snd_soc_card_get_pci_ssid(cs35l56->component->card, &vendor, &device) < 0) {
         |                                                         ^~


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
