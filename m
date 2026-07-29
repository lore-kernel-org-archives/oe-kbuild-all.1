Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FF421ABBB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 01:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289881; cv=none; b=XHb98tj5G9WiZ5QjAJJM/uQcSn+k3ykB1vFs8S7kGoyg6shQIl/PZOo8cFgZRF8746rIUSlKeIxNtC3Jw3ConlB3QNbZZ5jytx5KYJif3ydyKyYQ2gSS9ldXGHXWf+rBtUIgg4pGAUTCGa7munArr3iIN5H5yT5Zd6hspolQllA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289881; c=relaxed/simple;
	bh=zX3UUefSztNWbzhJuc22vUr3jdowzH7D5Us/6pMgtZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cGGhlH3Q56VvAE4PZRzm52tTd7Yt1T0TRbOas2DyCls4BXXOXC8j3niLyQf/YieOj1UzDzkNPNuRhAQKPVXswDiGdRaOdrFv/ubWsC5vhhb0MYMYkvZvONXAyhXwq06cnPNdyJQxDDAjbF45R2EHc2aPy4z3VLJ9KaUT0NLHbKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9rNYBZX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9rNYBZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785289877; x=1816825877;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zX3UUefSztNWbzhJuc22vUr3jdowzH7D5Us/6pMgtZg=;
  b=F9rNYBZXeB9BMpC1fu+RjGsS1DRB65SAbEahYlw19TrkPQBGVSUIt1qY
   GN3fmf6Itq+S+Q80iHyccF90M5FBz5Ei+s+aQj7y5iSga2dQxihmLOabd
   WvVZ3BU1EmV5vo8WeWqr0nIAJi+UdWpi3CaJ09b4ksEGhhFIwPxX0GvpV
   Fg+P+iHfLlxRFvbnnaAQUuXFmrpYrCfgarBM0wEXaP8SsnVApLA/7zXis
   P9ZGYfBl78PoKx1/y+auXgI9VD8WSwJ5tEmcGWIrmavTlbu55ggOGS0KM
   lSjIGt/dHnjMAHKsLFuu/8G+n09mfS/QjZW91qsJKbUnqZn3hS7veSK3I
   A==;
X-CSE-ConnectionGUID: 0CQok0XPQpydeuFQNrCgpA==
X-CSE-MsgGUID: cof2UPbQRbGcvyYAYpvBkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96246432"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="96246432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 18:51:17 -0700
X-CSE-ConnectionGUID: DdeEuV2aTR+kQ3KcZQLCGw==
X-CSE-MsgGUID: lqoHGaL3TW6UuVndpdKkyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="284409198"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jul 2026 18:51:14 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wotRw-0000000024I-1IFH;
	Wed, 29 Jul 2026 01:51:12 +0000
Date: Wed, 29 Jul 2026 03:50:55 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 64/165]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /
 (bananapi,bpi-r4-lite): False schema does not allow {'reg': [[0, 1073741824,
 0, 268435456]]}
