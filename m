Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E12A22259A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752782376; cv=none; b=oy/H1dn0O0bpPOuw2vK0AfaR/NYNYM1E+u9jV/PstUP1HUGiFUvrJcqaWu0AuIS5pB0XDHao9maeR/qcBCqRylS1sJaVndUfyfrzRytqh1RTeg2ROOklvUA70w0DFrdvE8ElG6pfXwjQC6TrT5pP1p1KiFgcyJ3L+PMf18tQuI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752782376; c=relaxed/simple;
	bh=k5ZYdlLd0C5rzECWBHhGShq8n8CbZoqNtpYtnz1DU+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mH313U4gZ/5NULLla7Npi3bt7AU3hm6GTuri+tovIOohrRvU1faH3pnSrz31C9DtfPB8VtE1wwSlB/IKMdne9wg7I33Kb05Es57suWvaYDnUvrEGr+EVahPvDZ1fTcJ+WpMhVJ6Q895G4foe/wJhkB2Mxlg81K+iB6J9D/22jZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFgS8bhD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFgS8bhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752782369; x=1784318369;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k5ZYdlLd0C5rzECWBHhGShq8n8CbZoqNtpYtnz1DU+w=;
  b=YFgS8bhDcjrtr6uuHYTiVaMmPf1G7DBcnAccynj2i6YKkPa8w2nfwBI+
   DbTXmmFD7k2z9BpXwA7w2XzBfZRK8n78w3ZGlwLcmFGcGZdl5rUcjeLvY
   WYFqAEGguxh3BGcsdog84TSw1qkyrmh2KsY2P8jqv+Z9HoyCHcmEMM+Nk
   JrFcm8wew83haM7ezqykrGUPOmwxukdXEJabzlDLYpyfz6TSpe4RtXdHo
   WsLBv3j/xRLnWHT8exja9GYPn7lfurve7xKvh/dsDNTKT3xNqA4OM7SLT
   tovcrbMRZUtBIsurEr86HdmS93VGH0L5g9VhmJcjROgd48Haz17W4+ZMF
   g==;
X-CSE-ConnectionGUID: JOiEvwAsQayuim2YYds54Q==
X-CSE-MsgGUID: RK1hToNZSTuZ5rvgXR0oFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65644553"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="65644553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 12:59:28 -0700
X-CSE-ConnectionGUID: Ftzb55OuQ8eSSmMfMByj9Q==
X-CSE-MsgGUID: WU7vKFHQRamMSpLwpwYkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="188835818"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jul 2025 12:59:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucUlI-000DzN-07;
	Thu, 17 Jul 2025 19:59:24 +0000
Date: Fri, 18 Jul 2025 03:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 36/36]
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000
 (qcom,msm8996-qmp-ufs-phy): 'power-domains' is a required property
