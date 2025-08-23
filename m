Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D72EAB72
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755977431; cv=none; b=BSRbT/RKYAMdAy4r8bcWIR5AYjTDst5SRB2lcE1tYyv5Y3PswA4QXYEl3o2tdBv5Ax5bB1hfAkpnvpTFXsFMvjTbui4vSuTmf7G2dbxsMAm9NtCG+tOPrf7crrUod2arJzc+fApSRaLaCM6agDrmiypljzsMYdbFvfFjetYc8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755977431; c=relaxed/simple;
	bh=JvarxLB/sV/e0uaHhCdJEI14ZdepXPH6bIaJ/mDFXQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIQ3j0dANABoTlvlAqh19VTwiqB+wo8njqKs1P8X+BdTzyZI7usi1SalXFapplHqhT2g3jyhCjC6kIr4TZCcWVisURUreutVQZkT4iIzBO/BnLc3mRBA/bGvbNhGCWAhhB9zXj9RBlURGjIsjQOCZl5QaCcflZqpKjSXXp9eNT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WN7ufoMR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WN7ufoMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755977428; x=1787513428;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JvarxLB/sV/e0uaHhCdJEI14ZdepXPH6bIaJ/mDFXQ0=;
  b=WN7ufoMRbSJiyCCGHHTOa7dEeNgaiX7apm9OQs/NbwF+oWn7tpb/H4q/
   P2+EeYyUfTcfI9tjBITezwuac3kMGrEC6sF1qg512i1/y8+XtIX96Km+0
   v7iVkyglkw+mAnmC4i61NR6DH1F2CIrInrUnBbQpzDODfcS3kzf+9drMv
   MYKIyp255Hqyayc7N8OgtiQ6W90GF64RLJmOK+AUdO2ySVuNJC5BUIm6Z
   xox3/Qgqj+Vm3BRbf5Ei4s9Yoj8/+Hx6sON1/l2aGcHdQpyTacu4I+tv+
   /0BbhqGR4zEsPhjzJXWBRUObc3ZmZbYFUTHlq+jKw8fTKNjKzAxbhyukQ
   w==;
X-CSE-ConnectionGUID: Eczahp4VQGCzqWev00LjVQ==
X-CSE-MsgGUID: P8pT5VG+R5u2XNpHdjDjgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58166599"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58166599"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 12:30:27 -0700
X-CSE-ConnectionGUID: D+C7vjVVQZWjFnPcQcstLw==
X-CSE-MsgGUID: ZH+dgg5RSGicJ1PWL/H0uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173232485"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2025 12:30:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uptwV-000MXN-0T;
	Sat, 23 Aug 2025 19:30:23 +0000
Date: Sun, 24 Aug 2025 03:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1170/4234]
 arch/mips/boot/dts/mobileye/eyeq5.dtsi:53.17-73.5: Warning
 (avoid_unnecessary_addr_size): /reserved-memory/nvram@461fe00: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or
 "ranges" property
Message-ID: <202508240317.wBLUh0ca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [1170/4234] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
config: mips-randconfig-052-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240317.wBLUh0ca-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240317.wBLUh0ca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240317.wBLUh0ca-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/mobileye/eyeq5.dtsi:53.17-73.5: Warning (avoid_unnecessary_addr_size): /reserved-memory/nvram@461fe00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

vim +53 arch/mips/boot/dts/mobileye/eyeq5.dtsi

