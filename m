Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216D1D9A51
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729847708; cv=none; b=DJGT/Zt97o7dd+xZyjxv8PufbgeLjsptLmBSV7m3EnAa4F61vk72eSkd2vlj8GkmEQ/E3gXEAUTESmkDPr5bItqcdzn/cAWAZBlqOMHHASk5czVWrHenXjBoac7PnwXo08nR69e13sUxTaP6j2Lqf5R3sJHRM0i/U0cgM2fgLA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729847708; c=relaxed/simple;
	bh=+YNZj4UIz5SqCIcEHAmF1MTos1odkQV8N0MppzByhpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCfdIQv1Kh0iNArztw9kbvH19R02Xu910Mn8SkYaP5Y6jZxh5DitCxRMmJgd5vQi9cR4CMiRh3X/R8Nvc88UeDiQQhnITtt4vGvOuuZ31aFkf0Yosnstpk+jwfgnA0vm8oSLqZ5PBVu0soMX8AfwfBq1qRvhm0kbnPwjYblgDtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEDJvG71; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEDJvG71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729847705; x=1761383705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YNZj4UIz5SqCIcEHAmF1MTos1odkQV8N0MppzByhpo=;
  b=kEDJvG71AKmYFRJQ+7enQj5pnIHDprxdCS+iA2JW2kJAAxEox+0NaNO7
   wsP5Wl8yoFurZnwmePPrtkt99gGv8aBYTvyMtjVIqsrGCvCOavAYZZvmR
   uU2kE8WxnNVEpZZjlwI0D6/awYg6ddgm2LjdIcPC77nrJ2dO8wBmuobtO
   VjyUNUvvBCXpfe4rROjYJd6kt5z5Oe1RsWdKGFySwQr6WSaQQ9yCzTT+P
   kQRcK+uFr70gVJ2FEDiy049bHPZMRm3lDVviWTtVE4HF1gyWi1kyLViPT
   xWLuDGiNoH4IFQuGd51dxTdeA5FjvTW1wE2nudnBfh0hadsvFM/ypW0Bf
   g==;
X-CSE-ConnectionGUID: vxEYXyz8Q9e2a0NY+OSebw==
X-CSE-MsgGUID: RiMQGRuXQmSBUVPzC+xUQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52066559"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52066559"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:14:55 -0700
X-CSE-ConnectionGUID: M9K3cC2NSG6FEjjpYFQk4A==
X-CSE-MsgGUID: X2NdxeCjSE6IMM1FAnWnpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85653617"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2024 02:14:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4GPD-000XyM-13;
	Fri, 25 Oct 2024 09:14:51 +0000
Date: Fri, 25 Oct 2024 17:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-pcmv2-2024-10-22 2/3] sound/soc/soc-utils.c:134:55:
 error: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202410251732.tUllHWUv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-pcmv2-2024-10-22
head:   ad08834668b453f25c4d160e515f18b8f3d5fd39
commit: 9c5ddaa0866d7901f7f8a0203fcf371ba5c67cde [2/3] rtd1 / dai_link1
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410251732.tUllHWUv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251732.tUllHWUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251732.tUllHWUv-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-utils.c: In function 'dummy_dma_open':
   sound/soc/soc-utils.c:134:55: error: implicit declaration of function 'snd_soc_dai_link_to_link1'; did you mean 'snd_soc_link_to_codec'? [-Wimplicit-function-declaration]
     134 |                 struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                       snd_soc_link_to_codec
>> sound/soc/soc-utils.c:134:55: error: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/soc-utils.c:136:31: error: invalid use of undefined type 'struct snd_soc_dai_link1'
     136 |                 if (!dai_link1->no_pcm)
         |                               ^~
--
   sound/soc/amd/acp-da7219-max98357a.c:545:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     545 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
>> sound/soc/amd/acp-da7219-max98357a.c:545:34: error: initialization of 'void (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     545 |                 .dpcm_playback = 1,
         |                                  ^
   sound/soc/amd/acp-da7219-max98357a.c:545:34: note: (near initialization for 'cz_dai_7219_98357[0].exit')
   sound/soc/amd/acp-da7219-max98357a.c:555:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     555 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
