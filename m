Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787B1A9F9D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 02:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764471440; cv=none; b=ZclbWJVhJbRQdEGy989VYHeSoIbQA2SiErcaRQ6E/UI1hreQp68QNJ56zLF4hZm4vy7SUvLBNaRa069t/H5jEtGbwrlsM0b5BjrH6JggDjHaJcde3FU0G+88fPjRsIpwxNwJowNQp5mh5TKy/m19j6kI9DJOFaB0TDRF3MSpEiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764471440; c=relaxed/simple;
	bh=k+piack3ZsD7NjYU6fpIvU6u4WjEOCx2KM8V4hiLQtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPBikH0Nom32WMuSEUP1bYlZctpTrtllo/TXfYDdZnBLAa9eXusNdkT7Pc4n/NIne5usIo8lmDnQI+6WHlOb/PCuxU+eCYYq6aD3q3+emQD7vMSATlrVjWKDCb4O4JOCV9d4PD7xL6pPcrkrjQ549cAKHW5zfghbolIeu9SEZq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMrA1F8B; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMrA1F8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764471438; x=1796007438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+piack3ZsD7NjYU6fpIvU6u4WjEOCx2KM8V4hiLQtg=;
  b=cMrA1F8BU0v51RxzySsRYuB8FsCL+Yf6jTzTbjh5X2YOLe4vyjNxYBC0
   z+rAwMQXD7pKwNQ8aC3qkA/V86dfG0Dw9OQgw50aPsQL/H1oJjIt9sbw0
   Ok0wVBJiE7WY9iikt1Sj0bgnbUis95VyJUcfsbjG2i7lWQgRlWr5V7JSQ
   m3msx0WvJIxs8qxHxImynh6i+chjWLS3Ck+ixXIli4m9R6asRaFZk3Mj7
   6xn3bywOeGWZ3jsLYXOHNKGtDb8x16kGlpFZUv8PSNoRNgSaAmDjbj3N9
   PbtaoUgbl/3DTmp4V/in2xHfnzNWl5z5F5JZexafF5GEhwn2qk/auGP8g
   Q==;
X-CSE-ConnectionGUID: bFrdHgjGTmeRpsJKq/M31w==
X-CSE-MsgGUID: 8o4sPhv9QLmOUOhLCtaiNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="54000160"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="54000160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 18:57:17 -0800
X-CSE-ConnectionGUID: +50bjJMUTbCxTZz5c3nXrQ==
X-CSE-MsgGUID: pUNIdpm7S/iXb018824UCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="198691923"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 Nov 2025 18:57:15 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPXcf-000000002TV-1HAT;
	Sun, 30 Nov 2025 02:57:13 +0000
Date: Sun, 30 Nov 2025 03:57:08 +0100
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 9812/12740]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000
 (microchip,sama7d65-ddr3phy): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202511300328.rBwTx6Q4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: 1f9793a4d5188cddc0eb69d7840b7c5c57c939a6 [9812/12740] dt-bindings: mfd: Document control-scb and sysreg-scb on pic64gx
config: arm-randconfig-2051-20251124 (https://download.01.org/0day-ci/archive/20251130/202511300328.rBwTx6Q4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511300328.rBwTx6Q4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511300328.rBwTx6Q4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e182c000 (microchip,sama7d65-flexcom): i2c@600:#size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/atmel,at91sam-i2c.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'syscon' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clock-names: ['t0_clk', 't1_clk', 't2_clk', 'slow_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [17, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clock-names: ['t0_clk', 't1_clk', 't2_clk', 'slow_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [16, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
