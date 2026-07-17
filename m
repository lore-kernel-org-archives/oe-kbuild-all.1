Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423B93B52E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288202; cv=none; b=pB06XWrDxo8t8yjr142oai5/83pzllqqc9UfcQ5b0L+8E7lS7GtgMXMmiDvT1ec6NEz/XA6vU/nvru2ch0EHAWVgqdp2Su6zbusCK/cgROU79npsN7EqSgZIddRQ215SGJ10XGH6a9m9VO7x1PWKKR5IszVKHxb83CK7lp8VsGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288202; c=relaxed/simple;
	bh=cRM+sy+cSoJhxIt8PRiwri6RVJaQki0NVu1xNof81QE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yoylm+CSL/1kElbldWzXRs5Td7tvHNlWAt8KnDhZhD9VEqFtuvf64X4ERmiKA8pKAknjE/8GweYNmTXRW5LRPyND9bF/0k+VXBZzwNC/CGM1ZvZakqD3PyS3vKW7XCLDi5Qbp4xVdDub3LWbdGZaPtNxozoDEjkgaJLR8L4Ky7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZC9ILggY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZC9ILggY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784288200; x=1815824200;
  h=date:from:to:cc:subject:message-id;
  bh=cRM+sy+cSoJhxIt8PRiwri6RVJaQki0NVu1xNof81QE=;
  b=ZC9ILggYTI5aSWmgg0mY3EE48CETqqx0Ry9gm7RDqw1opM0Tm4SX75An
   XALjJh3dYtV+oEoBF3kRB6d6KN31k9iVv9REGnUdZOIKVFTsBXo7zv1MQ
   bWqMn1CyH1nVZGxTEDMyHIVg5Zpq6cGghgo7vxiIZ36QdvWpqmlglnShV
   l/WM+JY4DGn7JtArWoXg6XYJDbcFUSC4SUT0SSIlQlixDsvy+aZEV1v9w
   58Mq4hq+5BKLKqyG52A/VC+6lKp5qtrw2Kq29A6RA0yDZfcep+8mLtHU6
   OUKeku/tB0HXeDU5SG4h/XxX7a3ABlliU8yGwrWL1m/Wdj7qcxR/S836u
   Q==;
X-CSE-ConnectionGUID: NtF5Dd5xTGOP2PrgTxLr/A==
X-CSE-MsgGUID: +85oahb6QGyTLxclk93OOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85156826"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85156826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 04:36:39 -0700
X-CSE-ConnectionGUID: 9Efn/AYrS1yXwSU5Xpdfdw==
X-CSE-MsgGUID: e4axREzISnCVa8d2qsyUgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="258757590"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jul 2026 04:36:37 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkgrq-000000005VF-3gqF;
	Fri, 17 Jul 2026 11:36:34 +0000
Date: Fri, 17 Jul 2026 13:36:23 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 include/trace/events/asoc.h:30:75: error: invalid use of undefined type
 'struct snd_soc_card'
Message-ID: <202607171339.O15rORJY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e51d2e02d8d4c974132f00eec9d2215a476084f0 [311/311] ASoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260717/202607171339.O15rORJY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171339.O15rORJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171339.O15rORJY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/asoc.h:280,
                    from sound/soc/soc-core.c:43:
   include/trace/events/asoc.h: In function 'trace_event_get_offsets_snd_soc_dapm':
>> include/trace/events/asoc.h:30:75: error: invalid use of undefined type 'struct snd_soc_card'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                                                                           ^~
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
   include/trace/events/asoc.h:30:17: note: in expansion of macro '__string'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                 ^~~~~~~~
>> include/trace/events/asoc.h:30:75: error: invalid use of undefined type 'struct snd_soc_card'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                                                                           ^~
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
   include/trace/events/asoc.h:30:17: note: in expansion of macro '__string'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                 ^~~~~~~~
>> include/trace/events/asoc.h:30:75: error: invalid use of undefined type 'struct snd_soc_card'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                                                                           ^~
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
   include/trace/events/asoc.h:30:17: note: in expansion of macro '__string'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                 ^~~~~~~~
   include/linux/fortify-string.h:208:9: error: first argument to '__builtin_choose_expr' not a constant
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
   include/trace/events/asoc.h:30:17: note: in expansion of macro '__string'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                 ^~~~~~~~
