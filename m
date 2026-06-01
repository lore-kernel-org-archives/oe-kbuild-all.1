Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C831A3AE18D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322759; cv=none; b=kjtDhB9+1FnXJwvZQO87rK3o5ChvQonfuda+RxMDMKgohnbQX4Jd5tScLCJwdNpegRvku3BzEpfEHhFKhiPU4zkLyBrUwHxwSZYcafYr1aQ7Mhvj/2QtYJWRyOl6DAZbIkEQsT+35tjcSSXJ/+q30NV/mpZxYiUgNFWkJeJTeyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322759; c=relaxed/simple;
	bh=0ntkprx88v5ZPCY0OlyLAQLxoGSri9TIlf2JG1hTIwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ETSwVYQNy80STnXRJ8edkBV2qW2JyJhRxO+QR8hKChXwVZOtP3c/HZaZ6+lfiguBYg1qOH5wTFF+OUR1xB29PkogIRI70C5QKf7CHihzGX0w0VtjVG4bba67F5gzYmlVd/MP0neU+4lqsqXCZDQAOhaUu2zFOnpQn44X6nm0iMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCMmh9rZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCMmh9rZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322757; x=1811858757;
  h=date:from:to:cc:subject:message-id;
  bh=0ntkprx88v5ZPCY0OlyLAQLxoGSri9TIlf2JG1hTIwc=;
  b=CCMmh9rZiTOaWUuJXUizdkIjaieIHb1EMfjyoLj5hwYfHIo98dBEhKWc
   tPiazKbydUbUM2brJNmU6YZ4e9GAcpYmPgDoseX49ri3oZ0AYWi4zmJjr
   S9CBQa678gb72rkioAAtqXy3AH26Q1EInF93xO0RaiZu0g9Mh+3bvEvS1
   kb4H7qmn01GzDEqf8YOugndYnBCaQhSQrKBfOEULudYBUQDf+Mi6AmmSy
   b5Ey1Bqwq8sxLD5DD0Nhwvj8Q3jEr/cjg688XmbKPc3VDTJvFIJFbUNbL
   fV+Oiy1ifQ5lAVGVjmVu7eRx3OufuzaeU7vI4TW2MzAQKJwJNSfxIQxk/
   g==;
X-CSE-ConnectionGUID: kc+mQizDQRSltNDW1dSWlw==
X-CSE-MsgGUID: BumBi5R7T+KVtoyz6No7SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80112449"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80112449"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:05:56 -0700
X-CSE-ConnectionGUID: awzkQ+/DSMeBiOzhjxmTFw==
X-CSE-MsgGUID: h9/aDo7mRsmCuXwAR98zTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="247545904"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Jun 2026 07:05:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU3H5-00000000AeE-2OeT;
	Mon, 01 Jun 2026 14:05:51 +0000
Date: Mon, 01 Jun 2026 22:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt8186/mt8186-mt6366.c:1100:17: warning: excess elements
 in struct initializer
Message-ID: <202606012250.Qre11SKC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: cc97e5ee4f734c20e86677cf9ed8ac4c87277f2a [290/290] ASoC: mediatek: common: use snd_soc_card_register()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260601/202606012250.Qre11SKC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012250.Qre11SKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012250.Qre11SKC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1099:15: error: variable 'mt8186_mt6366_da7219_max98357_soc_card' has initializer but incomplete type
    1099 | static struct snd_soc_card_platform mt8186_mt6366_da7219_max98357_soc_card = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1100:10: error: 'struct snd_soc_card_platform' has no member named 'name'
    1100 |         .name = "mt8186_da7219_max98357",
         |          ^~~~
