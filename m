Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88723536B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301914; cv=none; b=ZBHw6NjgwRjP/n+g+vmcNi4s49mygsCp+7Pn86hkKze1EaK5p6cxBLd2G08MFoh8ut/xzugrArs7WF8PmFqoFWvoyGaO/C+pWtKNciZuDDOlH21vlDoJaPEc55tKbuxn5H6shszhpg8hpxyc0xpeIm3MTnrdIIxAUm/vL8kY7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301914; c=relaxed/simple;
	bh=bIEOHLlYK64kvNbBgwDRVn5vkdyDjc8bYPHYiPhBb5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O6cR1S4w3QZ6oyryXQZUi9xpER97goDIkNjqaXzH7phABd6Y5V7mAr68qz/RPu72phkSDe4EQNUNTe/gHn8GC4NtrpVHm2RxqVYygfdr8oeN/8hrSF5KVPDMF5dcrd/M4lPpEiyxMTZPEUnkzg0EVHqJVOKurJROBaCZiMLHoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czETKb9r; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czETKb9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784301910; x=1815837910;
  h=date:from:to:cc:subject:message-id;
  bh=bIEOHLlYK64kvNbBgwDRVn5vkdyDjc8bYPHYiPhBb5A=;
  b=czETKb9rnzjQclr8Jnorp7yTyth6uRWmB7twVVWFR6fy8v6FWhIJIxRL
   h+Ci2ZcHLEk4dWkyujmIeQBsOSYwR9cFzy/d0UGnRNUb8dY2ZQajnVa/K
   3KE0Z1KdCOPlxsR7o4xQhjIaYew4m00+UaTfYHbyXxSgPhH+fDXJ7xQsK
   lTplDCWUdzrLK4n6uXfCx02UeUVNbSvVqUBrjOqHnYiQXi9trk321aIrt
   xN1Z2WYjHNocAXIESD1u4aPKmJhbLTYGhDQTCEQWbaTUZrPVV/VQO5tMZ
   WVa7dymaSs4u4CfEq2AEBGRrBW7mspw6Gle5higPukyxVxBBuTEb2+H6I
   A==;
X-CSE-ConnectionGUID: J+aiBj6HRfWUP4HxmdgxQQ==
X-CSE-MsgGUID: 3n3I08b4Rq6PlmHphdEM3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85175155"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85175155"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 08:25:07 -0700
X-CSE-ConnectionGUID: EvtYajHzSFi2TS3Ft8yG3w==
X-CSE-MsgGUID: RArhtiZcRWGx1629WAgQBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256894341"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2026 08:25:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkkQx-00000000SsF-0Yzj;
	Fri, 17 Jul 2026 15:25:03 +0000
Date: Fri, 17 Jul 2026 23:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 sound/soc/amd/acp-da7219-max98357a.c:781:37: error: invalid use of undefined
 type 'struct snd_soc_card'
Message-ID: <202607172311.I4bqIEMV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e51d2e02d8d4c974132f00eec9d2215a476084f0 [311/311] ASoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607172311.I4bqIEMV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172311.I4bqIEMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172311.I4bqIEMV-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/amd/acp-da7219-max98357a.c: In function 'cz_probe':
   sound/soc/amd/acp-da7219-max98357a.c:776:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     776 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
>> sound/soc/amd/acp-da7219-max98357a.c:781:37: error: invalid use of undefined type 'struct snd_soc_card'
     781 |                                 card->name);
         |                                     ^~
--
   sound/soc/amd/acp-es8336.c: In function 'st_es8336_probe':
   sound/soc/amd/acp-es8336.c:289:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     289 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
>> sound/soc/amd/acp-es8336.c:294:42: error: invalid use of undefined type 'struct snd_soc_card'
     294 |                                      card->name);
         |                                          ^~
--
   sound/soc/amd/acp3x-rt5682-max9836.c: In function 'acp3x_probe':
   sound/soc/amd/acp3x-rt5682-max9836.c:520:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     520 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
>> sound/soc/amd/acp3x-rt5682-max9836.c:533:37: error: invalid use of undefined type 'struct snd_soc_card'
     533 |                                 card->name);
         |                                     ^~
