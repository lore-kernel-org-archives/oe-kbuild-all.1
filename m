Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634A155303
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719490817; cv=none; b=bdq9jU1EY0PXihL/eOvlXDTFMgwJASpZSu7JTH3aNSTNiHA8iLs/p04WiLOR6ox9wirDJ8N0LjDBZzsdnrVMEyaSqeh6TwqalK3FG0bNqfm4uLv5BQmSiQtrGsEi0IR2mPOx7m3jGZEUV0ET2IuWIcMC0cMLXT3xvp1wjutshqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719490817; c=relaxed/simple;
	bh=SQmAxBLZy60L3pq4X8eI1tmnjQfOG2LrLW350cz+Vto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ahQ9wybJP4Vv4B/NcHkQLPcdYTkg++VOdlHLbzBIbjEPmqhEhe+/+bQW6h3CDY11hU6gdPzn60QVTvukpwTk8Ry09fiExPVv1C4MwmCJMly5ForAPi40HfIRuoUr7sHOPOSUrJf16noa0c+tSd+01X0lEeVqoT1MmM3U1POORoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQzwxQPQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQzwxQPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719490814; x=1751026814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQmAxBLZy60L3pq4X8eI1tmnjQfOG2LrLW350cz+Vto=;
  b=KQzwxQPQXKKSZJG3FJcPtmwkCz9DGUsgkuwUcGutFy8p6KJClK8gj3ks
   AtBa9HNjGZlTKqm9rpMhFf6CPuZYlnjAHO5kXyg+CTfW7R9co1g00Gl4s
   OVn7j2gh5RoVzQHRpWqAJKcvE8CknX2f/xYcOyK930upS885tpWH08JU4
   +Rf3NCvTqTdtOG0pp+bo6grjVAGYD5PY4pZU5w6xZS3TsTxQrE1X2KK8W
   XNRdnwLXclu2zjxRDorOUHkaYXCSS4iususAtHDo/L2UqSfgtL3+bQOk5
   Tgnwy/Hj+CS7GDDOmM6VqQQU1JItZfUQM4Tpm58PPmeRDXzDeyPtVtGYp
   Q==;
X-CSE-ConnectionGUID: W5dIPzidRhixWLFlETIZoA==
X-CSE-MsgGUID: p/xFYaerSOiiPkPDnUvUcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16287923"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="16287923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 05:20:05 -0700
X-CSE-ConnectionGUID: h0/ljt0ZRjCdWoCgUO8jTQ==
X-CSE-MsgGUID: fRTccY90SFSiam3imW9qKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="48806961"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jun 2024 05:20:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMo6b-000GBV-0l;
	Thu, 27 Jun 2024 12:20:01 +0000
Date: Thu, 27 Jun 2024 20:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ninad Palsule <ninad@linux.ibm.com>
Subject: [linux-next:master 2742/8232]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb:
 /ahb/apb/fsi@1e79b000/cfam@0,0/scom@1000: failed to match any schema with
 compatible: ['ibm,p9-scom']
Message-ID: <202406272002.EnrSjYcT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: 26e67f6ba292b41c6cf297194a3f2941688cad0f [2742/8232] ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
config: arm-randconfig-051-20240625 (https://download.01.org/0day-ci/archive/20240627/202406272002.EnrSjYcT-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406272002.EnrSjYcT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406272002.EnrSjYcT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: pressure-sensor@76: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e78a000/i2c-bus@480/led-controller@60: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e78a000/i2c-bus@480/led-controller@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e78a000/i2c-bus@600/i2c-mux@70/i2c@0/led-controller@60: failed to match any schema with compatible: ['nxp,pca9551']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e78a000/i2c-bus@700/led-controller@60: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/led-controller@60: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/bus@1e78a000/i2c-bus@800/led-controller@60: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,p9-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,i2c-fsi']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@0/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@0/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@1/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@1/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@c/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@c/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@d/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@d/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi2spi@1c00/spi@0: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi2spi@1c00/spi@20: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi2spi@1c00/spi@40: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi2spi@1c00/spi@60: failed to match any schema with compatible: ['ibm,spi-fsi']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400: failed to match any schema with compatible: ['ibm,p9-fsi-controller']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/scom@1000: failed to match any schema with compatible: ['ibm,p9-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,i2c-fsi']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@2/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@2/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@3/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@3/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@10/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@10/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@11/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/i2c@1800/i2c-bus@11/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi2spi@1c00/spi@0: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi2spi@1c00/spi@20: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi2spi@1c00/spi@40: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi2spi@1c00/spi@60: failed to match any schema with compatible: ['ibm,spi-fsi']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@1,0/fsi@3400: failed to match any schema with compatible: ['ibm,p9-fsi-controller']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/scom@1000: failed to match any schema with compatible: ['ibm,p9-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800: failed to match any schema with compatible: ['ibm,i2c-fsi']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@0/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@0/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@1/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@1/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@c/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@c/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@d/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@d/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi2spi@1c00/spi@0: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi2spi@1c00/spi@20: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi2spi@1c00/spi@40: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi2spi@1c00/spi@60: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@2,0/fsi@3400: failed to match any schema with compatible: ['ibm,p9-fsi-controller']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/scom@1000: failed to match any schema with compatible: ['ibm,p9-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800: failed to match any schema with compatible: ['ibm,i2c-fsi']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@2/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@2/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@3/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@3/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@a/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@b/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@e/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@f/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@10/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@10/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@11/fsi@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/i2c@1800/i2c-bus@11/fsi@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,odyssey-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@0: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@20: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@40: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@60: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi@3400: failed to match any schema with compatible: ['ibm,p9-fsi-controller']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
