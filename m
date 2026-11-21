Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795282582;
	b=Ou6db1QNyZizaVfwHeDj3+U6F8CWMl56S7nqK5sDWLuVI0UhirsBZVntVjphLDWQHUOy
	 YbzPgHgZXXRgdtLLkBOzmc3ALt7hk+zbg1iGeDItdvLSBltGrghLXWDlB8BWcA7f2W4te
	 qP8XRsKt/thdvQ1XxyylBk38/9wN0iz4Q5/5phBYpMb+dcQ778zWeqCJrlEoA2DxtUwA2
	 JT7EE2z/feSzqFDIwIycnS8xXtqXEL9u9f7QzpeEMywNnSyxp/gecVRyO22ZPoL/6u6in
	 bQRNToyutFEqXXaYqoI8KgkX8RpYFKfJK7dHIWYcB2yRXe85EWSY7oQcVDIF7AARdvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795282582;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nArhc9fySMEtNAx+B6Xk7sEtGEAXGtwTGr8MZn1Wyzo=;
	b=ECRuP10BmWyWq+Qw7Pz4Ui1Ws7i4cR2S2YmfalzLNIMNFoTosLh/bwd0Go+Sk2T8rv0r
	 QwwxrTV5Bc4NhmYQCIHAm1zN+wDMkaG/334NGB87ZWREFXhRyh40KZdZL/zUqGZnLNwax
	 G+GsMe4IU/XX1D5wErD1LrRzxkQwBr1d4DanvIRYnNLAp0j/O6pZbozAQwJEN2vahvinm
	 LI2w0qLplk3k57sWUJJuyzEKI3gI5zU6pOD5864IcbFA6e/FhDhjISQyXCwyaeQ8eUWef
	 DjHYfkvr8IagKk+qqNevMw+xePYf0FVc6tKC4X9VwzKvEzm8EODvixTg9bOmpjhQ/ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9jLqmwS;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DEF606A32A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 17:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53DEF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9jLqmwS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795282581; x=1826818581;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HO2jjp0+4yanEpjeSB3/uN/zkh3B3Ub1pd6nRPu4mak=;
  b=V9jLqmwStVWwixxNph/20rwaItYc8evqdbF4TUWqZiQUiKcfeFEt6zVF
   IHJ2eQgXY5BGxjzhBpLDC8yfwIpK3GQZZad4NB3+UOyaSI35CGROe7mHs
   7dRuWuQKOIl3zAdLFG5l2E7TqG1LH3C4mew1+pY1jcUBG0X4URjRUL6fE
   0nyINYVdrlbdVt+NpoqAxZmqxU/lCecK8HXsSYeeQiSfb83yE/+gvKKs/
   va6vLSLUSAj3ooKqFoB3mQnYOr1guXLDlPAP4N1ay+z2R+ITxv3qJKK01
   2xbaqx000RF/7k8zBoRs5NPOVwGYXmg9xcIKA8cs0x6XW6O/kcZC/HiVh
   A==;
X-CSE-ConnectionGUID: +PLn0DKaQYWDJWE+E9AhDA==
X-CSE-MsgGUID: OE1OpuqoQDm2y7ZVZu3Qog==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4145700"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4145700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 09:36:21 -0800
X-CSE-ConnectionGUID: m6G//iD8T4uSLzsc03Hq8g==
X-CSE-MsgGUID: pJjgsqewRbCcmgUlyYKt8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11280568"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2026 09:36:19 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUp0a-00000001KNH-3PaJ;
	Sat, 21 Nov 2026 17:36:16 +0000
Date: Sun, 22 Nov 2026 01:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 1553/9862]
 drivers/gpu/drm/drm_mipi_dbi.c:79:17: warning: 'mipi_dbi_dcs_read_commands'
 defined but not used
Message-ID: <202611220157.4AOG2xu4-lkp@intel.com>
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

Hi Svyatoslav,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   adcad7f4e6332cff3d6d7165f41584899f598534
commit: d87ca1becbb095b6204cf657508c91e5e995d9b5 [1553/9862] drm/panel: Add=
 LG LH400WV3-SD04 MIPI DBI Type B panel driver
config: sparc-randconfig-1001-20261121 (https://download.01.org/0day-ci/arc=
hive/20261122/202611220157.4AOG2xu4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261122/202611220157.4AOG2xu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611220157.4AOG2xu4-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mipi_dbi.c:79:17: warning: 'mipi_dbi_dcs_read_comman=
ds' defined but not used [-Wunused-const-variable=3D]
    static const u8 mipi_dbi_dcs_read_commands[] =3D {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mipi_dbi_dcs_read_commands +79 drivers/gpu/drm/drm_mipi_dbi.c

02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   78 =20
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  @79  static const u8 mipi_dbi_dcs_read_commands[] =3D {
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   80  	MIPI_DCS_GET_DISPLAY_ID,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   81  	MIPI_DCS_GET_RED_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   82  	MIPI_DCS_GET_GREEN_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   83  	MIPI_DCS_GET_BLUE_CHANNEL,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   84  	MIPI_DCS_GET_DISPLAY_STATUS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   85  	MIPI_DCS_GET_POWER_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   86  	MIPI_DCS_GET_ADDRESS_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   87  	MIPI_DCS_GET_PIXEL_FORMAT,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   88  	MIPI_DCS_GET_DISPLAY_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   89  	MIPI_DCS_GET_SIGNAL_MODE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   90  	MIPI_DCS_GET_DIAGNOSTIC_RESULT,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   91  	MIPI_DCS_READ_MEMORY_START,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   92  	MIPI_DCS_READ_MEMORY_CONTINUE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   93  	MIPI_DCS_GET_SCANLINE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   94  	MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   95  	MIPI_DCS_GET_CONTROL_DISPLAY,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   96  	MIPI_DCS_GET_POWER_SAVE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   97  	MIPI_DCS_GET_CABC_MIN_BRIGHTNESS,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   98  	MIPI_DCS_READ_DDB_START,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22   99  	MIPI_DCS_READ_DDB_CONTINUE,
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  100  	0, /* sentinel */
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  101  };
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  102 =20

:::::: The code at line 79 was first introduced by commit
:::::: 02dd95fe316936269a52d6ccb971bb956412b40a drm/tinydrm: Add MIPI DBI s=
upport

:::::: TO: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
:::::: CC: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
