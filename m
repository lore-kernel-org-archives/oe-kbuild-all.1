Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF19347C0E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054902; cv=none; b=PPIoS3IreX+oCzN38tFZ7GM8I2Km34mEO60T2FClQa8Y8FfhcPohp3yIs2DC+Yy/BDEZvS0uJg1sAI4RsRv4jZ1RusPOb+aytO30oFJTL2op5K8JyQtOkWM83MzayH70L/ZYBqqN+2VXAMwA7S7bPOkaA45PLW9d0Vrcs/s7cws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054902; c=relaxed/simple;
	bh=/LxhMNX7M+nLuMiT3ntu1OPIemNhwyEY25fEevBxBzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=byemwOmwZiWTSEc3WKQTM7mxlcve6YS1xZA1fq08YmqJNCjzVvWMVnXyNMJEJMcM+xq0EtyXIG9krs5Y72aUTitr7g9CsWSDFze14cQKfUK+OHPB1YXVcOnbpaF4J84pUa2tdO6hY6acPHZ1WerjuyE3yjdtwzvsMFeUYyMsD2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyCwe+77; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyCwe+77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054895; x=1820590895;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/LxhMNX7M+nLuMiT3ntu1OPIemNhwyEY25fEevBxBzQ=;
  b=NyCwe+771uFOd5pgCXxgqpCc+udvnWGHXFS8KzIxOYOV6kHiyvS+Q7Qd
   6wEZqFxhgT3EzOh6GEd+FzrHxaZrqDtyNALXBz2ZYhnQSUV45NdjtWm+p
   7VF/HLrQcaGvh7AX4AqRCbsOQBIgljAqtsca+663ZisZ4dcqwGdZEHnPj
   uBd7YzvV31KLQHuNeOoVE7b20+QovTwPMWYWkgjtcK7n7pCv/klkXFi+8
   87yZThRLZe7Cr74SENQCIJfi4Ds1PGNgJMYZ9K8MZDCSXmdl0Pj0LeTkz
   JQQR3M6QLr7MS7LZJ9ax8+tsJjSGhCWIz4szMtQ/ujtjn6MLGZaaI4X4Y
   g==;
X-CSE-ConnectionGUID: lXsakOKeTEGIONy9CsARtw==
X-CSE-MsgGUID: IR09vl3pTyaIpvk1w0F10g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="88654647"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="88654647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:33 -0700
X-CSE-ConnectionGUID: fg7kU8yGS6mBCoHwYERukg==
X-CSE-MsgGUID: nosYKaNQRZec+uf339rS4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267983115"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qa-0zsy;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:40:59 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 213/213]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: trng@1020f000
 (mediatek,mt7987-rng): 'reg' is a required property