Message-ID: <202507180317.W3a5h3Ff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   b64c8a8cf865a837d7b16f8d32f56de627f77976
commit: dc5cb63592bd8c1de1fc6647ac7da44deacc9e4c [36/36] dt-bindings: phy: =
migrate QMP UFS PHY bindings to qcom,sc8280xp-qmp-ufs-phy.yaml
config: arm64-randconfig-051-20250702 (https://download.01.org/0day-ci/arch=
ive/20250718/202507180317.W3a5h3Ff-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 3de=
ed4211a46632a25b1b558b357273a5ce4ee96)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250718/202507180317.W3a5h3Ff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180317.W3a5h3Ff-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: pmic@3 (qcom,pmi8994): wled=
@d800:interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: wled@d800 (qcom,pmi8994-wle=
d): interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: wled@d800 (qcom,pmi8994-wle=
d): interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: wled@d800 (qcom,pmi8994-wle=
d): interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000 (qcom,msm8996-qm=
p-ufs-phy): '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-=
ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000 (qcom,msm8996-qm=
p-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000 (qcom,msm8996-qm=
p-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: remoteproc@2080000 (qcom,ms=
m8996-mss-pil): clocks: [[30, 222], [30, 223], [30, 157], [20], [30, 229], =
[30, 224], [30, 225], [4, 2], [4, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-=
mss-pil.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: funnel@3023000 (arm,coresig=
ht-dynamic-funnel): 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynami=
c-funnel.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800 (qcom,msm8996-d=
wc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb=
@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: i2c@7577000 (qcom,i2c-qup-v=
2.2.1): Unevaluated properties are not allowed ('label' was unexpected)
--
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: pmic@3 (qcom,pmi8994): wle=
d@d800:interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: wled@d800 (qcom,pmi8994-wl=
ed): interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: wled@d800 (qcom,pmi8994-wl=
ed): interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: wled@d800 (qcom,pmi8994-wl=
ed): interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: phy@627000 (qcom,msm8996-q=
mp-ufs-phy): '#address-cells', '#size-cells', 'phy@627400', 'ranges' do not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: phy@627000 (qcom,msm8996-q=
mp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: phy@627000 (qcom,msm8996-q=
mp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: remoteproc@2080000 (qcom,m=
sm8996-mss-pil): clocks: [[24, 222], [24, 223], [24, 157], [16], [24, 229],=
 [24, 224], [24, 225], [25, 2], [25, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-=
mss-pil.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: funnel@3023000 (arm,coresi=
ght-dynamic-funnel): 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynami=
c-funnel.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: syscon@9a10000 (syscon): c=
ompatible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: pmic@3 (qcom,pmi8994): wl=
ed@d800:interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: wled@d800 (qcom,pmi8994-w=
led): interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: wled@d800 (qcom,pmi8994-w=
led): interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: wled@d800 (qcom,pmi8994-w=
led): interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: phy@627000 (qcom,msm8996-=
qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vdd=
p-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: phy@627000 (qcom,msm8996-=
qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: phy@627000 (qcom,msm8996-=
qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@1c00000 (qcom,=
msm8996-slpi-pil): 'px-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@1c00000 (qcom,=
msm8996-slpi-pil): Unevaluated properties are not allowed ('firmware-name' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@2080000 (qcom,=
msm8996-mss-pil): clocks: [[24, 222], [24, 223], [24, 157], [20], [24, 229]=
, [24, 224], [24, 225], [3, 2], [3, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-=
mss-pil.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: funnel@3023000 (arm,cores=
ight-dynamic-funnel): 'in-ports' is a required property
--
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: pmic@3 (qcom,pmi8994): w=
led@d800:interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: wled@d800 (qcom,pmi8994-=
wled): interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: wled@d800 (qcom,pmi8994-=
wled): interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: wled@d800 (qcom,pmi8994-=
wled): interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: phy@627000 (qcom,msm8996=
-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vd=
dp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: phy@627000 (qcom,msm8996=
-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: phy@627000 (qcom,msm8996=
-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@1c00000 (qcom=
,msm8996-slpi-pil): 'px-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@1c00000 (qcom=
,msm8996-slpi-pil): Unevaluated properties are not allowed ('firmware-name'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@2080000 (qcom=
,msm8996-mss-pil): clocks: [[24, 222], [24, 223], [24, 157], [20], [24, 229=
], [24, 224], [24, 225], [3, 2], [3, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-=
mss-pil.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: funnel@3023000 (arm,core=
sight-dynamic-funnel): 'in-ports' is a required property
--
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800 (qcom,pmi8=
994-wled): interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800 (qcom,pmi8=
994-wled): interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800 (qcom,pmi8=
994-wled): interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800 (qcom,pmi8=
994-wled): 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@627000 (qcom,msm=
8996-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@627400', 'ranges',=
 'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@627000 (qcom,msm=
8996-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@627000 (qcom,msm=
8996-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: remoteproc@1c00000 (=
qcom,msm8996-slpi-pil): Unevaluated properties are not allowed ('firmware-n=
ame' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: remoteproc@2080000 (=
qcom,msm8996-mss-pil): clocks: [[31, 222], [31, 223], [31, 157], [21], [31,=
 229], [31, 224], [31, 225], [2, 2], [2, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-=
mss-pil.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: funnel@3023000 (arm,=
coresight-dynamic-funnel): 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynami=
c-funnel.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800 (qcom,ms=
m8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$'=
, '^usb@[0-9a-f]+$'
--
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800 (qcom,=
pmi8994-wled): interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800 (qcom,=
pmi8994-wled): interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800 (qcom,=
pmi8994-wled): interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800 (qcom,=
pmi8994-wled): 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@627000 (qcom=
,msm8996-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@627400', 'rang=
es', 'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@627000 (qcom=
,msm8996-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@627000 (qcom=
,msm8996-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: remoteproc@1c000=
00 (qcom,msm8996-slpi-pil): Unevaluated properties are not allowed ('firmwa=
re-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: remoteproc@20800=
00 (qcom,msm8996-mss-pil): clocks: [[30, 222], [30, 223], [30, 157], [20], =
[30, 229], [30, 224], [30, 225], [2, 2], [2, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-=
mss-pil.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: funnel@3023000 (=
arm,coresight-dynamic-funnel): 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynami=
c-funnel.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800 (qco=
m,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9=
]+$', '^usb@[0-9a-f]+$'
--
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: pmic@3 (qcom,pmi=
8994): wled@d800:interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: wled@d800 (qcom,=
pmi8994-wled): interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: wled@d800 (qcom,=
pmi8994-wled): interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: wled@d800 (qcom,=
pmi8994-wled): interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled=
=2Eyaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@627000 (qcom=
,msm8996-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@627400', 'rang=
es', 'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@627000 (qcom=
,msm8996-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@627000 (qcom=
,msm8996-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: remoteproc@1c000=
00 (qcom,msm8996-slpi-pil): Unevaluated properties are not allowed ('firmwa=
re-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: remoteproc@20800=
00 (qcom,msm8996-mss-pil): clocks: [[31, 222], [31, 223], [31, 157], [21], =
[31, 229], [31, 224], [31, 225], [3, 2], [3, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-=
mss-pil.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: funnel@3023000 (=
arm,coresight-dynamic-funnel): 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynami=
c-funnel.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800 (qco=
m,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9=
]+$', '^usb@[0-9a-f]+$'
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: pci@1c00000 (q=
com,pcie-msm8998): iommu-map: [[256, 31, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: phy@1da7000 (q=
com,msm8998-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1da7400', '=
ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: phy@1da7000 (q=
com,msm8998-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: phy@1da7000 (q=
com,msm8998-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: pmic@0 (qcom,p=
m8998): adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not matc=
h any of the regexes: '^pinctrl-[0-9]+$'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', =
'^pinctrl-[0-9]+$'
   	['qcom,spmi-adc-rev2'] is too short
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-ia=
dc']
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-r=
radc']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pci@1c00000 (qcom,pcie-=
msm8998): iommu-map: [[256, 34, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@1da7000 (qcom,msm89=
98-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1da7400', 'ranges', =
'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@1da7000 (qcom,msm89=
98-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@1da7000 (qcom,msm89=
98-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: etm@7c40000 (arm,coresi=
ght-etm4x): 'out-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.ya=
ml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: etm@7c40000 (arm,coresi=
ght-etm4x): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.ya=
ml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: etm@7d40000 (arm,coresi=
ght-etm4x): 'out-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.ya=
ml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: etm@7d40000 (arm,coresi=
ght-etm4x): Unevaluated properties are not allowed ('port' was unexpected)
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: pci@1c00000 (qcom,pcie-=
msm8998): iommu-map: [[256, 31, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: phy@1da7000 (qcom,msm89=
98-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1da7400', 'ranges' d=
o not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: phy@1da7000 (qcom,msm89=
98-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: phy@1da7000 (qcom,msm89=
98-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: pmic@0 (qcom,pm8998): a=
dc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not matc=
h any of the regexes: '^pinctrl-[0-9]+$'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', =
'^pinctrl-[0-9]+$'
   	['qcom,spmi-adc-rev2'] is too short
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-ia=
dc']
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-r=
radc']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: pci@1c00000 (qcom,=
pcie-msm8998): iommu-map: [[256, 31, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: phy@1da7000 (qcom,=
msm8998-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1da7400', 'rang=
es' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: phy@1da7000 (qcom,=
msm8998-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: phy@1da7000 (qcom,=
msm8998-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: pmic@0 (qcom,pm899=
8): adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not matc=
h any of the regexes: '^pinctrl-[0-9]+$'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', =
'^pinctrl-[0-9]+$'
   	['qcom,spmi-adc-rev2'] is too short
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-ia=
dc']
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-r=
radc']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pci@1c00000 (qcom,pcie-msm8998=
): iommu-map: [[256, 34, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@1da7000 (qcom,msm8998-qmp-=
ufs-phy): '#address-cells', '#size-cells', 'phy@1da7400', 'ranges', 'vddp-r=
ef-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@1da7000 (qcom,msm8998-qmp-=
ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@1da7000 (qcom,msm8998-qmp-=
ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: etm@7c40000 (arm,coresight-etm=
4x): 'out-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.ya=
ml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: etm@7c40000 (arm,coresight-etm=
4x): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.ya=
ml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: etm@7d40000 (arm,coresight-etm=
4x): 'out-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.ya=
ml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: etm@7d40000 (arm,coresight-etm=
4x): Unevaluated properties are not allowed ('port' was unexpected)
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pci@1c00000 (=
qcom,pcie-msm8998): iommu-map: [[256, 35, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: phy@1da7000 (=
qcom,msm8998-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1da7400', =
'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: phy@1da7000 (=
qcom,msm8998-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: phy@1da7000 (=
qcom,msm8998-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pmic@0 (qcom,=
pm8998): adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not matc=
h any of the regexes: '^pinctrl-[0-9]+$'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', =
'^pinctrl-[0-9]+$'
   	['qcom,spmi-adc-rev2'] is too short
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-ia=
dc']
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-r=
radc']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pci@1c00000 (qcom=
,pcie-msm8998): iommu-map: [[256, 35, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: phy@1da7000 (qcom=
,msm8998-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1da7400', 'ran=
ges', 'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: phy@1da7000 (qcom=
,msm8998-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: phy@1da7000 (qcom=
,msm8998-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pmic@0 (qcom,pm89=
98): adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not matc=
h any of the regexes: '^pinctrl-[0-9]+$'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', =
'^pinctrl-[0-9]+$'
   	['qcom,spmi-adc-rev2'] is too short
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-ia=
dc']
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-r=
radc']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pci@1c00000 (qcom,pci=
e-msm8998): iommu-map: [[256, 34, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: phy@1da7000 (qcom,msm=
8998-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1da7400', 'ranges'=
, 'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: phy@1da7000 (qcom,msm=
8998-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: phy@1da7000 (qcom,msm=
8998-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pmic@0 (qcom,pm8998):=
 adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not matc=
h any of the regexes: '^pinctrl-[0-9]+$'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', =
'^pinctrl-[0-9]+$'
   	['qcom,spmi-adc-rev2'] is too short
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-ia=
dc']
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-r=
radc']
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnece=
ssary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#s=
ize-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_chil=
d_address): /soc@0/tpda@6004000/out-ports: graph node has single child node=
 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_chil=
d_address): /soc@0/funnel@6005000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_chil=
d_address): /soc@0/etf@6b05000/in-ports: graph node has single child node '=
port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_chil=
d_address): /soc@0/funnel@7810000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: phy@1d87000 (qcom,sm8250-qmp-u=
fs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not ma=
tch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: phy@1d87000 (qcom,sm8250-qmp-u=
fs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: phy@1d87000 (qcom,sm8250-qmp-u=
fs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: dma-controller@1dc4000 (qcom,b=
am-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0=
', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: dma-controller@1dc4000 (qcom,b=
am-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: dma-controller@1dc4000 (qcom,b=
am-v1.7.4): iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439=
, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: /soc@0/dma-controller@1dc4000:=
 failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-=
v1.7.0']
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: etf@6b05000 (arm,coresight-tmc=
): in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnece=
ssary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#s=
ize-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_chil=
d_address): /soc@0/tpda@6004000/out-ports: graph node has single child node=
 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_chil=
d_address): /soc@0/funnel@6005000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_chil=
d_address): /soc@0/etf@6b05000/in-ports: graph node has single child node '=
port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_chil=
d_address): /soc@0/funnel@7810000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: phy@1d87000 (=
qcom,sm8250-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', '=
ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: phy@1d87000 (=
qcom,sm8250-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: phy@1d87000 (=
qcom,sm8250-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: dma-controlle=
r@1dc4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of =
['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: dma-controlle=
r@1dc4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7=
=2E0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: dma-controlle=
r@1dc4000 (qcom,bam-v1.7.4): iommus: [[47, 1426, 0], [47, 1432, 0], [47, 14=
33, 0], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: /soc@0/dma-co=
ntroller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1=
=2E7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: etf@6b05000 (=
arm,coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@0' do =
not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
--
   	['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', '=
tbu'] is too short
   	'tbu' was expected
   	'ddrss_sf_tbu' was expected
   	[[42, 68], [42, 64], [42, 66], [42, 67], [42, 69], [42, 70], [42, 235],=
 [42, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/ufshc@1d8400=
0: failed to match any schema with compatible: ['qcom,sc8180x-ufshc', 'qcom=
,ufshc', 'jedec,ufs-2.0']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: ufshc@1d84000 (qcom=
,sc8180x-ufshc): compatible:0: 'qcom,sc8180x-ufshc' is not one of ['qcom,ms=
m8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufs=
hc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom=
,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufsh=
c', 'qcom,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: ufshc@1d84000 (qcom=
,sc8180x-ufshc): Unevaluated properties are not allowed ('compatible' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy-wrapper@1d87000=
 (qcom,sc8180x-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400'=
, 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy-wrapper@1d87000=
 (qcom,sc8180x-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy-wrapper@1d87000=
 (qcom,sc8180x-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/interconnect=
@1e00000: failed to match any schema with compatible: ['qcom,sc8180x-ipa-vi=
rt']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: gpu@2c00000 (qcom,a=
dreno-680.1): '#stream-id-cells' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: gpu@2c00000 (qcom,a=
dreno-680.1): #stream-id-cells: 16 is greater than the maximum of 8
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: iommu@2ca0000 (qcom=
,sc8180x-smmu-500): clock-names: False schema does not allow ['ahb', 'bus',=
 'iface']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: iommu@2ca0000 (qcom=
,sc8180x-smmu-500): clocks: False schema does not allow [[72, 0], [42, 38],=
 [42, 39]]
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
--
   	['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', '=
tbu'] is too short
   	'tbu' was expected
   	'ddrss_sf_tbu' was expected
   	[[42, 68], [42, 64], [42, 66], [42, 67], [42, 69], [42, 70], [42, 235],=
 [42, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/ufshc@1d84000: faile=
d to match any schema with compatible: ['qcom,sc8180x-ufshc', 'qcom,ufshc',=
 'jedec,ufs-2.0']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: ufshc@1d84000 (qcom,sc8180x=
-ufshc): compatible:0: 'qcom,sc8180x-ufshc' is not one of ['qcom,msm8994-uf=
shc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', 'qc=
om,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-=
ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qco=
m,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: ufshc@1d84000 (qcom,sc8180x=
-ufshc): Unevaluated properties are not allowed ('compatible' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy-wrapper@1d87000 (qcom,s=
c8180x-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'range=
s' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy-wrapper@1d87000 (qcom,s=
c8180x-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy-wrapper@1d87000 (qcom,s=
c8180x-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/interconnect@1e00000=
: failed to match any schema with compatible: ['qcom,sc8180x-ipa-virt']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: gpu@2c00000 (qcom,adreno-68=
0.1): '#stream-id-cells' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: gpu@2c00000 (qcom,adreno-68=
0.1): #stream-id-cells: 16 is greater than the maximum of 8
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: iommu@2ca0000 (qcom,sc8180x=
-smmu-500): clock-names: False schema does not allow ['ahb', 'bus', 'iface']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: iommu@2ca0000 (qcom,sc8180x=
-smmu-500): clocks: False schema does not allow [[76, 0], [42, 38], [42, 39=
]]
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: /soc@0/geniqup@8c0000/spi@=
894000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: pci@1c00000 (qcom,pcie-sdm=
845): iommu-map: [[0, 43, 7184, 1], [256, 43, 7185, 1], [512, 43, 7186, 1],=
 [768, 43, 7187, 1], [1024, 43, 7188, 1], [1280, 43, 7189, 1], [1536, 43, 7=
190, 1], [1792, 43, 7191, 1], [2048, 43, 7192, 1], [2304, 43, 7193, 1], [25=
60, 43, 7194, 1], [2816, 43, 7195, 1], [3072, 43, 7196, 1], [3328, 43, 7197=
, 1], [3584, 43, 7198, 1], [3840, 43, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: pci@1c08000 (qcom,pcie-sdm=
845): iommu-map: [[0, 43, 7168, 1], [256, 43, 7169, 1], [512, 43, 7170, 1],=
 [768, 43, 7171, 1], [1024, 43, 7172, 1], [1280, 43, 7173, 1], [1536, 43, 7=
174, 1], [1792, 43, 7175, 1], [2048, 43, 7176, 1], [2304, 43, 7177, 1], [25=
60, 43, 7178, 1], [2816, 43, 7179, 1], [3072, 43, 7180, 1], [3328, 43, 7181=
, 1], [3584, 43, 7182, 1], [3840, 43, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: ufshc@1d84000 (qcom,sdm845=
-ufshc): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do no=
t match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: dma-controller@1dc4000 (qc=
om,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1=
=2E3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: dma-controller@1dc4000 (qc=
om,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too l=
ong
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: /soc@0/dma-controller@1dc4=
000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,=
bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: /soc@0/remoteproc@5c00000:=
 failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: etf@6047000 (arm,coresight=
-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not match any=
 of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: /soc@0/geniqup@8c0000/spi@=
894000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: pci@1c00000 (qcom,pcie-sdm=
845): iommu-map: [[0, 43, 7184, 1], [256, 43, 7185, 1], [512, 43, 7186, 1],=
 [768, 43, 7187, 1], [1024, 43, 7188, 1], [1280, 43, 7189, 1], [1536, 43, 7=
190, 1], [1792, 43, 7191, 1], [2048, 43, 7192, 1], [2304, 43, 7193, 1], [25=
60, 43, 7194, 1], [2816, 43, 7195, 1], [3072, 43, 7196, 1], [3328, 43, 7197=
, 1], [3584, 43, 7198, 1], [3840, 43, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: pci@1c08000 (qcom,pcie-sdm=
845): iommu-map: [[0, 43, 7168, 1], [256, 43, 7169, 1], [512, 43, 7170, 1],=
 [768, 43, 7171, 1], [1024, 43, 7172, 1], [1280, 43, 7173, 1], [1536, 43, 7=
174, 1], [1792, 43, 7175, 1], [2048, 43, 7176, 1], [2304, 43, 7177, 1], [25=
60, 43, 7178, 1], [2816, 43, 7179, 1], [3072, 43, 7180, 1], [3328, 43, 7181=
, 1], [3584, 43, 7182, 1], [3840, 43, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: ufshc@1d84000 (qcom,sdm845=
-ufshc): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do no=
t match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: dma-controller@1dc4000 (qc=
om,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1=
=2E3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: dma-controller@1dc4000 (qc=
om,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too l=
ong
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: /soc@0/dma-controller@1dc4=
000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,=
bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: /soc@0/remoteproc@5c00000:=
 failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: etf@6047000 (arm,coresight=
-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not match any=
 of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: /soc@0/geniqup@8c0000/spi@=
894000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: pci@1c00000 (qcom,pcie-sdm=
845): iommu-map: [[0, 43, 7184, 1], [256, 43, 7185, 1], [512, 43, 7186, 1],=
 [768, 43, 7187, 1], [1024, 43, 7188, 1], [1280, 43, 7189, 1], [1536, 43, 7=
190, 1], [1792, 43, 7191, 1], [2048, 43, 7192, 1], [2304, 43, 7193, 1], [25=
60, 43, 7194, 1], [2816, 43, 7195, 1], [3072, 43, 7196, 1], [3328, 43, 7197=
, 1], [3584, 43, 7198, 1], [3840, 43, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: pci@1c08000 (qcom,pcie-sdm=
845): iommu-map: [[0, 43, 7168, 1], [256, 43, 7169, 1], [512, 43, 7170, 1],=
 [768, 43, 7171, 1], [1024, 43, 7172, 1], [1280, 43, 7173, 1], [1536, 43, 7=
174, 1], [1792, 43, 7175, 1], [2048, 43, 7176, 1], [2304, 43, 7177, 1], [25=
60, 43, 7178, 1], [2816, 43, 7179, 1], [3072, 43, 7180, 1], [3328, 43, 7181=
, 1], [3584, 43, 7182, 1], [3840, 43, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: ufshc@1d84000 (qcom,sdm845=
-ufshc): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do no=
t match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: dma-controller@1dc4000 (qc=
om,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1=
=2E3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: dma-controller@1dc4000 (qc=
om,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too l=
ong
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: /soc@0/dma-controller@1dc4=
000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,=
bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: /soc@0/remoteproc@5c00000:=
 failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: etf@6047000 (arm,coresight=
-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not match any=
 of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pci@1c00000 (qcom,pcie-sdm84=
5): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [=
768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 719=
0, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560=
, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, =
1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pci@1c00000 (qcom,pcie-sdm84=
5): Unevaluated properties are not allowed ('enable-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pci@1c08000 (qcom,pcie-sdm84=
5): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [=
768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 717=
4, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560=
, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, =
1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: ufshc@1d84000 (qcom,sdm845-u=
fshc): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: phy@1d87000 (qcom,sdm845-qmp=
-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: phy@1d87000 (qcom,sdm845-qmp=
-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: phy@1d87000 (qcom,sdm845-qmp=
-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: dma-controller@1dc4000 (qcom=
,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3=
=2E0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: dma-controller@1dc4000 (qcom=
,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: /soc@0/dma-controller@1dc400=
0: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,ba=
m-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: /soc@0/remoteproc@5c00000: f=
ailed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: etf@6047000 (arm,coresight-t=
mc): in-ports: '#address-cells', '#size-cells', 'port@1' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pci@1c0=
0000 (qcom,pcie-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], =
[512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 718=
9, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304=
, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, =
1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too l=
ong
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pci@1c0=
0000 (qcom,pcie-sdm845): Unevaluated properties are not allowed ('enable-gp=
io' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pci@1c0=
8000 (qcom,pcie-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], =
[512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 717=
3, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304=
, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, =
1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too l=
ong
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: ufshc@1=
d84000 (qcom,sdm845-ufshc): Unevaluated properties are not allowed ('reg-na=
mes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: phy@1d8=
7000 (qcom,sdm845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d874=
00', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: phy@1d8=
7000 (qcom,sdm845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: phy@1d8=
7000 (qcom,sdm845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: dma-con=
troller@1dc4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not o=
ne of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: dma-con=
troller@1dc4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,ba=
m-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: /soc@0/=
dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,=
bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: /soc@0/=
remoteproc@5c00000: failed to match any schema with compatible: ['qcom,sdm8=
45-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: etf@604=
7000 (arm,coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@=
1' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: remoteproc-cdsp (qcom,sdm=
845-cdsp-pas): Unevaluated properties are not allowed ('firmware-name' was =
unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pci@1c00000 (qcom,pcie-sd=
m845): iommu-map: [[0, 51, 7184, 1], [256, 51, 7185, 1], [512, 51, 7186, 1]=
, [768, 51, 7187, 1], [1024, 51, 7188, 1], [1280, 51, 7189, 1], [1536, 51, =
7190, 1], [1792, 51, 7191, 1], [2048, 51, 7192, 1], [2304, 51, 7193, 1], [2=
560, 51, 7194, 1], [2816, 51, 7195, 1], [3072, 51, 7196, 1], [3328, 51, 719=
7, 1], [3584, 51, 7198, 1], [3840, 51, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pci@1c08000 (qcom,pcie-sd=
m845): iommu-map: [[0, 51, 7168, 1], [256, 51, 7169, 1], [512, 51, 7170, 1]=
, [768, 51, 7171, 1], [1024, 51, 7172, 1], [1280, 51, 7173, 1], [1536, 51, =
7174, 1], [1792, 51, 7175, 1], [2048, 51, 7176, 1], [2304, 51, 7177, 1], [2=
560, 51, 7178, 1], [2816, 51, 7179, 1], [3072, 51, 7180, 1], [3328, 51, 718=
1, 1], [3584, 51, 7182, 1], [3840, 51, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: ufshc@1d84000 (qcom,sdm84=
5-ufshc): Unevaluated properties are not allowed ('reg-names' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: phy@1d87000 (qcom,sdm845-=
qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do n=
ot match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: phy@1d87000 (qcom,sdm845-=
qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: phy@1d87000 (qcom,sdm845-=
qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: dma-controller@1dc4000 (q=
com,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v=
1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: dma-controller@1dc4000 (q=
com,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too =
long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/dma-controller@1dc=
4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom=
,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/remoteproc@5c00000=
: failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: etf@6047000 (arm,coresigh=
t-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not match an=
y of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: remoteproc-cdsp (qcom,sdm8=
45-cdsp-pas): Unevaluated properties are not allowed ('firmware-name' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pci@1c00000 (qcom,pcie-sdm=
845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1],=
 [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7=
190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [25=
60, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197=
, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pci@1c08000 (qcom,pcie-sdm=
845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1],=
 [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7=
174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [25=
60, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181=
, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: ufshc@1d84000 (qcom,sdm845=
-ufshc): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do no=
t match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: phy@1d87000 (qcom,sdm845-q=
mp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: dma-controller@1dc4000 (qc=
om,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1=
=2E3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: dma-controller@1dc4000 (qc=
om,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too l=
ong
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: /soc@0/dma-controller@1dc4=
000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,=
bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: /soc@0/remoteproc@5c00000:=
 failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: etf@6047000 (arm,coresight=
-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not match any=
 of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: remoteproc-cdsp (qcom,sdm845-cd=
sp-pas): Unevaluated properties are not allowed ('firmware-name' was unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pci@1c00000 (qcom,pcie-sdm845):=
 iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768=
, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, =
1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 4=
9, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1],=
 [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pci@1c08000 (qcom,pcie-sdm845):=
 iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768=
, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, =
1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 4=
9, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1],=
 [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: ufshc@1d84000 (qcom,sdm845-ufsh=
c): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: phy@1d87000 (qcom,sdm845-qmp-uf=
s-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: phy@1d87000 (qcom,sdm845-qmp-uf=
s-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: phy@1d87000 (qcom,sdm845-qmp-uf=
s-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0'=
, 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: /soc@0/dma-controller@1dc4000: =
failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v=
1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: /soc@0/remoteproc@5c00000: fail=
ed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: etf@6047000 (arm,coresight-tmc)=
: in-ports: '#address-cells', '#size-cells', 'port@1' do not match any of t=
he regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/geniqup@8c=
0000/i2c@890000/max98927@3a: failed to match any schema with compatible: ['=
maxim,max98927']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/geniqup@ac=
0000/i2c@a90000/synaptics-rmi4-i2c@20: failed to match any schema with comp=
atible: ['syna,rmi4-i2c']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pci@1c00000 (qcom=
,pcie-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, =
7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [15=
36, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193=
, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328,=
 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pci@1c08000 (qcom=
,pcie-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, =
7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [15=
36, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177=
, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328,=
 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: ufshc@1d84000 (qc=
om,sdm845-ufshc): Unevaluated properties are not allowed ('reg-names' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: phy@1d87000 (qcom=
,sdm845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'rang=
es' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: phy@1d87000 (qcom=
,sdm845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: phy@1d87000 (qcom=
,sdm845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: dma-controller@1d=
c4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qc=
om,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: dma-controller@1d=
c4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']=
 is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/dma-contro=
ller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4=
', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/remoteproc=
@5c00000: failed to match any schema with compatible: ['qcom,sdm845-slpi-pa=
s']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: etf@6047000 (arm,=
coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: /soc@0/geniqup@ac000=
0/i2c@a90000/synaptics-rmi4-i2c@20: failed to match any schema with compati=
ble: ['syna,rmi4-i2c']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pci@1c00000 (qcom,pc=
ie-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 718=
6, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536,=
 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1=
], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49=
, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pci@1c08000 (qcom,pc=
ie-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 717=
0, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536,=
 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1=
], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49=
, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: ufshc@1d84000 (qcom,=
sdm845-ufshc): Unevaluated properties are not allowed ('reg-names' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: phy@1d87000 (qcom,sd=
m845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges'=
 do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: phy@1d87000 (qcom,sd=
m845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: phy@1d87000 (qcom,sd=
m845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: dma-controller@1dc40=
00 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,=
bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: dma-controller@1dc40=
00 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is=
 too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: /soc@0/dma-controlle=
r@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', =
'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: /soc@0/remoteproc@5c=
00000: failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: etf@6047000 (arm,cor=
esight-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4692.27-4743.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pci@1c00000 (qc=
om,pcie-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49=
, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [=
1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 71=
93, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [332=
8, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pci@1c08000 (qc=
om,pcie-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49=
, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [=
1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 71=
77, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [332=
8, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: ufshc@1d84000 (=
qcom,sdm845-ufshc): Unevaluated properties are not allowed ('reg-names' was=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: phy@1d87000 (qc=
om,sdm845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ra=
nges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: phy@1d87000 (qc=
om,sdm845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: phy@1d87000 (qc=
om,sdm845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: dma-controller@=
1dc4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['=
qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: dma-controller@=
1dc4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0=
'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/dma-cont=
roller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7=
=2E4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/remotepr=
oc@5c00000: failed to match any schema with compatible: ['qcom,sdm845-slpi-=
pas']
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: etf@6047000 (ar=
m,coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do no=
t match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: remoteproc-cd=
sp (qcom,sdm845-cdsp-pas): Unevaluated properties are not allowed ('firmwar=
e-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pci@1c00000 (=
qcom,pcie-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, =
49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1],=
 [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, =
7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3=
328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pci@1c08000 (=
qcom,pcie-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, =
49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1],=
 [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, =
7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3=
328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: ufshc@1d84000=
 (qcom,sdm845-ufshc): Unevaluated properties are not allowed ('reg-names' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: phy@1d87000 (=
qcom,sdm845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', '=
ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: phy@1d87000 (=
qcom,sdm845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: phy@1d87000 (=
qcom,sdm845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: dma-controlle=
r@1dc4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of =
['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: dma-controlle=
r@1dc4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7=
=2E0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: /soc@0/dma-co=
ntroller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1=
=2E7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: /soc@0/remote=
proc@5c00000: failed to match any schema with compatible: ['qcom,sdm845-slp=
i-pas']
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: etf@6047000 (=
arm,coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do =
not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: remoteproc-=
cdsp (qcom,sdm845-cdsp-pas): Unevaluated properties are not allowed ('firmw=
are-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pci@1c00000=
 (qcom,pcie-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512=
, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1=
], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49=
, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], =
[3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pci@1c08000=
 (qcom,pcie-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512=
, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1=
], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49=
, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], =
[3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: ufshc@1d840=
00 (qcom,sdm845-ufshc): Unevaluated properties are not allowed ('reg-names'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: phy@1d87000=
 (qcom,sdm845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400',=
 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: phy@1d87000=
 (qcom,sdm845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: phy@1d87000=
 (qcom,sdm845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: dma-control=
ler@1dc4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one o=
f ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: dma-control=
ler@1dc4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1=
=2E7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: /soc@0/dma-=
controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-=
v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: /soc@0/remo=
teproc@5c00000: failed to match any schema with compatible: ['qcom,sdm845-s=
lpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: etf@6047000=
 (arm,coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' d=
o not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/geniqup@ac000=
0/i2c@a98000/touchscreen@20: failed to match any schema with compatible: ['=
syna,rmi4-i2c']
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pci@1c00000 (qcom,pc=
ie-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 718=
6, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536,=
 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1=
], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49=
, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pci@1c08000 (qcom,pc=
ie-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 717=
0, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536,=
 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1=
], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49=
, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: ufshc@1d84000 (qcom,=
sdm845-ufshc): Unevaluated properties are not allowed ('reg-names' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: phy@1d87000 (qcom,sd=
m845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges'=
 do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: phy@1d87000 (qcom,sd=
m845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: phy@1d87000 (qcom,sd=
m845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: dma-controller@1dc40=
00 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,=
bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: dma-controller@1dc40=
00 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is=
 too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/dma-controlle=
r@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', =
'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/remoteproc@5c=
00000: failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: etf@6047000 (arm,cor=
esight-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/geniqup@8c0000=
/i2c@894000/touchscreen@38: failed to match any schema with compatible: ['f=
ocaltech,fts8719']
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pci@1c00000 (qcom,pci=
e-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186=
, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, =
49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1]=
, [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49,=
 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pci@1c08000 (qcom,pci=
e-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170=
, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, =
49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1]=
, [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49,=
 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: ufshc@1d84000 (qcom,s=
dm845-ufshc): Unevaluated properties are not allowed ('reg-names' was unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: phy@1d87000 (qcom,sdm=
845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' =
do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: phy@1d87000 (qcom,sdm=
845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: phy@1d87000 (qcom,sdm=
845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: dma-controller@1dc400=
0 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,b=
am-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: dma-controller@1dc400=
0 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is =
too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/dma-controller=
@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', '=
qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/remoteproc@5c0=
0000: failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: etf@6047000 (arm,core=
sight-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not matc=
h any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: panel (boe,nv133fh=
m-n61): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simp=
le.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: pci@1c00000 (qcom,=
pcie-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7=
186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [153=
6, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193,=
 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, =
49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: pci@1c08000 (qcom,=
pcie-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7=
170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [153=
6, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177,=
 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, =
49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: ufshc@1d84000 (qco=
m,sdm845-ufshc): Unevaluated properties are not allowed ('reg-names' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: phy@1d87000 (qcom,=
sdm845-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'range=
s' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: phy@1d87000 (qcom,=
sdm845-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: phy@1d87000 (qcom,=
sdm845-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: dma-controller@1dc=
4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qco=
m,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: dma-controller@1dc=
4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] =
is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: /soc@0/dma-control=
ler@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4'=
, 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: crypto@1dfa000 (qc=
om,crypto-v5.4): status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
--
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: remoteproc-cdsp (qcom,=
sdm845-cdsp-pas): Unevaluated properties are not allowed ('firmware-name' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yam=
l#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: pci@1c00000 (qcom,pcie=
-sdm845): iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186,=
 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 4=
9, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1],=
 [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, =
7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: pci@1c08000 (qcom,pcie=
-sdm845): iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170,=
 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 4=
9, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1],=
 [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, =
7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: ufshc@1d84000 (qcom,sd=
m845-ufshc): Unevaluated properties are not allowed ('reg-names' was unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: phy@1d87000 (qcom,sdm8=
45-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' d=
o not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: phy@1d87000 (qcom,sdm8=
45-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: phy@1d87000 (qcom,sdm8=
45-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: dma-controller@1dc4000=
 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,ba=
m-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: dma-controller@1dc4000=
 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: /soc@0/dma-controller@=
1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'q=
com,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: /soc@0/remoteproc@5c00=
000: failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: etf@6047000 (arm,cores=
ight-tmc): in-ports: '#address-cells', '#size-cells', 'port@1' do not match=
 any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: dma-controller@1b04=
000 (qcom,bam-v1.7.4): iommus: [[42, 146, 0], [42, 148, 17], [42, 150, 17],=
 [42, 152, 1], [42, 159, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: /soc@0/dma-controll=
er@1b04000: failed to match any schema with compatible: ['qcom,bam-v1.7.4',=
 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: /soc@0/ufs@4804000:=
 failed to match any schema with compatible: ['qcom,sm6115-ufshc', 'qcom,uf=
shc', 'jedec,ufs-2.0']
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: ufs@4804000 (qcom,s=
m6115-ufshc): compatible:0: 'qcom,sm6115-ufshc' is not one of ['qcom,msm899=
4-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc',=
 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8=
150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', =
'qcom,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: ufs@4804000 (qcom,s=
m6115-ufshc): Unevaluated properties are not allowed ('compatible', 'reg-na=
mes' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: phy@4807000 (qcom,s=
m6115-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@4807400', 'ranges=
', 'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: phy@4807000 (qcom,s=
m6115-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: phy@4807000 (qcom,s=
m6115-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: mailbox@f111000 (qc=
om,sm6115-apcs-hmss-global): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['qcom,sm6115-apcs-hmss-global', 'qcom,msm8994-apcs-kpss-global'] is to=
o long
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,ipq5018-apcs-apps-g=
lobal', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', '=
qcom,ipq9574-apcs-apps-global']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,sc7180-apss-shared'=
, 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,msm8916-apcs-kpss-g=
lobal', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', '=
qcom,msm8976-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,qcs4=
04-apcs-apps-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,sdm845-apss-shared' was expected
--
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: adc@3100 (qcom,spmi-adc=
5): 'die-temp@6', 'ref-gnd@0', 'vcoin@85', 'vph-pwr@83', 'vref-1p25@1', 'xo=
-therm@4c' do not match any of the regexes: '^channel@[0-9a-f]+$', '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/qcom,spmi-vadc.y=
aml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: /soc@0/ufs@4804000: fai=
led to match any schema with compatible: ['qcom,sm6115-ufshc', 'qcom,ufshc'=
, 'jedec,ufs-2.0']
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: ufs@4804000 (qcom,sm611=
5-ufshc): compatible:0: 'qcom,sm6115-ufshc' is not one of ['qcom,msm8994-uf=
shc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', 'qc=
om,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-=
ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qco=
m,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: ufs@4804000 (qcom,sm611=
5-ufshc): Unevaluated properties are not allowed ('compatible', 'reg-names'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: phy@4807000 (qcom,sm611=
5-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@4807400', 'ranges', '=
vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: phy@4807000 (qcom,sm611=
5-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: phy@4807000 (qcom,sm611=
5-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: mailbox@f111000 (qcom,s=
m6115-apcs-hmss-global): compatible: 'oneOf' conditional failed, one must b=
e fixed:
   	['qcom,sm6115-apcs-hmss-global', 'qcom,msm8994-apcs-kpss-global'] is to=
o long
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,ipq5018-apcs-apps-g=
lobal', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', '=
qcom,ipq9574-apcs-apps-global']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,sc7180-apss-shared'=
, 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,msm8916-apcs-kpss-g=
lobal', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', '=
qcom,msm8976-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,qcs4=
04-apcs-apps-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,sdm845-apss-shared' was expected
--
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: adc@3100 (qcom,spmi-a=
dc5): 'die-temp@6', 'ref-gnd@0', 'vcoin@85', 'vph-pwr@83', 'vref-1p25@1', '=
xo-therm@4c' do not match any of the regexes: '^channel@[0-9a-f]+$', '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/qcom,spmi-vadc.y=
aml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: /soc@0/ufs@4804000: f=
ailed to match any schema with compatible: ['qcom,sm6115-ufshc', 'qcom,ufsh=
c', 'jedec,ufs-2.0']
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: ufs@4804000 (qcom,sm6=
115-ufshc): compatible:0: 'qcom,sm6115-ufshc' is not one of ['qcom,msm8994-=
ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', '=
qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm815=
0-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'q=
com,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: ufs@4804000 (qcom,sm6=
115-ufshc): Unevaluated properties are not allowed ('compatible', 'reg-name=
s' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: phy@4807000 (qcom,sm6=
115-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@4807400', 'ranges',=
 'vddp-ref-clk-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: phy@4807000 (qcom,sm6=
115-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: phy@4807000 (qcom,sm6=
115-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: mailbox@f111000 (qcom=
,sm6115-apcs-hmss-global): compatible: 'oneOf' conditional failed, one must=
 be fixed:
   	['qcom,sm6115-apcs-hmss-global', 'qcom,msm8994-apcs-kpss-global'] is to=
o long
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,ipq5018-apcs-apps-g=
lobal', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', '=
qcom,ipq9574-apcs-apps-global']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,sc7180-apss-shared'=
, 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,msm8916-apcs-kpss-g=
lobal', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', '=
qcom,msm8976-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,qcs4=
04-apcs-apps-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,sdm845-apss-shared' was expected
--
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: haptics@5a (awinic,aw=
8695): awinic,boost-debug: b'0\xeb\xd4' is not of type 'object', 'integer',=
 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: haptics@5a (awinic,aw=
8695): awinic,tset: b'\x12' is not of type 'object', 'integer', 'array', 'b=
oolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: haptics@5a (awinic,aw=
8695): awinic,r-spare: b'h' is not of type 'object', 'integer', 'array', 'b=
oolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: ufs@1d84000 (qcom,sm6=
350-ufshc): Unevaluated properties are not allowed ('reg-names' was unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000 (qcom,sm6=
350-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' =
do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000 (qcom,sm6=
350-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000 (qcom,sm6=
350-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: pmic@4 (qcom,pm6150l)=
: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@0', 'adc-chan@1', 'adc-chan@=
6', 'adc-chan@83' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'adc-chan@0', 'adc-chan@1', 'adc-chan@=
6', 'adc-chan@83', 'interrupts' do not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	'adc-chan@0', 'adc-chan@1', 'adc-chan@6', 'adc-chan@83' do not match an=
y of the regexes: '^channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	['qcom,spmi-adc5'] is too short
   	'qcom,spmi-adc5' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-iadc']
   	'qcom,spmi-adc5' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-rradc=
']
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnece=
ssary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#s=
ize-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_chil=
d_address): /soc@0/tpda@6004000/out-ports: graph node has single child node=
 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_chil=
d_address): /soc@0/funnel@6005000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_chil=
d_address): /soc@0/etf@6b05000/in-ports: graph node has single child node '=
port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_chil=
d_address): /soc@0/funnel@7810000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: phy@1d87000 (qcom,sm8250-qmp-uf=
s-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: phy@1d87000 (qcom,sm8250-qmp-uf=
s-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: phy@1d87000 (qcom,sm8250-qmp-uf=
s-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0'=
, 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439,=
 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: /soc@0/dma-controller@1dc4000: =
failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v=
1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: etf@6b05000 (arm,coresight-tmc)=
: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of t=
he regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnece=
ssary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#s=
ize-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_chil=
d_address): /soc@0/tpda@6004000/out-ports: graph node has single child node=
 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_chil=
d_address): /soc@0/funnel@6005000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_chil=
d_address): /soc@0/etf@6b05000/in-ports: graph node has single child node '=
port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_chil=
d_address): /soc@0/funnel@7810000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: phy@1d87000 (qcom,sm8250-qmp-uf=
s-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: phy@1d87000 (qcom,sm8250-qmp-uf=
s-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: phy@1d87000 (qcom,sm8250-qmp-uf=
s-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0'=
, 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439,=
 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: /soc@0/dma-controller@1dc4000: =
failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v=
1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: etf@6b05000 (arm,coresight-tmc)=
: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of t=
he regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnece=
ssary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#s=
ize-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_chil=
d_address): /soc@0/tpda@6004000/out-ports: graph node has single child node=
 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_chil=
d_address): /soc@0/funnel@6005000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_chil=
d_address): /soc@0/etf@6b05000/in-ports: graph node has single child node '=
port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_chil=
d_address): /soc@0/funnel@7810000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: ramoops@ffc0=
0000 (ramoops): Unevaluated properties are not allowed ('msg-size' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.=
yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: /soc@0/geniq=
up@ac0000/i2c@a94000/touchscreen@48: failed to match any schema with compat=
ible: ['samsung,s6sy761']
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: phy@1d87000 =
(qcom,sm8250-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', =
'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: dma-controll=
er@1dc4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of=
 ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: dma-controll=
er@1dc4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.=
7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: dma-controll=
er@1dc4000 (qcom,bam-v1.7.4): iommus: [[48, 1426, 0], [48, 1432, 0], [48, 1=
433, 0], [48, 1439, 0], [48, 1414, 17], [48, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: /soc@0/dma-c=
ontroller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v=
1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: etf@6b05000 =
(arm,coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@0' do=
 not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnece=
ssary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#s=
ize-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_chil=
d_address): /soc@0/tpda@6004000/out-ports: graph node has single child node=
 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_chil=
d_address): /soc@0/funnel@6005000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_chil=
d_address): /soc@0/etf@6b05000/in-ports: graph node has single child node '=
port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_chil=
d_address): /soc@0/funnel@7810000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: ramoops@ffc0=
0000 (ramoops): Unevaluated properties are not allowed ('msg-size' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.=
yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: /soc@0/geniq=
up@ac0000/i2c@a94000/touchscreen@48: failed to match any schema with compat=
ible: ['samsung,s6sy761']
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: phy@1d87000 =
(qcom,sm8250-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', =
'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: dma-controll=
er@1dc4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of=
 ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: dma-controll=
er@1dc4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.=
7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: dma-controll=
er@1dc4000 (qcom,bam-v1.7.4): iommus: [[48, 1426, 0], [48, 1432, 0], [48, 1=
433, 0], [48, 1439, 0], [48, 1414, 17], [48, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: /soc@0/dma-c=
ontroller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v=
1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: etf@6b05000 =
(arm,coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@0' do=
 not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnece=
ssary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#s=
ize-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_chil=
d_address): /soc@0/tpda@6004000/out-ports: graph node has single child node=
 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_chil=
d_address): /soc@0/funnel@6005000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_chil=
d_address): /soc@0/etf@6b05000/in-ports: graph node has single child node '=
port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_chil=
d_address): /soc@0/funnel@7810000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: phy@1d87000 (qcom,=
sm8250-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'range=
s' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: phy@1d87000 (qcom,=
sm8250-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: phy@1d87000 (qcom,=
sm8250-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: dma-controller@1dc=
4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qco=
m,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: dma-controller@1dc=
4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] =
is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: dma-controller@1dc=
4000 (qcom,bam-v1.7.4): iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0=
], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: /soc@0/dma-control=
ler@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4'=
, 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: etf@6b05000 (arm,c=
oresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@0' do not m=
atch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnece=
ssary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#s=
ize-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_chil=
d_address): /soc@0/tpda@6004000/out-ports: graph node has single child node=
 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_chil=
d_address): /soc@0/funnel@6005000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_chil=
d_address): /soc@0/etf@6b05000/in-ports: graph node has single child node '=
port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_chil=
d_address): /soc@0/funnel@7810000/in-ports: graph node has single child nod=
e 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: phy@1d87000 (qcom=
,sm8250-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'rang=
es' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: phy@1d87000 (qcom=
,sm8250-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: phy@1d87000 (qcom=
,sm8250-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: dma-controller@1d=
c4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qc=
om,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: dma-controller@1d=
c4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']=
 is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: dma-controller@1d=
c4000 (qcom,bam-v1.7.4): iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, =
0], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: /soc@0/dma-contro=
ller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4=
', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: etf@6b05000 (arm,=
coresight-tmc): in-ports: '#address-cells', '#size-cells', 'port@0' do not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
--
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: typec-mux@42 (fcs,fsa4480): 'po=
rt' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: typec-mux@42 (fcs,fsa4480): svi=
d: b'\xff\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: phy@1c06000 (qcom,sm8350-qmp-ge=
n3x1-pcie-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pc=
ie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: /soc@0/phy@1c0e000: failed to m=
atch any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: phy@1d87000 (qcom,sm8350-qmp-uf=
s-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: phy@1d87000 (qcom,sm8350-qmp-uf=
s-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: phy@1d87000 (qcom,sm8350-qmp-uf=
s-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0'=
, 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: /soc@0/dma-controller@1dc4000: =
failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v=
1.7.0']
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: iommu@3da0000 (qcom,sm8350-smmu=
-500): clock-names: False schema does not allow ['bus', 'iface', 'ahb', 'hl=
os1_vote_gpu_smmu', 'cx_gmu', 'hub_cx_int', 'hub_aon']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2582.27-2659.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2680.27-2757.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2545.11-2555.7: Warning (graph_chil=
d_address): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000=
/ports: graph node has single child node 'port@0', #address-cells/#size-cel=
ls are not necessary
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: /soc@0/phy@1=
c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x=
2-pcie-phy']
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: phy@1d87000 =
(qcom,sm8350-qmp-ufs-phy): '#address-cells', '#size-cells', 'phy@1d87400', =
'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: phy@1d87000 =
(qcom,sm8350-qmp-ufs-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: phy@1d87000 =
(qcom,sm8350-qmp-ufs-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: dma-controll=
er@1dc4000 (qcom,bam-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of=
 ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: dma-controll=
er@1dc4000 (qcom,bam-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.=
7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: /soc@0/dma-c=
ontroller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v=
1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: iommu@3da000=
0 (qcom,sm8350-smmu-500): clock-names: False schema does not allow ['bus', =
'iface', 'ahb', 'hlos1_vote_gpu_smmu', 'cx_gmu', 'hub_cx_int', 'hub_aon']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2582.27-2659.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2680.27-2757.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2545.11-2555.7: Warning (graph_chil=
d_address): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000=
/ports: graph node has single child node 'port@0', #address-cells/#size-cel=
ls are not necessary
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: /soc@0/phy@1c0e000: failed to m=
atch any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: phy@1d87000 (qcom,sm8350-qmp-uf=
s-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: phy@1d87000 (qcom,sm8350-qmp-uf=
s-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: phy@1d87000 (qcom,sm8350-qmp-uf=
s-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0'=
, 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: /soc@0/dma-controller@1dc4000: =
failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v=
1.7.0']
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: iommu@3da0000 (qcom,sm8350-smmu=
-500): clock-names: False schema does not allow ['bus', 'iface', 'ahb', 'hl=
os1_vote_gpu_smmu', 'cx_gmu', 'hub_cx_int', 'hub_aon']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000 (qcom,sm8450-ufsh=
c): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro=
', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk'=
, 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000 (qcom,sm8450-ufsh=
c): clocks: [[49, 151], [49, 10], [49, 150], [49, 166], [42, 0], [49, 164],=
 [49, 160], [49, 162], [49, 154]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000 (qcom,sm8450-ufsh=
c): reg: [[0, 30949376, 0, 12288], [0, 30965760, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000 (qcom,sm8450-ufsh=
c): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1d87000 (qcom,sm8450-qmp-uf=
s-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1d87000 (qcom,sm8450-qmp-uf=
s-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1d87000 (qcom,sm8450-qmp-uf=
s-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0'=
, 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): iommus: [[48, 1412, 17], [48, 1416, 0], [48, 1432, 5], [48, 1434=
, 0], [48, 1439, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: /soc@0/dma-controller@1dc4000: =
failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v=
1.7.0']
--
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000 (qcom,sm8450-ufsh=
c): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro=
', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk'=
, 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000 (qcom,sm8450-ufsh=
c): clocks: [[49, 151], [49, 10], [49, 150], [49, 166], [42, 0], [49, 164],=
 [49, 160], [49, 162], [49, 154]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000 (qcom,sm8450-ufsh=
c): reg: [[0, 30949376, 0, 12288], [0, 30965760, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000 (qcom,sm8450-ufsh=
c): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1d87000 (qcom,sm8450-qmp-uf=
s-phy): '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1d87000 (qcom,sm8450-qmp-uf=
s-phy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1d87000 (qcom,sm8450-qmp-uf=
s-phy): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0'=
, 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: dma-controller@1dc4000 (qcom,ba=
m-v1.7.4): iommus: [[48, 1412, 17], [48, 1416, 0], [48, 1432, 5], [48, 1434=
, 0], [48, 1439, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: /soc@0/dma-controller@1dc4000: =
failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v=
1.7.0']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
