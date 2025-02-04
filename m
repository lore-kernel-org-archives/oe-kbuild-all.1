Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FF1FAC5C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738707488; cv=none; b=tJKUm49aZbxmY036GwXlEmh5Xm2yrqa7m6PlBYiUd5cdgNoxj+Swh4N43y4T7vAtdlaABpEHNvxtSrgI0Ez/pRPYcJ0GsgQTHVrl6d5wwep++GEGI5tK/cGOe/w16xflRaiYm6EuRWAkoS8iXNjgukw3OuiGj9sApL9HbWjFMXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738707488; c=relaxed/simple;
	bh=gBA1jw5vSy+jKC+5lBa6GJ5Qk9+n5eFlR8B565AUPG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YgZkmVZHJ0k1mUex93Pzt66c6gzT3nsidcmPnOYP/M8dJ7gdgY2TS8FD9dpfOBp/1k/RDpKylGbL7Eoqi53ZFSpmF5sM0O1vRB3wV/7GOsFSXpTUz97NSuiIYXxWGoZvwTsAxhU8UDNLzWg1lcdKvkuD8RWfoqHpYltUHfUmvws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3+YGg4h; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3+YGg4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738707486; x=1770243486;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gBA1jw5vSy+jKC+5lBa6GJ5Qk9+n5eFlR8B565AUPG4=;
  b=d3+YGg4hy8OAEAHGtIzFjhCAOOQGFe5bpBjSXfRifqk0EugTx1JrCLee
   ttyN3EW1d/LAxNY8Hr34oKz4nyRWB8BMPy08LB9OCrMh0kl03zl8bY6zK
   tkhJW8Ahv6U7XCb5lEtrxscZ9y3G39dI1VHGFyRjBviGGtHpJeTDEuC8z
   /1PWmY/VeCUALFPpeA9/SgfbYSivhjrjPs9wVQIh19TqgaWqycEZ4kLKo
   Rv83ddx0Og0+8pMRVRJOaVObzG+1PC4xrB1/1eOimnmjH7IaENkEPnY5f
   efloZXlIvph5NtQj6iro/BiwQZxggGHLM+L0DVnc8yUaiNAIpXXKAAb7X
   g==;
X-CSE-ConnectionGUID: U7CIVbiBQxWNbTMWBLftxg==
X-CSE-MsgGUID: EZGkfbT5Sz+GDKcoMvfrjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39410693"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39410693"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 14:18:05 -0800
X-CSE-ConnectionGUID: cMXagiN0SxKAciyZQs71DQ==
X-CSE-MsgGUID: pH6dYST0QWSLCgSRJvuvGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133966284"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2025 14:18:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfRF2-000t5b-3C;
	Tue, 04 Feb 2025 22:18:00 +0000
Date: Wed, 5 Feb 2025 06:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dvo0@324c0000: failed
 to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