>> include/trace/events/asoc.h:30:75: error: invalid use of undefined type 'struct snd_soc_card'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                                                                           ^~
   include/trace/trace_events.h:285:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     285 |         tstruct;                                                        \
         |         ^~~~~~~
   include/trace/events/asoc.h:29:9: note: in expansion of macro 'TP_STRUCT__entry'
      29 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/events/asoc.h:30:17: note: in expansion of macro '__string'
      30 |                 __string(       card_name,      snd_soc_dapm_to_card(dapm)->name)
         |                 ^~~~~~~~
   include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
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
   include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
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
   include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
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
   include/linux/fortify-string.h:208:9: error: first argument to '__builtin_choose_expr' not a constant
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
   include/trace/events/asoc.h:31:114: error: invalid use of undefined type 'struct snd_soc_component'
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
   include/trace/events/asoc.h: In function 'trace_event_get_offsets_snd_soc_dapm_basic':
   include/trace/events/asoc.h:68:45: error: invalid use of undefined type 'struct snd_soc_card'
--
   sound/soc/sof/ipc4-topology.c: In function 'sof_ipc4_update_card_components_string':
>> sound/soc/sof/ipc4-topology.c:613:17: error: invalid use of undefined type 'struct snd_soc_card'
     613 |         if (card->components) {
         |                 ^~
   sound/soc/sof/ipc4-topology.c:614:39: error: invalid use of undefined type 'struct snd_soc_card'
     614 |                 const char *tmp = card->components;
         |                                       ^~
   sound/soc/sof/ipc4-topology.c:616:32: error: invalid use of undefined type 'struct snd_soc_card'
     616 |                 if (strstr(card->components, pt_marker))
         |                                ^~
   sound/soc/sof/ipc4-topology.c:617:78: error: invalid use of undefined type 'struct snd_soc_card'
     617 |                         snd_soc_card_set_components(card, devm_kasprintf(card->dev, GFP_KERNEL,
         |                                                                              ^~
   sound/soc/sof/ipc4-topology.c:622:78: error: invalid use of undefined type 'struct snd_soc_card'
     622 |                         snd_soc_card_set_components(card, devm_kasprintf(card->dev, GFP_KERNEL,
         |                                                                              ^~
   sound/soc/sof/ipc4-topology.c:630:70: error: invalid use of undefined type 'struct snd_soc_card'
     630 |                 snd_soc_card_set_components(card, devm_kasprintf(card->dev, GFP_KERNEL,
         |                                                                      ^~
--
   sound/soc/amd/vangogh/acp5x-mach.c: In function 'acp5x_probe':
   sound/soc/amd/vangogh/acp5x-mach.c:479:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     479 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
>> sound/soc/amd/vangogh/acp5x-mach.c:483:83: error: invalid use of undefined type 'struct snd_soc_card'
     483 |                 return dev_err_probe(dev, ret, "Register card (%s) failed\n", card->name);
         |                                                                                   ^~
--
   sound/soc/amd/yc/acp6x-mach.c: In function 'acp6x_probe':
>> sound/soc/amd/yc/acp6x-mach.c:878:37: error: invalid use of undefined type 'struct snd_soc_card'
     878 |                                 card->name);
         |                                     ^~
--
   sound/soc/intel/boards/sof_sdw.c: In function 'create_sdw_dailink':
>> sound/soc/intel/boards/sof_sdw.c:889:34: error: invalid use of undefined type 'struct snd_soc_card'
     889 |         struct device *dev = card->dev;
         |                                  ^~
   sound/soc/intel/boards/sof_sdw.c:890:63: error: invalid use of undefined type 'struct snd_soc_card'
     890 |         struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
         |                                                               ^~
   sound/soc/intel/boards/sof_sdw.c:891:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     891 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
   sound/soc/intel/boards/sof_sdw.c:891:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/intel/boards/sof_sdw.c: In function 'create_sdw_dailinks':
   sound/soc/intel/boards/sof_sdw.c:1037:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1037 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_sdw.c: In function 'create_ssp_dailinks':
   sound/soc/intel/boards/sof_sdw.c:1068:34: error: invalid use of undefined type 'struct snd_soc_card'
    1068 |         struct device *dev = card->dev;
         |                                  ^~
   sound/soc/intel/boards/sof_sdw.c: In function 'create_dmic_dailinks':
   sound/soc/intel/boards/sof_sdw.c:1104:34: error: invalid use of undefined type 'struct snd_soc_card'
    1104 |         struct device *dev = card->dev;
         |                                  ^~
   sound/soc/intel/boards/sof_sdw.c: In function 'create_hdmi_dailinks':
   sound/soc/intel/boards/sof_sdw.c:1135:34: error: invalid use of undefined type 'struct snd_soc_card'
    1135 |         struct device *dev = card->dev;
         |                                  ^~
   sound/soc/intel/boards/sof_sdw.c:1136:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1136 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/sof_sdw.c: In function 'create_bt_dailinks':
   sound/soc/intel/boards/sof_sdw.c:1177:34: error: invalid use of undefined type 'struct snd_soc_card'
    1177 |         struct device *dev = card->dev;
         |                                  ^~
   sound/soc/intel/boards/sof_sdw.c: In function 'create_echoref_dailink':
   sound/soc/intel/boards/sof_sdw.c:1209:34: error: invalid use of undefined type 'struct snd_soc_card'
    1209 |         struct device *dev = card->dev;
         |                                  ^~
   sound/soc/intel/boards/sof_sdw.c: In function 'sof_card_dai_links_create':
   sound/soc/intel/boards/sof_sdw.c:1237:34: error: invalid use of undefined type 'struct snd_soc_card'
    1237 |         struct device *dev = card->dev;
         |                                  ^~
   sound/soc/intel/boards/sof_sdw.c:1238:63: error: invalid use of undefined type 'struct snd_soc_card'
    1238 |         struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
         |                                                               ^~
   sound/soc/intel/boards/sof_sdw.c:1240:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1240 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from sound/soc/intel/boards/sof_sdw.c:8:
   sound/soc/intel/boards/sof_sdw.c: In function 'mc_probe':
   sound/soc/intel/boards/sof_sdw.c:1486:30: error: invalid use of undefined type 'struct snd_soc_card'
    1486 |                 dev_info(card->dev, "Overriding quirk 0x%lx => 0x%x\n",
         |                              ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/intel/boards/sof_sdw.c:1486:17: note: in expansion of macro 'dev_info'
    1486 |                 dev_info(card->dev, "Overriding quirk 0x%lx => 0x%x\n",
         |                 ^~~~~~~~
   sound/soc/intel/boards/sof_sdw.c:1491:24: error: invalid use of undefined type 'struct snd_soc_card'
    1491 |         log_quirks(card->dev);
         |                        ^~
   sound/soc/intel/boards/sof_sdw.c:1510:41: error: invalid use of undefined type 'struct snd_soc_card'
    1510 |         components = devm_kasprintf(card->dev, GFP_KERNEL,
         |                                         ^~
   sound/soc/intel/boards/sof_sdw.c:1518:49: error: invalid use of undefined type 'struct snd_soc_card'
    1518 |                 components = devm_kasprintf(card->dev, GFP_KERNEL,
         |                                                 ^~
   sound/soc/intel/boards/sof_sdw.c:1531:35: error: invalid use of undefined type 'struct snd_soc_card'
    1531 |                 dev_err_probe(card->dev, ret, "snd_soc_card_register() failed %d\n", ret);
         |                                   ^~
--
   In file included from include/linux/device.h:15,
                    from sound/soc/sdw_utils/soc_sdw_maxim.c:9:
   sound/soc/sdw_utils/soc_sdw_maxim.c: In function 'asoc_sdw_maxim_init':
>> sound/soc/sdw_utils/soc_sdw_maxim.c:137:29: error: invalid use of undefined type 'struct snd_soc_card'
     137 |                 dev_err(card->dev, "Invalid maxim_part_id %#x\n", maxim_part_id);
         |                             ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sdw_utils/soc_sdw_maxim.c:137:17: note: in expansion of macro 'dev_err'
     137 |                 dev_err(card->dev, "Invalid maxim_part_id %#x\n", maxim_part_id);
         |                 ^~~~~~~


vim +30 include/trace/events/asoc.h

a8b1d34f3ee1bc Mark Brown              2010-11-03  24  
6ef46a69ec32fe Luca Ceresoli           2024-03-06  25  	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
84e909303dbd3c Mark Brown              2010-11-04  26  
6ef46a69ec32fe Luca Ceresoli           2024-03-06  27  	TP_ARGS(dapm, val),
84e909303dbd3c Mark Brown              2010-11-04  28  
84e909303dbd3c Mark Brown              2010-11-04  29  	TP_STRUCT__entry(
8855eb7d29400f Kuninori Morimoto       2025-11-11 @30  		__string(	card_name,	snd_soc_dapm_to_card(dapm)->name)
8855eb7d29400f Kuninori Morimoto       2025-11-11  31  		__string(	comp_name,	snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
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

:::::: The code at line 30 was first introduced by commit
:::::: 8855eb7d29400fb7b2882da33725db2801c410e4 ASoC: asoc.h: convert to snd_soc_dapm_xxx()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
