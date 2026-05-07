Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D62C4611F9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178335; cv=none; b=NY9chAsC2hz5DPpVbHj/Pui0PpK8VtTCXQau48vbBMd1y7H5wjjoWgAJ3ZsCwkuzHmU//SwTkg4rk032dPLQgUXkRSXReuErhY52hvaRWZaf1wvSZArXZnN4g7fMAc7MBv+9OINKyn0XaNgmDGaOn3ZnGmvTtKkN1MQp0MWCVAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178335; c=relaxed/simple;
	bh=fbye5ZMI01yig6eexJwYMobYuWCgp5edruf4+42Z13c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CxO/NbGaa9SNsFUyfjyfbKNPqn1kfXCHG43wYM0g1EVuzowv63f9SNZIHyCue2fg7NL9xrLHdkO0M41Kz5z9WJGVWzqH5qgjXePl3mI5GvqfbGATT7mF3d6cb1N/vGaFG+ELMmLi+F54WFZcfPXKVzJ54xB5fsLI1D58BKPAYWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZTBkau/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZTBkau/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778178334; x=1809714334;
  h=date:from:to:cc:subject:message-id;
  bh=fbye5ZMI01yig6eexJwYMobYuWCgp5edruf4+42Z13c=;
  b=iZTBkau/CD3W6INLg0F0T5hgAiEEe2yjXr1wE4JH7SKiyBgzYJdzw8fp
   1/qX5qk4TafiEEbgYE2huX1URFqO41/bQ3QmWCaPZH+YZm5GibaB6pOFH
   EcsxZU5ZisvAtydVxJwKrPrtTDoCs6ja6dile/Lwib45vBpVfOotbko12
   CnGZsk9t65iF5r+1niUpsqv2qK1GxFHJkbM6VxWBQrY7CLo+Kjh7/XLON
   XeXTSpm+zN07NMvokUCOQqRXb6GV9wxfuklCoWshOcEaUyhPsO+3oRRE1
   D5PkvkbR6E6qizJKy9OQfZIBpZfKpdHXXs7JaZuFgBLujvohwBkSa7lg8
   g==;
X-CSE-ConnectionGUID: /W72RDIvS3KUbY/igzZhmQ==
X-CSE-MsgGUID: fRBJjvqiR9C6DGAA0ta5cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79131003"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79131003"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 11:25:32 -0700
X-CSE-ConnectionGUID: ZAG3hZALQFC7QJDScAv/ZQ==
X-CSE-MsgGUID: ceh8wQMbSt+U8Mjb9uWw/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="233477009"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 11:25:30 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL3Pb-000000000Md-3rcx;
	Thu, 07 May 2026 18:25:27 +0000
Date: Fri, 08 May 2026 02:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 31/41]
 sound/soc/soc-dai.c:346:1: warning: control reaches end of non-void function
Message-ID: <202605080248.5UHTceA9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   c97c5e0c6b261af9080f692699ae3d98a7be0cf6
commit: a5922876e934aa1d8666146da55bc7d48ad15dae [31/41] ASoC: soc-dai: Add support for parallel data pin configuration - WIP
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260508/202605080248.5UHTceA9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080248.5UHTceA9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080248.5UHTceA9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler.h:165:17: error: '__UNIQUE_ID_y__390' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__389'?
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
   include/linux/compiler.h:165:17: error: '__UNIQUE_ID_y__393' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__392'?
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
   sound/soc/soc-dai.c: In function 'snd_soc_dai_set_data_pins':
>> sound/soc/soc-dai.c:346:1: warning: control reaches end of non-void function [-Wreturn-type]
     346 | }
         | ^
--
   In file included from include/sound/soc.h:1404,
                    from drivers/soundwire/stream.c:19:
   include/sound/soc-dai.h:322:1: error: version control conflict marker in file
     322 | <<<<<<< HEAD
         | ^~~~~~~
   include/sound/soc-dai.h:329:9: error: invalid suffix "cdafc178" on integer constant
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
   include/sound/soc-dai.h: In function 'snd_soc_dai_set_stream':
>> include/sound/soc-dai.h:608:1: warning: control reaches end of non-void function [-Wreturn-type]
     608 | }
         | ^
   include/sound/soc-dai.h: In function 'snd_soc_dai_get_stream':
   include/sound/soc-dai.h:628:1: warning: control reaches end of non-void function [-Wreturn-type]
     628 | }
         | ^
