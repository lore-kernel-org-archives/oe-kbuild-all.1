Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86437C921
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774795172; cv=none; b=Ke1bBk4mE6dliGNIgnBo5IoDY0plUTl8l3G2hdiMwGqvaTbBQdAHFsN1AKf/Em8fBl1qi9WZqXpX/nKjvKmRbuk92EqtmOz14dZ5O35SNIglXtyNSg5szPe/a0gH5Jr5TJlrBGO3OIvWE7JtPOondpqqZpSLrxFOV5ihe4eMiGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774795172; c=relaxed/simple;
	bh=dyc7Ot+5eUZGpn1ldKmNK6t2tbn1lPGrpCnj1341WAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OM654qfV9I2mzBETvQrLWtuOz5qoRLnl2zCiQGAZ1RBuDbG1gz5jmqWQ0PnsGnZh3vbLTogDrOMennWPlSqlU+ztVOD/VA07mfwJxfQbz1C/sD3O5rDcK0IFXE/838/rfyN3DBU11UXZV4/bm3kdxf524CHfdcj3Tw/VUuJMtt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTlLl0fR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTlLl0fR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774795169; x=1806331169;
  h=date:from:to:cc:subject:message-id;
  bh=dyc7Ot+5eUZGpn1ldKmNK6t2tbn1lPGrpCnj1341WAo=;
  b=LTlLl0fRZtepNL4uEjrMbaibE+yuC0YkJ39ZK6sqX0K3QAxEXUzqP39z
   TVLl+KUXOorlwsjHTJ1p7yzXv0Q9weFb7TGfzAVP8CBPRK3q24Yqr+xCT
   ZYp27NqgPeWxWktQ8jiyCM8AsHkfrhjw2uAVqpAchAxujysn6cr9NFJFO
   H/2zZDIOpuLOmh4PeD1csZpawTI7v/qa1rGABR8KXKc+Bmfcjq5wYgE8j
   DaLTopN9Cprpoh9g1BIODfbOndjnvSCIk/JcqAU1/ORk6eb5otcyQQv/c
   Kn6syFRzM7ycH4gaAB9AQ3FpUSVROl6UrA4JK73pyq+S/pTbBsFjQ5zH8
   A==;
X-CSE-ConnectionGUID: EHg6fnOaQLeFyrSiblxNXg==
X-CSE-MsgGUID: R7fon2EpQYyhxIiNVQyeew==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="78399069"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="78399069"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 07:39:28 -0700
X-CSE-ConnectionGUID: lRylkm1sRBCYav2qfCdN7g==
X-CSE-MsgGUID: cK4i0kkdR3iH9JWKJCNHOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="221408315"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 07:39:26 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6rIS-00000000CSh-1ZDG;
	Sun, 29 Mar 2026 14:39:24 +0000
Date: Sun, 29 Mar 2026 22:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 101/106]
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:109:36: error: implicit
 declaration of function 'snd_soc_dai_get_drvdata'; did you mean
 'snd_soc_card_get_drvdata'?
Message-ID: <202603292221.l2UrMYuc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: feccc3fa86242c4532cc238e50998046b7ba39f6 [101/106] ASoC: soc-dai: remove snd_soc_dai_{set/get}_drvdata()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260329/202603292221.l2UrMYuc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603292221.l2UrMYuc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603292221.l2UrMYuc-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_startup':
>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:109:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     109 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:109:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_shutdown':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:144:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     144 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_prepare':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:232:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     232 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_afe_i2s_set_sysclk':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:266:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     266 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_btmrg_startup':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:288:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     288 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_btmrg_hw_params':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:305:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     305 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_btmrg_shutdown':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:346:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_simple_fe_startup':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:366:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     366 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_simple_fe_hw_params':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:386:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     386 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_dlm_fe_startup':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:402:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     402 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_dlm_fe_shutdown':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:428:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     428 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_dlm_fe_hw_params':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:447:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     447 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c: In function 'mt2701_dlm_fe_trigger':
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:469:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     469 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c: In function 'mtk_dai_pcm_hw_params':
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:185:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     185 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:185:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   sound/soc/mediatek/mt6797/mt6797-dai-hostless.c: In function 'mtk_dai_hostless_startup':
>> sound/soc/mediatek/mt6797/mt6797-dai-hostless.c:40:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
      40 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt6797/mt6797-dai-hostless.c:40:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c: In function 'mtk_dai_adda_hw_params':