>> sound/soc/amd/acp-da7219-max98357a.c:555:33: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     555 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/amd/acp-da7219-max98357a.c:555:33: note: (near initialization for 'cz_dai_7219_98357[1].init')
   sound/soc/amd/acp-da7219-max98357a.c:565:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     565 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/amd/acp-da7219-max98357a.c:565:34: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     565 |                 .dpcm_playback = 1,
         |                                  ^
   sound/soc/amd/acp-da7219-max98357a.c:565:34: note: (near initialization for 'cz_dai_7219_98357[2].init')
   sound/soc/amd/acp-da7219-max98357a.c:576:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     576 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/amd/acp-da7219-max98357a.c:576:33: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     576 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/amd/acp-da7219-max98357a.c:576:33: note: (near initialization for 'cz_dai_7219_98357[3].init')
   sound/soc/amd/acp-da7219-max98357a.c:587:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     587 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/amd/acp-da7219-max98357a.c:587:33: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     587 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/amd/acp-da7219-max98357a.c:587:33: note: (near initialization for 'cz_dai_7219_98357[4].init')
   sound/soc/amd/acp-da7219-max98357a.c:601:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     601 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/amd/acp-da7219-max98357a.c:601:34: error: initialization of 'void (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     601 |                 .dpcm_playback = 1,
         |                                  ^
   sound/soc/amd/acp-da7219-max98357a.c:601:34: note: (near initialization for 'cz_dai_5682_98357[0].exit')
   sound/soc/amd/acp-da7219-max98357a.c:611:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     611 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/amd/acp-da7219-max98357a.c:611:33: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     611 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/amd/acp-da7219-max98357a.c:611:33: note: (near initialization for 'cz_dai_5682_98357[1].init')
   sound/soc/amd/acp-da7219-max98357a.c:621:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     621 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/amd/acp-da7219-max98357a.c:621:34: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     621 |                 .dpcm_playback = 1,
         |                                  ^
   sound/soc/amd/acp-da7219-max98357a.c:621:34: note: (near initialization for 'cz_dai_5682_98357[2].init')
   sound/soc/amd/acp-da7219-max98357a.c:632:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     632 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/amd/acp-da7219-max98357a.c:632:33: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     632 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/amd/acp-da7219-max98357a.c:632:33: note: (near initialization for 'cz_dai_5682_98357[3].init')
   sound/soc/amd/acp-da7219-max98357a.c:643:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     643 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/amd/acp-da7219-max98357a.c:643:33: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     643 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/amd/acp-da7219-max98357a.c:643:33: note: (near initialization for 'cz_dai_5682_98357[4].init')
--
   sound/soc/fsl/fsl-asoc-card.c:320:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_playback'
     320 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:321:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_capture'
     321 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
>> sound/soc/fsl/fsl-asoc-card.c:321:33: error: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     321 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/fsl/fsl-asoc-card.c:321:33: note: (near initialization for 'fsl_asoc_card_dai[1].cpus')
   sound/soc/fsl/fsl-asoc-card.c:322:18: error: 'const struct snd_soc_dai_link' has no member named 'dynamic'
     322 |                 .dynamic = 1,
         |                  ^~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:329:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_playback'
     329 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:330:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_capture'
     330 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:331:18: error: 'const struct snd_soc_dai_link' has no member named 'no_pcm'
     331 |                 .no_pcm = 1,
         |                  ^~~~~~
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_spdif_init':
   sound/soc/fsl/fsl-asoc-card.c:507:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     507 |                 priv->dai_link[1].dpcm_capture = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:508:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     508 |                 priv->dai_link[2].dpcm_capture = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:512:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     512 |                 priv->dai_link[1].dpcm_playback = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:513:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     513 |                 priv->dai_link[2].dpcm_playback = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_probe':
   sound/soc/fsl/fsl-asoc-card.c:767:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     767 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:768:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     768 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:794:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     794 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:795:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     795 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:801:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     801 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:802:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     802 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
