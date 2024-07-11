Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAB0143732
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 13:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704270; cv=none; b=n5i/OZlZxKeLL4brtc4FRjZCpWp90luwR4j80Qd/+hiYLayBrIOTD6fsjVTuU6xDWmMBjVMmjNc2S3DeZ7UGzkULG1rcL7SpI+WsfbCe2O2V6JnFZPju3bzaMjvmZ8wpV9tf+1U9MS5qpCnkzsanEfUrJCBA27trJhR+rgMBm34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704270; c=relaxed/simple;
	bh=R5kLr8ubZ0C8IgpQPPgaeWov3kRvVeAFgfyQ5td8KRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pw3983GQQ4DOpeHmYwCfY9bRaybD0Hr130/Kr4fcnZANMIqV3M0U7dRMmX5BPJIKVNgWWtfRhKv2cK8yj7s4JdG+6SVDzDYB1zS+tVpmLnibwRTaQN7ZHm7pgUNb3tEMR8Gz0c8IUCWwWUaYmO3adCXj1LwD9U10q2djKzxxqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mnc6QU45; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mnc6QU45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720704269; x=1752240269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5kLr8ubZ0C8IgpQPPgaeWov3kRvVeAFgfyQ5td8KRI=;
  b=Mnc6QU45mc3NGS0RHrTvBNR5cwYvODdtHErEGZ//PlbxQvpaOACfsDFU
   dMe2/uCigKlO8THT2D4VB8KFgewqKhtSdZX16nEcNACSj1jGEa6E+bfmI
   j6dWvfh2efXUpc42wBiGVgff4rhj+ZITQ87Od4jWdLr5quDWPwaN2gP9C
   Hj2GJ4ftpbrb1Cz5smOflJcbxovNIo1XNsLDrx/SrDxTVjJNPSZloXaYc
   10qG5q8s2MtVG+qhmm1N9tLDEKuFYj51jIHXCXcOFnFnaZaePIWijAkcO
   CksCoMwpGayYokS9HHSAiAJNqki8ch4kj8znerMhyBECjCHUaBcC3tvAK
   Q==;
X-CSE-ConnectionGUID: 6zrh5HUsQqG/haNWYlozow==
X-CSE-MsgGUID: PGZmU1w+SLSLFCDxsjWW1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28676485"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="28676485"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 06:24:28 -0700
X-CSE-ConnectionGUID: FlSzbzV8SMqIITFebgkOnA==
X-CSE-MsgGUID: ct45O1VORNyQoZSHcJERNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53376104"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jul 2024 06:24:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRtmZ-000ZJx-2r;
	Thu, 11 Jul 2024 13:24:23 +0000
