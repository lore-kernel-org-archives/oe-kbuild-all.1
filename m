Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26633299928
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766915037; cv=none; b=cbZ9HA5aiK/mX8zEx6F7eb6KJVBjcUdgd9XbIrVcRQurDDNaXQujbORWN7m5o7rO1TpYAe1FJa5bs50N6ECskSaTToTCYETebZ9qzWgJgVy3KT99+Um+xkmrskQTT8TVEvsZXUgOdC7ePvoFWI3JnF+tIi0ijCKG8E/nMCegf+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766915037; c=relaxed/simple;
	bh=1ztBq3Q4w6Bz8oxtSozsPAoa8bJir8H62f6TTNTSMNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMsorvGHkoXzTdBuIZPWgHuxca/MoA+MWXBBsVxyvfCdKF6WCMNE2v4dr/O5F0SqgJfmSYgeW7w4KbxspmZEvsZsCm67gbFIR5l5RnR+B2M+HeDGbLpE/QIwODBa0kJdRWtBYorAfKjU8U/kMTbEkQ6D0rfBhSygot0wT7DnP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+P3Bod8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+P3Bod8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766915033; x=1798451033;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1ztBq3Q4w6Bz8oxtSozsPAoa8bJir8H62f6TTNTSMNU=;
  b=k+P3Bod8UyUULT0JPa3gNIwr6OGoKtG7pkM63HHHOyR+kKGdbG/o63Ev
   ZnuUNNedRbOeG6xynLyN3vnCxY1JxXbTDwcDrvOsArS8ZiUjaxhb35Dfj
   PDfWujHW/QmWpxOPKgDcj/s0T0X52bLzqQQPoOW4J0Ed0f6TFe/AvC9SO
   lQb/LUvr9gtm3MJ/ogHHRaYfN8PnRIMXr2GAru62X5TdxT4unMZsDyOfU
   REqY0lI4mOGT50YcX8ekhedG5V3jd893+2nynYTH5mQL9Q+k/rNvjAmro
   +39XiZ+MgWcRHSiJ3JbYYi+TnV9+i6dGn32IdSMCVOWs7QW793Z5TGghn
   Q==;
X-CSE-ConnectionGUID: yvVeVni5TkS+b6swBPpvsw==
X-CSE-MsgGUID: ymiOBj42TTutvTHxSVUw+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="86148690"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="86148690"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 01:43:52 -0800
X-CSE-ConnectionGUID: fD0PWiTSRJKVgoS6Ja+cBw==
X-CSE-MsgGUID: WHddIK1dRqSIaNd9rH5inA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200987257"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 28 Dec 2025 01:43:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZnJV-000000007T2-0sS3;
	Sun, 28 Dec 2025 09:43:49 +0000
Date: Sun, 28 Dec 2025 10:43:09 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 100/113]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /
 (bananapi,bpi-r4-lite): False schema does not allow {'reg': [[0, 1073741824,
 0, 268435456]]}
