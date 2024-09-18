Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816EA189F5B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726664363; cv=none; b=ujMPucYCvfdTnrTGGeBmH6u38jgRa5bcXdv0/fchKlagBUEXVtAt5W7KkznIHu3g0UmwC5XkXH03KcYR7AfbxgLYsZrLoXEgT16MhvHs/sy4ls+sig2qMt3Ozz97toPswNKXBQpmM0JYWwkJhvOdLJIwfa2Mlplavauukj5fVg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726664363; c=relaxed/simple;
	bh=fsrmE72CE50l/HTjZdQJ2XdGNRydpasglXjcWp9CO5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GEAqeH7SRi7O5YN6lMMmLbjybkemIuM2QdQ1Y7F+CYYe251ONqThbYDzMNz43AwKjrdBdLcrs817S71AgokXpuiH6kUMFoJOHAm+EoJUZv4/Sp3eHmDGwlR4+6jRFIUOEi1BYB707sAjvZGAU7Zy8la/JwL2FGAwqLctVKPaHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1Er0rYH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1Er0rYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726664360; x=1758200360;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fsrmE72CE50l/HTjZdQJ2XdGNRydpasglXjcWp9CO5g=;
  b=A1Er0rYH075ISwWvabB88460ZS3dAlx9DI2sX9NNwPuV0DgjmbyfjhER
   QCxPHVlQtTB+B3aLz0LfD/ToP8lt7pmqQJPZPBRiDZzsprUiPur01Ta8s
   WzK3dA3NA434b/xMZYul5AR+kS7dYI50VDTJOi91qvtkpbGUpqvVjT5DT
   6cy21ose0zE/lqs9WuFUB7Tmr3HId1yrjH79qsXeD8lnG2Zvyum3GRWa8
   gsKwUYYmgaeuG1sX8lqutV+57GKkDbTrqRqoLv1i3cGsAOdE8VTwxhWT/
   RvgrW123sEN2sD8Szgx5vxqQdBhip++AyvV2NfoeLwyu3iKMafJlc9cAu
   g==;
X-CSE-ConnectionGUID: ufg1Rn6aRUSkHmTUvPYHQw==
X-CSE-MsgGUID: uN/yrf/SRS6Zg+Ovep46rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25730543"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="25730543"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 05:59:19 -0700
X-CSE-ConnectionGUID: UENePhpXR8KXbBfXM4p5lg==
X-CSE-MsgGUID: aKnt5XtSTcic4rnKAzkbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="100284790"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Sep 2024 05:59:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1squH4-000CFi-16;
	Wed, 18 Sep 2024 12:59:14 +0000
Date: Wed, 18 Sep 2024 20:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 9136/12283] arch/powerpc/boot/dts/amigaone.dtb:
 pci@80000000: 'broken-usage-of-incorrect-compatible' is a required property