Message-ID: <202502050645.cEiaI4LC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: a8c57d5aa8acdd2ffc0aafd11d90ef64567c8096 [35/35] CHROMIUM: arm64: d=
ts: mt8196: add edp dvo node
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/arch=
ive/20250205/202502050645.cEiaI4LC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355=
d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250205/202502050645.cEiaI4LC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050645.cEiaI4LC-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000/vcp@31000=
: failed to match any schema with compatible: ['mediatek,mmup-core']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'med=
iatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'med=
iatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@31ad5000: faile=
d to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek=
,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek=
,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50=
000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-=
hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32000000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mmsys0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32240000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32400000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mmsys1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dvo0@324c0000: fa=
iled to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: faile=
d to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'm=
ediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: faile=
d to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'm=
ediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a60000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a70000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a80000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a90000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: faile=
d to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', '=
mediatek,mt8196-ovlsys1_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: faile=
d to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', '=
mediatek,mt8196-ovlsys1_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e60000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e000000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3e030000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e400000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mdpsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3e430000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e800000: faile=
d to match any schema with compatible: ['mediatek,mt8196-disp-vdisp-ao-conf=
ig', 'mediatek,mt8196-disp_vdisp_ao_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e800000: faile=
d to match any schema with compatible: ['mediatek,mt8196-disp-vdisp-ao-conf=
ig', 'mediatek,mt8196-disp_vdisp_ao_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@3e810000:=
 failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-comm=
on']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@3e820000:=
 failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-comm=
on']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@3e830000:=
 failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-comm=
on']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@3e840000:=
 failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-comm=
on']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dp-tx@3ec00000: 'dptx,phy-p=
arams' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|=
dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypa=
d|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-single=
|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*=
', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.=
*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA=
-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^a=
bilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acer,.*', '^acme,.*', '=
^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', =
'^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler,.*=
', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-=
network,.*', '^allegro,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', =
'^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*',=
 '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampire,.*', '^=
ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^=
anvo,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,=
=2E*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^=
arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspee=
d,.*', '^asrock,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '=
^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', =
'^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,=
=2E*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*'=
, '^bitmain,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^br=
cm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calaosystems,.*', '^calxeda,.*', '^canaa=
n,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^caviu=
m,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.=
*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chips=
park,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^ch=
uwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^cloos,.*=
', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*=
', '^congatec,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.=
*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*',=
 '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.=
*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', =
'^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,=
=2E*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^diodes,.*', '^dioo,.*',=
 '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,=
=2E*', '^dptechnics,.*', '^dragino,.*', '^ds,.*', '^dserve,.*', '^dynaimage=
,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^ec=
kelmann,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*',=
 '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^=
elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emli=
d,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.=
*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,=
=2E*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,=
=2E*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exa=
r,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairphon=
e,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*'=
, '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^frida,.*', '^=
friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gardena,.*', '^ga=
teworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gemei,.*',=
 '^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^globalsc=
ale,.*', '^globaltop,.*', '^gmt,.*', '^goldelico,.*', '^goodix,.*', '^googl=
e,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*'=
, '^hideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*',=
 '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeyw=
ell,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hug=
sun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*',=
 '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*'=
, '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*'=
, '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^info=
rce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^i=
nnolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*',=
 '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '=
^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', =
'^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.=
*', '^jdi,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^j=
oz,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*'=
, '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^=
kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*'=
, '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*=
', '^lattice,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^le=
maker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^lich=
eepi,.*', '^linaro,.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys=
,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.*', '^litex,.*',=
 '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.=
*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunzn,.*', '^lwn,.*', '=
^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^m=
arvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcu=
be,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*=
', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,=
=2E*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*'=
, '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micros=
oft,.*', '^microsys,.*', '^mikroe,.*', '^mikrotik,.*', '^miniand,.*', '^min=
ix,.*', '^miramems,.*', '^mitsubishi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^=
motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', =
'^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundorea=
der,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*',=
 '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*'=
, '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven=
,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,=
=2E*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novatek,.*', '^novtech,.*', =
'^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocean=
ic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,=
=2E*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^o=
palkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpand=
ora,.*', '^openrisc,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ort=
ustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovt=
i,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^paral=
lax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec=
,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^planto=
wer,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^poc=
ketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,.*', '=
^pov,.*', '^powertip,.*', '^powervr,.*', '^primux,.*', '^probox2,.*', '^prt=
,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '=
^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quan=
ta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspbe=
rrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^remarkable,.*', '^ren=
esas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^rico=
h,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech=
,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^saef,.*'=
, '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', =
'^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', =
'^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,=
=2E*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift=
,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si=
-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*',=
 '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*=
', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^si=
nlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^si=
s,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,=
=2E*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon=
,.*', '^sony,.*', '^sourceparts,.*', '^spansion,.*', '^sparkfun,.*', '^spin=
alhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^s=
t,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^st=
arterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^s=
toropack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '=
^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^=
tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tdo,.*', =
'^team-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,=
=2E*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.=
*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*',=
 '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^=
topic,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^to=
umaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^t=
ronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*=
', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', =
'^ugoos,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*'=
, '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^verte=
xcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio=
,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante=
,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vot,.*', '^vxt,.*', '^wanc=
hanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.=
*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^w=
iligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', =
'^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.=
*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^x=
ingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xun=
long,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*'=
, '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,=
=2E*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', =
'^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*', 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-tx@3ec00000: failed=
 to match any schema with compatible: ['mediatek,mt8196-dp-tx']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/edp-tx@3ec40000: faile=
d to match any schema with compatible: ['mediatek,mt8196-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@48600000: compatible:=
0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@48600000: compatible:=
 ['mediatek,mt8196-gpu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@48600000: failed=
 to match any schema with compatible: ['mediatek,mt8196-gpu-smmu', 'arm,smm=
u-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-ctrl', =
'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-ctrl', =
'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: faile=
d to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctr=
l', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: faile=
d to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctr=
l', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: faile=
d to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctr=
l', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
