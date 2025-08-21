Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BED52D7DFA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808462; cv=none; b=Rt6qGaSJQSRrJ5B+Gk84N8fsajJzY6D9x3Vq8tRM50K/TpK7YkJjxuugdCfDt1DXON1Nwdqg9eJo127GKE/1gxvHXKHWvKagjZtr3T7BOHExi1JMOFZLwap8mlcrnvCofOkByKFzbsPUm6l6hqYfDLs8BU1UfYK2K3hGoP0yyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808462; c=relaxed/simple;
	bh=UeIDt2tJjrw+4yBTW2LPgDi8yd9O0vAZkNoI8UDuwb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZfpoMyKLTw/Kp6XcvQ4slSiBJdMSGUf4+DDOsCQ8UjQglZom+c/8LmiDV1/JTVmdShSQc8qNQjcltEEwHpQxc/i/2HgNdYqsetrVAuXifxMTf/7MBS5lTJx9GMCNB2sdjG/dkxl+3aEoUQrLHoVwMOTplzzeL8BBobDAtUpLkXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksoyLSgt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksoyLSgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755808460; x=1787344460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UeIDt2tJjrw+4yBTW2LPgDi8yd9O0vAZkNoI8UDuwb8=;
  b=ksoyLSgtDJvO8xwkLuzf8R0hOEpjXZb1s5QER05KnLbxoXEBrbvI2XqI
   RynUANpVewj1xHIGViZW0EB0wod0dP4N8PZBoJc82y3+dvHF8XCNUhn/q
   zmXswjDOYn3dtlGYBGruPzNWz0sJAbDbHPih1kYm8+JZhoLQ4cw0spLVY
   xApZYq+sCmcdtPphSrffybjVcWqiR6Ku11ymnqHolr48Uovkp4fsHoEPN
   2TjybHleYxsWwLXpeBtn6ppOVA+MLIbQvQwyPqwxJGHh6HDrkgZwDAAXJ
   /eGh2C/FoxkDrFhqYRr4RSMUw3FNwdRJ1SV2VbrrQSfzljPpfCRvVwE7t
   A==;
X-CSE-ConnectionGUID: EeGz/f0sQVyPq/QRXj973Q==
X-CSE-MsgGUID: 6syBnd1cRK+drBbWvzFUWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58060787"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58060787"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 13:34:19 -0700
X-CSE-ConnectionGUID: LJXrXh70RFeqiIQglPXTPQ==
X-CSE-MsgGUID: WpZFjDwnT7eoKLs6LJBxQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169323006"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2025 13:34:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upBzC-000Kdv-2m;
	Thu, 21 Aug 2025 20:34:14 +0000
Date: Fri, 22 Aug 2025 04:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1170/3950]
 arch/mips/boot/dts/ralink/mt7628a.dtsi:42.21-133.5: Warning
 (avoid_unnecessary_addr_size): /palmbus@10000000/pinmux@60: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or
 "ranges" property
