Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F523EA84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 23:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786576949; cv=none; b=eicFbYEkZDDdzGf20qjQfHnVLn5ByddoLnQ6PD2WnX+11qFuOkTYKvSPmG1E00M22vmCP9DoqCObDXHeNQi6Jn0Iaq5b0cpJRLoWMv4H4cNLtWaZq656aJfzoEC3iVcMEVWUI6F/gKZXxOlUt2hlBWmElaCglN3o2dyHj+x/xaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786576949; c=relaxed/simple;
	bh=hlRttaf8THEL5ByYEo5jc3fcN6p2bkos928duWklv8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=reyYrPsS0lUOh0Y11xe3Vup+T16hqU+3tEs5naSifGVslZcBDhd5+5adUwTAmKXndasikgrGEN6klLPcr42IX6HAV+LgS+gKExGHDd4yR3kTB9hSitYpAf1axkA2jv9oLpWKVeeOi81UFM+L/Vo9GDTGfnTN9DjBzEjZHDiGkS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUYgH3mI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUYgH3mI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786576946; x=1818112946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hlRttaf8THEL5ByYEo5jc3fcN6p2bkos928duWklv8E=;
  b=iUYgH3mI02KeiNcnyQjesheMKxHrMtcYTGOTw44DmpywUR/KbpmXwXXV
   MTNkqr8ml5hRvk+KnqTe7BjB/rFn75IHheZiiy9w9hvvsGoW/q6TvqdEx
   vgcHSLUEcjLTzc+zvZdvFmpc1Bx3zFqfe2Dz6xiQXf+QS8ai5JxJLouXQ
   xPNe79v45qcpYeP2lPgW8Jsk5J0D6fPWf71oC6rgD6qAGgV/+Ktfbq0nU
   gKom9bWjPAaKlR48FCfupOgJKBgEfnI6oIklBgDvnSbuZFE7+L2GX/pfO
   3xXRnq38ekFP/oVHF1UE1r3AcKCU40GHF5aFENmsphlm6oGCo4VLC8GF8
   Q==;
X-CSE-ConnectionGUID: GWwi6bf1RxC0SHNsKAK/IA==
X-CSE-MsgGUID: Pc52MiELR2aoGOIRDCTovQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97809950"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97809950"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:22:26 -0700
X-CSE-ConnectionGUID: TO5/ORdBQOayI6JwFWtbxA==
X-CSE-MsgGUID: sNgDZ0qIQ3is0vEVtRCYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267282901"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2026 16:22:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuIH8-00000000S3H-34cN;
	Wed, 12 Aug 2026 23:22:22 +0000
Date: Thu, 13 Aug 2026 07:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.2.y 53/58]
 sound/soc/codecs/es8316.c:928:1: error: type specifier missing, defaults to
 'int'; ISO C99 and later do not support implicit int
Message-ID: <202608130711.WD6PXN7x-lkp@intel.com>
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
config: riscv-randconfig-r132-20260812 (https://download.01.org/0day-ci/arc=
hive/20260813/202608130711.WD6PXN7x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608130711.WD6PXN7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130711.WD6PXN7x-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/es8316.c:928:1: error: type specifier missing, defaults=
 to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     928 | module_i2c_driver(es8316_i2c_driver);
         | ^
         | int
>> sound/soc/codecs/es8316.c:928:19: error: a parameter list without types =
is only allowed in a function definition
     928 | module_i2c_driver(es8316_i2c_driver);
         |                   ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=3Dy] && (ARCH_MESON || COMPILE_TEST [=3Dy])=
 && ARM64
   Selected by [m]:
   - SND_MESON_AXG_FIFO [=3Dm] && SOUND [=3Dy] && SND [=3Dm] && SND_SOC [=
=3Dm] && (ARCH_MESON || COMPILE_TEST [=3Dy] && COMMON_CLK [=3Dy])
   WARNING: unmet direct dependencies detected for SND_SOC_ES8316
   Depends on [n]: SOUND [=3Dy] && SND [=3Dm] && SND_SOC [=3Dm] && I2C [=3Dn]
   Selected by [m]:
   - SND_SOC_ROCKCHIP_I2S [=3Dm] && SOUND [=3Dy] && SND [=3Dm] && SND_SOC [=
=3Dm] && (COMPILE_TEST [=3Dy] || ARCH_ROCKCHIP) && HAVE_CLK [=3Dy]


vim +/int +928 sound/soc/codecs/es8316.c

b8b88b70875af7 Daniel Drake     2017-06-12  918 =20
b8b88b70875af7 Daniel Drake     2017-06-12  919  static struct i2c_driver e=
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
