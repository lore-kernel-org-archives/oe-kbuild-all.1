Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476993AD50E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146920; cv=none; b=Pk7wUFXu8ySz9+IgADqC7km0a9n3GABS6XJsCkmNHatdUgXg32SWdKTj5uTcGJB3uv5nFTmSKrhEXCbmtqbJAutD749umyeTNX+rrSfYUnJf2SrVewSbHWPQUzMlQOLjuK2tjLl+K7MnL4ElpEDZlZoWnvTXY+tSm52NgJQv6pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146920; c=relaxed/simple;
	bh=l+CdikZXxIXZeYguRg++DDEFIt4zKMp1DtKWrZXMaBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TxZhgfgNee9fpZQKnPwwkFMycgyysGtAi3yePdBwXBtkPM+CyHMN9NZEZLJ890zx0RFN1Vt/PqP2P6biZgUDT96HKvQZ3wXiHLfw/Nk6ODtc6Cr2DIw0uj4Xa7LNvlvV2C6+9Mx/BuXfYO3BlfY5VF7BNATWjBhcUd0qSM3VYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEGLpvYt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEGLpvYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778146918; x=1809682918;
  h=date:from:to:cc:subject:message-id;
  bh=l+CdikZXxIXZeYguRg++DDEFIt4zKMp1DtKWrZXMaBg=;
  b=ZEGLpvYtdVi4tW1YAulrXEfRKvKbpa0xQ89QEMxZ7njjExQtSb49x51j
   PdG4KCZVWEvzt89HNKBtmIoR9bCFCdq3A8UZOFaZdf5D/Ob4YFF7C/nYZ
   taYOUYZ998IYK1IZCZD0Ov6FVMTXyVpQ+4kuIK9tGt0G2qv+nb9F/Ofra
   uWyU/xpaGe8CTN2GTuKjga92VpGz+2wDMhLGlELQy1n2N7ZGl3G1msYKF
   BsoPIJ5oepEC58WtnRkz1iA2im3oJCzEnMG/puzxEyTdzlwBOcgdVJ9qV
   NdB1Nuh9IdeTz/zvlAYFWimGNdI0Rblxueltfa2BdI9GvlFMBqqJAMBfl
   Q==;
X-CSE-ConnectionGUID: irMcjznNREGAc0tbxfEnng==
X-CSE-MsgGUID: My4fX54CQsqcrRzNJPxBzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101768696"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="101768696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:41:58 -0700
X-CSE-ConnectionGUID: +dWB3BbgTD+Jan9gw6Qcaw==
X-CSE-MsgGUID: kOYyVNbjTEaGEmNCphFCQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236528549"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2026 02:41:56 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKvEv-0000000009h-39IZ;
	Thu, 07 May 2026 09:41:53 +0000
Date: Thu, 07 May 2026 17:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 31/41]
 sound/soc/codecs/88pm860x-codec.c:1140:10: error: 'const struct
 snd_soc_dai_ops' has no member named 'mute_stream'
