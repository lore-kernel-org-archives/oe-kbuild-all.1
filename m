Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0344F19DF6A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739041735; cv=none; b=FwinFHkwCQtW2M/2BJDFo+7OPx2E5PvEWxj/gVTbv0JbBPQ8lEiSgsgoZuGuPYxNrviPLZ519VHORMltudxeDKtfCzc7y9pRZ0VX8U3/x9AmF90S9fs7eG5SzzuHxXeubHqrhrL01UrwhG2QZoRnKCMSwb4VH9yzFwZ+g3JEcuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739041735; c=relaxed/simple;
	bh=CxkHCcxS0Ctc+nU+7vghqihyM26KK+hEgw4OP4QZefk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e07rKddxvBsFmbVwz6Wwz4Kz3vRo/Mp+QH7z0Zo8UZfQpXdKWEZdZTKnyylblOkU5tMsDzQ6YPRJqrJZEamTSPpBx4gLiV1Zr0dPrxozsZE5E70xLgf+ijpEqvCGhTcgS9ABYrKVLkDGM1PwvET01XkHbXD8ONs2/oyohNkBzOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaxBao2I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaxBao2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739041733; x=1770577733;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CxkHCcxS0Ctc+nU+7vghqihyM26KK+hEgw4OP4QZefk=;
  b=AaxBao2IOhrXVt0/ltXjRVjuAmq1xVVFrsFoUkbMtHO3wkICVc9AIbNM
   JUZknTbU3hDKMfGkdaqICb/b8XEJHbQ+5hd6eFD8eNcZm9dEPmzXPT93E
   2HNH+ZSEOY9Fo6r8uShAKdVrF3NPxDm07+bgjfMe7i801y0kt+NkkBEsh
   G4PxXTh6wRsZCr9q7eH8R9FgkMO3P5keHl7ZMDi/cDlBZugepdBE83YgM
   p9tCs9qc9DBiOSjbmPaeX1zNb6cS8QcChQocTA4W9k47EO31Ww0QDuj0I
   PZzmmHy9zCXrVr7iR+00XDvsiKOAuh6qLyvMAv+0cd5smzAaeZC7HoWce
   A==;
X-CSE-ConnectionGUID: pSsn0xM0Txm0d2fgM2SXfA==
X-CSE-MsgGUID: ereO7g00Qn+7NidJbbNDGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39926884"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39926884"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 11:08:49 -0800
X-CSE-ConnectionGUID: BIGnTC0ERwm17wTzJz5n2Q==
X-CSE-MsgGUID: GtW0WIAUTVilEEJmtc/YFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111767379"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Feb 2025 11:08:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgqC4-0010Wx-2A;
	Sat, 08 Feb 2025 19:08:44 +0000
Date: Sun, 9 Feb 2025 03:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32800000: 'async',
 'mm-hw-ccf-regmap' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502090326.OuJCHlS9-lkp@intel.com>
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
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: fd00cab3fe36e486cd2aaf166b98a6a5b943a097 [211/211] FIXUP: CHROMIUM:=
 arm64: dts: mt8196: Add MT8196 EVB dts
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/arch=
ive/20250209/202502090326.OuJCHlS9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250209/202502090326.OuJCHlS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090326.OuJCHlS9-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32430000: fail=
ed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32440000: fail=
ed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dsc0-wrap0@324500=
00: failed to match any schema with compatible: ['mediatek,mt8196-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dsc1-wrap1@324600=
00: failed to match any schema with compatible: ['mediatek,mt8196-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dsi@32490000: failed t=
o match any schema with compatible: ['mediatek,mt8196-dsi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dvo0@324c0000: fa=
iled to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32800000: 'async', '=
mm-hw-ccf-regmap' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32820000: 'power-doma=
ins' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32820000: 'oneOf' con=
ditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32860000: 'i=
ommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32870000: 'i=
ommus' is a required property
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@329c0000: 'oneOf' c=
onditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a60000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a70000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a80000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a90000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32c00000: 'async', '=
mm-hw-ccf-regmap' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32c20000: 'power-doma=
ins' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32c20000: 'oneOf' con=
ditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32c50000: 'i=
ommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32c60000: 'i=
ommus' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38890000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38c00000: faile=
d to match any schema with compatible: ['mediatek,mt8196-vencsys-c2', 'medi=
atek,mt8196-vencsys_c2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38c00000: faile=
d to match any schema with compatible: ['mediatek,mt8196-vencsys-c2', 'medi=
atek,mt8196-vencsys_c2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38c10000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@38c70000:=
 failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-comm=
on']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38c90000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e000000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3e030000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e400000: faile=
d to match any schema with compatible: ['mediatek,mt8196-mdpsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3e430000: failed =
to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@3e800000: 'mm-hw-ccf=
-regmap' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
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
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dp-tx@3ec00000: 'dptx,phy-p=
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
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-tx@3ec00000: failed=
 to match any schema with compatible: ['mediatek,mt8196-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/edp-tx@3ec40000: faile=
d to match any schema with compatible: ['mediatek,mt8196-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu@48000000: failed t=
o match any schema with compatible: ['mediatek,mali-mt8196', 'mediatek,mali=
']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