>> sound/soc/mediatek/mt6797/mt6797-dai-adda.c:155:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     155 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt6797/mt6797-dai-adda.c:155:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c: In function 'mtk_dai_etdm_startup':
>> sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:121:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     121 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:121:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c: In function 'mtk_dai_etdm_shutdown':
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:138:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     138 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c: In function 'mtk_dai_etdm_hw_params':
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:241:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     241 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c: In function 'mtk_dai_etdm_trigger':
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:266:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     266 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c: In function 'mtk_dai_etdm_set_fmt':
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:293:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     293 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_startup':
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     297 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_shutdown':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:310:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     310 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_prepare':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:325:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_startup':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:346:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_shutdown':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:360:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     360 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_prepare':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:374:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     374 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_trigger':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:436:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     436 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_hw_params':
>> sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:776:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     776 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:776:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: In function 'mtk_dai_i2s_set_fmt':
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:836:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     836 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c: In function 'mtk_dai_tdm_hw_params':
>> sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:468:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     468 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:468:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c: In function 'mtk_dai_tdm_trigger':
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:585:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     585 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c: In function 'mtk_dai_pcm_hw_params':
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:185:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     185 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:185:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   sound/soc/mediatek/mt8183/mt8183-dai-hostless.c: In function 'mtk_dai_hostless_startup':
>> sound/soc/mediatek/mt8183/mt8183-dai-hostless.c:40:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
      40 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt8183/mt8183-dai-hostless.c:40:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c: In function 'mtk_dai_adda_hw_params':
>> sound/soc/mediatek/mt8183/mt8183-dai-adda.c:273:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     273 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
>> sound/soc/mediatek/mt8183/mt8183-dai-adda.c:273:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
..


vim +109 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c

43a6a7e71063ef2 Garlic Tseng 2016-07-04  105  
43a6a7e71063ef2 Garlic Tseng 2016-07-04  106  static int mt2701_afe_i2s_startup(struct snd_pcm_substream *substream,
43a6a7e71063ef2 Garlic Tseng 2016-07-04  107  				  struct snd_soc_dai *dai)
43a6a7e71063ef2 Garlic Tseng 2016-07-04  108  {
e4b31b816c472ba Ryder Lee    2018-04-25 @109  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
bfdc56e54890fd6 Ryder Lee    2018-04-25  110  	struct mt2701_afe_private *afe_priv = afe->platform_priv;
43a6a7e71063ef2 Garlic Tseng 2016-07-04  111  	int i2s_num = mt2701_dai_num_to_i2s(afe, dai->id);
bfdc56e54890fd6 Ryder Lee    2018-04-25  112  	bool mode = afe_priv->soc->has_one_heart_mode;
43a6a7e71063ef2 Garlic Tseng 2016-07-04  113  
43a6a7e71063ef2 Garlic Tseng 2016-07-04  114  	if (i2s_num < 0)
43a6a7e71063ef2 Garlic Tseng 2016-07-04  115  		return i2s_num;
43a6a7e71063ef2 Garlic Tseng 2016-07-04  116  
bfdc56e54890fd6 Ryder Lee    2018-04-25  117  	return mt2701_afe_enable_mclk(afe, mode ? 1 : i2s_num);
43a6a7e71063ef2 Garlic Tseng 2016-07-04  118  }
43a6a7e71063ef2 Garlic Tseng 2016-07-04  119  

:::::: The code at line 109 was first introduced by commit
:::::: e4b31b816c472ba5907b01a6f6a1626c1e8d51ef ASoC: mediatek: use snd_soc_dai_get_drvdata() to get the private data

:::::: TO: Ryder Lee <ryder.lee@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