--
   sound/soc/sdw_utils/soc_sdw_utils.c: In function 'asoc_sdw_mc_dailink_exit_loop':
   sound/soc/sdw_utils/soc_sdw_utils.c:1686:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
    1686 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
   sound/soc/sdw_utils/soc_sdw_utils.c:1686:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   In file included from include/linux/device.h:15,
                    from sound/soc/sdw_utils/soc_sdw_utils.c:9:
>> sound/soc/sdw_utils/soc_sdw_utils.c:1706:54: error: invalid use of undefined type 'struct snd_soc_card'
    1706 |                                         dev_warn(card->dev,
         |                                                      ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sdw_utils/soc_sdw_utils.c:1706:41: note: in expansion of macro 'dev_warn'
    1706 |                                         dev_warn(card->dev,
         |                                         ^~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c: In function 'asoc_sdw_count_sdw_endpoints':
   sound/soc/sdw_utils/soc_sdw_utils.c:1847:34: error: invalid use of undefined type 'struct snd_soc_card'
    1847 |         struct device *dev = card->dev;
         |                                  ^~
--
   sound/soc/sdw_utils/soc_sdw_rt_dmic.c: In function 'asoc_sdw_rt_dmic_rtd_init':
>> sound/soc/sdw_utils/soc_sdw_rt_dmic.c:81:18: error: invalid use of undefined type 'struct snd_soc_card'
      81 |         if (!card->components)
         |                  ^~
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/segment.h:6,
                    from arch/x86/include/asm/ptrace.h:5,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from sound/soc/sdw_utils/soc_sdw_rt_dmic.c:10:
   sound/soc/sdw_utils/soc_sdw_rt_dmic.c:84:57: error: invalid use of undefined type 'struct snd_soc_card'
      84 |         dev_dbg(card_dev, "card->components: %s\n", card->components);
         |                                                         ^~
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
   sound/soc/sdw_utils/soc_sdw_rt_dmic.c:84:9: note: in expansion of macro 'dev_dbg'
      84 |         dev_dbg(card_dev, "card->components: %s\n", card->components);
         |         ^~~~~~~
--
   sound/soc/sdw_utils/soc_sdw_rt711.c: In function 'asoc_sdw_rt711_rtd_init':
>> sound/soc/sdw_utils/soc_sdw_rt711.c:77:18: error: invalid use of undefined type 'struct snd_soc_card'
      77 |         if (!card->components)
         |                  ^~
   sound/soc/sdw_utils/soc_sdw_rt711.c: In function 'asoc_sdw_rt711_exit':
   sound/soc/sdw_utils/soc_sdw_rt711.c:118:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     118 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
   sound/soc/sdw_utils/soc_sdw_rt711.c:118:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_rt711.c: In function 'asoc_sdw_rt711_init':
   sound/soc/sdw_utils/soc_sdw_rt711.c:135:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     135 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c: In function 'asoc_sdw_rt_sdca_jack_rtd_init':
>> sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c:109:18: error: invalid use of undefined type 'struct snd_soc_card'
     109 |         if (!card->components)
         |                  ^~
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c: In function 'asoc_sdw_rt_sdca_jack_exit':
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c:178:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     178 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c:178:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c: In function 'asoc_sdw_rt_sdca_jack_init':
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c:199:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     199 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
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
--
   sound/soc/sdw_utils/soc_sdw_ti_amp.c: In function 'asoc_sdw_ti_dmic_rtd_init':
>> sound/soc/sdw_utils/soc_sdw_ti_amp.c:171:62: error: invalid use of undefined type 'struct snd_soc_card'
     171 |         snd_soc_card_set_components(card, devm_kasprintf(card->dev, GFP_KERNEL,
         |                                                              ^~
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
   sound/soc/amd/vangogh/acp5x-mach.c: In function 'acp5x_probe':
   sound/soc/amd/vangogh/acp5x-mach.c:479:9: error: implicit declaration of function 'snd_soc_card_set_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
     479 |         snd_soc_card_set_drvdata(card, machine);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_set_priv
>> sound/soc/amd/vangogh/acp5x-mach.c:483:83: error: invalid use of undefined type 'struct snd_soc_card'
     483 |                 return dev_err_probe(dev, ret, "Register card (%s) failed\n", card->name);
         |                                                                                   ^~
..


vim +781 sound/soc/amd/acp-da7219-max98357a.c

c183fec10ae6b3 Akshu Agrawal        2018-07-25  746  
608a300fc1f0e0 Akshu Agrawal        2018-02-16  747  static int cz_probe(struct platform_device *pdev)
608a300fc1f0e0 Akshu Agrawal        2018-02-16  748  {
608a300fc1f0e0 Akshu Agrawal        2018-02-16  749  	int ret;
608a300fc1f0e0 Akshu Agrawal        2018-02-16  750  	struct snd_soc_card *card;
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  751  	struct snd_soc_card_driver *card_driver;
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  752  	struct acp_platform_info *machine;
c183fec10ae6b3 Akshu Agrawal        2018-07-25  753  	struct regulator_dev *rdev;
7e71b48f9e27e4 Vijendar Mukunda     2021-03-19  754  	struct device *dev = &pdev->dev;
c183fec10ae6b3 Akshu Agrawal        2018-07-25  755  
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  756  	card = snd_soc_card_alloc(&pdev->dev);
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  757  	card_driver = (struct snd_soc_card_driver *)acp_soc_is_rltk_max(dev);
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  758  	if (!card || !card_driver)
7e71b48f9e27e4 Vijendar Mukunda     2021-03-19  759  		return -ENODEV;
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  760  	if (!strcmp(card_driver->default_name, "acpd7219m98357")) {
c183fec10ae6b3 Akshu Agrawal        2018-07-25  761  		acp_da7219_cfg.dev = &pdev->dev;
c183fec10ae6b3 Akshu Agrawal        2018-07-25  762  		rdev = devm_regulator_register(&pdev->dev, &acp_da7219_desc,
c183fec10ae6b3 Akshu Agrawal        2018-07-25  763  					       &acp_da7219_cfg);
c183fec10ae6b3 Akshu Agrawal        2018-07-25  764  		if (IS_ERR(rdev)) {
c183fec10ae6b3 Akshu Agrawal        2018-07-25  765  			dev_err(&pdev->dev, "Failed to register regulator: %d\n",
7699676081ded2 Akshu Agrawal        2018-07-26  766  				(int)PTR_ERR(rdev));
c183fec10ae6b3 Akshu Agrawal        2018-07-25  767  			return -EINVAL;
c183fec10ae6b3 Akshu Agrawal        2018-07-25  768  		}
7e71b48f9e27e4 Vijendar Mukunda     2021-03-19  769  	}
608a300fc1f0e0 Akshu Agrawal        2018-02-16  770  
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  771  	machine = devm_kzalloc(&pdev->dev, sizeof(struct acp_platform_info),
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  772  			       GFP_KERNEL);
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  773  	if (!machine)
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  774  		return -ENOMEM;
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  775  
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  776  	snd_soc_card_set_drvdata(card, machine);
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  777  	ret = devm_snd_soc_card_register(card, card_driver);
608a300fc1f0e0 Akshu Agrawal        2018-02-16  778  	if (ret) {
718693352d8bce Mario Limonciello    2021-07-22  779  		return dev_err_probe(&pdev->dev, ret,
8f1f0b7409e27f Kuninori Morimoto    2026-04-20  780  				"devm_snd_soc_card_register(%s) failed\n",
718693352d8bce Mario Limonciello    2021-07-22 @781  				card->name);
608a300fc1f0e0 Akshu Agrawal        2018-02-16  782  	}
198433023ef962 Pierre-Louis Bossart 2021-09-07  783  	acp_bt_uart_enable = !device_property_read_bool(&pdev->dev,
ccfbb4f5723736 Mukunda, Vijendar    2018-05-08  784  							"bt-pad-enable");
608a300fc1f0e0 Akshu Agrawal        2018-02-16  785  	return 0;
608a300fc1f0e0 Akshu Agrawal        2018-02-16  786  }
608a300fc1f0e0 Akshu Agrawal        2018-02-16  787  

:::::: The code at line 781 was first introduced by commit
:::::: 718693352d8bcea65276615f4f8c8d531246b644 ASoC: amd: Use dev_probe_err helper

:::::: TO: Mario Limonciello <mario.limonciello@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
