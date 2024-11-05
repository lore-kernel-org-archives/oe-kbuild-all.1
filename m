Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122C61D935D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730824784; cv=none; b=dWQczIAga403ZtqHhCZWzamqbFUmYip99EJo8qcp52T6QK/+KvhxV4/9f4opl6zTN0gZ9wtAL0Sd8Pe6DmWVnwETERN+I+yiatMBE1N80pzwAO7YPBclZD4tRyNbrBnYPcTkgiQTHW8SLR5jDO9E8m4h3UyOXHq3c3PE3Qvc8UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730824784; c=relaxed/simple;
	bh=IOz4+GvDPHQRBEImze1wj7vpmpsfhEi2rIfm/7oVfaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RrKnjuTIneeHgRiNgrrMNFzsFDpUqOsTd4hnKjDYmx28RSFtvsVD/4TBFKyRdFd4rgmctZQPq/1R/uc0jDDNyP5d9WqcxtzAWHikISTLgF15DDUY7i1yKG891wY9yewXTFUlxEi6V8BsRE0ah9wnHXFGhH3u7TCcp1/N+zQ6WhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXBtHSSe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXBtHSSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730824781; x=1762360781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IOz4+GvDPHQRBEImze1wj7vpmpsfhEi2rIfm/7oVfaM=;
  b=bXBtHSSeyufPdS29TmI3hJt2wsDbBrFsuNZ9/PsDrsm7mtzkhDBthRua
   n0xRwxF4wI7e3uLJ4ARIWI2ZHidpbYgHfDGj7ydSVzZbLQfi9gOr73zCu
   kkaWpzfaVwRDwCA/oTfYoW+Dl9yUT6rs9mSrrlPVm30hHUHoqDdcR6KUk
   LLZdnH8GRxkyVarUxPWhk+FCXf0Skink9PFlxutHwOr5g8pXHpQ+yHRMm
   PyPEHC75r56O3/Q4yoKgWN/3XZfzGPzt64AwueoP3kLvY28HYAAuU5m6K
   8EkKk9zSFCOfzhQBkC1Xa6h83fYbso04RHUdergpJJFtFg/B+qRcNXqPB
   Q==;
X-CSE-ConnectionGUID: MkEL0ZCRT9GSV2yPdZP7Nw==
X-CSE-MsgGUID: aE7glPPBQ5O865zIqkVBpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34273794"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34273794"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 08:39:41 -0800
X-CSE-ConnectionGUID: Eoa0ISPAQ1it1qMR6N6HAQ==
X-CSE-MsgGUID: FNxByLZCRjiyEhCn1B75cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88874080"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Nov 2024 08:39:38 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Mae-000mFf-0V;
	Tue, 05 Nov 2024 16:39:36 +0000
Date: Wed, 6 Nov 2024 00:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8460/8858]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: led-controller@31:
 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any
 of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
Message-ID: <202411060037.1iAeoCI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: f92d2e9334171d07b47189397f222f64dcb77617 [8460/8858] dt-bindings: leds: pca955x: Convert text bindings to YAML
config: arm-randconfig-051-20241101 (https://download.01.org/0day-ci/archive/20241106/202411060037.1iAeoCI5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060037.1iAeoCI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060037.1iAeoCI5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: led-controller@31: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: led-controller@32: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: led-controller@33: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e78a000/i2c@400/pwm@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: pressure-sensor@76: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@65: 'led@10', 'led@11' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@31: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@32: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@33: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@30: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@34: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@35: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: pca9552@60: 'led@10', 'led@11', 'led@12', 'led@13' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sbefifo@2400: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: led-controller@65: 'led@10', 'led@11' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: led-controller@31: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: led-controller@32: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: led-controller@33: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: led-controller@30: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: led-controller@34: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: led-controller@35: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c-mux@70: Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/bus@1e78a000/i2c@780/i2c-mux@70/i2c@3/pwm@52: failed to match any schema with compatible: ['maxim,max31785a']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: led-controller@60: 'led@10', 'led@11', 'led@12', 'led@13' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: fsi@1e79b100: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: tca9554@20: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@31: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@32: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: pca9552@33: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: tca9554@20: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@31: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@32: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: pca9552@33: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: tca9554@20: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@31: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@32: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: pca9552@33: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c@400/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: led-controller@60: 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@54: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
   	['tcg,tpm-tis-i2c'] is too short
   	'tcg,tpm-tis-i2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
   	'tcg,tpm-tis-i2c' is not one of ['atmel,at97sc3204t', 'infineon,slb9635tt', 'infineon,slb9645tt', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', 'nuvoton,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: tpm@2e: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
--
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/interrupt-controller@0: failed to match any schema with compatible: ['aspeed,ast2500-i2c-ic']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: pca9552@60: 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@28: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@29: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@2d: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: leds: 'fan0', 'fan1', 'fan2', 'fan3', 'fan4', 'front-fault', 'front-id', 'power-button' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
--
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/interrupt-controller@0: failed to match any schema with compatible: ['aspeed,ast2500-i2c-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@100/max31785@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@100/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@100/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@100/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@100/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@100/max31785@52/fan@4: failed to match any schema with compatible: ['pmbus-fan']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: pca9552@60: 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: dps310@76: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@300/si7021a20@20: failed to match any schema with compatible: ['si,si7021a20']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: pca9551@60: 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: pca9552@60: 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@340/ucd90160@64: failed to match any schema with compatible: ['ti,ucd90160']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@380/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@380/ir35221@72: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: pca9539@74: '#address-cells', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@3c0/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c@3c0/ir35221@72: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: pca9539@74: '#address-cells', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
--
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bmp280@77: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@200/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: dps310@76: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: pca9552@60: 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@280/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@280/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@300/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@300/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: pca9552@60: 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/bus@1e78a000/i2c@600/ucd90160@64: failed to match any schema with compatible: ['ti,ucd90160']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: sbefifo@2400: occ: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: sbefifo@2400: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/interrupt-controller@0: failed to match any schema with compatible: ['aspeed,ast2500-i2c-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: bmp280@77: 'vddd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: bmp280@77: 'vdda-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: bmp280@77: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/pressure/bmp085.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@100/max31785@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: dps310@76: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: pca9552@60: 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@180/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@180/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: pca9552@60: 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@400/ucd90160@64: failed to match any schema with compatible: ['ti,ucd90160']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: leds: 'fan0', 'fan1', 'fan2', 'fan3', 'front-fault', 'front-id', 'front-power', 'power-button', 'rear-fault', 'rear-id', 'rear-power' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: sbefifo@2400: '#address-cells', '#size-cells', 'occ@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
