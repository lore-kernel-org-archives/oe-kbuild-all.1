Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3738D40A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 21:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730377; cv=none; b=jb//2D0Ses0rpTA++Zn55Y60Dao+fKe5HA8UWMEGyBz6YPUKGP4O4eMs35lXomwu2N3M+tOBQG/r/gGWc17KVG6cSs7nhlvuVNk1fAoM1kSVemCgXq0C3WFwNdUy8aB7uYtEAUg78L3k0ogSQRR8Y5BTrqUr4aFudkJKRdTQ4FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730377; c=relaxed/simple;
	bh=DF6kD03Egcm74X4UG2O5RjOtArT1Hkou2vzRhF1eZj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZlvtkOJUzAxaRubZ+mBd6XZKszCEYIY4OoBXyLMwdlI26kfXUfw/WmSXbdgTiW8rSx6neBS1OfN1Z2FbLUbEKoA5n8CYAaDTEeNlKBTcUhQ42B5Hq57x0IldncuTtX17JWzK5pZPZQWS3LTdwZSsEAYo51z5sGGCbdIfUt7eU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAEidnWE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAEidnWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781730376; x=1813266376;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DF6kD03Egcm74X4UG2O5RjOtArT1Hkou2vzRhF1eZj0=;
  b=kAEidnWE+HunzUdHlYq2R+ksrK4bYIUq9I5mmKoCEde8C67moVVIue7/
   k6pSLXAoKFp+hW25a4YF21eKacBYF127y4smaWmOnn6QOmj7RbLzTr8Pz
   UDfkxRZ4vE9dr8NOf+0dMuiHdEDd/ACRu3Z/f1wmonLeYIEcOiLjhaj/9
   6AGWRQ5GbZI47HUjSpm1zfe8Z1KPEQoaZ0yCidSAs9KJ7UCT5OdmyEIyv
   6V8HBx0ASTEoSLrWEdb3pmnNJFgPrmYA/QJLfnwRkkVQbg9jxV+LZJbKR
   qEhypH/3cIVib/2u+wLOwboEmKDAcBgIQnymNprUVcH9zdPBl2wLMx8ce
   Q==;
X-CSE-ConnectionGUID: /7wRwET7RNm4UROnAgUPMQ==
X-CSE-MsgGUID: orf/uGLtTEm5uj9pDiYaIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82551976"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82551976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 14:06:16 -0700
X-CSE-ConnectionGUID: 7DCU/wT+TuiD2BgtZ0dXfw==
X-CSE-MsgGUID: y+ZI9fX2Tpau/+J2C0+dig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="278364351"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Jun 2026 14:06:13 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZxSd-000000005Mz-0p6y;
	Wed, 17 Jun 2026 21:06:11 +0000
Date: Wed, 17 Jun 2026 23:05:32 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb:
 pmic@3c (maxim,max77620): 'max77620-hog' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202606172312.ElHJom7w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
commit: 4370650b6fdbb1bdc5762916ce08f6b2062c4fd1 dt-bindings: mfd: max77620=
: Convert to DT schema
date:   3 months ago
config: arm64-randconfig-2055-20260617 (https://download.01.org/0day-ci/arc=
hive/20260617/202606172312.ElHJom7w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260617/202606172312.ElHJom7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 4370650b6fdb ("dt-bindings: mfd: max77620: Convert to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606172312.ElHJom7w-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'toradex,apalis-tk1-v1.2' was expected
   	'google,nyan-blaze-rev8' was expected
   	'google,nyan-big-rev8' was expected
   	'google,nyan-big-rev5' was expected
   	'nvidia,tegra264' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /pcie@1003000: f=
ailed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: tsec@54500000 (n=
vidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,teg=
ra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /interrupt-contr=
oller@60004000: failed to match any schema with compatible: ['nvidia,tegra2=
10-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): 'max77620-hog' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): fps: '#address-cells', '#size-cells' do not match any of the rege=
xes: '^fps[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): fps:fps0: 'reg' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): fps:fps1: 'reg' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
ax77620): fps:fps2: 'reg' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
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
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,m=
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