Date: Thu, 11 Jul 2024 21:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11857/12643]
 arch/powerpc/boot/dts/sequoia.dts:214.14-235.7: Warning
 (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@3,0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407112103.sQCuUmZr-lkp@intel.com>
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
config: powerpc-ppc44x_defconfig (https://download.01.org/0day-ci/archive/20240711/202407112103.sQCuUmZr-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112103.sQCuUmZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112103.sQCuUmZr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/sequoia.dts:52.9-55.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/sequoia.dts:163.13-373.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/sequoia.dts:214.14-235.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +214 arch/powerpc/boot/dts/sequoia.dts

71f349799b34c8b David Gibson      2008-05-15   16  
d60ff953652f0a2 Valentine Barshak 2007-08-29   17  / {
d60ff953652f0a2 Valentine Barshak 2007-08-29   18  	#address-cells = <2>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   19  	#size-cells = <1>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   20  	model = "amcc,sequoia";
d60ff953652f0a2 Valentine Barshak 2007-08-29   21  	compatible = "amcc,sequoia";
71f349799b34c8b David Gibson      2008-05-15   22  	dcr-parent = <&{/cpus/cpu@0}>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   23  
8aaed98c1e28a2c Stefan Roese      2007-12-15   24  	aliases {
8aaed98c1e28a2c Stefan Roese      2007-12-15   25  		ethernet0 = &EMAC0;
8aaed98c1e28a2c Stefan Roese      2007-12-15   26  		ethernet1 = &EMAC1;
8aaed98c1e28a2c Stefan Roese      2007-12-15   27  		serial0 = &UART0;
8aaed98c1e28a2c Stefan Roese      2007-12-15   28  		serial1 = &UART1;
8aaed98c1e28a2c Stefan Roese      2007-12-15   29  		serial2 = &UART2;
8aaed98c1e28a2c Stefan Roese      2007-12-15   30  		serial3 = &UART3;
8aaed98c1e28a2c Stefan Roese      2007-12-15   31  	};
8aaed98c1e28a2c Stefan Roese      2007-12-15   32  
d60ff953652f0a2 Valentine Barshak 2007-08-29   33  	cpus {
d60ff953652f0a2 Valentine Barshak 2007-08-29   34  		#address-cells = <1>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   35  		#size-cells = <0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   36  
72fda1148e14d2f Josh Boyer        2007-12-06   37  		cpu@0 {
d60ff953652f0a2 Valentine Barshak 2007-08-29   38  			device_type = "cpu";
72fda1148e14d2f Josh Boyer        2007-12-06   39  			model = "PowerPC,440EPx";
71f349799b34c8b David Gibson      2008-05-15   40  			reg = <0x00000000>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   41  			clock-frequency = <0>; /* Filled in by zImage */
d60ff953652f0a2 Valentine Barshak 2007-08-29   42  			timebase-frequency = <0>; /* Filled in by zImage */
71f349799b34c8b David Gibson      2008-05-15   43  			i-cache-line-size = <32>;
71f349799b34c8b David Gibson      2008-05-15   44  			d-cache-line-size = <32>;
71f349799b34c8b David Gibson      2008-05-15   45  			i-cache-size = <32768>;
71f349799b34c8b David Gibson      2008-05-15   46  			d-cache-size = <32768>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   47  			dcr-controller;
d60ff953652f0a2 Valentine Barshak 2007-08-29   48  			dcr-access-method = "native";
d60ff953652f0a2 Valentine Barshak 2007-08-29   49  		};
d60ff953652f0a2 Valentine Barshak 2007-08-29   50  	};
d60ff953652f0a2 Valentine Barshak 2007-08-29   51  
d60ff953652f0a2 Valentine Barshak 2007-08-29   52  	memory {
d60ff953652f0a2 Valentine Barshak 2007-08-29   53  		device_type = "memory";
71f349799b34c8b David Gibson      2008-05-15   54  		reg = <0x00000000 0x00000000 0x00000000>; /* Filled in by zImage */
d60ff953652f0a2 Valentine Barshak 2007-08-29   55  	};
d60ff953652f0a2 Valentine Barshak 2007-08-29   56  
d60ff953652f0a2 Valentine Barshak 2007-08-29   57  	UIC0: interrupt-controller0 {
d60ff953652f0a2 Valentine Barshak 2007-08-29   58  		compatible = "ibm,uic-440epx","ibm,uic";
d60ff953652f0a2 Valentine Barshak 2007-08-29   59  		interrupt-controller;
d60ff953652f0a2 Valentine Barshak 2007-08-29   60  		cell-index = <0>;
71f349799b34c8b David Gibson      2008-05-15   61  		dcr-reg = <0x0c0 0x009>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   62  		#address-cells = <0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   63  		#size-cells = <0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   64  		#interrupt-cells = <2>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   65  	};
d60ff953652f0a2 Valentine Barshak 2007-08-29   66  
d60ff953652f0a2 Valentine Barshak 2007-08-29   67  	UIC1: interrupt-controller1 {
d60ff953652f0a2 Valentine Barshak 2007-08-29   68  		compatible = "ibm,uic-440epx","ibm,uic";
d60ff953652f0a2 Valentine Barshak 2007-08-29   69  		interrupt-controller;
d60ff953652f0a2 Valentine Barshak 2007-08-29   70  		cell-index = <1>;
71f349799b34c8b David Gibson      2008-05-15   71  		dcr-reg = <0x0d0 0x009>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   72  		#address-cells = <0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   73  		#size-cells = <0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   74  		#interrupt-cells = <2>;
71f349799b34c8b David Gibson      2008-05-15   75  		interrupts = <0x1e 0x4 0x1f 0x4>; /* cascade */
d60ff953652f0a2 Valentine Barshak 2007-08-29   76  		interrupt-parent = <&UIC0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   77  	};
d60ff953652f0a2 Valentine Barshak 2007-08-29   78  
d60ff953652f0a2 Valentine Barshak 2007-08-29   79  	UIC2: interrupt-controller2 {
d60ff953652f0a2 Valentine Barshak 2007-08-29   80  		compatible = "ibm,uic-440epx","ibm,uic";
d60ff953652f0a2 Valentine Barshak 2007-08-29   81  		interrupt-controller;
d60ff953652f0a2 Valentine Barshak 2007-08-29   82  		cell-index = <2>;
71f349799b34c8b David Gibson      2008-05-15   83  		dcr-reg = <0x0e0 0x009>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   84  		#address-cells = <0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   85  		#size-cells = <0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   86  		#interrupt-cells = <2>;
71f349799b34c8b David Gibson      2008-05-15   87  		interrupts = <0x1c 0x4 0x1d 0x4>; /* cascade */
d60ff953652f0a2 Valentine Barshak 2007-08-29   88  		interrupt-parent = <&UIC0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   89  	};
d60ff953652f0a2 Valentine Barshak 2007-08-29   90  
d60ff953652f0a2 Valentine Barshak 2007-08-29   91  	SDR0: sdr {
d60ff953652f0a2 Valentine Barshak 2007-08-29   92  		compatible = "ibm,sdr-440epx", "ibm,sdr-440ep";
71f349799b34c8b David Gibson      2008-05-15   93  		dcr-reg = <0x00e 0x002>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   94  	};
d60ff953652f0a2 Valentine Barshak 2007-08-29   95  
d60ff953652f0a2 Valentine Barshak 2007-08-29   96  	CPR0: cpr {
d60ff953652f0a2 Valentine Barshak 2007-08-29   97  		compatible = "ibm,cpr-440epx", "ibm,cpr-440ep";
71f349799b34c8b David Gibson      2008-05-15   98  		dcr-reg = <0x00c 0x002>;
d60ff953652f0a2 Valentine Barshak 2007-08-29   99  	};
d60ff953652f0a2 Valentine Barshak 2007-08-29  100  
d60ff953652f0a2 Valentine Barshak 2007-08-29  101  	plb {
d60ff953652f0a2 Valentine Barshak 2007-08-29  102  		compatible = "ibm,plb-440epx", "ibm,plb4";
d60ff953652f0a2 Valentine Barshak 2007-08-29  103  		#address-cells = <2>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  104  		#size-cells = <1>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  105  		ranges;
d60ff953652f0a2 Valentine Barshak 2007-08-29  106  		clock-frequency = <0>; /* Filled in by zImage */
d60ff953652f0a2 Valentine Barshak 2007-08-29  107  
d60ff953652f0a2 Valentine Barshak 2007-08-29  108  		SDRAM0: sdram {
d60ff953652f0a2 Valentine Barshak 2007-08-29  109  			compatible = "ibm,sdram-440epx", "ibm,sdram-44x-ddr2denali";
71f349799b34c8b David Gibson      2008-05-15  110  			dcr-reg = <0x010 0x002>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  111  		};
d60ff953652f0a2 Valentine Barshak 2007-08-29  112  
61d1baaea25dbcc Josh Boyer        2011-06-21  113  		CRYPTO: crypto@e0100000 {
61d1baaea25dbcc Josh Boyer        2011-06-21  114  			compatible = "amcc,ppc440epx-crypto","amcc,ppc4xx-crypto";
61d1baaea25dbcc Josh Boyer        2011-06-21  115  			reg = <0 0xE0100000 0x80400>;
61d1baaea25dbcc Josh Boyer        2011-06-21  116  			interrupt-parent = <&UIC0>;
61d1baaea25dbcc Josh Boyer        2011-06-21  117  			interrupts = <0x17 0x4>;
61d1baaea25dbcc Josh Boyer        2011-06-21  118  		};
61d1baaea25dbcc Josh Boyer        2011-06-21  119  
61d1baaea25dbcc Josh Boyer        2011-06-21  120  		rng@e0120000 {
61d1baaea25dbcc Josh Boyer        2011-06-21  121  			compatible = "amcc,ppc440epx-rng","amcc,ppc4xx-rng";
61d1baaea25dbcc Josh Boyer        2011-06-21  122  			reg = <0 0xE0120000 0x150>;
61d1baaea25dbcc Josh Boyer        2011-06-21  123  		};
61d1baaea25dbcc Josh Boyer        2011-06-21  124  
d60ff953652f0a2 Valentine Barshak 2007-08-29  125  		DMA0: dma {
d60ff953652f0a2 Valentine Barshak 2007-08-29  126  			compatible = "ibm,dma-440epx", "ibm,dma-4xx";
71f349799b34c8b David Gibson      2008-05-15  127  			dcr-reg = <0x100 0x027>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  128  		};
d60ff953652f0a2 Valentine Barshak 2007-08-29  129  
d60ff953652f0a2 Valentine Barshak 2007-08-29  130  		MAL0: mcmal {
d60ff953652f0a2 Valentine Barshak 2007-08-29  131  			compatible = "ibm,mcmal-440epx", "ibm,mcmal2";
71f349799b34c8b David Gibson      2008-05-15  132  			dcr-reg = <0x180 0x062>;
bd0076cc330f303 Valentine Barshak 2007-09-19  133  			num-tx-chans = <2>;
bd0076cc330f303 Valentine Barshak 2007-09-19  134  			num-rx-chans = <2>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  135  			interrupt-parent = <&MAL0>;
71f349799b34c8b David Gibson      2008-05-15  136  			interrupts = <0x0 0x1 0x2 0x3 0x4>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  137  			#interrupt-cells = <1>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  138  			#address-cells = <0>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  139  			#size-cells = <0>;
71f349799b34c8b David Gibson      2008-05-15  140  			interrupt-map = </*TXEOB*/ 0x0 &UIC0 0xa 0x4
71f349799b34c8b David Gibson      2008-05-15  141  					/*RXEOB*/ 0x1 &UIC0 0xb 0x4
71f349799b34c8b David Gibson      2008-05-15  142  					/*SERR*/  0x2 &UIC1 0x0 0x4
71f349799b34c8b David Gibson      2008-05-15  143  					/*TXDE*/  0x3 &UIC1 0x1 0x4
71f349799b34c8b David Gibson      2008-05-15  144  					/*RXDE*/  0x4 &UIC1 0x2 0x4>;
71f349799b34c8b David Gibson      2008-05-15  145  			interrupt-map-mask = <0xffffffff>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  146  		};
d60ff953652f0a2 Valentine Barshak 2007-08-29  147  
f82f5a26723a055 Valentine Barshak 2007-10-09  148  		USB1: usb@e0000400 {
796bcae7361c28c Vitaly Bordug     2008-11-09  149  			compatible = "ibm,usb-ohci-440epx", "ohci-be";
71f349799b34c8b David Gibson      2008-05-15  150  			reg = <0x00000000 0xe0000400 0x00000060>;
f82f5a26723a055 Valentine Barshak 2007-10-09  151  			interrupt-parent = <&UIC0>;
71f349799b34c8b David Gibson      2008-05-15  152  			interrupts = <0x15 0x8>;
f82f5a26723a055 Valentine Barshak 2007-10-09  153  		};
f82f5a26723a055 Valentine Barshak 2007-10-09  154  
3c0c6cb5eb29317 Valentine Barshak 2007-09-25  155  		USB0: ehci@e0000300 {
3c0c6cb5eb29317 Valentine Barshak 2007-09-25  156  			compatible = "ibm,usb-ehci-440epx", "usb-ehci";
3c0c6cb5eb29317 Valentine Barshak 2007-09-25  157  			interrupt-parent = <&UIC0>;
71f349799b34c8b David Gibson      2008-05-15  158  			interrupts = <0x1a 0x4>;
71f349799b34c8b David Gibson      2008-05-15  159  			reg = <0x00000000 0xe0000300 0x00000090 0x00000000 0xe0000390 0x00000070>;
3c0c6cb5eb29317 Valentine Barshak 2007-09-25  160  			big-endian;
3c0c6cb5eb29317 Valentine Barshak 2007-09-25  161  		};
3c0c6cb5eb29317 Valentine Barshak 2007-09-25  162  
d60ff953652f0a2 Valentine Barshak 2007-08-29  163  		POB0: opb {
d60ff953652f0a2 Valentine Barshak 2007-08-29  164  		  	compatible = "ibm,opb-440epx", "ibm,opb";
d60ff953652f0a2 Valentine Barshak 2007-08-29  165  			#address-cells = <1>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  166  			#size-cells = <1>;
71f349799b34c8b David Gibson      2008-05-15  167  		  	ranges = <0x00000000 0x00000001 0x00000000 0x80000000
71f349799b34c8b David Gibson      2008-05-15  168  			          0x80000000 0x00000001 0x80000000 0x80000000>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  169  		  	interrupt-parent = <&UIC1>;
71f349799b34c8b David Gibson      2008-05-15  170  		  	interrupts = <0x7 0x4>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  171  		  	clock-frequency = <0>; /* Filled in by zImage */
d60ff953652f0a2 Valentine Barshak 2007-08-29  172  
d60ff953652f0a2 Valentine Barshak 2007-08-29  173  			EBC0: ebc {
d60ff953652f0a2 Valentine Barshak 2007-08-29  174  				compatible = "ibm,ebc-440epx", "ibm,ebc";
71f349799b34c8b David Gibson      2008-05-15  175  				dcr-reg = <0x012 0x002>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  176  				#address-cells = <2>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  177  				#size-cells = <1>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  178  				clock-frequency = <0>; /* Filled in by zImage */
71f349799b34c8b David Gibson      2008-05-15  179  				interrupts = <0x5 0x1>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  180  				interrupt-parent = <&UIC1>;
d60ff953652f0a2 Valentine Barshak 2007-08-29  181  
d60ff953652f0a2 Valentine Barshak 2007-08-29  182  				nor_flash@0,0 {
504ca43e5e681b8 Josh Boyer        2007-09-15  183  					compatible = "amd,s29gl256n", "cfi-flash";
d60ff953652f0a2 Valentine Barshak 2007-08-29  184  					bank-width = <2>;
71f349799b34c8b David Gibson      2008-05-15  185  					reg = <0x00000000 0x00000000 0x04000000>;
504ca43e5e681b8 Josh Boyer        2007-09-15  186  					#address-cells = <1>;
504ca43e5e681b8 Josh Boyer        2007-09-15  187  					#size-cells = <1>;
504ca43e5e681b8 Josh Boyer        2007-09-15  188  					partition@0 {
504ca43e5e681b8 Josh Boyer        2007-09-15  189  						label = "Kernel";
71f349799b34c8b David Gibson      2008-05-15  190  						reg = <0x00000000 0x00180000>;
504ca43e5e681b8 Josh Boyer        2007-09-15  191  					};
504ca43e5e681b8 Josh Boyer        2007-09-15  192  					partition@180000 {
504ca43e5e681b8 Josh Boyer        2007-09-15  193  						label = "ramdisk";
71f349799b34c8b David Gibson      2008-05-15  194  						reg = <0x00180000 0x00200000>;
504ca43e5e681b8 Josh Boyer        2007-09-15  195  					};
504ca43e5e681b8 Josh Boyer        2007-09-15  196  					partition@380000 {
504ca43e5e681b8 Josh Boyer        2007-09-15  197  						label = "file system";
71f349799b34c8b David Gibson      2008-05-15  198  						reg = <0x00380000 0x03aa0000>;
504ca43e5e681b8 Josh Boyer        2007-09-15  199  					};
504ca43e5e681b8 Josh Boyer        2007-09-15  200  					partition@3e20000 {
504ca43e5e681b8 Josh Boyer        2007-09-15  201  						label = "kozio";
71f349799b34c8b David Gibson      2008-05-15  202  						reg = <0x03e20000 0x00140000>;
504ca43e5e681b8 Josh Boyer        2007-09-15  203  					};
504ca43e5e681b8 Josh Boyer        2007-09-15  204  					partition@3f60000 {
504ca43e5e681b8 Josh Boyer        2007-09-15  205  						label = "env";
71f349799b34c8b David Gibson      2008-05-15  206  						reg = <0x03f60000 0x00040000>;
504ca43e5e681b8 Josh Boyer        2007-09-15  207  					};
504ca43e5e681b8 Josh Boyer        2007-09-15  208  					partition@3fa0000 {
504ca43e5e681b8 Josh Boyer        2007-09-15  209  						label = "u-boot";
71f349799b34c8b David Gibson      2008-05-15  210  						reg = <0x03fa0000 0x00060000>;
504ca43e5e681b8 Josh Boyer        2007-09-15  211  					};
d60ff953652f0a2 Valentine Barshak 2007-08-29  212  				};
d60ff953652f0a2 Valentine Barshak 2007-08-29  213  
7b8d639cfc79673 Stefan Roese      2009-04-07 @214  				ndfc@3,0 {

:::::: The code at line 214 was first introduced by commit
:::::: 7b8d639cfc7967388d1cfe2a81e7e3c872a81a0d powerpc/4xx: Sequoia: Enable NAND support

:::::: TO: Stefan Roese <sr@denx.de>
:::::: CC: Josh Boyer <jwboyer@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