Message-ID: <202409182041.Rgd9uHIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
commit: 22e2bf1214ff50981c7e056970241a36ab1f3d14 [9136/12283] dt-bindings: =
incomplete-devices: And another batch of compatibles
config: powerpc-randconfig-051-20240916 (https://download.01.org/0day-ci/ar=
chive/20240918/202409182041.Rgd9uHIV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf6=
84034844c660b778f0eba103582f582b710c9)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240918/202409182041.Rgd9uHIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409182041.Rgd9uHIV-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/amigaone.dts:35.9-38.4: Warning (unit_address_vs_r=
eg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/amigaone.dts:57.9-163.5: Warning (interrupt_provid=
er): /pci@80000000/isa@7: '#interrupt-cells' found, but node is not an inte=
rrupt provider
   arch/powerpc/boot/dts/amigaone.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
   arch/powerpc/boot/dts/amigaone.dtb: /: memory: False schema does not all=
ow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/amigaone.dtb: /: failed to match any schema with c=
ompatible: ['eyetech,amigaone']
   arch/powerpc/boot/dts/amigaone.dtb: cpus: cpu@0:timebase-frequency: 0 is=
 less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/powerpc/boot/dts/amigaone.dtb: pci@80000000: 'broken-usage-of-incor=
rect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/amigaone.dtb: pci@80000000: '#address-cells', '#si=
ze-cells', '8259-interrupt-acknowledge', 'bus-frequency', 'bus-range', 'dev=
ice_type', 'isa@7', 'ranges', 'reg' do not match any of the regexes: 'pinct=
rl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/amigaone.dtb: pci@80000000: isa@7: 'reg' is a requ=
ired property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/amigaone.dtb: isa@7: Unevaluated properties are no=
t allowed ('#interrupt-cells', 'class-code', 'device-id', 'devsel-speed', '=
interrupt-parent', 'max-latency', 'min-grant', 'revision-id', 'subsystem-id=
', 'subsystem-vendor-id', 'vendor-id' were unexpected)
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml#
   arch/powerpc/boot/dts/amigaone.dtb: dma-controller@0: '#dma-cells' is a =
required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/amigaone.dtb: /pci@80000000/isa@7/dma-controller@0=
: failed to match any schema with compatible: ['pnpPNP,200']
   arch/powerpc/boot/dts/amigaone.dtb: /pci@80000000/isa@7/interrupt-contro=
ller@20: failed to match any schema with compatible: ['pnpPNP,000']
   arch/powerpc/boot/dts/amigaone.dtb: /pci@80000000/isa@7/timer@40: failed=
 to match any schema with compatible: ['pnpPNP,100']
--
   arch/powerpc/boot/dts/arches.dtb: /interrupt-controller3: failed to matc=
h any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
   arch/powerpc/boot/dts/arches.dtb: /interrupt-controller3: failed to matc=
h any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
   arch/powerpc/boot/dts/arches.dtb: /sdr: failed to match any schema with =
compatible: ['ibm,sdr-460gt']
   arch/powerpc/boot/dts/arches.dtb: /cpr: failed to match any schema with =
compatible: ['ibm,cpr-460gt']
   arch/powerpc/boot/dts/arches.dtb: /l2c: failed to match any schema with =
compatible: ['ibm,l2-cache-460gt', 'ibm,l2-cache']
   arch/powerpc/boot/dts/arches.dtb: /l2c: failed to match any schema with =
compatible: ['ibm,l2-cache-460gt', 'ibm,l2-cache']
   arch/powerpc/boot/dts/arches.dtb: /plb: failed to match any schema with =
compatible: ['ibm,plb-460gt', 'ibm,plb4']
   arch/powerpc/boot/dts/arches.dtb: /plb: failed to match any schema with =
compatible: ['ibm,plb-460gt', 'ibm,plb4']
   arch/powerpc/boot/dts/arches.dtb: /plb/sdram: failed to match any schema=
 with compatible: ['ibm,sdram-460gt', 'ibm,sdram-405gp']
   arch/powerpc/boot/dts/arches.dtb: /plb/sdram: failed to match any schema=
 with compatible: ['ibm,sdram-460gt', 'ibm,sdram-405gp']
>> arch/powerpc/boot/dts/arches.dtb: crypto@180000: compatible: 'oneOf' con=
ditional failed, one must be fixed:
   	['amcc,ppc460gt-crypto', 'amcc,ppc4xx-crypto'] is too long
   	'amcc,ppc460gt-crypto' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a=
']
   	'amcc,ppc460gt-crypto' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8=
500', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'A=
APL,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac=
+', 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'hea=
throw', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac'=
, 'K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', '=
keylargo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775=
', 'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohar=
e-media-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2'=
, 'PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBoo=
k3,5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'Pow=
erBook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6',=
 'PowerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook=
6,5', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'Power=
Mac11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'Pow=
erMac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'Pow=
erMac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'Pow=
erMac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMa=
c3,1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sen=
sors', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dar=
t', 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'amcc,ppc460gt-crypto' is not one of ['1682m-gizmo', '1682m-gpio', '168=
2m-rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc=
460ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-cr=
ypto', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-p=
ic', 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'I=
BM,CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Mo=
mentum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc=
5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nint=
endo,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo=
,hollywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latt=
e-srnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1=
682m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasem=
i,pwrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'so=
c', 'sony,ps3', 'sti,platform-spider-pic']
   	'amcc,ppc460gt-crypto' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584'=
, 'isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'S=
UNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'S=
UNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SU=
NW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUN=
W,vf-mau']
   	'amcc,ppc460gt-crypto' is not one of ['electra-cf', 'i2cpcf,8584', 'vir=
tio,uml']
   	'amcc,ppc460gt-crypto' is not one of ['audio-graph-card2-custom-sample'=
, 'compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-v=
irtuser', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-con=
sumer', 'test-device']
   	'amcc,ppc460gt-crypto' is not one of ['mti,ranchu']
   	'amcc,ppc460gt-crypto' is not one of ['fujitsu,coral', 'fujitsu,lime', =
'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294',=
 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,pow=
er-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,sec=
ureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'w=
rs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/arches.dtb: crypto@180000: 'broken-usage-of-incorr=
ect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/arches.dtb: crypto@180000: 'interrupt-parent', 'in=
terrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/arches.dtb: /plb/crypto@180000: failed to match an=
y schema with compatible: ['amcc,ppc460gt-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/arches.dtb: /plb/mcmal: failed to match any schema=
 with compatible: ['ibm,mcmal-460gt', 'ibm,mcmal2']
   arch/powerpc/boot/dts/arches.dtb: /plb/mcmal: failed to match any schema=
 with compatible: ['ibm,mcmal-460gt', 'ibm,mcmal2']
   arch/powerpc/boot/dts/arches.dtb: /plb/opb: failed to match any schema w=
ith compatible: ['ibm,opb-460gt', 'ibm,opb']
   arch/powerpc/boot/dts/arches.dtb: /plb/opb: failed to match any schema w=
ith compatible: ['ibm,opb-460gt', 'ibm,opb']
   arch/powerpc/boot/dts/arches.dtb: /plb/opb/ebc: failed to match any sche=
ma with compatible: ['ibm,ebc-460gt', 'ibm,ebc']
   arch/powerpc/boot/dts/arches.dtb: /plb/opb/ebc: failed to match any sche=
ma with compatible: ['ibm,ebc-460gt', 'ibm,ebc']
   arch/powerpc/boot/dts/arches.dtb: nor_flash@0,0: $nodename:0: 'nor_flash=
@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   arch/powerpc/boot/dts/canyonlands.dtb: /interrupt-controller3: failed to=
 match any schema with compatible: ['ibm,uic-460ex', 'ibm,uic']
   arch/powerpc/boot/dts/canyonlands.dtb: /sdr: failed to match any schema =
with compatible: ['ibm,sdr-460ex']
   arch/powerpc/boot/dts/canyonlands.dtb: /cpr: failed to match any schema =
with compatible: ['ibm,cpr-460ex']
   arch/powerpc/boot/dts/canyonlands.dtb: /cpm: failed to match any schema =
with compatible: ['ibm,cpm']
   arch/powerpc/boot/dts/canyonlands.dtb: /l2c: failed to match any schema =
with compatible: ['ibm,l2-cache-460ex', 'ibm,l2-cache']
   arch/powerpc/boot/dts/canyonlands.dtb: /l2c: failed to match any schema =
with compatible: ['ibm,l2-cache-460ex', 'ibm,l2-cache']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb: failed to match any schema =
with compatible: ['ibm,plb-460ex', 'ibm,plb4']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb: failed to match any schema =
with compatible: ['ibm,plb-460ex', 'ibm,plb4']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/sdram: failed to match any s=
chema with compatible: ['ibm,sdram-460ex', 'ibm,sdram-405gp']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/sdram: failed to match any s=
chema with compatible: ['ibm,sdram-460ex', 'ibm,sdram-405gp']
>> arch/powerpc/boot/dts/canyonlands.dtb: crypto@180000: compatible: 'oneOf=
' conditional failed, one must be fixed:
   	['amcc,ppc460ex-crypto', 'amcc,ppc4xx-crypto'] is too long
   	'amcc,ppc460ex-crypto' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a=
']
   	'amcc,ppc460ex-crypto' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8=
500', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'A=
APL,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac=
+', 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'hea=
throw', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac'=
, 'K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', '=
keylargo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775=
', 'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohar=
e-media-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2'=
, 'PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBoo=
k3,5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'Pow=
erBook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6',=
 'PowerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook=
6,5', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'Power=
Mac11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'Pow=
erMac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'Pow=
erMac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'Pow=
erMac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMa=
c3,1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sen=
sors', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dar=
t', 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'amcc,ppc460ex-crypto' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584'=
, 'isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'S=
UNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'S=
UNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SU=
NW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUN=
W,vf-mau']
   	'amcc,ppc460ex-crypto' is not one of ['electra-cf', 'i2cpcf,8584', 'vir=
tio,uml']
   	'amcc,ppc460ex-crypto' is not one of ['audio-graph-card2-custom-sample'=
, 'compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-v=
irtuser', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-con=
sumer', 'test-device']
   	'amcc,ppc460ex-crypto' is not one of ['mti,ranchu']
   	'amcc,ppc460ex-crypto' is not one of ['fujitsu,coral', 'fujitsu,lime', =
'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294',=
 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,pow=
er-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,sec=
ureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'w=
rs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: crypto@180000: 'broken-usage-of-i=
ncorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: crypto@180000: 'interrupt-parent'=
, 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: hwrng@110000: compatible: 'oneOf'=
 conditional failed, one must be fixed:
   	['amcc,ppc460ex-rng', 'ppc4xx-rng'] is too long
   	'amcc,ppc460ex-rng' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'amcc,ppc460ex-rng' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'amcc,ppc460ex-rng' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584', '=
isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'SUNW=
,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW=
,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,=
smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,v=
f-mau']
   	'amcc,ppc460ex-rng' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio=
,uml']
   	'amcc,ppc460ex-rng' is not one of ['audio-graph-card2-custom-sample', '=
compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-virt=
user', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consum=
er', 'test-device']
   	'amcc,ppc460ex-rng' is not one of ['mti,ranchu']
   	'amcc,ppc460ex-rng' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fu=
jitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'f=
ujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-=
rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secure=
boot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,=
epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: hwrng@110000: 'broken-usage-of-in=
correct-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: hwrng@110000: 'reg' does not matc=
h any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/hwrng@110000: failed to matc=
h any schema with compatible: ['amcc,ppc460ex-rng', 'ppc4xx-rng']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/mcmal: failed to match any s=
chema with compatible: ['ibm,mcmal-460ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/mcmal: failed to match any s=
chema with compatible: ['ibm,mcmal-460ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/canyonlands.dtb: ehci@bffd0400: $nodename:0: 'ehci=
@bffd0400' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: ehci@bffd0400: reg: [[4, 32210298=
88, 144], [4, 3221030032, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usb@bffd0000: 'broken-usage-of-in=
correct-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: interrupts: [[0]=
, [1], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: 'clocks' is a re=
quired property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: 'clock-names' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: Unevaluated prop=
erties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells'=
, 'interrupt-map', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: dma@bffd0800: $nodename:0: 'dma@b=
ffd0800' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.y=
aml#
>> arch/powerpc/boot/dts/canyonlands.dtb: sata@bffd1000: 'broken-usage-of-i=
ncorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: sata@bffd1000: 'dma-names', 'dmas=
', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes:=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb: failed to match any sch=
ema with compatible: ['ibm,opb-460ex', 'ibm,opb']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb: failed to match any sch=
ema with compatible: ['ibm,opb-460ex', 'ibm,opb']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/ebc: failed to match any=
 schema with compatible: ['ibm,ebc-460ex', 'ibm,ebc']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/ebc: failed to match any=
 schema with compatible: ['ibm,ebc-460ex', 'ibm,ebc']
   arch/powerpc/boot/dts/canyonlands.dtb: nor_flash@0,0: $nodename:0: 'nor_=
flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: cpld@2,0: 'broken-usage-of-incorr=
ect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: cpld@2,0: 'reg' does not match an=
y of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/ebc/ndfc@3,0: failed to =
match any schema with compatible: ['ibm,ndfc']
   arch/powerpc/boot/dts/canyonlands.dtb: serial@ef600300: Unevaluated prop=
erties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: serial@ef600400: Unevaluated prop=
erties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600700: failed to =
match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600700: failed to =
match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600800: failed to =
match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600800: failed to =
match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
--
   arch/powerpc/boot/dts/gamecube.dts:22.9-25.4: Warning (unit_address_vs_r=
eg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/gamecube.dts:45.10-107.11: Warning (unit_address_v=
s_reg): /flipper: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/gamecube.dtb: /: memory: False schema does not all=
ow {'device_type': ['memory'], 'reg': [[0, 25165824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/gamecube.dtb: /: failed to match any schema with c=
ompatible: ['nintendo,gamecube']
>> arch/powerpc/boot/dts/gamecube.dtb: flipper: 'broken-usage-of-incorrect-=
compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/gamecube.dtb: flipper: '#address-cells', '#size-ce=
lls', 'audio@c006c00', 'disk@c006000', 'dsp@c005000', 'exi@c006800', 'gamep=
ad-controller@c006400', 'interrupt-parent', 'processor-interface@c003000', =
'ranges', 'video@c002000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/gamecube.dtb: /flipper/video@c002000: failed to ma=
tch any schema with compatible: ['nintendo,flipper-vi']
>> arch/powerpc/boot/dts/gamecube.dtb: processor-interface@c003000: 'broken=
-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/gamecube.dtb: processor-interface@c003000: 'pic', =
'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/gamecube.dtb: pic: 'broken-usage-of-incorrect-comp=
atible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/gamecube.dtb: pic: '#interrupt-cells', 'interrupt-=
controller' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/gamecube.dtb: /flipper/dsp@c005000: failed to matc=
h any schema with compatible: ['nintendo,flipper-dsp']
   arch/powerpc/boot/dts/gamecube.dtb: /flipper/dsp@c005000/memory@0: faile=
d to match any schema with compatible: ['nintendo,flipper-aram']
   arch/powerpc/boot/dts/gamecube.dtb: /flipper/disk@c006000: failed to mat=
ch any schema with compatible: ['nintendo,flipper-di']
   arch/powerpc/boot/dts/gamecube.dtb: /flipper/audio@c006c00: failed to ma=
tch any schema with compatible: ['nintendo,flipper-ai']
   arch/powerpc/boot/dts/gamecube.dtb: /flipper/gamepad-controller@c006400:=
 failed to match any schema with compatible: ['nintendo,flipper-si']
>> arch/powerpc/boot/dts/gamecube.dtb: exi@c006800: 'broken-usage-of-incorr=
ect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/gamecube.dtb: exi@c006800: 'interrupts', 'reg', 'v=
irtual-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
   arch/powerpc/boot/dts/glacier.dtb: /interrupt-controller3: failed to mat=
ch any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
   arch/powerpc/boot/dts/glacier.dtb: /interrupt-controller3: failed to mat=
ch any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
   arch/powerpc/boot/dts/glacier.dtb: /sdr: failed to match any schema with=
 compatible: ['ibm,sdr-460gt']
   arch/powerpc/boot/dts/glacier.dtb: /cpr: failed to match any schema with=
 compatible: ['ibm,cpr-460gt']
   arch/powerpc/boot/dts/glacier.dtb: /l2c: failed to match any schema with=
 compatible: ['ibm,l2-cache-460gt', 'ibm,l2-cache']
   arch/powerpc/boot/dts/glacier.dtb: /l2c: failed to match any schema with=
 compatible: ['ibm,l2-cache-460gt', 'ibm,l2-cache']
   arch/powerpc/boot/dts/glacier.dtb: /plb: failed to match any schema with=
 compatible: ['ibm,plb-460gt', 'ibm,plb4']
   arch/powerpc/boot/dts/glacier.dtb: /plb: failed to match any schema with=
 compatible: ['ibm,plb-460gt', 'ibm,plb4']
   arch/powerpc/boot/dts/glacier.dtb: /plb/sdram: failed to match any schem=
a with compatible: ['ibm,sdram-460gt', 'ibm,sdram-405gp']
   arch/powerpc/boot/dts/glacier.dtb: /plb/sdram: failed to match any schem=
a with compatible: ['ibm,sdram-460gt', 'ibm,sdram-405gp']
>> arch/powerpc/boot/dts/glacier.dtb: crypto@180000: compatible: 'oneOf' co=
nditional failed, one must be fixed:
   	['amcc,ppc460gt-crypto', 'amcc,ppc460ex-crypto', 'amcc,ppc4xx-crypto'] =
is too long
   	'amcc,ppc460gt-crypto' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a=
']
   	'amcc,ppc460gt-crypto' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8=
500', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'A=
APL,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac=
+', 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'hea=
throw', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac'=
, 'K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', '=
keylargo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775=
', 'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohar=
e-media-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2'=
, 'PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBoo=
k3,5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'Pow=
erBook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6',=
 'PowerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook=
6,5', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'Power=
Mac11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'Pow=
erMac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'Pow=
erMac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'Pow=
erMac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMa=
c3,1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sen=
sors', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dar=
t', 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'amcc,ppc460gt-crypto' is not one of ['1682m-gizmo', '1682m-gpio', '168=
2m-rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc=
460ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-cr=
ypto', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-p=
ic', 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'I=
BM,CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Mo=
mentum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc=
5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nint=
endo,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo=
,hollywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latt=
e-srnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1=
682m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasem=
i,pwrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'so=
c', 'sony,ps3', 'sti,platform-spider-pic']
   	'amcc,ppc460gt-crypto' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584'=
, 'isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'S=
UNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'S=
UNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SU=
NW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUN=
W,vf-mau']
   	'amcc,ppc460gt-crypto' is not one of ['electra-cf', 'i2cpcf,8584', 'vir=
tio,uml']
   	'amcc,ppc460gt-crypto' is not one of ['audio-graph-card2-custom-sample'=
, 'compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-v=
irtuser', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-con=
sumer', 'test-device']
   	'amcc,ppc460gt-crypto' is not one of ['mti,ranchu']
   	'amcc,ppc460gt-crypto' is not one of ['fujitsu,coral', 'fujitsu,lime', =
'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294',=
 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,pow=
er-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,sec=
ureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'w=
rs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/glacier.dtb: crypto@180000: 'broken-usage-of-incor=
rect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/glacier.dtb: crypto@180000: 'interrupt-parent', 'i=
nterrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/glacier.dtb: /plb/crypto@180000: failed to match a=
ny schema with compatible: ['amcc,ppc460gt-crypto', 'amcc,ppc460ex-crypto',=
 'amcc,ppc4xx-crypto']
>> arch/powerpc/boot/dts/glacier.dtb: hwrng@110000: compatible: 'oneOf' con=
ditional failed, one must be fixed:
   	['amcc,ppc460ex-rng', 'ppc4xx-rng'] is too long
   	'amcc,ppc460ex-rng' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'amcc,ppc460ex-rng' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'amcc,ppc460ex-rng' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584', '=
isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'SUNW=
,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW=
,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,=
smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,v=
f-mau']
   	'amcc,ppc460ex-rng' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio=
,uml']
   	'amcc,ppc460ex-rng' is not one of ['audio-graph-card2-custom-sample', '=
compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-virt=
user', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consum=
er', 'test-device']
   	'amcc,ppc460ex-rng' is not one of ['mti,ranchu']
   	'amcc,ppc460ex-rng' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fu=
jitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'f=
ujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-=
rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secure=
boot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,=
epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/glacier.dtb: hwrng@110000: 'broken-usage-of-incorr=
ect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/glacier.dtb: hwrng@110000: 'reg' does not match an=
y of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/glacier.dtb: /plb/hwrng@110000: failed to match an=
y schema with compatible: ['amcc,ppc460ex-rng', 'ppc4xx-rng']
   arch/powerpc/boot/dts/glacier.dtb: /plb/mcmal: failed to match any schem=
a with compatible: ['ibm,mcmal-460gt', 'ibm,mcmal2']
   arch/powerpc/boot/dts/glacier.dtb: /plb/mcmal: failed to match any schem=
a with compatible: ['ibm,mcmal-460gt', 'ibm,mcmal2']
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb: failed to match any schema =
with compatible: ['ibm,opb-460gt', 'ibm,opb']
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb: failed to match any schema =
with compatible: ['ibm,opb-460gt', 'ibm,opb']
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb/ebc: failed to match any sch=
ema with compatible: ['ibm,ebc-460gt', 'ibm,ebc']
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb/ebc: failed to match any sch=
ema with compatible: ['ibm,ebc-460gt', 'ibm,ebc']
   arch/powerpc/boot/dts/glacier.dtb: nor_flash@0,0: $nodename:0: 'nor_flas=
h@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart=
', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-b=
tif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-ua=
rt', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart'=
, 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/kuroboxHD.dtb: serial@80004600: Unevaluated proper=
ties are not allowed ('cell-index', 'compatible', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/kuroboxHD.dtb: /soc10x/interrupt-controller@800400=
00: failed to match any schema with compatible: ['chrp,open-pic']
>> arch/powerpc/boot/dts/kuroboxHD.dtb: pci@fec00000: 'broken-usage-of-inco=
rrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/kuroboxHD.dtb: pci@fec00000: '#address-cells', '#i=
nterrupt-cells', '#size-cells', 'bus-range', 'clock-frequency', 'device_typ=
e', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'ranges', 'r=
eg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart=
', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-b=
tif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-ua=
rt', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart'=
, 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/kuroboxHG.dtb: serial@80004600: Unevaluated proper=
ties are not allowed ('cell-index', 'compatible', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/kuroboxHG.dtb: /soc10x/interrupt-controller@800400=
00: failed to match any schema with compatible: ['chrp,open-pic']
>> arch/powerpc/boot/dts/kuroboxHG.dtb: pci@fec00000: 'broken-usage-of-inco=
rrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/kuroboxHG.dtb: pci@fec00000: '#address-cells', '#i=
nterrupt-cells', '#size-cells', 'bus-range', 'clock-frequency', 'device_typ=
e', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'ranges', 'r=
eg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
   arch/powerpc/boot/dts/mvme5100.dts:28.16-39.5: Warning (unit_address_vs_=
reg): /cpus/PowerPC,7410: node has a reg or ranges property, but no unit na=
me
   arch/powerpc/boot/dts/mvme5100.dts:42.9-45.4: Warning (unit_address_vs_r=
eg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mvme5100.dts:155.7-177.5: Warning (unit_address_vs=
_reg): /pci@feff0000/isa: node has a reg or ranges property, but no unit na=
me
   arch/powerpc/boot/dts/mvme5100.dts:155.7-177.5: Warning (interrupt_provi=
der): /pci@feff0000/isa: '#interrupt-cells' found, but node is not an inter=
rupt provider
   arch/powerpc/boot/dts/mvme5100.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
   arch/powerpc/boot/dts/mvme5100.dtb: /: memory: False schema does not all=
ow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: /: failed to match any schema with c=
ompatible: ['MVME5100']
>> arch/powerpc/boot/dts/mvme5100.dtb: hawk@fef80000: compatible: 'oneOf' c=
onditional failed, one must be fixed:
   	['hawk-bridge', 'simple-bus'] is too long
   	'hawk-bridge' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'hawk-bridge' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500', 'AA=
PL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL,Power=
Book1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+', 'burg=
undy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathrow', '=
heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', 'K2-GMA=
C', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'keylargo-=
ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'MacRI=
SC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-media-b=
ay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', 'PowerB=
ook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,5', 'P=
owerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerBook5,2=
', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'PowerBo=
ok5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5', 'Po=
werBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac11,2',=
 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerMac3,4'=
, 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerMac4,4'=
, 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerMac8,2'=
, 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,1', 's=
creamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensors', 's=
napper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart', 'u4-p=
cie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'hawk-bridge' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584', 'isa-m5=
819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'SUNW,bbc-b=
eep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cw=
q', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-=
beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'hawk-bridge' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'hawk-bridge' is not one of ['audio-graph-card2-custom-sample', 'compat=
1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-virtuser',=
 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer', '=
test-device']
   	'hawk-bridge' is not one of ['mti,ranchu']
   	'hawk-bridge' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,=
MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu=
,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', =
'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v=
1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-l=
ocalbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/mvme5100.dtb: hawk@fef80000: 'broken-usage-of-inco=
rrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/mvme5100.dtb: hawk@fef80000: '#address-cells', '#s=
ize-cells', 'interrupt-controller@f3f80000', 'ranges', 'reg', 'serial@8000'=
, 'serial@8200' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: serial@8000: Unevaluated properties =
are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: serial@8000: reg-shift: 4 is not one=
 of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: serial@8200: Unevaluated properties =
are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: serial@8200: reg-shift: 4 is not one=
 of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: /hawk@fef80000/interrupt-controller@=
f3f80000: failed to match any schema with compatible: ['chrp,open-pic']
>> arch/powerpc/boot/dts/mvme5100.dtb: pci@feff0000: 'broken-usage-of-incor=
rect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/mvme5100.dtb: pci@feff0000: '#address-cells', '#in=
terrupt-cells', '#size-cells', '8259-interrupt-acknowledge', 'bus-range', '=
clock-frequency', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'in=
terrupt-parent', 'isa', 'ranges', 'reg' do not match any of the regexes: 'p=
inctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: isa: $nodename:0: 'isa' does not mat=
ch '^isa@'
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: isa: Unevaluated properties are not =
allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'device_type'=
, 'interrupt-controller@20', 'interrupt-parent', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml#
   arch/powerpc/boot/dts/mvme5100.dtb: /pci@feff0000/isa/interrupt-controll=
er@20: failed to match any schema with compatible: ['chrp,iic']
--
   arch/powerpc/boot/dts/ps3.dts:25.9-28.4: Warning (unit_address_vs_reg): =
/memory: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/ps3.dtb: /: 'broken-usage-of-incorrect-compatible'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/ps3.dtb: /: '#address-cells', '#size-cells', 'chos=
en', 'cpus', 'memory', 'model' do not match any of the regexes: 'pinctrl-[0=
-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/ps3.dtb: /: memory: False schema does not allow {'=
device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/ps3.dtb: cpus: cpu@0:timebase-frequency: 0 is less=
 than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
--
   arch/powerpc/boot/dts/sequoia.dtb: /interrupt-controller2: failed to mat=
ch any schema with compatible: ['ibm,uic-440epx', 'ibm,uic']
   arch/powerpc/boot/dts/sequoia.dtb: /interrupt-controller2: failed to mat=
ch any schema with compatible: ['ibm,uic-440epx', 'ibm,uic']
   arch/powerpc/boot/dts/sequoia.dtb: /sdr: failed to match any schema with=
 compatible: ['ibm,sdr-440epx', 'ibm,sdr-440ep']
   arch/powerpc/boot/dts/sequoia.dtb: /sdr: failed to match any schema with=
 compatible: ['ibm,sdr-440epx', 'ibm,sdr-440ep']
   arch/powerpc/boot/dts/sequoia.dtb: /cpr: failed to match any schema with=
 compatible: ['ibm,cpr-440epx', 'ibm,cpr-440ep']
   arch/powerpc/boot/dts/sequoia.dtb: /cpr: failed to match any schema with=
 compatible: ['ibm,cpr-440epx', 'ibm,cpr-440ep']
   arch/powerpc/boot/dts/sequoia.dtb: /plb: failed to match any schema with=
 compatible: ['ibm,plb-440epx', 'ibm,plb4']
   arch/powerpc/boot/dts/sequoia.dtb: /plb: failed to match any schema with=
 compatible: ['ibm,plb-440epx', 'ibm,plb4']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/sdram: failed to match any schem=
a with compatible: ['ibm,sdram-440epx', 'ibm,sdram-44x-ddr2denali']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/sdram: failed to match any schem=
a with compatible: ['ibm,sdram-440epx', 'ibm,sdram-44x-ddr2denali']
>> arch/powerpc/boot/dts/sequoia.dtb: crypto@e0100000: compatible: 'oneOf' =
conditional failed, one must be fixed:
   	['amcc,ppc440epx-crypto', 'amcc,ppc4xx-crypto'] is too long
   	'amcc,ppc440epx-crypto' is not one of ['broadcom,bcm5241', 'ltr,ltrf216=
a']
   	'amcc,ppc440epx-crypto' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,=
8500', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', '=
AAPL,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bma=
c+', 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'he=
athrow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac=
', 'K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', =
'keylargo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds177=
5', 'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'oha=
re-media-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2=
', 'PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBo=
ok3,5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'Po=
werBook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6'=
, 'PowerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBoo=
k6,5', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'Powe=
rMac11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'Po=
werMac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'Po=
werMac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'Po=
werMac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackM=
ac3,1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-se=
nsors', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-da=
rt', 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'amcc,ppc440epx-crypto' is not one of ['1682m-gizmo', '1682m-gpio', '16=
82m-rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,pp=
c460ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-c=
rypto', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-=
pic', 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', '=
IBM,CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'M=
omentum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mp=
c5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nin=
tendo,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintend=
o,hollywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,lat=
te-srnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,=
1682m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pase=
mi,pwrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 's=
oc', 'sony,ps3', 'sti,platform-spider-pic']
   	'amcc,ppc440epx-crypto' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584=
', 'isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', '=
SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', '=
SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'S=
UNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SU=
NW,vf-mau']
   	'amcc,ppc440epx-crypto' is not one of ['electra-cf', 'i2cpcf,8584', 'vi=
rtio,uml']
   	'amcc,ppc440epx-crypto' is not one of ['audio-graph-card2-custom-sample=
', 'compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-=
virtuser', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-co=
nsumer', 'test-device']
   	'amcc,ppc440epx-crypto' is not one of ['mti,ranchu']
   	'amcc,ppc440epx-crypto' is not one of ['fujitsu,coral', 'fujitsu,lime',=
 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294'=
, 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,po=
wer-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,se=
cureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', '=
wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/sequoia.dtb: crypto@e0100000: 'broken-usage-of-inc=
orrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/sequoia.dtb: crypto@e0100000: 'interrupt-parent', =
'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: /plb/crypto@e0100000: failed to match=
 any schema with compatible: ['amcc,ppc440epx-crypto', 'amcc,ppc4xx-crypto']
>> arch/powerpc/boot/dts/sequoia.dtb: rng@e0120000: compatible: 'oneOf' con=
ditional failed, one must be fixed:
   	['amcc,ppc440epx-rng', 'amcc,ppc4xx-rng'] is too long
   	'amcc,ppc440epx-rng' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'amcc,ppc440epx-rng' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,850=
0', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAP=
L,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+'=
, 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heath=
row', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', =
'K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'ke=
ylargo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775',=
 'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-=
media-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', =
'PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3=
,5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'Power=
Book5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', '=
PowerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,=
5', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMa=
c11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'Power=
Mac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'Power=
Mac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'Power=
Mac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3=
,1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-senso=
rs', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart'=
, 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'amcc,ppc440epx-rng' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584', =
'isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'SUN=
W,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUN=
W,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW=
,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,=
vf-mau']
   	'amcc,ppc440epx-rng' is not one of ['electra-cf', 'i2cpcf,8584', 'virti=
o,uml']
   	'amcc,ppc440epx-rng' is not one of ['audio-graph-card2-custom-sample', =
'compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-vir=
tuser', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consu=
mer', 'test-device']
   	'amcc,ppc440epx-rng' is not one of ['mti,ranchu']
   	'amcc,ppc440epx-rng' is not one of ['fujitsu,coral', 'fujitsu,lime', 'f=
ujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', '=
fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power=
-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secur=
eboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs=
,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/sequoia.dtb: rng@e0120000: 'broken-usage-of-incorr=
ect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/sequoia.dtb: rng@e0120000: 'reg' does not match an=
y of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: /plb/rng@e0120000: failed to match an=
y schema with compatible: ['amcc,ppc440epx-rng', 'amcc,ppc4xx-rng']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/dma: failed to match any schema =
with compatible: ['ibm,dma-440epx', 'ibm,dma-4xx']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/dma: failed to match any schema =
with compatible: ['ibm,dma-440epx', 'ibm,dma-4xx']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/mcmal: failed to match any schem=
a with compatible: ['ibm,mcmal-440epx', 'ibm,mcmal2']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/mcmal: failed to match any schem=
a with compatible: ['ibm,mcmal-440epx', 'ibm,mcmal2']
   arch/powerpc/boot/dts/sequoia.dtb: usb@e0000400: compatible: 'oneOf' con=
ditional failed, one must be fixed:
   	['ibm,usb-ohci-440epx', 'ohci-be'] is too long
   	'ibm,usb-ohci-440epx' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'ibm,usb-ohci-440epx' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,85=
00', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AA=
PL,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+=
', 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heat=
hrow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac',=
 'K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'k=
eylargo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775'=
, 'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare=
-media-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2',=
 'PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook=
3,5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'Powe=
rBook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', =
'PowerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6=
,5', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerM=
ac11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'Powe=
rMac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'Powe=
rMac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'Powe=
rMac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac=
3,1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sens=
ors', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart=
', 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart=
', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-b=
tif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-ua=
rt', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart'=
, 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/storcenter.dtb: serial@4600: Unevaluated propertie=
s are not allowed ('cell-index', 'compatible', 'device_type' were unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/storcenter.dtb: /soc@fc000000/interrupt-controller=
@40000: failed to match any schema with compatible: ['chrp,open-pic']
>> arch/powerpc/boot/dts/storcenter.dtb: pci@fe800000: 'broken-usage-of-inc=
orrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/storcenter.dtb: pci@fe800000: '#address-cells', '#=
interrupt-cells', '#size-cells', 'bus-range', 'clock-frequency', 'device_ty=
pe', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'ranges', '=
reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
   arch/powerpc/boot/dts/wii.dts:32.9-36.4: Warning (unit_address_vs_reg): =
/memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/wii.dts:56.12-243.4: Warning (unit_address_vs_reg)=
: /hollywood: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/wii.dtb: /: memory: False schema does not allow {'=
device_type': ['memory'], 'reg': [[0, 25165824], [268435456, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/wii.dtb: /: failed to match any schema with compat=
ible: ['nintendo,wii']
>> arch/powerpc/boot/dts/wii.dtb: hollywood: 'broken-usage-of-incorrect-com=
patible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/wii.dtb: hollywood: '#address-cells', '#size-cells=
', 'audio@c006c00', 'control@d800100', 'disk@d806000', 'dsp@c005000', 'exi@=
d006800', 'gamepad-controller@d006400', 'gpio@d8000c0', 'interrupt-parent',=
 'ipc@d000000', 'otp@d8001ec', 'pic1@d800030', 'processor-interface@c003000=
', 'ranges', 'sd@d070000', 'sdio@d080000', 'srnprot@d800060', 'usb@d040000'=
, 'usb@d050000', 'usb@d060000', 'video@c002000' do not match any of the reg=
exes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/wii.dtb: /hollywood/video@c002000: failed to match=
 any schema with compatible: ['nintendo,hollywood-vi', 'nintendo,flipper-vi=
']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/video@c002000: failed to match=
 any schema with compatible: ['nintendo,hollywood-vi', 'nintendo,flipper-vi=
']
>> arch/powerpc/boot/dts/wii.dtb: processor-interface@c003000: compatible: =
'oneOf' conditional failed, one must be fixed:
   	['nintendo,hollywood-pi', 'nintendo,flipper-pi'] is too long
   	'nintendo,hollywood-pi' is not one of ['broadcom,bcm5241', 'ltr,ltrf216=
a']
   	'nintendo,hollywood-pi' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,=
8500', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', '=
AAPL,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bma=
c+', 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'he=
athrow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac=
', 'K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', =
'keylargo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds177=
5', 'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'oha=
re-media-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2=
', 'PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBo=
ok3,5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'Po=
werBook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6'=
, 'PowerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBoo=
k6,5', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'Powe=
rMac11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'Po=
werMac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'Po=
werMac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'Po=
werMac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackM=
ac3,1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-se=
nsors', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-da=
rt', 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'nintendo,hollywood-pi' is not one of ['1682m-gizmo', '1682m-gpio', '16=
82m-rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,pp=
c460ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-c=
rypto', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-=
pic', 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', '=
IBM,CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'M=
omentum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mp=
c5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nin=
tendo,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintend=
o,hollywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,lat=
te-srnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,=
1682m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pase=
mi,pwrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 's=
oc', 'sony,ps3', 'sti,platform-spider-pic']
   	'nintendo,hollywood-pi' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584=
', 'isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', '=
SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', '=
SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'S=
UNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SU=
NW,vf-mau']
   	'nintendo,hollywood-pi' is not one of ['electra-cf', 'i2cpcf,8584', 'vi=
rtio,uml']
   	'nintendo,hollywood-pi' is not one of ['audio-graph-card2-custom-sample=
', 'compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio-=
virtuser', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-co=
nsumer', 'test-device']
   	'nintendo,hollywood-pi' is not one of ['mti,ranchu']
   	'nintendo,hollywood-pi' is not one of ['fujitsu,coral', 'fujitsu,lime',=
 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294'=
, 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,po=
wer-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,se=
cureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', '=
wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/wii.dtb: processor-interface@c003000: 'broken-usag=
e-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/wii.dtb: processor-interface@c003000: 'pic0', 'reg=
' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/wii.dtb: /hollywood/processor-interface@c003000: f=
ailed to match any schema with compatible: ['nintendo,hollywood-pi', 'ninte=
ndo,flipper-pi']
>> arch/powerpc/boot/dts/wii.dtb: pic0: 'broken-usage-of-incorrect-compatib=
le' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/wii.dtb: pic0: '#interrupt-cells', 'interrupt-cont=
roller' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/wii.dtb: /hollywood/dsp@c005000: failed to match a=
ny schema with compatible: ['nintendo,hollywood-dsp', 'nintendo,flipper-dsp=
']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/dsp@c005000: failed to match a=
ny schema with compatible: ['nintendo,hollywood-dsp', 'nintendo,flipper-dsp=
']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/gamepad-controller@d006400: fa=
iled to match any schema with compatible: ['nintendo,hollywood-si', 'ninten=
do,flipper-si']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/gamepad-controller@d006400: fa=
iled to match any schema with compatible: ['nintendo,hollywood-si', 'ninten=
do,flipper-si']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/audio@c006c00: failed to match=
 any schema with compatible: ['nintendo,hollywood-ai', 'nintendo,flipper-ai=
']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/audio@c006c00: failed to match=
 any schema with compatible: ['nintendo,hollywood-ai', 'nintendo,flipper-ai=
']
>> arch/powerpc/boot/dts/wii.dtb: exi@d006800: compatible: 'oneOf' conditio=
nal failed, one must be fixed:
   	['nintendo,hollywood-exi', 'nintendo,flipper-exi'] is too long
   	'nintendo,hollywood-exi' is not one of ['broadcom,bcm5241', 'ltr,ltrf21=
6a']
   	'nintendo,hollywood-exi' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL=
,8500', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', =
'AAPL,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bm=
ac+', 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'h=
eathrow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMa=
c', 'K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo',=
 'keylargo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds17=
75', 'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'oh=
are-media-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,=
2', 'PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerB=
ook3,5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'P=
owerBook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6=
', 'PowerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBo=
ok6,5', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'Pow=
erMac11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'P=
owerMac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'P=
owerMac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'P=
owerMac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'Rack=
Mac3,1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-s=
ensors', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-d=
art', 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'nintendo,hollywood-exi' is not one of ['1682m-gizmo', '1682m-gpio', '1=
682m-rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,p=
pc460ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-=
crypto', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider=
-pic', 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', =
'IBM,CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', '=
Momentum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'm=
pc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'ni=
ntendo,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'ninten=
do,hollywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,la=
tte-srnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi=
,1682m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pas=
emi,pwrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', '=
soc', 'sony,ps3', 'sti,platform-spider-pic']
   	'nintendo,hollywood-exi' is not one of ['bq4802', 'ds1287', 'i2cpcf,858=
4', 'isa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', =
'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', =
'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', '=
SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'S=
UNW,vf-mau']
   	'nintendo,hollywood-exi' is not one of ['electra-cf', 'i2cpcf,8584', 'v=
irtio,uml']
   	'nintendo,hollywood-exi' is not one of ['audio-graph-card2-custom-sampl=
e', 'compat1', 'compat2', 'compat3', 'gpio-mockup', 'gpio-simulator', 'gpio=
-virtuser', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-c=
onsumer', 'test-device']
   	'nintendo,hollywood-exi' is not one of ['mti,ranchu']
   	'nintendo,hollywood-exi' is not one of ['fujitsu,coral', 'fujitsu,lime'=
, 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294=
', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,p=
ower-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,s=
ecureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', =
'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/wii.dtb: exi@d006800: 'broken-usage-of-incorrect-c=
ompatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/wii.dtb: exi@d006800: 'interrupts', 'reg', 'virtua=
l-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/wii.dtb: /hollywood/exi@d006800: failed to match a=
ny schema with compatible: ['nintendo,hollywood-exi', 'nintendo,flipper-exi=
']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/sd@d070000: failed to match an=
y schema with compatible: ['nintendo,hollywood-sdhci', 'sdhci']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/sd@d070000: failed to match an=
y schema with compatible: ['nintendo,hollywood-sdhci', 'sdhci']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/sdio@d080000: failed to match =
any schema with compatible: ['nintendo,hollywood-sdhci', 'sdhci']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/sdio@d080000: failed to match =
any schema with compatible: ['nintendo,hollywood-sdhci', 'sdhci']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/ipc@d000000: failed to match a=
ny schema with compatible: ['nintendo,hollywood-ipc']
>> arch/powerpc/boot/dts/wii.dtb: pic1@d800030: 'broken-usage-of-incorrect-=
compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/wii.dtb: pic1@d800030: '#interrupt-cells', 'interr=
upt-controller', 'interrupts', 'reg' do not match any of the regexes: 'pinc=
trl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/wii.dtb: /hollywood/srnprot@d800060: failed to mat=
ch any schema with compatible: ['nintendo,hollywood-srnprot']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/gpio@d8000c0: failed to match =
any schema with compatible: ['nintendo,hollywood-gpio']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/control@d800100: failed to mat=
ch any schema with compatible: ['nintendo,hollywood-control']
   arch/powerpc/boot/dts/wii.dtb: /hollywood/disk@d806000: failed to match =
any schema with compatible: ['nintendo,hollywood-di']
   arch/powerpc/boot/dts/wii.dtb: gpio-leds: 'drive-slot' does not match an=
y of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/powerpc/boot/dts/wii.dtb: gpio-keys: 'eject', 'power' do not match =
any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a=
-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
