Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C3C215179
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740574499; cv=none; b=e7e5FwZYqLQ3K3cFmwVKROxkX+2U/34f8aSNrVpZyZbLAETGwxp6fhp9bTdx63JQDZVmr8rAyW98dsfOpOfJpJ5yEuilPCuPN+0ky5HAbojUUpqJiRQbt1fYDpJ2nFg3S5vYNu69XhtE5+dkRlVbZzTp5HmaCmeHeXtiMZuYsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740574499; c=relaxed/simple;
	bh=ALraUWhcUsB/jIiWk18bLXScpL+Ca93NqNyTCF4cMfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXZaMk2OWc2z9BHzWscJLhE26JsZtPb3nVYI4np2HCecI42y4LW+TmADGBZ21Lr0fhw8sdp6T1FhhIDpG+f32th9eNHAJDqsWgs4t7PsjtG2klPtO5TdN/2qJX3lvnMYXyLWTPGG5KZgqRwc3KzNYMB3cwGgy8LjkSO4fNcSYjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgjZ9eq4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgjZ9eq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740574494; x=1772110494;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ALraUWhcUsB/jIiWk18bLXScpL+Ca93NqNyTCF4cMfo=;
  b=GgjZ9eq4GNw0Z8DaGG/dnkw2EYSPCnpf0UslFM+K78fDbSe3F2L3ychJ
   xiZ9PYMjVTm+gRKpLeV6AO65Drhntus71ZbzGoK78I1ktMO4CI0KUVFNg
   lMgY5GnP1oxmB0x75kFsb+llEQiSjdUUt6n3X12GJ8z4Y/CflNluIdf1P
   DJ0+Mo088zV4jw0HrUBTmaNlCXjPJNSFeEtq8jMcyYlyNU/lRilGAkX2Z
   bhH9PpVGrcuqaGafWgwJ08Q6MIQYZi5TrwjyURewICXCfkUkv+OwQtJrq
   d2gSijMizaOxcYolkqizKyElqjxemiGyoN20Y0e5ADmZi51UJ120ncZea
   g==;
X-CSE-ConnectionGUID: OPTkxZKLS1SOEN55kRmRKg==
X-CSE-MsgGUID: OoG0dPuQQ8yKLLYk/F/2nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41118311"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41118311"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:54:53 -0800
X-CSE-ConnectionGUID: WDp0ycDOTnCad/Tc552u1g==
X-CSE-MsgGUID: wJOQ0AxNQNyzT7IFDxllcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="147516290"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2025 04:54:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnGw5-000BiJ-04;
	Wed, 26 Feb 2025 12:54:49 +0000
Date: Wed, 26 Feb 2025 20:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 258/258]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /: failed to match any
 schema with compatible: ['google,rauru', 'mediatek,mt8196']
Message-ID: <202502262009.dr7JX6rn-lkp@intel.com>
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
head:   34325153a123a1ed4f4bfbc1564ec774af14290d
commit: 1a0fab95087323b8d621ea7657fc289c6a29b2d3 [258/258] CHROMIUM: arm64:=
 dts: mediatek: mt8196: rauru: Add Rauru base dts