Message-ID: <202605071737.FMYC5A6n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   c97c5e0c6b261af9080f692699ae3d98a7be0cf6
commit: a5922876e934aa1d8666146da55bc7d48ad15dae [31/41] ASoC: soc-dai: Add support for parallel data pin configuration - WIP
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260507/202605071737.FMYC5A6n-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071737.FMYC5A6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071737.FMYC5A6n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/sound/soc.h:1404,
                    from sound/soc/soc-dai.c:9:
   include/sound/soc-dai.h:322:1: error: version control conflict marker in file
     322 | <<<<<<< HEAD
         | ^~~~~~~
   include/sound/soc-dai.h:329:9: error: invalid suffix 'cdafc178' on integer constant
     329 | >>>>>>> 5000cdafc178 (ASoC: soc-dai: Add support for parallel data pin configuration - WIP)
         |         ^~~~~~~~~~~~
   include/sound/soc-dai.h: In function 'snd_soc_dai_set_stream':
   include/sound/soc-dai.h:604:29: error: 'const struct snd_soc_dai_ops' has no member named 'set_stream'
     604 |         if (dai->driver->ops->set_stream)
         |                             ^~
   include/sound/soc-dai.h:605:40: error: 'const struct snd_soc_dai_ops' has no member named 'set_stream'
     605 |                 return dai->driver->ops->set_stream(dai, stream, direction);
         |                                        ^~
   include/sound/soc-dai.h: In function 'snd_soc_dai_get_stream':
   include/sound/soc-dai.h:624:29: error: 'const struct snd_soc_dai_ops' has no member named 'get_stream'
     624 |         if (dai->driver->ops->get_stream)
         |                             ^~
   include/sound/soc-dai.h:625:40: error: 'const struct snd_soc_dai_ops' has no member named 'get_stream'
     625 |                 return dai->driver->ops->get_stream(dai, direction);
         |                                        ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_get_fmt_max_priority':
   sound/soc/soc-dai.c:133:37: error: 'const struct snd_soc_dai_ops' has no member named 'num_auto_selectable_formats'
     133 |                     dai->driver->ops->num_auto_selectable_formats)
         |                                     ^~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/current.h:6,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/sound/soc.h:15:
   sound/soc/soc-dai.c:134:56: error: 'const struct snd_soc_dai_ops' has no member named 'num_auto_selectable_formats'
     134 |                         max = max(max, dai->driver->ops->num_auto_selectable_formats);
         |                                                        ^~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:134:31: note: in expansion of macro 'max'
     134 |                         max = max(max, dai->driver->ops->num_auto_selectable_formats);
         |                               ^~~
   In file included from <command-line>:
>> include/linux/compiler.h:165:17: error: '__UNIQUE_ID_y__381' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__380'?
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:134:31: note: in expansion of macro 'max'
     134 |                         max = max(max, dai->driver->ops->num_auto_selectable_formats);
         |                               ^~~
   include/linux/compiler.h:165:17: note: each undeclared identifier is reported only once for each function it appears in
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:134:31: note: in expansion of macro 'max'
     134 |                         max = max(max, dai->driver->ops->num_auto_selectable_formats);
         |                               ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
      70 | #define __is_nonneg(ux) statically_true( \
