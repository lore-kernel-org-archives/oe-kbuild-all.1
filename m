Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C74501F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717943957; cv=none; b=RYfexHYlQPifx+0i8ODTP5XCzuIEU/YHp5se80wLHttVijFGyB1QBFvz4+3rRTDPVqZnIVZjy+jUkBYLNm+ghzyUTYmmACOrhN5sw5HU2W/n5+jO1mOrdhaKIBpDkgCkOCamsoG4IfArIhVRriNBLv2oHVecLD/z1BiC6PQD5Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717943957; c=relaxed/simple;
	bh=7M40zx2vrnccz3uiIYWTUOBvmJr/9BGEcmzCAVm9EU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dkHZq4zCCHND6k534TtIJR9T4nddGN1FPSSBxTMqfS5Wm9qKfRvtt6TwuQGEIWARsbnUfcl+cYQ8b61/V5bY1WYRClPwItT3ZoOSbcSYD+nRPVSKRcK8TmnA4rrEowxkxYeJ9whusVOfrrk5+o7JTWZrN8pRvQwsaic07lY8ICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ne+g0Z7K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ne+g0Z7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717943955; x=1749479955;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7M40zx2vrnccz3uiIYWTUOBvmJr/9BGEcmzCAVm9EU4=;
  b=Ne+g0Z7KMh5NgTqcMIm8qkUr1npVDLJUJ260lHk+/wV7XE63aQ2PT+Po
   Vrg79UVJo024tl9Px42VivqrpPKBYGRJu2zIkcm0s3AEzZyZJFTrVPb4+
   S1y8A2TgPo/JV3PCSvC3gwiRPffihFKNrxByMfFBLs2M8r4AxA6S9pAf9
   qCwtZO/g9E75Py5w1ZGBJWXurPKlLy9eLITt2e8BNUH1isnRp1InWwgOP
   w/6ki2DwsBmvlvYpaZ+2+589etS6gHkNjY7eqUMsgFtB2/n29UAA3olLr
   1k1l4bJsQCEQXv6MLaM7+zmt7eI9ekmC4MBTStpyVtvj/zFXzu671Bycp
   A==;
X-CSE-ConnectionGUID: IerQbI9VQtWYZ7UVjlE/iQ==
X-CSE-MsgGUID: aIlsVMhVT7OBJX2/VqSu/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14766126"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="14766126"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 07:39:14 -0700
X-CSE-ConnectionGUID: Mg3kIng4RmGBHH0CBDEnBA==
X-CSE-MsgGUID: ekDedzP6S02HqppjwY77gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="43944147"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2024 07:39:13 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGJhO-0001Im-2Z;
	Sun, 09 Jun 2024 14:39:10 +0000
Date: Sun, 9 Jun 2024 22:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.10-rc2-esp32 42/46] dtbs_check:
 arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (unit_address_vs_reg):
 /soc/syscon@3ff48000: node has a unit name, but no reg or ranges property
Message-ID: <202406092223.Z6QM1THY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.10-rc2-esp32
head:   abd44c5784518efb46e1601d9b04cb5a63506944
commit: 63f4bcf3c56896be3a5f53b3592f934f0d9cca77 [42/46] xtensa: esp32: add=
 platform
