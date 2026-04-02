Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3152253958
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 04:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775104403; cv=none; b=oE6FjyuxV/3yRAD1nlEh/W1RKqlaz6srBxxb6/WbL8L3zzflbUjxsPtxDIiDxutKiRXKRd35HitmpQ3cqtiZQzM3POIfVzjEVKF5HlVRVJPZ42x4GaHlv9LOAQjXWEW5SRrmapTXQn/eNelFMpUI0JoFlFi+Lx8Pe3L3F09BpDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775104403; c=relaxed/simple;
	bh=A5POPmqUD5PrYkWvZwKZCTitPn1usOKmDC7MpJghLj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XQobmWXvNgmSu0tHfImYiAEaxaK5OWK7f4FaKzhwf5V11zTDxitHLgyOAEJRzJdgoUSKFtyt7BogQTR3ILGKPIdKjeo9unq3mFFAdXhMY2GUliqgmz/O+lmiSU4ZaZkon7fCdt6eW/nd3Cbn1wGRN5BrRsW3x9GdvfeBG22GTKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOEhUKp4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOEhUKp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775104400; x=1806640400;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A5POPmqUD5PrYkWvZwKZCTitPn1usOKmDC7MpJghLj4=;
  b=cOEhUKp4+069xyCQOZo41pPbZ8SSsn1piZr9v8NK8HbH779BHg1Lz3by
   K7OqWQ9mxMlohaI6+CjKusQEHs21QR4rDoQWUuD/qmOhR0GJx6J9Db3+f
   GzAJ8eY5janRE5/WzwJ4U4/Nk88oeMmcFVPOTIArgARPW3l0YXQ7MgPyM
   Ap+F+Tw6QcYZOYubhlYqzGsouJnRqwQZxh+l3RkRXboi678m+I+wC1mPl
   tfgFBBSMZB46y3Z4wPcR29Y3BQQPc3MbWkuCQP0sErHj44pvnvGfBuH+t
   C+g9tg05TQ7t09xa0fmgjOxpyi5vFJoPomjrk1btrtg/JlrgB3FR14cBQ
   Q==;
X-CSE-ConnectionGUID: zSPIV65xQkazItDe0q7i+A==
X-CSE-MsgGUID: oN/6bXEFR+GUyj1hSL7v0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76036781"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76036781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 21:33:20 -0700
X-CSE-ConnectionGUID: XX2x4j5MQAmXOiNN690m6Q==
X-CSE-MsgGUID: laAvUnl7T12dWzrmm9KR1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226028675"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2026 21:33:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w89k2-000000008zZ-3kSh;
	Thu, 02 Apr 2026 04:33:14 +0000
