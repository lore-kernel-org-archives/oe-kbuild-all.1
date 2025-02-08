Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA52148304
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 03:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738984351; cv=none; b=s72IpxVYH9Jm8lFfp4OIJo08O4l0YoW7CIk9VyN/tdecphtG8Ws1aMrda5dPvOUzusycjd2NzrIaLu1Kn0yigz0LqujjZ7LKQEC7eQxBznCFC7TH5+td+pKgsBc0mhnoed7XC1EvcT49lkRhmL0lJ2QIFB6ciydSV3eyUCltfSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738984351; c=relaxed/simple;
	bh=lruAfqPnbvqJt/0eA6xyT3IQuCTiHaFNiKs8smeOdEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RakSuRtOqYq8lPwCpxtrJOBOfzsklhRIRbdKcgvuO6hDCmgkyhOVtzv86TCGhyhmARhRIiL5pNncNp/0+LhdDfMyNnb2vklZ1rwEsIP1Urfx1S3MC2Qf7qSHo406dsI3VXrpnEZ9SIWH/BSsRFCQEq4ekaVT/fvV6eBRYSx0AM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqGpi2J9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqGpi2J9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738984348; x=1770520348;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lruAfqPnbvqJt/0eA6xyT3IQuCTiHaFNiKs8smeOdEY=;
  b=AqGpi2J9nYB9siaW3lC6sP3JtfygMO3bK2OA28adKDxrrIil2pTOUPWx
   vfAmDEL8w/uYTCq8TEUbi2tj6CsK4uI//4pFqrbiESd8S18sRwLEJfhMn
   hiNChYuIKav7FKN8wghvd9PfvhXD/ipfnC5/sM50U9mDMWQGGVieLNBXm
   dMrGpU8NUU4mA1eUIxVS+4qaf5erv4bamWxM2wRORHWCoCc7BDoYirwiq
   RLIGtIk6sydCzAIYvN4LGzBmENrPGpcyoWwQn+jj6Fyvuw7lpl0R+Y97c
   jAvR9itJJj1VVlu2vkQod6HyHSLJ/ORTNtawhuVI50rLKydW95EFyfLFE
   A==;
X-CSE-ConnectionGUID: tWrlu9dEQlWy5qv4edvn9g==
X-CSE-MsgGUID: 1ahYitHcREazQNo7bGBJLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43294706"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="43294706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 19:12:28 -0800
X-CSE-ConnectionGUID: NrK4z9XFQZaMcSjOCnkYGg==
X-CSE-MsgGUID: 5DLkbAyVR3Wky00WaP45Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134932250"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2025 19:10:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgbF1-000zRf-21;
	Sat, 08 Feb 2025 03:10:47 +0000
Date: Sat, 8 Feb 2025 11:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb:
 /reserved-memory/gpueb-reserved-memory@a0000000: failed to match any schema
 with compatible: ['mediatek,gpueb-resv-mem']
Message-ID: <202502081105.K8Bnh8zQ-lkp@intel.com>
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
commit: 1ac2c128a1d9a649ff94dc1ee22320aa6db6b1f6 [170/170] CHROMIUM: arm64:=
 dts: mediatek: mt8196: Add gpu device node
