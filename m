Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85CC2D8DBB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078520; cv=none; b=gnUFTRYG8aIzXwiPSHhguBeq5dO9Fho0f5nPGLHR1ybYA0JvYkjw9kd/hoVPJw6gIOHPpViYYi+QjzxrGYNAt3xDGNSldsU+c1XcFWq+kwlXS2RScPm50F2zP2qByaXO0vVQ7T0Bw63eUWGhAVqr5bPuHZyFRqtxf8XEYgDHvcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078520; c=relaxed/simple;
	bh=GTjfcWfrpv0vkFE6U2vhW/Sbcpp4WTzcVB3Xktgs5O8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gpb0mCpzz9zhSkrrlHHmfNilAbELfZizupzOtmpdOMh6BcpSrldT88y0ASvIJERs/r44aQTYiL2zFQmHCHRzFokX5rXHW/HHRnC4PxHk/cVMXELUFoobomZSxbXt0GwCvKcLS25johJeDC9Tu36RSRjWU5eGGGauPpzC0rd/kwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L34NtCYe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L34NtCYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773078515; x=1804614515;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GTjfcWfrpv0vkFE6U2vhW/Sbcpp4WTzcVB3Xktgs5O8=;
  b=L34NtCYe8xZhRjgSMBSGOjTyzGDvx7XaGy5ttAXvPCCJ3o7J8KJDxWD8
   KdJ2vsRGRvoNsqHdTQETsqXF+0mu4RJvVjglm4t2TggGez5QjProGld10
   I9DyNou5eT0SYZpUZMTM1JQQck0jOgeIArDPBW3g/u7gG3UdFi0SkVOD6
   BgYW9+XUabRdlUxEv21INIM5O6WD3teJJbAwDg5oShBDmjgc6tML3ZZRJ
   MffOFFlVuX9mupFycggwYGUGq/1I+kuZJcD1lceEiJpFY7N0gKEgUeYJu
   joHPJ30LSIZLHgX0GRUtoY1ZTr5YLFSdTtjqaKZh0qqbbBsT3qo8rN/k6
   w==;
X-CSE-ConnectionGUID: evbTPpDgQx2wwn+Bjn9mvg==
X-CSE-MsgGUID: 8PCwRYDdSwG9eSkmQ8cZqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85200534"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85200534"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 10:48:34 -0700
X-CSE-ConnectionGUID: qiDz06wcTb+NzjQsx+fE7Q==
X-CSE-MsgGUID: GVdM+7plSkKY/Z+ya/E9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218972983"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2026 10:48:33 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzeiT-000000002uN-2fg1;
	Mon, 09 Mar 2026 17:48:29 +0000
Date: Mon, 09 Mar 2026 18:48:18 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 59/64]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /: failed to
 match any schema with compatible: ['bananapi,bpi-r4-lite',
 'mediatek,mt7987a']
