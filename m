Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF432350A0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293882; cv=none; b=oPCVhJ73u9QU7yw1cIkdZO2Kyixe4CIr7AMlRFQuONClbeY7Y5ly5Oc+ZnG9tb6oYo4dnReS8etpEMTxzLEU0SDzvd91dsau/PqhbW93O2FxnVSfyaA4jguYxeitfHr//5LDEhjh8tDjYzvcRS4j3639PCYs8hzqF5YRjMpJKqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293882; c=relaxed/simple;
	bh=nxkWI/xtr/KxQWkQP0b5+HAMjy8KzFhV5TYVdGxKawg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GNK5y6td+pGoq4iuYDAmB9OgoWCZrZ91G0/hr5tg41iXtfuJq1H2xSqs1HtsiZPOgrukiyGrvy3C22bvrQeIJh5JfgsrV3Kq/I+9xnRaHujHM5Hg78sDRhAM+/dVPwuSub7F8FU8Hzg50RDbWX4oYotSo1AcBWwR6+MQDm3Nvik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VctijJ5A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VctijJ5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768293881; x=1799829881;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nxkWI/xtr/KxQWkQP0b5+HAMjy8KzFhV5TYVdGxKawg=;
  b=VctijJ5A/yzFutXw6SVnmb8JFDjAYP+w3TxWUWTddgAO1NyxBjbYK0hM
   sO/muQbRPO6NHfHNX6LsScs2Gx1gPWzjTszACl6D3pC6oVqMzXBmUy3z9
   Ki9+dIv1929tHTV5xw1m3qqEtNwGYnQHnXfMYZ47ac5tpW5UVvXP5etkW
   V4Y9jNCF1xlRMgPxRTxzlpTYL11ARNH/nV0m1y2wABFReMgCLSwCPkkwH
   jkKkl24mSiI7aDjWvJ5+RsBrPIBvS+W8oq1lx43CUACJjGLunsO9FGxWJ
   52rha22TIm5IiWWlfbLlJiD/BeFA9MHvOJMzwvgkXTpa0+XO09oto1+wY
   g==;
X-CSE-ConnectionGUID: SA7gUVveSqijYP7MbDlzKA==
X-CSE-MsgGUID: ecele/lNRiS/8e5ed+XXoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69631636"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69631636"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:44:40 -0800
X-CSE-ConnectionGUID: 8BK8Fat/TWWfVdhIf3BE6Q==
X-CSE-MsgGUID: f0YytV1YRrG13y3h9kBz1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204945112"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 00:44:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfa0y-00000000EU4-32E0;
	Tue, 13 Jan 2026 08:44:36 +0000
Date: Tue, 13 Jan 2026 16:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 sound/soc/sunxi/sun4i-spdif.c:180: warning: Function parameter or struct
 member 'mclk_multiplier' not described in 'sun4i_spdif_quirks'
Message-ID: <202601131606.N5tWBKIQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   113ac3ac68b3559c98fa1bcaa0e46044cabfcad6
commit: 829b0400e5c9d1dc209d562612fd2472173dd2d7 [1/1] ASoC: sun4i-spdif: A=
dd clock multiplier settings
config: arm64-randconfig-002-20260113 (https://download.01.org/0day-ci/arch=
ive/20260113/202601131606.N5tWBKIQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260113/202601131606.N5tWBKIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131606.N5tWBKIQ-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sunxi/sun4i-spdif.c:180: warning: Function parameter or struct=
 member 'mclk_multiplier' not described in 'sun4i_spdif_quirks'


vim +180 sound/soc/sunxi/sun4i-spdif.c

f8260afa444b67 Marcus Cooper 2016-02-08  167 =20
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  168  /**
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  169   * struct sun4i_spd=
if_quirks - Differences between SoC variants.
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  170   *
c7202a19cf838d Lee Jones     2020-07-09  171   * @reg_dac_txdata: TX FIFO o=
ffset for DMA config.
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  172   * @has_reset: SoC =
needs reset deasserted.
f6a86b436b2658 Cl=C3=A9ment P=C3=A9ron 2019-05-27  173   * @val_fctl_ftx: T=
X FIFO flush bitmask.
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  174   */
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  175  struct sun4i_spdif_=
quirks {
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  176  	unsigned int reg_d=
ac_txdata;
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  177  	bool has_reset;
f6a86b436b2658 Cl=C3=A9ment P=C3=A9ron 2019-05-27  178  	unsigned int val_f=
ctl_ftx;
829b0400e5c9d1 George Lander 2024-11-11  179  	unsigned int mclk_multiplier;
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27 @180  };
ae9cccc30f6c08 Cl=C3=A9ment P=C3=A9ron 2019-05-27  181 =20

:::::: The code at line 180 was first introduced by commit
:::::: ae9cccc30f6c088dd6ead63e990407e37cd9437b ASoC: sun4i-spdif: Move qui=
rks to the top

:::::: TO: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
