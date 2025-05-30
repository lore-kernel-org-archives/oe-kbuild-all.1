Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36984A1D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643067; cv=none; b=Mzl6nL55VtljO9b67kj7hfHerOIHLl6ttPORZRECXUmronuhCc3CVdvLqrW7ppHSlNqQqAc2a0EIu1hlTCzACE+El0CL0Q78WaqwofRrHeQrMVk2qP42u3BnQwO5rTdI1gU3nX+BEnrerUQgevNSZNfBzjy2Z0ErjMYQcxYMW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643067; c=relaxed/simple;
	bh=/EX/Xhl+KWIEwyMgo/GyIcfmOzmhhJWgRAJbEgLm2BY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2Z+uYGGVtnbn5bYBN2PRSI/pX+Fe+Qgnw4kIT5S28rxim8edUxJYvpip4WiirxEyZ78NbiOTJHjeMvOrlj7ttpRFIOIEXdzKCgDrm/hnXp9mm3vDqVQ2AE+G14sQfMKq5Iygi1/iCfXZMgHIo1ckiBV4BH+5fOlGSMlVvhxPig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ef+/+EB8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ef+/+EB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748643065; x=1780179065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EX/Xhl+KWIEwyMgo/GyIcfmOzmhhJWgRAJbEgLm2BY=;
  b=Ef+/+EB8EsXzgpjbO0CC+3E39bU2fhudoLvGSAzAPdFmtaFGq3qYs4oG
   /gKe4wF9Us7SPBAmjRVdS64SSH2suXyazJaZtj64SIUUHPnPcl80hJyx2
   SQEl2fWIpn07KDVxS85dYJ+HwZTmuJziKbcHP9YE7khDsizWftqPPs9DF
   /jS1P3lUzBSkz5ytA6VTjisfr8/ErDHI2luYl/rbFswvQitJPLXbHCP50
   HhyWAPhuqK8XRP4TL3kdG7FKF9EcEgaJg3tppvqaidIMACYnK5U2ZgwSg
   34OEh4hyGY6mjk/nfcckfzwr4RW9d3vGvupK4YxsilxVQCwyGUbgpkDnt
   w==;
X-CSE-ConnectionGUID: p0GDAEYfTcqtHBpo2coZNg==
X-CSE-MsgGUID: rurJ5QHJTweoZ0ENTJr/hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50439179"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50439179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 15:11:04 -0700
X-CSE-ConnectionGUID: qSHusUqSRxqPRZYLlel98g==
X-CSE-MsgGUID: gzti2W8ZSu62z26IUGBA3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144328076"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2025 15:11:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL7wK-000Y0a-2k;
	Fri, 30 May 2025 22:11:00 +0000
Date: Sat, 31 May 2025 06:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000
 (marvell,armada-8k-ahci): Unevaluated properties are not allowed
 ('#address-cells', '#size-cells', 'dma-coherent' were unexpected)
Message-ID: <202505310623.71E34XHS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: e8a2389ea808c3902d9938b20e40e2df36c3702b [2/2] dt-bindings: ata: ahci-platform: add missing iommus property
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250531/202505310623.71E34XHS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310623.71E34XHS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310623.71E34XHS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@0: 'anyOf' conditional failed, one must be fixed:
   	'phys' is a required property
   	'target-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1: Unevaluated properties are not allowed ('phy-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000 (marvell,armada-8k-ahci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-coherent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: trng@760000 (marvell,armada-8k-rng): compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: trng@760000 (marvell,armada-8k-rng): compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@0: 'anyOf' conditional failed, one must be fixed:
   	'phys' is a required property
   	'target-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1: Unevaluated properties are not allowed ('phy-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-coherent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: trng@760000 (marvell,armada-8k-rng): compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: trng@760000 (marvell,armada-8k-rng): compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: mmc@780000 (marvell,armada-cp110-sdhci): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@0:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@0: Unevaluated properties are not allowed ('phy-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1: Unevaluated properties are not allowed ('phy-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000 (marvell,armada-8k-ahci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-coherent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: trng@760000 (marvell,armada-8k-rng): compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: trng@760000 (marvell,armada-8k-rng): compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@0: 'anyOf' conditional failed, one must be fixed:
   	'phys' is a required property
   	'target-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1: Unevaluated properties are not allowed ('phy-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-coherent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: trng@760000 (marvell,armada-8k-rng): compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: trng@760000 (marvell,armada-8k-rng): compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: mmc@780000 (marvell,armada-cp110-sdhci): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@0:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@0: Unevaluated properties are not allowed ('phy-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1:phy-names:0: 'sata-phy' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): sata-port@1: Unevaluated properties are not allowed ('phy-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: sata@540000 (marvell,armada-8k-ahci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-coherent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: trng@760000 (marvell,armada-8k-rng): compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: trng@760000 (marvell,armada-8k-rng): compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