--
   sound/soc/samsung/speyside.c:222:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     222 |                 .c2c_params = &dsp_codec_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/speyside.c:222:31: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from incompatible pointer type 'const struct snd_soc_pcm_stream *' [-Wincompatible-pointer-types]
     222 |                 .c2c_params = &dsp_codec_params,
         |                               ^
   sound/soc/samsung/speyside.c:222:31: note: (near initialization for 'speyside_dai[1].init')
   sound/soc/samsung/speyside.c:222:31: warning: initialized field overwritten [-Woverride-init]
   sound/soc/samsung/speyside.c:222:31: note: (near initialization for 'speyside_dai[1].init')
   sound/soc/samsung/speyside.c:223:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     223 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
>> sound/soc/samsung/speyside.c:223:35: error: initialization of 'void (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     223 |                 .num_c2c_params = 1,
         |                                   ^
   sound/soc/samsung/speyside.c:223:35: note: (near initialization for 'speyside_dai[1].exit')
--
   sound/soc/samsung/lowland.c:126:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     126 |                 .c2c_params = &sub_params,
         |                  ^~~~~~~~~~
>> sound/soc/samsung/lowland.c:126:31: error: initialization of 'unsigned char:1' from 'const struct snd_soc_pcm_stream *' makes integer from pointer without a cast [-Wint-conversion]
     126 |                 .c2c_params = &sub_params,
         |                               ^
   sound/soc/samsung/lowland.c:126:31: note: (near initialization for 'lowland_dai[2].symmetric_rate')
   sound/soc/samsung/lowland.c:126:31: error: initializer element is not computable at load time
   sound/soc/samsung/lowland.c:126:31: note: (near initialization for 'lowland_dai[2].symmetric_rate')
   sound/soc/samsung/lowland.c:127:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     127 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
--
   sound/soc/samsung/littlemill.c:170:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     170 |                 .c2c_params = &baseband_params,
         |                  ^~~~~~~~~~
>> sound/soc/samsung/littlemill.c:170:31: error: initialization of 'unsigned char:1' from 'const struct snd_soc_pcm_stream *' makes integer from pointer without a cast [-Wint-conversion]
     170 |                 .c2c_params = &baseband_params,
         |                               ^
   sound/soc/samsung/littlemill.c:170:31: note: (near initialization for 'littlemill_dai[1].symmetric_rate')
   sound/soc/samsung/littlemill.c:170:31: error: initializer element is not computable at load time
   sound/soc/samsung/littlemill.c:170:31: note: (near initialization for 'littlemill_dai[1].symmetric_rate')
   sound/soc/samsung/littlemill.c:171:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     171 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
--
   sound/soc/samsung/bells.c:267:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     267 |                 .c2c_params = &sub_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/bells.c:267:31: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from incompatible pointer type 'const struct snd_soc_pcm_stream *' [-Wincompatible-pointer-types]
     267 |                 .c2c_params = &sub_params,
         |                               ^
   sound/soc/samsung/bells.c:267:31: note: (near initialization for 'bells_dai_wm2200[1].init')
   sound/soc/samsung/bells.c:268:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     268 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
>> sound/soc/samsung/bells.c:268:35: error: initialization of 'void (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     268 |                 .num_c2c_params = 1,
         |                                   ^
   sound/soc/samsung/bells.c:268:35: note: (near initialization for 'bells_dai_wm2200[1].exit')
   sound/soc/samsung/bells.c:304:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     304 |                 .c2c_params = &sub_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/bells.c:304:31: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from incompatible pointer type 'const struct snd_soc_pcm_stream *' [-Wincompatible-pointer-types]
     304 |                 .c2c_params = &sub_params,
         |                               ^
   sound/soc/samsung/bells.c:304:31: note: (near initialization for 'bells_dai_wm5102[1].init')
   sound/soc/samsung/bells.c:305:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     305 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
   sound/soc/samsung/bells.c:305:35: error: initialization of 'void (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     305 |                 .num_c2c_params = 1,
         |                                   ^
   sound/soc/samsung/bells.c:305:35: note: (near initialization for 'bells_dai_wm5102[1].exit')
   sound/soc/samsung/bells.c:315:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     315 |                 .c2c_params = &baseband_params,
         |                  ^~~~~~~~~~