Message-ID: <202603091832.hfZIdK1H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: 06038d4b2af8203616e0ebcc2f20706b8ffad970 [59/64] arm64: dts: mediat=
ek: mt7987: Add Bananapi-R4 Lite
config: arm64-randconfig-2054-20260307 (https://download.01.org/0day-ci/arc=
hive/20260309/202603091832.hfZIdK1H-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260309/202603091832.hfZIdK1H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603091832.hfZIdK1H-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7987.dtsi:568.29-600.5: Warning (simple_b=
us_reg): /soc/usb-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7987.dtsi:679.12-682.5: Warning (simple_b=
us_reg): /soc/wed: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7987a.dtsi:129.22-136.4: Warning (simple_=
bus_reg): /soc_netsys/hnat@15000000: simple-bus unit address format error, =
expected "15100000"
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-mikrobus.dtsi:=
28.35-55.5: Warning (simple_bus_reg): /mikro-bus/gpio-export@0: missing or =
empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-mikrobus.dtsi:=
58.35-85.5: Warning (simple_bus_reg): /mikro-bus/gpio-export@1: missing or =
empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7987.dtsi:222.27-239.5: Warning (avoid_un=
necessary_addr_size): /soc_clksys/syscon@15000000: unnecessary #address-cel=
ls/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" pr=
operty
   arch/arm64/boot/dts/mediatek/mt7987.dtsi:28.24-33.4: Warning (unique_uni=
t_address_if_enabled): /oscillator@0: duplicate unit-address (also used in =
node /sfp@0)
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /: failed=
 to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt=
7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /: failed=
 to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt=
7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixe=
d:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): False schema does not allow {'reg': [[0, 1073741824, 0, 26=
8435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: opp_table=
0 (operating-points-v2): $nodename:0: 'opp_table0' does not match '^opp-tab=
le(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: opp_table=
0 (operating-points-v2): Unevaluated properties are not allowed ('opp-share=
d', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: l2-cache =
(cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: clkitg (s=
imple-bus): $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|b=
us|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc_clksy=
s (simple-bus): $nodename:0: 'soc_clksys' does not match '^([a-z][a-z0-9\\-=
]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/infracfg@10001000: failed to match any schema with compatible: ['mediate=
k,mt7987-infracfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/topckgen@1001b000: failed to match any schema with compatible: ['mediate=
k,mt7987-topckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/apmixedsys@1001e000: failed to match any schema with compatible: ['media=
tek,mt7987-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@10060000: failed to match any schema with compatible: ['mediatek,=
mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@10060000: failed to match any schema with compatible: ['mediatek,=
mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@10060000/pcs: failed to match any schema with compatible: ['media=
tek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@10070000: failed to match any schema with compatible: ['mediatek,=
mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@10070000: failed to match any schema with compatible: ['mediatek,=
mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@10070000/pcs: failed to match any schema with compatible: ['media=
tek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/mcusys@10400000: failed to match any schema with compatible: ['mediatek,=
mt7987-mcusys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@15000000: failed to match any schema with compatible: ['mediatek,=
mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@15000000: failed to match any schema with compatible: ['mediatek,=
mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clks=
ys/syscon@15000000/reset-controller: failed to match any schema with compat=
ible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pwm-fan (=
pwm-fan): '#thermal-sensor-cells' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /reserved=
-memory/wmcpu-reserved@50000000: failed to match any schema with compatible=
: ['mediatek,wmcpu-reserved']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc (simp=
le-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc (simp=
le-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/hwve=
r@8000000: failed to match any schema with compatible: ['mediatek,hwver', '=
syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/infr=
a_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek=
,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pinc=
trl@1001f000: failed to match any schema with compatible: ['mediatek,mt7987=
-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/boot=
trap@1001f6f0: failed to match any schema with compatible: ['mediatek,boott=
rap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/trng=
@1020f000: failed to match any schema with compatible: ['mediatek,mt7987-rn=
g']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pwm@=
10048000: failed to match any schema with compatible: ['mediatek,mt7987-pwm=
']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pca9545@7=
0 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pca9545@7=
0 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', =
'#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: eeprom@50=
 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'pa=
ge-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11007=
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
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/spi@=
11007800: failed to match any schema with compatible: ['mediatek,mt7987-spi=
-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,mt7987-spi-single): compatible: 'oneOf' conditional failed, o=
ne must be fixed:
   	['mediatek,mt7987-spi-single', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7629-spi', 'med=
iatek,mt8365-spi']
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/spi@=
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
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/spi@=
11009800: failed to match any schema with compatible: ['mediatek,mt7987-spi=
-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_valid' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names:1: 'rx_imp' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names: ['intr', 'aut=
o_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: [[29], [30]] is to=
o short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_valid' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cell-names: ['intr', 'rx_=
imp', 'tx_imp', 'auto_load_valid'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cells: [[31], [32], [33],=
 [34]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): $nodename:0: 'usb-phy@11c50000' does not match '=
^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): compatible: 'oneOf' conditional failed, one must=
 be fixed:
   	['mediatek,mt7987', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7987' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt76=
23-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7987' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt68=
93-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7981-tphy', 'mediatek,mt7986-=
tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tph=
y', 'mediatek,mt8365-tphy']
   	'mediatek,mt7987' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt81=
95-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/usb-=
phy@11c50000: failed to match any schema with compatible: ['mediatek,mt7987=
', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): compatible:0: 'mediatek,mt7987-xhci' is not one=
 of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci'=
, 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', '=
mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'med=
iatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8189-xhci', 'mediat=
ek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/usb@=
11200000: failed to match any schema with compatible: ['mediatek,mt7987-xhc=
i', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names: ['aud_bus_ck', 'aud_26=
m_ck', 'aud_l_ck', 'aud_aud_ck', 'aud_eg2_ck', 'aud_sel', 'aud_i2s_m'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clocks: [[22, 13], [22, 14], [22, 1=
5], [22, 16], [22, 17], [4, 50], [4, 77]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:5: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:6: 'i2s_m' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): compatible: 'oneOf' conditional fai=
led, one must be fixed:
   	['mediatek,mt7987-afe', 'mediatek,mt7986-afe'] is too long
   	'mediatek,mt7986-afe' was expected
   	'mediatek,mt7987-afe' is not one of ['mediatek,mt7981-afe', 'mediatek,m=
t7988-afe']
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/audi=
o-controller@11210000: failed to match any schema with compatible: ['mediat=
ek,mt7987-afe', 'mediatek,mt7986-afe']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hc=
lk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], =
[22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/wed:=
 failed to match any schema with compatible: ['mediatek,wed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/wed0=
@15010000: failed to match any schema with compatible: ['mediatek,wed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/wdma=
@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@1128=
0000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pcie=
@11280000: failed to match any schema with compatible: ['mediatek,mt7987-pc=
ie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@1129=
0000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pcie=
@11290000: failed to match any schema with compatible: ['mediatek,mt7987-pc=
ie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/topm=
isc@10021000: failed to match any schema with compatible: ['mediatek,mt7987=
-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/topm=
isc@10021000: failed to match any schema with compatible: ['mediatek,mt7987=
-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: efuse@11d=
30000 (mediatek,efuse): compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['mediatek,efuse'] is too short
   	'mediatek,efuse' is not one of ['mediatek,mt8188-efuse', 'mediatek,mt81=
89-efuse', 'mediatek,mt8196-efuse']
   	'mediatek,mt8186-efuse' was expected
   	'mediatek,efuse' is not one of ['mediatek,mt8186-efuse', 'mediatek,mt81=
88-efuse']
   	'mediatek,efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt76=
23-efuse', 'mediatek,mt7981-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt79=
88-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt81=
89-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt85=
16-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/deva=
pc@1a110000: failed to match any schema with compatible: ['mediatek,mt7987-=
devapc']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc_netsy=
s (simple-bus): $nodename:0: 'soc_netsys' does not match '^([a-z][a-z0-9\\-=
]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: syscon@15=
031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,mt7988-ethwarp', '=
syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: syscon@15=
031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_nets=
ys/ethernet@15100000: failed to match any schema with compatible: ['mediate=
k,mt7987-eth']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_nets=
ys/hnat@15000000: failed to match any schema with compatible: ['mediatek,mt=
k-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): 'eth' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): 'clock-names' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): interrupt-names: ['ring0', 'ring1'=
, 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): interrupts: [[0, 214, 4], [0, 215,=
 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' conditional fa=
iled, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'marvell,armada-cp110-crypto' was expected
   	'inside-secure,safexcel-eip197b' is not one of ['marvell,armada-3700-cr=
ypto', 'mediatek,mt7986-crypto']
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	'inside-secure,safexcel-eip197b' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_nets=
ys/crypto@15600000: failed to match any schema with compatible: ['inside-se=
cure,safexcel-eip197b', 'security-ip-197-srv']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mikro-bus=
 (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mikro-bus=
 (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /mikro-bu=
s/gpio-export@0: failed to match any schema with compatible: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-3: '=
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
^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi=
-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*=
', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '=
^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', =
'^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,=
.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*=
', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*',=
 '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^br=
cm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*'=
, '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^c=
alaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '=
^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdn=
s,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkp=
oint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^=
chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^c=
iaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*'=
, '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', =
'^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.=
*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*',=
 '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,=
.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cy=
x,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcom=
puting,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devante=
ch,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^di=
gilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dpte=
chnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage=
,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^ec=
kelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*=
', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^el=
ement14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfi=
re,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-e=
lectronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^=
endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '=
^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^e=
ttus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^=
exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^faceboo=
k,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^=
fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.=
*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^four=
semi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^frien=
dlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^game=
force,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.=
*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^g=
enesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*',=
 '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,=
.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*'=
, '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoch=
uangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', =
'^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*',=
 '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynit=
ron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '=
^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*', '^im=
g,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indie=
droid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^=
ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secur=
e,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inv=
ensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*'=
, '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', =
'^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*'=
, '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^j=
oz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '=
^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdispla=
y,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '=
^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*',=
 '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^le=
adtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '=
^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntec=
h,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^linksys,=
.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*=
', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.=
*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,=
.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macni=
ca,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^ma=
xbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^m=
bvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*'=
, '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*',=
 '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '=
^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.=
*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikro=
e,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,=
.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.=
*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*=
', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*'=
, '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*',=
 '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', =
'^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofide=
lity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^ne=
tron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', =
'^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^n=
intendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatec=
h,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboa=
rd,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '=
^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^on=
eplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*=
', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^=
openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '=
^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '=
^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^p=
arallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pe=
rvasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '=
^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower=
,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocket=
book,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '=
^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pr=
i,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlig=
ht,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.=
*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*=
', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi=
,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*=
', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retron=
ix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,=
.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.=
*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*=
', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sa=
ncloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schne=
ider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*',=
 '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion=
,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', =
'^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^s=
hiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^=
sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*'=
, '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconf=
ile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^=
sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitr=
onix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^=
smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.=
*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '=
^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalh=
dl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.=
*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^start=
erkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^stor=
opack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^su=
permicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^sy=
nopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.=
*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.=
*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^v=
dl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostron=
g,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse=
,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,=
.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^=
wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*',=
 '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^w=
illsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^=
winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*'=
, '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^x=
icor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '=
^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.=
*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*=
', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,=
.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zi=
nitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi=
-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*=
', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '=
^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', =
'^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,=
.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*=
', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*',=
 '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^br=
cm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*'=
, '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^c=
alaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '=
^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdn=
s,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkp=
oint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^=
chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^c=
iaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*'=
, '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', =
'^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.=
*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*',=
 '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,=
.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cy=
x,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcom=
puting,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devante=
ch,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^di=
gilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dpte=
chnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage=
,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^ec=
kelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*=
', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^el=
ement14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfi=
re,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-e=
lectronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^=
endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '=
^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^e=
ttus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^=
exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^faceboo=
k,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^=
fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.=
*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^four=
semi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^frien=
dlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^game=
force,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.=
*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^g=
enesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*',=
 '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,=
.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*'=
, '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoch=
uangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', =
'^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*',=
 '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynit=
ron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '=
^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*', '^im=
g,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indie=
droid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^=
ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secur=
e,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inv=
ensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*'=
, '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', =
'^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*'=
, '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^j=
oz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '=
^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdispla=
y,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '=
^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*',=
 '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^le=
adtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '=
^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntec=
h,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^linksys,=
.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*=
', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.=
*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,=
.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macni=
ca,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^ma=
xbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^m=
bvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*'=
, '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*',=
 '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '=
^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.=
*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikro=
e,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,=
.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.=
*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*=
', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*'=
, '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*',=
 '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', =
'^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofide=
lity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^ne=
tron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', =
'^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^n=
intendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatec=
h,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboa=
rd,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '=
^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^on=
eplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*=
', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^=
openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '=
^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '=
^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^p=
arallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pe=
rvasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '=
^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower=
,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocket=
book,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '=
^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pr=
i,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlig=
ht,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.=
*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*=
', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi=
,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*=
', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retron=
ix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,=
.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.=
*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*=
', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sa=
ncloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schne=
ider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*',=
 '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion=
,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', =
'^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^s=
hiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^=
sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*'=
, '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconf=
ile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^=
sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitr=
onix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^=
smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.=
*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '=
^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalh=
dl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.=
*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^start=
erkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^stor=
opack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^su=
permicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^sy=
nopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.=
*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.=
*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^v=
dl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostron=
g,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse=
,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,=
.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^=
wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*',=
 '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^w=
illsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^=
winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*'=
, '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^x=
icor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '=
^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.=
*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*=
', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,=
.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zi=
nitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi=
-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*=
', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '=
^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', =
'^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,=
.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*=
', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*',=
 '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^br=
cm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*'=
, '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^c=
alaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '=
^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdn=
s,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkp=
oint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^=
chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^c=
iaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*'=
, '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', =
'^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.=
*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*',=
 '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,=
.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cy=
x,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcom=
puting,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devante=
ch,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^di=
gilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dpte=
chnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage=
,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^ec=
kelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*=
', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^el=
ement14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfi=
re,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-e=
lectronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^=
endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '=
^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^e=
ttus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^=
exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^faceboo=
k,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^=
fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.=
*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^four=
semi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^frien=
dlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^game=
force,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.=
*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^g=
enesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*',=
 '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,=
.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*'=
, '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoch=
uangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', =
'^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*',=
 '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynit=
ron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '=
^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*', '^im=
g,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indie=
droid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^=
ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secur=
e,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inv=
ensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*'=
, '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', =
'^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*'=
, '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^j=
oz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '=
^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdispla=
y,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '=
^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*',=
 '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^le=
adtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '=
^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntec=
h,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^linksys,=
.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*=
', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.=
*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,=
.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macni=
ca,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^ma=
xbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^m=
bvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*'=
, '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*',=
 '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '=
^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.=
*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikro=
e,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,=
.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.=
*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*=
', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*'=
, '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*',=
 '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', =
'^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofide=
lity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^ne=
tron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', =
'^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^n=
intendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatec=
h,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboa=
rd,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '=
^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^on=
eplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*=
', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^=
openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '=
^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '=
^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^p=
arallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pe=
rvasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '=
^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower=
,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocket=
book,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '=
^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pr=
i,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlig=
ht,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.=
*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*=
', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi=
,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*=
', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retron=
ix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,=
.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.=
*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*=
', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sa=
ncloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schne=
ider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*',=
 '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion=
,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', =
'^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^s=
hiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^=
sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*'=
, '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconf=
ile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^=
sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitr=
onix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^=
smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.=
*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '=
^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalh=
dl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.=
*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^start=
erkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^stor=
opack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^su=
permicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^sy=
nopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.=
*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.=
*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^v=
dl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostron=
g,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse=
,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,=
.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^=
wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*',=
 '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^w=
illsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^=
winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*'=
, '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^x=
icor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '=
^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.=
*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*=
', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,=
.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zi=
nitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi=
-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*=
', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '=
^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', =
'^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,=
.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*=
', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*',=
 '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^br=
cm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*'=
, '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^c=
alaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '=
^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdn=
s,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkp=
oint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^=
chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^c=
iaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*'=
, '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', =
'^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.=
*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*',=
 '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,=
.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cy=
x,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcom=
puting,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devante=
ch,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^di=
gilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*',=
 '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dpte=
chnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage=
,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^ec=
kelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*=
', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^el=
ement14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfi=
re,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-e=
lectronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^=
endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '=
^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^e=
ttus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^=
exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^faceboo=
k,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^=
fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.=
*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^four=
semi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^frien=
dlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^game=
force,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.=
*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^g=
enesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*',=
 '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,=
.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*'=
, '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoch=
uangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', =
'^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*',=
 '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holt,=
.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun=
,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*'=
, '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynit=
ron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '=
^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*', '^im=
g,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indie=
droid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^=
ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secur=
e,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inv=
ensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*'=
, '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', =
'^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*'=
, '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^j=
oz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '=
^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdispla=
y,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '=
^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*',=
 '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^le=
adtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '=
^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntec=
h,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^linksys,=
.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*=
', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.=
*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,=
.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macni=
ca,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^ma=
xbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^m=
bvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*'=
, '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*',=
 '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '=
^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.=
*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikro=
e,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,=
.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.=
*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*=
', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*'=
, '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*',=
 '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', =
'^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofide=
lity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^ne=
tron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', =
'^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^n=
intendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatec=
h,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboa=
rd,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '=
^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^on=
eplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*=
', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^=
openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '=
^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '=
^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^p=
arallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pe=
rvasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '=
^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower=
,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocket=
book,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '=
^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pr=
i,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlig=
ht,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.=
*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*=
', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi=
,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*=
', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retron=
ix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,=
.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.=
*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*=
', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sa=
ncloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schne=
ider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*',=
 '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion=
,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', =
'^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^s=
hiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^=
sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*'=
, '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconf=
ile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^=
sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitr=
onix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^=
smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.=
*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '=
^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalh=
dl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.=
*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^start=
erkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^stor=
opack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^su=
permicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^sy=
nopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexio=
n,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '=
^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*'=
, '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*',=
 '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo=
,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,=
.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx=
,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*',=
 '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.=
*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.=
*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^v=
dl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostron=
g,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse=
,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,=
.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^=
wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*',=
 '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^w=
illsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^=
winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*'=
, '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^x=
icor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '=
^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.=
*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*=
', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,=
.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zi=
nitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
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
'^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asah=
i-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.=
*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', =
'^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*',=
 '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw=
,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.=
*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*'=
, '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^b=
rcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*=
', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^=
calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', =
'^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cd=
ns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^check=
point,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '=
^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^=
ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*=
', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*',=
 '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,=
.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*'=
, '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera=
,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^c=
yx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepco=
mputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devant=
ech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^d=
igilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*'=
, '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dpt=
echnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimag=
e,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^e=
ckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.=
*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^e=
lement14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedf=
ire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-=
electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '=
^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', =
'^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^=
ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '=
^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebo=
ok,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '=
^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,=
.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^fou=
rsemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^frie=
ndlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gam=
eforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,=
.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^=
genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*'=
, '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll=
,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*=
', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haoc=
huangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*',=
 '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*'=
, '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holt=
,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperu=
n,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*=
', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hyni=
tron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', =
'^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*', '^i=
mg,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indi=
edroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '=
^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secu=
re,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^in=
vensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*=
', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*',=
 '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*=
', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^=
joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', =
'^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdispl=
ay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', =
'^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*'=
, '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^l=
eadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', =
'^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolnte=
ch,.*', '^lineartechnology,.*', '^linkease,.*', '^linksprite,.*', '^linksys=
,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.=
*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,=
.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox=
,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macn=
ica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^m=
axbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^=
mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*=
', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*'=
, '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', =
'^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,=
.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikr=
oe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix=
,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,=
.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.=
*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*=
', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*'=
, '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*',=
 '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofid=
elity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^n=
etron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*',=
 '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^=
nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novate=
ch,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsbo=
ard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', =
'^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^o=
neplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.=
*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '=
^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', =
'^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', =
'^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^=
parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^p=
ervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', =
'^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantowe=
r,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocke=
tbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', =
'^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^p=
ri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedli=
ght,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,=
.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.=
*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberryp=
i,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.=
*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retro=
nix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh=
,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,=
.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.=
*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^s=
ancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schn=
eider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*'=
, '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirio=
n,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*',=
 '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^=
shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '=
^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*=
', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^silicon=
file,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '=
^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sit=
ronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '=
^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,=
.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', =
'^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinal=
hdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,=
.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^star=
terkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^sto=
ropack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^s=
upermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^s=
ynopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,=
.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexi=
on,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^=
teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', =
'^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*=
', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,=
.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*'=
, '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tp=
o,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyh=
x,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*'=
, '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,=
.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,=
.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^=
vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostro=
ng,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitess=
e,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield=
,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '=
^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*'=
, '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^=
willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '=
^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*=
', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^=
xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', =
'^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,=
.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.=
*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd=
,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^z=
initix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