--
   In file included from include/sound/soc.h:1404,
                    from sound/soc/codecs/alc5623.c:26:
   include/sound/soc-dai.h:322:1: error: version control conflict marker in file
     322 | <<<<<<< HEAD
         | ^~~~~~~
   include/sound/soc-dai.h:329:9: error: invalid suffix "cdafc178" on integer constant
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
   sound/soc/codecs/alc5623.c: At top level:
   sound/soc/codecs/alc5623.c:826:18: error: 'const struct snd_soc_dai_ops' has no member named 'hw_params'
     826 |                 .hw_params = alc5623_pcm_hw_params,
         |                  ^~~~~~~~~
   sound/soc/codecs/alc5623.c:826:30: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     826 |                 .hw_params = alc5623_pcm_hw_params,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/alc5623.c:826:30: note: (near initialization for 'alc5623_dai_ops')
   sound/soc/codecs/alc5623.c:826:30: error: initialization of 'int (*)(struct snd_soc_dai *, unsigned int)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *, struct snd_soc_dai *)' [-Wincompatible-pointer-types]
   sound/soc/codecs/alc5623.c:826:30: note: (near initialization for 'alc5623_dai_ops.set_bclk_ratio')
   sound/soc/codecs/alc5623.c:827:18: error: 'const struct snd_soc_dai_ops' has no member named 'mute_stream'
     827 |                 .mute_stream = alc5623_mute,
         |                  ^~~~~~~~~~~
   sound/soc/codecs/alc5623.c:827:32: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     827 |                 .mute_stream = alc5623_mute,
         |                                ^~~~~~~~~~~~
   sound/soc/codecs/alc5623.c:827:32: note: (near initialization for 'alc5623_dai_ops')
   sound/soc/codecs/alc5623.c:827:32: error: initialization of 'int (*)(struct snd_soc_dai *, int,  unsigned int,  int)' from incompatible pointer type 'int (*)(struct snd_soc_dai *, int,  int)' [-Wincompatible-pointer-types]
   sound/soc/codecs/alc5623.c:827:32: note: (near initialization for 'alc5623_dai_ops.set_sysclk')
   sound/soc/codecs/alc5623.c:829:31: warning: initialized field overwritten [-Woverride-init]
     829 |                 .set_sysclk = alc5623_set_dai_sysclk,
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/alc5623.c:829:31: note: (near initialization for 'alc5623_dai_ops.set_sysclk')
   sound/soc/codecs/alc5623.c:831:18: error: 'const struct snd_soc_dai_ops' has no member named 'no_capture_mute'
     831 |                 .no_capture_mute = 1,
         |                  ^~~~~~~~~~~~~~~
   sound/soc/codecs/alc5623.c:831:36: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     831 |                 .no_capture_mute = 1,
         |                                    ^
   sound/soc/codecs/alc5623.c:831:36: note: (near initialization for 'alc5623_dai_ops')
>> sound/soc/codecs/alc5623.c:831:36: warning: excess elements in struct initializer
   sound/soc/codecs/alc5623.c:831:36: note: (near initialization for 'alc5623_dai_ops')
   cc1: some warnings being treated as errors
