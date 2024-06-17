Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD02D176ABF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 02:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718592154; cv=none; b=S1j+sWrKx8eGWdCiWL9KTWrL6OzFFuHTsnRWLYLI6CKJvDHI/Te35za4k7gj9ZyFPHTcqvS3K/5nAiG7Af2t1a/njNVhr1JCalhE+7tbIKNKPJf/JU/joXI9D5ZOs0/gN6OaDSMr+iXCgVyDW2kcBYSKGouBhgoZaFQuXj1c9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718592154; c=relaxed/simple;
	bh=i+Wi6hvKumu92uoTsf5zm/xLOK43X7gzZUZbCVMLxdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2dcIUw0hwCX7I5JycIQhvCuOJxaSd9xZD9+PZ5k1qfDsZN4x8QdqhPh/YVexqUcdiJlYd0Lb9pwm80HyMSHFb0+s3tG0L29BtaWG4UOqlehLAqXqTHllI6qv6GTivTpirazlzBYNs1yx3Vq9ujCVibLAYDDfFQau98aKrfcJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6FsD7Wb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6FsD7Wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718592153; x=1750128153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+Wi6hvKumu92uoTsf5zm/xLOK43X7gzZUZbCVMLxdk=;
  b=X6FsD7Wb3Kr+pmFMBFLPF8IkqB4VGDeTIi5rCuZO+V9R0PIx7wvcl0k/
   /SN5xDKSHFyRxDt+HM1QmS76F181Xg2yRfTtIlHHC+8mMx+siYyAlwyU6
   /DFKUyRShYrVwj+8koa79PNElFEp3ljKKulpMxWLX7V/JN0s6USOcpMVH
   ZyqfgzloltmKvCthuoEsvTzK883S9b9CuBK5XOY8ftxOAp1z3boc2M2ro
   nurc1jDG2b+2M4xRy0TZT5QYLRrCygl8zqJjk3UlhQhfdG3KNNhiID56N
   sgizK5fCD2Wr0PiLOfV856pRy6pLL3V062LiU5nNC/MZMWMt2oKa3sLMB
   g==;
X-CSE-ConnectionGUID: 1z7m76S9S0a7ziLaCMlSmw==
X-CSE-MsgGUID: 6pTTJg2uSfCFQvM57CgBFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="19232802"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="19232802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 19:42:32 -0700
X-CSE-ConnectionGUID: ttA6ayWfTl2E2EXo7GX7Og==
X-CSE-MsgGUID: /RcapClKRba/c8dcNlochQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="45602810"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2024 19:42:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ2KC-0003gU-2W;
	Mon, 17 Jun 2024 02:42:28 +0000
Date: Mon, 17 Jun 2024 10:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rsslro 2583/2587]
 arch/arm64/boot/dts/mediatek/mt7622-adtran-smartrg-841-t6.dts:91.9-93.4:
 Warning (unit_address_vs_reg): /memory: node has a reg or ranges property,
 but no unit name