--
   sound/soc/soc-dai.c:368:29: error: 'const struct snd_soc_dai_ops' has no member named 'set_channel_map'
     368 |             dai->driver->ops->set_channel_map)
         |                             ^~
   sound/soc/soc-dai.c:369:39: error: 'const struct snd_soc_dai_ops' has no member named 'set_channel_map'
     369 |                 ret = dai->driver->ops->set_channel_map(dai, tx_num, tx_slot,
         |                                       ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_get_channel_map':
   sound/soc/soc-dai.c:392:29: error: 'const struct snd_soc_dai_ops' has no member named 'get_channel_map'
     392 |             dai->driver->ops->get_channel_map)
         |                             ^~
   sound/soc/soc-dai.c:393:39: error: 'const struct snd_soc_dai_ops' has no member named 'get_channel_map'
     393 |                 ret = dai->driver->ops->get_channel_map(dai, tx_num, tx_slot,
         |                                       ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_set_tristate':
   sound/soc/soc-dai.c:411:29: error: 'const struct snd_soc_dai_ops' has no member named 'set_tristate'
     411 |             dai->driver->ops->set_tristate)
         |                             ^~
   sound/soc/soc-dai.c:412:39: error: 'const struct snd_soc_dai_ops' has no member named 'set_tristate'
     412 |                 ret = dai->driver->ops->set_tristate(dai, tristate);
         |                                       ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_prepare':
   sound/soc/soc-dai.c:427:29: error: 'const struct snd_soc_dai_ops' has no member named 'prepare'
     427 |             dai->driver->ops->prepare)
         |                             ^~
   sound/soc/soc-dai.c:428:39: error: 'const struct snd_soc_dai_ops' has no member named 'prepare'
     428 |                 ret = dai->driver->ops->prepare(substream, dai);
         |                                       ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_mute_is_ctrled_at_trigger':
   sound/soc/soc-dai.c:437:40: error: 'const struct snd_soc_dai_ops' has no member named 'mute_unmute_on_trigger'
     437 |                 return dai->driver->ops->mute_unmute_on_trigger;
         |                                        ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_digital_mute':
   sound/soc/soc-dai.c:460:29: error: 'const struct snd_soc_dai_ops' has no member named 'mute_stream'
     460 |             dai->driver->ops->mute_stream &&
         |                             ^~
   sound/soc/soc-dai.c:462:31: error: 'const struct snd_soc_dai_ops' has no member named 'no_capture_mute'
     462 |              !dai->driver->ops->no_capture_mute))
         |                               ^~
   sound/soc/soc-dai.c:463:39: error: 'const struct snd_soc_dai_ops' has no member named 'mute_stream'
     463 |                 ret = dai->driver->ops->mute_stream(dai, mute, direction);
         |                                       ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_hw_params':
   sound/soc/soc-dai.c:476:29: error: 'const struct snd_soc_dai_ops' has no member named 'hw_params'
     476 |             dai->driver->ops->hw_params)
         |                             ^~
   sound/soc/soc-dai.c:477:39: error: 'const struct snd_soc_dai_ops' has no member named 'hw_params'
     477 |                 ret = dai->driver->ops->hw_params(substream, params, dai);
         |                                       ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_hw_free':
   sound/soc/soc-dai.c:494:29: error: 'const struct snd_soc_dai_ops' has no member named 'hw_free'
     494 |             dai->driver->ops->hw_free)
         |                             ^~
   sound/soc/soc-dai.c:495:33: error: 'const struct snd_soc_dai_ops' has no member named 'hw_free'
     495 |                 dai->driver->ops->hw_free(substream, dai);
         |                                 ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_startup':
   sound/soc/soc-dai.c:510:29: error: 'const struct snd_soc_dai_ops' has no member named 'startup'
     510 |             dai->driver->ops->startup)
         |                             ^~
   sound/soc/soc-dai.c:511:39: error: 'const struct snd_soc_dai_ops' has no member named 'startup'
     511 |                 ret = dai->driver->ops->startup(substream, dai);
         |                                       ^~
   sound/soc/soc-dai.c: In function 'snd_soc_dai_shutdown':
   sound/soc/soc-dai.c:531:29: error: 'const struct snd_soc_dai_ops' has no member named 'shutdown'
     531 |             dai->driver->ops->shutdown)
         |                             ^~
   sound/soc/soc-dai.c:532:33: error: 'const struct snd_soc_dai_ops' has no member named 'shutdown'
     532 |                 dai->driver->ops->shutdown(substream, dai);
         |                                 ^~
   sound/soc/soc-dai.c: In function 'snd_soc_pcm_dai_probe':
   sound/soc/soc-dai.c:594:45: error: 'const struct snd_soc_dai_ops' has no member named 'probe_order'
     594 |                         if (dai->driver->ops->probe_order != order)
         |                                             ^~
   sound/soc/soc-dai.c: In function 'snd_soc_pcm_dai_remove':
   sound/soc/soc-dai.c:620:45: error: 'const struct snd_soc_dai_ops' has no member named 'remove_order'
     620 |                         if (dai->driver->ops->remove_order != order)
         |                                             ^~
   sound/soc/soc-dai.c: In function 'soc_dai_trigger':
   sound/soc/soc-dai.c:676:29: error: 'const struct snd_soc_dai_ops' has no member named 'trigger'
     676 |             dai->driver->ops->trigger)
         |                             ^~
   sound/soc/soc-dai.c:677:39: error: 'const struct snd_soc_dai_ops' has no member named 'trigger'
     677 |                 ret = dai->driver->ops->trigger(substream, cmd, dai);
         |                                       ^~
   sound/soc/soc-dai.c: In function 'snd_soc_pcm_dai_delay':
   sound/soc/soc-dai.c:742:37: error: 'const struct snd_soc_dai_ops' has no member named 'delay'
     742 |                     dai->driver->ops->delay)
         |                                     ^~
   sound/soc/soc-dai.c:743:70: error: 'const struct snd_soc_dai_ops' has no member named 'delay'
     743 |                         *cpu_delay = max(*cpu_delay, dai->driver->ops->delay(substream, dai));
         |                                                                      ^~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:743:38: note: in expansion of macro 'max'
     743 |                         *cpu_delay = max(*cpu_delay, dai->driver->ops->delay(substream, dai));
         |                                      ^~~
