Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792865225;
	b=MHcnOSywCBsoDZJJ6sd78XLTo3s4oU9Y+MCqbO+AS4Ij76O4PaRScsGGWf803ZmT5nzO
	 ztnu/hHGFL4F9CSt/AJxC4kvQHRNq0DQPoZjzLIzItho+QNIxBCCQt/qu87l7i5nOMGf0
	 OjTkSxCieI3WoN720XdTczRIY3+UjVGquamY4Z9pAxTKEeTTdQk5rbhJ0komAVBDduF/H
	 Jiww/Z3EuZdkWGM7LMhdOvsry17UsUheUJ5gjh6BuD7jSbl77OY+aXBU2XSbgZ2aNZRDA
	 sYgzD7GIoAAhtiSl1116O0rmvqBNmUbRVuAVuiq/PswwXtWiuJRgiBe7k0zRgtaBsFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865225;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6nWW4DIhXIt1dTsUSQP74HLzjy4tqc2VE3yvYKPnfvQ=;
	b=q4/d3MbIFp+DkTLhdqK1MCufVw+Ntp2uFHrpUTgpdDsaoWt4iwhFpyQfQN+8zZ5cTeKO
	 vTvWL1ODvHl5MPoTMIJJG0cA+0nuinw6IsLfIsqD8/dv/CCalY9B0wLqjxG0sRlpYCEDC
	 9+pva9XiNbCn5KueknQcWgGqrIVaUFSQBrI0YhkBRewW2anK2jPfLzUlAaxd3tIzobV4A
	 fOxUnuaMiQmZQx+EJseglSs5JH40VE6IcqwcGG1lTxVKxgOsOrYP3ufdnY3uAqmfJA+f4
	 l4W8YyAWfu6QpnhqkKWGzyiUokCg46jtNM0mwFjbxKgY9eKLgLzuXWXV+D9317l+dDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YYM5qGkw;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EF9606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 18:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01EF9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YYM5qGkw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792865224; x=1824401224;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ysamUXrvnY7LKytS6oaeDmJNKeFMhdGvzgnQLPHCsp0=;
  b=YYM5qGkw5DQhCNepnkWuwbmjWSRInnTMA9/Y7AWK1LPh3RjC0mSodEKV
   APuOhza7lD+a3MlAfMyWGtS0nNUoumAPaWv5Zc0x67g98q3WmpYDcbZfi
   sY7jRKSMxyVsJ6JyeiPBe/hU72FWSNvv/7QNFqanIYGuVIuPIEBYTR5MU
   swIHNmmmxiAUiiqTUfocECRpVS+uAp8VS4wiNQ+trZ66trLrDI3B3xbql
   KuV/XNClMFO0/BtODPM12d2NVaWEUGrnLrN7rks5GOhPu2p6Xd/MI0V0J
   hKkykomvqA0SX4Muh6esnZrToOfD5K5DnYA7foD2irworxfcyGQv4Q/Lk
   A==;
X-CSE-ConnectionGUID: 4UsTEWevQtKZVh9WHJx1Rw==
X-CSE-MsgGUID: /CGF8bQmT1+kP7F+sOF1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1495055"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1495055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 11:07:03 -0700
X-CSE-ConnectionGUID: rLjjXMfuRHiskXB8nDX0nA==
X-CSE-MsgGUID: 9+7sPVSRQ9qGMrdIhGjXOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4301883"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2026 11:07:00 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKg8w-000000003Qd-2nLe;
	Sat, 24 Oct 2026 18:06:58 +0000
Date: Sat, 24 Oct 2026 20:06:37 +0200
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.3.y 52/59]
 sound/soc/codecs/es8316.c:936:1: error: type defaults to 'int' in declaration
 of 'module_i2c_driver'
Message-ID: <202610241902.peigNPpa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi ckkim,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/tobetter/linux odroid-7.3.y
head:   c30cb664bead7336f81c7a7c7c82709ee1f803cf
commit: 429218390c9badcef576aaa621995ee3a2d8b453 [52/59] ODROID-M2:arm64/dt=
s: hdmi / analog sound_card support
config: nios2-randconfig-r2107-20261024 (https://download.01.org/0day-ci/ar=
chive/20261024/202610241902.peigNPpa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261024/202610241902.peigNPpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241902.peigNPpa-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8316.c:936:1: warning: data definition has no type or=
 storage class
     936 | module_i2c_driver(es8316_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/codecs/es8316.c:936:1: error: type defaults to 'int' in declar=
ation of 'module_i2c_driver' [-Werror=3Dimplicit-int]
>> sound/soc/codecs/es8316.c:936:1: warning: parameter names (without types=
) in function declaration
>> sound/soc/codecs/es8316.c:927:26: warning: 'es8316_i2c_driver' defined b=
ut not used [-Wunused-variable]
     927 | static struct i2c_driver es8316_i2c_driver =3D {
         |                          ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=3Dy] && (ARCH_MESON || COMPILE_TEST [=3Dy])=
 && ARM64
   Selected by [m]:
   - SND_MESON_AXG_FIFO [=3Dm] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=
=3Dm] && (ARCH_MESON || COMPILE_TEST [=3Dy] && COMMON_CLK [=3Dy])
   WARNING: unmet direct dependencies detected for SND_SOC_ES8316
   Depends on [n]: SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=3Dm] && I2C [=3Dn]
   Selected by [m]:
   - SND_SOC_ROCKCHIP_I2S [=3Dm] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=
=3Dm] && (COMPILE_TEST [=3Dy] || ARCH_ROCKCHIP) && HAVE_CLK [=3Dy]


vim +936 sound/soc/codecs/es8316.c

b8b88b70875af78 Daniel Drake     2017-06-12  926 =20
b8b88b70875af78 Daniel Drake     2017-06-12 @927  static struct i2c_driver =
es8316_i2c_driver =3D {
b8b88b70875af78 Daniel Drake     2017-06-12  928  	.driver =3D {
b8b88b70875af78 Daniel Drake     2017-06-12  929  		.name			=3D "es8316",
b8b88b70875af78 Daniel Drake     2017-06-12  930  		.acpi_match_table	=3D A=
CPI_PTR(es8316_acpi_match),
b8b88b70875af78 Daniel Drake     2017-06-12  931  		.of_match_table		=3D of=
_match_ptr(es8316_of_match),
b8b88b70875af78 Daniel Drake     2017-06-12  932  	},
9abcd24002bf799 Uwe Kleine-K=C3=B6nig 2023-04-25  933  	.probe		=3D es8316_=
i2c_probe,
b8b88b70875af78 Daniel Drake     2017-06-12  934  	.id_table	=3D es8316_i2c=
_id,
b8b88b70875af78 Daniel Drake     2017-06-12  935  };
b8b88b70875af78 Daniel Drake     2017-06-12 @936  module_i2c_driver(es8316_=
i2c_driver);
b8b88b70875af78 Daniel Drake     2017-06-12  937 =20

:::::: The code at line 936 was first introduced by commit
:::::: b8b88b70875af786d9f346d766fa2b0630e2cf41 ASoC: add es8316 codec driv=
er

:::::: TO: Daniel Drake <drake@endlessm.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