Message-ID: <202406171059.gGlZXrTO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rsslro
head:   eb3136f791cd4e799431e1050a94b2b25b20dc0d
commit: 3592ecafcedf797719cb1b78e303bfab189c4927 [2583/2587] dts: mt7622: split PCIe node into slots
config: arm64-randconfig-001-20240616 (https://download.01.org/0day-ci/archive/20240617/202406171059.gGlZXrTO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171059.gGlZXrTO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171059.gGlZXrTO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7622-adtran-smartrg-841-t6.dts:91.9-93.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

vim +91 arch/arm64/boot/dts/mediatek/mt7622-adtran-smartrg-841-t6.dts

008758421ecaba Daniel Golle 2023-07-13   17  
008758421ecaba Daniel Golle 2023-07-13   18  / {
008758421ecaba Daniel Golle 2023-07-13   19  	model = "Adtran SmartRG 841-t6";
008758421ecaba Daniel Golle 2023-07-13   20  	compatible = "mt7622-adtran-smartrg-841-t6", "mediatek,mt7622";
008758421ecaba Daniel Golle 2023-07-13   21  
008758421ecaba Daniel Golle 2023-07-13   22  	aliases {
008758421ecaba Daniel Golle 2023-07-13   23  		serial0 = &uart0;
008758421ecaba Daniel Golle 2023-07-13   24  		led-boot = &sys_status;
008758421ecaba Daniel Golle 2023-07-13   25  		led-failsafe = &sys_status;
008758421ecaba Daniel Golle 2023-07-13   26  		led-running = &sys_status;
008758421ecaba Daniel Golle 2023-07-13   27  		led-upgrade = &sys_status;
008758421ecaba Daniel Golle 2023-07-13   28  	};
008758421ecaba Daniel Golle 2023-07-13   29  
008758421ecaba Daniel Golle 2023-07-13   30  	chosen {
008758421ecaba Daniel Golle 2023-07-13   31  		stdout-path = "serial0:115200n8";
008758421ecaba Daniel Golle 2023-07-13   32  		bootargs = "earlycon=uart8250,mmio32,0x11002000 console=ttyS0,115200n1 swiotlb=512";
008758421ecaba Daniel Golle 2023-07-13   33  	};
008758421ecaba Daniel Golle 2023-07-13   34  
008758421ecaba Daniel Golle 2023-07-13   35  	cpus {
008758421ecaba Daniel Golle 2023-07-13   36  		cpu@0 {
008758421ecaba Daniel Golle 2023-07-13   37  			proc-supply = <&mt6380_vcpu_reg>;
008758421ecaba Daniel Golle 2023-07-13   38  			sram-supply = <&mt6380_vm_reg>;
008758421ecaba Daniel Golle 2023-07-13   39  		};
008758421ecaba Daniel Golle 2023-07-13   40  
008758421ecaba Daniel Golle 2023-07-13   41  		cpu@1 {
008758421ecaba Daniel Golle 2023-07-13   42  			proc-supply = <&mt6380_vcpu_reg>;
008758421ecaba Daniel Golle 2023-07-13   43  			sram-supply = <&mt6380_vm_reg>;
008758421ecaba Daniel Golle 2023-07-13   44  		};
008758421ecaba Daniel Golle 2023-07-13   45  	};
008758421ecaba Daniel Golle 2023-07-13   46  
008758421ecaba Daniel Golle 2023-07-13   47  	gpio-keys {
008758421ecaba Daniel Golle 2023-07-13   48  		compatible = "gpio-keys";
008758421ecaba Daniel Golle 2023-07-13   49  
008758421ecaba Daniel Golle 2023-07-13   50  		reset {
008758421ecaba Daniel Golle 2023-07-13   51  			label = "reset";
008758421ecaba Daniel Golle 2023-07-13   52  			linux,code = <KEY_RESTART>;
008758421ecaba Daniel Golle 2023-07-13   53  			gpios = <&pio 102 GPIO_ACTIVE_LOW>;
008758421ecaba Daniel Golle 2023-07-13   54  		};
008758421ecaba Daniel Golle 2023-07-13   55  
008758421ecaba Daniel Golle 2023-07-13   56  		wps {
008758421ecaba Daniel Golle 2023-07-13   57  			label = "wps";
008758421ecaba Daniel Golle 2023-07-13   58  			linux,code = <KEY_WPS_BUTTON>;
008758421ecaba Daniel Golle 2023-07-13   59  			gpios = <&pio 0 GPIO_ACTIVE_LOW>;
008758421ecaba Daniel Golle 2023-07-13   60  		};
008758421ecaba Daniel Golle 2023-07-13   61  	};
008758421ecaba Daniel Golle 2023-07-13   62  
008758421ecaba Daniel Golle 2023-07-13   63  	gpio-leds {
008758421ecaba Daniel Golle 2023-07-13   64  		compatible = "gpio-leds";
008758421ecaba Daniel Golle 2023-07-13   65  
008758421ecaba Daniel Golle 2023-07-13   66  		wifi2g {
008758421ecaba Daniel Golle 2023-07-13   67  			label = "wifi2g";
008758421ecaba Daniel Golle 2023-07-13   68  			gpios = <&pio 96 GPIO_ACTIVE_LOW>;
008758421ecaba Daniel Golle 2023-07-13   69  			linux,default-trigger = "phy0radio";
008758421ecaba Daniel Golle 2023-07-13   70  		};
008758421ecaba Daniel Golle 2023-07-13   71  
008758421ecaba Daniel Golle 2023-07-13   72  		wifi5g-1 {
008758421ecaba Daniel Golle 2023-07-13   73  			label = "wifi5g";
008758421ecaba Daniel Golle 2023-07-13   74  			gpios = <&pio 97 GPIO_ACTIVE_LOW>;
008758421ecaba Daniel Golle 2023-07-13   75  			linux,default-trigger = "phy1radio";
008758421ecaba Daniel Golle 2023-07-13   76  		};
008758421ecaba Daniel Golle 2023-07-13   77  
008758421ecaba Daniel Golle 2023-07-13   78  		wifi5g-2 {
008758421ecaba Daniel Golle 2023-07-13   79  			label = "wifi5g2";
008758421ecaba Daniel Golle 2023-07-13   80  			gpios = <&pio 98 GPIO_ACTIVE_LOW>;
008758421ecaba Daniel Golle 2023-07-13   81  			linux,default-trigger = "phy2radio";
008758421ecaba Daniel Golle 2023-07-13   82  		};
008758421ecaba Daniel Golle 2023-07-13   83  
008758421ecaba Daniel Golle 2023-07-13   84  		wps {
008758421ecaba Daniel Golle 2023-07-13   85  			label = "wps";
008758421ecaba Daniel Golle 2023-07-13   86  			gpios = <&pio 99 GPIO_ACTIVE_LOW>;
008758421ecaba Daniel Golle 2023-07-13   87  			default-state = "off";
008758421ecaba Daniel Golle 2023-07-13   88  		};
008758421ecaba Daniel Golle 2023-07-13   89  	};
008758421ecaba Daniel Golle 2023-07-13   90  
008758421ecaba Daniel Golle 2023-07-13  @91  	memory {
008758421ecaba Daniel Golle 2023-07-13   92  		reg = <0x0 0x40000000 0x0 0x40000000>;
008758421ecaba Daniel Golle 2023-07-13   93  	};
008758421ecaba Daniel Golle 2023-07-13   94  
008758421ecaba Daniel Golle 2023-07-13   95  	reserved-memory {
008758421ecaba Daniel Golle 2023-07-13   96  		#address-cells = <2>;
008758421ecaba Daniel Golle 2023-07-13   97  		#size-cells = <2>;
008758421ecaba Daniel Golle 2023-07-13   98  		ranges;
008758421ecaba Daniel Golle 2023-07-13   99  
008758421ecaba Daniel Golle 2023-07-13  100  		/delete-node/ramoops@42ff0000;
008758421ecaba Daniel Golle 2023-07-13  101  
008758421ecaba Daniel Golle 2023-07-13  102  		bootdata_reserved: bootdata@45000000 {
008758421ecaba Daniel Golle 2023-07-13  103  			no-map;
008758421ecaba Daniel Golle 2023-07-13  104  			reg = <0x0 0x45000000 0x0 0x00001000>;
008758421ecaba Daniel Golle 2023-07-13  105  		};
008758421ecaba Daniel Golle 2023-07-13  106  		ramoops_reserved: ramoops1@45001000 {
008758421ecaba Daniel Golle 2023-07-13  107  			no-map;
008758421ecaba Daniel Golle 2023-07-13  108  			compatible = "ramoops";
008758421ecaba Daniel Golle 2023-07-13  109  			reg = <0x0 0x45001000 0x0 0x00140000>;
008758421ecaba Daniel Golle 2023-07-13  110  			ftrace-size = <0x20000>;
008758421ecaba Daniel Golle 2023-07-13  111  			record-size = <0x20000>;
008758421ecaba Daniel Golle 2023-07-13  112  			console-size = <0x20000>;
008758421ecaba Daniel Golle 2023-07-13  113  			pmsg-size = <0x80000>;
008758421ecaba Daniel Golle 2023-07-13  114  		};
008758421ecaba Daniel Golle 2023-07-13  115  	};
008758421ecaba Daniel Golle 2023-07-13  116  
008758421ecaba Daniel Golle 2023-07-13  117  	bootdata {
008758421ecaba Daniel Golle 2023-07-13  118  		compatible = "bootdata";
008758421ecaba Daniel Golle 2023-07-13  119  		memory-region = <&bootdata_reserved>;
008758421ecaba Daniel Golle 2023-07-13  120  	};
008758421ecaba Daniel Golle 2023-07-13  121  
008758421ecaba Daniel Golle 2023-07-13  122  	reg_1p8v: regulator-1p8v {
008758421ecaba Daniel Golle 2023-07-13  123  		compatible = "regulator-fixed";
008758421ecaba Daniel Golle 2023-07-13  124  		regulator-name = "fixed-1.8V";
008758421ecaba Daniel Golle 2023-07-13  125  		regulator-min-microvolt = <1800000>;
008758421ecaba Daniel Golle 2023-07-13  126  		regulator-max-microvolt = <1800000>;
008758421ecaba Daniel Golle 2023-07-13  127  		regulator-always-on;
008758421ecaba Daniel Golle 2023-07-13  128  	};
008758421ecaba Daniel Golle 2023-07-13  129  
008758421ecaba Daniel Golle 2023-07-13  130  	reg_3p3v: regulator-3p3v {
008758421ecaba Daniel Golle 2023-07-13  131  		compatible = "regulator-fixed";
008758421ecaba Daniel Golle 2023-07-13  132  		regulator-name = "fixed-3.3V";
008758421ecaba Daniel Golle 2023-07-13  133  		regulator-min-microvolt = <3300000>;
008758421ecaba Daniel Golle 2023-07-13  134  		regulator-max-microvolt = <3300000>;
008758421ecaba Daniel Golle 2023-07-13  135  		regulator-boot-on;
008758421ecaba Daniel Golle 2023-07-13  136  		regulator-always-on;
008758421ecaba Daniel Golle 2023-07-13  137  	};
008758421ecaba Daniel Golle 2023-07-13  138  
008758421ecaba Daniel Golle 2023-07-13  139  	reg_5v: regulator-5v {
008758421ecaba Daniel Golle 2023-07-13  140  		compatible = "regulator-fixed";
008758421ecaba Daniel Golle 2023-07-13  141  		regulator-name = "fixed-5V";
008758421ecaba Daniel Golle 2023-07-13  142  		regulator-min-microvolt = <5000000>;
008758421ecaba Daniel Golle 2023-07-13  143  		regulator-max-microvolt = <5000000>;
008758421ecaba Daniel Golle 2023-07-13  144  		regulator-boot-on;
008758421ecaba Daniel Golle 2023-07-13  145  		regulator-always-on;
008758421ecaba Daniel Golle 2023-07-13  146  	};
008758421ecaba Daniel Golle 2023-07-13  147  };
008758421ecaba Daniel Golle 2023-07-13  148  

:::::: The code at line 91 was first introduced by commit
:::::: 008758421ecaba7e8d6fbe30166f8b4c7858b7f6 arm64: dts: mt7622: add device tree for Adtran SmartRG 841 T6

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Daniel Golle <daniel@makrotopia.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