>> sound/soc/samsung/bells.c:315:31: error: initialization of 'unsigned char:1' from 'const struct snd_soc_pcm_stream *' makes integer from pointer without a cast [-Wint-conversion]
     315 |                 .c2c_params = &baseband_params,
         |                               ^
   sound/soc/samsung/bells.c:315:31: note: (near initialization for 'bells_dai_wm5102[2].symmetric_rate')
   sound/soc/samsung/bells.c:315:31: error: initializer element is not computable at load time
   sound/soc/samsung/bells.c:315:31: note: (near initialization for 'bells_dai_wm5102[2].symmetric_rate')
   sound/soc/samsung/bells.c:316:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     316 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
   sound/soc/samsung/bells.c:325:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     325 |                 .c2c_params = &sub_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/bells.c:325:31: error: initialization of 'unsigned char:1' from 'const struct snd_soc_pcm_stream *' makes integer from pointer without a cast [-Wint-conversion]
     325 |                 .c2c_params = &sub_params,
         |                               ^
   sound/soc/samsung/bells.c:325:31: note: (near initialization for 'bells_dai_wm5102[3].symmetric_rate')
   sound/soc/samsung/bells.c:325:31: error: initializer element is not computable at load time
   sound/soc/samsung/bells.c:325:31: note: (near initialization for 'bells_dai_wm5102[3].symmetric_rate')
   sound/soc/samsung/bells.c:326:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     326 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
   sound/soc/samsung/bells.c:362:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     362 |                 .c2c_params = &sub_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/bells.c:362:31: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *)' from incompatible pointer type 'const struct snd_soc_pcm_stream *' [-Wincompatible-pointer-types]
     362 |                 .c2c_params = &sub_params,
         |                               ^
   sound/soc/samsung/bells.c:362:31: note: (near initialization for 'bells_dai_wm5110[1].init')
   sound/soc/samsung/bells.c:363:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     363 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
   sound/soc/samsung/bells.c:363:35: error: initialization of 'void (*)(struct snd_soc_pcm_runtime *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     363 |                 .num_c2c_params = 1,
         |                                   ^
   sound/soc/samsung/bells.c:363:35: note: (near initialization for 'bells_dai_wm5110[1].exit')
   sound/soc/samsung/bells.c:373:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     373 |                 .c2c_params = &baseband_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/bells.c:373:31: error: initialization of 'unsigned char:1' from 'const struct snd_soc_pcm_stream *' makes integer from pointer without a cast [-Wint-conversion]
     373 |                 .c2c_params = &baseband_params,
         |                               ^
   sound/soc/samsung/bells.c:373:31: note: (near initialization for 'bells_dai_wm5110[2].symmetric_rate')
   sound/soc/samsung/bells.c:373:31: error: initializer element is not computable at load time
   sound/soc/samsung/bells.c:373:31: note: (near initialization for 'bells_dai_wm5110[2].symmetric_rate')
   sound/soc/samsung/bells.c:374:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     374 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
   sound/soc/samsung/bells.c:383:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     383 |                 .c2c_params = &sub_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/bells.c:383:31: error: initialization of 'unsigned char:1' from 'const struct snd_soc_pcm_stream *' makes integer from pointer without a cast [-Wint-conversion]
     383 |                 .c2c_params = &sub_params,
         |                               ^
   sound/soc/samsung/bells.c:383:31: note: (near initialization for 'bells_dai_wm5110[3].symmetric_rate')
   sound/soc/samsung/bells.c:383:31: error: initializer element is not computable at load time
   sound/soc/samsung/bells.c:383:31: note: (near initialization for 'bells_dai_wm5110[3].symmetric_rate')
   sound/soc/samsung/bells.c:384:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     384 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
