Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B80F3E7148
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813652; cv=none; b=XBlOqK4LdWVJU5x6LQDE7NnLV/GCH8Bgqa3ZYzUXUOGNSY+NtFbfFr2XXGPBazzSaZghe27YW1VIZcf333SD+Ybqu+TpjVT3M7corPfg3lLeAdPs/LqrOGlWLHg2X0lbJR5CL+ur/pH8NeaevwnhqyXcHMhK5s3oJDuH3MZlIvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813652; c=relaxed/simple;
	bh=mddcuYMJxbpUTJn5iQMnXpnFHfLvackuRw4GUpOZbgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IdpX3aVwJCIVM6KLegPLQlT6xoSKmSWMSiFSHo6HRrSJfVqKxHHmE/MgMYuyArUZLIMzGyIu6ZFXK9A2kNuzIuJCmLF4pRiNSoXrHDKiRkqo/2RXXzIZf+OlANCCbO8inRYov3YgIBCsX1cDDsmp/tf/h4JnTLTiow3QHFBsnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBU5OY3v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBU5OY3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772813650; x=1804349650;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mddcuYMJxbpUTJn5iQMnXpnFHfLvackuRw4GUpOZbgM=;
  b=cBU5OY3v56FA5BrlguU0xM/07QsN6StyH0v6S75MgvSyzh8FCf2EhcKo
   mlkDEi/JhL79JU3IN1EzGM7TKH0CmAZbQ+d2wFoJhT+SL2PpiZADrYCjJ
   nx+RzCLqm1fu86QjwW4M57Tq/4f7xuXFBaCYqtObHptSf2RnVosfOasYu
   94xtxrayXqRpAV8+zROstwxtCC/yvldRXyjvCEkeQ4Rzj5TezZSnpQwpQ
   iS5UQuHQv6ckpunUX9zWmU+SZeTDhA+mINQBn8/gf2LZyhwSpfYT3/iDj
   PUU39BBUw8KTnVvv0jWL5ZaEjp2F4btDjBDcEt/fPzAK+9fxQND1Pf0eQ
   w==;
X-CSE-ConnectionGUID: FqMflWiXQsmhf5UpeT64/Q==
X-CSE-MsgGUID: k4SqiAeJTYCuWuSF/OLS3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="85399755"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="85399755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:14:10 -0800
X-CSE-ConnectionGUID: 1d68TuDHStqwuo+RZuVxZQ==
X-CSE-MsgGUID: 4UI1IGnBTuii9tZDi1fuzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="215723552"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 08:14:09 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyXoU-0000000012R-0STe;
	Fri, 06 Mar 2026 16:14:06 +0000
Date: Sat, 07 Mar 2026 00:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-04-3 79/79]
 sound/soc/tegra/tegra_wm8962.c:80:64: error: invalid use of undefined type
 'struct snd_soc_dai'
Message-ID: <202603070031.9z0uP0Lz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-04-3
head:   778b9472f0c90f749c084257e0893772fd5ff6ac
commit: 798582c384840a76b6ed244f493279dc13151eb2 [79/79] move struct dai
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260307=
/202603070031.9z0uP0Lz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260307/202603070031.9z0uP0Lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070031.9z0uP0Lz-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   sound/soc/tegra/tegra_wm8962.c: In function 'tegra_wm8962_init':
>> sound/soc/tegra/tegra_wm8962.c:80:64: error: invalid use of undefined ty=
pe 'struct snd_soc_dai'
      80 |                 struct snd_soc_component *component =3D codec_da=
i->component;
         |                                                                ^~
   sound/soc/tegra/tegra_wm8962.c: In function 'tegra_wm8962_remove':
   sound/soc/tegra/tegra_wm8962.c:105:56: error: invalid use of undefined t=
ype 'struct snd_soc_dai'
     105 |         struct snd_soc_component *component =3D codec_dai->compo=
nent;
         |                                                        ^~


vim +80 sound/soc/tegra/tegra_wm8962.c

536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  66 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  67  static int tegra_wm8962=
_init(struct snd_soc_pcm_runtime *rtd)
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  68  {
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  69  	struct tegra_machine *=
machine =3D snd_soc_card_get_drvdata(rtd->card);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  70  	struct snd_soc_card *c=
ard =3D rtd->card;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  71  	struct snd_soc_dapm_co=
ntext *dapm =3D snd_soc_card_to_dapm(card);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  72  	int err;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  73 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  74  	err =3D tegra_asoc_mac=
hine_init(rtd);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  75  	if (err)
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  76  		return err;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  77 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  78  	if (!machine->gpiod_mi=
c_det && machine->asoc->add_mic_jack) {
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  79  		struct snd_soc_dai *c=
odec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23 @80  		struct snd_soc_compon=
ent *component =3D codec_dai->component;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  81 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  82  		err =3D snd_soc_card_=
jack_new_pins(rtd->card, "Mic Jack",
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  83  						 SND_JACK_MICROPH=
ONE,
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  84  						 machine->mic_jac=
k,
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  85  						 tegra_wm8962_mic=
_jack_pins,
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  86  						 ARRAY_SIZE(tegra=
_wm8962_mic_jack_pins));
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  87  		if (err) {
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  88  			dev_err(rtd->dev, "M=
ic Jack creation failed: %d\n", err);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  89  			return err;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  90  		}
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  91 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  92  		wm8962_mic_detect(com=
ponent, machine->mic_jack);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  93  	}
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  94 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  95  	snd_soc_dapm_force_ena=
ble_pin(dapm, "MICBIAS");
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  96 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  97  	return 0;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  98  }
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  99 =20

:::::: The code at line 80 was first introduced by commit
:::::: 536ffa105e16ca3f6e7de53f9d6059f53d0207f7 ASoC: tegra: Support WM8962=
 by machine driver

:::::: TO: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
