Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F23264E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 02:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589803; cv=none; b=ekTGgntDKe6TLSWmj9jo5JTzabFelHIJEk7Lk54OXfdL/vL4KCGqA0Ed3gV6PvALJiev5AVHI6jhkC7yl65Rjyg4EYlZTBGhSzUiJUq0NUEx8+Qz/4ifM3JjLgChPIoCCTbC2kfrSvQ4huRh98niwS/YY1awIX2PbXU5Shyjg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589803; c=relaxed/simple;
	bh=G7IJpbGSCmogMiFvAe3Kw3TXezFGvyD1ZmrK4JXL4MA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EaZv5P9+UAo503YDoGlfuRhse8ldwT4Q7xsLmfM70eNfOYi/nORs/EZIX5HmpRyPYCXF3ik1Fc8USCM71g1dAmudBOJV500+xMQTgntZ+XkqB/nY4VeANvONeDEeaqP0QsFawzCn3Tn3QZIprze1VAJ4PLSPv7E4yTDZe04FeT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiBgDA5C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiBgDA5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786589802; x=1818125802;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G7IJpbGSCmogMiFvAe3Kw3TXezFGvyD1ZmrK4JXL4MA=;
  b=kiBgDA5C7ZHhHl/FrMbNpiPTqcZqEEQoA6CaYkS6un5g3q4rewNRY85G
   sroKvS1IW4mIV9FsBotf6R2R3j8uLeAtDQqZkMiUBYDWBtfNgAous5MgX
   PXVPErmLmIuFcGvwM2589SkFaPS43c5CTcSzgfXDM571P3g2Y4/2I51pe
   2Hq2jTeE9bK2JFQZ82btWd11M8G+vUV2cHd47teXqN/8b4BZjAXgEH4og
   JXDqdk4O3HkHxwZAdWB0XorH9vdMH8NNJ9ZOSGZGDa1UAxrQ5Vmx4dPNU
   NB7DhuCXnirUafJU3H7w75QURcP9isc6mC7g1LHBJonD5pcIXtLo4nGmG
   Q==;
X-CSE-ConnectionGUID: 9jKmsRoSR+2mTDlA83iP1g==
X-CSE-MsgGUID: gcLci4NhS4Cq9T1d9IaTYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97822102"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97822102"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:56:39 -0700
X-CSE-ConnectionGUID: Y/hKjLUiRC+mHqwj9/V/6A==
X-CSE-MsgGUID: ugwC8bj7TVWrC2syvrjCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="288603196"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 19:56:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuLcO-00000000Sc6-1FW9;
	Thu, 13 Aug 2026 02:56:32 +0000
Date: Thu, 13 Aug 2026 10:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.2.y 53/58]
 sound/soc/codecs/es8316.c:928:1: error: type defaults to 'int' in declaration
 of 'module_i2c_driver'
Message-ID: <202608131010.YfkJD9DL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   a105acaa179819b345f92c1de3b2628b9d1a31f9
commit: 4093d770faddfc408c741a41d0dbf37a3787f32d [53/58] ODROID-M2:arm64/dt=
s: hdmi / analog sound_card support
config: nios2-randconfig-002-20260813 (https://download.01.org/0day-ci/arch=
ive/20260813/202608131010.YfkJD9DL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608131010.YfkJD9DL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131010.YfkJD9DL-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8316.c:928:1: warning: data definition has no type or=
 storage class
     928 | module_i2c_driver(es8316_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/codecs/es8316.c:928:1: error: type defaults to 'int' in declar=
ation of 'module_i2c_driver' [-Werror=3Dimplicit-int]
>> sound/soc/codecs/es8316.c:928:1: warning: parameter names (without types=
) in function declaration
>> sound/soc/codecs/es8316.c:919:26: warning: 'es8316_i2c_driver' defined b=
ut not used [-Wunused-variable]
     919 | static struct i2c_driver es8316_i2c_driver =3D {
         |                          ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=3Dy] && (ARCH_MESON || COMPILE_TEST [=3Dy])=
 && ARM64
   Selected by [y]:
   - SND_MESON_AXG_FIFO [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=
=3Dy] && (ARCH_MESON || COMPILE_TEST [=3Dy] && COMMON_CLK [=3Dy])
   WARNING: unmet direct dependencies detected for SND_SOC_ES8316
   Depends on [n]: SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=3Dy] && I2C [=3Dn]
   Selected by [y]:
   - SND_SOC_ROCKCHIP_I2S [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=
=3Dy] && (COMPILE_TEST [=3Dy] || ARCH_ROCKCHIP) && HAVE_CLK [=3Dy]


vim +928 sound/soc/codecs/es8316.c

b8b88b70875af7 Daniel Drake     2017-06-12  918 =20
b8b88b70875af7 Daniel Drake     2017-06-12 @919  static struct i2c_driver e=
s8316_i2c_driver =3D {
b8b88b70875af7 Daniel Drake     2017-06-12  920  	.driver =3D {
b8b88b70875af7 Daniel Drake     2017-06-12  921  		.name			=3D "es8316",
b8b88b70875af7 Daniel Drake     2017-06-12  922  		.acpi_match_table	=3D AC=
PI_PTR(es8316_acpi_match),
b8b88b70875af7 Daniel Drake     2017-06-12  923  		.of_match_table		=3D of_=
match_ptr(es8316_of_match),
b8b88b70875af7 Daniel Drake     2017-06-12  924  	},
9abcd24002bf79 Uwe Kleine-K=C3=B6nig 2023-04-25  925  	.probe		=3D es8316_i=
2c_probe,
b8b88b70875af7 Daniel Drake     2017-06-12  926  	.id_table	=3D es8316_i2c_=
id,
b8b88b70875af7 Daniel Drake     2017-06-12  927  };
b8b88b70875af7 Daniel Drake     2017-06-12 @928  module_i2c_driver(es8316_i=
2c_driver);
b8b88b70875af7 Daniel Drake     2017-06-12  929 =20

:::::: The code at line 928 was first introduced by commit
:::::: b8b88b70875af786d9f346d766fa2b0630e2cf41 ASoC: add es8316 codec driv=
er

:::::: TO: Daniel Drake <drake@endlessm.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
