Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7715B132
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698866; cv=none; b=ZD4Pp4HKKWOxpaHMykzkqqpC3ayGnoZy8Re5PESAM8D0Du9t6Gukv9bIbS6CyhfIdXGn+0ARMH22jJ5oHjnsDDZLZg4DtkExmhhcKmZfw3E/Ia/AWqRrkRfheev4LI2j1psuHfSYLB4H9MNqkpxItR1gFDe+w4GX1rMbC18i3aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698866; c=relaxed/simple;
	bh=b/fjLh/OQHVpsAQzuEU7wNppPtFygI337pm0h3a+Ckk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tE7QsRBV/3kZZL78/bxk5Sy9y9wAY1fZrObOHBGhV0Zde4iNqMgByncFT9yiIeyGyp6FHy7e60QVCPqQ2hOLjpFkDSvzy9WJzHxaVw7g5XB7roFZ3Q5rVKtGmrxxyDJS2xx4wDrKBYEvhS0cCAGLuJTKwe/iteM0ljaQaC4uV9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtV2bjMu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtV2bjMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720698864; x=1752234864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/fjLh/OQHVpsAQzuEU7wNppPtFygI337pm0h3a+Ckk=;
  b=XtV2bjMuskwG/7tyfYgUgX5ZjbYZKOUakLRdUYqZx7mQTDKEQAvj45k/
   TVpuBfHTZir74toap014YXKbo7JJWol05PNIPQzsolkfoHV7HkmqyQKrQ
   oFeFtX8FSF9GYZ+6G5khyRoxGu3QBc9R1hYXTS9SFTck1l+vceRB4Akg0
   3coTeB3NcRwhwSUDur+6F7dq0peUbfo3Ig7FA+gn+Gna9fOrINtkt1whM
   VG/xz3KbMfnkqGuuT/ekNcJhrDQ28mvGgT9qWtZozZrS8zzXoyHRCzxKz
   +iWOCOREc/+iImgAQpqX42rzGNCUBnNFnl/zDB71oSLP5u9e9ZeiSrVgx
   A==;
X-CSE-ConnectionGUID: mZU+IMQnQ9yxx3qZHIgozQ==
X-CSE-MsgGUID: CY/QzKdsR9yKlXL3fyn6BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="21889800"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="21889800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:54:24 -0700
X-CSE-ConnectionGUID: DH1sCinPRJaSQY0NpQSlIg==
X-CSE-MsgGUID: ZDfm7SsBQOydY1ojcK1AbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48428714"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jul 2024 04:54:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRsNP-000ZEM-2B;
	Thu, 11 Jul 2024 11:54:19 +0000