Message-ID: <202609100533.EI9pkSOQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   e2b8c6a7a01daa29f0109ecfd5d0fa93e27da8bf
commit: 8adef9d1dda1e07dfd743f75cd5c8b646f409ca0 [213/213] arm64: dts: medi=
atek: mt7987: Add Bananapi-R4 Lite
config: arm64-randconfig-2054-20260909 (https://download.01.org/0day-ci/arc=
hive/20260910/202609100533.EI9pkSOQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260910/202609100533.EI9pkSOQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100533.EI9pkSOQ-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pinc=
trl@1001f000: failed to match any schema with compatible: ['mediatek,mt7987=
-pinctrl']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/boot=
trap@1001f6f0: failed to match any schema with compatible: ['mediatek,boott=
rap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: trng@1020=
f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: trng@1020=
f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: trng@1020=
f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: trng@1020=
f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not match '^r=
ng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: trng@1020=
f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed, one mus=
t be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,m=
t7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,m=
t7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-=
rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pwm@=
10048000: failed to match any schema with compatible: ['mediatek,mt7987-pwm=
']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pca9545@7=
0 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pca9545@7=
0 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', =
'#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: eeprom@50=
 (atmel,24c02): page-size: b'\x00\x00\x00\x08' is not of type 'object', 'in=
teger', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: eeprom@50=
 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'pa=
ge-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: spi@11007=
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
--
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hc=
lk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mmc@11230=
000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], =
[22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/wed:=
 failed to match any schema with compatible: ['mediatek,wed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: wed (medi=
atek,wed): wed_num: b'\x00\x00\x00\x01' is not of type 'object', 'integer',=
 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/wed0=
@15010000: failed to match any schema with compatible: ['mediatek,wed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: wed0@1501=
0000 (mediatek,wed0): pci_slot_map: b'\x00\x00\x00\x00' is not of type 'obj=
ect', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/wdma=
@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@1128=
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
--
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/deva=
pc@1a110000: failed to match any schema with compatible: ['mediatek,mt7987-=
devapc']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc_netsy=
s (simple-bus): $nodename:0: 'soc_netsys' does not match '^([a-z][a-z0-9\\-=
]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: syscon@15=
031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,mt7988-ethwarp', '=
syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: syscon@15=
031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_nets=
ys/ethernet@15100000: failed to match any schema with compatible: ['mediate=
k,mt7987-eth']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_nets=
ys/hnat@15000000: failed to match any schema with compatible: ['mediatek,mt=
k-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: hnat@1500=
0000 (mediatek,mtk-hnat_v5): mtketh-wan: b'eth1\x00' is not of type 'object=
', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: hnat@1500=
0000 (mediatek,mtk-hnat_v5): mtketh-lan: b'lan\x00' is not of type 'object'=
, 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: hnat@1500=
0000 (mediatek,mtk-hnat_v5): mtketh-max-gmac: b'\x00\x00\x00\x03' is not of=
 type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: hnat@1500=
0000 (mediatek,mtk-hnat_v5): mtketh-ppe-num: b'\x00\x00\x00\x01' is not of =
type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: hnat@1500=
0000 (mediatek,mtk-hnat_v5): mtketh-lan2: b'eth2\x00' is not of type 'objec=
t', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): 'eth' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): 'clock-names' is a required proper=
ty
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): compatible: 'oneOf' conditional fa=
iled, one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: crypto@15=
600000 (inside-secure,safexcel-eip197b): eth: b'\x00\x00\x004' is not of ty=
pe 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mikro-bus=
 (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: mikro-bus=
 (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /mikro-bu=
s/gpio-export@0: failed to match any schema with compatible: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-3: g=
pio-export,name: b'mikrobus-gpio-RX\x00' is not of type 'object', 'integer'=
, 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-3: g=
pio-export,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', =
'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-4: g=
pio-export,name: b'mikrobus-gpio-TX\x00' is not of type 'object', 'integer'=
, 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-4: g=
pio-export,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', =
'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-5: g=
pio-export,name: b'mikrobus-gpio-INT\x00' is not of type 'object', 'integer=
', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-5: g=
pio-export,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', =
'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-6: g=
pio-export,name: b'mikrobus-gpio-INT\x00' is not of type 'object', 'integer=
', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-6: g=
pio-export,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', =
'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-46: =
gpio-export,name: b'mikrobus-gpio-CS\x00' is not of type 'object', 'integer=
', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-46: =
gpio-export,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer',=
 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
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
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-47: =
gpio-export,name: b'mikrobus-gpio-MOSI\x00' is not of type 'object', 'integ=
er', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-47: =
gpio-export,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer',=
 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-47: =
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
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-48: =
gpio-export,name: b'mikrobus-gpio-MISO\x00' is not of type 'object', 'integ=
er', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-48: =
gpio-export,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer',=
 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-48: =
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
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-49: =
gpio-export,name: b'mikrobus-gpio-SCK\x00' is not of type 'object', 'intege=
r', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-49: =
gpio-export,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer',=
 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: gpio-49: =
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
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
