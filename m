Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F401422D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691185; cv=none; b=PvG4GoHsofsfGF6ufhND1oQHy/N8AormN37FmWByLxVq7Ds9bVrqCr3tzRi87mAor0FzHNeDuI0T8VKfyPPt1d5/BvwGVtYdV0rHemETh1DCBQLx9bHP5e0bZqACVgXr8FXNTkt1HfF0Vjk8TCySVMJXKwArkD+IgJ71M9NAMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691185; c=relaxed/simple;
	bh=5qDOHAMJnoDkYe9xA8VXjsb0lotbwX+wxEnNxCkHDKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WyH83Q78j8NOI0F6xa41WnV0Rk0T4Sd1R610EKa7n3lsL6m60uP3z9RJ63gXOvknUWGv6ui1n7MZuUprfpNRYonTRYoV2nS7CD7kHPxorSo7XLjYVzbPrPqq9qYHj6osLD2lU6u7Vk9nLiqrfLxJ2RSS960GEI5qPDhtGNGjNMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h76eBtks; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h76eBtks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720691182; x=1752227182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qDOHAMJnoDkYe9xA8VXjsb0lotbwX+wxEnNxCkHDKA=;
  b=h76eBtks81DWZL33ZPjp3J0Pp7SvSsz2JDoXj+VHRIApJQ4s8Sik74AI
   V4CNW97N+OxewMCyY1H4IXu9DbTsd7Tfdg7X6rA15mF0Yqa//QVcKeB4J
   p4ixnAbZvXJmIlEwCwSOVMrdhk30Gt0DbS1cM8x2Y845DhsDY/tN4sfWp
   wiXBPDKnOe2rL0P0WI8fu46fM85ytJD6snM0C814Tsj/hlhCilR0CdD4n
   FaDQpXZUgq7dOfhLv31VRXJSaBJRUIAYDzfz5mdqIu/o7syEKkDQ8VghX
   JBSuvP9jt6yZrqqOhzwsAvAGs2oHO6iIX4C7f/6/gboq8Dr08Nsii+Tm+
   Q==;
X-CSE-ConnectionGUID: j96LDi6sSIaooPtEDTDjbg==
X-CSE-MsgGUID: yYals2XhRuS2JwbK2RNNDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29454001"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="29454001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 02:46:19 -0700
X-CSE-ConnectionGUID: ZKscnlQCTVOfVWD0dViUHA==
X-CSE-MsgGUID: 3KeKrlr3TgqRD+ICAaNDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="79634473"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2024 02:46:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRqNU-000Z6o-0O;
	Thu, 11 Jul 2024 09:46:16 +0000
Date: Thu, 11 Jul 2024 17:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11857/12643]
 arch/powerpc/boot/dts/tqm8548.dts:411.11-432.5: Warning
 (avoid_unnecessary_addr_size): /localbus@e0005000/upm@3,0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407111703.cZLxGdEs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 12d638f48c082831388358cc12a1c6ee58185ad8 [11857/12643] scripts/dtc: Update to upstream version v1.7.0-93-g1df7b047fe43