compiler: xtensa-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240609/202406092223.Z6QM1THY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092223.Z6QM1THY-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (unit_address_vs_r=
eg): /soc/syscon@3ff48000: node has a unit name, but no reg or ranges prope=
rty
>> arch/xtensa/boot/dts/esp32.dtsi:40.19-44.5: Warning (simple_bus_reg): /c=
locks/clk80m: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:45.23-49.5: Warning (simple_bus_reg): /c=
locks/clk8m5: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:50.21-54.5: Warning (simple_bus_reg): /c=
locks/clk128m: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:56.24-61.5: Warning (simple_bus_reg): /c=
locks/uart0_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:62.24-67.5: Warning (simple_bus_reg): /c=
locks/uart1_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:68.24-73.5: Warning (simple_bus_reg): /c=
locks/uart2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:74.22-79.5: Warning (simple_bus_reg): /c=
locks/spi2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:80.22-85.5: Warning (simple_bus_reg): /c=
locks/spi3_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (simple_bus_reg): =
/soc/syscon@3ff48000: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:191.27-198.5: Warning (simple_bus_reg): =
/soc/pinctrl@3ff49000: simple-bus unit address format error, expected "3ff4=
9004"
>> arch/xtensa/boot/dts/esp32.dtsi:200.26-208.5: Warning (simple_bus_reg): =
/soc/serial@3ff50000: simple-bus unit address format error, expected "3ff40=
000"
>> arch/xtensa/boot/dts/esp32.dtsi:210.22-220.5: Warning (simple_bus_reg): =
/soc/spi@3ff64000: simple-bus unit address format error, expected "60024000"
>> arch/xtensa/boot/dts/esp32.dtsi:222.22-232.5: Warning (simple_bus_reg): =
/soc/spi@3ff65000: simple-bus unit address format error, expected "60025000"
>> arch/xtensa/boot/dts/esp32.dtsi:234.26-242.5: Warning (simple_bus_reg): =
/soc/serial@3ff6e000: simple-bus unit address format error, expected "3ff40=
000"
>> arch/xtensa/boot/dts/esp32.dtsi:35.9-86.4: Warning (avoid_unnecessary_ad=
dr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges" =
or child "reg" property
>> arch/xtensa/boot/dts/esp32.dtsi:167.21-170.5: Warning (unique_unit_addre=
ss_if_enabled): /soc/lpm@3ff48000: duplicate unit-address (also used in nod=
e /soc/syscon@3ff48000)
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /: 'model' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /: failed to match any schema=
 with compatible: ['esp32']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: cpus: cpu@0: 'cache-level' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /cpus/cpu@0: failed to match =
any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: $nodename:0: 'clocks'=
 does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)=
?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: #size-cells:0:0: 0 is=
 not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: spi2_clk: 'ranges' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: uart2_clk: 'ranges' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: uart1_clk: 'ranges' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: clk128m: 'ranges' is =
a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: uart0_clk: 'ranges' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: spi3_clk: 'ranges' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: clk80m: 'ranges' is a=
 required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: clk8m5: 'ranges' is a=
 required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: 'ranges' is a require=
d property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /pic: failed to match any sch=
ema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: soc: syscon@3ff48000: 'anyOf'=
 conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clk_gpio@3ff000c0: 'gpio-cont=
roller' is a dependency of '#gpio-cells'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/clk_gpio@3ff000c0: faile=
d to match any schema with compatible: ['esp,esp32-clk-gpio']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/reset@3ff000c4: failed t=
o match any schema with compatible: ['esp,esp32-reset']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/intc@3ff00104: failed to=
 match any schema with compatible: ['esp,esp32-intc']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: serial@3ff40000: 'reset-names=
', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.ya=
ml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: serial@3ff40000: status: 'one=
Of' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: gpio@3ff44000: status: 'oneOf=
' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: gpio@3ff44000: 'gpio-controll=
er' is a dependency of '#gpio-cells'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/gpio@3ff44000: failed to=
 match any schema with compatible: ['esp,esp32-gpio']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: gpio_in_mux@3ff44130: $nodena=
me:0: 'gpio_in_mux@3ff44130' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?=
$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: gpio_out_mux@3ff44530: $noden=
ame:0: 'gpio_out_mux@3ff44530' does not match '^(pinctrl|pinmux)(@[0-9a-f]+=
)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: lpm@3ff48000: compatible: 'an=
yOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/clk@3ff48070: failed to =
match any schema with compatible: ['esp,esp32-core-clock']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: pinctrl@3ff49000: 'i2c0_pins'=
, 'uart0_pins' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', '=
pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: pinctrl@3ff49000: status: 'on=
eOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: serial@3ff50000: 'reset-names=
', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.ya=
ml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/spi@3ff64000: failed to =
match any schema with compatible: ['esp,esp32-spi']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/spi@3ff65000: failed to =
match any schema with compatible: ['esp,esp32-spi']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: serial@3ff6e000: 'reset-names=
', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.ya=
ml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/trng@3ff75144: failed to=
 match any schema with compatible: ['esp,esp32-trng']