Message-ID: <202607290300.DBQFGwxo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   d474f732e037129a4c3b84d3f0bd1433365bd11f
commit: adb168481ee5f3bff9b332a78a1f5934c26720f2 [64/165] arm64: dts: media=
tek: mt7987: Add Bananapi-R4 Lite
config: arm64-randconfig-2054-20260728 (https://download.01.org/0day-ci/arc=
hive/20260729/202607290300.DBQFGwxo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 952=
1d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260729/202607290300.DBQFGwxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290300.DBQFGwxo-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixe=
d:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): False schema does not allow {'reg': [[0, 1073741824, 0, 26=
8435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: opp_table=
0 (operating-points-v2): $nodename:0: 'opp_table0' does not match '^opp-tab=
le(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: opp_table=
0 (operating-points-v2): Unevaluated properties are not allowed ('opp-share=
d', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: l2-cache =
(cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: clkitg (s=
imple-bus): $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|b=
us|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc_clksy=
s (simple-bus): $nodename:0: 'soc_clksys' does not match '^([a-z][a-z0-9\\-=
]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt6779-spi', 'med=
iatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7981-spi-ipm', =
'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi=
-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt2701-spi', 'med=
iatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,=
mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135=
-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/spi@=
11008800: failed to match any schema with compatible: ['mediatek,mt7987-spi=
-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11009=
800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one=
 must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'media=
tek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'media=
tek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'm=
ediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-s=
ingle', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'media=
tek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt=
6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-s=
pi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
--
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'marvell,armada-cp110-crypto' was expected
   	'inside-secure,safexcel-eip197b' is not one of ['marvell,armada-3700-cr=
ypto', 'mediatek,mt7981-crypto', 'mediatek,mt7986-crypto']
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	'inside-secure,safexcel-eip197b' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_nets=
ys/crypto@15600000: failed to match any schema with compatible: ['inside-se=
cure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mikro-bus=
 (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mikro-bus=
 (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /mikro-bu=
s/gpio-export@0: failed to match any schema with compatible: ['gpio-export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-3: '=
gpio-export,name', 'gpio-export,output' do not match any of the regexes: '^=
#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gp=
mc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^=
(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rca=
r_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|s=
t-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9tripod,.=
*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-=
Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^a=
bilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*'=
, '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', =
'^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adi=
eng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*'=
, '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '=
^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^al=
liedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', =
'^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', =
'^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*'=
, '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*'=
, '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.=
*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*'=
, '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '=
^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*', '^arte=
syn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,=
.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*'=
, '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*=
', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^ay=
aneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.=
*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*'=
, '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*'=
, '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', =
'^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', =
'^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', =
'^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.=
*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^ch=
ipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^=
chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*'=
, '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', =
'^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*=
', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^cortina,=
.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,=
.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,=
.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas=
,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^de=
lta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot=
,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', =
'^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '^dlg,.*=
', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoon,.*', =
'^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dyn=
aimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*'=
, '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^=
ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '^eink,.=
*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^e=
lpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emm=
icro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.=
*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*=
', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.=
*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*',=
 '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', =
'^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*=
', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', =
'^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '=
^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*'=
, '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', =
'^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*=
', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^geh=
c,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.=
*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.=
*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*', '^hol=
tek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp=
,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huilin=
g,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,.*', '^=
hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.=
*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*',=
 '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^=
indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*=
', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-=
secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', =
'^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevic=
e,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,=
.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jede=
c,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*'=
, '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.=
*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingd=
isplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.=
*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird=
,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*',=
 '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.=
*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linco=
lntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^lin=
ksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luc=
kfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '=
^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^m=
arantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '=
^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.=
*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*=
', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*=
', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '=
^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^micros=
ys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^mi=
lkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubis=
hi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*=
', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^mot=
orola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^m=
scc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader=
,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^=
neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^n=
etgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*',=
 '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,=
.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nord=
ic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nucl=
ei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,=
.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*'=
, '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*', '^on=
ion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^openc=
ores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*'=
, '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddispla=
ys,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^=
ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*'=
, '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*',=
 '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64=
,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^pld=
a,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '=
^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^p=
owertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^p=
rimux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puy=
a,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua=
,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic=
,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^ray=
dium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkab=
le,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^r=
ex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^rio=
t,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*'=
, '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '=
^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', =
'^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulercontrol,=
.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seirobotics=
,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^se=
rcomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^s=
hift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', =
'^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*',=
 '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*'=
, '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*'=
, '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,=
.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^sky=
works,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^s=
msc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solom=
on,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemi=
t,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^squar=
e,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^st=
arfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^ste=
ricsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^=
sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '=
^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taiguanck,.*'=
, '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,=
.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^t=
echnologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.=
*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*'=
, '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunde=
rcomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^tope=
et,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex=
,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq=
,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^tru=
ly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*', '^u-=
blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispac=
e,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', '^via,.=
*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.=
*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*'=
, '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^v=
xt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,=
.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^w=
i2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', '^winbo=
nd,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirel=
esstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', =
'^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus=
,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.=
*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectr=
onics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.=
*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', =
'^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic=
,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-4: '=
gpio-export,name', 'gpio-export,output' do not match any of the regexes: '^=
#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gp=
mc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^=
(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rca=
r_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|s=
t-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9tripod,.=
*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-=
Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^a=
bilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*'=
, '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', =
'^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adi=
eng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*'=
, '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '=
^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^al=
liedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', =
'^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', =
'^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*'=
, '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*'=
, '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.=
*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*'=
, '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '=
^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*', '^arte=
syn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,=
.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*'=
, '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*=
', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^ay=
aneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.=
*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*'=
, '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*'=
, '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', =
'^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', =
'^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', =
'^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.=
*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^ch=
ipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^=
chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*'=
, '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', =
'^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*=
', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^cortina,=
.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,=
.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,=
.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas=
,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^de=
lta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot=
,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', =
'^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '^dlg,.*=
', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoon,.*', =
'^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dyn=
aimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*'=
, '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^=
ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '^eink,.=
*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^e=
lpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emm=
icro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.=
*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*=
', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.=
*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*',=
 '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', =
'^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*=
', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', =
'^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '=
^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*'=
, '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', =
'^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*=
', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^geh=
c,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.=
*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.=
*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*', '^hol=
tek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp=
,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huilin=
g,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,.*', '^=
hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.=
*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*',=
 '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^=
indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*=
', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-=
secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', =
'^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevic=
e,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,=
.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jede=
c,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*'=
, '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.=
*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingd=
isplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.=
*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird=
,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*',=
 '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.=
*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linco=
lntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^lin=
ksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luc=
kfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '=
^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^m=
arantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '=
^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.=
*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*=
', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*=
', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '=
^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^micros=
ys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^mi=
lkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubis=
hi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*=
', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^mot=
orola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^m=
scc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader=
,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^=
neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^n=
etgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*',=
 '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,=
.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nord=
ic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nucl=
ei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,=
.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*'=
, '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*', '^on=
ion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^openc=
ores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*'=
, '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddispla=
ys,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^=
ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*'=
, '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*',=
 '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64=
,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^pld=
a,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '=
^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^p=
owertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^p=
rimux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puy=
a,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua=
,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic=
,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^ray=
dium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkab=
le,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^r=
ex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^rio=
t,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*'=
, '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '=
^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', =
'^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulercontrol,=
.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seirobotics=
,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^se=
rcomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^s=
hift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', =
'^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*',=
 '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*'=
, '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*'=
, '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,=
.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^sky=
works,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^s=
msc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solom=
on,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemi=
t,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^squar=
e,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^st=
arfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^ste=
ricsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^=
sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '=
^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taiguanck,.*'=
, '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,=
.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^t=
echnologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.=
*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*'=
, '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunde=
rcomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^tope=
et,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex=
,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq=
,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^tru=
ly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*', '^u-=
blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispac=
e,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', '^via,.=
*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.=
*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*'=
, '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^v=
xt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,=
.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^w=
i2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', '^winbo=
nd,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirel=
esstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', =
'^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus=
,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.=
*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectr=
onics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.=
*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', =
'^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic=
,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-5: '=
gpio-export,name', 'gpio-export,output' do not match any of the regexes: '^=
#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gp=
mc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^=
(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rca=
r_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|s=
t-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9tripod,.=
*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-=
Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^a=
bilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*'=
, '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', =
'^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adi=
eng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*'=
, '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '=
^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^al=
liedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', =
'^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', =
'^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*'=
, '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*'=
, '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.=
*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*'=
, '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '=
^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*', '^arte=
syn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,=
.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*'=
, '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*=
', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^ay=
aneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.=
*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*'=
, '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*'=
, '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', =
'^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', =
'^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', =
'^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.=
*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^ch=
ipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^=
chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*'=
, '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', =
'^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*=
', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^cortina,=
.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,=
.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,=
.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas=
,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^de=
lta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot=
,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', =
'^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '^dlg,.*=
', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoon,.*', =
'^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dyn=
aimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*'=
, '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^=
ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '^eink,.=
*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^e=
lpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emm=
icro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.=
*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*=
', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.=
*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*',=
 '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', =
'^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*=
', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', =
'^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '=
^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*'=
, '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', =
'^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*=
', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^geh=
c,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.=
*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.=
*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*', '^hol=
tek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp=
,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huilin=
g,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,.*', '^=
hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.=
*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*',=
 '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^=
indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*=
', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-=
secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', =
'^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevic=
e,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,=
.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jede=
c,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*'=
, '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.=
*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingd=
isplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.=
*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird=
,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*',=
 '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.=
*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linco=
lntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^lin=
ksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luc=
kfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '=
^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^m=
arantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '=
^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.=
*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*=
', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*=
', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '=
^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^micros=
ys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^mi=
lkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubis=
hi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*=
', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^mot=
orola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^m=
scc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader=
,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^=
neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^n=
etgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*',=
 '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,=
.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nord=
ic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nucl=
ei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,=
.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*'=
, '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*', '^on=
ion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^openc=
ores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*'=
, '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddispla=
ys,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^=
ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*'=
, '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*',=
 '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64=
,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^pld=
a,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '=
^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^p=
owertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^p=
rimux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puy=
a,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua=
,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic=
,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^ray=
dium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkab=
le,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^r=
ex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^rio=
t,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*'=
, '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '=
^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', =
'^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulercontrol,=
.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seirobotics=
,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^se=
rcomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^s=
hift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', =
'^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*',=
 '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*'=
, '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*'=
, '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,=
.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^sky=
works,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^s=
msc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solom=
on,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemi=
t,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^squar=
e,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^st=
arfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^ste=
ricsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^=
sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '=
^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taiguanck,.*'=
, '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,=
.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^t=
echnologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.=
*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*'=
, '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunde=
rcomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^tope=
et,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex=
,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq=
,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^tru=
ly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*', '^u-=
blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispac=
e,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', '^via,.=
*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.=
*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*'=
, '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^v=
xt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,=
.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^w=
i2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', '^winbo=
nd,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirel=
esstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', =
'^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus=
,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.=
*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectr=
onics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.=
*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', =
'^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic=
,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-6: '=
gpio-export,name', 'gpio-export,output' do not match any of the regexes: '^=
#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gp=
mc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^=
(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rca=
r_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|s=
t-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9tripod,.=
*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-=
Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^a=
bilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*'=
, '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', =
'^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adi=
eng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*'=
, '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '=
^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^al=
liedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', =
'^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', =
'^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*'=
, '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*'=
, '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.=
*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*'=
, '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '=
^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*', '^arte=
syn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,=
.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*'=
, '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*=
', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^ay=
aneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.=
*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*'=
, '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*'=
, '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', =
'^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', =
'^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', =
'^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.=
*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^ch=
ipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^=
chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*'=
, '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', =
'^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*=
', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^cortina,=
.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,=
.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,=
.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas=
,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^de=
lta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot=
,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', =
'^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '^dlg,.*=
', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoon,.*', =
'^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dyn=
aimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*'=
, '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^=
ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '^eink,.=
*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^e=
lpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emm=
icro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.=
*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*=
', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.=
*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*',=
 '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', =
'^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*=
', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', =
'^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '=
^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*'=
, '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', =
'^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*=
', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^geh=
c,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.=
*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.=
*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*', '^hol=
tek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp=
,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huilin=
g,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,.*', '^=
hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.=
*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*',=
 '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^=
indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*=
', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-=
secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', =
'^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevic=
e,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,=
.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jede=
c,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*'=
, '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.=
*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingd=
isplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.=
*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird=
,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*',=
 '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.=
*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linco=
lntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^lin=
ksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luc=
kfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '=
^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^m=
arantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '=
^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.=
*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*=
', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*=
', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '=
^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^micros=
ys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^mi=
lkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubis=
hi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*=
', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^mot=
orola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^m=
scc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader=
,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^=
neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^n=
etgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*',=
 '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,=
.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nord=
ic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nucl=
ei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,=
.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*'=
, '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*', '^on=
ion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^openc=
ores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*'=
, '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddispla=
ys,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^=
ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*'=
, '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*',=
 '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64=
,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^pld=
a,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '=
^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^p=
owertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^p=
rimux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puy=
a,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua=
,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic=
,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^ray=
dium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkab=
le,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^r=
ex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^rio=
t,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*'=
, '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '=
^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', =
'^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulercontrol,=
.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seirobotics=
,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^se=
rcomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^s=
hift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', =
'^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*',=
 '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*'=
, '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*'=
, '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,=
.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^sky=
works,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^s=
msc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solom=
on,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemi=
t,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^squar=
e,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^st=
arfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^ste=
ricsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^=
sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '=
^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taiguanck,.*'=
, '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,=
.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^t=
echnologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.=
*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*'=
, '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunde=
rcomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^tope=
et,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex=
,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq=
,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^tru=
ly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*', '^u-=
blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispac=
e,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik,.*', '=
^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', =
'^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,=
.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', '^via,.=
*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.=
*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*'=
, '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^v=
xt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,=
.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^w=
i2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', '^winbo=
nd,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirel=
esstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', =
'^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus=
,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.=
*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectr=
onics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.=
*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', =
'^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic=
,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /mikro-bu=
s/gpio-export@1: failed to match any schema with compatible: ['gpio-export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-46: =
'gpio-export,name', 'gpio-export,output' do not match any of the regexes: '=
^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|g=
pmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '=
^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rc=
ar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|=
st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9tripod,=
.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA=
-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^=
abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*=
', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*',=
 '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^ad=
ieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*=
', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', =
'^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^a=
lliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*',=
 '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*',=
 '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*=
', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*=
', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,=
.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*=
', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', =
'^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '^arrow,.*', '^art=
esyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed=
,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*=
', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.=
*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^a=
yaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,=
.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*=
', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^=
bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*=
', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*',=
 '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*',=
 '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*',=
 '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,=
.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^c=
hipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '=
^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*=
', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*',=
 '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.=
*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corpro,.*', '^cortina=
,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky=
,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech=
,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dalla=
s,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^d=
elta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobo=
t,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*',=
 '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '^dlc,.*', '^dlg,.=
*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*', '^dongwoon,.*',=
 '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dy=
naimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*=
', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '=
^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfochips,.*', '^eink,=
.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^=
elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^em=
micro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,=
.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.=
*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,=
.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*'=
, '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*',=
 '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.=
*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*',=
 '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', =
'^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*=
', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*',=
 '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.=
*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^ge=
hc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatec=
h,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glinet,.*', '^globalsc=
ale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^g=
oodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*'=
, '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', =
'^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,=
.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,=
.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*', '^holt,.*', '^ho=
ltek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^h=
p,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huili=
ng,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynetek,.*', '=
^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,=
.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*'=
, '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '=
^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.=
*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside=
-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*',=
 '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevi=
ce,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian=
,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jed=
ec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*=
', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,=
.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^king=
display,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,=
.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^lair=
d,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*'=
, '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,=
.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linc=
olntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^li=
nksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lit=
eon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longc=
heer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lu=
ckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', =
'^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^=
marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', =
'^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,=
.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.=
*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.=
*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', =
'^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^micro=
sys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^m=
ilkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubi=
shi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.=
*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^mo=
torola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^=
mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreade=
r,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '=
^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^=
netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*'=
, '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing=
,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nor=
dic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuc=
lei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia=
,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*=
', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*', '^onie,.*', '^o=
nion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^open=
cores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*=
', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddispl=
ays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '=
^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*=
', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*'=
, '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine6=
4,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^pl=
da,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', =
'^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^=
powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^=
primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^pu=
ya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihu=
a,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsoni=
c,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^ra=
ydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarka=
ble,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^=
rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^ri=
ot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*=
', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', =
'^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*',=
 '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulercontrol=
,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seirobotic=
s,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^s=
ercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^=
shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*',=
 '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*'=
, '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*=
', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*=
', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth=
,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^sk=
yworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^=
smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solo=
mon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacem=
it,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^squa=
re,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^s=
tarfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^st=
ericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '=
^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', =
'^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taiguanck,.*=
', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs=
,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^=
technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,=
.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*=
', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thund=
ercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^top=
eet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^torade=
x,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^t=
q,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^tr=
uly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*', '^u=
-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispa=
ce,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^ultratronik,.*', =
'^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*',=
 '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite=
,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vertexcom,.*', '^via,=
.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,=
.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*=
', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^=
vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd=
,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^=
wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^willsemi,.*', '^winb=
ond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wire=
lesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*',=
 '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybu=
s,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,=
.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelect=
ronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,=
.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*',=
 '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagi=
c,.*', '^zte,.*', '^zyxel,.*'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