8f6fd33b728edd Gregory CLEMENT 2024-02-16    9  
8f6fd33b728edd Gregory CLEMENT 2024-02-16   10  / {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   11  	#address-cells = <2>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   12  	#size-cells = <2>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   13  	cpus {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   14  		#address-cells = <1>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   15  		#size-cells = <0>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   16  		cpu@0 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   17  			device_type = "cpu";
8f6fd33b728edd Gregory CLEMENT 2024-02-16   18  			compatible = "img,i6500";
8f6fd33b728edd Gregory CLEMENT 2024-02-16   19  			reg = <0>;
d3c3c283afbe17 Théo Lebrun     2024-11-06   20  			clocks = <&olb EQ5C_CPU_CORE0>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   21  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   22  	};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   23  
8f6fd33b728edd Gregory CLEMENT 2024-02-16   24  	reserved-memory {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   25  		#address-cells = <2>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   26  		#size-cells = <2>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   27  		ranges;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   28  
8f6fd33b728edd Gregory CLEMENT 2024-02-16   29  		/* These reserved memory regions are also defined in bootmanager
8f6fd33b728edd Gregory CLEMENT 2024-02-16   30  		* for configuring inbound translation for BARS, don't change
8f6fd33b728edd Gregory CLEMENT 2024-02-16   31  		* these without syncing with bootmanager
8f6fd33b728edd Gregory CLEMENT 2024-02-16   32  		*/
8f6fd33b728edd Gregory CLEMENT 2024-02-16   33  		shmem0_reserved: shmem@804000000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   34  			reg = <0x8 0x04000000 0x0 0x1000000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   35  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   36  		shmem1_reserved: shmem@805000000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   37  			reg = <0x8 0x05000000 0x0 0x1000000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   38  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   39  		pci0_msi_reserved: pci0-msi@806000000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   40  			reg = <0x8 0x06000000 0x0 0x100000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   41  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   42  		pci1_msi_reserved: pci1-msi@806100000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   43  			reg = <0x8 0x06100000 0x0 0x100000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   44  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   45  
8f6fd33b728edd Gregory CLEMENT 2024-02-16   46  		mini_coredump0_reserved: mini-coredump0@806200000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   47  			reg = <0x8 0x06200000 0x0 0x100000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   48  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   49  		mhm_reserved_0: the-mhm-reserved-0@0 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   50  			reg = <0x8 0x00000000 0x0 0x0000800>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   51  		};
6afcaef38d4df4 Théo Lebrun     2024-12-30   52  
6afcaef38d4df4 Théo Lebrun     2024-12-30  @53  		nvram@461fe00 {
6afcaef38d4df4 Théo Lebrun     2024-12-30   54  			compatible = "mobileye,eyeq5-bootloader-config", "nvmem-rmem";
6afcaef38d4df4 Théo Lebrun     2024-12-30   55  			reg = <0x0 0x0461fe00 0x0 0x200>;
6afcaef38d4df4 Théo Lebrun     2024-12-30   56  			#address-cells = <1>;
6afcaef38d4df4 Théo Lebrun     2024-12-30   57  			#size-cells = <1>;
6afcaef38d4df4 Théo Lebrun     2024-12-30   58  			no-map;
6afcaef38d4df4 Théo Lebrun     2024-12-30   59  
6afcaef38d4df4 Théo Lebrun     2024-12-30   60  			nvmem-layout {
6afcaef38d4df4 Théo Lebrun     2024-12-30   61  				compatible = "fixed-layout";
6afcaef38d4df4 Théo Lebrun     2024-12-30   62  				#address-cells = <1>;
6afcaef38d4df4 Théo Lebrun     2024-12-30   63  				#size-cells = <1>;
6afcaef38d4df4 Théo Lebrun     2024-12-30   64  
6afcaef38d4df4 Théo Lebrun     2024-12-30   65  				eth0_mac: mac@7c {
6afcaef38d4df4 Théo Lebrun     2024-12-30   66  					reg = <0x7c 0x6>;
6afcaef38d4df4 Théo Lebrun     2024-12-30   67  				};
6afcaef38d4df4 Théo Lebrun     2024-12-30   68  
6afcaef38d4df4 Théo Lebrun     2024-12-30   69  				eth1_mac: mac@82 {
6afcaef38d4df4 Théo Lebrun     2024-12-30   70  					reg = <0x82 0x6>;
6afcaef38d4df4 Théo Lebrun     2024-12-30   71  				};
6afcaef38d4df4 Théo Lebrun     2024-12-30   72  			};
6afcaef38d4df4 Théo Lebrun     2024-12-30   73  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   74  	};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   75  
8f6fd33b728edd Gregory CLEMENT 2024-02-16   76  	aliases {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   77  		serial0 = &uart0;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   78  		serial1 = &uart1;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   79  		serial2 = &uart2;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   80  	};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   81  
8f6fd33b728edd Gregory CLEMENT 2024-02-16   82  	cpu_intc: interrupt-controller {
8f6fd33b728edd Gregory CLEMENT 2024-02-16   83  		compatible = "mti,cpu-interrupt-controller";
8f6fd33b728edd Gregory CLEMENT 2024-02-16   84  		interrupt-controller;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   85  		#address-cells = <0>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   86  		#interrupt-cells = <1>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16   87  	};
8f6fd33b728edd Gregory CLEMENT 2024-02-16   88  
d3c3c283afbe17 Théo Lebrun     2024-11-06   89  	xtal: xtal {
d3c3c283afbe17 Théo Lebrun     2024-11-06   90  		compatible = "fixed-clock";
d3c3c283afbe17 Théo Lebrun     2024-11-06   91  		#clock-cells = <0>;
d3c3c283afbe17 Théo Lebrun     2024-11-06   92  		clock-frequency = <30000000>;
d3c3c283afbe17 Théo Lebrun     2024-11-06   93  	};
d3c3c283afbe17 Théo Lebrun     2024-11-06   94  
d3c3c283afbe17 Théo Lebrun     2024-11-06   95  	pclk: pclk {
d3c3c283afbe17 Théo Lebrun     2024-11-06   96  		compatible = "fixed-clock";
d3c3c283afbe17 Théo Lebrun     2024-11-06   97  		#clock-cells = <0>;
d3c3c283afbe17 Théo Lebrun     2024-11-06   98  		clock-frequency = <250000000>;  /* 250MHz */
d3c3c283afbe17 Théo Lebrun     2024-11-06   99  	};
d3c3c283afbe17 Théo Lebrun     2024-11-06  100  
d3c3c283afbe17 Théo Lebrun     2024-11-06  101  	tsu_clk: tsu-clk {
d3c3c283afbe17 Théo Lebrun     2024-11-06  102  		compatible = "fixed-clock";
d3c3c283afbe17 Théo Lebrun     2024-11-06  103  		#clock-cells = <0>;
d3c3c283afbe17 Théo Lebrun     2024-11-06  104  		clock-frequency = <125000000>;  /* 125MHz */
d3c3c283afbe17 Théo Lebrun     2024-11-06  105  	};
d3c3c283afbe17 Théo Lebrun     2024-11-06  106  
8f6fd33b728edd Gregory CLEMENT 2024-02-16  107  	soc: soc {
8f6fd33b728edd Gregory CLEMENT 2024-02-16  108  		#address-cells = <2>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  109  		#size-cells = <2>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  110  		ranges;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  111  		compatible = "simple-bus";
8f6fd33b728edd Gregory CLEMENT 2024-02-16  112  
c1dbf4c8c2721b Théo Lebrun     2025-07-04  113  		i2c0: i2c@300000 {
c1dbf4c8c2721b Théo Lebrun     2025-07-04  114  			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  115  			reg = <0 0x300000 0x0 0x1000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  116  			interrupt-parent = <&gic>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  117  			interrupts = <GIC_SHARED 1 IRQ_TYPE_LEVEL_HIGH>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  118  			clock-frequency = <400000>; /* Fast mode */
c1dbf4c8c2721b Théo Lebrun     2025-07-04  119  			#address-cells = <1>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  120  			#size-cells = <0>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  121  			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  122  			clock-names = "i2cclk", "apb_pclk";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  123  			resets = <&olb 0 13>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  124  			i2c-transfer-timeout-us = <10000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  125  			mobileye,olb = <&olb 0>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  126  		};
c1dbf4c8c2721b Théo Lebrun     2025-07-04  127  
c1dbf4c8c2721b Théo Lebrun     2025-07-04  128  		i2c1: i2c@400000 {
c1dbf4c8c2721b Théo Lebrun     2025-07-04  129  			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  130  			reg = <0 0x400000 0x0 0x1000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  131  			interrupt-parent = <&gic>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  132  			interrupts = <GIC_SHARED 2 IRQ_TYPE_LEVEL_HIGH>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  133  			clock-frequency = <400000>; /* Fast mode */
c1dbf4c8c2721b Théo Lebrun     2025-07-04  134  			#address-cells = <1>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  135  			#size-cells = <0>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  136  			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  137  			clock-names = "i2cclk", "apb_pclk";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  138  			resets = <&olb 0 14>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  139  			i2c-transfer-timeout-us = <10000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  140  			mobileye,olb = <&olb 1>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  141  		};
c1dbf4c8c2721b Théo Lebrun     2025-07-04  142  
c1dbf4c8c2721b Théo Lebrun     2025-07-04  143  		i2c2: i2c@500000 {
c1dbf4c8c2721b Théo Lebrun     2025-07-04  144  			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  145  			reg = <0 0x500000 0x0 0x1000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  146  			interrupt-parent = <&gic>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  147  			interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  148  			clock-frequency = <400000>; /* Fast mode */
c1dbf4c8c2721b Théo Lebrun     2025-07-04  149  			#address-cells = <1>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  150  			#size-cells = <0>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  151  			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  152  			clock-names = "i2cclk", "apb_pclk";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  153  			resets = <&olb 0 15>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  154  			i2c-transfer-timeout-us = <10000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  155  			mobileye,olb = <&olb 2>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  156  		};
c1dbf4c8c2721b Théo Lebrun     2025-07-04  157  
c1dbf4c8c2721b Théo Lebrun     2025-07-04  158  		i2c3: i2c@600000 {
c1dbf4c8c2721b Théo Lebrun     2025-07-04  159  			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  160  			reg = <0 0x600000 0x0 0x1000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  161  			interrupt-parent = <&gic>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  162  			interrupts = <GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  163  			clock-frequency = <400000>; /* Fast mode */
c1dbf4c8c2721b Théo Lebrun     2025-07-04  164  			#address-cells = <1>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  165  			#size-cells = <0>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  166  			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  167  			clock-names = "i2cclk", "apb_pclk";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  168  			resets = <&olb 0 16>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  169  			i2c-transfer-timeout-us = <10000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  170  			mobileye,olb = <&olb 3>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  171  		};
c1dbf4c8c2721b Théo Lebrun     2025-07-04  172  
c1dbf4c8c2721b Théo Lebrun     2025-07-04  173  		i2c4: i2c@700000 {
c1dbf4c8c2721b Théo Lebrun     2025-07-04  174  			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  175  			reg = <0 0x700000 0x0 0x1000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  176  			interrupt-parent = <&gic>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  177  			interrupts = <GIC_SHARED 5 IRQ_TYPE_LEVEL_HIGH>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  178  			clock-frequency = <400000>; /* Fast mode */
c1dbf4c8c2721b Théo Lebrun     2025-07-04  179  			#address-cells = <1>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  180  			#size-cells = <0>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  181  			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  182  			clock-names = "i2cclk", "apb_pclk";
c1dbf4c8c2721b Théo Lebrun     2025-07-04  183  			resets = <&olb 0 17>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  184  			i2c-transfer-timeout-us = <10000>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  185  			mobileye,olb = <&olb 4>;
c1dbf4c8c2721b Théo Lebrun     2025-07-04  186  		};
c1dbf4c8c2721b Théo Lebrun     2025-07-04  187  
8f6fd33b728edd Gregory CLEMENT 2024-02-16  188  		uart0: serial@800000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16  189  			compatible = "arm,pl011", "arm,primecell";
8f6fd33b728edd Gregory CLEMENT 2024-02-16  190  			reg = <0 0x800000 0x0 0x1000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  191  			reg-io-width = <4>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  192  			interrupt-parent = <&gic>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  193  			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
d3c3c283afbe17 Théo Lebrun     2024-11-06  194  			clocks  = <&olb EQ5C_PER_UART>, <&olb EQ5C_PER_OCC>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  195  			clock-names = "uartclk", "apb_pclk";
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  196  			resets = <&olb 0 10>;
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  197  			pinctrl-names = "default";
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  198  			pinctrl-0 = <&uart0_pins>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  199  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16  200  
8f6fd33b728edd Gregory CLEMENT 2024-02-16  201  		uart1: serial@900000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16  202  			compatible = "arm,pl011", "arm,primecell";
8f6fd33b728edd Gregory CLEMENT 2024-02-16  203  			reg = <0 0x900000 0x0 0x1000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  204  			reg-io-width = <4>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  205  			interrupt-parent = <&gic>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  206  			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
d3c3c283afbe17 Théo Lebrun     2024-11-06  207  			clocks  = <&olb EQ5C_PER_UART>, <&olb EQ5C_PER_OCC>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  208  			clock-names = "uartclk", "apb_pclk";
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  209  			resets = <&olb 0 11>;
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  210  			pinctrl-names = "default";
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  211  			pinctrl-0 = <&uart1_pins>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  212  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16  213  
8f6fd33b728edd Gregory CLEMENT 2024-02-16  214  		uart2: serial@a00000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16  215  			compatible = "arm,pl011", "arm,primecell";
8f6fd33b728edd Gregory CLEMENT 2024-02-16  216  			reg = <0 0xa00000 0x0 0x1000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  217  			reg-io-width = <4>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  218  			interrupt-parent = <&gic>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  219  			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
d3c3c283afbe17 Théo Lebrun     2024-11-06  220  			clocks  = <&olb EQ5C_PER_UART>, <&olb EQ5C_PER_OCC>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  221  			clock-names = "uartclk", "apb_pclk";
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  222  			resets = <&olb 0 12>;
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  223  			pinctrl-names = "default";
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  224  			pinctrl-0 = <&uart2_pins>;
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  225  		};
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  226  
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  227  		olb: system-controller@e00000 {
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  228  			compatible = "mobileye,eyeq5-olb", "syscon";
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  229  			reg = <0 0xe00000 0x0 0x400>;
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  230  			#reset-cells = <2>;
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  231  			#clock-cells = <1>;
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  232  			clocks = <&xtal>;
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  233  			clock-names = "ref";
8f6fd33b728edd Gregory CLEMENT 2024-02-16  234  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16  235  
8f6fd33b728edd Gregory CLEMENT 2024-02-16  236  		gic: interrupt-controller@140000 {
8f6fd33b728edd Gregory CLEMENT 2024-02-16  237  			compatible = "mti,gic";
8f6fd33b728edd Gregory CLEMENT 2024-02-16  238  			reg = <0x0 0x140000 0x0 0x20000>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  239  			interrupt-controller;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  240  			#interrupt-cells = <3>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  241  
8f6fd33b728edd Gregory CLEMENT 2024-02-16  242  			/*
8f6fd33b728edd Gregory CLEMENT 2024-02-16  243  			* Declare the interrupt-parent even though the mti,gic
8f6fd33b728edd Gregory CLEMENT 2024-02-16  244  			* binding doesn't require it, such that the kernel can
8f6fd33b728edd Gregory CLEMENT 2024-02-16  245  			* figure out that cpu_intc is the root interrupt
8f6fd33b728edd Gregory CLEMENT 2024-02-16  246  			* controller & should be probed first.
8f6fd33b728edd Gregory CLEMENT 2024-02-16  247  			*/
8f6fd33b728edd Gregory CLEMENT 2024-02-16  248  			interrupt-parent = <&cpu_intc>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  249  
8f6fd33b728edd Gregory CLEMENT 2024-02-16  250  			timer {
8f6fd33b728edd Gregory CLEMENT 2024-02-16  251  				compatible = "mti,gic-timer";
8f6fd33b728edd Gregory CLEMENT 2024-02-16  252  				interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
d3c3c283afbe17 Théo Lebrun     2024-11-06  253  				clocks = <&olb EQ5C_CPU_CORE0>;
8f6fd33b728edd Gregory CLEMENT 2024-02-16  254  			};
8f6fd33b728edd Gregory CLEMENT 2024-02-16  255  		};
2de84c70ffcd5d Benoît Monin    2025-06-17  256  
707b74c6c2caf8 Benoît Monin    2025-07-22  257  		emmc: mmc@2200000 {
2de84c70ffcd5d Benoît Monin    2025-06-17  258  			compatible = "mobileye,eyeq-sd4hc", "cdns,sd4hc";
2de84c70ffcd5d Benoît Monin    2025-06-17  259  			reg = <0 0x2200000 0x0 0x1000>;
2de84c70ffcd5d Benoît Monin    2025-06-17  260  			interrupt-parent = <&gic>;
2de84c70ffcd5d Benoît Monin    2025-06-17  261  			interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
2de84c70ffcd5d Benoît Monin    2025-06-17  262  			clocks = <&olb EQ5C_PER_EMMC>;
2de84c70ffcd5d Benoît Monin    2025-06-17  263  			bus-width = <8>;
2de84c70ffcd5d Benoît Monin    2025-06-17  264  			max-frequency = <200000000>;
2de84c70ffcd5d Benoît Monin    2025-06-17  265  			mmc-ddr-1_8v;
2de84c70ffcd5d Benoît Monin    2025-06-17  266  			sd-uhs-ddr50;
2de84c70ffcd5d Benoît Monin    2025-06-17  267  			mmc-hs200-1_8v;
2de84c70ffcd5d Benoît Monin    2025-06-17  268  			mmc-hs400-1_8v;
2de84c70ffcd5d Benoît Monin    2025-06-17  269  			mmc-hs400-enhanced-strobe;
2de84c70ffcd5d Benoît Monin    2025-06-17  270  
2de84c70ffcd5d Benoît Monin    2025-06-17  271  			cdns,phy-input-delay-legacy = <4>;
2de84c70ffcd5d Benoît Monin    2025-06-17  272  			cdns,phy-input-delay-mmc-highspeed = <2>;
2de84c70ffcd5d Benoît Monin    2025-06-17  273  			cdns,phy-input-delay-mmc-ddr = <3>;
2de84c70ffcd5d Benoît Monin    2025-06-17  274  			cdns,phy-dll-delay-sdclk = <32>;
2de84c70ffcd5d Benoît Monin    2025-06-17  275  			cdns,phy-dll-delay-sdclk-hsmmc = <32>;
2de84c70ffcd5d Benoît Monin    2025-06-17  276  			cdns,phy-dll-delay-strobe = <32>;
2de84c70ffcd5d Benoît Monin    2025-06-17  277  		};
e235f02633e671 Théo Lebrun     2025-07-04  278  
e235f02633e671 Théo Lebrun     2025-07-04  279  		gpio0: gpio@1400000 {
e235f02633e671 Théo Lebrun     2025-07-04  280  			compatible = "mobileye,eyeq5-gpio";
e235f02633e671 Théo Lebrun     2025-07-04  281  			reg = <0x0 0x1400000 0x0 0x1000>;
e235f02633e671 Théo Lebrun     2025-07-04  282  			gpio-bank = <0>;
e235f02633e671 Théo Lebrun     2025-07-04  283  			ngpios = <29>;
e235f02633e671 Théo Lebrun     2025-07-04  284  			interrupt-parent = <&gic>;
e235f02633e671 Théo Lebrun     2025-07-04  285  			interrupts = <GIC_SHARED 14 IRQ_TYPE_LEVEL_HIGH>;
e235f02633e671 Théo Lebrun     2025-07-04  286  			gpio-controller;
e235f02633e671 Théo Lebrun     2025-07-04  287  			#gpio-cells = <2>;
e235f02633e671 Théo Lebrun     2025-07-04  288  			gpio-ranges = <&olb 0 0 29>;
e235f02633e671 Théo Lebrun     2025-07-04  289  			interrupt-controller;
e235f02633e671 Théo Lebrun     2025-07-04  290  			#interrupt-cells = <2>;
e235f02633e671 Théo Lebrun     2025-07-04  291  			resets = <&olb 0 26>;
e235f02633e671 Théo Lebrun     2025-07-04  292  		};
e235f02633e671 Théo Lebrun     2025-07-04  293  
e235f02633e671 Théo Lebrun     2025-07-04  294  		gpio1: gpio@1500000 {
e235f02633e671 Théo Lebrun     2025-07-04  295  			compatible = "mobileye,eyeq5-gpio";
e235f02633e671 Théo Lebrun     2025-07-04  296  			reg = <0x0 0x1500000 0x0 0x1000>;
e235f02633e671 Théo Lebrun     2025-07-04  297  			gpio-bank = <1>;
e235f02633e671 Théo Lebrun     2025-07-04  298  			ngpios = <23>;
e235f02633e671 Théo Lebrun     2025-07-04  299  			interrupt-parent = <&gic>;
e235f02633e671 Théo Lebrun     2025-07-04  300  			interrupts = <GIC_SHARED 14 IRQ_TYPE_LEVEL_HIGH>;
e235f02633e671 Théo Lebrun     2025-07-04  301  			gpio-controller;
e235f02633e671 Théo Lebrun     2025-07-04  302  			#gpio-cells = <2>;
e235f02633e671 Théo Lebrun     2025-07-04  303  			gpio-ranges = <&olb 0 29 23>;
e235f02633e671 Théo Lebrun     2025-07-04  304  			interrupt-controller;
e235f02633e671 Théo Lebrun     2025-07-04  305  			#interrupt-cells = <2>;
e235f02633e671 Théo Lebrun     2025-07-04  306  			resets = <&olb 0 26>;
e235f02633e671 Théo Lebrun     2025-07-04  307  		};
8f6fd33b728edd Gregory CLEMENT 2024-02-16  308  	};
8f6fd33b728edd Gregory CLEMENT 2024-02-16  309  };
9b7e81a9bf2c65 Théo Lebrun     2024-06-28  310  

:::::: The code at line 53 was first introduced by commit
:::::: 6afcaef38d4df444dcb3eaab4823a2c5d0f0b43a MIPS: mobileye: eyeq5: add bootloader config reserved memory

:::::: TO: Théo Lebrun <theo.lebrun@bootlin.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