Message-ID: <202508220455.DWO3jdxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa4d8dc380fbd81a9d702a855c50690c9c6442c
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [1170/3950] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
config: mips-randconfig-051-20250822 (https://download.01.org/0day-ci/archive/20250822/202508220455.DWO3jdxT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508220455.DWO3jdxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508220455.DWO3jdxT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/ralink/mt7628a.dtsi:42.21-133.5: Warning (avoid_unnecessary_addr_size): /palmbus@10000000/pinmux@60: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/ralink/omega2p.dtb: / (onion,omega2+): compatible: 'oneOf' conditional failed, one must be fixed:
   	['onion,omega2+', 'ralink,mt7688a-soc', 'ralink,mt7628a-soc'] is too long
   	'onion,omega2+' is not one of ['ralink,rt2880-eval-board']
   	'ralink,rt3050-soc' was expected
   	'onion,omega2+' is not one of ['ralink,rt3052-eval-board']
   	'ralink,rt3350-soc' was expected
   	'ralink,rt3352-soc' was expected
   	'onion,omega2+' is not one of ['ralink,rt3883-eval-board']
   	'ralink,rt5350-soc' was expected
   	'onion,omega2+' is not one of ['ralink,mt7620a-eval-board']
--
>> arch/mips/boot/dts/ralink/mt7628a.dtsi:42.21-133.5: Warning (avoid_unnecessary_addr_size): /palmbus@10000000/pinmux@60: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/ralink/vocore2.dtb: interrupt-controller@200 (ralink,rt2880-intc): 'ralink,intc-registers', 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/memory-controller@300: failed to match any schema with compatible: ['ralink,mt7620a-memc']
   arch/mips/boot/dts/ralink/vocore2.dtb: gpio@600 (mediatek,mt7621-gpio): 'gpio-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/mediatek,mt7621-gpio.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00 (ns16550a): $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart1@d00 (ns16550a): $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
--
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:533.4-41: Warning (interrupt_map): /pcie@1e140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621.dtsi:554.4-42: Warning (interrupt_map): /pcie@1e140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621.dtsi:575.4-42: Warning (interrupt_map): /pcie@1e140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dtb: ethernet@1e100000 (mediatek,mt7621-eth): clock-names:0: 'ethif' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dtb: ethernet@1e100000 (mediatek,mt7621-eth): clock-names:1: 'fe' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dtb: ethernet@1e100000 (mediatek,mt7621-eth): reset-names:1: 'gmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dtb: ethernet@1e100000 (mediatek,mt7621-eth): reset-names: ['fe', 'eth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:533.4-41: Warning (interrupt_map): /pcie@1e140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621.dtsi:554.4-42: Warning (interrupt_map): /pcie@1e140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621.dtsi:575.4-42: Warning (interrupt_map): /pcie@1e140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dtb: ethernet@1e100000 (mediatek,mt7621-eth): clock-names:0: 'ethif' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dtb: ethernet@1e100000 (mediatek,mt7621-eth): clock-names:1: 'fe' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dtb: ethernet@1e100000 (mediatek,mt7621-eth): reset-names:1: 'gmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dtb: ethernet@1e100000 (mediatek,mt7621-eth): reset-names: ['fe', 'eth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:509.3-511.32: Warning (interrupt_map): /pcie@1e140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
>> arch/mips/boot/dts/ralink/mt7621.dtsi:533.4-41: Warning (interrupt_map): /pcie@1e140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621.dtsi:554.4-42: Warning (interrupt_map): /pcie@1e140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621.dtsi:575.4-42: Warning (interrupt_map): /pcie@1e140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1fbc0000, using 0 as fallback
   arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000 (mediatek,mt7621-eth): clock-names:0: 'ethif' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000 (mediatek,mt7621-eth): clock-names:1: 'fe' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000 (mediatek,mt7621-eth): reset-names:1: 'gmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000 (mediatek,mt7621-eth): reset-names: ['fe', 'eth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

vim +42 arch/mips/boot/dts/ralink/mt7628a.dtsi

9ea34af728f720 Stefan Roese       2019-05-27   3  
7d4ad2e71d175b Harvey Hunt        2017-08-21   4  / {
7d4ad2e71d175b Harvey Hunt        2017-08-21   5  	#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21   6  	#size-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21   7  	compatible = "ralink,mt7628a-soc";
7d4ad2e71d175b Harvey Hunt        2017-08-21   8  
7d4ad2e71d175b Harvey Hunt        2017-08-21   9  	cpus {
7d4ad2e71d175b Harvey Hunt        2017-08-21  10  		#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  11  		#size-cells = <0>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  12  
7d4ad2e71d175b Harvey Hunt        2017-08-21  13  		cpu@0 {
7d4ad2e71d175b Harvey Hunt        2017-08-21  14  			compatible = "mti,mips24KEc";
7d4ad2e71d175b Harvey Hunt        2017-08-21  15  			device_type = "cpu";
7d4ad2e71d175b Harvey Hunt        2017-08-21  16  			reg = <0>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  17  		};
7d4ad2e71d175b Harvey Hunt        2017-08-21  18  	};
7d4ad2e71d175b Harvey Hunt        2017-08-21  19  
7d4ad2e71d175b Harvey Hunt        2017-08-21  20  	cpuintc: interrupt-controller {
7d4ad2e71d175b Harvey Hunt        2017-08-21  21  		#address-cells = <0>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  22  		#interrupt-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  23  		interrupt-controller;
7d4ad2e71d175b Harvey Hunt        2017-08-21  24  		compatible = "mti,cpu-interrupt-controller";
7d4ad2e71d175b Harvey Hunt        2017-08-21  25  	};
7d4ad2e71d175b Harvey Hunt        2017-08-21  26  
7d4ad2e71d175b Harvey Hunt        2017-08-21  27  	palmbus@10000000 {
7d4ad2e71d175b Harvey Hunt        2017-08-21  28  		compatible = "palmbus";
7d4ad2e71d175b Harvey Hunt        2017-08-21  29  		reg = <0x10000000 0x200000>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  30  		ranges = <0x0 0x10000000 0x1FFFFF>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  31  
7d4ad2e71d175b Harvey Hunt        2017-08-21  32  		#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  33  		#size-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  34  
232085d118ff46 Sergio Paracuellos 2025-02-24  35  		sysc: syscon@0 {
0e029c91a7ec02 Ezra Buehler       2025-06-24  36  			compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
380f072c57a590 Stefan Roese       2019-05-27  37  			reg = <0x0 0x60>;
232085d118ff46 Sergio Paracuellos 2025-02-24  38  			#clock-cells = <1>;
232085d118ff46 Sergio Paracuellos 2025-02-24  39  			#reset-cells = <1>;
380f072c57a590 Stefan Roese       2019-05-27  40  		};
380f072c57a590 Stefan Roese       2019-05-27  41  
380f072c57a590 Stefan Roese       2019-05-27 @42  		pinmux: pinmux@60 {

:::::: The code at line 42 was first introduced by commit
:::::: 380f072c57a590d7593050b8533d88e18b6a7daa MIPS: ralink: mt7628a.dtsi: Add pinmux DT node

:::::: TO: Stefan Roese <sr@denx.de>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
