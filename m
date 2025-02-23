Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E1D1D86F6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740306490; cv=none; b=pN/jd5nvckaIz9+oY7z9n3+9LDLTYELSCuY8ibdfnCfv++l+YP3ZLWsdJ9nfu5ZYkmzNFXpqe2Ejc0zWfE43DyDfUvHcNXQwg/z9+Neil+qKC86OMOKNCkLHv40Bwc9rQEPEr0sm9F4uFxkFe0UbAzhYNtExAZTVfp8o8/PfJoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740306490; c=relaxed/simple;
	bh=KXG8oCAesgtd8gLgJcvS9m45FvDVpHHG12RMsIl3O7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ot9Zt/+XJdIL+Vaqq1F/uPU9EK4faMj8TIZbRGu9lvvHRj+6S10AGjfc3NohvzLLCDQsMsX0QfaTXPhv5Z6kMPTHF+PhAQ5IsR/TN5GYgNi1nfdjViLKZ4H7tHlJcdA/cJ9LWdnNvO1E310/WaSXPgUyIdnKy/uDrGZD8rXwRkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIy8L7h3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIy8L7h3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740306487; x=1771842487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KXG8oCAesgtd8gLgJcvS9m45FvDVpHHG12RMsIl3O7U=;
  b=TIy8L7h35zT0T6y7KfJl0hxNA9Drb3h9IPsgm5/SVNrtuTrBkAcXqjA5
   VYodaw5wjrngF6VTEEIi9xZfLRTV3UD/ggP/PLBu6HaRrFk25q9AJgxzU
   shpuQbXdN7lhp+e8xjH5JuT0UikjS206BJVV6GBMMGRyTz6CZk3gdWL2V
   fbQ+odQuiEDSHhL+pXsPw68gdyE+3eL/XzYEtR5nZofnF9/QfLVBoK2Ur
   8bkqEv0korsKVWcin5Rj8OURnyV5pbG/gOFgGvC5oXApczQkwnOGGIRi2
   y4H3ZJ85tsVq1SsQpB35UAsfLu0uSMZBb8l8BFM2oe6ln0J9tG3Qb56jf
   A==;
X-CSE-ConnectionGUID: WaJr6zRzSLupXMkJjXXh3Q==
X-CSE-MsgGUID: 3FEeYd8JRC+7ipyOhp+Lbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="52476071"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="52476071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 02:28:06 -0800
X-CSE-ConnectionGUID: ZtiZjHMNTmygUJlKLHEQsQ==
X-CSE-MsgGUID: TRonzt1rT3aJH5wi1RQ8oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146697393"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2025 02:28:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm9DO-0007Gd-0X;
	Sun, 23 Feb 2025 10:28:02 +0000