config: powerpc-tqm8548_defconfig (https://download.01.org/0day-ci/archive/20240711/202407111703.cZLxGdEs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111703.cZLxGdEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111703.cZLxGdEs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/tqm8548.dts:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/tqm8548.dts:423.11-431.6: Warning (unit_address_vs_reg): /localbus@e0005000/upm@3,0/nand@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/tqm8548.dts:351.13-384.5: Warning (simple_bus_reg): /localbus@e0005000/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/tqm8548.dts:387.11-397.5: Warning (simple_bus_reg): /localbus@e0005000/can@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/tqm8548.dts:399.13-408.5: Warning (simple_bus_reg): /localbus@e0005000/can@2,100: simple-bus unit address format error, expected "200000100"
   arch/powerpc/boot/dts/tqm8548.dts:411.11-432.5: Warning (simple_bus_reg): /localbus@e0005000/upm@3,0: simple-bus unit address format error, expected "300000000"
>> arch/powerpc/boot/dts/tqm8548.dts:411.11-432.5: Warning (avoid_unnecessary_addr_size): /localbus@e0005000/upm@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +411 arch/powerpc/boot/dts/tqm8548.dts

6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   10  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   11  / {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   12  	model = "tqc,tqm8548";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   13  	compatible = "tqc,tqm8548";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   14  	#address-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   15  	#size-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   16  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   17  	aliases {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   18  		ethernet0 = &enet0;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   19  		ethernet1 = &enet1;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   20  		ethernet2 = &enet2;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   21  		ethernet3 = &enet3;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   22  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   23  		serial0 = &serial0;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   24  		serial1 = &serial1;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   25  		pci0 = &pci0;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   26  		pci1 = &pci1;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   27  	};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   28  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   29  	cpus {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   30  		#address-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   31  		#size-cells = <0>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   32  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   33  		PowerPC,8548@0 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   34  			device_type = "cpu";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   35  			reg = <0>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   36  			d-cache-line-size = <32>;	// 32 bytes
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   37  			i-cache-line-size = <32>;	// 32 bytes
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   38  			d-cache-size = <0x8000>;	// L1, 32K
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   39  			i-cache-size = <0x8000>;	// L1, 32K
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   40  			next-level-cache = <&L2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   41  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   42  	};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   43  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   44  	memory {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   45  		device_type = "memory";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   46  		reg = <0x00000000 0x00000000>;	// Filled in by U-Boot
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   47  	};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   48  
d27a736c7a62c3 Wolfgang Grandegger 2008-08-17   49  	soc@e0000000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   50  		#address-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   51  		#size-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   52  		device_type = "soc";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   53  		ranges = <0x0 0xe0000000 0x100000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   54  		bus-frequency = <0>;
d27a736c7a62c3 Wolfgang Grandegger 2008-08-17   55  		compatible = "fsl,mpc8548-immr", "simple-bus";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   56  
e1a228973646bf Kumar Gala          2009-04-22   57  		ecm-law@0 {
e1a228973646bf Kumar Gala          2009-04-22   58  			compatible = "fsl,ecm-law";
e1a228973646bf Kumar Gala          2009-04-22   59  			reg = <0x0 0x1000>;
e1a228973646bf Kumar Gala          2009-04-22   60  			fsl,num-laws = <10>;
e1a228973646bf Kumar Gala          2009-04-22   61  		};
e1a228973646bf Kumar Gala          2009-04-22   62  
e1a228973646bf Kumar Gala          2009-04-22   63  		ecm@1000 {
e1a228973646bf Kumar Gala          2009-04-22   64  			compatible = "fsl,mpc8548-ecm", "fsl,ecm";
e1a228973646bf Kumar Gala          2009-04-22   65  			reg = <0x1000 0x1000>;
e1a228973646bf Kumar Gala          2009-04-22   66  			interrupts = <17 2>;
e1a228973646bf Kumar Gala          2009-04-22   67  			interrupt-parent = <&mpic>;
e1a228973646bf Kumar Gala          2009-04-22   68  		};
e1a228973646bf Kumar Gala          2009-04-22   69  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   70  		memory-controller@2000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   71  			compatible = "fsl,mpc8548-memory-controller";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   72  			reg = <0x2000 0x1000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   73  			interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   74  			interrupts = <18 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   75  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   76  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   77  		L2: l2-cache-controller@20000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   78  			compatible = "fsl,mpc8548-l2-cache-controller";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   79  			reg = <0x20000 0x1000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   80  			cache-line-size = <32>;	// 32 bytes
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   81  			cache-size = <0x80000>;	// L2, 512K
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   82  			interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   83  			interrupts = <16 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   84  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   85  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   86  		i2c@3000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   87  			#address-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   88  			#size-cells = <0>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   89  			cell-index = <0>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   90  			compatible = "fsl-i2c";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   91  			reg = <0x3000 0x100>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   92  			interrupts = <43 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   93  			interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06   94  			dfsrr;
a3083220c089c6 Wolfgang Grandegger 2008-06-26   95  
6467cae318ba8a Wolfgang Grandegger 2009-03-16   96  			dtt@48 {
0f73a449a649ac Wolfgang Grandegger 2009-01-29   97  				compatible = "national,lm75";
6467cae318ba8a Wolfgang Grandegger 2009-03-16   98  				reg = <0x48>;
0f73a449a649ac Wolfgang Grandegger 2009-01-29   99  			};
0f73a449a649ac Wolfgang Grandegger 2009-01-29  100  
a3083220c089c6 Wolfgang Grandegger 2008-06-26  101  			rtc@68 {
a3083220c089c6 Wolfgang Grandegger 2008-06-26  102  				compatible = "dallas,ds1337";
a3083220c089c6 Wolfgang Grandegger 2008-06-26  103  				reg = <0x68>;
a3083220c089c6 Wolfgang Grandegger 2008-06-26  104  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  105  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  106  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  107  		i2c@3100 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  108  			#address-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  109  			#size-cells = <0>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  110  			cell-index = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  111  			compatible = "fsl-i2c";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  112  			reg = <0x3100 0x100>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  113  			interrupts = <43 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  114  			interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  115  			dfsrr;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  116  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  117  
dee805532a3018 Kumar Gala          2008-06-27  118  		dma@21300 {
dee805532a3018 Kumar Gala          2008-06-27  119  			#address-cells = <1>;
dee805532a3018 Kumar Gala          2008-06-27  120  			#size-cells = <1>;
dee805532a3018 Kumar Gala          2008-06-27  121  			compatible = "fsl,mpc8548-dma", "fsl,eloplus-dma";
dee805532a3018 Kumar Gala          2008-06-27  122  			reg = <0x21300 0x4>;
dee805532a3018 Kumar Gala          2008-06-27  123  			ranges = <0x0 0x21100 0x200>;
dee805532a3018 Kumar Gala          2008-06-27  124  			cell-index = <0>;
dee805532a3018 Kumar Gala          2008-06-27  125  			dma-channel@0 {
dee805532a3018 Kumar Gala          2008-06-27  126  				compatible = "fsl,mpc8548-dma-channel",
dee805532a3018 Kumar Gala          2008-06-27  127  						"fsl,eloplus-dma-channel";
dee805532a3018 Kumar Gala          2008-06-27  128  				reg = <0x0 0x80>;
dee805532a3018 Kumar Gala          2008-06-27  129  				cell-index = <0>;
dee805532a3018 Kumar Gala          2008-06-27  130  				interrupt-parent = <&mpic>;
dee805532a3018 Kumar Gala          2008-06-27  131  				interrupts = <20 2>;
dee805532a3018 Kumar Gala          2008-06-27  132  			};
dee805532a3018 Kumar Gala          2008-06-27  133  			dma-channel@80 {
dee805532a3018 Kumar Gala          2008-06-27  134  				compatible = "fsl,mpc8548-dma-channel",
dee805532a3018 Kumar Gala          2008-06-27  135  						"fsl,eloplus-dma-channel";
dee805532a3018 Kumar Gala          2008-06-27  136  				reg = <0x80 0x80>;
dee805532a3018 Kumar Gala          2008-06-27  137  				cell-index = <1>;
dee805532a3018 Kumar Gala          2008-06-27  138  				interrupt-parent = <&mpic>;
dee805532a3018 Kumar Gala          2008-06-27  139  				interrupts = <21 2>;
dee805532a3018 Kumar Gala          2008-06-27  140  			};
dee805532a3018 Kumar Gala          2008-06-27  141  			dma-channel@100 {
dee805532a3018 Kumar Gala          2008-06-27  142  				compatible = "fsl,mpc8548-dma-channel",
dee805532a3018 Kumar Gala          2008-06-27  143  						"fsl,eloplus-dma-channel";
dee805532a3018 Kumar Gala          2008-06-27  144  				reg = <0x100 0x80>;
dee805532a3018 Kumar Gala          2008-06-27  145  				cell-index = <2>;
dee805532a3018 Kumar Gala          2008-06-27  146  				interrupt-parent = <&mpic>;
dee805532a3018 Kumar Gala          2008-06-27  147  				interrupts = <22 2>;
dee805532a3018 Kumar Gala          2008-06-27  148  			};
dee805532a3018 Kumar Gala          2008-06-27  149  			dma-channel@180 {
dee805532a3018 Kumar Gala          2008-06-27  150  				compatible = "fsl,mpc8548-dma-channel",
dee805532a3018 Kumar Gala          2008-06-27  151  						"fsl,eloplus-dma-channel";
dee805532a3018 Kumar Gala          2008-06-27  152  				reg = <0x180 0x80>;
dee805532a3018 Kumar Gala          2008-06-27  153  				cell-index = <3>;
dee805532a3018 Kumar Gala          2008-06-27  154  				interrupt-parent = <&mpic>;
dee805532a3018 Kumar Gala          2008-06-27  155  				interrupts = <23 2>;
dee805532a3018 Kumar Gala          2008-06-27  156  			};
dee805532a3018 Kumar Gala          2008-06-27  157  		};
dee805532a3018 Kumar Gala          2008-06-27  158  
84ba4a5899e613 Anton Vorontsov     2009-03-19  159  		enet0: ethernet@24000 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  160  			#address-cells = <1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  161  			#size-cells = <1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  162  			cell-index = <0>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  163  			device_type = "network";
84ba4a5899e613 Anton Vorontsov     2009-03-19  164  			model = "eTSEC";
84ba4a5899e613 Anton Vorontsov     2009-03-19  165  			compatible = "gianfar";
84ba4a5899e613 Anton Vorontsov     2009-03-19  166  			reg = <0x24000 0x1000>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  167  			ranges = <0x0 0x24000 0x1000>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  168  			local-mac-address = [ 00 00 00 00 00 00 ];
84ba4a5899e613 Anton Vorontsov     2009-03-19  169  			interrupts = <29 2 30 2 34 2>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  170  			interrupt-parent = <&mpic>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  171  			tbi-handle = <&tbi0>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  172  			phy-handle = <&phy2>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  173  
84ba4a5899e613 Anton Vorontsov     2009-03-19  174  			mdio@520 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  175  				#address-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  176  				#size-cells = <0>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  177  				compatible = "fsl,gianfar-mdio";
84ba4a5899e613 Anton Vorontsov     2009-03-19  178  				reg = <0x520 0x20>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  179  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  180  				phy1: ethernet-phy@0 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  181  					interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  182  					interrupts = <8 1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  183  					reg = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  184  				};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  185  				phy2: ethernet-phy@1 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  186  					interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  187  					interrupts = <8 1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  188  					reg = <2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  189  				};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  190  				phy3: ethernet-phy@3 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  191  					interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  192  					interrupts = <8 1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  193  					reg = <3>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  194  				};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  195  				phy4: ethernet-phy@4 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  196  					interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  197  					interrupts = <8 1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  198  					reg = <4>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  199  				};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  200  				phy5: ethernet-phy@5 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  201  					interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  202  					interrupts = <8 1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  203  					reg = <5>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  204  				};
b31a1d8b41513b Andy Fleming        2008-12-16  205  				tbi0: tbi-phy@11 {
b31a1d8b41513b Andy Fleming        2008-12-16  206  					reg = <0x11>;
b31a1d8b41513b Andy Fleming        2008-12-16  207  					device_type = "tbi-phy";
b31a1d8b41513b Andy Fleming        2008-12-16  208  				};
b31a1d8b41513b Andy Fleming        2008-12-16  209  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  210  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  211  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  212  		enet1: ethernet@25000 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  213  			#address-cells = <1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  214  			#size-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  215  			cell-index = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  216  			device_type = "network";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  217  			model = "eTSEC";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  218  			compatible = "gianfar";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  219  			reg = <0x25000 0x1000>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  220  			ranges = <0x0 0x25000 0x1000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  221  			local-mac-address = [ 00 00 00 00 00 00 ];
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  222  			interrupts = <35 2 36 2 40 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  223  			interrupt-parent = <&mpic>;
b31a1d8b41513b Andy Fleming        2008-12-16  224  			tbi-handle = <&tbi1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  225  			phy-handle = <&phy1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  226  
84ba4a5899e613 Anton Vorontsov     2009-03-19  227  			mdio@520 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  228  				#address-cells = <1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  229  				#size-cells = <0>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  230  				compatible = "fsl,gianfar-tbi";
84ba4a5899e613 Anton Vorontsov     2009-03-19  231  				reg = <0x520 0x20>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  232  
84ba4a5899e613 Anton Vorontsov     2009-03-19  233  				tbi1: tbi-phy@11 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  234  					reg = <0x11>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  235  					device_type = "tbi-phy";
84ba4a5899e613 Anton Vorontsov     2009-03-19  236  				};
84ba4a5899e613 Anton Vorontsov     2009-03-19  237  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  238  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  239  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  240  		enet2: ethernet@26000 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  241  			#address-cells = <1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  242  			#size-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  243  			cell-index = <2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  244  			device_type = "network";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  245  			model = "eTSEC";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  246  			compatible = "gianfar";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  247  			reg = <0x26000 0x1000>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  248  			ranges = <0x0 0x26000 0x1000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  249  			local-mac-address = [ 00 00 00 00 00 00 ];
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  250  			interrupts = <31 2 32 2 33 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  251  			interrupt-parent = <&mpic>;
b31a1d8b41513b Andy Fleming        2008-12-16  252  			tbi-handle = <&tbi2>;
655544c69c8d8b Wolfgang Grandegger 2009-03-16  253  			phy-handle = <&phy4>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  254  
84ba4a5899e613 Anton Vorontsov     2009-03-19  255  			mdio@520 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  256  				#address-cells = <1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  257  				#size-cells = <0>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  258  				compatible = "fsl,gianfar-tbi";
84ba4a5899e613 Anton Vorontsov     2009-03-19  259  				reg = <0x520 0x20>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  260  
84ba4a5899e613 Anton Vorontsov     2009-03-19  261  				tbi2: tbi-phy@11 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  262  					reg = <0x11>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  263  					device_type = "tbi-phy";
84ba4a5899e613 Anton Vorontsov     2009-03-19  264  				};
84ba4a5899e613 Anton Vorontsov     2009-03-19  265  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  266  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  267  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  268  		enet3: ethernet@27000 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  269  			#address-cells = <1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  270  			#size-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  271  			cell-index = <3>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  272  			device_type = "network";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  273  			model = "eTSEC";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  274  			compatible = "gianfar";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  275  			reg = <0x27000 0x1000>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  276  			ranges = <0x0 0x27000 0x1000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  277  			local-mac-address = [ 00 00 00 00 00 00 ];
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  278  			interrupts = <37 2 38 2 39 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  279  			interrupt-parent = <&mpic>;
b31a1d8b41513b Andy Fleming        2008-12-16  280  			tbi-handle = <&tbi3>;
655544c69c8d8b Wolfgang Grandegger 2009-03-16  281  			phy-handle = <&phy5>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  282  
84ba4a5899e613 Anton Vorontsov     2009-03-19  283  			mdio@520 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  284  				#address-cells = <1>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  285  				#size-cells = <0>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  286  				compatible = "fsl,gianfar-tbi";
84ba4a5899e613 Anton Vorontsov     2009-03-19  287  				reg = <0x520 0x20>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  288  
84ba4a5899e613 Anton Vorontsov     2009-03-19  289  				tbi3: tbi-phy@11 {
84ba4a5899e613 Anton Vorontsov     2009-03-19  290  					reg = <0x11>;
84ba4a5899e613 Anton Vorontsov     2009-03-19  291  					device_type = "tbi-phy";
84ba4a5899e613 Anton Vorontsov     2009-03-19  292  				};
84ba4a5899e613 Anton Vorontsov     2009-03-19  293  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  294  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  295  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  296  		serial0: serial@4500 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  297  			cell-index = <0>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  298  			device_type = "serial";
f706bed1144e0f Kumar Gala          2011-11-28  299  			compatible = "fsl,ns16550", "ns16550";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  300  			reg = <0x4500 0x100>;	// reg base, size
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  301  			clock-frequency = <0>;	// should we fill in in uboot?
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  302  			current-speed = <115200>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  303  			interrupts = <42 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  304  			interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  305  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  306  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  307  		serial1: serial@4600 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  308  			cell-index = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  309  			device_type = "serial";
f706bed1144e0f Kumar Gala          2011-11-28  310  			compatible = "fsl,ns16550", "ns16550";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  311  			reg = <0x4600 0x100>;	// reg base, size
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  312  			clock-frequency = <0>;	// should we fill in in uboot?
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  313  			current-speed = <115200>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  314  			interrupts = <42 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  315  			interrupt-parent = <&mpic>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  316  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  317  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  318  		global-utilities@e0000 {	// global utilities reg
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  319  			compatible = "fsl,mpc8548-guts";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  320  			reg = <0xe0000 0x1000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  321  			fsl,has-rstcr;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  322  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  323  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  324  		mpic: pic@40000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  325  			interrupt-controller;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  326  			#address-cells = <0>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  327  			#interrupt-cells = <2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  328  			reg = <0x40000 0x40000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  329  			compatible = "chrp,open-pic";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  330  			device_type = "open-pic";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  331  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  332  	};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  333  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  334  	localbus@e0005000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  335  		compatible = "fsl,mpc8548-localbus", "fsl,pq3-localbus",
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  336  			     "simple-bus";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  337  		#address-cells = <2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  338  		#size-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  339  		reg = <0xe0005000 0x100>;	// BRx, ORx, etc.
c0f589502ed553 Dmitry Baryshkov    2011-06-01  340  		interrupt-parent = <&mpic>;
c0f589502ed553 Dmitry Baryshkov    2011-06-01  341  		interrupts = <19 2>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  342  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  343  		ranges = <
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  344  			0 0x0 0xfc000000 0x04000000	// NOR FLASH bank 1
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  345  			1 0x0 0xf8000000 0x08000000	// NOR FLASH bank 0
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  346  			2 0x0 0xe3000000 0x00008000	// CAN (2 x CC770)
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  347  			3 0x0 0xe3010000 0x00008000	// NAND FLASH
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  348  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  349  		>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  350  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  351  		flash@1,0 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  352  			#address-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  353  			#size-cells = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  354  			compatible = "cfi-flash";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  355  			reg = <1 0x0 0x8000000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  356  			bank-width = <4>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  357  			device-width = <1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  358  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  359  			partition@0 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  360  				label = "kernel";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  361  				reg = <0x00000000 0x00200000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  362  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  363  			partition@200000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  364  				label = "root";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  365  				reg = <0x00200000 0x00300000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  366  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  367  			partition@500000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  368  				label = "user";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  369  				reg = <0x00500000 0x07a00000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  370  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  371  			partition@7f00000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  372  				label = "env1";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  373  				reg = <0x07f00000 0x00040000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  374  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  375  			partition@7f40000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  376  				label = "env2";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  377  				reg = <0x07f40000 0x00040000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  378  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  379  			partition@7f80000 {
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  380  				label = "u-boot";
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  381  				reg = <0x07f80000 0x00080000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  382  				read-only;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  383  			};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  384  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  385  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  386  		/* Note: CAN support needs be enabled in U-Boot */
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  387  		can@2,0 {
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  388  			compatible = "bosch,cc770"; // Bosch CC770
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  389  			reg = <2 0x0 0x100>;
7a3852417c0c9b Wolfgang Grandegger 2009-01-29  390  			interrupts = <4 1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  391  			interrupt-parent = <&mpic>;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  392  			bosch,external-clock-frequency = <16000000>;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  393  			bosch,disconnect-rx1-input;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  394  			bosch,disconnect-tx1-output;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  395  			bosch,iso-low-speed-mux;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  396  			bosch,clock-out-frequency = <16000000>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  397  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  398  
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  399  		can@2,100 {
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  400  			compatible = "bosch,cc770"; // Bosch CC770
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  401  			reg = <2 0x100 0x100>;
7a3852417c0c9b Wolfgang Grandegger 2009-01-29  402  			interrupts = <4 1>;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  403  			interrupt-parent = <&mpic>;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  404  			bosch,external-clock-frequency = <16000000>;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  405  			bosch,disconnect-rx1-input;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  406  			bosch,disconnect-tx1-output;
fa17a019c87e2e Wolfgang Grandegger 2011-11-30  407  			bosch,iso-low-speed-mux;
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  408  		};
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  409  
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06  410  		/* Note: NAND support needs to be enabled in U-Boot */
6dd1b64a26d920 Wolfgang Grandegger 2008-06-06 @411  		upm@3,0 {

:::::: The code at line 411 was first introduced by commit
:::::: 6dd1b64a26d9209c09488e9fa257e7744823bf29 powerpc/85xx: add board support for the TQM8548 modules

:::::: TO: Wolfgang Grandegger <wg@grandegger.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
