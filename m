Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C206715575C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744496236; cv=none; b=UR2/nXijBQLuCZTUu8qYNGqAXJNCrDBvB15LbJ3YRFRxlL8VCxXoyz7A6Jb72nDQdWLjuSlBsw8WFqpKdFaT3e/pajUb/IAg+jLn5lpabE/1enPghjeq+W1rnVXpGGluj9hM9Qy9MarumpVZrSvbt0zdg82K4H8XQkWNP3pcqU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744496236; c=relaxed/simple;
	bh=8NcU3nFi9q4iI+HfXgBvRZr25UKVmRWiZJ2Wx5xnh3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQXa0LGoEmUextCzoRHr6fmAkrZ0gi+aoCXaQKlpn6n6I3e7oexdjMqsyEM4aXon7hqrOHr/xkLCb74GZ2Hn7egPVfS4PqYiPtQw3AGXyeq4Hp/ciLyWsUz1imMLjRL3/tLN3i9TfjECw2SLFtwq2fIsZeBMLn11CqaV50300H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFqOAuWg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFqOAuWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744496234; x=1776032234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NcU3nFi9q4iI+HfXgBvRZr25UKVmRWiZJ2Wx5xnh3g=;
  b=EFqOAuWgDaEUcttR/evSSFaVvNThNHrdzyUUUZPcx0BQIUOu6sJq3Ifd
   JRv7obEm7wmcBbchR7OIWzYEsapgb/KDOzGZ4AHxdjwMAYBECbuv9cMcT
   JL/cbQVesG849Si/hs6lwgtTVI322j9cLpcdNEzb2x9phipYEeZcMLOZY
   c9RwfG9TyitEQChCxM98ZApqLpDwX75vjexhXtLn/ffjTR+mcW85a3aIG
   BLKDJF8IyEjjtRK88O/U+l7mV4JF4B6fY5uQ31U59fVifyARqE5VGw4D5
   5n4mLSJFxhHcObdJuIqAwYP4ngab2hVa8x4exwqERfZIqPUL2xe2HpnEt
   A==;
X-CSE-ConnectionGUID: fTrBWvCIQuCQRsQ0sTS4Tw==
X-CSE-MsgGUID: R0Aw/3aMR3OReFq6DmRdqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57392426"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="57392426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 15:17:10 -0700
X-CSE-ConnectionGUID: xfPJSx2QTjilWQ9wmYcoaA==
X-CSE-MsgGUID: +7myk6WxRoWyq/KlElG9Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129246092"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Apr 2025 15:17:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3j9u-000CAU-2Q;
	Sat, 12 Apr 2025 22:17:06 +0000
Date: Sun, 13 Apr 2025 06:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6650/6651]
 arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dts:91.9-93.4:
 Warning (unit_address_vs_reg): /memory: node has a reg or ranges property,
 but no unit name
Message-ID: <202504130603.pjUXMqVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: 36d17b79f989e71285cfa500eeba43bd454fdd5b [6650/6651] dts: mt7622: split PCIe node into slots
config: arm64-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130603.pjUXMqVQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130603.pjUXMqVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130603.pjUXMqVQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dts:91.9-93.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

vim +91 arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dts

