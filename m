Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E6A4A68B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055029; cv=none; b=Ish+h2M0OjvcwFN9Q0UYEyeSv647SjqY81kHWM4QEkZz6V6WARAOFIE1gWpw5DlBK5OogJER/r1b6HcoodCN4evgdyOE7x4c4FKwWgM02M8Y49rmuz4bpayYtEprb9gDEKv14Nnzx2HPWBz8lrYrF4trMfUkwTelkoS/rZuq710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055029; c=relaxed/simple;
	bh=0//h6NSqQoVLw9/neyzlnIeYWa6gy/K4v9eJqwfdWmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T3jPcZ1wyRIQhbryfDw6FoyJzJ7jjPdExJ0m2i7BgQ0u0hT2MQFMEjPrbi2Qc+UXiuZazsGxDyge92AqApmQR3bm5SKlxHVJqXPEJXnm3qYOKmLUDrqYujNPoelr1ndEeHEt/RTxg1viKK4O5Qmws+cKYNvTEkEVEZ9fvmR3gqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9ZB94+A; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9ZB94+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055017; x=1820591017;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0//h6NSqQoVLw9/neyzlnIeYWa6gy/K4v9eJqwfdWmE=;
  b=b9ZB94+AAneGMW+nWQn+ybhn6IoTL77Ap92jhgvEywNnC+3Mx/vL4EQq
   IjnRkY0KV03l2Gb9wM2QxEa6nGvBIlriMyFA+2uEkmzO4OpBVMMbLgPvd
   kBT5fqWyX7QzLBkPtbT2TSkz64XRVhsqIE8rM4NwqFZrt+WTZjFDlpXh7
   i00YvKmV1TWf0PtijdYqw+S8ycaLEHDoQMNlyntpq1M3AeZCkm3ubet0w
   q8jGO/EyWSmY5I59TnbkW3pHnwmaJgR36ZIi5pgN49l0SVAMA9k4gmdeo
   qteqqHGwT8nzVAVOG0hJogMPd5rEtgYruAKN4/S98YiYrxX0qTXu+kPcq
   w==;
X-CSE-ConnectionGUID: +oG9S90eR8iqhPiJwl10jA==
X-CSE-MsgGUID: fD+cQwyfSP+c/LoUR/sz8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112280566"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="112280566"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:34 -0700
X-CSE-ConnectionGUID: ky69X3N2R4W9czbpgpP/QA==
X-CSE-MsgGUID: EGBGlYw4TbuiWroHWKwBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295152013"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 08:43:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvx-000000000RL-3r4o;
	Thu, 10 Sep 2026 15:43:29 +0000
Date: Thu, 10 Sep 2026 17:42:43 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 213/213]
 =?us-ascii?Q?arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd?=
 =?us-ascii?Q?-nand-1pci2lane.dtb:?= trng@1020f000 (mediatek,mt7987-rng):
 'reg' is a required property
