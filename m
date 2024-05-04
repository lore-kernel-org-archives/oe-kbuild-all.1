Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CF3224
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 06:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714805064; cv=none; b=E8jkedY4hLMn9U4dsVJd5H54X3co0shUtjjkhMLuF/2Ku1BnawNyaFBgop4NRewiNWceKUZOSTLnYEecUGF9JfK4kjmEP3j3+3bS8SibIVfb7IRa5wNEUOMWukbnwe6cMsTmHz9n4s7yqFADyluZrj1Q7xSk5/Mb7pGQYLAq78w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714805064; c=relaxed/simple;
	bh=9a18+4Ki8HGHeBKagghAX+r96wFavaAE0RRgV8A9nUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPhuRzoNSPggZpYcBQQmxvUF3lhokG2ngaij71NqciJoKmK9v+wBIZ3yaoRk2CuoV3e9HBEiEwnj7hDw6tzJBI8PcpjLLrvN6ArQgUozd/3wtSJXq2lbavdF16mEnlvbgLcNlwejHfnPEII2kC31U88zatIJSdNoZn94IBG3IC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXanUqWx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXanUqWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714805061; x=1746341061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9a18+4Ki8HGHeBKagghAX+r96wFavaAE0RRgV8A9nUo=;
  b=HXanUqWxjPPbZWtmFYb9RX5rax9CB3zN/yB95RmJh83dlJw8BNrFyp0U
   HZfoG/xiCYOMJXdNAcymEpLfzwmdBj+beLgUOukzIq+QpRWW/AYik5clm
   Uif2pZvk2AmENKLd7SUhvlADDpLpqgzIQay5nitPo65xG1gJYyn4FUqvw
   1+svKy9hagn/L2rXHK9/Qw9EkomG2z/6niFIeemS6RbjGRaWqb2Alz5Pe
   tK1+sWNOH+Rhr6fuYRO2FXHDY7AdIYY1qqSv0Q3p/2/F0oXh0I9b0Ji89
   prsRqFGVv7isnNgSquuX1pc0csGWE3zCdBGXpHanzdHUzTKnOaWPmmlRt
   A==;
X-CSE-ConnectionGUID: CsLgNJwDS3ukH8NB73GmEw==
X-CSE-MsgGUID: cNunUvfFS2yGoCBXB+0wDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10466855"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="10466855"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 23:44:20 -0700
X-CSE-ConnectionGUID: Z3P3x2DNSLeLlDFuddgD7g==
X-CSE-MsgGUID: NR0DNFmpRmuv8zt76T/XYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="27767660"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 May 2024 23:44:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3984-000CVU-2Q;
	Sat, 04 May 2024 06:44:16 +0000