Message-ID: <202512281040.zbg3a0y2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   2bf208610be36b3e9803e1060d0c43183478ffeb
commit: c410b22994547b002240591b268d399a2238c1b8 [100/113] arm64: dts: medi=
atek: mt7987: Add Bananapi-R4 Lite
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/arc=
hive/20251228/202512281040.zbg3a0y2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251228/202512281040.zbg3a0y2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281040.zbg3a0y2-lkp@i=
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
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /reserved=
-memory/wmcpu-reserved@50000000: failed to match any schema with compatible=
: ['mediatek,wmcpu-reserved']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc (simp=
le-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc (simp=
le-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/hwve=
r@8000000: failed to match any schema with compatible: ['mediatek,hwver', '=
syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/infr=
a_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek=
,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pinctrl@1=
001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'groups' does not match=
 any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pinctrl@1=
001f000 (mediatek,mt7987-pinctrl): mdio0-pins:conf: 'pins' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7987-=
pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/boot=
trap@1001f6f0: failed to match any schema with compatible: ['mediatek,boott=
rap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/trng=
@1020f000: failed to match any schema with compatible: ['mediatek,mt7987-rn=
g']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pca9545@7=
0 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pca9545@7=
0 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', =
'#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: eeprom@50=
 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'pa=
ge-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_valid' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names:1: 'rx_imp' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names: ['intr', 'aut=
o_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: [[29], [30]] is to=
o short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_valid' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
--
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): interrupt-names: ['ring0', 'ring1'=
, 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): interrupts: [[0, 214, 4], [0, 215,=
 4], [0, 216, 4], [0, 217, 4]] is too short
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
^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', =
'^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^alt=
r,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*'=
, '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^a=
mstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anlogic,.*',=
 '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^=
argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arm=
som,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.=
*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*'=
, '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avag=
o,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^=
axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.=
*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^b=
igtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', =
'^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,=
=2E*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '=
^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*=
', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', =
'^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwi=
se,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^ch=
ipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*'=
, '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisc=
o,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.=
*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*=
', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.=
*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.=
*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.=
*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,=
=2E*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^d=
elta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobo=
t,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*',=
 '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^=
dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', =
'^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*'=
, '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', =
'^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*'=
, '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '=
^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emc=
raft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*=
', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^e=
nergymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^e=
pson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^e=
verest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^e=
xegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', =
'^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^f=
eiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^fo=
caltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '=
^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^f=
xtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', =
'^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.=
*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*=
', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globa=
ltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^goo=
gle,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*',=
 '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*'=
, '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*'=
, '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', =
'^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^h=
operf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huaw=
ei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', =
'^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,=
=2E*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagi=
s,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.=
*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^inge=
nic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^i=
nside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol=
,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iro=
ndevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^=
itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', =
'^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^ji=
de,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keith=
koep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '=
^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '=
^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '=
^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctec=
h,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', =
'^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '=
^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*',=
 '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', =
'^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^=
longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*',=
 '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.=
*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvel=
l,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayque=
en,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '=
^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^=
memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^me=
rrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*',=
 '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.=
*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,=
=2E*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^=
ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^one=
plus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*'=
, '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^o=
penrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^=
ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^=
ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^pa=
rallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^per=
vasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^=
pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,=
=2E*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocke=
tbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', =
'^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^p=
ri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedli=
ght,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,=
=2E*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta=
,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberr=
ypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek=
,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^ret=
ronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomag=
ic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*'=
, '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', =
'^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^=
sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sc=
hulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', =
'^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensor=
tek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^s=
harp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', =
'^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^=
siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*',=
 '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^sil=
iconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', =
'^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^sk=
ov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '=
^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun=
,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.=
*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd=
,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-erics=
son,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^s=
te,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^s=
ummit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', =
'^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^=
taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*',=
 '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^techn=
ologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', =
'^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*', '^=
test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercom=
m,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.=
*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*'=
, '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*'=
, '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.=
*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot=
,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*'=
, '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi=
,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*',=
 '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^v=
ia,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtu=
al,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax=
,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*',=
 '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '=
^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*',=
 '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', =
'^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.=
*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powe=
rs,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^=
xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xu=
nlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*=
', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys=
,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,=
=2E*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', =
'^zte,.*', '^zyxel,.*'
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
^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', =
'^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^alt=
r,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*'=
, '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^a=
mstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anlogic,.*',=
 '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^=
argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arm=
som,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.=
*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*'=
, '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avag=
o,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^=
axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.=
*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^b=
igtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', =
'^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,=
=2E*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '=
^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*=
', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', =
'^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwi=
se,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^ch=
ipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*'=
, '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisc=
o,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.=
*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*=
', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.=
*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.=
*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.=
*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,=
=2E*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^d=
elta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobo=
t,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*',=
 '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^=
dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', =
'^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*'=
, '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', =
'^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*'=
, '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '=
^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emc=
raft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*=
', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^e=
nergymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^e=
pson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^e=
verest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^e=
xegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', =
'^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^f=
eiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^fo=
caltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '=
^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^f=
xtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', =
'^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.=
*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*=
', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globa=
ltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^goo=
gle,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*',=
 '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*'=
, '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*'=
, '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', =
'^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^h=
operf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huaw=
ei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', =
'^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,=
=2E*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagi=
s,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.=
*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^inge=
nic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^i=
nside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol=
,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iro=
ndevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^=
itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', =
'^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^ji=
de,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keith=
koep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '=
^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '=
^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '=
^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctec=
h,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', =
'^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '=
^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*',=
 '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', =
'^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^=
longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*',=
 '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.=
*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvel=
l,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayque=
en,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '=
^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^=
memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^me=
rrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*',=
 '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.=
*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,=
=2E*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^=
ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^one=
plus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*'=
, '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^o=
penrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^=
ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^=
ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^pa=
rallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^per=
vasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^=
pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,=
=2E*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocke=
tbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', =
'^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^p=
ri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedli=
ght,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,=
=2E*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta=
,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberr=
ypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek=
,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^ret=
ronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomag=
ic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*'=
, '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', =
'^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^=
sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sc=
hulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', =
'^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensor=
tek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^s=
harp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', =
'^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^=
siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*',=
 '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^sil=
iconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', =
'^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^sk=
ov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '=
^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun=
,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.=
*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd=
,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-erics=
son,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^s=
te,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^s=
ummit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', =
'^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^=
taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*',=
 '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^techn=
ologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', =
'^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*', '^=
test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercom=
m,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.=
*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*'=
, '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*'=
, '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.=
*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot=
,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*'=
, '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi=
,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*',=
 '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^v=
ia,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtu=
al,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax=
,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*',=
 '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '=
^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*',=
 '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', =
'^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.=
*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powe=
rs,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^=
xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xu=
nlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*=
', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys=
,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,=
=2E*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', =
'^zte,.*', '^zyxel,.*'
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
^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', =
'^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^alt=
r,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*'=
, '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^a=
mstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anlogic,.*',=
 '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^=
argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arm=
som,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.=
*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*'=
, '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avag=
o,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^=
axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.=
*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^b=
igtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', =
'^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,=
=2E*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '=
^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*=
', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', =
'^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwi=
se,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^ch=
ipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*'=
, '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisc=
o,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.=
*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*=
', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.=
*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.=
*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.=
*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,=
=2E*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^d=
elta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobo=
t,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*',=
 '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^=
dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', =
'^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*'=
, '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', =
'^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*'=
, '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '=
^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emc=
raft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*=
', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^e=
nergymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^e=
pson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^e=
verest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^e=
xegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', =
'^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^f=
eiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^fo=
caltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '=
^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^f=
xtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', =
'^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.=
*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*=
', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globa=
ltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^goo=
gle,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*',=
 '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*'=
, '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*'=
, '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', =
'^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^h=
operf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huaw=
ei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', =
'^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,=
=2E*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagi=
s,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.=
*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^inge=
nic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^i=
nside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol=
,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iro=
ndevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^=
itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', =
'^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^ji=
de,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keith=
koep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '=
^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '=
^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '=
^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctec=
h,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', =
'^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '=
^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*',=
 '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', =
'^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^=
longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*',=
 '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.=
*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvel=
l,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayque=
en,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '=
^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^=
memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^me=
rrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*',=
 '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.=
*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,=
=2E*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^=
ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^one=
plus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*'=
, '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^o=
penrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^=
ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^=
ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^pa=
rallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^per=
vasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^=
pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,=
=2E*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocke=
tbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', =
'^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^p=
ri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedli=
ght,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,=
=2E*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta=
,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberr=
ypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek=
,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^ret=
ronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomag=
ic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*'=
, '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', =
'^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^=
sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sc=
hulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', =
'^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensor=
tek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^s=
harp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', =
'^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^=
siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*',=
 '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^sil=
iconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', =
'^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^sk=
ov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '=
^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun=
,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.=
*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd=
,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-erics=
son,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^s=
te,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^s=
ummit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', =
'^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^=
taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*',=
 '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^techn=
ologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', =
'^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*', '^=
test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercom=
m,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.=
*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*'=
, '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*'=
, '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.=
*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot=
,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*'=
, '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi=
,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*',=
 '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^v=
ia,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtu=
al,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax=
,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*',=
 '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '=
^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*',=
 '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', =
'^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.=
*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powe=
rs,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^=
xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xu=
nlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*=
', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys=
,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,=
=2E*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', =
'^zte,.*', '^zyxel,.*'
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
^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', =
'^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^alt=
r,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*'=
, '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^a=
mstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anlogic,.*',=
 '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^=
argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arm=
som,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.=
*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*'=
, '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avag=
o,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^=
axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.=
*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^b=
igtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', =
'^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,=
=2E*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '=
^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*=
', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', =
'^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwi=
se,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^ch=
ipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*'=
, '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisc=
o,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.=
*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*=
', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.=
*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.=
*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.=
*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,=
=2E*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^d=
elta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobo=
t,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*',=
 '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^=
dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', =
'^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*'=
, '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', =
'^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*'=
, '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '=
^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emc=
raft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*=
', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^e=
nergymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^e=
pson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^e=
verest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^e=
xegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', =
'^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^f=
eiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^fo=
caltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '=
^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^f=
xtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', =
'^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.=
*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*=
', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globa=
ltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^goo=
gle,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*',=
 '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*'=
, '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*'=
, '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', =
'^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^h=
operf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huaw=
ei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', =
'^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,=
=2E*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagi=
s,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.=
*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^inge=
nic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^i=
nside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol=
,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^iro=
ndevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^=
itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', =
'^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^ji=
de,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keith=
koep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '=
^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '=
^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '=
^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctec=
h,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', =
'^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '=
^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*',=
 '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', =
'^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^=
longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*',=
 '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.=
*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvel=
l,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayque=
en,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '=
^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^=
memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^me=
rrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*',=
 '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.=
*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,=
=2E*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^=
ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^one=
plus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*'=
, '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^o=
penrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^=
ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^=
ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^pa=
rallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^per=
vasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^=
pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,=
=2E*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocke=
tbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', =
'^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^p=
ri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedli=
ght,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,=
=2E*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta=
,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberr=
ypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek=
,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^ret=
ronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomag=
ic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*'=
, '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', =
'^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^=
sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sc=
hulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', =
'^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensor=
tek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^s=
harp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', =
'^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^=
siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*',=
 '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^sil=
iconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', =
'^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^sk=
ov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '=
^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun=
,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.=
*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd=
,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-erics=
son,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^s=
te,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^s=
ummit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', =
'^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^=
taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*',=
 '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^techn=
ologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', =
'^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*', '^=
test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercom=
m,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.=
*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*'=
, '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*'=
, '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.=
*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot=
,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*'=
, '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi=
,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*',=
 '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^v=
ia,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtu=
al,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax=
,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*',=
 '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '=
^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*',=
 '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', =
'^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.=
*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powe=
rs,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^=
xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xu=
nlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*=
', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys=
,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,=
=2E*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', =
'^zte,.*', '^zyxel,.*'
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
=2E*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-=
zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', =
'^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,=
=2E*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,=
=2E*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvisio=
n,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*'=
, '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediat=
ech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.=
*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anlog=
ic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^apt=
ina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,=
=2E*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hyco=
n,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',=
 '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^=
imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostar=
tec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '=
^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*'=
, '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^interco=
ntrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', =
'^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*=
', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,=
=2E*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
=2E*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '=
^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^=
m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*',=
 '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*',=
 '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediat=
ek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellano=
x,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,=
=2E*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
rystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*',=
 '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', =
'^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '=
^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^mo=
ortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '=
^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^ms=
tar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mx=
ic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '=
^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.=
*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhav=
en,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,=
=2E*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',=
 '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^op=
alkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpando=
ra,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^oriset=
ech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^over=
kiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parad=
e,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom=
,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picoc=
hip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '=
^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*'=
, '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portw=
ell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy=
,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '=
^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.=
*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '=
^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^r=
aspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^=
realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*'=
, '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rv=
e,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
=2E*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,=
=2E*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^=
seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*=
', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^s=
gx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shir=
atech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^so=
urceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,=
=2E*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*=
', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starte=
rkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storo=
pack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^sup=
ermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^=
tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',=
 '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*=
', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', =
'^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,=
=2E*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest=
,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*',=
 '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', =
'^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', =
'^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvisio=
n,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^x=
illybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^=
xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opt=
oelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-to=
ptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlin=
k,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^=
zkmagic,.*', '^zte,.*', '^zyxel,.*'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