>> include/linux/compiler.h:165:17: error: '__UNIQUE_ID_y__395' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__394'?
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:743:38: note: in expansion of macro 'max'
     743 |                         *cpu_delay = max(*cpu_delay, dai->driver->ops->delay(substream, dai));
         |                                      ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
      70 | #define __is_nonneg(ux) statically_true( \
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:743:38: note: in expansion of macro 'max'
     743 |                         *cpu_delay = max(*cpu_delay, dai->driver->ops->delay(substream, dai));
         |                                      ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
      70 | #define __is_nonneg(ux) statically_true( \
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:743:38: note: in expansion of macro 'max'
     743 |                         *cpu_delay = max(*cpu_delay, dai->driver->ops->delay(substream, dai));
         |                                      ^~~
   sound/soc/soc-dai.c:748:37: error: 'const struct snd_soc_dai_ops' has no member named 'delay'
     748 |                     dai->driver->ops->delay)
         |                                     ^~
   sound/soc/soc-dai.c:749:74: error: 'const struct snd_soc_dai_ops' has no member named 'delay'
     749 |                         *codec_delay = max(*codec_delay, dai->driver->ops->delay(substream, dai));
         |                                                                          ^~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:749:40: note: in expansion of macro 'max'
     749 |                         *codec_delay = max(*codec_delay, dai->driver->ops->delay(substream, dai));
         |                                        ^~~
>> include/linux/compiler.h:165:17: error: '__UNIQUE_ID_y__398' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__397'?
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:749:40: note: in expansion of macro 'max'
     749 |                         *codec_delay = max(*codec_delay, dai->driver->ops->delay(substream, dai));
         |                                        ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
      70 | #define __is_nonneg(ux) statically_true( \
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   sound/soc/soc-dai.c:749:40: note: in expansion of macro 'max'
     749 |                         *codec_delay = max(*codec_delay, dai->driver->ops->delay(substream, dai));
         |                                        ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
      70 | #define __is_nonneg(ux) statically_true( \
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
..


vim +1140 sound/soc/codecs/88pm860x-codec.c

f213f4b5177740 Haojian Zhuang     2010-08-19  1138  
85e7652d89293a Lars-Peter Clausen 2011-11-23  1139  static const struct snd_soc_dai_ops pm860x_pcm_dai_ops = {
54b5927067dd79 Kuninori Morimoto  2020-07-09 @1140  	.mute_stream	= pm860x_mute_stream,
f213f4b5177740 Haojian Zhuang     2010-08-19 @1141  	.hw_params	= pm860x_pcm_hw_params,
f213f4b5177740 Haojian Zhuang     2010-08-19  1142  	.set_fmt	= pm860x_pcm_set_dai_fmt,
f213f4b5177740 Haojian Zhuang     2010-08-19  1143  	.set_sysclk	= pm860x_set_dai_sysclk,
54b5927067dd79 Kuninori Morimoto  2020-07-09 @1144  	.no_capture_mute = 1,
f213f4b5177740 Haojian Zhuang     2010-08-19  1145  };
f213f4b5177740 Haojian Zhuang     2010-08-19  1146  

:::::: The code at line 1140 was first introduced by commit
:::::: 54b5927067dd79b58032a4938ee13b233f1a368c ASoC: codecs: merge .digital_mute() into .mute_stream()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
