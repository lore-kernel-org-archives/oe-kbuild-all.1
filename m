Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5C13A24A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 20:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309896; cv=none; b=njunqeb34HNYn9xFXhxCFnCISsB83MxZJ5t+KDtjqn96fJtJIE0axjplTJ3KoLgpJQVYjXV448obvMP+TW/bA5ZsU6jWmCHt++AL4AA+iwMc2fqLX58VaFSR45maVUshKmZLXL+/s/J25quLYC2Nx24egZn7nqJ2UQ7G6C9eA6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309896; c=relaxed/simple;
	bh=fud6dQo+XtIJiXmScVrxMpunnZDLk1/gqf/ZPxDsVLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KlZkyYXoCSukTj3L9MBgAll8ujzNu6Da8JHmV9xuuZeTaChxAQSQbs4k7bo9hArFVn38rhqtN9dEtYYPul9Py2vrKzUnr0stWWqJGujuO6gOz12/AuE3dj73g4IOwrSay1YNBX0aiRkftLneX1yTq9N0wjLcoNfvhzftfW9Vwm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEOJwgnx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEOJwgnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718309895; x=1749845895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fud6dQo+XtIJiXmScVrxMpunnZDLk1/gqf/ZPxDsVLI=;
  b=AEOJwgnx7g1J52OlW72UleayZT0ey4a4BZA6LNUNWa9FXbnNxL+RdU2y
   xItAKtUOIIsvQbKAJSmFQqWfIOjnFYgghKrwetbV3Tau1tJf2YpXo7GL9
   F6sNbBm2N1CrisSr0UnPHjZI6nHujB23Wj6S4xnf9JCmV2JEtpdIPFsII
   b+p8uZPa+bMJiHhTgIH9Z5Um8cfD0ONb2HGfU0Z9Xurn+vNSlkNsRX3Hu
   cCE5DBRLhLMkmg+FNZiDpt0ApSXYq6qbABlapRSUkPqLBIhWUaZFWMGbb
   g6jReYQPP3QIPXjA99U0sY656OvFWWhm8ePVXyHrf2MuSfgqpyPpBpcCV
   w==;
X-CSE-ConnectionGUID: b5GW37sATP2D0PiCZFwbCg==
X-CSE-MsgGUID: I28bBO19QMSal6ZMRtRK6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25841634"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="25841634"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 13:18:14 -0700
X-CSE-ConnectionGUID: QPBBZjLSTC2RWHBzEDh/MA==
X-CSE-MsgGUID: revVTZ7+SOSCCxNsWs3aPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40927772"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jun 2024 13:18:12 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHqte-0000Mq-2B;
	Thu, 13 Jun 2024 20:18:10 +0000
Date: Fri, 14 Jun 2024 04:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [krzk-github:b4/dt-bindings-mfd-syscon-split 14/18]
 arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: syscon@600000000:
 mux-controller:#mux-control-cells:0:0: 1 was expected
Message-ID: <202406140453.h7kuAeFl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dt-bindings-mfd-syscon-split
head:   035b86aab61498947d010dd7a1dd95f7343d5477
commit: ad0f957a0ed5ffe701775c60d351a222d6bc5ffb [14/18] dt-bindings: soc: microchip: sparx5-cpu-syscon: Move to dedicated schema
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406140453.h7kuAeFl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406140453.h7kuAeFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406140453.h7kuAeFl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: syscon@600000000: mux-controller:#mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: mux-controller: #mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@600104000: num-cs:0:0: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@600104000: Unevaluated properties are not allowed ('reg-shift' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@0: 'spi-max-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/spi-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@1: mux-controls: [[10], [0]] is too long
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: syscon@600000000: mux-controller:#mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: mux-controller: #mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: spi@600104000: num-cs:0:0: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: spi@600104000: spi@e:reg:0:0: 14 is greater than the maximum of 3
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: spi@600104000: Unevaluated properties are not allowed ('reg-shift' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: spi@0: 'spi-max-frequency' is a required property
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: syscon@600000000: mux-controller:#mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: mux-controller: #mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: spi@600104000: num-cs:0:0: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: spi@600104000: Unevaluated properties are not allowed ('reg-shift' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: spi@0: 'spi-max-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/spi-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: switch@600000000: reg-names:1: 'devices' was expected
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: syscon@600000000: mux-controller:#mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: mux-controller: #mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: spi@600104000: num-cs:0:0: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: spi@600104000: spi@e:reg:0:0: 14 is greater than the maximum of 3
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: spi@600104000: Unevaluated properties are not allowed ('reg-shift' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: spi@0: 'spi-max-frequency' is a required property
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: syscon@600000000: mux-controller:#mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: mux-controller: #mux-control-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: spi@600104000: num-cs:0:0: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: spi@600104000: Unevaluated properties are not allowed ('reg-shift' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: spi@0: 'spi-max-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/spi-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: switch@600000000: reg-names:1: 'devices' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