config: arm64-randconfig-051-20250213 (https://download.01.org/0day-ci/arch=
ive/20250226/202502262009.dr7JX6rn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250226/202502262009.dr7JX6rn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502262009.dr7JX6rn-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4752.38-4759.5: Warning (simple=
_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4761.8-4766.5: Warning (simple_=
bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4768.16-4776.5: Warning (simple=
_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4778.14-4786.5: Warning (simple=
_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4788.12-4796.5: Warning (simple=
_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4798.32-5202.5: Warning (simple=
_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1151.37-1176.5: Warning (avoid_=
unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #add=
ress-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1276.25-1306.5: Warning (unique=
_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (als=
o used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1308.24-1335.5: Warning (unique=
_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (als=
o used in node /soc/skp@1056f000)
   propagate-bits: size (1) error for type uint32-array
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /: failed to match a=
ny schema with compatible: ['google,rauru', 'mediatek,mt8196']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /: failed to match a=
ny schema with compatible: ['google,rauru', 'mediatek,mt8196']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: idle-states: entry-m=
ethod:0: 'psci' was expected
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: idle-states: 'cluste=
roff-b', 'clusteroff-l', 'clusteroff-m', 'cpuoff-b', 'cpuoff-l', 'cpuoff-m'=
, 'mcusysoff-b', 'mcusysoff-l', 'mcusysoff-m', 's2idle', 'system-vcore' do =
not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: clk-ao: $nodename:0:=
 'clk-ao' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|=
apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: clk-ao: #size-cells:=
 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: clk-ao: 'ranges' is =
a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: clkitg: $nodename:0:=
 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|=
apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: clkitg: #size-cells:=
 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: clkitg: 'ranges' is =
a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /firmware/mtk-svp-he=
ap: failed to match any schema with compatible: ['mediatek,secure-heap']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: scmi: 'protocol@80' =
does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/ads=
p-mem-region@90000000: failed to match any schema with compatible: ['mediat=
ek,adsp-reserved-memory']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/apu=
-reserve-memory@95000000: failed to match any schema with compatible: ['med=
iatek,apu-resv-mem']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/gpu=
eb-reserved-memory@a0000000: failed to match any schema with compatible: ['=
mediatek,gpueb-resv-mem']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/vcp=
-reserved-memory@a0200000: failed to match any schema with compatible: ['me=
diatek,me-vcp-reserved']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/mal=
i-protected@a2000000: failed to match any schema with compatible: ['mali-re=
served']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/sec=
ure-region@a3000000: failed to match any schema with compatible: ['mediatek=
,dynamic-restricted-region']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/apu=
-smmu-reserve-memory0: failed to match any schema with compatible: ['mediat=
ek,apu-smmu-resv-mem']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /ged: failed to matc=
h any schema with compatible: ['mediatek,ged']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /gpu-dcs: failed to =
match any schema with compatible: ['mediatek,gpu-dcs']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /gpu-loading-mode: f=
ailed to match any schema with compatible: ['mediatek,gpu-loading-mode']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /protected-memory-al=
locator: failed to match any schema with compatible: ['arm,protected-memory=
-allocator']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /gpufreq-wrapper: fa=
iled to match any schema with compatible: ['mediatek,gpufreq-wrapper']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /mgm: failed to matc=
h any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc: mtk-apu-mem-dat=
a: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc: mtk-apu-mem-cod=
e: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc: mvpu: 'ranges' =
is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc: vdisp-ctrl: 'ra=
nges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc: thermal-zones: =
'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc: vmm: 'ranges' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc: apusys-apummu: =
'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc: opp-table-apu: =
'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/therm-intf@1140=
00: failed to match any schema with compatible: ['mediatek,therm_intf']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/slbc@117800: fa=
iled to match any schema with compatible: ['mediatek,mt8196-slbc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/qos@11bb00: fai=
led to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/gpu-qos@13f800:=
 failed to match any schema with compatible: ['mediatek,gpu-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: cm-mgr@c100000: requ=
ired-opps: [[43], [44], [45], [46], [47], [48], [49], [50], [51], [52]] is =
too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/cm-mgr@c100000:=
 failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0000:=
 failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-c=
trl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0000:=
 failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-c=
trl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0400:=
 failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pl=
l-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0400:=
 failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pl=
l-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0800:=
 failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pl=
l-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0800:=
 failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pl=
l-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0c00:=
 failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll=
-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0c00:=
 failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll=
-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e4000:=
 failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-c=
trl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e4000:=
 failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-c=
trl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/fdvfs@c220400: =
failed to match any schema with compatible: ['mediatek,fdvfs']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mcupm@c240000: =
failed to match any schema with compatible: ['mediatek,mt8196-mcupm']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/performance-con=
troller@c2c0f20: failed to match any schema with compatible: ['mediatek,cpu=
freq-hw-v1']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/cpuhvfs@c2c2310=
: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@10000000=
: failed to match any schema with compatible: ['mediatek,mt8196-cksys', 'sy=
scon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@10000800=
: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys'=
, 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1000c000=
: failed to match any schema with compatible: ['mediatek,mt8196-cksys-gp2',=
 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1000c800=
: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-=
gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1000c800=
: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-=
gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1002c000=
: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', '=
mediatek,mt8196-ifr_bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1002c000=
: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', '=
mediatek,mt8196-ifr_bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/pinctrl@1002d00=
0: failed to match any schema with compatible: ['mediatek,mt8196-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/memory-controll=
er@10236000: failed to match any schema with compatible: ['mediatek,mt8196-=
dramc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@102f3000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/nsmpu@1046f000:=
 failed to match any schema with compatible: ['mediatek,smpu']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/ssmpu@1056f000:=
 failed to match any schema with compatible: ['mediatek,smpu']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/nkp@1046f000: f=
ailed to match any schema with compatible: ['mediatek,smpu']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/skp@1056f000: f=
ailed to match any schema with compatible: ['mediatek,smpu']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@10613000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@10693000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@120a0000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@120a0000: Uneval=
uated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@120a0000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@120c0000=
: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wra=
p-e', 'mediatek,mt8196-imp_iic_wrap_e', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@120c0000=
: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wra=
p-e', 'mediatek,mt8196-imp_iic_wrap_e', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mipi-tx-config@=
130b0000: failed to match any schema with compatible: ['mediatek,mt8196-mip=
i-tx']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13130000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13130000: Uneval=
uated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13130000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13150000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
--
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13190000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@131b0000=
: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wra=
p-w', 'mediatek,mt8196-imp_iic_wrap_w', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@131b0000=
: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wra=
p-w', 'mediatek,mt8196-imp_iic_wrap_w', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: efuse@13260000: comp=
atible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8196-efuse' is not one of ['mediatek,mt7622-efuse', 'mediat=
ek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediat=
ek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediat=
ek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yam=
l#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: efuse@13260000: Unev=
aluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yam=
l#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/efuse@13260000:=
 failed to match any schema with compatible: ['mediatek,mt8196-efuse', 'med=
iatek,efuse']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13930000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
--
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13930000: Uneval=
uated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13930000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13930000/tp=
m@50: failed to match any schema with compatible: ['google,ti50', 'google,c=
r50']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13930000/tp=
m@50: failed to match any schema with compatible: ['google,ti50', 'google,c=
r50']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@139b0000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@139b0000: Uneval=
uated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@139b0000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13a30000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13a30000: Uneval=
uated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13a30000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13ab0000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13ab0000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13b30000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13b30000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@13bb0000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@13bb0000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@13c30000=
: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wra=
p-n', 'mediatek,mt8196-imp_iic_wrap_n', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@13c30000=
: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wra=
p-n', 'mediatek,mt8196-imp_iic_wrap_n', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@140a0000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@140c0000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@140e0000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@14126000=
: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao=
-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@14126000=
: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao=
-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@14130000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@14131000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/infracfg@141360=
00: failed to match any schema with compatible: ['mediatek,infracfg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@142f4000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@14400000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@14401000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/thermal-sensor@=
14414000: failed to match any schema with compatible: ['mediatek,mt8196-lvt=
s']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@14500000=
: failed to match any schema with compatible: ['mediatek,mt8196-hwv', 'sysc=
on']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@14800000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/serial@16030000=
: failed to match any schema with compatible: ['mediatek,mt6985-uart']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-pwm0@160b0000: =
$nodename:0: 'disp-pwm0@160b0000' does not match '^pwm(@.*|-([0-9]|[1-9][0-=
9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-pwm0@160b0000: =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', '=
mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-dis=
p-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', '=
mediatek,mt8167-disp-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', '=
mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-dis=
p-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-pwm0@160b0000: =
clocks: [[83, 33]] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-pwm0@160b0000: =
clock-names: ['main'] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-pwm0@160b0=
000: failed to match any schema with compatible: ['mediatek,mt8196-disp-pwm=
', 'mediatek,mt8183-disp-pwm']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-pwm1@160c0000: =
$nodename:0: 'disp-pwm1@160c0000' does not match '^pwm(@.*|-([0-9]|[1-9][0-=
9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-pwm1@160c0000: =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', '=
mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-dis=
p-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', '=
mediatek,mt8167-disp-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', '=
mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-dis=
p-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-pwm1@160c0000: =
clocks: [[83, 33]] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-pwm1@160c0000: =
clock-names: ['main'] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-pwm1@160c0=
000: failed to match any schema with compatible: ['mediatek,mt8196-disp-pwm=
', 'mediatek,mt8183-disp-pwm']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@16110000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@16130000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@16150000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@16170000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@16190000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-spi']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@161b0000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-spi']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ec@0: 'spi-cs-setup-=
delay-ns' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel=
[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@161d0000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-spi']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@161f0000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@16200000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
--
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@16280000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: i2c@162c0000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/i2c@162c0000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediate=
k,mt8188-i2c']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@16300000=
: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wra=
p-c', 'mediatek,mt8196-imp_iic_wrap_c', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@16300000=
: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wra=
p-c', 'mediatek,mt8196-imp_iic_wrap_c', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mmc@16310000: clocks=
: [[83, 31], [61, 48], [61, 46], [61, 44], [61, 50]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mmc@16310000: clock-=
names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mmc@16310000: clock-=
names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mmc@16310000: clock-=
names: ['source', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mmc@16320000: clocks=
: [[83, 32], [61, 56], [61, 54], [61, 52], [61, 58]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mmc@16320000: clock-=
names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mmc@16320000: clock-=
names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mmc@16320000: clock-=
names: ['source', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/pwm@16330000: f=
ailed to match any schema with compatible: ['mediatek,pwm']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: spi@16340000: compat=
ible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8196-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,m=
t8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8196-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,m=
t2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-=
nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8196-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor=
=2Eyaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: spi@16340000: clocks=
: [[83, 188], [61, 60], [61, 64], [61, 66], [61, 68], [61, 62]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor=
=2Eyaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: spi@16340000: clock-=
names: ['spi', 'sf', 'axi', 'axi_s', 'bclk', '27m'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor=
=2Eyaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: spi@16340000: Uneval=
uated properties are not allowed ('clock-names', 'clocks', 'compatible' wer=
e unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor=
=2Eyaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spi@16340000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-nor', 'mediate=
k,mt8186-nor']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@16640000=
: failed to match any schema with compatible: ['mediatek,mt8196-pericfg-ao'=
, 'mediatek,mt8196-pericfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@16640000=
: failed to match any schema with compatible: ['mediatek,mt8196-pericfg-ao'=
, 'mediatek,mt8196-pericfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@16670000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: #addre=
ss-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: #size-=
cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: compat=
ible:0: 'mediatek,mtk-xhci' is not one of ['mediatek,mt2701-xhci', 'mediate=
k,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,m=
t7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt81=
83-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-=
xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: compat=
ible: ['mediatek,mtk-xhci'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: clock-=
names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: clock-=
names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: mediat=
ek,syscon-wakeup:0:2: 107 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: #addre=
ss-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb@16700000: #size-=
cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb1@16710000: compa=
tible:0: 'mediatek,mtk-xhci' is not one of ['mediatek,mt2701-xhci', 'mediat=
ek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,=
mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8=
183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192=
-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb1@16710000: compa=
tible: ['mediatek,mtk-xhci'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb1@16710000: clock=
-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb1@16710000: clock=
-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb1@16710000: media=
tek,syscon-wakeup:0:2: 108 is not one of [1, 2, 101, 102, 103, 104, 105, 10=
6]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb-phy0@16730000: $=
nodename:0: 'usb-phy0@16730000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb-phy0@16730000: c=
ompatible:0: 'mediatek,xsphy' is not one of ['mediatek,mt3611-xsphy', 'medi=
atek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb-phy0@16730000: c=
ompatible: ['mediatek,xsphy'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb-phy0@16730000: '=
usb2-phy0@0' does not match any of the regexes: '^usb-phy@[0-9a-f]+$', 'pin=
ctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb-phy1@16740000: $=
nodename:0: 'usb-phy1@16740000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb-phy1@16740000: c=
ompatible:0: 'mediatek,xsphy' is not one of ['mediatek,mt3611-xsphy', 'medi=
atek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb-phy1@16740000: c=
ompatible: ['mediatek,xsphy'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb-phy1@16740000: '=
usb2-phy1@0' does not match any of the regexes: '^usb-phy@[0-9a-f]+$', 'pin=
ctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb3-phy0@16773000: =
$nodename:0: 'usb3-phy0@16773000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb3-phy0@16773000: =
compatible:0: 'mediatek,xsphy' is not one of ['mediatek,mt3611-xsphy', 'med=
iatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb3-phy0@16773000: =
compatible: ['mediatek,xsphy'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: usb3-phy0@16773000: =
'power-domains', 'usb3-phy0@16773400' do not match any of the regexes: '^us=
b-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@167a0000=
: failed to match any schema with compatible: ['mediatek,mt8196-usbwkcfg-ao=
', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: int=
errupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [=
0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, =
0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: clo=
cks: [[83, 42], [83, 97], [83, 115], [83, 41], [83, 118], [83, 96], [105, 1=
], [105, 3], [105, 5], [105, 7], [105, 9], [105, 11], [105, 13], [105, 15]]=
 is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: clo=
ck-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: clo=
ck-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'c=
rypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1'=
, 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is=
 too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: 'ph=
ys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: Une=
valuated properties are not allowed ('boost-crypt-vcore-min', 'clock-names'=
, 'clocks', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'med=
iatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 're=
sets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@16890000=
: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-s=
ec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@16890000=
: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-s=
ec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@168a0000=
: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao',=
 'mediatek,mt8196-ufscfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@168a0000=
: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao',=
 'mediatek,mt8196-ufscfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@168a0000=
/reset-controller: failed to match any schema with compatible: ['ti,syscon-=
reset']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/phy@16900000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pcie@16910000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pcie@16910000: clock=
-names:4: 'ahb_apb' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pcie@16910000: Uneva=
luated properties are not allowed ('compatible', 'pextpcfg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/phy@16930000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pcie@16940000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pcie@16940000: clock=
-names:4: 'ahb_apb' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/phy@16960000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pcie@16970000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pcie@16970000: clock=
-names:4: 'ahb_apb' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@169b0000=
: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-a=
o', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@169b0000=
: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-a=
o', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@169b0000=
/reset-controller: failed to match any schema with compatible: ['ti,syscon-=
reset']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@169e0000=
: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-a=
o', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@169e0000=
: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-a=
o', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@169e0000=
/reset-controller: failed to match any schema with compatible: ['ti,syscon-=
reset']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@18000000=
: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', '=
mediatek,mt8196-ssr_top', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@18000000=
: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', '=
mediatek,mt8196-ssr_top', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@180f3000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000: failed to match any schema with compatible: ['mediatek,mt8196-apusys_=
rv']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-ctrl: failed to match any schema with compatible: ['mediatek,apu-c=
trl-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-top-rpmsg: failed to match any schema with compatible: ['mediatek,=
aputop-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-mdw-rpmsg: failed to match any schema with compatible: ['mediatek,=
apu-mdw-rpmsg-v5']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-apummu: failed to match any schema with compatible: ['mediatek,apu=
-apummu-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-apummu-rx: failed to match any schema with compatible: ['mediatek,=
apu-apummu-rx']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-edma: failed to match any schema with compatible: ['mediatek,apu-e=
dma-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/edma-rx: failed to match any schema with compatible: ['mediatek,edma-r=
x-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-mnoc: failed to match any schema with compatible: ['mediatek,apu-m=
noc-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/mdla-tx-rpmsg: failed to match any schema with compatible: ['mediatek,=
mdla-tx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/mdla-rx-rpmsg: failed to match any schema with compatible: ['mediatek,=
mdla-rx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/mvpu-tx-rpmsg: failed to match any schema with compatible: ['mediatek,=
mvpu-tx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/mvpu-rx-rpmsg: failed to match any schema with compatible: ['mediatek,=
mvpu-rx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/aps-tx-rpmsg: failed to match any schema with compatible: ['mediatek,a=
ps-tx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/aps-rx-rpmsg: failed to match any schema with compatible: ['mediatek,a=
ps-rx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/sapu-lock-rpmsg: failed to match any schema with compatible: ['mediate=
k,apu-lock-rv-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-scp-mdw-rpmsg: failed to match any schema with compatible: ['media=
tek,apu-scp-mdw-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-scp-np-recover-rpmsg: failed to match any schema with compatible: =
['mediatek,apu-scp-np-recover-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/remoteproc@1900=
1000/apu-ipi-ut-rpmsg: failed to match any schema with compatible: ['mediat=
ek,apu-ipi-ut-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: opp-table-apu: Uneva=
luated properties are not allowed ('opp@1115000000', 'opp@1300000000', 'opp=
@1450000000', 'opp@1600000000', 'opp@1800000000', 'opp@385000000', 'opp@457=
500000', 'opp@530000000', 'opp@630000000', 'opp@730000000', 'opp@930000000'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: power-controller@190=
20000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/power-controlle=
r@19020000: failed to match any schema with compatible: ['mt8196,apu-top-3']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/logger@19024000=
: failed to match any schema with compatible: ['mediatek,apusys-hw-logger']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/adsp@1a000000: =
failed to match any schema with compatible: ['mediatek,mt8196-dsp']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@1a019000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1a110000=
: failed to match any schema with compatible: ['mediatek,mt8196-audiosys', =
'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mt8196-afe-pcm@=
1a110000: failed to match any schema with compatible: ['mediatek,mt8196-sou=
nd']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mailbox@1a350000: co=
mpatible:0: 'mediatek,mt8196-adsp-mbox' is not one of ['mediatek,mt8195-ads=
p-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mailbox@1a350000: co=
mpatible: ['mediatek,mt8196-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too=
 long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mailbox@1a35000=
0: failed to match any schema with compatible: ['mediatek,mt8196-adsp-mbox'=
, 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mailbox@1a360000: co=
mpatible:0: 'mediatek,mt8196-adsp-mbox' is not one of ['mediatek,mt8195-ads=
p-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mailbox@1a360000: co=
mpatible: ['mediatek,mt8196-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too=
 long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mailbox@1a36000=
0: failed to match any schema with compatible: ['mediatek,mt8196-adsp-mbox'=
, 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/power-controlle=
r@1c004000: failed to match any schema with compatible: ['mediatek,mt8196-s=
cpsys-hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1c00d000=
: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-bus'=
, 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: watchdog@1c010000: c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd'] =
is too long
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2712-wdt', 'mediatek,m=
t6589-wdt', 'mediatek,mt6735-wdt', 'mediatek,mt6795-wdt', 'mediatek,mt7986-=
wdt', 'mediatek,mt8183-wdt', 'mediatek,mt8186-wdt', 'mediatek,mt8188-wdt', =
'mediatek,mt8192-wdt', 'mediatek,mt8195-wdt']
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,m=
t6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-wdt', 'mediatek,mt7623-=
wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', 'mediatek,mt8365-wdt', =
'mediatek,mt8516-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wd=
t.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: watchdog@1c010000: U=
nevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wd=
t.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/watchdog@1c0100=
00: failed to match any schema with compatible: ['mediatek,mt8196-wdt', 'me=
diatek,mt6589-wdt', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/dvfsrc@1c013000=
: failed to match any schema with compatible: ['mediatek,mt8196-dvfsrc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1c016000=
: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys',=
 'mediatek,mt8196-vlp_cksys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@1c016000=
: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys',=
 'mediatek,mt8196-vlp_cksys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000: =
failed to match any schema with compatible: ['mediatek,mt8196-spmi']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6316@6: failed to match any schema with compatible: ['mediatek,mt6316']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6316@6/mt6316-6-regulator: failed to match any schema with compatible: ['m=
ediatek,mt6316-6-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6316@7: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6316@7/mt6316-7-regulator: failed to match any schema with compatible: ['m=
ediatek,mt6316-7-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6316@8: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6316@8/mt6316-8-regulator: failed to match any schema with compatible: ['m=
ediatek,mt6316-8-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6316@15: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6316@15/mt6316-15-regulator: failed to match any schema with compatible: [=
'mediatek,mt6316-15-regulator']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/p=
mic@4: failed to match any schema with compatible: ['mediatek,mt6363']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/p=
mic@4/mt6363-auxadc: failed to match any schema with compatible: ['mediatek=
,mt6363-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/p=
mic@4/mt6363-efuse: failed to match any schema with compatible: ['mediatek,=
mt6363-efuse']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/p=
mic@4/mt6363-consys: failed to match any schema with compatible: ['mediatek=
,mt6363-consys']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/p=
mic@4/mt6363keys: failed to match any schema with compatible: ['mediatek,mt=
6363-keys']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/p=
mic@4/mt6363-pinctrl: failed to match any schema with compatible: ['mediate=
k,mt6363-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/p=
mic@4/regulators: failed to match any schema with compatible: ['mediatek,mt=
6363-regulator']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/p=
mic@4/pmic-lvsys-notify: failed to match any schema with compatible: ['medi=
atek,mt6363-lvsys-notify']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/s=
econd_pmic@5: failed to match any schema with compatible: ['mediatek,mt6373=
']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/s=
econd_pmic@5/mt6373-auxadc: failed to match any schema with compatible: ['m=
ediatek,mt6373-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/s=
econd_pmic@5/mt6373-efuse: failed to match any schema with compatible: ['me=
diatek,mt6373-efuse']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/s=
econd_pmic@5/mt6373-consys: failed to match any schema with compatible: ['m=
ediatek,mt6373-consys']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/s=
econd_pmic@5/mt6373-pinctrl: failed to match any schema with compatible: ['=
mediatek,mt6373-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/s=
econd_pmic@5/regulators: failed to match any schema with compatible: ['medi=
atek,mt6373-regulator']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6685_mfd: failed to match any schema with compatible: ['mediatek,mt6685']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6685_mfd/mt6685-clkbuf: failed to match any schema with compatible: ['medi=
atek,mt6685-clkbuf']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/spmi@1c01a000/m=
t6685_mfd/mt6685_rtc: failed to match any schema with compatible: ['mediate=
k,mt6685-rtc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@1c032000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mailbox@1c35100=
0: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/systimer@1c4000=
00: failed to match any schema with compatible: ['mediatek,mt8196-timer', '=
mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/systimer@1c4000=
00: failed to match any schema with compatible: ['mediatek,mt8196-timer', '=
mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@300200=
00: failed to match any schema with compatible: ['mediatek,mt8196-smi-commo=
n']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@300210=
00: failed to match any schema with compatible: ['mediatek,mt8196-smi-commo=
n']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@30040000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: gce@300c0000: 'clock=
s' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: gce@300c0000: 'clock=
-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: gce@300c0000: 'mboxe=
s', 'mediatek,gce-events' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: gce@30140000: 'clock=
s' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: gce@30140000: 'clock=
-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@30800000: comp=
atible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@30800000: comp=
atible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/iommu@30800000:=
 failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'a=
rm,smmu-v3']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@30a300=
00: failed to match any schema with compatible: ['mediatek,mt8196-smi-commo=
n']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@30a310=
00: failed to match any schema with compatible: ['mediatek,mt8196-smi-commo=
n']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@30a320=
00: failed to match any schema with compatible: ['mediatek,mt8196-smi-commo=
n']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@30a330=
00: failed to match any schema with compatible: ['mediatek,mt8196-smi-commo=
n']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/vcp@31800000: f=
ailed to match any schema with compatible: ['mediatek,vcp']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/vcp@31800000/vc=
p@0: failed to match any schema with compatible: ['mediatek,vcp-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/vcp@31800000/vc=
p@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@31a80000=
: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv=
', 'mediatek,mt8196-mminfra_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@31a80000=
: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv=
', 'mediatek,mt8196-mminfra_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@31ad5000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@31b00000=
: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'm=
ediatek,mt8196-mm_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@31b00000=
: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'm=
ediatek,mt8196-mm_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/power-controlle=
r@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-h=
frpsys-hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: syscon@32000000: 'as=
ync', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mutex@32020000: 'pow=
er-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mutex@32020000: 'one=
Of' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-ccorr@3209=
0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-cc=
orr']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-ccorr@320a=
0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-cc=
orr']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-dither@32110000=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-dither', 'mediatek,mt8183-disp-dither'] is too l=
ong
   	'mediatek,mt8196-disp-dither' is not one of ['mediatek,mt8183-disp-dith=
er']
   	'mediatek,mt8196-disp-dither' is not one of ['mediatek,mt8186-disp-dith=
er', 'mediatek,mt8188-disp-dither', 'mediatek,mt8192-disp-dither', 'mediate=
k,mt8195-disp-dither']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dither.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-dither@32110000=
: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dither.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-dither@321=
10000: failed to match any schema with compatible: ['mediatek,mt8196-disp-d=
ither', 'mediatek,mt8183-disp-dither']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-gamma@32130000:=
 compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8196-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma=
', 'mediatek,mt8183-disp-gamma', 'mediatek,mt8195-disp-gamma']
   	'mediatek,mt8196-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma=
']
   	'mediatek,mt8196-disp-gamma' is not one of ['mediatek,mt8186-disp-gamma=
', 'mediatek,mt8188-disp-gamma', 'mediatek,mt8192-disp-gamma', 'mediatek,mt=
8195-disp-gamma']
   	'mediatek,mt8196-disp-gamma' is not one of ['mediatek,mt8188-disp-gamma=
']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-gamma@32130000:=
 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: disp-gamma@32130000:=
 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-gamma@3213=
0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-ga=
mma', 'mediatek,mt8195-disp-gamma']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-tdshp@321e=
0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-td=
shp']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: postmask@32180000: '=
power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,postmask.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: postmask@32180000: '=
oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,postmask.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32240000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: syscon@32400000: 'as=
ync', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mutex@32420000: 'pow=
er-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mutex@32420000: 'one=
Of' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/dp-intf@3243000=
0: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/dp-intf@3244000=
0: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-dsc0-wrap0=
@32450000: failed to match any schema with compatible: ['mediatek,mt8196-di=
sp-dsc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-dsc1-wrap1=
@32460000: failed to match any schema with compatible: ['mediatek,mt8196-di=
sp-dsc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/dsi@32490000: f=
ailed to match any schema with compatible: ['mediatek,mt8196-dsi']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/disp-dvo0@324c0=
000: failed to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32600000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: syscon@32800000: 'as=
ync', 'mm-hw-ccf-regmap' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mutex@32820000: 'pow=
er-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mutex@32820000: 'one=
Of' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32860=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32870=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32880=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32890=
000: mediatek,larb:0: [194, 35] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32890=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@328a0=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@328b0=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@328c0=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@32970000: 'm=
boxes', 'mediatek,gce-events' do not match any of the regexes: 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@32990000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@329a0000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@329b0000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@329c0000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32a60000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32a70000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32a80000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32a90000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: syscon@32c00000: 'as=
ync', 'mm-hw-ccf-regmap' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mutex@32c20000: 'pow=
er-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mutex@32c20000: 'one=
Of' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32c50=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32c60=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32c70=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32c80=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32c90=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32ca0=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32cb0=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dma-controller@32cc0=
000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@32d80000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@32d90000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@32da0000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@32db0000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: outproc@32dc0000: 'o=
neOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32e60000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32e70000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32e80000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@32e90000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/video@36000000:=
 failed to match any schema with compatible: ['mediatek,mt8196-vcodec-dec']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@3600d000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@3600e000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@3600f000=
: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc=
', 'mediatek,mt8196-vdecsys_soc', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@3600f000=
: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc=
', 'mediatek,mt8196-vdecsys_soc', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@3602e000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@3602f000=
: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys', '=
syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@38000000=
: failed to match any schema with compatible: ['mediatek,mt8196-vencsys', '=
syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@38010000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/video-codec@380=
20000: failed to match any schema with compatible: ['mediatek,mt8196-vcodec=
-enc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-sub-comm@38=
070000: failed to match any schema with compatible: ['mediatek,mt8196-smi-s=
ub-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@38090000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@38800000=
: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c1'=
, 'mediatek,mt8196-vencsys_c1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@38800000=
: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c1'=
, 'mediatek,mt8196-vencsys_c1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@38810000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-sub-comm@38=
870000: failed to match any schema with compatible: ['mediatek,mt8196-smi-s=
ub-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@38890000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@38c00000=
: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c2'=
, 'mediatek,mt8196-vencsys_c2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@38c00000=
: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c2'=
, 'mediatek,mt8196-vencsys_c2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@38c10000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-sub-comm@38=
c70000: failed to match any schema with compatible: ['mediatek,mt8196-smi-s=
ub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@38c90000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@3e000000=
: failed to match any schema with compatible: ['mediatek,mt8196-mdpsys', 's=
yscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@3e030000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@3e400000=
: failed to match any schema with compatible: ['mediatek,mt8196-mdpsys1', '=
syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/larb@3e430000: =
failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: syscon@3e800000: 'mm=
-hw-ccf-regmap' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-sub-comm@3e=
810000: failed to match any schema with compatible: ['mediatek,mt8196-smi-s=
ub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-sub-comm@3e=
820000: failed to match any schema with compatible: ['mediatek,mt8196-smi-s=
ub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-sub-comm@3e=
830000: failed to match any schema with compatible: ['mediatek,mt8196-smi-s=
ub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-sub-comm@3e=
840000: failed to match any schema with compatible: ['mediatek,mt8196-smi-s=
ub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: dp-tx@3ec00000: 'dpt=
x,phy-params' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|=
dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '=
^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl=
-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sd=
hci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^=
70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#=
_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acer,.*', '^acme=
,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adaptev=
a,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgai=
sler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', =
'^alfa-network,.*', '^allegro,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampire,=
=2E*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestec=
h,.*', '^anvo,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^ar=
chermind,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,=
=2E*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*'=
, '^aspeed,.*', '^asrock,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atm=
el,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^av=
net,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', =
'^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^=
bhf,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*=
', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calaosystems,.*', '^calxeda,.*', =
'^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', =
'^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charg=
ebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', =
'^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*=
', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^c=
loos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^comp=
ulab,.*', '^congatec,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^c=
osmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^c=
sq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.*', =
'^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^del=
l,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^diodes,.*', '^dioo=
,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dong=
woon,.*', '^dptechnics,.*', '^dragino,.*', '^ds,.*', '^dserve,.*', '^dynaim=
age,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '=
^eckelmann,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.=
*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*',=
 '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^e=
mlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustr=
a,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engled=
er,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus=
,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar=
,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairphone=
,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*',=
 '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^frida,.*', '^f=
riendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gardena,.*', '^gat=
eworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gemei,.*', =
'^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^goldelico,.*', '^goodix,.*', '^google=
,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hann=
star,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*',=
 '^hideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', =
'^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywe=
ll,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hugs=
un,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', =
'^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*',=
 '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*',=
 '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^infor=
ce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^in=
nolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', =
'^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^=
iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '=
^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*=
', '^jdi,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jo=
z,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*',=
 '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^k=
ionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*',=
 '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*'=
, '^lattice,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lem=
aker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^liche=
epi,.*', '^linaro,.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys,=
=2E*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.*', '^litex,.*'=
, '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,=
=2E*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunzn,.*', '^lwn,.*'=
, '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', =
'^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^=
mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^mikroe,.*', '^mikrotik,.*', '^miniand,.*', '^mi=
nix,.*', '^miramems,.*', '^mitsubishi,.*', '^mixel,.*', '^miyoo,.*', '^mntr=
e,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '=
^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*',=
 '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundore=
ader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*'=
, '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*=
', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhave=
n,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo=
,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novatek,.*', '^novtech,.*', '=
^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceani=
c,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.=
*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opal=
kelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora=
,.*', '^openrisc,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortust=
ech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.=
*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax=
,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*=
', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower=
,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocket=
book,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,.*', '^po=
v,.*', '^powertip,.*', '^powervr,.*', '^primux,.*', '^probox2,.*', '^prt,.*=
', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi=
,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,=
=2E*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspber=
rypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^remarkable,.*', '^rene=
sas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh=
,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,=
=2E*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^saef,.*=
', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*',=
 '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*',=
 '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm=
,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,=
=2E*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^s=
i-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*'=
, '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.=
*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^s=
inlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^s=
is,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc=
,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,=
=2E*', '^sony,.*', '^sourceparts,.*', '^spansion,.*', '^sparkfun,.*', '^spi=
nalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^=
st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^s=
tarterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^=
storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', =
'^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '=
^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tdo,.*',=
 '^team-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar=
,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*=
', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', =
'^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^t=
opic,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^tou=
maz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^tr=
onfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*'=
, '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '=
^ugoos,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*',=
 '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertex=
com,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,=
=2E*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vot,.*', '^vxt,.*', '^wan=
changlong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,=
=2E*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', =
'^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*=
', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wob=
o,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', =
'^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^=
xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,=
=2E*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', =
'^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*', 'pinctr=
l-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/dp-tx@3ec00000:=
 failed to match any schema with compatible: ['mediatek,mt8196-dp-tx']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/edp-tx@3ec40000=
: failed to match any schema with compatible: ['mediatek,mt8196-edp-tx']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/gpu@48000000: f=
ailed to match any schema with compatible: ['mediatek,mali-mt8196', 'mediat=
ek,mali']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/gpu@48000000: f=
ailed to match any schema with compatible: ['mediatek,mali-mt8196', 'mediat=
ek,mali']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pbha: propagate-bits=
:0: size is 8, expected 32
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/gpufreq@4850000=
0: failed to match any schema with compatible: ['mediatek,gpufreq']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/gpupdma@4854000=
0: failed to match any schema with compatible: ['mediatek,gpupdma']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@48600000: comp=
atible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@48600000: comp=
atible: ['mediatek,mt8196-gpu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/iommu@48600000:=
 failed to match any schema with compatible: ['mediatek,mt8196-gpu-smmu', '=
arm,smmu-v3']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: gpueb@4b000000: send=
-name-table: b'IPI_ID_FAST_DVFS_EVENT\x00IPI_ID_GPUFREQ\x00IPI_ID_SLEEP\x00=
IPI_ID_TIMER\x00IPI_ID_FHCTL\x00IPI_ID_CCF\x00IPI_ID_GPUMPU\x00IPI_ID_FAST_=
DVFS\x00CH_IPIR_C_MET\x00CH_IPIS_C_MET\x00IPI_ID_BRISKET\x00IPI_ID_PPB\x00'=
 is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: gpueb@4b000000: recv=
-name-table: b'IPI_ID_FAST_DVFS_EVENT\x00IPI_ID_GPUFREQ\x00IPI_ID_SLEEP\x00=
IPI_ID_TIMER\x00IPI_ID_FHCTL\x00IPI_ID_CCF\x00IPI_ID_GPUMPU\x00IPI_ID_FAST_=
DVFS\x00CH_IPIR_C_MET\x00CH_IPIS_C_MET\x00IPI_ID_BRISKET\x00IPI_ID_PPB\x00'=
 is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: gpueb@4b000000: gpue=
b-mem-name-table: b'MEM_ID_GPUFREQ\x00MEM_ID_LOG\x00' is not of type 'objec=
t', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/gpueb@4b000000:=
 failed to match any schema with compatible: ['mediatek,gpueb']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@4b810000=
: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-=
ctrl', 'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@4b810000=
: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-=
ctrl', 'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@4b810400=
: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-=
pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@4b810400=
: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-=
pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/ghpm@4b800000: =
failed to match any schema with compatible: ['mediatek,ghpm']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@4b810800=
: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-=
pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@4b810800=
: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-=
pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@4b890000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@4b8b0000=
: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@4c000000: comp=
atible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@4c000000: comp=
atible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@4c000000: 'smm=
u-mediatek-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/iommu@4c000000:=
 failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', '=
arm,smmu-v3']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/apusys-apummu: =
failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-decoder: f=
ailed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-decoder/jp=
eg-decoder@38040000: failed to match any schema with compatible: ['mediatek=
,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-decoder/jp=
eg-decoder@38840000: failed to match any schema with compatible: ['mediatek=
,mt8196-jpgdec-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-encoder: f=
ailed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-encoder/jp=
eg-encoder@38030000: failed to match any schema with compatible: ['mediatek=
,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-encoder/jp=
eg-encoder@38830000: failed to match any schema with compatible: ['mediatek=
,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mtk-apu-mem-code: co=
mpatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9=
,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mtk-apu-mem-cod=
e: failed to match any schema with compatible: ['mediatek, apu_mem_code']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mtk-apu-mem-data: co=
mpatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9=
,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mtk-apu-mem-dat=
a: failed to match any schema with compatible: ['mediatek, apu_mem_data']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mvpu: compatible:0: =
'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mvpu: failed to=
 match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/sound: failed t=
o match any schema with compatible: ['mediatek,mt8196-mt6681-sound']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/vdisp-ctrl: fai=
led to match any schema with compatible: ['mediatek,mt8196-vdisp-ctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/vmm: failed to =
match any schema with compatible: ['mediatek,mt8196-vmm']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: thermal-zones: 'soc_=
max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-ther=
mal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