Message-ID: <202609101521.CdKeEUKH-lkp@intel.com>
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
commit: f706f833968996e1142a575b6289bc4875c22de2 [213/213] arm64: dts: medi=
atek: apply mt7987 pcie overlays on buildtime
config: arm64-randconfig-2054-20260909 (https://download.01.org/0day-ci/arc=
hive/20260910/202609101521.CdKeEUKH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260910/202609101521.CdKeEUKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101521.CdKeEUKH-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one m=
ust be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['=
mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with comp=
atible: ['mediatek,infracfg_ao_bus_hang_prot']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible:=
 ['mediatek,mt7987-pinctrl']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible=
: ['mediatek,boottrap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' =
does not match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' condition=
al failed, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,m=
t7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,m=
t7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-=
rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['m=
ediatek,mt7987-pwm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match=
 '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed (=
'#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: eeprom@50 (atmel,24c02): page-size: b'\x00\x00\x00\x08' is not of =
type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('=
address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' condi=
tional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_c=
lk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [2=
2, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,w=
ed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: wed (mediatek,wed): wed_num: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['=
mediatek,wed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: wed0@15010000 (mediatek,wed0): pci_slot_map: b'\x00\x00\x00\x00' i=
s not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['=
mediatek,wed-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditio=
nal failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/devapc@1a110000: failed to match any schema with compatible: =
['mediatek,mt7987-devapc']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: soc_netsys (simple-bus): $nodename:0: 'soc_netsys' does not match =
'^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: syscon@15031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,=
mt7988-ethwarp', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: syscon@15031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_netsys/ethernet@15100000: failed to match any schema with com=
patible: ['mediatek,mt7987-eth']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_netsys/hnat@15000000: failed to match any schema with compati=
ble: ['mediatek,mtk-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-wan: b'eth1\x00' is n=
ot of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-lan: b'lan\x00' is no=
t of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-max-gmac: b'\x00\x00\=
x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-ppe-num: b'\x00\x00\x=
00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-lan2: b'eth2\x00' is =
not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): 'eth' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): 'clock-names' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): interrupt-names:=
 ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): interrupts: [[0,=
 214, 4], [0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'one=
Of' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_netsys/crypto@15600000: failed to match any schema with compa=
tible: ['inside-secure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): eth: b'\x00\x00\=
x004' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mikro-bus (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mikro-bus (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /mikro-bus/gpio-export@0: failed to match any schema with compatib=
le: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-3: gpio-export,name: b'mikrobus-gpio-RX\x00' is not of type '=
object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-3: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-3: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-=
tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athero=
s,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*'=
, '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banana=
pi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*',=
 '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.=
*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^=
bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*'=
, '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cell=
wise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^=
chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.=
*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^ci=
sco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,=
.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu=
,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^c=
znic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*'=
, '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^=
dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*'=
, '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*'=
, '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '=
^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-syst=
art,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,=
.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfoc=
hips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*'=
, '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', =
'^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,=
.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro=
,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', =
'^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.=
*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.=
*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*',=
 '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,=
.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*=
', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena=
,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*'=
, '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexi=
s,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^gline=
t,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^g=
oldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grin=
n,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.=
*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechua=
ng,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,=
.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^i=
bm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,=
.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^i=
ncostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jian=
da,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,=
.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^ki=
netic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^=
kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^=
lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,=
.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^=
lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^l=
inaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^lin=
ksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^li=
ontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn=
,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^m=
apleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', =
'^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^=
milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mirame=
ms,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,=
.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mo=
torcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*=
', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,=
.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', =
'^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', =
'^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.=
*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox=
,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '=
^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^n=
ovtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^=
nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^ok=
aya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*'=
, '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^open=
ailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,=
.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.=
*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-=
[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^p=
lathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*',=
 '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^=
primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '=
^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qia=
odian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radx=
a,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^r=
aumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relf=
or,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '=
^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^ri=
komagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,=
.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*=
', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*',=
 '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,=
.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^s=
ensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*'=
, '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,=
.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*=
', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan=
,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', =
'^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,=
.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*',=
 '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.=
*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^sol=
idrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcepa=
rts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '=
^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-=
ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*'=
, '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*'=
, '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,=
.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*=
', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^=
ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vert=
excom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virti=
o,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*'=
, '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^wa=
veshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',=
 '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wil=
lsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wi=
nstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', =
'^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xic=
or,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*',=
 '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*=
', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zini=
tix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-4: gpio-export,name: b'mikrobus-gpio-TX\x00' is not of type '=
object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-4: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-4: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-=
tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athero=
s,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*'=
, '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banana=
pi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*',=
 '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.=
*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^=
bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*'=
, '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cell=
wise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^=
chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.=
*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^ci=
sco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,=
.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu=
,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^c=
znic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*'=
, '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^=
dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*'=
, '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*'=
, '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '=
^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-syst=
art,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,=
.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfoc=
hips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*'=
, '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', =
'^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,=
.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro=
,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', =
'^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.=
*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.=
*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*',=
 '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,=
.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*=
', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena=
,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*'=
, '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexi=
s,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^gline=
t,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^g=
oldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grin=
n,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.=
*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechua=
ng,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,=
.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^i=
bm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,=
.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^i=
ncostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jian=
da,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,=
.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^ki=
netic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^=
kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^=
lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,=
.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^=
lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^l=
inaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^lin=
ksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^li=
ontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn=
,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^m=
apleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', =
'^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^=
milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mirame=
ms,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,=
.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mo=
torcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*=
', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,=
.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', =
'^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', =
'^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.=
*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox=
,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '=
^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^n=
ovtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^=
nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^ok=
aya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*'=
, '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^open=
ailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,=
.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.=
*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-=
[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^p=
lathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*',=
 '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^=
primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '=
^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qia=
odian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radx=
a,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^r=
aumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relf=
or,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '=
^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^ri=
komagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,=
.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*=
', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*',=
 '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,=
.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^s=
ensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*'=
, '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,=
.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*=
', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan=
,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', =
'^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,=
.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*',=
 '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.=
*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^sol=
idrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcepa=
rts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '=
^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-=
ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*'=
, '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*'=
, '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,=
.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*=
', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^=
ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vert=
excom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virti=
o,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*'=
, '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^wa=
veshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',=
 '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wil=
lsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wi=
nstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', =
'^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xic=
or,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*',=
 '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*=
', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zini=
tix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-5: gpio-export,name: b'mikrobus-gpio-INT\x00' is not of type =
'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-5: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-5: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-=
tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athero=
s,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*'=
, '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banana=
pi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*',=
 '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.=
*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^=
bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*'=
, '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cell=
wise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^=
chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.=
*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^ci=
sco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,=
.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu=
,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^c=
znic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*'=
, '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^=
dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*'=
, '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*'=
, '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '=
^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-syst=
art,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,=
.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfoc=
hips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*'=
, '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', =
'^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,=
.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro=
,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', =
'^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.=
*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.=
*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*',=
 '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,=
.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*=
', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena=
,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*'=
, '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexi=
s,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^gline=
t,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^g=
oldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grin=
n,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.=
*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechua=
ng,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,=
.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^i=
bm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,=
.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^i=
ncostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jian=
da,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,=
.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^ki=
netic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^=
kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^=
lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,=
.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^=
lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^l=
inaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^lin=
ksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^li=
ontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn=
,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^m=
apleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', =
'^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^=
milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mirame=
ms,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,=
.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mo=
torcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*=
', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,=
.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', =
'^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', =
'^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.=
*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox=
,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '=
^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^n=
ovtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^=
nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^ok=
aya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*'=
, '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^open=
ailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,=
.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.=
*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-=
[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^p=
lathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*',=
 '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^=
primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '=
^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qia=
odian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radx=
a,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^r=
aumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relf=
or,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '=
^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^ri=
komagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,=
.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*=
', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*',=
 '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,=
.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^s=
ensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*'=
, '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,=
.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*=
', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan=
,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', =
'^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,=
.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*',=
 '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.=
*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^sol=
idrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcepa=
rts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '=
^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-=
ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*'=
, '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*'=
, '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,=
.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*=
', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^=
ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vert=
excom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virti=
o,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*'=
, '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^wa=
veshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',=
 '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wil=
lsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wi=
nstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', =
'^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xic=
or,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*',=
 '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*=
', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zini=
tix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-6: gpio-export,name: b'mikrobus-gpio-INT\x00' is not of type =
'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-6: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-6: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-=
tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athero=
s,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*'=
, '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banana=
pi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*',=
 '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.=
*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^=
bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*'=
, '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cell=
wise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^=
chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.=
*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^ci=
sco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,=
.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu=
,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^c=
znic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*'=
, '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^=
dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*'=
, '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*'=
, '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '=
^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-syst=
art,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,=
.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfoc=
hips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*'=
, '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', =
'^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,=
.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro=
,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', =
'^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.=
*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.=
*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*',=
 '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,=
.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*=
', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena=
,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*'=
, '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexi=
s,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^gline=
t,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^g=
oldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grin=
n,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.=
*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechua=
ng,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,=
.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^i=
bm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,=
.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^i=
ncostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jian=
da,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,=
.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^ki=
netic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^=
kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^=
lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,=
.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^=
lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^l=
inaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^lin=
ksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^li=
ontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn=
,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^m=
apleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', =
'^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^=
milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mirame=
ms,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,=
.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mo=
torcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*=
', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,=
.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', =
'^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', =
'^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.=
*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox=
,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '=
^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^n=
ovtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^=
nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^ok=
aya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*'=
, '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^open=
ailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,=
.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.=
*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-=
[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^p=
lathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*',=
 '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^=
primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '=
^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qia=
odian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radx=
a,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^r=
aumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relf=
or,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '=
^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^ri=
komagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,=
.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*=
', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*',=
 '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,=
.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^s=
ensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*'=
, '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,=
.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*=
', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan=
,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', =
'^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,=
.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*',=
 '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.=
*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^sol=
idrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcepa=
rts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '=
^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-=
ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*'=
, '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*'=
, '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,=
.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*=
', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^=
ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vert=
excom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virti=
o,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*'=
, '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^wa=
veshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',=
 '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wil=
lsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wi=
nstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', =
'^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xic=
or,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*',=
 '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*=
', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zini=
tix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /mikro-bus/gpio-export@1: failed to match any schema with compatib=
le: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-46: gpio-export,name: b'mikrobus-gpio-CS\x00' is not of type =
'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-46: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-46: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', =
'^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl=
-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^ather=
os,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^=
avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*=
', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banan=
api,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*'=
, '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,=
.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '=
^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda=
,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*=
', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cel=
lwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '=
^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,=
.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^c=
isco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cn=
m,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia=
,.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ct=
u,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*=
', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '=
^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*=
', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfo=
chips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*=
', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',=
 '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw=
,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicr=
o,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*',=
 '^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,=
.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,=
.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,=
.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,=
.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*'=
, '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink=
,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.=
*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^garden=
a,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*=
', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genex=
is,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glin=
et,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^gri=
nn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,=
.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechu=
ang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi=
,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^=
ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lw=
n,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^=
mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*',=
 '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^=
meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mel=
e,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mem=
sic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.=
*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micr=
osoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '=
^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miram=
ems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^m=
otorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.=
*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno=
,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',=
 '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',=
 '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '=
^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^o=
kaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortuste=
ch,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*=
', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,=
.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,=
.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl=
-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^=
plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*'=
, '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,=
.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '=
^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', =
'^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^rel=
for,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', =
'^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^r=
ikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^ro=
hm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve=
,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.=
*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*'=
, '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed=
,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^=
sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*=
', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech=
,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.=
*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^sila=
n,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*',=
 '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip=
,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*'=
, '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,=
.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^so=
lidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', =
'^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st=
-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*=
', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*=
', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro=
,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.=
*', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '=
^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^u=
si,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wi=
llsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
cor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*=
', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*'=
, '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.=
*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zin=
itix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-47: gpio-export,name: b'mikrobus-gpio-MOSI\x00' is not of typ=
e 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-47: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-47: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', =
'^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl=
-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^ather=
os,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^=
avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*=
', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banan=
api,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*'=
, '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,=
.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '=
^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda=
,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*=
', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cel=
lwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '=
^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,=
.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^c=
isco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cn=
m,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia=
,.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ct=
u,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*=
', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '=
^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*=
', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfo=
chips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*=
', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',=
 '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw=
,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicr=
o,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*',=
 '^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,=
.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,=
.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,=
.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,=
.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*'=
, '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink=
,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.=
*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^garden=
a,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*=
', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genex=
is,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glin=
et,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^gri=
nn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,=
.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechu=
ang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi=
,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^=
ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lw=
n,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^=
mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*',=
 '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^=
meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mel=
e,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mem=
sic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.=
*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micr=
osoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '=
^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miram=
ems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^m=
otorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.=
*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno=
,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',=
 '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',=
 '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '=
^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^o=
kaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortuste=
ch,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*=
', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,=
.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,=
.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl=
-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^=
plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*'=
, '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,=
.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '=
^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', =
'^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^rel=
for,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', =
'^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^r=
ikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^ro=
hm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve=
,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.=
*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*'=
, '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed=
,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^=
sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*=
', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech=
,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.=
*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^sila=
n,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*',=
 '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip=
,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*'=
, '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,=
.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^so=
lidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', =
'^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st=
-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*=
', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*=
', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro=
,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.=
*', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '=
^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^u=
si,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wi=
llsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
cor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*=
', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*'=
, '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.=
*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zin=
itix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-48: gpio-export,name: b'mikrobus-gpio-MISO\x00' is not of typ=
e 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-48: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-48: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', =
'^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl=
-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^ather=
os,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^=
avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*=
', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banan=
api,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*'=
, '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,=
.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '=
^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda=
,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*=
', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cel=
lwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '=
^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,=
.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^c=
isco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cn=
m,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia=
,.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ct=
u,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*=
', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '=
^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*=
', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfo=
chips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*=
', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',=
 '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw=
,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicr=
o,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*',=
 '^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,=
.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,=
.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,=
.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,=
.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*'=
, '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink=
,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.=
*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^garden=
a,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*=
', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genex=
is,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glin=
et,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^gri=
nn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,=
.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechu=
ang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi=
,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^=
ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lw=
n,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^=
mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*',=
 '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^=
meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mel=
e,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mem=
sic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.=
*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micr=
osoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '=
^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miram=
ems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^m=
otorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.=
*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno=
,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',=
 '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',=
 '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '=
^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^o=
kaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortuste=
ch,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*=
', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,=
.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,=
.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl=
-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^=
plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*'=
, '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,=
.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '=
^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', =
'^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^rel=
for,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', =
'^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^r=
ikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^ro=
hm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve=
,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.=
*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*'=
, '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed=
,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^=
sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*=
', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech=
,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.=
*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^sila=
n,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*',=
 '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip=
,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*'=
, '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,=
.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^so=
lidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', =
'^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st=
-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*=
', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*=
', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro=
,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.=
*', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '=
^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^u=
si,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wi=
llsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
cor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*=
', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*'=
, '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.=
*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zin=
itix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-49: gpio-export,name: b'mikrobus-gpio-SCK\x00' is not of type=
 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-49: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-49: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', =
'^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl=
-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^ather=
os,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^=
avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*=
', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banan=
api,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*'=
, '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,=
.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '=
^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda=
,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*=
', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cel=
lwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '=
^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,=
.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^c=
isco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cn=
m,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia=
,.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ct=
u,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*=
', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '=
^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*=
', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfo=
chips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*=
', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',=
 '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw=
,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicr=
o,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*',=
 '^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,=
.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,=
.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,=
.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,=
.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*'=
, '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink=
,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.=
*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^garden=
a,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*=
', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genex=
is,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glin=
et,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^gri=
nn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,=
.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechu=
ang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi=
,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^=
ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lw=
n,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^=
mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*',=
 '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^=
meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mel=
e,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mem=
sic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.=
*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micr=
osoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '=
^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miram=
ems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^m=
otorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.=
*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno=
,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',=
 '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',=
 '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '=
^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^o=
kaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortuste=
ch,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*=
', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,=
.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,=
.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl=
-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^=
plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*'=
, '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,=
.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '=
^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', =
'^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^rel=
for,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', =
'^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^r=
ikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^ro=
hm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve=
,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.=
*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*'=
, '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed=
,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^=
sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*=
', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech=
,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.=
*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^sila=
n,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*',=
 '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip=
,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*'=
, '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,=
.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^so=
lidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', =
'^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st=
-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*=
', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*=
', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro=
,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.=
*', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '=
^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^u=
si,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wi=
llsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
cor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*=
', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*'=
, '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.=
*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zin=
itix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
--
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one m=
ust be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['=
mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with comp=
atible: ['mediatek,infracfg_ao_bus_hang_prot']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible:=
 ['mediatek,mt7987-pinctrl']
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible=
: ['mediatek,boottrap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' =
does not match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' condition=
al failed, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,m=
t7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,m=
t7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-=
rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['m=
ediatek,mt7987-pwm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match=
 '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed (=
'#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: eeprom@50 (atmel,24c02): page-size: b'\x00\x00\x00\x08' is not of =
type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('=
address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' condi=
tional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_c=
lk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [2=
2, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,w=
ed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: wed (mediatek,wed): wed_num: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['=
mediatek,wed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: wed0@15010000 (mediatek,wed0): pci_slot_map: b'\x00\x00\x00\x00' i=
s not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['=
mediatek,wed-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditio=
nal failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/devapc@1a110000: failed to match any schema with compatible: =
['mediatek,mt7987-devapc']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: soc_netsys (simple-bus): $nodename:0: 'soc_netsys' does not match =
'^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: syscon@15031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,=
mt7988-ethwarp', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: syscon@15031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_netsys/ethernet@15100000: failed to match any schema with com=
patible: ['mediatek,mt7987-eth']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_netsys/hnat@15000000: failed to match any schema with compati=
ble: ['mediatek,mtk-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-wan: b'eth1\x00' is n=
ot of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-lan: b'lan\x00' is no=
t of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-max-gmac: b'\x00\x00\=
x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-ppe-num: b'\x00\x00\x=
00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: hnat@15000000 (mediatek,mtk-hnat_v5): mtketh-lan2: b'eth2\x00' is =
not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): 'eth' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): 'clock-names' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): interrupt-names:=
 ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): interrupts: [[0,=
 214, 4], [0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'one=
Of' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_netsys/crypto@15600000: failed to match any schema with compa=
tible: ['inside-secure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): eth: b'\x00\x00\=
x004' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mikro-bus (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mikro-bus (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /mikro-bus/gpio-export@0: failed to match any schema with compatib=
le: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-3: gpio-export,name: b'mikrobus-gpio-RX\x00' is not of type '=
object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-3: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-3: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-=
tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athero=
s,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*'=
, '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banana=
pi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*',=
 '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.=
*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^=
bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*'=
, '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cell=
wise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^=
chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.=
*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^ci=
sco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,=
.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu=
,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^c=
znic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*'=
, '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^=
dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*'=
, '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*'=
, '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '=
^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-syst=
art,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,=
.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfoc=
hips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*'=
, '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', =
'^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,=
.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro=
,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', =
'^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.=
*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.=
*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*',=
 '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,=
.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*=
', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena=
,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*'=
, '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexi=
s,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^gline=
t,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^g=
oldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grin=
n,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.=
*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechua=
ng,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,=
.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^i=
bm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,=
.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^i=
ncostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jian=
da,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,=
.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^ki=
netic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^=
kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^=
lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,=
.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^=
lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^l=
inaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^lin=
ksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^li=
ontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn=
,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^m=
apleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', =
'^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^=
milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mirame=
ms,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,=
.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mo=
torcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*=
', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,=
.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', =
'^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', =
'^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.=
*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox=
,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '=
^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^n=
ovtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^=
nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^ok=
aya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*'=
, '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^open=
ailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,=
.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.=
*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-=
[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^p=
lathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*',=
 '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^=
primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '=
^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qia=
odian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radx=
a,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^r=
aumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relf=
or,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '=
^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^ri=
komagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,=
.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*=
', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*',=
 '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,=
.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^s=
ensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*'=
, '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,=
.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*=
', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan=
,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', =
'^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,=
.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*',=
 '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.=
*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^sol=
idrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcepa=
rts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '=
^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-=
ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*'=
, '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*'=
, '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,=
.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*=
', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^=
ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vert=
excom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virti=
o,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*'=
, '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^wa=
veshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',=
 '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wil=
lsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wi=
nstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', =
'^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xic=
or,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*',=
 '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*=
', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zini=
tix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-4: gpio-export,name: b'mikrobus-gpio-TX\x00' is not of type '=
object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-4: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-4: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-=
tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athero=
s,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*'=
, '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banana=
pi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*',=
 '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.=
*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^=
bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*'=
, '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cell=
wise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^=
chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.=
*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^ci=
sco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,=
.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu=
,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^c=
znic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*'=
, '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^=
dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*'=
, '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*'=
, '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '=
^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-syst=
art,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,=
.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfoc=
hips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*'=
, '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', =
'^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,=
.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro=
,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', =
'^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.=
*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.=
*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*',=
 '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,=
.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*=
', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena=
,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*'=
, '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexi=
s,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^gline=
t,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^g=
oldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grin=
n,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.=
*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechua=
ng,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,=
.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^i=
bm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,=
.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^i=
ncostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jian=
da,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,=
.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^ki=
netic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^=
kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^=
lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,=
.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^=
lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^l=
inaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^lin=
ksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^li=
ontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn=
,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^m=
apleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', =
'^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^=
milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mirame=
ms,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,=
.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mo=
torcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*=
', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,=
.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', =
'^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', =
'^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.=
*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox=
,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '=
^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^n=
ovtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^=
nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^ok=
aya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*'=
, '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^open=
ailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,=
.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.=
*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-=
[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^p=
lathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*',=
 '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^=
primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '=
^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qia=
odian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radx=
a,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^r=
aumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relf=
or,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '=
^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^ri=
komagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,=
.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*=
', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*',=
 '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,=
.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^s=
ensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*'=
, '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,=
.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*=
', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan=
,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', =
'^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,=
.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*',=
 '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.=
*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^sol=
idrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcepa=
rts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '=
^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-=
ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*'=
, '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*'=
, '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,=
.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*=
', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^=
ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vert=
excom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virti=
o,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*'=
, '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^wa=
veshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',=
 '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wil=
lsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wi=
nstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', =
'^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xic=
or,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*',=
 '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*=
', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zini=
tix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-5: gpio-export,name: b'mikrobus-gpio-INT\x00' is not of type =
'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-5: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-5: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-=
tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athero=
s,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*'=
, '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banana=
pi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*',=
 '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.=
*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^=
bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*'=
, '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cell=
wise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^=
chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.=
*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^ci=
sco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,=
.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu=
,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^c=
znic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*'=
, '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^=
dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*'=
, '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*'=
, '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '=
^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-syst=
art,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,=
.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfoc=
hips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*'=
, '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', =
'^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,=
.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro=
,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', =
'^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.=
*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.=
*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*',=
 '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,=
.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*=
', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena=
,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*'=
, '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexi=
s,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^gline=
t,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^g=
oldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grin=
n,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.=
*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechua=
ng,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,=
.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^i=
bm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,=
.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^i=
ncostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jian=
da,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,=
.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^ki=
netic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^=
kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^=
lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,=
.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^=
lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^l=
inaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^lin=
ksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^li=
ontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn=
,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^m=
apleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', =
'^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^=
milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mirame=
ms,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,=
.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mo=
torcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*=
', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,=
.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', =
'^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', =
'^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.=
*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox=
,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '=
^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^n=
ovtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^=
nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^ok=
aya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*'=
, '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^open=
ailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,=
.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.=
*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-=
[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^p=
lathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*',=
 '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^=
primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '=
^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qia=
odian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radx=
a,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^r=
aumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relf=
or,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '=
^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^ri=
komagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,=
.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*=
', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*',=
 '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,=
.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^s=
ensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*'=
, '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,=
.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*=
', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan=
,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', =
'^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,=
.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*',=
 '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.=
*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^sol=
idrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcepa=
rts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '=
^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-=
ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*'=
, '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*'=
, '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,=
.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*=
', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^=
ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vert=
excom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virti=
o,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*'=
, '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^wa=
veshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',=
 '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wil=
lsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wi=
nstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', =
'^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xic=
or,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*',=
 '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*=
', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zini=
tix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-6: gpio-export,name: b'mikrobus-gpio-INT\x00' is not of type =
'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-6: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-6: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-=
tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^athero=
s,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*'=
, '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banana=
pi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*',=
 '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.=
*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^=
bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*',=
 '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,=
.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*'=
, '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cell=
wise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^=
chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.=
*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^ci=
sco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm=
,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,=
.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu=
,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^c=
znic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*'=
, '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^=
dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*'=
, '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', '=
^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*'=
, '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '=
^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-syst=
art,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,=
.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfoc=
hips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*'=
, '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', =
'^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,=
.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro=
,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', =
'^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.=
*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.=
*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*',=
 '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,=
.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*=
', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena=
,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*'=
, '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexi=
s,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^gline=
t,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^g=
oldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grin=
n,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.=
*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechua=
ng,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,=
.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*',=
 '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '=
^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hu=
gsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*',=
 '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^i=
bm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,=
.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^i=
ncostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jian=
da,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,=
.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^ki=
netic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^=
kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^=
lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,=
.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^=
lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^l=
inaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^lin=
ksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^li=
ontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lwn=
,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^m=
apleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', =
'^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^m=
eas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mele=
,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mems=
ic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*=
', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micro=
soft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^=
milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mirame=
ms,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,=
.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mo=
torcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*=
', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,=
.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', =
'^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', =
'^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.=
*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox=
,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '=
^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^n=
ovtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^=
nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^ok=
aya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*'=
, '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^open=
ailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,=
.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*'=
, '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.=
*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.=
*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-=
[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^p=
lathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*',=
 '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^=
primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '=
^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qia=
odian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radx=
a,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^r=
aumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relf=
or,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '=
^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^ri=
komagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,=
.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*=
', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*',=
 '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,=
.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^s=
ensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*'=
, '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,=
.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*=
', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan=
,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', =
'^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,=
.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*',=
 '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.=
*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^sol=
idrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcepa=
rts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '=
^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-=
ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*'=
, '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*'=
, '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,=
.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*=
', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*',=
 '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^t=
echnexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,=
.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasi=
c,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thin=
gyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*',=
 '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topw=
ise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*=
', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tr=
onsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*'=
, '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^u=
doo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '^=
ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^vert=
excom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virti=
o,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivant=
e,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*'=
, '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^wa=
veshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',=
 '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wil=
lsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wi=
nstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', =
'^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xic=
or,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^x=
lnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*'=
, '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*',=
 '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*=
', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zini=
tix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /mikro-bus/gpio-export@1: failed to match any schema with compatib=
le: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-46: gpio-export,name: b'mikrobus-gpio-CS\x00' is not of type =
'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-46: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-46: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', =
'^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl=
-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^ather=
os,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^=
avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*=
', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banan=
api,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*'=
, '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,=
.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '=
^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda=
,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*=
', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cel=
lwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '=
^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,=
.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^c=
isco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cn=
m,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia=
,.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ct=
u,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*=
', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '=
^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*=
', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfo=
chips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*=
', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',=
 '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw=
,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicr=
o,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*',=
 '^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,=
.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,=
.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,=
.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,=
.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*'=
, '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink=
,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.=
*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^garden=
a,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*=
', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genex=
is,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glin=
et,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^gri=
nn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,=
.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechu=
ang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi=
,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^=
ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lw=
n,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^=
mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*',=
 '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^=
meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mel=
e,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mem=
sic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.=
*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micr=
osoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '=
^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miram=
ems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^m=
otorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.=
*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno=
,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',=
 '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',=
 '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '=
^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^o=
kaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortuste=
ch,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*=
', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,=
.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,=
.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl=
-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^=
plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*'=
, '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,=
.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '=
^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', =
'^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^rel=
for,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', =
'^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^r=
ikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^ro=
hm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve=
,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.=
*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*'=
, '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed=
,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^=
sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*=
', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech=
,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.=
*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^sila=
n,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*',=
 '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip=
,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*'=
, '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,=
.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^so=
lidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', =
'^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st=
-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*=
', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*=
', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro=
,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.=
*', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '=
^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^u=
si,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wi=
llsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
cor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*=
', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*'=
, '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.=
*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zin=
itix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-47: gpio-export,name: b'mikrobus-gpio-MOSI\x00' is not of typ=
e 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-47: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-47: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', =
'^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl=
-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^ather=
os,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^=
avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*=
', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banan=
api,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*'=
, '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,=
.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '=
^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda=
,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*=
', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cel=
lwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '=
^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,=
.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^c=
isco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cn=
m,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia=
,.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ct=
u,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*=
', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '=
^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*=
', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfo=
chips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*=
', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',=
 '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw=
,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicr=
o,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*',=
 '^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,=
.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,=
.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,=
.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,=
.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*'=
, '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink=
,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.=
*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^garden=
a,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*=
', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genex=
is,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glin=
et,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^gri=
nn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,=
.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechu=
ang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi=
,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^=
ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lw=
n,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^=
mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*',=
 '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^=
meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mel=
e,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mem=
sic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.=
*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micr=
osoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '=
^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miram=
ems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^m=
otorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.=
*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno=
,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',=
 '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',=
 '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '=
^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^o=
kaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortuste=
ch,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*=
', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,=
.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,=
.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl=
-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^=
plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*'=
, '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,=
.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '=
^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', =
'^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^rel=
for,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', =
'^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^r=
ikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^ro=
hm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve=
,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.=
*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*'=
, '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed=
,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^=
sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*=
', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech=
,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.=
*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^sila=
n,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*',=
 '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip=
,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*'=
, '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,=
.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^so=
lidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', =
'^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st=
-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*=
', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*=
', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro=
,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.=
*', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '=
^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^u=
si,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wi=
llsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
cor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*=
', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*'=
, '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.=
*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zin=
itix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-48: gpio-export,name: b'mikrobus-gpio-MISO\x00' is not of typ=
e 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-48: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-48: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', =
'^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl=
-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^ather=
os,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^=
avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*=
', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banan=
api,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*'=
, '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,=
.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '=
^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda=
,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*=
', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cel=
lwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '=
^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,=
.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^c=
isco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cn=
m,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia=
,.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ct=
u,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*=
', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '=
^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*=
', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfo=
chips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*=
', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',=
 '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw=
,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicr=
o,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*',=
 '^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,=
.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,=
.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,=
.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,=
.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*'=
, '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink=
,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.=
*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^garden=
a,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*=
', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genex=
is,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glin=
et,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^gri=
nn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,=
.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechu=
ang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi=
,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^=
ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lw=
n,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^=
mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*',=
 '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^=
meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mel=
e,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mem=
sic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.=
*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micr=
osoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '=
^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miram=
ems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^m=
otorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.=
*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno=
,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',=
 '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',=
 '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '=
^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^o=
kaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortuste=
ch,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*=
', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,=
.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,=
.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl=
-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^=
plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*'=
, '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,=
.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '=
^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', =
'^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^rel=
for,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', =
'^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^r=
ikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^ro=
hm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve=
,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.=
*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*'=
, '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed=
,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^=
sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*=
', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech=
,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.=
*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^sila=
n,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*',=
 '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip=
,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*'=
, '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,=
.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^so=
lidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', =
'^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st=
-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*=
', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*=
', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro=
,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.=
*', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '=
^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^u=
si,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wi=
llsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
cor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*=
', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*'=
, '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.=
*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zin=
itix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-49: gpio-export,name: b'mikrobus-gpio-SCK\x00' is not of type=
 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-49: gpio-export,output: b'\x00\x00\x00\x01' is not of type 'o=
bject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-49: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armchina,.*', '^armsom,.*', =
'^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl=
-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^ather=
os,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^=
avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*=
', '^axis,.*', '^ayaneo,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^banan=
api,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*'=
, '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,=
.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '=
^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*'=
, '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda=
,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*=
', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cel=
lwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '=
^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,=
.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^c=
isco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cn=
m,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia=
,.*', '^congatec,.*', '^coolpi,.*', '^corechips,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ct=
u,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*=
', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '=
^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*=
', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^displaytech,.*', '^djn,.*', =
'^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^doestek,.*', '^domintech,.*=
', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', =
'^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sys=
tart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax=
,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^efinix,.*', '^egnite,.*', '^einfo=
chips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*=
', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',=
 '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw=
,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicr=
o,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*',=
 '^esp,.*', '^est,.*', '^eswin,.*', '^etekmicro,.*', '^ettus,.*', '^eukrea,=
.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,=
.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,=
.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,=
.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*'=
, '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink=
,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.=
*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^garden=
a,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*=
', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genex=
is,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^gira,.*', '^glin=
et,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^gri=
nn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,=
.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechu=
ang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi=
,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holitech,.*'=
, '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', =
'^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^h=
ugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*'=
, '^hynetek,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^=
ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek=
,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^=
incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforc=
e,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo=
,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^k=
inetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '=
^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '=
^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb=
,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '=
^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^=
linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^li=
nksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^l=
iontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logict=
echno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*=
', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxshare,.*', '^luxul,.*', '^lw=
n,.*', '^lxa,.*', '^lxd,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^=
mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*',=
 '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^=
meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.*', '^mel=
e,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^mem=
sic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.=
*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^micr=
osoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '=
^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miram=
ems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre=
,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^m=
otorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.=
*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno=
,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',=
 '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',=
 '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,=
.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbo=
x,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '=
^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^o=
kaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onething,.*=
', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^ope=
nailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc=
,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortuste=
ch,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*=
', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,=
.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,=
.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl=
-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^=
plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*'=
, '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,=
.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '=
^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', =
'^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^rel=
for,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', =
'^revotics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^r=
ikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^ro=
hm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve=
,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.=
*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*'=
, '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed=
,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^=
sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*=
', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech=
,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.=
*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^sila=
n,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*',=
 '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip=
,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*'=
, '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,=
.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^so=
lidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', =
'^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st=
-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*=
', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*=
', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro=
,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.=
*', '^taiguanck,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*'=
, '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^teras=
ic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thi=
ngyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*'=
, '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^top=
wise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.=
*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^t=
ronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*=
', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^=
udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrapower,.*', '^ultrarisc,.*', '=
^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^u=
si,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^verbatim,.*', '^verisilicon,.*', '^ver=
texcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virt=
io,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivan=
te,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*=
', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^w=
aveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*'=
, '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiko,.*', '^wiligear,.*', '^wi=
llsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
cor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*=
', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*'=
, '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.=
*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zin=
itix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