--
>> arch/xtensa/boot/dts/esp32s3.dtsi:143.19-149.5: Warning (unit_address_vs=
_reg): /soc/syscon@60008000: node has a unit name, but no reg or ranges pro=
perty
>> arch/xtensa/boot/dts/esp32s3.dtsi:36.24-41.5: Warning (simple_bus_reg): =
/clocks/uart0_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:42.24-47.5: Warning (simple_bus_reg): =
/clocks/uart1_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:48.24-53.5: Warning (simple_bus_reg): =
/clocks/uart2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:55.22-60.5: Warning (simple_bus_reg): =
/clocks/spi2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:61.22-66.5: Warning (simple_bus_reg): =
/clocks/spi3_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:143.19-149.5: Warning (simple_bus_reg)=
: /soc/syscon@60008000: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:151.27-158.5: Warning (simple_bus_reg)=
: /soc/pinctrl@60009000: simple-bus unit address format error, expected "60=
009004"
>> arch/xtensa/boot/dts/esp32s3.dtsi:260.23-270.5: Warning (simple_bus_reg)=
: /soc/intc@600c2000: simple-bus unit address format error, expected "600c2=
800"
>> arch/xtensa/boot/dts/esp32s3.dtsi:31.9-67.4: Warning (avoid_unnecessary_=
addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges=
" or child "reg" property
>> arch/xtensa/boot/dts/esp32s3.dtsi:86.18-98.5: Warning (avoid_unnecessary=
_addr_size): /soc/flash@42000000: unnecessary #address-cells/#size-cells wi=
thout "ranges" or child "reg" property
>> arch/xtensa/boot/dts/esp32s3.dtsi:138.21-141.5: Warning (unique_unit_add=
ress_if_enabled): /soc/lpm@60008000: duplicate unit-address (also used in n=
ode /soc/syscon@60008000)
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /: 'model' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /: failed to match any schem=
a with compatible: ['esp32s3']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: cpus: cpu@0: 'cache-level' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /cpus/cpu@0: failed to match=
 any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: $nodename:0: 'clocks=
' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+=
)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: #size-cells:0:0: 0 i=
s not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: uart1_clk: 'ranges' =
is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: uart0_clk: 'ranges' =
is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: spi2_clk: 'ranges' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: spi3_clk: 'ranges' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: uart2_clk: 'ranges' =
is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: 'ranges' is a requir=
ed property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /pic: failed to match any sc=
hema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: soc: syscon@60008000: 'anyOf=
' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: flash@42000000: partitions: =
'oneOf' conditional failed, one must be fixed:
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	'fis-index-block' is a required property
   	'partitions-table-offset' is a required property
>> 	arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: flash@42000000: partitions:=
compatible: 'oneOf' conditional failed, one must be fixed:
   		['esp,esp32-partition-table'] is too short
   		'fixed-partitions' was expected
   		'sercomm,sc-partitions' was expected
   	'arm,arm-firmware-suite' was expected
   	'brcm,bcm4908-partitions' was expected
   	'brcm,bcm947xx-cfe-partitions' was expected
   	'linksys,ns-partitions' was expected
   	'qcom,smem-part' was expected
   	'redboot-fis' was expected
   	'tplink,safeloader-partitions' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/flash@42000000/partitio=