Date: Thu, 02 Apr 2026 06:32:29 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 7733/11049]
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620):
 pinmux: False schema does not allow {'phandle': 47, 'gpio0': {'pins':
 ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'], 'function':
 ['fps-out'], 'drive-push-pull': ...
Message-ID: <202604020634.qWIkYjL2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bd0f139e5fc11182777b81cefc3893ea508544ec
commit: 4370650b6fdbb1bdc5762916ce08f6b2062c4fd1 [7733/11049] dt-bindings: =
mfd: max77620: Convert to DT schema
config: arm64-randconfig-2052-20260401 (https://download.01.org/0day-ci/arc=
hive/20260402/202604020634.qWIkYjL2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260402/202604020634.qWIkYjL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604020634.qWIkYjL2-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /pcie@1003000: faile=
d to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: tsec@54500000 (nvidi=
a,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,teg=
ra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controlle=
r@60004000: failed to match any schema with compatible: ['nvidia,tegra210-i=
ctlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77=
620): pinmux: False schema does not allow {'phandle': 47, 'gpio0': {'pins':=
 ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'], 'function':=
 ['fps-out'], 'drive-push-pull': 1, 'maxim,active-fps-source': [0], 'maxim,=
active-fps-power-up-slot': [7], 'maxim,active-fps-power-down-slot': [0]}, '=
gpio2_3': {'pins': ['gpio2', 'gpio3'], 'function': ['fps-out'], 'drive-open=
-drain': 1, 'maxim,active-fps-source': [0]}, 'gpio4': {'pins': ['gpio4'], '=
function': ['32k-out1']}, 'gpio5_6_7': {'pins': ['gpio5', 'gpio6', 'gpio7']=
, 'function': ['gpio'], 'drive-push-pull': 1}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77=
620): regulators: False schema does not allow {'in-ldo0-1-supply': [[48]], =
'in-ldo7-8-supply': [[48]], 'in-sd3-supply': [[49]], 'sd0': {'regulator-nam=
e': ['VDD_SOC'], 'regulator-min-microvolt': [[600000]], 'regulator-max-micr=
ovolt': [[1400000]], 'regulator-always-on': True, 'regulator-boot-on': True=
, 'regulator-enable-ramp-delay': 146, 'regulator-ramp-delay': 27500, 'maxim=
,active-fps-source': [1], 'phandle': 332}, 'sd1': {'regulator-name': ['VDD_=
DDR_1V1_PMIC'], 'regulator-always-on': True, 'regulator-boot-on': True, 're=
gulator-enable-ramp-delay': 130, 'regulator-ramp-delay': 27500, 'maxim,acti=
ve-fps-source': [0], 'phandle': 333}, 'sd2': {'regulator-name': ['VDD_PRE_R=
EG_1V35'], 'regulator-min-microvolt': [[1350000]], 'regulator-max-microvolt=
': [[1350000]], 'regulator-enable-ramp-delay': 176, 'regulator-ramp-delay':=
 27500, 'maxim,active-fps-source': [1], 'phandle': 48}, 'sd3': {'regulator-=
name': ['VDD_1V8'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-=
microvolt': [[1800000]], 'regulator-always-on': True, 'regulator-boot-on': =
True, 'regulator-enable-ramp-delay': 242, 'regulator-ramp-delay': 27500, 'm=
axim,active-fps-source': [0], 'phandle': 6}, 'ldo0': {'regulator-name': ['A=
VDD_SYS_1V2'], 'regulator-min-microvolt': [[1200000]], 'regulator-max-micro=
volt': [[1200000]], 'regulator-always-on': True, 'regulator-boot-on': True,=
 'regulator-enable-ramp-delay': 26, 'regulator-ramp-delay': 100000, 'maxim,=
active-fps-source': [3], 'phandle': 321}, 'ldo1': {'regulator-name': ['VDD_=
PEX_1V05'], 'regulator-min-microvolt': [[1050000]], 'regulator-max-microvol=
t': [[1050000]], 'regulator-enable-ramp-delay': 22, 'regulator-ramp-delay':=
 100000, 'maxim,active-fps-source': [1], 'phandle': 7}, 'ldo2': {'regulator=
-name': ['VDDIO_SDMMC'], 'regulator-min-microvolt': [[1800000]], 'regulator=
-max-microvolt': [[3300000]], 'regulator-always-on': True, 'regulator-boot-=
on': True, 'regulator-enable-ramp-delay': 62, 'regulator-ramp-delay': 10000=
0, 'maxim,active-fps-source': [3], 'phandle': 71}, 'ldo3': {'regulator-name=
': ['VDD_CAM_HV'], 'regulator-min-microvolt': [[2800000]], 'regulator-max-m=
icrovolt': [[2800000]], 'regulator-enable-ramp-delay': 50, 'regulator-ramp-=
delay': 100000, 'maxim,active-fps-source': [3], 'phandle': 334}, 'ldo4': {'=
regulator-name': ['VDD_RTC'], 'regulator-min-microvolt': [[850000]], 'regul=
ator-max-microvolt': [[850000]], 'regulator-always-on': True, 'regulator-bo=
ot-on': True, 'regulator-enable-ramp-delay': 22, 'regulator-ramp-delay': 10=
0000, 'maxim,active-fps-source': [0], 'phandle': 335}, 'ldo5': {'regulator-=
name': ['VDD_TS_HV'], 'regulator-min-microvolt': [[3300000]], 'regulator-ma=
x-microvolt': [[3300000]], 'regulator-enable-ramp-delay': 62, 'regulator-ra=
mp-delay': 100000, 'maxim,active-fps-source': [3], 'phandle': 336}, 'ldo6':=
 {'regulator-name': ['VDD_TS_1V8'], 'regulator-min-microvolt': [[1800000]],=
 'regulator-max-microvolt': [[1800000]], 'regulator-enable-ramp-delay': 36,=
 'regulator-ramp-delay': 100000, 'maxim,active-fps-source': [0], 'maxim,act=
ive-fps-power-up-slot': [7], 'maxim,active-fps-power-down-slot': [0], 'phan=
dle': 337}, 'ldo7': {'regulator-name': ['AVDD_1V05_PLL'], 'regulator-min-mi=
crovolt': [[1050000]], 'regulator-max-microvolt': [[1050000]], 'regulator-a=
lways-on': True, 'regulator-boot-on': True, 'regulator-enable-ramp-delay': =
24, 'regulator-ramp-delay': 100000, 'maxim,active-fps-source': [1], 'phandl=
e': 62}, 'ldo8': {'regulator-name': ['AVDD_SATA_HDMI_DP_1V05'], 'regulator-=
min-microvolt': [[1050000]], 'regulator-max-microvolt': [[1050000]], 'regul=
ator-enable-ramp-delay': 22, 'regulator-ramp-delay': 100000, 'maxim,active-=
fps-source': [1], 'phandle': 35}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /memory-controller@7=
0019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: external-memory-cont=
roller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any =
of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /clock@70110000: fai=
led to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: usb-phy@7d000000 (nv=
idia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nv=
idia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvi=
dia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-p=
hy.yaml
--
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: faile=
d to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: tsec@54500000 (nvidi=
a,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,teg=
ra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controlle=
r@60004000: failed to match any schema with compatible: ['nvidia,tegra210-i=
ctlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77=
620): pinmux: False schema does not allow {'phandle': 43, 'gpio0': {'pins':=
 ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'], 'function':=
 ['fps-out'], 'drive-push-pull': 1, 'maxim,active-fps-source': [3], 'maxim,=
active-fps-power-up-slot': [0], 'maxim,active-fps-power-down-slot': [7]}, '=
gpio2': {'pins': ['gpio2'], 'function': ['fps-out'], 'drive-open-drain': 1,=
 'maxim,active-fps-source': [0], 'maxim,active-fps-power-up-slot': [0], 'ma=
xim,active-fps-power-down-slot': [7]}, 'gpio3': {'pins': ['gpio3'], 'functi=
on': ['fps-out'], 'drive-open-drain': 1, 'maxim,active-fps-source': [0], 'm=
axim,active-fps-power-up-slot': [4], 'maxim,active-fps-power-down-slot': [3=
]}, 'gpio4': {'pins': ['gpio4'], 'function': ['32k-out1']}, 'gpio5_6_7': {'=
pins': ['gpio5', 'gpio6', 'gpio7'], 'function': ['gpio'], 'drive-push-pull'=
: 1}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77=
620): regulators: False schema does not allow {'in-ldo0-1-supply': [[44]], =
'in-ldo2-supply': [[45]], 'in-ldo3-5-supply': [[6]], 'in-ldo4-6-supply': [[=
46]], 'in-ldo7-8-supply': [[44]], 'in-sd0-supply': [[46]], 'in-sd1-supply':=
 [[46]], 'in-sd2-supply': [[46]], 'in-sd3-supply': [[46]], 'sd0': {'regulat=
or-name': ['VDD_SOC'], 'regulator-min-microvolt': [[1000000]], 'regulator-m=
ax-microvolt': [[1170000]], 'regulator-enable-ramp-delay': 146, 'regulator-=
ramp-delay': 27500, 'regulator-always-on': True, 'regulator-boot-on': True,=
 'maxim,active-fps-source': [1], 'maxim,active-fps-power-up-slot': [1], 'ma=
xim,active-fps-power-down-slot': [6], 'phandle': 304}, 'sd1': {'regulator-n=
ame': ['VDD_DDR_1V1_PMIC'], 'regulator-min-microvolt': [[1150000]], 'regula=
tor-max-microvolt': [[1150000]], 'regulator-enable-ramp-delay': 176, 'regul=
ator-ramp-delay': 27500, 'regulator-always-on': True, 'regulator-boot-on': =
True, 'maxim,active-fps-source': [0], 'maxim,active-fps-power-up-slot': [5]=
, 'maxim,active-fps-power-down-slot': [2], 'phandle': 305}, 'sd2': {'regula=
tor-name': ['VDD_PRE_REG_1V35'], 'regulator-min-microvolt': [[1350000]], 'r=
egulator-max-microvolt': [[1350000]], 'regulator-enable-ramp-delay': 176, '=
regulator-ramp-delay': 27500, 'regulator-always-on': True, 'regulator-boot-=
on': True, 'maxim,active-fps-source': [1], 'maxim,active-fps-power-up-slot'=
: [2], 'maxim,active-fps-power-down-slot': [5], 'phandle': 44}, 'sd3': {'re=
gulator-name': ['VDD_1V8'], 'regulator-min-microvolt': [[1800000]], 'regula=
tor-max-microvolt': [[1800000]], 'regulator-enable-ramp-delay': 242, 'regul=
ator-ramp-delay': 27500, 'regulator-always-on': True, 'regulator-boot-on': =
True, 'maxim,active-fps-source': [0], 'maxim,active-fps-power-up-slot': [3]=
, 'maxim,active-fps-power-down-slot': [4], 'phandle': 6}, 'ldo0': {'regulat=
or-name': ['AVDD_SYS_1V2'], 'regulator-min-microvolt': [[1200000]], 'regula=
tor-max-microvolt': [[1200000]], 'regulator-enable-ramp-delay': 26, 'regula=
tor-ramp-delay': 100000, 'regulator-always-on': True, 'regulator-boot-on': =
True, 'maxim,active-fps-source': [3], 'maxim,active-fps-power-up-slot': [0]=
, 'maxim,active-fps-power-down-slot': [7], 'phandle': 16}, 'ldo1': {'regula=
tor-name': ['VDD_PEX_1V05'], 'regulator-min-microvolt': [[1050000]], 'regul=
ator-max-microvolt': [[1050000]], 'regulator-enable-ramp-delay': 22, 'regul=
ator-ramp-delay': 100000, 'maxim,active-fps-source': [3], 'maxim,active-fps=
-power-up-slot': [0], 'maxim,active-fps-power-down-slot': [7], 'phandle': 7=
}, 'ldo2': {'regulator-name': ['VDDIO_SDMMC'], 'regulator-min-microvolt': [=
[1800000]], 'regulator-max-microvolt': [[3300000]], 'regulator-enable-ramp-=
delay': 62, 'regulator-ramp-delay': 100000, 'maxim,active-fps-source': [3],=
 'maxim,active-fps-power-up-slot': [0], 'maxim,active-fps-power-down-slot':=
 [7], 'phandle': 62}, 'ldo3': {'status': ['disabled']}, 'ldo4': {'regulator=
-name': ['VDD_RTC'], 'regulator-min-microvolt': [[850000]], 'regulator-max-=
microvolt': [[1100000]], 'regulator-enable-ramp-delay': 22, 'regulator-ramp=
-delay': 100000, 'regulator-disable-active-discharge': True, 'regulator-alw=
ays-on': True, 'regulator-boot-on': True, 'maxim,active-fps-source': [0], '=
maxim,active-fps-power-up-slot': [1], 'maxim,active-fps-power-down-slot': [=
6], 'phandle': 306}, 'ldo5': {'status': ['disabled']}, 'ldo6': {'status': [=
'disabled']}, 'ldo7': {'regulator-name': ['AVDD_1V05_PLL'], 'regulator-min-=
microvolt': [[1050000]], 'regulator-max-microvolt': [[1050000]], 'regulator=
-enable-ramp-delay': 24, 'regulator-ramp-delay': 100000, 'maxim,active-fps-=
source': [1], 'maxim,active-fps-power-up-slot': [3], 'maxim,active-fps-powe=
r-down-slot': [4], 'phandle': 297}, 'ldo8': {'regulator-name': ['AVDD_SATA_=
HDMI_DP_1V05'], 'regulator-min-microvolt': [[1050000]], 'regulator-max-micr=
ovolt': [[1050000]], 'regulator-enable-ramp-delay': 22, 'regulator-ramp-del=
ay': 100000, 'maxim,active-fps-source': [1], 'maxim,active-fps-power-up-slo=
t': [6], 'maxim,active-fps-power-down-slot': [1], 'phandle': 34}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /memory-controller@7=
0019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: external-memory-cont=
roller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any =
of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /clock@70110000: fai=
led to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: usb-phy@7d000000 (nv=
idia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nv=
idia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvi=
dia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-p=
hy.yaml
--
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /pcie@1003000: faile=
d to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: tsec@54500000 (nvidi=
a,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,teg=
ra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /interrupt-controlle=
r@60004000: failed to match any schema with compatible: ['nvidia,tegra210-i=
ctlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77=
620): pinmux: False schema does not allow {'phandle': 43, 'gpio0': {'pins':=
 ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'], 'function':=
 ['fps-out'], 'drive-push-pull': 1, 'maxim,active-fps-source': [3], 'maxim,=
active-fps-power-up-slot': [0], 'maxim,active-fps-power-down-slot': [7]}, '=
gpio2': {'pins': ['gpio2'], 'function': ['fps-out'], 'drive-open-drain': 1,=
 'maxim,active-fps-source': [0], 'maxim,active-fps-power-up-slot': [0], 'ma=
xim,active-fps-power-down-slot': [7]}, 'gpio3': {'pins': ['gpio3'], 'functi=
on': ['fps-out'], 'drive-open-drain': 1, 'maxim,active-fps-source': [0], 'm=
axim,active-fps-power-up-slot': [4], 'maxim,active-fps-power-down-slot': [3=
]}, 'gpio4': {'pins': ['gpio4'], 'function': ['32k-out1']}, 'gpio5_6_7': {'=
pins': ['gpio5', 'gpio6', 'gpio7'], 'function': ['gpio'], 'drive-push-pull'=
: 1}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77=
620): regulators: False schema does not allow {'in-ldo0-1-supply': [[44]], =
'in-ldo2-supply': [[45]], 'in-ldo3-5-supply': [[6]], 'in-ldo4-6-supply': [[=
46]], 'in-ldo7-8-supply': [[44]], 'in-sd0-supply': [[46]], 'in-sd1-supply':=
 [[46]], 'in-sd2-supply': [[46]], 'in-sd3-supply': [[46]], 'sd0': {'regulat=
or-name': ['VDD_SOC'], 'regulator-min-microvolt': [[1000000]], 'regulator-m=
ax-microvolt': [[1170000]], 'regulator-enable-ramp-delay': 146, 'regulator-=
ramp-delay': 27500, 'regulator-always-on': True, 'regulator-boot-on': True,=
 'maxim,active-fps-source': [1], 'maxim,active-fps-power-up-slot': [1], 'ma=
xim,active-fps-power-down-slot': [6], 'phandle': 304}, 'sd1': {'regulator-n=
ame': ['VDD_DDR_1V1_PMIC'], 'regulator-min-microvolt': [[1150000]], 'regula=
tor-max-microvolt': [[1150000]], 'regulator-enable-ramp-delay': 176, 'regul=
ator-ramp-delay': 27500, 'regulator-always-on': True, 'regulator-boot-on': =
True, 'maxim,active-fps-source': [0], 'maxim,active-fps-power-up-slot': [5]=
, 'maxim,active-fps-power-down-slot': [2], 'phandle': 305}, 'sd2': {'regula=
tor-name': ['VDD_PRE_REG_1V35'], 'regulator-min-microvolt': [[1350000]], 'r=
egulator-max-microvolt': [[1350000]], 'regulator-enable-ramp-delay': 176, '=
regulator-ramp-delay': 27500, 'regulator-always-on': True, 'regulator-boot-=
on': True, 'maxim,active-fps-source': [1], 'maxim,active-fps-power-up-slot'=
: [2], 'maxim,active-fps-power-down-slot': [5], 'phandle': 44}, 'sd3': {'re=
gulator-name': ['VDD_1V8'], 'regulator-min-microvolt': [[1800000]], 'regula=
tor-max-microvolt': [[1800000]], 'regulator-enable-ramp-delay': 242, 'regul=
ator-ramp-delay': 27500, 'regulator-always-on': True, 'regulator-boot-on': =
True, 'maxim,active-fps-source': [0], 'maxim,active-fps-power-up-slot': [3]=
, 'maxim,active-fps-power-down-slot': [4], 'phandle': 6}, 'ldo0': {'regulat=
or-name': ['AVDD_SYS_1V2'], 'regulator-min-microvolt': [[1200000]], 'regula=
tor-max-microvolt': [[1200000]], 'regulator-enable-ramp-delay': 26, 'regula=
tor-ramp-delay': 100000, 'regulator-always-on': True, 'regulator-boot-on': =
True, 'maxim,active-fps-source': [3], 'maxim,active-fps-power-up-slot': [0]=
, 'maxim,active-fps-power-down-slot': [7], 'phandle': 16}, 'ldo1': {'regula=
tor-name': ['VDD_PEX_1V05'], 'regulator-min-microvolt': [[1050000]], 'regul=
ator-max-microvolt': [[1050000]], 'regulator-enable-ramp-delay': 22, 'regul=
ator-ramp-delay': 100000, 'maxim,active-fps-source': [3], 'maxim,active-fps=
-power-up-slot': [0], 'maxim,active-fps-power-down-slot': [7], 'phandle': 7=
}, 'ldo2': {'regulator-name': ['VDDIO_SDMMC'], 'regulator-min-microvolt': [=
[1800000]], 'regulator-max-microvolt': [[3300000]], 'regulator-enable-ramp-=
delay': 62, 'regulator-ramp-delay': 100000, 'maxim,active-fps-source': [3],=
 'maxim,active-fps-power-up-slot': [0], 'maxim,active-fps-power-down-slot':=
 [7], 'phandle': 62}, 'ldo3': {'status': ['disabled']}, 'ldo4': {'regulator=
-name': ['VDD_RTC'], 'regulator-min-microvolt': [[850000]], 'regulator-max-=
microvolt': [[1100000]], 'regulator-enable-ramp-delay': 22, 'regulator-ramp=
-delay': 100000, 'regulator-disable-active-discharge': True, 'regulator-alw=
ays-on': True, 'regulator-boot-on': True, 'maxim,active-fps-source': [0], '=
maxim,active-fps-power-up-slot': [1], 'maxim,active-fps-power-down-slot': [=
6], 'phandle': 306}, 'ldo5': {'status': ['disabled']}, 'ldo6': {'status': [=
'disabled']}, 'ldo7': {'regulator-name': ['AVDD_1V05_PLL'], 'regulator-min-=
microvolt': [[1050000]], 'regulator-max-microvolt': [[1050000]], 'regulator=
-enable-ramp-delay': 24, 'regulator-ramp-delay': 100000, 'maxim,active-fps-=
source': [1], 'maxim,active-fps-power-up-slot': [3], 'maxim,active-fps-powe=
r-down-slot': [4], 'phandle': 297}, 'ldo8': {'regulator-name': ['AVDD_SATA_=
HDMI_DP_1V05'], 'regulator-min-microvolt': [[1050000]], 'regulator-max-micr=
ovolt': [[1050000]], 'regulator-enable-ramp-delay': 22, 'regulator-ramp-del=
ay': 100000, 'maxim,active-fps-source': [1], 'maxim,active-fps-power-up-slo=
t': [6], 'maxim,active-fps-power-down-slot': [1], 'phandle': 34}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /memory-controller@7=
0019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: external-memory-cont=
roller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any =
of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /clock@70110000: fai=
led to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d000000 (nv=
idia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nv=
idia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvi=
dia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-p=
hy.yaml
--
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any sc=
hema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,sm=
aug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', '=
google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any sc=
hema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,sm=
aug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', '=
google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any sc=
hema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,sm=
aug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', '=
google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any sc=
hema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,sm=
aug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', '=
google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any sc=
hema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,sm=
aug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', '=
google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any sc=
hema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,sm=
aug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', '=
google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /pcie@1003000: failed to =
match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: tsec@54500000 (nvidia,teg=
ra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,teg=
ra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@600=
04000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620):=
 pinmux: False schema does not allow {'phandle': 40, 'gpio0_1_2_7': {'pins'=
: ['gpio0', 'gpio1', 'gpio2', 'gpio7'], 'function': ['gpio']}, 'gpio3': {'p=
ins': ['gpio3'], 'function': ['fps-out'], 'drive-open-drain': 1, 'maxim,act=
ive-fps-source': [0], 'maxim,active-fps-power-up-slot': [4], 'maxim,active-=
fps-power-down-slot': [2]}, 'gpio4': {'pins': ['gpio4'], 'function': ['32k-=
out1']}, 'gpio5_6': {'pins': ['gpio5', 'gpio6'], 'function': ['gpio'], 'dri=
ve-push-pull': 1}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620):=
 regulators: False schema does not allow {'in-ldo0-1-supply': [[41]], 'in-l=
do2-supply': [[8]], 'in-ldo3-5-supply': [[8]], 'in-ldo7-8-supply': [[41]], =
'sd0': {'regulator-name': ['PPVAR_SOC'], 'regulator-min-microvolt': [[82500=
0]], 'regulator-max-microvolt': [[1125000]], 'regulator-always-on': True, '=
regulator-boot-on': True, 'maxim,active-fps-source': [1], 'maxim,active-fps=
-power-up-slot': [1], 'maxim,active-fps-power-down-slot': [7]}, 'sd1': {'re=
gulator-name': ['PP1100'], 'regulator-min-microvolt': [[1125000]], 'regulat=
or-max-microvolt': [[1125000]], 'regulator-always-on': True, 'regulator-boo=
t-on': True, 'maxim,active-fps-source': [0], 'maxim,active-fps-power-up-slo=
t': [5], 'maxim,active-fps-power-down-slot': [1]}, 'sd2': {'regulator-name'=
: ['PP1350'], 'regulator-min-microvolt': [[1350000]], 'regulator-max-microv=
olt': [[1350000]], 'regulator-always-on': True, 'regulator-boot-on': True, =
'maxim,active-fps-source': [3], 'maxim,active-fps-power-up-slot': [2], 'max=
im,active-fps-power-down-slot': [5], 'phandle': 41}, 'sd3': {'regulator-nam=
e': ['PP1800'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-micr=
ovolt': [[1800000]], 'regulator-always-on': True, 'regulator-boot-on': True=
, 'maxim,active-fps-source': [0], 'maxim,active-fps-power-up-slot': [3], 'm=
axim,active-fps-power-down-slot': [3], 'phandle': 31}, 'ldo0': {'regulator-=
name': ['PP1200_AVDD'], 'regulator-min-microvolt': [[1200000]], 'regulator-=
max-microvolt': [[1200000]], 'regulator-enable-ramp-delay': 26, 'regulator-=
ramp-delay': 100000, 'regulator-boot-on': True, 'maxim,active-fps-source': =
[3], 'maxim,active-fps-power-up-slot': [0], 'maxim,active-fps-power-down-sl=
ot': [7], 'phandle': 102}, 'ldo1': {'regulator-name': ['PP1200_RCAM'], 'reg=
ulator-min-microvolt': [[1200000]], 'regulator-max-microvolt': [[1200000]],=
 'regulator-enable-ramp-delay': 22, 'regulator-ramp-delay': 100000, 'maxim,=
active-fps-source': [3], 'maxim,active-fps-power-up-slot': [0], 'maxim,acti=
ve-fps-power-down-slot': [7]}, 'ldo2': {'regulator-name': ['PP_LDO2'], 'reg=
ulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]],=
 'regulator-enable-ramp-delay': 62, 'regulator-ramp-delay': 11000, 'regulat=
or-always-on': True, 'regulator-boot-on': True, 'maxim,active-fps-source': =
[3], 'maxim,active-fps-power-up-slot': [0], 'maxim,active-fps-power-down-sl=
ot': [7]}, 'ldo3': {'regulator-name': ['PP2800L_RCAM'], 'regulator-min-micr=
ovolt': [[2800000]], 'regulator-max-microvolt': [[2800000]], 'regulator-ena=
ble-ramp-delay': 50, 'regulator-ramp-delay': 100000, 'maxim,active-fps-sour=
ce': [3], 'maxim,active-fps-power-up-slot': [0], 'maxim,active-fps-power-do=
wn-slot': [7]}, 'ldo4': {'regulator-name': ['PP1100_SOC_RTC'], 'regulator-m=
in-microvolt': [[850000]], 'regulator-max-microvolt': [[850000]], 'regulato=
r-enable-ramp-delay': 22, 'regulator-ramp-delay': 100000, 'regulator-always=
-on': True, 'regulator-boot-on': True, 'maxim,active-fps-source': [0], 'max=
im,active-fps-power-up-slot': [1], 'maxim,active-fps-power-down-slot': [7]}=
, 'ldo5': {'regulator-name': ['PP2800L_FCAM'], 'regulator-min-microvolt': [=
[2800000]], 'regulator-max-microvolt': [[2800000]], 'regulator-enable-ramp-=
delay': 62, 'regulator-ramp-delay': 100000, 'maxim,active-fps-source': [3],=
 'maxim,active-fps-power-up-slot': [0], 'maxim,active-fps-power-down-slot':=
 [7]}, 'ldo6': {'regulator-name': ['PP_LDO6'], 'regulator-min-microvolt': [=
[1800000]], 'regulator-max-microvolt': [[1800000]], 'regulator-enable-ramp-=
delay': 36, 'regulator-ramp-delay': 100000, 'maxim,active-fps-source': [3],=
 'maxim,active-fps-power-up-slot': [0], 'maxim,active-fps-power-down-slot':=
 [7]}, 'ldo7': {'regulator-name': ['PP1050_AVDD'], 'regulator-min-microvolt=
': [[1050000]], 'regulator-max-microvolt': [[1050000]], 'regulator-enable-r=
amp-delay': 24, 'regulator-ramp-delay': 100000, 'regulator-always-on': True=
, 'regulator-boot-on': True, 'maxim,active-fps-source': [1], 'maxim,active-=
fps-power-up-slot': [3], 'maxim,active-fps-power-down-slot': [4], 'phandle'=
: 50}, 'ldo8': {'regulator-name': ['AVDDIO_1V05'], 'regulator-min-microvolt=
': [[1050000]], 'regulator-max-microvolt': [[1050000]], 'regulator-enable-r=
amp-delay': 22, 'regulator-ramp-delay': 100000, 'regulator-boot-on': True, =
'maxim,active-fps-source': [3], 'maxim,active-fps-power-up-slot': [0], 'max=
im,active-fps-power-down-slot': [7], 'phandle': 32}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /memory-controller@700190=
00: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: external-memory-controlle=
r@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of th=
e regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,t=
egra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb=
-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,t=
egra210-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-rol=
e-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb=
-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /clock@70110000: failed t=
o match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d000000 (nvidia,=
tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixe=
d:
--
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): 'max77620-hog' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): fps: '#address-cells', '#size-cells' do not match any of the rege=
xes: '^fps[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): fps:fps0: 'reg' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): fps:fps1: 'reg' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): fps:fps2: 'reg' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): pinmux: False schema does not allow {'phandle': 28, 'gpio0': {'pi=
ns': ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'], 'functi=
on': ['fps-out'], 'drive-push-pull': 1, 'maxim,active-fps-source': [0], 'ma=
xim,active-fps-power-up-slot': [7], 'maxim,active-fps-power-down-slot': [0]=
}, 'gpio2': {'pins': ['gpio2'], 'function': ['fps-out'], 'drive-open-drain'=
: 1, 'maxim,active-fps-source': [0]}, 'gpio3': {'pins': ['gpio3'], 'functio=
n': ['fps-out'], 'drive-open-drain': 1, 'maxim,active-fps-source': [0]}, 'g=
pio4': {'pins': ['gpio4'], 'function': ['32k-out1']}, 'gpio5_6_7': {'pins':=
 ['gpio5', 'gpio6', 'gpio7'], 'function': ['gpio'], 'drive-push-pull': 1}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): regulators: False schema does not allow {'in-ldo0-1-supply': [[29=
]], 'in-ldo7-8-supply': [[29]], 'sd0': {'regulator-name': ['vdd-core'], 're=
gulator-enable-ramp-delay': 146, 'regulator-min-microvolt': [[600000]], 're=
gulator-max-microvolt': [[1400000]], 'regulator-ramp-delay': 27500, 'regula=
tor-always-on': True, 'regulator-boot-on': True, 'maxim,active-fps-power-up=
-slot': [0], 'maxim,active-fps-source': [1]}, 'sd1': {'regulator-name': ['v=
ddio-ddr'], 'regulator-enable-ramp-delay': 130, 'regulator-ramp-delay': 275=
00, 'regulator-always-on': True, 'regulator-boot-on': True, 'maxim,active-f=
ps-source': [0]}, 'sd2': {'regulator-name': ['vdd-pre-reg'], 'regulator-ena=
ble-ramp-delay': 176, 'regulator-min-microvolt': [[3000000]], 'regulator-ma=
x-microvolt': [[3000000]], 'regulator-ramp-delay': 27500, 'regulator-always=
-on': True, 'regulator-boot-on': True, 'maxim,active-fps-source': [1], 'max=
im,suspend-fps-source': [3], 'phandle': 29}, 'sd3': {'regulator-name': ['vd=
d-1v8'], 'regulator-enable-ramp-delay': 242, 'regulator-min-microvolt': [[1=
800000]], 'regulator-max-microvolt': [[1800000]], 'regulator-ramp-delay': 2=
7500, 'regulator-always-on': True, 'regulator-boot-on': True, 'maxim,active=
-fps-source': [0]}, 'ldo0': {'regulator-name': ['avdd-sys'], 'regulator-ena=
ble-ramp-delay': 26, 'regulator-min-microvolt': [[1200000]], 'regulator-max=
-microvolt': [[1200000]], 'regulator-ramp-delay': 100000, 'regulator-boot-o=
n': True, 'maxim,active-fps-source': [3], 'phandle': 87}, 'ldo1': {'regulat=
or-name': ['vdd-pex'], 'regulator-enable-ramp-delay': 22, 'regulator-min-mi=
crovolt': [[1075000]], 'regulator-max-microvolt': [[1075000]], 'regulator-r=
amp-delay': 100000, 'regulator-always-on': True, 'maxim,active-fps-source':=
 [3]}, 'ldo2': {'regulator-name': ['vddio-sdmmc3'], 'regulator-enable-ramp-=
delay': 62, 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvol=
t': [[3300000]], 'regulator-ramp-delay': 100000, 'maxim,active-fps-source':=
 [3]}, 'ldo3': {'regulator-name': ['vdd-3v3-eth'], 'regulator-enable-ramp-d=
elay': 50, 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt=
': [[3300000]], 'regulator-ramp-delay': 100000, 'regulator-always-on': True=
, 'regulator-boot-on': True, 'maxim,active-fps-source': [3]}, 'ldo4': {'reg=
ulator-name': ['vdd-rtc'], 'regulator-enable-ramp-delay': 22, 'regulator-mi=
n-microvolt': [[850000]], 'regulator-max-microvolt': [[850000]], 'regulator=
-ramp-delay': 100000, 'regulator-always-on': True, 'regulator-boot-on': Tru=
e, 'maxim,active-fps-source': [0]}, 'ldo5': {'regulator-name': ['avdd-ts-hv=
'], 'regulator-enable-ramp-delay': 62, 'regulator-min-microvolt': [[3300000=
]], 'regulator-max-microvolt': [[3300000]], 'regulator-ramp-delay': 100000,=
 'maxim,active-fps-source': [3]}, 'ldo6': {'regulator-name': ['vdd-ts'], 'r=
egulator-enable-ramp-delay': 36, 'regulator-min-microvolt': [[1800000]], 'r=
egulator-max-microvolt': [[1800000]], 'regulator-ramp-delay': 100000, 'regu=
lator-boot-on': True, 'maxim,active-fps-source': [3]}, 'ldo7': {'regulator-=
name': ['vdd-gen-pll-edp'], 'regulator-enable-ramp-delay': 24, 'regulator-m=
in-microvolt': [[1050000]], 'regulator-max-microvolt': [[1050000]], 'regula=
tor-ramp-delay': 100000, 'regulator-always-on': True, 'regulator-boot-on': =
True, 'maxim,active-fps-source': [1], 'maxim,suspend-fps-source': [3]}, 'ld=
o8': {'regulator-name': ['vdd-hdmi-dp'], 'regulator-enable-ramp-delay': 22,=
 'regulator-min-microvolt': [[1050000]], 'regulator-max-microvolt': [[10500=
00]], 'regulator-ramp-delay': 100000, 'regulator-always-on': True, 'regulat=
or-boot-on': True, 'maxim,active-fps-source': [1]}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /memory-controll=
er@70019000: failed to match any schema with compatible: ['nvidia,tegra210-=
mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: external-memory-=
controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match =
any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /clock@70110000:=
 failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: usb-phy@7d000000=
 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one mus=
t be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nv=
idia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvi=
dia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-p=
hy.yaml
--
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: f=
ailed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,d=
wc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: f=
ailed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,d=
wc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /pcie@10003000: fail=
ed to match any schema with compatible: ['nvidia,tegra186-pcie']
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77=
620): pinmux: False schema does not allow {'phandle': 279, 'gpio0': {'pins'=
: ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'], 'function'=
: ['fps-out'], 'maxim,active-fps-source': [0]}, 'gpio2': {'pins': ['gpio2']=
, 'function': ['fps-out'], 'maxim,active-fps-source': [1]}, 'gpio3': {'pins=
': ['gpio3'], 'function': ['fps-out'], 'maxim,active-fps-source': [1]}, 'gp=
io4': {'pins': ['gpio4'], 'function': ['32k-out1'], 'drive-push-pull': 1}, =
'gpio5': {'pins': ['gpio5'], 'function': ['gpio'], 'drive-push-pull': 0}, '=
gpio6': {'pins': ['gpio6'], 'function': ['gpio'], 'drive-push-pull': 1}, 'g=
pio7': {'pins': ['gpio7'], 'function': ['gpio'], 'drive-push-pull': 0}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77=
620): regulators: False schema does not allow {'in-sd0-supply': [[280]], 'i=
n-sd1-supply': [[280]], 'in-sd2-supply': [[280]], 'in-sd3-supply': [[280]],=
 'in-ldo0-1-supply': [[280]], 'in-ldo2-supply': [[280]], 'in-ldo3-5-supply'=
: [[280]], 'in-ldo4-6-supply': [[239]], 'in-ldo7-8-supply': [[281]], 'sd0':=
 {'regulator-name': ['VDD_DDR_1V1_PMIC'], 'regulator-min-microvolt': [[1100=
000]], 'regulator-max-microvolt': [[1100000]], 'regulator-always-on': True,=
 'regulator-boot-on': True}, 'sd1': {'regulator-name': ['AVDD_DSI_CSI_1V2']=
, 'regulator-min-microvolt': [[1200000]], 'regulator-max-microvolt': [[1200=
000]], 'phandle': 281}, 'sd2': {'regulator-name': ['VDD_1V8'], 'regulator-m=
in-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]], 'phandl=
e': 239}, 'sd3': {'regulator-name': ['VDD_3V3_SYS'], 'regulator-min-microvo=
lt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'phandle': 238}, =
'ldo0': {'regulator-name': ['VDD_1V8_AP_PLL'], 'regulator-min-microvolt': [=
[1800000]], 'regulator-max-microvolt': [[1800000]], 'phandle': 254}, 'ldo2'=
: {'regulator-name': ['VDDIO_3V3_AOHV'], 'regulator-min-microvolt': [[33000=
00]], 'regulator-max-microvolt': [[3300000]], 'regulator-always-on': True, =
'regulator-boot-on': True}, 'ldo3': {'regulator-name': ['VDDIO_SDMMC1_AP'],=
 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[33000=
00]], 'phandle': 246}, 'ldo4': {'regulator-name': ['VDD_RTC'], 'regulator-m=
in-microvolt': [[1000000]], 'regulator-max-microvolt': [[1000000]]}, 'ldo5'=
: {'regulator-name': ['VDDIO_SDMMC3_AP'], 'regulator-min-microvolt': [[2800=
000]], 'regulator-max-microvolt': [[2800000]], 'phandle': 252}, 'ldo7': {'r=
egulator-name': ['VDD_HDMI_1V05'], 'regulator-min-microvolt': [[1050000]], =
'regulator-max-microvolt': [[1050000]], 'phandle': 271}, 'ldo8': {'regulato=
r-name': ['VDD_PEX_1V05'], 'regulator-min-microvolt': [[1050000]], 'regulat=
or-max-microvolt': [[1050000]], 'phandle': 266}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
--
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet=
@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqo=
s', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet=
@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqo=
s', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /pcie@100=
03000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (=
maxim,max77620): pinmux: False schema does not allow {'phandle': 98, 'gpio0=
': {'pins': ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'], =
'function': ['fps-out'], 'maxim,active-fps-source': [0]}, 'gpio2': {'pins':=
 ['gpio2'], 'function': ['fps-out'], 'maxim,active-fps-source': [1]}, 'gpio=
3': {'pins': ['gpio3'], 'function': ['fps-out'], 'maxim,active-fps-source':=
 [1]}, 'gpio4': {'pins': ['gpio4'], 'function': ['32k-out1'], 'drive-push-p=
ull': 1}, 'gpio5': {'pins': ['gpio5'], 'function': ['gpio'], 'drive-push-pu=
ll': 0}, 'gpio6': {'pins': ['gpio6'], 'function': ['gpio'], 'drive-push-pul=
l': 1}, 'gpio7': {'pins': ['gpio7'], 'function': ['gpio'], 'drive-push-pull=
': 1}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (=
maxim,max77620): regulators: False schema does not allow {'in-sd0-supply': =
[[75]], 'in-sd1-supply': [[75]], 'in-sd2-supply': [[75]], 'in-sd3-supply': =
[[75]], 'in-ldo0-1-supply': [[75]], 'in-ldo2-supply': [[75]], 'in-ldo3-5-su=
pply': [[75]], 'in-ldo4-6-supply': [[73]], 'in-ldo7-8-supply': [[99]], 'sd0=
': {'regulator-name': ['VDD_DDR_1V1_PMIC'], 'regulator-min-microvolt': [[11=
00000]], 'regulator-max-microvolt': [[1100000]], 'regulator-always-on': Tru=
e, 'regulator-boot-on': True}, 'sd1': {'regulator-name': ['AVDD_DSI_CSI_1V2=
'], 'regulator-min-microvolt': [[1200000]], 'regulator-max-microvolt': [[12=
00000]], 'phandle': 99}, 'sd2': {'regulator-name': ['VDD_1V8'], 'regulator-=
min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]], 'phand=
le': 73}, 'sd3': {'regulator-name': ['VDD_3V3_SYS'], 'regulator-min-microvo=
lt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'phandle': 71}, '=
ldo0': {'regulator-name': ['VDD_1V8_AP_PLL'], 'regulator-min-microvolt': [[=
1800000]], 'regulator-max-microvolt': [[1800000]], 'phandle': 72}, 'ldo2': =
{'regulator-name': ['VDDIO_3V3_AOHV'], 'regulator-min-microvolt': [[3300000=
]], 'regulator-max-microvolt': [[3300000]], 'regulator-always-on': True, 'r=
egulator-boot-on': True}, 'ldo3': {'regulator-name': ['VDDIO_SDMMC1_AP'], '=
regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[3300000=
]], 'phandle': 210}, 'ldo4': {'regulator-name': ['VDD_RTC'], 'regulator-min=
-microvolt': [[1000000]], 'regulator-max-microvolt': [[1000000]]}, 'ldo5': =
{'regulator-name': ['VDDIO_SDMMC3_AP'], 'regulator-min-microvolt': [[280000=
0]], 'regulator-max-microvolt': [[2800000]], 'phandle': 211}, 'ldo7': {'reg=
ulator-name': ['VDD_HDMI_1V05'], 'regulator-min-microvolt': [[1050000]], 'r=
egulator-max-microvolt': [[1050000]], 'phandle': 90}, 'ldo8': {'regulator-n=
ame': ['VDD_PEX_1V05'], 'regulator-min-microvolt': [[1050000]], 'regulator-=
max-microvolt': [[1050000]], 'phandle': 85}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: thermal-z=
ones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'c=
pu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml
--
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490=
000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', '=
nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490=
000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', '=
nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490=
000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', '=
nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: padctl@3520000 (nvid=
ia,tegra194-xusb-padctl): ports:usb2-0: 'port' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb=
-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: padctl@3520000 (nvid=
ia,tegra194-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb=
-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb=
-padctl.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: pmic@3c (maxim,max20=
024): pinmux: False schema does not allow {'phandle': 295, 'gpio0': {'pins'=
: ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'], 'function'=
: ['fps-out'], 'maxim,active-fps-source': [4]}, 'gpio2': {'pins': ['gpio2']=
, 'function': ['fps-out'], 'maxim,active-fps-source': [4]}, 'gpio3': {'pins=
': ['gpio3'], 'function': ['fps-out'], 'maxim,active-fps-source': [4]}, 'gp=
io4': {'pins': ['gpio4'], 'function': ['32k-out1'], 'drive-push-pull': 1}, =
'gpio6': {'pins': ['gpio6'], 'function': ['gpio'], 'drive-push-pull': 1}, '=
gpio7': {'pins': ['gpio7'], 'function': ['gpio'], 'drive-push-pull': 0}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: pmic@3c (maxim,max20=
024): regulators: False schema does not allow {'in-sd0-supply': [[245]], 'i=
n-sd1-supply': [[245]], 'in-sd2-supply': [[245]], 'in-sd3-supply': [[245]],=
 'in-sd4-supply': [[245]], 'in-ldo0-1-supply': [[245]], 'in-ldo2-supply': [=
[245]], 'in-ldo3-5-supply': [[245]], 'in-ldo4-6-supply': [[245]], 'in-ldo7-=
8-supply': [[229]], 'sd0': {'regulator-name': ['VDDIO_SYS_1V0'], 'regulator=
-min-microvolt': [[1000000]], 'regulator-max-microvolt': [[1000000]], 'regu=
lator-always-on': True, 'regulator-boot-on': True, 'phandle': 265}, 'sd1': =
{'regulator-name': ['VDDIO_SYS_1V8HS'], 'regulator-min-microvolt': [[180000=
0]], 'regulator-max-microvolt': [[1800000]], 'regulator-always-on': True, '=
regulator-boot-on': True, 'phandle': 266}, 'sd2': {'regulator-name': ['VDDI=
O_SYS_1V8LS'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-micro=
volt': [[1800000]], 'regulator-always-on': True, 'regulator-boot-on': True,=
 'phandle': 229}, 'sd3': {'regulator-name': ['VDDIO_AO_1V8'], 'regulator-mi=
n-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]], 'regulat=
or-always-on': True, 'regulator-boot-on': True, 'phandle': 244}, 'sd4': {'r=
egulator-name': ['VDD_DDR_1V1'], 'regulator-min-microvolt': [[1100000]], 'r=
egulator-max-microvolt': [[1100000]], 'regulator-always-on': True, 'regulat=
or-boot-on': True}, 'ldo0': {'regulator-name': ['VDD_RTC'], 'regulator-min-=
microvolt': [[800000]], 'regulator-max-microvolt': [[800000]], 'regulator-a=
lways-on': True, 'regulator-boot-on': True}, 'ldo2': {'regulator-name': ['V=
DDIO_AO_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-micro=
volt': [[3300000]], 'regulator-always-on': True, 'regulator-boot-on': True}=
, 'ldo3': {'regulator-name': ['VDD_EMMC_3V3'], 'regulator-min-microvolt': [=
[3300000]], 'regulator-max-microvolt': [[3300000]], 'phandle': 242}, 'ldo5'=
: {'regulator-name': ['VDD_USB_3V3'], 'regulator-min-microvolt': [[3300000]=
], 'regulator-max-microvolt': [[3300000]], 'phandle': 243}, 'ldo6': {'regul=
ator-name': ['VDD_SDIO_3V3'], 'regulator-min-microvolt': [[3300000]], 'regu=
lator-max-microvolt': [[3300000]]}, 'ldo7': {'regulator-name': ['AVDD_CSI_1=
V2'], 'regulator-min-microvolt': [[1200000]], 'regulator-max-microvolt': [[=
1200000]]}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: thermal-zones: cpu-t=
hermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive'=
 do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml
--
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/et=
hernet@2490000: failed to match any schema with compatible: ['nvidia,tegra1=
94-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/et=
hernet@2490000: failed to match any schema with compatible: ['nvidia,tegra1=
94-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/et=
hernet@2490000: failed to match any schema with compatible: ['nvidia,tegra1=
94-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: pmic@3c (=
maxim,max20024): pinmux: False schema does not allow {'phandle': 285, 'gpio=
0': {'pins': ['gpio0'], 'function': ['gpio']}, 'gpio1': {'pins': ['gpio1'],=
 'function': ['fps-out'], 'maxim,active-fps-source': [4]}, 'gpio2': {'pins'=
: ['gpio2'], 'function': ['fps-out'], 'maxim,active-fps-source': [4]}, 'gpi=
o3': {'pins': ['gpio3'], 'function': ['fps-out'], 'maxim,active-fps-source'=
: [4]}, 'gpio4': {'pins': ['gpio4'], 'function': ['32k-out1'], 'drive-push-=
pull': 1}, 'gpio6': {'pins': ['gpio6'], 'function': ['gpio'], 'drive-push-p=
ull': 1}, 'gpio7': {'pins': ['gpio7'], 'function': ['gpio'], 'drive-push-pu=
ll': 0}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: pmic@3c (=
maxim,max20024): regulators: False schema does not allow {'in-sd0-supply': =
[[249]], 'in-sd1-supply': [[249]], 'in-sd2-supply': [[249]], 'in-sd3-supply=
': [[249]], 'in-sd4-supply': [[249]], 'in-ldo0-1-supply': [[249]], 'in-ldo2=
-supply': [[249]], 'in-ldo3-5-supply': [[249]], 'in-ldo4-6-supply': [[249]]=
, 'in-ldo7-8-supply': [[232]], 'sd0': {'regulator-name': ['VDDIO_SYS_1V0'],=
 'regulator-min-microvolt': [[1000000]], 'regulator-max-microvolt': [[10000=
00]], 'regulator-always-on': True, 'regulator-boot-on': True, 'phandle': 26=
2}, 'sd1': {'regulator-name': ['VDDIO_SYS_1V8HS'], 'regulator-min-microvolt=
': [[1800000]], 'regulator-max-microvolt': [[1800000]], 'regulator-always-o=
n': True, 'regulator-boot-on': True, 'phandle': 263}, 'sd2': {'regulator-na=
me': ['VDDIO_SYS_1V8LS'], 'regulator-min-microvolt': [[1800000]], 'regulato=
r-max-microvolt': [[1800000]], 'regulator-always-on': True, 'regulator-boot=
-on': True, 'phandle': 232}, 'sd3': {'regulator-name': ['VDDIO_AO_1V8'], 'r=
egulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]=
], 'regulator-always-on': True, 'regulator-boot-on': True, 'phandle': 248},=
 'sd4': {'regulator-name': ['VDD_DDR_1V1'], 'regulator-min-microvolt': [[11=
00000]], 'regulator-max-microvolt': [[1100000]], 'regulator-always-on': Tru=
e, 'regulator-boot-on': True}, 'ldo0': {'regulator-name': ['VDD_RTC'], 'reg=
ulator-min-microvolt': [[800000]], 'regulator-max-microvolt': [[800000]], '=
regulator-always-on': True, 'regulator-boot-on': True}, 'ldo2': {'regulator=
-name': ['VDDIO_AO_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulato=
r-max-microvolt': [[3300000]], 'regulator-always-on': True, 'regulator-boot=
-on': True}, 'ldo3': {'regulator-name': ['VDD_EMMC_3V3'], 'regulator-min-mi=
crovolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'phandle': 5=
07}, 'ldo5': {'regulator-name': ['VDD_USB_3V3'], 'regulator-min-microvolt':=
 [[3300000]], 'regulator-max-microvolt': [[3300000]], 'regulator-always-on'=
: True, 'regulator-boot-on': True, 'phandle': 247}, 'ldo6': {'regulator-nam=
e': ['VDD_SDIO_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-ma=
x-microvolt': [[3300000]]}, 'ldo7': {'regulator-name': ['AVDD_CSI_1V2'], 'r=
egulator-min-microvolt': [[1200000]], 'regulator-max-microvolt': [[1200000]=
]}}
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: thermal-z=
ones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'c=
pu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