55244a1a8304fd Daniel Golle 2023-07-13   17  
55244a1a8304fd Daniel Golle 2023-07-13   18  / {
55244a1a8304fd Daniel Golle 2023-07-13   19  	model = "Adtran SmartRG 841-t6";
55244a1a8304fd Daniel Golle 2023-07-13   20  	compatible = "mt7622-adtran-smartrg-841-t6", "mediatek,mt7622";
55244a1a8304fd Daniel Golle 2023-07-13   21  
55244a1a8304fd Daniel Golle 2023-07-13   22  	aliases {
55244a1a8304fd Daniel Golle 2023-07-13   23  		serial0 = &uart0;
55244a1a8304fd Daniel Golle 2023-07-13   24  		led-boot = &sys_status;
55244a1a8304fd Daniel Golle 2023-07-13   25  		led-failsafe = &sys_status;
55244a1a8304fd Daniel Golle 2023-07-13   26  		led-running = &sys_status;
55244a1a8304fd Daniel Golle 2023-07-13   27  		led-upgrade = &sys_status;
55244a1a8304fd Daniel Golle 2023-07-13   28  	};
55244a1a8304fd Daniel Golle 2023-07-13   29  
55244a1a8304fd Daniel Golle 2023-07-13   30  	chosen {
55244a1a8304fd Daniel Golle 2023-07-13   31  		stdout-path = "serial0:115200n8";
55244a1a8304fd Daniel Golle 2023-07-13   32  		bootargs = "earlycon=uart8250,mmio32,0x11002000 console=ttyS0,115200n1 swiotlb=512";
55244a1a8304fd Daniel Golle 2023-07-13   33  	};
55244a1a8304fd Daniel Golle 2023-07-13   34  
55244a1a8304fd Daniel Golle 2023-07-13   35  	cpus {
55244a1a8304fd Daniel Golle 2023-07-13   36  		cpu@0 {
55244a1a8304fd Daniel Golle 2023-07-13   37  			proc-supply = <&mt6380_vcpu_reg>;
55244a1a8304fd Daniel Golle 2023-07-13   38  			sram-supply = <&mt6380_vm_reg>;
55244a1a8304fd Daniel Golle 2023-07-13   39  		};
55244a1a8304fd Daniel Golle 2023-07-13   40  
55244a1a8304fd Daniel Golle 2023-07-13   41  		cpu@1 {
55244a1a8304fd Daniel Golle 2023-07-13   42  			proc-supply = <&mt6380_vcpu_reg>;
55244a1a8304fd Daniel Golle 2023-07-13   43  			sram-supply = <&mt6380_vm_reg>;
55244a1a8304fd Daniel Golle 2023-07-13   44  		};
55244a1a8304fd Daniel Golle 2023-07-13   45  	};
55244a1a8304fd Daniel Golle 2023-07-13   46  
55244a1a8304fd Daniel Golle 2023-07-13   47  	gpio-keys {
55244a1a8304fd Daniel Golle 2023-07-13   48  		compatible = "gpio-keys";
55244a1a8304fd Daniel Golle 2023-07-13   49  
55244a1a8304fd Daniel Golle 2023-07-13   50  		reset {
55244a1a8304fd Daniel Golle 2023-07-13   51  			label = "reset";
55244a1a8304fd Daniel Golle 2023-07-13   52  			linux,code = <KEY_RESTART>;
55244a1a8304fd Daniel Golle 2023-07-13   53  			gpios = <&pio 102 GPIO_ACTIVE_LOW>;
55244a1a8304fd Daniel Golle 2023-07-13   54  		};
55244a1a8304fd Daniel Golle 2023-07-13   55  
55244a1a8304fd Daniel Golle 2023-07-13   56  		wps {
55244a1a8304fd Daniel Golle 2023-07-13   57  			label = "wps";
55244a1a8304fd Daniel Golle 2023-07-13   58  			linux,code = <KEY_WPS_BUTTON>;
55244a1a8304fd Daniel Golle 2023-07-13   59  			gpios = <&pio 0 GPIO_ACTIVE_LOW>;
55244a1a8304fd Daniel Golle 2023-07-13   60  		};
55244a1a8304fd Daniel Golle 2023-07-13   61  	};
55244a1a8304fd Daniel Golle 2023-07-13   62  
55244a1a8304fd Daniel Golle 2023-07-13   63  	gpio-leds {
55244a1a8304fd Daniel Golle 2023-07-13   64  		compatible = "gpio-leds";
55244a1a8304fd Daniel Golle 2023-07-13   65  
55244a1a8304fd Daniel Golle 2023-07-13   66  		wifi2g {
55244a1a8304fd Daniel Golle 2023-07-13   67  			label = "wifi2g";
55244a1a8304fd Daniel Golle 2023-07-13   68  			gpios = <&pio 96 GPIO_ACTIVE_LOW>;
55244a1a8304fd Daniel Golle 2023-07-13   69  			linux,default-trigger = "phy0radio";
55244a1a8304fd Daniel Golle 2023-07-13   70  		};
55244a1a8304fd Daniel Golle 2023-07-13   71  
55244a1a8304fd Daniel Golle 2023-07-13   72  		wifi5g-1 {
55244a1a8304fd Daniel Golle 2023-07-13   73  			label = "wifi5g";
55244a1a8304fd Daniel Golle 2023-07-13   74  			gpios = <&pio 97 GPIO_ACTIVE_LOW>;
55244a1a8304fd Daniel Golle 2023-07-13   75  			linux,default-trigger = "phy1radio";
55244a1a8304fd Daniel Golle 2023-07-13   76  		};
55244a1a8304fd Daniel Golle 2023-07-13   77  
55244a1a8304fd Daniel Golle 2023-07-13   78  		wifi5g-2 {
55244a1a8304fd Daniel Golle 2023-07-13   79  			label = "wifi5g2";
55244a1a8304fd Daniel Golle 2023-07-13   80  			gpios = <&pio 98 GPIO_ACTIVE_LOW>;
55244a1a8304fd Daniel Golle 2023-07-13   81  			linux,default-trigger = "phy2radio";
55244a1a8304fd Daniel Golle 2023-07-13   82  		};
55244a1a8304fd Daniel Golle 2023-07-13   83  
55244a1a8304fd Daniel Golle 2023-07-13   84  		wps {
55244a1a8304fd Daniel Golle 2023-07-13   85  			label = "wps";
55244a1a8304fd Daniel Golle 2023-07-13   86  			gpios = <&pio 99 GPIO_ACTIVE_LOW>;
55244a1a8304fd Daniel Golle 2023-07-13   87  			default-state = "off";
55244a1a8304fd Daniel Golle 2023-07-13   88  		};
55244a1a8304fd Daniel Golle 2023-07-13   89  	};
55244a1a8304fd Daniel Golle 2023-07-13   90  
55244a1a8304fd Daniel Golle 2023-07-13  @91  	memory {
55244a1a8304fd Daniel Golle 2023-07-13   92  		reg = <0x0 0x40000000 0x0 0x40000000>;
55244a1a8304fd Daniel Golle 2023-07-13   93  	};
55244a1a8304fd Daniel Golle 2023-07-13   94  
55244a1a8304fd Daniel Golle 2023-07-13   95  	reserved-memory {
55244a1a8304fd Daniel Golle 2023-07-13   96  		#address-cells = <2>;
55244a1a8304fd Daniel Golle 2023-07-13   97  		#size-cells = <2>;
55244a1a8304fd Daniel Golle 2023-07-13   98  		ranges;
55244a1a8304fd Daniel Golle 2023-07-13   99  
55244a1a8304fd Daniel Golle 2023-07-13  100  		/delete-node/ramoops@42ff0000;
55244a1a8304fd Daniel Golle 2023-07-13  101  
55244a1a8304fd Daniel Golle 2023-07-13  102  		bootdata_reserved: bootdata@45000000 {
55244a1a8304fd Daniel Golle 2023-07-13  103  			no-map;
55244a1a8304fd Daniel Golle 2023-07-13  104  			reg = <0x0 0x45000000 0x0 0x00001000>;
55244a1a8304fd Daniel Golle 2023-07-13  105  		};
55244a1a8304fd Daniel Golle 2023-07-13  106  		ramoops_reserved: ramoops1@45001000 {
55244a1a8304fd Daniel Golle 2023-07-13  107  			no-map;
55244a1a8304fd Daniel Golle 2023-07-13  108  			compatible = "ramoops";
55244a1a8304fd Daniel Golle 2023-07-13  109  			reg = <0x0 0x45001000 0x0 0x00140000>;
55244a1a8304fd Daniel Golle 2023-07-13  110  			ftrace-size = <0x20000>;
55244a1a8304fd Daniel Golle 2023-07-13  111  			record-size = <0x20000>;
55244a1a8304fd Daniel Golle 2023-07-13  112  			console-size = <0x20000>;
55244a1a8304fd Daniel Golle 2023-07-13  113  			pmsg-size = <0x80000>;
55244a1a8304fd Daniel Golle 2023-07-13  114  		};
55244a1a8304fd Daniel Golle 2023-07-13  115  	};
55244a1a8304fd Daniel Golle 2023-07-13  116  
55244a1a8304fd Daniel Golle 2023-07-13  117  	bootdata {
55244a1a8304fd Daniel Golle 2023-07-13  118  		compatible = "bootdata";
55244a1a8304fd Daniel Golle 2023-07-13  119  		memory-region = <&bootdata_reserved>;
55244a1a8304fd Daniel Golle 2023-07-13  120  	};
55244a1a8304fd Daniel Golle 2023-07-13  121  
55244a1a8304fd Daniel Golle 2023-07-13  122  	reg_1p8v: regulator-1p8v {
55244a1a8304fd Daniel Golle 2023-07-13  123  		compatible = "regulator-fixed";
55244a1a8304fd Daniel Golle 2023-07-13  124  		regulator-name = "fixed-1.8V";
55244a1a8304fd Daniel Golle 2023-07-13  125  		regulator-min-microvolt = <1800000>;
55244a1a8304fd Daniel Golle 2023-07-13  126  		regulator-max-microvolt = <1800000>;
55244a1a8304fd Daniel Golle 2023-07-13  127  		regulator-always-on;
55244a1a8304fd Daniel Golle 2023-07-13  128  	};
55244a1a8304fd Daniel Golle 2023-07-13  129  
55244a1a8304fd Daniel Golle 2023-07-13  130  	reg_3p3v: regulator-3p3v {
55244a1a8304fd Daniel Golle 2023-07-13  131  		compatible = "regulator-fixed";
55244a1a8304fd Daniel Golle 2023-07-13  132  		regulator-name = "fixed-3.3V";
55244a1a8304fd Daniel Golle 2023-07-13  133  		regulator-min-microvolt = <3300000>;
55244a1a8304fd Daniel Golle 2023-07-13  134  		regulator-max-microvolt = <3300000>;
55244a1a8304fd Daniel Golle 2023-07-13  135  		regulator-boot-on;
55244a1a8304fd Daniel Golle 2023-07-13  136  		regulator-always-on;
55244a1a8304fd Daniel Golle 2023-07-13  137  	};
55244a1a8304fd Daniel Golle 2023-07-13  138  
55244a1a8304fd Daniel Golle 2023-07-13  139  	reg_5v: regulator-5v {
55244a1a8304fd Daniel Golle 2023-07-13  140  		compatible = "regulator-fixed";
55244a1a8304fd Daniel Golle 2023-07-13  141  		regulator-name = "fixed-5V";
55244a1a8304fd Daniel Golle 2023-07-13  142  		regulator-min-microvolt = <5000000>;
55244a1a8304fd Daniel Golle 2023-07-13  143  		regulator-max-microvolt = <5000000>;
55244a1a8304fd Daniel Golle 2023-07-13  144  		regulator-boot-on;
55244a1a8304fd Daniel Golle 2023-07-13  145  		regulator-always-on;
55244a1a8304fd Daniel Golle 2023-07-13  146  	};
55244a1a8304fd Daniel Golle 2023-07-13  147  };
55244a1a8304fd Daniel Golle 2023-07-13  148  

:::::: The code at line 91 was first introduced by commit
:::::: 55244a1a8304fdd47e60f1877345720dfe98f490 arm64: dts: mt7622: add device tree for Adtran SmartRG 841 T6

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Daniel Golle <daniel@makrotopia.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