Date: Thu, 11 Jul 2024 19:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11857/12643]
 arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning
 (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202407111908.L14SzDTS-lkp@intel.com>
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
config: mips-ath79_defconfig (https://download.01.org/0day-ci/archive/20240711/202407111908.L14SzDTS-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111908.L14SzDTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111908.L14SzDTS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
>> arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +158 arch/mips/boot/dts/qca/ar9331.dtsi

1e6a3492e7bb12 Antony Pavlov  2016-03-17    3  
1e6a3492e7bb12 Antony Pavlov  2016-03-17    4  / {
1e6a3492e7bb12 Antony Pavlov  2016-03-17    5  	compatible = "qca,ar9331";
1e6a3492e7bb12 Antony Pavlov  2016-03-17    6  
1e6a3492e7bb12 Antony Pavlov  2016-03-17    7  	#address-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17    8  	#size-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17    9  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   10  	cpus {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   11  		#address-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   12  		#size-cells = <0>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   13  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   14  		cpu@0 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   15  			device_type = "cpu";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   16  			compatible = "mips,mips24Kc";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   17  			clocks = <&pll ATH79_CLK_CPU>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   18  			reg = <0>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   19  		};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   20  	};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   21  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   22  	cpuintc: interrupt-controller {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   23  		compatible = "qca,ar7100-cpu-intc";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   24  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   25  		interrupt-controller;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   26  		#interrupt-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   27  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   28  		qca,ddr-wb-channel-interrupts = <2>, <3>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   29  		qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   30  	};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   31  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   32  	ref: ref {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   33  		compatible = "fixed-clock";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   34  		#clock-cells = <0>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   35  	};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   36  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   37  	ahb {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   38  		compatible = "simple-bus";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   39  		ranges;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   40  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   41  		#address-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   42  		#size-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   43  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   44  		interrupt-parent = <&cpuintc>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   45  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   46  		apb {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   47  			compatible = "simple-bus";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   48  			ranges;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   49  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   50  			#address-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   51  			#size-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   52  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   53  			interrupt-parent = <&miscintc>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   54  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   55  			ddr_ctrl: memory-controller@18000000 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   56  				compatible = "qca,ar7240-ddr-controller";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   57  				reg = <0x18000000 0x100>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   58  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   59  				#qca,ddr-wb-channel-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   60  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   61  
e795688eeedfab Oleksij Rempel 2020-05-10   62  			uart: serial@18020000 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   63  				compatible = "qca,ar9330-uart";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   64  				reg = <0x18020000 0x14>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   65  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   66  				interrupts = <3>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   67  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   68  				clocks = <&ref>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   69  				clock-names = "uart";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   70  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   71  				status = "disabled";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   72  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   73  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   74  			gpio: gpio@18040000 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   75  				compatible = "qca,ar7100-gpio";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   76  				reg = <0x18040000 0x34>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   77  				interrupts = <2>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   78  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   79  				ngpios = <30>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   80  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   81  				gpio-controller;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   82  				#gpio-cells = <2>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   83  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   84  				interrupt-controller;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   85  				#interrupt-cells = <2>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   86  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   87  				status = "disabled";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   88  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   89  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   90  			pll: pll-controller@18050000 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17   91  				compatible = "qca,ar9330-pll";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   92  				reg = <0x18050000 0x100>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   93  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   94  				clocks = <&ref>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   95  				clock-names = "ref";
1e6a3492e7bb12 Antony Pavlov  2016-03-17   96  
1e6a3492e7bb12 Antony Pavlov  2016-03-17   97  				#clock-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17   98  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17   99  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  100  			miscintc: interrupt-controller@18060010 {
1e6a3492e7bb12 Antony Pavlov  2016-03-17  101  				compatible = "qca,ar7240-misc-intc";
0889d07f3e4b17 Oleksij Rempel 2019-09-30  102  				reg = <0x18060010 0x8>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  103  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  104  				interrupt-parent = <&cpuintc>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  105  				interrupts = <6>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  106  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  107  				interrupt-controller;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  108  				#interrupt-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  109  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17  110  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  111  			rst: reset-controller@1806001c {
1e6a3492e7bb12 Antony Pavlov  2016-03-17  112  				compatible = "qca,ar7100-reset";
1e6a3492e7bb12 Antony Pavlov  2016-03-17  113  				reg = <0x1806001c 0x4>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  114  
1e6a3492e7bb12 Antony Pavlov  2016-03-17  115  				#reset-cells = <1>;
1e6a3492e7bb12 Antony Pavlov  2016-03-17  116  			};
1e6a3492e7bb12 Antony Pavlov  2016-03-17  117  		};
1e6a3492e7bb12 Antony Pavlov  2016-03-17  118  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  119  		eth0: ethernet@19000000 {
7ff836f064e2c8 Oleksij Rempel 2019-05-24  120  			compatible = "qca,ar9330-eth";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  121  			reg = <0x19000000 0x200>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  122  			interrupts = <4>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  123  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  124  			resets = <&rst 9>, <&rst 22>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  125  			reset-names = "mac", "mdio";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  126  			clocks = <&pll ATH79_CLK_AHB>, <&pll ATH79_CLK_AHB>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  127  			clock-names = "eth", "mdio";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  128  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  129  			phy-mode = "mii";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  130  			phy-handle = <&phy_port4>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  131  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  132  			status = "disabled";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  133  		};
7ff836f064e2c8 Oleksij Rempel 2019-05-24  134  
7ff836f064e2c8 Oleksij Rempel 2019-05-24  135  		eth1: ethernet@1a000000 {
7ff836f064e2c8 Oleksij Rempel 2019-05-24  136  			compatible = "qca,ar9330-eth";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  137  			reg = <0x1a000000 0x200>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  138  			interrupts = <5>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  139  			resets = <&rst 13>, <&rst 23>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  140  			reset-names = "mac", "mdio";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  141  			clocks = <&pll ATH79_CLK_AHB>, <&pll ATH79_CLK_AHB>;
7ff836f064e2c8 Oleksij Rempel 2019-05-24  142  			clock-names = "eth", "mdio";
7ff836f064e2c8 Oleksij Rempel 2019-05-24  143  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  144  			phy-mode = "gmii";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  145  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  146  			status = "disabled";
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  147  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  148  			fixed-link {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  149  				speed = <1000>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  150  				full-duplex;
69e22d9ff71bae Oleksij Rempel 2021-05-14  151  				pause;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  152  			};
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  153  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  154  			mdio {
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  155  				#address-cells = <1>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  156  				#size-cells = <0>;
4eb7ae7a301d35 Oleksij Rempel 2019-12-18  157  
4eb7ae7a301d35 Oleksij Rempel 2019-12-18 @158  				switch10: switch@10 {

:::::: The code at line 158 was first introduced by commit
:::::: 4eb7ae7a301d3586c3351e81d5c3cfe2304a1a6a MIPS: ath79: ar9331: add ar9331-switch node

:::::: TO: Oleksij Rempel <o.rempel@pengutronix.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