Date: Sat, 4 May 2024 14:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1129/1143] dtbs_check:
 arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sgpiom@14c0c000:
 '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202405041435.buleoOgp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 47a1e52c47b1ef5f0ae85b6bdb1a6bf7d1a734cd [1129/1143] arm: dts: aspeed-g7: Complete the interrupt property for sgpio
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240504/202405041435.buleoOgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041435.buleoOgp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-kcs@24: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-kcs@28: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-kcs@2c: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-kcs@114: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-snoop@80: failed to match any schema with compatible: ['aspeed,ast2700-lpc-snoop']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-pcc@0: failed to match any schema with compatible: ['aspeed,ast2700-lpc-pcc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/pcie-lpc@12c19800/pcie_ibt@140: failed to match any schema with compatible: ['aspeed,ast2700-ibt-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/serial@12c1a000: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/crypto@12c1e000: failed to match any schema with compatible: ['aspeed,ast2700-ecdsa']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/jtag@12c20000: failed to match any schema with compatible: ['aspeed,ast2700-jtag']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: e2m_config@12c21000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: e2m_config@12c22000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/crypto@12070000: failed to match any schema with compatible: ['aspeed,ast2700-hace']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/video@120a0000: failed to match any schema with compatible: ['aspeed,ast2700-video-engine', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/video@120a1000: failed to match any schema with compatible: ['aspeed,ast2700-video-engine']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/rvas@120b8000: failed to match any schema with compatible: ['aspeed,ast2700-rvas']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/rvas@120bc000: failed to match any schema with compatible: ['aspeed,ast2700-rvas']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/xdma@12c04000: failed to match any schema with compatible: ['aspeed,ast2700-xdma0']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@10000000/xdma@12c05000: failed to match any schema with compatible: ['aspeed,ast2700-xdma1']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: soc@14000000: 'phy@14C01000', 'plda@14C1C200' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/spi@14000000: failed to match any schema with compatible: ['aspeed,ast2700-fmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/spi@14010000: failed to match any schema with compatible: ['aspeed,ast2700-spi']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/spi@14020000: failed to match any schema with compatible: ['aspeed,ast2700-spi']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/spi@14030000: failed to match any schema with compatible: ['aspeed,ast2700-spi-txrx']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: tpmdev@0: compatible:0: 'tcg,tpm_tis-spi' is not one of ['atmel,attpm20p', 'infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24-spi']
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: tpmdev@0: compatible: ['tcg,tpm_tis-spi'] is too short
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: tpmdev@0: $nodename:0: 'tpmdev@0' does not match '^tpm(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: tpmdev@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/can@14c3e000: failed to match any schema with compatible: ['aspeed,canfd']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14040000/mdio@0: failed to match any schema with compatible: ['aspeed,ast2700-mdio']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14040000/mdio@8: failed to match any schema with compatible: ['aspeed,ast2700-mdio']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14040000/mdio@10: failed to match any schema with compatible: ['aspeed,ast2700-mdio']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/plda@14C1C200: failed to match any schema with compatible: ['aspeed,plda', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/phy@14C01000: failed to match any schema with compatible: ['aspeed,ast2700-sgmii']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/ftgmac@14050000: failed to match any schema with compatible: ['aspeed,ast2700-mac', 'faraday,ftgmac100']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/ftgmac@14060000: failed to match any schema with compatible: ['aspeed,ast2700-mac', 'faraday,ftgmac100']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/ftgmac@14070000: failed to match any schema with compatible: ['aspeed,ast2700-mac', 'faraday,ftgmac100']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sdc@14080000: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sdc@14080000: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sdc@14080000: sdhci@14080100: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sdc@14080000: sdhci@14080100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sdc@14080000: 'resets' does not match any of the regexes: '^sdhci@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sdc@14080000: status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sdhci@14080100: status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/sdc@14080000/sdhci@14080100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/pwm-tach-controller@140c0000: failed to match any schema with compatible: ['aspeed,ast2700-pwm-tach']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: adc@14c00000: 'aspeed,scu', 'interrupts-extended' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: adc@14c00100: 'aspeed,scu', 'interrupts-extended' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14bc0000: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14bc0000: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14bc0000: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/syscon@14c02000: failed to match any schema with compatible: ['aspeed,ast2700-scu1', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/syscon@14c02000/pinctrl@400: failed to match any schema with compatible: ['aspeed,ast2700-soc1-pinctrl']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/hwrng@14c020f0: failed to match any schema with compatible: ['aspeed,ast2700-trng']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/chassis@14c04000: failed to match any schema with compatible: ['aspeed,ast2600-chassis']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04100: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04100: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04100: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04300: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04300: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04300: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04500: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04500: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sram@14c04500: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/espi@14c05000: failed to match any schema with compatible: ['aspeed,ast2700-espi']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/espi@14c06000: failed to match any schema with compatible: ['aspeed,ast2700-espi']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/jtag@14c09000: failed to match any schema with compatible: ['aspeed,ast2700-jtag']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/gpio@14c0b000: failed to match any schema with compatible: ['aspeed,ast2700-gpio']
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sgpiom@14c0c000: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: sgpiom@14c0d000: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-global-regs@0: failed to match any schema with compatible: ['aspeed,i2c-global', 'simple-mfd', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@100: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@200: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@300: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@400: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@500: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@600: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@700: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@800: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@900: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@a00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@b00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@c00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@d00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@e00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@f00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/bus@14c0f000/i2c-bus@1000: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/uart-dma@14c12000: failed to match any schema with compatible: ['aspeed,ast2700-udma']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@100: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@110: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@120: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@130: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@140: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@150: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: i3c0@14c20000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c0@14c20000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c1@14c21000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: i3c2@14c22000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c2@14c22000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c3@14c23000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: i3c4@14c24000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c4@14c24000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c5@14c25000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: i3c6@14c26000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c6@14c26000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c7@14c27000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: i3c8@14c28000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c8@14c28000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c9@14c29000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: i3c10@14c2a000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c10@14c2a000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c11@14c2b000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: i3c12@14c2c000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c12@14c2c000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c13@14c2d000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: i3c14@14c2e000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c14@14c2e000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/i3c15@14c2f000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000: failed to match any schema with compatible: ['aspeed,ast2700-lpc', 'simple-mfd', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/lpc_kcs@24: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/lpc_kcs@28: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/lpc_kcs@2c: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/lpc_kcs@114: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/lpc-pcc@0: failed to match any schema with compatible: ['aspeed,ast2600-lpc-pcc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/reset-controller@98: failed to match any schema with compatible: ['aspeed,ast2700-lpc-reset']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/uart-routing@98: failed to match any schema with compatible: ['aspeed,ast2700n0-uart-routing']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2700-ibt-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c31000/mbox@200: failed to match any schema with compatible: ['aspeed,ast2700-mbox']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000: failed to match any schema with compatible: ['aspeed,ast2700-lpc', 'simple-mfd', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/kcs@24: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/kcs@28: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/kcs@2c: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/kcs@114: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/lpc-snoop@80: failed to match any schema with compatible: ['aspeed,ast2700-lpc-snoop']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/lpc-pcc@0: failed to match any schema with compatible: ['aspeed,ast2700-lpc-pcc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/reset-controller@98: failed to match any schema with compatible: ['aspeed,ast2700-lpc-reset']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/uart-routing@98: failed to match any schema with compatible: ['aspeed,ast2700n1-uart-routing']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2700-ibt-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/lpc@14c32000/mbox@200: failed to match any schema with compatible: ['aspeed,ast2700-mbox']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33000: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33100: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33200: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33300: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33400: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33500: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33600: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33700: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33800: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33900: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33a00: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: serial@14c33b00: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/serial@14c33b00: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/ltpi@14c34000: failed to match any schema with compatible: ['aspeed-ltpi']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/ltpi@14c35000: failed to match any schema with compatible: ['aspeed-ltpi']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/watchdog@14c37000: failed to match any schema with compatible: ['aspeed,ast2700-wdt']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/watchdog@14c37080: failed to match any schema with compatible: ['aspeed,ast2700-wdt']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/sgpios@14c3c000: failed to match any schema with compatible: ['aspeed,ast2700-sgpios']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/fsi@21800000: failed to match any schema with compatible: ['aspeed,ast2700-fsi-master', 'fsi-master']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/fsi@21800000: failed to match any schema with compatible: ['aspeed,ast2700-fsi-master', 'fsi-master']
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: /soc@14000000/fsi@23800000: failed to match any schema with compatible: ['aspeed,ast2700-fsi-master', 'fsi-master']
--
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19000/pcie_ibt@140: failed to match any schema with compatible: ['aspeed,ast2700-ibt-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19800: failed to match any schema with compatible: ['aspeed,ast2700-lpc', 'simple-mfd', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-kcs@24: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-kcs@28: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-kcs@2c: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-kcs@114: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-snoop@80: failed to match any schema with compatible: ['aspeed,ast2700-lpc-snoop']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19800/pcie-pcc@0: failed to match any schema with compatible: ['aspeed,ast2700-lpc-pcc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/pcie-lpc@12c19800/pcie_ibt@140: failed to match any schema with compatible: ['aspeed,ast2700-ibt-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/serial@12c1a000: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/crypto@12c1e000: failed to match any schema with compatible: ['aspeed,ast2700-ecdsa']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/jtag@12c20000: failed to match any schema with compatible: ['aspeed,ast2700-jtag']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: e2m_config@12c21000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: e2m_config@12c22000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/crypto@12070000: failed to match any schema with compatible: ['aspeed,ast2700-hace']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/video@120a0000: failed to match any schema with compatible: ['aspeed,ast2700-video-engine', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/video@120a1000: failed to match any schema with compatible: ['aspeed,ast2700-video-engine']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/rvas@120b8000: failed to match any schema with compatible: ['aspeed,ast2700-rvas']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/rvas@120bc000: failed to match any schema with compatible: ['aspeed,ast2700-rvas']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/xdma@12c04000: failed to match any schema with compatible: ['aspeed,ast2700-xdma0']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@10000000/xdma@12c05000: failed to match any schema with compatible: ['aspeed,ast2700-xdma1']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: soc@14000000: 'phy@14C01000', 'plda@14C1C200' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/spi@14000000: failed to match any schema with compatible: ['aspeed,ast2700-fmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/spi@14010000: failed to match any schema with compatible: ['aspeed,ast2700-spi']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/spi@14020000: failed to match any schema with compatible: ['aspeed,ast2700-spi']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/spi@14030000: failed to match any schema with compatible: ['aspeed,ast2700-spi-txrx']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: tpmdev@0: compatible:0: 'tcg,tpm_tis-spi' is not one of ['atmel,attpm20p', 'infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24-spi']
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: tpmdev@0: compatible: ['tcg,tpm_tis-spi'] is too short
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: tpmdev@0: $nodename:0: 'tpmdev@0' does not match '^tpm(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/can@14c3e000: failed to match any schema with compatible: ['aspeed,canfd']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14040000/mdio@0: failed to match any schema with compatible: ['aspeed,ast2700-mdio']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14040000/mdio@8: failed to match any schema with compatible: ['aspeed,ast2700-mdio']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14040000/mdio@10: failed to match any schema with compatible: ['aspeed,ast2700-mdio']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/plda@14C1C200: failed to match any schema with compatible: ['aspeed,plda', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/phy@14C01000: failed to match any schema with compatible: ['aspeed,ast2700-sgmii']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/ftgmac@14050000: failed to match any schema with compatible: ['aspeed,ast2700-mac', 'faraday,ftgmac100']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/ftgmac@14060000: failed to match any schema with compatible: ['aspeed,ast2700-mac', 'faraday,ftgmac100']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/ftgmac@14070000: failed to match any schema with compatible: ['aspeed,ast2700-mac', 'faraday,ftgmac100']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sdc@14080000: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sdc@14080000: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sdc@14080000: sdhci@14080100: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sdc@14080000: sdhci@14080100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sdc@14080000: 'resets' does not match any of the regexes: '^sdhci@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sdc@14080000: status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sdhci@14080100: status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/sdc@14080000/sdhci@14080100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/pwm-tach-controller@140c0000: failed to match any schema with compatible: ['aspeed,ast2700-pwm-tach']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: adc@14c00000: 'aspeed,scu', 'interrupts-extended' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: adc@14c00100: 'aspeed,scu', 'interrupts-extended' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14bc0000: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14bc0000: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14bc0000: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/syscon@14c02000: failed to match any schema with compatible: ['aspeed,ast2700-scu1', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/syscon@14c02000/pinctrl@400: failed to match any schema with compatible: ['aspeed,ast2700-soc1-pinctrl']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/hwrng@14c020f0: failed to match any schema with compatible: ['aspeed,ast2700-trng']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/chassis@14c04000: failed to match any schema with compatible: ['aspeed,ast2600-chassis']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04100: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04100: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04100: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04300: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04300: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04300: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04500: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04500: #size-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sram@14c04500: 'exported@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/espi@14c05000: failed to match any schema with compatible: ['aspeed,ast2700-espi']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/espi@14c06000: failed to match any schema with compatible: ['aspeed,ast2700-espi']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/jtag@14c09000: failed to match any schema with compatible: ['aspeed,ast2700-jtag']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/gpio@14c0b000: failed to match any schema with compatible: ['aspeed,ast2700-gpio']
>> arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sgpiom@14c0c000: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: sgpiom@14c0d000: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-global-regs@0: failed to match any schema with compatible: ['aspeed,i2c-global', 'simple-mfd', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@100: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@100/rtc@30: failed to match any schema with compatible: ['s35390a']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@200: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@300: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@400: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@500: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@600: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@700: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@800: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@900: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@a00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@b00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@c00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@d00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@e00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@f00: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/bus@14c0f000/i2c-bus@1000: failed to match any schema with compatible: ['aspeed,ast2600-i2cv2']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/uart-dma@14c12000: failed to match any schema with compatible: ['aspeed,ast2700-udma']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@100: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@110: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@120: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@130: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@140: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/interrupt-controller@14c18000/interrupt-controller@150: failed to match any schema with compatible: ['aspeed,ast2700-intc-ic']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: i3c0@14c20000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c0@14c20000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c1@14c21000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: i3c2@14c22000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c2@14c22000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c3@14c23000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: i3c4@14c24000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c4@14c24000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c5@14c25000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: i3c6@14c26000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c6@14c26000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c7@14c27000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: i3c8@14c28000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c8@14c28000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c9@14c29000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: i3c10@14c2a000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c10@14c2a000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c11@14c2b000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: i3c12@14c2c000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c12@14c2c000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c13@14c2d000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: i3c14@14c2e000: dcr: b'\xcc' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c14@14c2e000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/i3c15@14c2f000: failed to match any schema with compatible: ['aspeed-i3c-hci']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000: failed to match any schema with compatible: ['aspeed,ast2700-lpc', 'simple-mfd', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/lpc_kcs@24: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/lpc_kcs@28: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/lpc_kcs@2c: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/lpc_kcs@114: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/lpc-pcc@0: failed to match any schema with compatible: ['aspeed,ast2600-lpc-pcc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/reset-controller@98: failed to match any schema with compatible: ['aspeed,ast2700-lpc-reset']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/uart-routing@98: failed to match any schema with compatible: ['aspeed,ast2700n0-uart-routing']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2700-ibt-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c31000/mbox@200: failed to match any schema with compatible: ['aspeed,ast2700-mbox']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000: failed to match any schema with compatible: ['aspeed,ast2700-lpc', 'simple-mfd', 'syscon']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/kcs@24: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/kcs@28: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/kcs@2c: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/kcs@114: failed to match any schema with compatible: ['aspeed,ast2700-kcs-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/lpc-snoop@80: failed to match any schema with compatible: ['aspeed,ast2700-lpc-snoop']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/lpc-pcc@0: failed to match any schema with compatible: ['aspeed,ast2700-lpc-pcc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/reset-controller@98: failed to match any schema with compatible: ['aspeed,ast2700-lpc-reset']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/uart-routing@98: failed to match any schema with compatible: ['aspeed,ast2700n1-uart-routing']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2700-ibt-bmc']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/lpc@14c32000/mbox@200: failed to match any schema with compatible: ['aspeed,ast2700-mbox']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33000: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33100: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33200: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33300: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33400: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33500: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33600: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33700: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33800: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33900: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33a00: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: serial@14c33b00: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/serial@14c33b00: failed to match any schema with compatible: ['aspeed,ast2700-uart']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/ltpi@14c34000: failed to match any schema with compatible: ['aspeed-ltpi']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/ltpi@14c35000: failed to match any schema with compatible: ['aspeed-ltpi']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/watchdog@14c37000: failed to match any schema with compatible: ['aspeed,ast2700-wdt']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/watchdog@14c37080: failed to match any schema with compatible: ['aspeed,ast2700-wdt']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/sgpios@14c3c000: failed to match any schema with compatible: ['aspeed,ast2700-sgpios']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/fsi@21800000: failed to match any schema with compatible: ['aspeed,ast2700-fsi-master', 'fsi-master']
   arch/arm64/boot/dts/aspeed/ast2700-fpga.dtb: /soc@14000000/fsi@21800000: failed to match any schema with compatible: ['aspeed,ast2700-fsi-master', 'fsi-master']
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