>> sound/soc/mediatek/mt8186/mt8186-mt6366.c:1100:17: warning: excess elements in struct initializer
    1100 |         .name = "mt8186_da7219_max98357",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1100:17: note: (near initialization for 'mt8186_mt6366_da7219_max98357_soc_card')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1101:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
    1101 |         .owner = THIS_MODULE,
         |          ^~~~~
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/cache.h:9,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/input.h:8,
                    from sound/soc/mediatek/mt8186/mt8186-mt6366.c:14:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1101:18: note: in expansion of macro 'THIS_MODULE'
    1101 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'mt8186_mt6366_da7219_max98357_soc_card')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1101:18: note: in expansion of macro 'THIS_MODULE'
    1101 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1102:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
    1102 |         .driver = {
         |          ^~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1102:19: error: extra brace group at end of initializer
    1102 |         .driver = {
         |                   ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1102:19: note: (near initialization for 'mt8186_mt6366_da7219_max98357_soc_card')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1102:19: warning: excess elements in struct initializer
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1102:19: note: (near initialization for 'mt8186_mt6366_da7219_max98357_soc_card')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1116:15: error: variable 'mt8186_mt6366_rt1019_rt5682s_soc_card' has initializer but incomplete type
    1116 | static struct snd_soc_card_platform mt8186_mt6366_rt1019_rt5682s_soc_card = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1117:10: error: 'struct snd_soc_card_platform' has no member named 'name'
    1117 |         .name = "mt8186_rt1019_rt5682s",
         |          ^~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1117:17: warning: excess elements in struct initializer
    1117 |         .name = "mt8186_rt1019_rt5682s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1117:17: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_soc_card')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1118:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
    1118 |         .owner = THIS_MODULE,
         |          ^~~~~
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1118:18: note: in expansion of macro 'THIS_MODULE'
    1118 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_soc_card')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1118:18: note: in expansion of macro 'THIS_MODULE'
    1118 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1119:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
    1119 |         .driver = {
         |          ^~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1119:19: error: extra brace group at end of initializer
    1119 |         .driver = {
         |                   ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1119:19: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_soc_card')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1119:19: warning: excess elements in struct initializer
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1119:19: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_soc_card')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1133:15: error: variable 'mt8186_mt6366_rt5682s_max98360_soc_card' has initializer but incomplete type
    1133 | static struct snd_soc_card_platform mt8186_mt6366_rt5682s_max98360_soc_card = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1134:10: error: 'struct snd_soc_card_platform' has no member named 'name'
    1134 |         .name = "mt8186_rt5682s_max98360",
         |          ^~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1134:17: warning: excess elements in struct initializer
    1134 |         .name = "mt8186_rt5682s_max98360",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1134:17: note: (near initialization for 'mt8186_mt6366_rt5682s_max98360_soc_card')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1135:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
    1135 |         .owner = THIS_MODULE,
         |          ^~~~~
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1135:18: note: in expansion of macro 'THIS_MODULE'
    1135 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'mt8186_mt6366_rt5682s_max98360_soc_card')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1135:18: note: in expansion of macro 'THIS_MODULE'
    1135 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1136:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
    1136 |         .driver = {
         |          ^~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1136:19: error: extra brace group at end of initializer
    1136 |         .driver = {
         |                   ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:1136:19: note: (near initialization for 'mt8186_mt6366_rt5682s_max98360_soc_card')
--
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1307:15: error: variable 'mt8188_mt6359_soc_card' has initializer but incomplete type
    1307 | static struct snd_soc_card_platform mt8188_mt6359_soc_card = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1308:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
    1308 |         .owner = THIS_MODULE,
         |          ^~~~~
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/cache.h:9,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/input.h:8,
                    from sound/soc/mediatek/mt8188/mt8188-mt6359.c:10:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1308:18: note: in expansion of macro 'THIS_MODULE'
    1308 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'mt8188_mt6359_soc_card')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1308:18: note: in expansion of macro 'THIS_MODULE'
    1308 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1309:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
    1309 |         .driver = {
         |          ^~~~~~
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1309:19: error: extra brace group at end of initializer
    1309 |         .driver = {
         |                   ^
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1309:19: note: (near initialization for 'mt8188_mt6359_soc_card')
>> sound/soc/mediatek/mt8188/mt8188-mt6359.c:1309:19: warning: excess elements in struct initializer
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1309:19: note: (near initialization for 'mt8188_mt6359_soc_card')
   sound/soc/mediatek/mt8188/mt8188-mt6359.c:1307:37: error: storage size of 'mt8188_mt6359_soc_card' isn't known
    1307 | static struct snd_soc_card_platform mt8188_mt6359_soc_card = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1246:15: error: variable 'mt8195_mt6359_soc_card' has initializer but incomplete type
    1246 | static struct snd_soc_card_platform mt8195_mt6359_soc_card = {
         |               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1247:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
    1247 |         .owner = THIS_MODULE,
         |          ^~~~~
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/cache.h:9,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/input.h:8,
                    from sound/soc/mediatek/mt8195/mt8195-mt6359.c:11:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1247:18: note: in expansion of macro 'THIS_MODULE'
    1247 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'mt8195_mt6359_soc_card')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1247:18: note: in expansion of macro 'THIS_MODULE'
    1247 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1248:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
    1248 |         .driver = {
         |          ^~~~~~
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1248:19: error: extra brace group at end of initializer
    1248 |         .driver = {
         |                   ^
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1248:19: note: (near initialization for 'mt8195_mt6359_soc_card')
>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1248:19: warning: excess elements in struct initializer
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1248:19: note: (near initialization for 'mt8195_mt6359_soc_card')
   sound/soc/mediatek/mt8195/mt8195-mt6359.c:1246:37: error: storage size of 'mt8195_mt6359_soc_card' isn't known
    1246 | static struct snd_soc_card_platform mt8195_mt6359_soc_card = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~


vim +1100 sound/soc/mediatek/mt8186/mt8186-mt6366.c

0da16e370dd7a1 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c Jiaxin Yu                  2022-07-19  1098  
cc97e5ee4f734c sound/soc/mediatek/mt8186/mt8186-mt6366.c                Kuninori Morimoto          2026-05-18  1099  static struct snd_soc_card_platform mt8186_mt6366_da7219_max98357_soc_card = {
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16 @1100  	.name = "mt8186_da7219_max98357",
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1101  	.owner = THIS_MODULE,
cc97e5ee4f734c sound/soc/mediatek/mt8186/mt8186-mt6366.c                Kuninori Morimoto          2026-05-18  1102  	.driver = {
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1103  		.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1104  		.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1105  		.controls = mt8186_mt6366_da7219_max98357_controls,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1106  		.num_controls = ARRAY_SIZE(mt8186_mt6366_da7219_max98357_controls),
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1107  		.dapm_widgets = mt8186_mt6366_da7219_max98357_widgets,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1108  		.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_da7219_max98357_widgets),
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1109  		.dapm_routes = mt8186_mt6366_rt1019_rt5682s_routes,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1110  		.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_routes),
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1111  		.codec_conf = mt8186_mt6366_rt1019_rt5682s_codec_conf,
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1112  		.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
cc97e5ee4f734c sound/soc/mediatek/mt8186/mt8186-mt6366.c                Kuninori Morimoto          2026-05-18  1113  	},
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1114  };
6ed619b348bf0a sound/soc/mediatek/mt8186/mt8186-mt6366.c                AngeloGioacchino Del Regno 2024-04-16  1115  

:::::: The code at line 1100 was first introduced by commit
:::::: 6ed619b348bf0a490e70dea7a330cf44dc81c16d ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