config: arm64-randconfig-051-20250204 (https://download.01.org/0day-ci/arch=
ive/20250208/202502081105.K8Bnh8zQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250208/202502081105.K8Bnh8zQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081105.K8Bnh8zQ-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: $nodename:0: 'clkit=
g' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.=
+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: #size-cells: 0 is n=
ot one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: 'ranges' is a requi=
red property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /firmware/mtk-svp-heap: fai=
led to match any schema with compatible: ['mediatek,secure-heap']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: scmi: 'protocol@80' does no=
t match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/adsp-mem-r=
egion@90000000: failed to match any schema with compatible: ['mediatek,adsp=
-reserved-memory']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/gpueb-rese=
rved-memory@a0000000: failed to match any schema with compatible: ['mediate=
k,gpueb-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserv=
ed-memory@a0200000: failed to match any schema with compatible: ['mediatek,=
me-vcp-reserved']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/mali-prote=
cted@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-reg=
ion@a3000000: failed to match any schema with compatible: ['mediatek,dynami=
c-restricted-region']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /ged: failed to match any s=
chema with compatible: ['mediatek,ged']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-dcs: failed to match a=
ny schema with compatible: ['mediatek,gpu-dcs']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-loading-mode: failed t=
o match any schema with compatible: ['mediatek,gpu-loading-mode']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /protected-memory-allocator=
: failed to match any schema with compatible: ['arm,protected-memory-alloca=
tor']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to=
 match any schema with compatible: ['mediatek,gpufreq-wrapper']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any s=
chema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/qos@11bb00: failed to =
match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu-qos@13f800: failed=
 to match any schema with compatible: ['mediatek,gpu-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed=
 to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', '=
mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed=
 to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', '=
mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed=
 to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl'=
, 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed=
 to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl'=
, 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed=
 to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl'=
, 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed=
 to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl'=
, 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed=
 to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl',=
 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed=
 to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl',=
 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed=
 to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', '=
mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed=
 to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', '=
mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
--
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
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu@48000000: failed t=
o match any schema with compatible: ['mediatek,mali-mt8196', 'mediatek,mali=
']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu@48000000: failed t=
o match any schema with compatible: ['mediatek,mali-mt8196', 'mediatek,mali=
']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pbha: propagate-bits:0: siz=
e is 8, expected 32
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpufreq@48500000: fail=
ed to match any schema with compatible: ['mediatek,gpufreq']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpupdma@48540000: fail=
ed to match any schema with compatible: ['mediatek,gpupdma']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@48600000: compatible:=
0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@48600000: compatible:=
 ['mediatek,mt8196-gpu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@48600000: failed=
 to match any schema with compatible: ['mediatek,mt8196-gpu-smmu', 'arm,smm=
u-v3']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gpueb@4b000000: send-name-t=
able: b'IPI_ID_FAST_DVFS_EVENT\x00IPI_ID_GPUFREQ\x00IPI_ID_SLEEP\x00IPI_ID_=
TIMER\x00IPI_ID_FHCTL\x00IPI_ID_CCF\x00IPI_ID_GPUMPU\x00IPI_ID_FAST_DVFS\x0=
0CH_IPIR_C_MET\x00CH_IPIS_C_MET\x00IPI_ID_BRISKET\x00IPI_ID_PPB\x00' is not=
 of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gpueb@4b000000: recv-name-t=
able: b'IPI_ID_FAST_DVFS_EVENT\x00IPI_ID_GPUFREQ\x00IPI_ID_SLEEP\x00IPI_ID_=
TIMER\x00IPI_ID_FHCTL\x00IPI_ID_CCF\x00IPI_ID_GPUMPU\x00IPI_ID_FAST_DVFS\x0=
0CH_IPIR_C_MET\x00CH_IPIS_C_MET\x00IPI_ID_BRISKET\x00IPI_ID_PPB\x00' is not=
 of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gpueb@4b000000: gpueb-mem-n=
ame-table: b'MEM_ID_GPUFREQ\x00MEM_ID_LOG\x00' is not of type 'object', 'in=
teger', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpueb@4b000000: failed=
 to match any schema with compatible: ['mediatek,gpueb']
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
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/ghpm@4b800000: failed =
to match any schema with compatible: ['mediatek,ghpm']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: faile=
d to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctr=
l', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: faile=
d to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctr=
l', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b890000: faile=
d to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b8b0000: faile=
d to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible:=
0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible:=
 ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@4c000000: failed=
 to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smm=
u-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/sound: failed to match=
 any schema with compatible: ['mediatek,mt8196-mt6681-sound']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