--
   In file included from include/sound/soc.h:1404,
                    from sound/soc/codecs/alc5632.c:27:
   include/sound/soc-dai.h:322:1: error: version control conflict marker in file
     322 | <<<<<<< HEAD
         | ^~~~~~~
   include/sound/soc-dai.h:329:9: error: invalid suffix "cdafc178" on integer constant
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
   sound/soc/codecs/alc5632.c: At top level:
   sound/soc/codecs/alc5632.c:1007:18: error: 'const struct snd_soc_dai_ops' has no member named 'hw_params'
    1007 |                 .hw_params = alc5632_pcm_hw_params,
         |                  ^~~~~~~~~
   sound/soc/codecs/alc5632.c:1007:30: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1007 |                 .hw_params = alc5632_pcm_hw_params,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/alc5632.c:1007:30: note: (near initialization for 'alc5632_dai_ops')
   sound/soc/codecs/alc5632.c:1007:30: error: initialization of 'int (*)(struct snd_soc_dai *, unsigned int)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *, struct snd_soc_dai *)' [-Wincompatible-pointer-types]
   sound/soc/codecs/alc5632.c:1007:30: note: (near initialization for 'alc5632_dai_ops.set_bclk_ratio')
   sound/soc/codecs/alc5632.c:1008:18: error: 'const struct snd_soc_dai_ops' has no member named 'mute_stream'
    1008 |                 .mute_stream = alc5632_mute,
         |                  ^~~~~~~~~~~
   sound/soc/codecs/alc5632.c:1008:32: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1008 |                 .mute_stream = alc5632_mute,
         |                                ^~~~~~~~~~~~
   sound/soc/codecs/alc5632.c:1008:32: note: (near initialization for 'alc5632_dai_ops')
   sound/soc/codecs/alc5632.c:1008:32: error: initialization of 'int (*)(struct snd_soc_dai *, int,  unsigned int,  int)' from incompatible pointer type 'int (*)(struct snd_soc_dai *, int,  int)' [-Wincompatible-pointer-types]
   sound/soc/codecs/alc5632.c:1008:32: note: (near initialization for 'alc5632_dai_ops.set_sysclk')
   sound/soc/codecs/alc5632.c:1010:31: warning: initialized field overwritten [-Woverride-init]
    1010 |                 .set_sysclk = alc5632_set_dai_sysclk,
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/alc5632.c:1010:31: note: (near initialization for 'alc5632_dai_ops.set_sysclk')
   sound/soc/codecs/alc5632.c:1012:18: error: 'const struct snd_soc_dai_ops' has no member named 'no_capture_mute'
    1012 |                 .no_capture_mute = 1,
         |                  ^~~~~~~~~~~~~~~
   sound/soc/codecs/alc5632.c:1012:36: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1012 |                 .no_capture_mute = 1,
         |                                    ^
   sound/soc/codecs/alc5632.c:1012:36: note: (near initialization for 'alc5632_dai_ops')
>> sound/soc/codecs/alc5632.c:1012:36: warning: excess elements in struct initializer
   sound/soc/codecs/alc5632.c:1012:36: note: (near initialization for 'alc5632_dai_ops')
   cc1: some warnings being treated as errors
--
   In file included from include/sound/soc.h:1404,
                    from sound/soc/codecs/da7210.c:21:
   include/sound/soc-dai.h:322:1: error: version control conflict marker in file
     322 | <<<<<<< HEAD
         | ^~~~~~~
   include/sound/soc-dai.h:329:9: error: invalid suffix "cdafc178" on integer constant
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
   sound/soc/codecs/da7210.c: At top level:
   sound/soc/codecs/da7210.c:1035:10: error: 'const struct snd_soc_dai_ops' has no member named 'hw_params'
    1035 |         .hw_params      = da7210_hw_params,
         |          ^~~~~~~~~
   sound/soc/codecs/da7210.c:1035:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1035 |         .hw_params      = da7210_hw_params,
         |                           ^~~~~~~~~~~~~~~~
   sound/soc/codecs/da7210.c:1035:27: note: (near initialization for 'da7210_dai_ops')
   sound/soc/codecs/da7210.c:1035:27: error: initialization of 'int (*)(struct snd_soc_dai *, unsigned int)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *, struct snd_soc_dai *)' [-Wincompatible-pointer-types]
   sound/soc/codecs/da7210.c:1035:27: note: (near initialization for 'da7210_dai_ops.set_bclk_ratio')
   sound/soc/codecs/da7210.c:1039:10: error: 'const struct snd_soc_dai_ops' has no member named 'mute_stream'
    1039 |         .mute_stream    = da7210_mute,
         |          ^~~~~~~~~~~
   sound/soc/codecs/da7210.c:1039:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1039 |         .mute_stream    = da7210_mute,
         |                           ^~~~~~~~~~~
   sound/soc/codecs/da7210.c:1039:27: note: (near initialization for 'da7210_dai_ops')
>> sound/soc/codecs/da7210.c:1039:27: warning: excess elements in struct initializer
   sound/soc/codecs/da7210.c:1039:27: note: (near initialization for 'da7210_dai_ops')
   sound/soc/codecs/da7210.c:1040:10: error: 'const struct snd_soc_dai_ops' has no member named 'no_capture_mute'
    1040 |         .no_capture_mute = 1,
         |          ^~~~~~~~~~~~~~~
   sound/soc/codecs/da7210.c:1040:28: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1040 |         .no_capture_mute = 1,
         |                            ^
   sound/soc/codecs/da7210.c:1040:28: note: (near initialization for 'da7210_dai_ops')
   sound/soc/codecs/da7210.c:1040:28: warning: excess elements in struct initializer
   sound/soc/codecs/da7210.c:1040:28: note: (near initialization for 'da7210_dai_ops')
   cc1: some warnings being treated as errors
