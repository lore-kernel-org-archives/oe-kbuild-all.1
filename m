Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC6228C9D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757844924; cv=none; b=H+vqvbU8L7whmxvLq09yXurAKz2oxbJQ6glsudNXjFLLcVdPDdxmwgOGjmDC3B/+HK/5Dq1iUscRXUG2gdKzzpsn8Ag3fVSIyEoI2Z1utDBpCdHVKtupFDR6v4JnBlwO2y5F3eyRw5aPladw+vXELH7r4K8wv4hPVD1wQCCKAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757844924; c=relaxed/simple;
	bh=QKahP3HacoU6HTf0+ovUM6RD4PIeOo9iV1eoClumoEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRDLgpy48zyIYFneNs4q0Y7ol3WYTHQkiUl41ud0Sw/9UHkPdw8jWX7JTXOS98/tNyhI+iQJbyprxWqUAW7yaSOH/iOaFRhCW1VTJZHs7elPfJMUTfYnAV9+nQhyHIhcZdE/u+R1c+e+WBjJe3z3VYyoY49qOhkhNztUNQ8nB2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeF+pYoR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeF+pYoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757844917; x=1789380917;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QKahP3HacoU6HTf0+ovUM6RD4PIeOo9iV1eoClumoEU=;
  b=KeF+pYoR2o8FqoTtf//5RTF/KnKMxbqwchoqed9ffflvMgzz8Ag1QGP9
   LbvTk1NDD/4qRh8FGrlq6uoiYnjjK5MPdmWHXpk0PLT/4WDH732Sk9OFW
   k8lpfqd3+BvG7NI002sp//io1D6PTydomgGFc4qHAfTO9LuM2D3NGLkp8
   bhLtiN/Tf9hOjZ1ufp2CT8MUxBz04+Q2WX0MO9SQe7l7sq+FRAY2Efx+s
   O+/B0ghuMbmnz+aYV5k6HHf+m8nfnOX/ip+AScIzsqnMjVm3gwK+1zor8
   hRYoGXVMm1y+Wb/ls25AWLlSK+ngxFpz1R3sJIN5H1MuScFDPRDYvXTfa
   w==;
X-CSE-ConnectionGUID: wqSARVHARPKniSguCeMNeA==
X-CSE-MsgGUID: 8lKd9MNBSqakFQlcisFJUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="77576943"
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="77576943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 03:15:17 -0700
X-CSE-ConnectionGUID: 89zczvSLS16EBnBpeVl3wA==
X-CSE-MsgGUID: YVM6eWXuSyiAs2ehZ7E8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="211528355"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2025 03:15:15 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxjlI-0002JU-3C;
	Sun, 14 Sep 2025 10:15:12 +0000
Date: Sun, 14 Sep 2025 18:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4lite 86/104]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /: failed to
 match any schema with compatible: ['bananapi,bpi-r4-lite',
 'mediatek,mt7987a', 'mediatek,mt7987']