--
   sound/soc/samsung/aries_wm8994.c:485:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     485 |                 .c2c_params = &baseband_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/aries_wm8994.c:485:31: error: initialization of 'void (*)(struct snd_soc_pcm_runtime *)' from incompatible pointer type 'const struct snd_soc_pcm_stream *' [-Wincompatible-pointer-types]
     485 |                 .c2c_params = &baseband_params,
         |                               ^
   sound/soc/samsung/aries_wm8994.c:485:31: note: (near initialization for 'aries_dai[1].exit')
   sound/soc/samsung/aries_wm8994.c:486:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     486 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
>> sound/soc/samsung/aries_wm8994.c:486:35: error: initialization of 'int (*)(struct snd_soc_pcm_runtime *, struct snd_pcm_hw_params *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     486 |                 .num_c2c_params = 1,
         |                                   ^
   sound/soc/samsung/aries_wm8994.c:486:35: note: (near initialization for 'aries_dai[1].be_hw_params_fixup')
   sound/soc/samsung/aries_wm8994.c:493:18: error: 'struct snd_soc_dai_link' has no member named 'c2c_params'
     493 |                 .c2c_params = &bluetooth_params,
         |                  ^~~~~~~~~~
   sound/soc/samsung/aries_wm8994.c:493:31: error: incompatible types when initializing type 'enum snd_soc_link_version' using type 'const struct snd_soc_pcm_stream *'
     493 |                 .c2c_params = &bluetooth_params,
         |                               ^
   sound/soc/samsung/aries_wm8994.c:494:18: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
     494 |                 .num_c2c_params = 1,
         |                  ^~~~~~~~~~~~~~
   sound/soc/samsung/aries_wm8994.c:494:35: error: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     494 |                 .num_c2c_params = 1,
         |                                   ^
   sound/soc/samsung/aries_wm8994.c:494:35: note: (near initialization for 'aries_dai[2].cpus')
   In file included from sound/soc/samsung/aries_wm8994.c:12:
   sound/soc/samsung/aries_wm8994.c:496:37: warning: initialized field overwritten [-Woverride-init]
     496 |                 SND_SOC_DAILINK_REG(bluetooth),
         |                                     ^~~~~~~~~
   include/sound/soc.h:920:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     920 |         .cpus           = cpu,                          \
         |                           ^~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   sound/soc/samsung/aries_wm8994.c:496:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     496 |                 SND_SOC_DAILINK_REG(bluetooth),
         |                 ^~~~~~~~~~~~~~~~~~~
   sound/soc/samsung/aries_wm8994.c:496:37: note: (near initialization for 'aries_dai[2].cpus')
     496 |                 SND_SOC_DAILINK_REG(bluetooth),
         |                                     ^~~~~~~~~
   include/sound/soc.h:920:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     920 |         .cpus           = cpu,                          \
         |                           ^~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   sound/soc/samsung/aries_wm8994.c:496:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     496 |                 SND_SOC_DAILINK_REG(bluetooth),
         |                 ^~~~~~~~~~~~~~~~~~~
..


vim +134 sound/soc/soc-utils.c

   114	
   115	static int dummy_dma_open(struct snd_soc_component *component,
   116				  struct snd_pcm_substream *substream)
   117	{
   118		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   119		int i;
   120	
   121		/*
   122		 * If there are other components associated with rtd, we shouldn't
   123		 * override their hwparams
   124		 */
   125		for_each_rtd_components(rtd, i, component) {
   126			if (component->driver == &dummy_platform)
   127				return 0;
   128		}
   129	
   130		/* BE's dont need dummy params */
   131		/* create the pcm */
   132		switch (rtd->dai_link->version) {
   133		case SND_SOC_LINK_VER1:
 > 134			struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
   135	
   136			if (!dai_link1->no_pcm)
   137				snd_soc_set_runtime_hwparams(substream, &dummy_dma_hardware);
   138			break;
   139		default:
   140			dev_err(rtd->dev, "unsupported link version is selected\n");
   141		}
   142	
   143	
   144		return 0;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