Date: Sun, 23 Feb 2025 18:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 1/1]
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupts: [[0,
 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
Message-ID: <202502231830.iSk6iYYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   100e5d54ced2ed22d23bb58d456bdf23c2f57ba7
commit: 585081791387d001b61146028408a9de7ccd48fe [1/1] arm64: dts: qcom: ms=
m8996: Fix up USB3 interrupts
config: arm64-randconfig-052-20250220 (https://download.01.org/0day-ci/arch=
ive/20250223/202502231830.iSk6iYYc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250223/202502231830.iSk6iYYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231830.iSk6iYYc-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: mpps@a000: mpp2-userled4-st=
ate: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'qcom,dtest' do not match any of the =
regexes: '-pins$', 'pinctrl-[0-9]+'
   	[4] is not of type 'integer'
   	[4] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.ya=
ml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000: '#phy-cells' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000: '#address-cells=
', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not matc=
h any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupts: [[=
0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupt-name=
s:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupt-name=
s:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupt-name=
s: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: 'extcon' does =
not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@76f8800: interrupt-name=
s: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@76f8800: 'extcon' does =
not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: syscon@9a10000: compatible:=
 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
--
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: opp-table-cluster1: opp-21=
50400000: 'opp-peak-kBps' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: opp-table-cluster1: opp-21=
50400000:opp-supported-hw: [[1]] is not one of [1, 2, 3, 4, 5, 6, 7, 9, 13,=
 14, 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: /etm: failed to match any =
schema with compatible: ['qcom,coresight-remote-etm']
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: phy@627000: '#phy-cells' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: phy@627000: '#address-cell=
s', '#size-cells', 'phy@627400', 'ranges' do not match any of the regexes: =
'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupts: [=
[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-nam=
es:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-nam=
es:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-nam=
es: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@76f8800: interrupt-nam=
es: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: syscon@9a10000: compatible=
: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: opp-table-cluster1: opp-207360=
0000:opp-supported-hw: [[1]] is not one of [1, 2, 3, 4, 5, 6, 7, 9, 13, 14,=
 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: opp-table-cluster1: opp-215040=
0000: 'opp-peak-kBps' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: opp-table-cluster1: opp-215040=
0000:opp-supported-hw: [[1]] is not one of [1, 2, 3, 4, 5, 6, 7, 9, 13, 14,=
 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: /etm: failed to match any sche=
ma with compatible: ['qcom,coresight-remote-etm']
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: phy@627000: '#address-cells', =
'#size-cells', 'phy@627400', 'ranges' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupts: [[0, =
180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names:0=
: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names:1=
: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names: =
['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@76f8800: interrupt-names: =
['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: syscon@9a10000: compatible: 'a=
nyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: opp-table-cluster1: opp-2=
150400000:opp-supported-hw: [[1]] is not one of [1, 2, 3, 4, 5, 6, 7, 9, 13=
, 14, 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: /etm: failed to match any=
 schema with compatible: ['qcom,coresight-remote-etm']
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: phy@627000: '#phy-cells' =
is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: phy@627000: '#address-cel=
ls', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not ma=
tch any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@1c00000: 'px-s=
upply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupts: =
[[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-na=
mes:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-na=
mes:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-na=
mes: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@76f8800: interrupt-na=
mes: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: syscon@9a10000: compatibl=
e: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: /sound: failed to match a=
ny schema with compatible: ['qcom,apq8096-sndcard']
--
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: opp-table-cluster1: opp-=
2150400000:opp-supported-hw: [[1]] is not one of [1, 2, 3, 4, 5, 6, 7, 9, 1=
3, 14, 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: /etm: failed to match an=
y schema with compatible: ['qcom,coresight-remote-etm']
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: phy@627000: '#phy-cells'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: phy@627000: '#address-ce=
lls', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not m=
atch any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@1c00000: 'px-=
supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupts:=
 [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-n=
ames:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-n=
ames:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-n=
ames: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@76f8800: interrupt-n=
ames: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: syscon@9a10000: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: /sound: failed to match =
any schema with compatible: ['qcom,apq8096-sndcard']
--
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: opp-table-cl=
uster1: opp-2150400000:opp-supported-hw: [[1]] is not one of [1, 2, 3, 4, 5=
, 6, 7, 9, 13, 14, 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: /etm: failed=
 to match any schema with compatible: ['qcom,coresight-remote-etm']
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: pmic@3: wled=
@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: wled@d800: '=
label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: phy@627000: =
'#address-cells', '#size-cells', 'phy@627400', 'ranges' do not match any of=
 the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800:=
 interrupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too lo=
ng
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800:=
 interrupt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800:=
 interrupt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800:=
 interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is=
 too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@76f8800:=
 interrupt-names: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: syscon@9a100=
00: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: /usb3-id: fa=
iled to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: opp-table-=
cluster1: opp-2150400000:opp-supported-hw: [[1]] is not one of [1, 2, 3, 4,=
 5, 6, 7, 9, 13, 14, 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: /etm: fail=
ed to match any schema with compatible: ['qcom,coresight-remote-etm']
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: pmic@3: wl=
ed@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: wled@d800:=
 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: phy@627000=
: '#address-cells', '#size-cells', 'phy@627400', 'ranges' do not match any =
of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af880=
0: interrupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too =
long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af880=
0: interrupt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af880=
0: interrupt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af880=
0: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] =
is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@76f880=
0: interrupt-names: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: syscon@9a1=
0000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: /usb3-id: =
failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: opp-table-=
cluster1: opp-2150400000:opp-supported-hw: [[1]] is not one of [1, 2, 3, 4,=
 5, 6, 7, 9, 13, 14, 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: /etm: fail=
ed to match any schema with compatible: ['qcom,coresight-remote-etm']
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: pmic@3: wl=
ed@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: wled@d800:=
 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: phy@627000=
: '#address-cells', '#size-cells', 'phy@627400', 'ranges' do not match any =
of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af880=
0: interrupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too =
long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af880=
0: interrupt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af880=
0: interrupt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af880=
0: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] =
is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@76f880=
0: interrupt-names: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: syscon@9a1=
0000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: /usb3-id: =
failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: panel@0: 'power-supp=
ly' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simp=
le-dsi.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: pmic@3: wled@d800: '=
label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800: 'label' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@627000: '#phy-ce=
lls' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@627000: '#addres=
s-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do n=
ot match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interru=
pts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interru=
pt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interru=
pt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interru=
pt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: 'extcon=
' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@7411000: 'vdd-su=
pply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: drv2604@5a: 'enable-=
gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,drv260x.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@76f8800: interru=
pt-names: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: syscon@9a10000: comp=
atible: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: panel@0: 'power-=
supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simp=
le-dsi.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: pmic@3: wled@d80=
0: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800: 'labe=
l' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@627000: '#ph=
y-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@627000: '#ad=
dress-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' =
do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: int=
errupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: int=
errupt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: int=
errupt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: int=
errupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too=
 long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: 'ex=
tcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@7411000: 'vd=
d-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@76f8800: int=
errupt-names: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: syscon@9a10000: =
compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
--
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: opp-table-cluste=
r1: opp-2342400000: 'opp-peak-kBps' does not match any of the regexes: 'pin=
ctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: opp-table-cluste=
r1: opp-2342400000:opp-supported-hw: [[16]] is not one of [1, 2, 3, 4, 5, 6=
, 7, 9, 13, 14, 15, 16, 32, 48, 112]
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-kryo-cpu.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: /etm: failed to =
match any schema with compatible: ['qcom,coresight-remote-etm']
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@627000: '#ph=
y-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@627000: '#ad=
dress-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' =
do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: int=
errupts: [[0, 180, 4], [0, 347, 4], [0, 133, 4], [0, 243, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: int=
errupt-names:0: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: int=
errupt-names:1: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: int=
errupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too=
 long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: 'ex=
tcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@7411000: 'vd=
d-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@76f8800: int=
errupt-names: ['hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: syscon@9a10000: =
compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