ns: failed to match any schema with compatible: ['esp,esp32-partition-table=
']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@60000000: 'reset-name=
s', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.ya=
ml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@60000000: status: 'on=
eOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio@60004000: status: 'oneO=
f' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio@60004000: 'gpio-control=
ler' is a dependency of '#gpio-cells'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/gpio@60004000: failed t=
o match any schema with compatible: ['esp,esp32s3-gpio']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_in_mux@60004154: $noden=
ame:0: 'gpio_in_mux@60004154' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)=
?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_out_mux@60004554: $node=
name:0: 'gpio_out_mux@60004554' does not match '^(pinctrl|pinmux)(@[0-9a-f]=
+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: lpm@60008000: compatible: 'a=
nyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: pinctrl@60009000: 'i2c0_pins=
', 'spi2_pins', 'uart0_pins' do not match any of the regexes: '-pins(-[0-9]=
+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: pinctrl@60009000: status: 'o=
neOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@60010000: 'reset-name=
s', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.ya=
ml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: spi@60024000: status: 'oneOf=
' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/spi@60024000: failed to=
 match any schema with compatible: ['esp,esp32s3-spi']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: mmc_spi@0: $nodename:0: 'mmc=
_spi@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: mmc_spi@0: 'spi-max-frequenc=
y' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/spi@60025000: failed to=
 match any schema with compatible: ['esp,esp32s3-spi']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@6002e000: 'reset-name=
s', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.ya=
ml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/trng@6003507c: failed t=
o match any schema with compatible: ['esp,esp32-trng']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: acm@60038000: $nodename:0: '=
acm@60038000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-acm.yam=
l#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: acm@60038000: 'reset-names',=
 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-acm.yam=
l#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: acm@60038000: status: 'oneOf=
' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004: failed to=
 match any schema with compatible: ['esp,esp32-ipc']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004/flash@2: f=
ailed to match any schema with compatible: ['esp,esp32-ipc-flash']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004/wifi@1: fa=
iled to match any schema with compatible: ['esp,esp32-wifi-shmem']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk@600c0010: failed to=
 match any schema with compatible: ['esp,esp32s3-core-clock']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clk_gpio@600c0018: 'gpio-con=
troller' is a dependency of '#gpio-cells'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk_gpio@600c0018: fail=
ed to match any schema with compatible: ['esp,esp32-clk-gpio']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clk_gpio@600c001c: 'gpio-con=
troller' is a dependency of '#gpio-cells'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk_gpio@600c001c: fail=
ed to match any schema with compatible: ['esp,esp32-clk-gpio']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/reset@600c0020: failed =
to match any schema with compatible: ['esp,esp32-reset']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/intc@600c2000: failed t=
o match any schema with compatible: ['esp,esp32-intc']

vim +172 arch/xtensa/boot/dts/esp32.dtsi

     3=09
     4	/ {
     5		compatible =3D "esp32";
     6		#address-cells =3D <1>;
     7		#size-cells =3D <1>;
     8		interrupt-parent =3D <&pic>;
     9=09
    10		chosen {
    11			bootargs =3D "earlycon=3Desp32uart,mmio32,0x3ff40000,115200n8 cons=
ole=3DttyS0,115200n8 debug rw root=3Dmtd:rootfs no_hash_pointers ";
    12		};
    13=09
    14		aliases {
    15			serial0 =3D "/soc/serial@3ff40000";
    16			serial1 =3D "/soc/serial@3ff50000";
    17			serial2 =3D "/soc/serial@3ff6e000";
    18		};
    19=09
    20		memory@0 {
    21			device_type =3D "memory";
    22			reg =3D <0x3f800000 0x00400000>;
    23		};
    24=09
    25		cpus {
    26			#address-cells =3D <1>;
    27			#size-cells =3D <0>;
    28			cpu@0 {
    29				compatible =3D "cdns,xtensa-cpu";
    30				reg =3D <0>;
    31				clocks =3D <&clk 0>;
    32			};
    33		};
    34=09
  > 35		clocks {
    36			compatible =3D "simple-bus";
    37			#address-cells =3D <1>;
    38			#size-cells =3D <0>;
    39=09
  > 40			xtl_clk: clk80m {
    41				#clock-cells =3D <0>;
    42				compatible =3D "fixed-clock";
    43				clock-frequency =3D <80000000>;
    44			};
  > 45			rc_fast_clk: clk8m5 {
    46				#clock-cells =3D <0>;
    47				compatible =3D "fixed-clock";
    48				clock-frequency =3D <8500000>;
    49			};
  > 50			apll_clk: clk128m {
    51				#clock-cells =3D <0>;
    52				compatible =3D "fixed-clock";
    53				clock-frequency =3D <128000000>;
    54			};
    55=09
  > 56			uart0_clk: uart0_clk {
    57				#clock-cells =3D <0>;
    58				compatible =3D "gpio-gate-clock";
    59				clocks =3D <&clk 1>;
    60				enable-gpios =3D <&clk_gpio0 2 0>;
    61			};
  > 62			uart1_clk: uart1_clk {
    63				#clock-cells =3D <0>;
    64				compatible =3D "gpio-gate-clock";
    65				clocks =3D <&clk 1>;
    66				enable-gpios =3D <&clk_gpio0 5 0>;
    67			};
  > 68			uart2_clk: uart2_clk {
    69				#clock-cells =3D <0>;
    70				compatible =3D "gpio-gate-clock";
    71				clocks =3D <&clk 1>;
    72				enable-gpios =3D <&clk_gpio0 23 0>;
    73			};
  > 74			spi2_clk: spi2_clk {
    75				#clock-cells =3D <0>;
    76				compatible =3D "gpio-gate-clock";
    77				clocks =3D <&clk 1>;
    78				enable-gpios =3D <&clk_gpio0 6 0>;
    79			};
  > 80			spi3_clk: spi3_clk {
    81				#clock-cells =3D <0>;
    82				compatible =3D "gpio-gate-clock";
    83				clocks =3D <&clk 1>;
    84				enable-gpios =3D <&clk_gpio0 16 0>;
    85			};
    86		};
    87=09
    88		pic: pic {
    89			compatible =3D "cdns,xtensa-pic";
    90			/* one cell: internal irq number,
    91			 * two cells: second cell =3D=3D 0: internal irq number
    92			 *            second cell =3D=3D 1: external irq number
    93			 */
    94			#interrupt-cells =3D <2>;
    95			interrupt-controller;
    96		};
    97=09
    98		soc {
    99			#address-cells =3D <1>;
   100			#size-cells =3D <1>;
   101			compatible =3D "simple-bus";
   102			interrupt-parent =3D <&intc>;
   103			ranges;
   104=09
   105			clk_gpio0: clk_gpio@3ff000c0 {
   106				#gpio-cells =3D <2>;
   107				compatible =3D "esp,esp32-clk-gpio";
   108				reg =3D <0x3ff000c0 4>;
   109				reg-names =3D "dat";
   110			};
   111=09
   112			reset: reset@3ff000c4 {
   113				#reset-cells =3D <1>;
   114				compatible =3D "esp,esp32-reset";
   115				reg =3D <0x3ff000c4 4>;
   116			};
   117=09
   118			intc: intc@3ff00104 {
   119				compatible =3D "esp,esp32-intc";
   120				reg =3D <0x3ff00104 0x114>;
   121				/* first cell: interrupt matrix row
   122				 * second cell: internal xtensa core IRQ number to connect to
   123				 */
   124				#interrupt-cells =3D <2>;
   125				interrupt-controller;
   126				interrupt-parent =3D <&pic>;
   127			};
   128=09
   129			uart0: serial@3ff40000 {
   130				compatible =3D "esp,esp32-uart";
   131				reg =3D <0x3ff40000 0x80>;
   132				interrupts =3D <34 1>; /* UART0, external IRQ1 */
   133				clocks =3D <&uart0_clk>;
   134				resets =3D <&reset 2>;
   135				reset-names =3D "reset";
   136				status =3D "disabled";
   137			};
   138=09
   139			gpio0: gpio@3ff44000 {
   140				#gpio-cells =3D <2>;
   141				compatible =3D "esp,esp32-gpio";
   142				reg =3D <0x3ff44000 0x128>;
   143				interrupts =3D <22 8>; /* GPIO, external IRQ8 */
   144				interrupt-controller;
   145				#interrupt-cells =3D <2>;
   146				status =3D "disabled";
   147			};
   148=09
   149			gpio_in_mux: gpio_in_mux@3ff44130 {
   150				compatible =3D "pinctrl-single";
   151				reg =3D <0x3ff44130 0x400>;
   152				#pinctrl-cells =3D <1>;
   153				pinctrl-single,register-width =3D <32>;
   154				pinctrl-single,function-mask =3D <0xff>;
   155				status =3D "disabled";
   156			};
   157=09
   158			gpio_out_mux: gpio_out_mux@3ff44530 {
   159				compatible =3D "pinctrl-single";
   160				reg =3D <0x3ff44530 0xa0>;
   161				#pinctrl-cells =3D <1>;
   162				pinctrl-single,register-width =3D <32>;
   163				pinctrl-single,function-mask =3D <0xfff>;
   164				status =3D "disabled";
   165			};
   166=09
 > 167			lpm: lpm@3ff48000 {
   168				compatible =3D "syscon";
   169				reg =3D <0x3ff48000 0x1000>;
   170			};
   171=09
 > 172			syscon@3ff48000 {
   173				compatible =3D "syscon-reboot";
   174				regmap =3D <&lpm>;
   175				offset =3D <0>;
   176				value =3D <0x80000000>;
   177				mask =3D <0x80000000>;
   178			};
   179=09
   180			clk: clk@3ff48070 {
   181				compatible =3D "esp,esp32-core-clock";
   182				reg =3D <0x3ff48070 4
   183				       0x3ff0003c 4
   184				       0x3ff66000 4>;
   185				clocks =3D <&xtl_clk>, <&rc_fast_clk>, <&apll_clk>;
   186				clock-names =3D "xtl", "rc_fast", "apll";
   187				#clock-cells =3D <1>;
   188				/* clock-output-names =3D "cpu_clk", "apb_clk"; */
   189			};
   190=09
 > 191			iomux: pinctrl@3ff49000 {
   192				compatible =3D "pinctrl-single";
   193				reg =3D <0x3ff49004 0x90>;
   194				#pinctrl-cells =3D <1>;
   195				pinctrl-single,register-width =3D <32>;
   196				pinctrl-single,function-mask =3D <0xffff>;
   197				status =3D "disabled";
   198			};
   199=09
 > 200			uart1: serial@3ff50000 {
   201				compatible =3D "esp,esp32-uart";
   202				reg =3D <0x3ff40000 0x80>;
   203				interrupts =3D <35 2>; /* UART1, external IRQ2 */
   204				clocks =3D <&uart1_clk>;
   205				resets =3D <&reset 5>;
   206				reset-names =3D "reset";
   207				status =3D "disabled";
   208			};
   209=09
 > 210			spi2: spi@3ff64000 {
   211				#address-cells =3D <1>;
   212				#size-cells =3D <0>;
   213				compatible =3D "esp,esp32-spi";
   214				reg =3D <0x60024000 0x100>;
   215				interrupts =3D <30 4>; /* SPI2, external IRQ4 */
   216				clocks =3D <&spi2_clk>;
   217				resets =3D <&reset 6>;
   218				reset-names =3D "reset";
   219				status =3D "disabled";
   220			};
   221=09
 > 222			spi3: spi@3ff65000 {
   223				#address-cells =3D <1>;
   224				#size-cells =3D <0>;
   225				compatible =3D "esp,esp32-spi";
   226				reg =3D <0x60025000 0x100>;
   227				interrupts =3D <31 5>; /* SPI3, external IRQ5 */
   228				clocks =3D <&spi3_clk>;
   229				resets =3D <&reset 16>;
   230				reset-names =3D "reset";
   231				status =3D "disabled";
   232			};
   233=09
 > 234			uart2: serial@3ff6e000 {

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