--
   In file included from include/sound/soc.h:1404,
                    from sound/soc/codecs/da9055.c:20:
   include/sound/soc-dai.h:322:1: error: version control conflict marker in file
     322 | <<<<<<< HEAD
         | ^~~~~~~
   include/sound/soc-dai.h:329:9: error: invalid suffix "cdafc178" on integer constant
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
   sound/soc/codecs/da9055.c: At top level:
   sound/soc/codecs/da9055.c:1322:10: error: 'const struct snd_soc_dai_ops' has no member named 'hw_params'
    1322 |         .hw_params      = da9055_hw_params,
         |          ^~~~~~~~~
   sound/soc/codecs/da9055.c:1322:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1322 |         .hw_params      = da9055_hw_params,
         |                           ^~~~~~~~~~~~~~~~
   sound/soc/codecs/da9055.c:1322:27: note: (near initialization for 'da9055_dai_ops')
   sound/soc/codecs/da9055.c:1322:27: error: initialization of 'int (*)(struct snd_soc_dai *, unsigned int)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *, struct snd_soc_dai *)' [-Wincompatible-pointer-types]
   sound/soc/codecs/da9055.c:1322:27: note: (near initialization for 'da9055_dai_ops.set_bclk_ratio')
   sound/soc/codecs/da9055.c:1326:10: error: 'const struct snd_soc_dai_ops' has no member named 'mute_stream'
    1326 |         .mute_stream    = da9055_mute,
         |          ^~~~~~~~~~~
   sound/soc/codecs/da9055.c:1326:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1326 |         .mute_stream    = da9055_mute,
         |                           ^~~~~~~~~~~
   sound/soc/codecs/da9055.c:1326:27: note: (near initialization for 'da9055_dai_ops')
>> sound/soc/codecs/da9055.c:1326:27: warning: excess elements in struct initializer
   sound/soc/codecs/da9055.c:1326:27: note: (near initialization for 'da9055_dai_ops')
   sound/soc/codecs/da9055.c:1327:10: error: 'const struct snd_soc_dai_ops' has no member named 'no_capture_mute'
    1327 |         .no_capture_mute = 1,
         |          ^~~~~~~~~~~~~~~
   sound/soc/codecs/da9055.c:1327:28: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1327 |         .no_capture_mute = 1,
         |                            ^
   sound/soc/codecs/da9055.c:1327:28: note: (near initialization for 'da9055_dai_ops')
   sound/soc/codecs/da9055.c:1327:28: warning: excess elements in struct initializer
   sound/soc/codecs/da9055.c:1327:28: note: (near initialization for 'da9055_dai_ops')
   cc1: some warnings being treated as errors
..


vim +346 sound/soc/soc-dai.c

   324	
   325	/**
   326	 * snd_soc_dai_set_data_pins - configure DAI parallel data pins
   327	 * @dai: DAI
   328	 * @tx_data_pins: number of data pins used for TX
   329	 * @rx_data_pins: number of data pins used for RX
   330	 *
   331	 * This function can be used to set the number of parallel data pins wired up
   332	 * between the codec and CPU.
   333	 */
   334	int snd_soc_dai_set_data_pins(struct snd_soc_dai *dai,
   335				      unsigned int tx_data_pins,
   336				      unsigned int rx_data_pins)
   337	{
   338		snd_soc_dai_data_pins_set(dai, SNDRV_PCM_STREAM_PLAYBACK, tx_data_pins);
   339		snd_soc_dai_data_pins_set(dai, SNDRV_PCM_STREAM_CAPTURE, rx_data_pins);
   340	
   341		if (dai->driver->ops->set_data_pins)
   342			return dai->driver->ops->set_data_pins(dai, tx_data_pins,
   343							       rx_data_pins);
   344		else
   345			return -ENOTSUPP;
 > 346	}
   347	EXPORT_SYMBOL_GPL(snd_soc_dai_set_data_pins);
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