Message-ID: <202509141805.L9sXaYAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4lite
head:   d845dce6a3e1a5a8793a804f1307b71499b1e27e
commit: e29f00e55c0b2348c9118af5a376a170bec2bb83 [86/104] bindings: include=
s: add missing includes
config: arm64-randconfig-051-20250914 (https://download.01.org/0day-ci/arch=
ive/20250914/202509141805.L9sXaYAL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 218=
57ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250914/202509141805.L9sXaYAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509141805.L9sXaYAL-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7987.dtsi:509.29-540.5: Warning (simple_b=
us_reg): /soc/usb-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7987.dtsi:615.12-618.5: Warning (simple_b=
us_reg): /soc/wed: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7987-netsys.dtsi:81.22-88.4: Warning (sim=
ple_bus_reg): /soc_netsys/hnat@15000000: simple-bus unit address format err=
or, expected "15100000"
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-mikrobus.dtsi:=
23.35-46.5: Warning (simple_bus_reg): /MikroBus/gpio-export@0: missing or e=
mpty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-mikrobus.dtsi:=
48.35-71.5: Warning (simple_bus_reg): /MikroBus/gpio-export@1: missing or e=
mpty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7987.dtsi:194.27-211.5: Warning (avoid_un=
necessary_addr_size): /soc_clksys/syscon@15000000: unnecessary #address-cel=
ls/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7987.dtsi:24.24-29.4: Warning (unique_uni=
t_address_if_enabled): /oscillator@0: duplicate unit-address (also used in =
node /sfp@0)
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /: failed=
 to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt=
7987a', 'mediatek,mt7987']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /: failed=
 to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt=
7987a', 'mediatek,mt7987']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /: failed=
 to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt=
7987a', 'mediatek,mt7987']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixe=
d:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: / (banana=
pi,bpi-r4-lite): memory: False schema does not allow {'reg': [[0, 107374182=
4, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: opp_table=
0 (operating-points-v2): $nodename:0: 'opp_table0' does not match '^opp-tab=
le(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: opp_table=
0 (operating-points-v2): Unevaluated properties are not allowed ('opp-share=
d', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: l2-cache =
(cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: clkitg (s=
imple-bus): $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|b=
us|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc_clksy=
s (simple-bus): $nodename:0: 'soc_clksys' does not match '^([a-z][a-z0-9\\-=
]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
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
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /reserved=
-memory/wmcpu-reserved@50000000: failed to match any schema with compatible=
: ['mediatek,wmcpu-reserved']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: thermal-z=
ones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-hot', 'cpu-a=
ctive-low', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9=
]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc (simp=
le-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc (simp=
le-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/hwve=
r@8000000: failed to match any schema with compatible: ['mediatek,hwver', '=
syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/infr=
a_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek=
,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: watchdog@=
1001c000 (mediatek,mt7987-wdt): compatible: 'oneOf' conditional failed, one=
 must be fixed:
   	['mediatek,mt7987-wdt', 'mediatek,mt7988-wdt', 'mediatek,mt6589-wdt', '=
syscon'] is too long
   	'mediatek,mt7987-wdt' is not one of ['mediatek,mt2712-wdt', 'mediatek,m=
t6589-wdt', 'mediatek,mt6735-wdt', 'mediatek,mt6795-wdt', 'mediatek,mt7986-=
wdt', 'mediatek,mt7988-wdt', 'mediatek,mt8183-wdt', 'mediatek,mt8186-wdt', =
'mediatek,mt8188-wdt', 'mediatek,mt8192-wdt', 'mediatek,mt8195-wdt']
   	'mediatek,mt7987-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,m=
t6572-wdt', 'mediatek,mt6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-=
wdt', 'mediatek,mt7623-wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', =
'mediatek,mt8365-wdt', 'mediatek,mt8516-wdt']
   	'mediatek,mt6589-wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wd=
t.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: watchdog@=
1001c000 (mediatek,mt7987-wdt): Unevaluated properties are not allowed ('co=
mpatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wd=
t.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/watc=
hdog@1001c000: failed to match any schema with compatible: ['mediatek,mt798=
7-wdt', 'mediatek,mt7988-wdt', 'mediatek,mt6589-wdt', 'syscon']
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: i2c@11003=
000 (mediatek,mt7988-i2c): compatible: 'oneOf' conditional failed, one must=
 be fixed:
   	['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c'] is too long
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
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,m=
t8516-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,m=
t6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt6893-i2c', 'mediatek,m=
t8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: i2c@11003=
000 (mediatek,mt7988-i2c): Unevaluated properties are not allowed ('compati=
ble' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/i2c@=
11003000: failed to match any schema with compatible: ['mediatek,mt7988-i2c=
', 'mediatek,mt7981-i2c']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pca9545@7=
0 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pca9545@7=
0 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', =
'#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: eeprom@57=
 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'pa=
ge-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: wifi_eepr=
om@50 (atmel,24c02): $nodename:0: 'wifi_eeprom@50' does not match '^eeprom@=
[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: wifi_eepr=
om@50 (atmel,24c02): Unevaluated properties are not allowed ('$nodename', '=
address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11007=
800 (mediatek,ipm-spi-quad): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,ipm-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek=
,mt8365-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek=
,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'medi=
atek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-sing=
le', 'mediatek,mt8188-spi-ipm']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek=
,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt689=
3-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi'=
, 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/spi@=
11007800: failed to match any schema with compatible: ['mediatek,ipm-spi-qu=
ad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,ipm-spi-single): compatible: 'oneOf' conditional failed, one =
must be fixed:
   	['mediatek,ipm-spi-single', 'mediatek,spi-ipm'] is too long
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt7629-spi', 'mediat=
ek,mt8365-spi']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt6779-spi', 'mediat=
ek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt7981-spi-ipm', 'me=
diatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-si=
ngle', 'mediatek,mt8188-spi-ipm']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt8196-spi']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt2701-spi', 'mediat=
ek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6=
893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-sp=
i', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,ipm-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,ipm-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11008=
800 (mediatek,ipm-spi-single): Unevaluated properties are not allowed ('com=
patible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/spi@=
11008800: failed to match any schema with compatible: ['mediatek,ipm-spi-si=
ngle', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11009=
800 (mediatek,ipm-spi-quad): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,ipm-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek=
,mt8365-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek=
,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'medi=
atek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-sing=
le', 'mediatek,mt8188-spi-ipm']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek=
,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt689=
3-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi'=
, 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/spi@=
11009800: failed to match any schema with compatible: ['mediatek,ipm-spi-qu=
ad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/lvts=
@1100a000: failed to match any schema with compatible: ['mediatek,mt7987-lv=
ts-ap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_valid' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names:1: 'rx_imp' wa=
s expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-names: ['intr', 'aut=
o_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: [[29], [30]] is to=
o short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_valid' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cell-names: ['intr', 'rx_=
imp', 'tx_imp', 'auto_load_valid'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cells: [[31], [32], [33],=
 [34]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): $nodename:0: 'usb-phy@11c50000' does not match '=
^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb-phy@1=
1c50000 (mediatek,mt7987): compatible: 'oneOf' conditional failed, one must=
 be fixed:
   	['mediatek,mt7987', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7987' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt76=
23-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7987' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt68=
93-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-=
tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tph=
y']
   	'mediatek,mt7987' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt81=
95-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/usb-=
phy@11c50000: failed to match any schema with compatible: ['mediatek,mt7987=
', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: usb@11200=
000 (mediatek,mt7987-xhci): compatible:0: 'mediatek,mt7987-xhci' is not one=
 of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci'=
, 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', '=
mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'med=
iatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediat=
ek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/usb@=
11200000: failed to match any schema with compatible: ['mediatek,mt7987-xhc=
i', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names: ['aud_bus_ck', 'aud_26=
m_ck', 'aud_l_ck', 'aud_aud_ck', 'aud_eg2_ck', 'aud_sel', 'aud_i2s_m'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clocks: [[22, 13], [22, 14], [22, 1=
5], [22, 16], [22, 17], [4, 50], [4, 77]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:0: 'bus_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:1: '26m_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:3: 'aud_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:4: 'eg2_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:5: 'sel' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): clock-names:6: 'i2s_m' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: audio-con=
troller@11210000 (mediatek,mt7987-afe): compatible: 'oneOf' conditional fai=
led, one must be fixed:
   	['mediatek,mt7987-afe', 'mediatek,mt7986-afe'] is too long
   	'mediatek,mt7986-afe' was expected
   	'mediatek,mt7987-afe' is not one of ['mediatek,mt7981-afe', 'mediatek,m=
t7988-afe']
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/audi=
o-controller@11210000: failed to match any schema with compatible: ['mediat=
ek,mt7987-afe', 'mediatek,mt7986-afe']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hc=
lk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], =
[22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
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
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek=
,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@1128=
0000 (mediatek,mt7987-pcie): Unevaluated properties are not allowed ('compa=
tible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pcie=
@11280000: failed to match any schema with compatible: ['mediatek,mt7987-pc=
ie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@1129=
0000 (mediatek,mt7988-pcie): clock-names: ['pl_250m', 'tl_26m', 'peri_26m',=
 'top_133m', 'pextp_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@1129=
0000 (mediatek,mt7988-pcie): clocks: [[22, 66], [22, 64], [22, 70], [22, 68=
], [4, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@1129=
0000 (mediatek,mt7988-pcie): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,mt7988-pcie', 'mediatek,mt7988-pcie', 'mediatek,mt7986-pcie'=
, 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7988-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek=
,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pcie=
@11290000: failed to match any schema with compatible: ['mediatek,mt7988-pc=
ie', 'mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pcie=
@11290000: failed to match any schema with compatible: ['mediatek,mt7988-pc=
ie', 'mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@1129=
0000 (mediatek,mt7988-pcie): compatible: ['mediatek,mt7988-pcie', 'mediatek=
,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie'] has non-uniq=
ue elements
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
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
   	'mediatek,mt8188-efuse' was expected
   	'mediatek,mt8186-efuse' was expected
   	'mediatek,efuse' is not one of ['mediatek,mt8186-efuse', 'mediatek,mt81=
88-efuse']
   	'mediatek,efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt76=
23-efuse', 'mediatek,mt7981-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt79=
88-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt81=
92-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yam=
l#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: efuse@11d=
30000 (mediatek,efuse): Unevaluated properties are not allowed ('compatible=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yam=
l#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/deva=
pc@1a110000: failed to match any schema with compatible: ['mediatek,mt7987-=
devapc']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc_netsy=
s (simple-bus): $nodename:0: 'soc_netsys' does not match '^([a-z][a-z0-9\\-=
]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: syscon@15=
031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,mt7988-ethwarp', '=
syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: syscon@15=
031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml#
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
excel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): 'clock-names' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' conditional fa=
iled, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): interrupt-names: ['ring0', 'ring1'=
, 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): interrupts: [[0, 214, 4], [0, 215,=
 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_nets=
ys/crypto@15600000: failed to match any schema with compatible: ['inside-se=
cure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: MikroBus =
(simple-bus): $nodename:0: 'MikroBus' does not match '^([a-z][a-z0-9\\-]+-b=
us|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: MikroBus =
(simple-bus): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: MikroBus =
(simple-bus): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: MikroBus =
(simple-bus): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /MikroBus=
/gpio-export@0: failed to match any schema with compatible: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-3: '=
gpio-export,name', 'gpio-export,output' do not match any of the regexes: '^=
#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gp=
mc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^=
(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rca=
r_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|s=
t-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IB=
M,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '=
^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*'=
, '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,=
=2E*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adapt=
rum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*'=
, '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*'=
, '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', '^all=
iedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '=
^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '=
^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*',=
 '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*',=
 '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^=
argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arm=
som,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.=
*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*'=
, '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.=
*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^a=
xis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*=
', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*'=
, '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brc=
m,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
=2E*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.=
*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^ce=
llwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', =
'^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel=
,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^=
cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^c=
nm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^conga=
tec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosm=
ic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot=
,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui=
,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*',=
 '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.=
*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difr=
nce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.=
*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^ela=
n,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*'=
, '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*',=
 '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '=
^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^fe=
iyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^free=
box,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujits=
u,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*=
', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,=
=2E*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^=
gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^ha=
rdkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', =
'^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.=
*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*',=
 '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*'=
, '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hyni=
x,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei=
,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo=
,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^=
inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*',=
 '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,=
=2E*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,=
=2E*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^i=
te,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^j=
asonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,=
=2E*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*=
', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kine=
tic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^ko=
bol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^la=
cie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*=
', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^le=
novo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lin=
aro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^lin=
ksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luc=
kfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^=
macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*',=
 '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexi=
s,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menl=
o,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*=
', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mi=
crosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^m=
iniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mi=
tsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtron=
ix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '=
^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^m=
si,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^mura=
ta,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', =
'^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', =
'^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.=
*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*=
', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^no=
thing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^=
nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', =
'^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*',=
 '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^opena=
ilab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.=
*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech=
,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*',=
 '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*=
', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*'=
, '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriv=
er,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*=
', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '=
^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^=
powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^pr=
obox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*=
', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qisheng=
long,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,=
=2E*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realte=
k,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^re=
tronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikoma=
gic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*=
', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^=
sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '=
^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '=
^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*'=
, '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^=
sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinew=
orld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*=
', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,=
=2E*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-eric=
sson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^=
ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^=
summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*',=
 '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-b=
iometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^tea=
m-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', =
'^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', =
'^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*=
', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,=
=2E*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.=
*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^=
tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsma=
rt,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-b=
lox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace=
,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi=
,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*',=
 '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^via=
lab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vis=
hay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocor=
e,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '=
^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we=
,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*',=
 '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*=
', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*=
', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen=
,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,=
=2E*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', =
'^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.=
*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yur=
idenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zid=
oo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-4: '=
gpio-export,name', 'gpio-export,output' do not match any of the regexes: '^=
#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gp=
mc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^=
(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rca=
r_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|s=
t-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IB=
M,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '=
^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*'=
, '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,=
=2E*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adapt=
rum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*'=
, '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*'=
, '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', '^all=
iedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '=
^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '=
^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*',=
 '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*',=
 '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^=
argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arm=
som,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.=
*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*'=
, '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.=
*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^a=
xis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*=
', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*'=
, '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brc=
m,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
=2E*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.=
*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^ce=
llwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', =
'^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel=
,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^=
cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^c=
nm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^conga=
tec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosm=
ic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot=
,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui=
,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*',=
 '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.=
*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difr=
nce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.=
*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^ela=
n,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*'=
, '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*',=
 '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '=
^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^fe=
iyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^free=
box,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujits=
u,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*=
', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,=
=2E*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^=
gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^ha=
rdkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', =
'^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.=
*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*',=
 '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*'=
, '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hyni=
x,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei=
,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo=
,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^=
inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*',=
 '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,=
=2E*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,=
=2E*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^i=
te,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^j=
asonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,=
=2E*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*=
', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kine=
tic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^ko=
bol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^la=
cie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*=
', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^le=
novo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lin=
aro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^lin=
ksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luc=
kfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^=
macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*',=
 '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexi=
s,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menl=
o,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*=
', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mi=
crosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^m=
iniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mi=
tsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtron=
ix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '=
^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^m=
si,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^mura=
ta,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', =
'^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', =
'^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.=
*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*=
', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^no=
thing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^=
nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', =
'^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*',=
 '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^opena=
ilab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.=
*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech=
,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*',=
 '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*=
', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*'=
, '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriv=
er,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*=
', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '=
^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^=
powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^pr=
obox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*=
', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qisheng=
long,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,=
=2E*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realte=
k,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^re=
tronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikoma=
gic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*=
', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^=
sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '=
^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '=
^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*'=
, '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^=
sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinew=
orld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*=
', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,=
=2E*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-eric=
sson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^=
ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^=
summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*',=
 '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-b=
iometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^tea=
m-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', =
'^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', =
'^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*=
', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,=
=2E*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.=
*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^=
tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsma=
rt,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-b=
lox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace=
,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi=
,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*',=
 '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^via=
lab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vis=
hay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocor=
e,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '=
^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we=
,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*',=
 '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*=
', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*=
', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen=
,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,=
=2E*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', =
'^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.=
*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yur=
idenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zid=
oo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-5: '=
gpio-export,name', 'gpio-export,output' do not match any of the regexes: '^=
#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gp=
mc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^=
(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rca=
r_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|s=
t-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IB=
M,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '=
^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*'=
, '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,=
=2E*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adapt=
rum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*'=
, '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*'=
, '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', '^all=
iedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '=
^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '=
^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*',=
 '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*',=
 '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^=
argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arm=
som,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.=
*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*'=
, '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.=
*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^a=
xis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*=
', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*'=
, '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brc=
m,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
=2E*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.=
*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^ce=
llwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', =
'^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel=
,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^=
cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^c=
nm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^conga=
tec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosm=
ic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot=
,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui=
,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*',=
 '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.=
*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difr=
nce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.=
*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^ela=
n,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*'=
, '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*',=
 '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '=
^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^fe=
iyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^free=
box,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujits=
u,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*=
', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,=
=2E*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^=
gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^ha=
rdkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', =
'^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.=
*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*',=
 '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*'=
, '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hyni=
x,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei=
,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo=
,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^=
inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*',=
 '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,=
=2E*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,=
=2E*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^i=
te,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^j=
asonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,=
=2E*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*=
', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kine=
tic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^ko=
bol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^la=
cie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*=
', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^le=
novo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lin=
aro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^lin=
ksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luc=
kfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^=
macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*',=
 '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexi=
s,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menl=
o,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*=
', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mi=
crosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^m=
iniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mi=
tsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtron=
ix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '=
^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^m=
si,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^mura=
ta,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', =
'^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', =
'^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.=
*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*=
', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^no=
thing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^=
nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', =
'^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*',=
 '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^opena=
ilab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.=
*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech=
,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*',=
 '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*=
', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*'=
, '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriv=
er,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*=
', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '=
^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^=
powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^pr=
obox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*=
', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qisheng=
long,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,=
=2E*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realte=
k,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^re=
tronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikoma=
gic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*=
', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^=
sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '=
^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '=
^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*'=
, '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^=
sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinew=
orld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*=
', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,=
=2E*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-eric=
sson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^=
ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^=
summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*',=
 '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-b=
iometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^tea=
m-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', =
'^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', =
'^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*=
', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,=
=2E*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.=
*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^=
tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsma=
rt,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-b=
lox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace=
,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi=
,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*',=
 '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^via=
lab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vis=
hay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocor=
e,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '=
^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we=
,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*',=
 '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*=
', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*=
', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen=
,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,=
=2E*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', =
'^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.=
*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yur=
idenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zid=
oo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-6: '=
gpio-export,name', 'gpio-export,output' do not match any of the regexes: '^=
#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gp=
mc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^=
(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rca=
r_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|s=
t-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IB=
M,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '=
^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*'=
, '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,=
=2E*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adapt=
rum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*'=
, '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*'=
, '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', '^all=
iedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '=
^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '=
^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*',=
 '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*',=
 '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^=
argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arm=
som,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.=
*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*'=
, '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.=
*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^a=
xis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*=
', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*'=
, '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brc=
m,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
=2E*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.=
*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^ce=
llwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', =
'^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel=
,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^=
cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^c=
nm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^conga=
tec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosm=
ic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot=
,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui=
,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*',=
 '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.=
*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difr=
nce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.=
*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^ela=
n,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*'=
, '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*',=
 '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^ev=
erest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^ex=
egin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '=
^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^fe=
iyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^free=
box,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujits=
u,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^ge=
niatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*=
', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,=
=2E*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^=
gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^ha=
rdkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', =
'^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.=
*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*',=
 '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*'=
, '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hyni=
x,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei=
,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo=
,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^=
inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*',=
 '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,=
=2E*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,=
=2E*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^i=
te,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^j=
asonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,=
=2E*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*=
', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kine=
tic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^ko=
bol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^la=
cie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*=
', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^le=
novo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lin=
aro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^lin=
ksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luc=
kfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^=
macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*',=
 '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexi=
s,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menl=
o,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*=
', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mi=
crosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^m=
iniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mi=
tsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtron=
ix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '=
^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^m=
si,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^mura=
ta,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', =
'^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', =
'^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.=
*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*=
', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^no=
thing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^=
nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', =
'^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*',=
 '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^opena=
ilab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.=
*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech=
,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*',=
 '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*=
', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*'=
, '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriv=
er,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*=
', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '=
^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^=
powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^pr=
obox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*=
', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qisheng=
long,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,=
=2E*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realte=
k,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^re=
tronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikoma=
gic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*=
', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^=
sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '=
^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '=
^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*'=
, '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^=
sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinew=
orld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*=
', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,=
=2E*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-eric=
sson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^=
ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^=
summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*',=
 '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-b=
iometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^tea=
m-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', =
'^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', =
'^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*=
', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,=
=2E*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.=
*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^=
tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsma=
rt,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-b=
lox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace=
,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi=
,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*',=
 '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^via=
lab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vis=
hay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocor=
e,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '=
^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we=
,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*',=
 '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*=
', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*=
', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen=
,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,=
=2E*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', =
'^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.=
*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yur=
idenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zid=
oo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /MikroBus=
/gpio-export@1: failed to match any schema with compatible: ['gpio-export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-46: =
'gpio-export,name', 'gpio-export,output' do not match any of the regexes: '=
^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|g=
pmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '=
^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rc=
ar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|=
st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^I=
BM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', =
'^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*=
', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions=
,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptr=
um,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*',=
 '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*',=
 '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^=
alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^=
amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', =
'^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', =
'^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*',=
 '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^a=
rgon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arms=
om,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*=
', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*',=
 '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*=
', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^ax=
is,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*'=
, '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*',=
 '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm=
,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', =
'^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.=
*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*',=
 '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellw=
ise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^c=
hipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*=
', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cis=
co,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,=
=2E*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^congat=
ec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmi=
c,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,=
=2E*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cu=
i,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*'=
, '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,=
=2E*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^d=
ifrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dio=
o,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech=
,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*=
', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-=
systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edi=
max,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^=
elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,=
=2E*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro=
,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*=
', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*'=
, '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*',=
 '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*',=
 '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.=
*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*',=
 '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '=
^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^f=
ujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', =
'^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^ge=
f,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*',=
 '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*=
', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holte=
k,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.=
*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,=
=2E*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '=
^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', =
'^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^i=
nanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*=
', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^=
ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^=
jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome=
,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luck=
fox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^me=
as,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis=
,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo=
,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*'=
, '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mic=
rosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^mi=
niand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mit=
sumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtroni=
x,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^=
moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^ms=
i,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murat=
a,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '=
^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '=
^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*=
', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*'=
, '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^not=
hing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^n=
uvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '=
^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', =
'^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openai=
lab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*=
', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,=
=2E*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*=
', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineri=
ver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.=
*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', =
'^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '=
^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^p=
robox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.=
*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishen=
glong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink=
,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek=
,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^ret=
ronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomag=
ic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*'=
, '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^s=
akurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^=
satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '^=
seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*',=
 '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^s=
gmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewo=
rld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*'=
, '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsso=
n,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste=
,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^sum=
mit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^=
swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biom=
etrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-s=
ource-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^t=
echwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.=
*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*',=
 '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*',=
 '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^va=
mrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.=
*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.=
*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*'=
, '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^waco=
m,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*',=
 '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^wi=
dora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^=
winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^=
wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*',=
 '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', =
'^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro=
,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^y=
lm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,=
=2E*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-47: =
'gpio-export,name', 'gpio-export,output' do not match any of the regexes: '=
^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|g=
pmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '=
^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rc=
ar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|=
st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^I=
BM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', =
'^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*=
', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions=
,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptr=
um,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*',=
 '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*',=
 '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^=
alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^=
amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', =
'^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', =
'^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*',=
 '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^a=
rgon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arms=
om,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*=
', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*',=
 '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*=
', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^ax=
is,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*'=
, '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*',=
 '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm=
,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', =
'^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.=
*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*',=
 '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellw=
ise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^c=
hipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*=
', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cis=
co,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,=
=2E*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^congat=
ec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmi=
c,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,=
=2E*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cu=
i,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*'=
, '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,=
=2E*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^d=
ifrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dio=
o,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech=
,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*=
', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-=
systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edi=
max,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^=
elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,=
=2E*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro=
,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*=
', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*'=
, '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*',=
 '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*',=
 '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.=
*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*',=
 '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '=
^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^f=
ujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', =
'^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^ge=
f,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*',=
 '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*=
', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holte=
k,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.=
*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,=
=2E*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '=
^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', =
'^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^i=
nanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*=
', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^=
ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^=
jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome=
,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luck=
fox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^me=
as,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis=
,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo=
,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*'=
, '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mic=
rosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^mi=
niand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mit=
sumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtroni=
x,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^=
moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^ms=
i,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murat=
a,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '=
^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '=
^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*=
', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*'=
, '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^not=
hing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^n=
uvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '=
^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', =
'^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openai=
lab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*=
', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,=
=2E*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*=
', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineri=
ver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.=
*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', =
'^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '=
^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^p=
robox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.=
*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishen=
glong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink=
,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek=
,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^ret=
ronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomag=
ic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*'=
, '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^s=
akurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^=
satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '^=
seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*',=
 '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^s=
gmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewo=
rld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*'=
, '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsso=
n,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste=
,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^sum=
mit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^=
swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biom=
etrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-s=
ource-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^t=
echwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.=
*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*',=
 '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*',=
 '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^va=
mrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.=
*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.=
*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*'=
, '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^waco=
m,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*',=
 '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^wi=
dora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^=
winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^=
wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*',=
 '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', =
'^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro=
,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^y=
lm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,=
=2E*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-48: =
'gpio-export,name', 'gpio-export,output' do not match any of the regexes: '=
^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|g=
pmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '=
^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rc=
ar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|=
st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^I=
BM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', =
'^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*=
', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions=
,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptr=
um,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*',=
 '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*',=
 '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^=
alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^=
amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', =
'^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', =
'^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*',=
 '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^a=
rgon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arms=
om,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*=
', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*',=
 '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*=
', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^ax=
is,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*'=
, '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*',=
 '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm=
,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', =
'^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.=
*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*',=
 '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellw=
ise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^c=
hipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*=
', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cis=
co,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,=
=2E*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^congat=
ec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmi=
c,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,=
=2E*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cu=
i,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*'=
, '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,=
=2E*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^d=
ifrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dio=
o,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech=
,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*=
', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-=
systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edi=
max,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^=
elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,=
=2E*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro=
,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*=
', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*'=
, '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*',=
 '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*',=
 '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.=
*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*',=
 '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '=
^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^f=
ujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', =
'^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^ge=
f,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*',=
 '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*=
', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holte=
k,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.=
*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,=
=2E*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '=
^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', =
'^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^i=
nanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*=
', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^=
ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^=
jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome=
,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luck=
fox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^me=
as,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis=
,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo=
,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*'=
, '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mic=
rosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^mi=
niand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mit=
sumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtroni=
x,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^=
moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^ms=
i,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murat=
a,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '=
^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '=
^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*=
', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*'=
, '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^not=
hing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^n=
uvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '=
^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', =
'^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openai=
lab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*=
', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,=
=2E*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*=
', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineri=
ver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.=
*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', =
'^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '=
^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^p=
robox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.=
*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishen=
glong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink=
,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek=
,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^ret=
ronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomag=
ic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*'=
, '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^s=
akurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^=
satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '^=
seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*',=
 '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^s=
gmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewo=
rld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*'=
, '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsso=
n,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste=
,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^sum=
mit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^=
swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biom=
etrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-s=
ource-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^t=
echwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.=
*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*',=
 '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*',=
 '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^va=
mrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.=
*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.=
*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*'=
, '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^waco=
m,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*',=
 '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^wi=
dora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^=
winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^=
wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*',=
 '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', =
'^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro=
,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^y=
lm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,=
=2E*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-49: =
'gpio-export,name', 'gpio-export,output' do not match any of the regexes: '=
^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|g=
pmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '=
^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rc=
ar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|=
st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^I=
BM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', =
'^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*=
', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions=
,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptr=
um,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*',=
 '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*',=
 '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^=
alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^=
amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', =
'^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', =
'^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*',=
 '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^a=
rgon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arms=
om,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*=
', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*',=
 '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*=
', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^ax=
is,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*'=
, '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*',=
 '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm=
,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', =
'^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.=
*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*',=
 '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellw=
ise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^c=
hipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*=
', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cis=
co,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,=
=2E*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^congat=
ec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmi=
c,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,=
=2E*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cu=
i,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*'=
, '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,=
=2E*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^d=
ifrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dio=
o,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech=
,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*=
', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-=
systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edi=
max,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^=
elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,=
=2E*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro=
,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*=
', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*'=
, '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*',=
 '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*',=
 '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.=
*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*',=
 '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '=
^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^f=
ujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', =
'^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^ge=
f,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*',=
 '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalsca=
le,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^go=
odix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',=
 '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '=
^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*=
', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holte=
k,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.=
*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,=
=2E*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '=
^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', =
'^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^i=
nanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*=
', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^=
ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^=
jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome=
,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luck=
fox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^me=
as,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis=
,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo=
,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*'=
, '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mic=
rosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^mi=
niand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mit=
sumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtroni=
x,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^=
moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^ms=
i,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murat=
a,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '=
^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '=
^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*=
', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*'=
, '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^not=
hing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^n=
uvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '=
^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', =
'^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openai=
lab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*=
', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,=
=2E*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*=
', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineri=
ver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.=
*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', =
'^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '=
^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^p=
robox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.=
*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishen=
glong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink=
,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek=
,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^ret=
ronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomag=
ic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*'=
, '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^s=
akurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^=
satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '^=
seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*',=
 '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^s=
gmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewo=
rld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^sif=
ive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '=
^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile=
,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sin=
ovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitroni=
x,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sma=
rtrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*',=
 '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*'=
, '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsso=
n,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste=
,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^sum=
mit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^=
swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biom=
etrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-s=
ource-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^t=
echwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^t=
esla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', =
'^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*'=
, '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.=
*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*=
', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.=
*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*',=
 '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*',=
 '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^va=
mrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.=
*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.=
*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*'=
, '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^waco=
m,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*',=
 '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^wi=
dora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^=
winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^=
wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*',=
 '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', =
'^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro=
,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^y=
lm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,=
=2E*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-keys=
 (gpio-keys): 'reset', 'wps' do not match any of the regexes: '^(button|eve=
nt|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event=
|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pwm-leds =
(pwm-leds): 'sys-led' does not match any of the regexes: '^led(-[0-9a-f]+)?=
$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
