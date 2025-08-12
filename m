Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF102D6E7A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754982595; cv=none; b=CMRPONOhuGwdj+jJ07JFf0tfY2tMWYlMJzhflbdlHthkhVNQvRJ6oSvbOPcrQJbYKsJEYNAlZId4Ithgm20SNabWd+mQ3k53LmwIP+IBxBkZnGBdT1gL+fvsR5n9T/HfQuLbBhkpnql6p12u95H1+lO5pgSiqjfwPt4nCsmRtUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754982595; c=relaxed/simple;
	bh=DYTrBtNujTYlB/IFqgRSro/qeXye4N2WfYTvAKTrWLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IbUkQfvqBKXG8MDLYM+wdgveK1kvxWwpHjmll2/dOyOA+okN9DP4TB1aioG4VaU6Xei7UwuqAaBp/mrYMNkxjHFFLogfgY1q+2ckVxE2ZADg7ne369FSFr/x45ddR/EPVeDcYI7N7A9OBZ9fXjNtMWFZXaq4Oex6f8f1h7G3l7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJ9lOoLu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJ9lOoLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754982588; x=1786518588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYTrBtNujTYlB/IFqgRSro/qeXye4N2WfYTvAKTrWLE=;
  b=WJ9lOoLuadUoyG3pBrjjsWZ9YNbw48xHm98PK+DD+7YZ0hh4EX1D8lcb
   s3EaZxYRdk6BU+bZy6Ng/uFHrbExbYvmoh1JapRCd/NpKGNFdairLrfr3
   TTg3aars6FeWV9cv1vpb0BrmTgFLF/ADnn3d2eXImPSq+V51ScT2U0LLT
   WbF4OkD9hG25zUyDFQt3zfkXh4c/joyd8Q+Oeq/xApMikbR6tCX+LcNcI
   s9bscyIiaZaUoJXNYHHrlmIVC6E93NVrf878gBnaWNAfNBYRDTrx3kEGU
   RayRYVXhoWHoR6KjlIfxm8k9j7LlRUuLNfefxn7pmwKOUV7pG6AcaLusu
   A==;
X-CSE-ConnectionGUID: dq4T0fBuRsu3Kj64SbAkLQ==
X-CSE-MsgGUID: UOkYgU1JQP2Z+WbFNbV2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57168629"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57168629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 00:09:47 -0700
X-CSE-ConnectionGUID: R1mZMIGcQkC8hWZc5BYIwg==
X-CSE-MsgGUID: qM/9lAMVTVSc2byNiPM/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="171372107"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2025 00:09:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulj7h-0006Ue-1G;
	Tue, 12 Aug 2025 07:09:00 +0000
Date: Tue, 12 Aug 2025 15:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1334/1649]
 arch/arm64/boot/dts/nvidia/tegra194.dtsi:2391.4-42: Warning (interrupt_map):
 /bus@0/pcie@14100000:interrupt-map: Missing property '#address-cells' in
 node /bus@0/interrupt-controller@3881000, using 0 as fallback
Message-ID: <202508121500.RvXjS54z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [1334/1649] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
config: arm64-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121500.RvXjS54z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121500.RvXjS54z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121500.RvXjS54z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra194.dtsi:2391.4-42: Warning (interrupt_map): /bus@0/pcie@14100000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194.dtsi:2443.4-42: Warning (interrupt_map): /bus@0/pcie@14120000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194.dtsi:2495.4-42: Warning (interrupt_map): /bus@0/pcie@14140000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194.dtsi:2547.4-42: Warning (interrupt_map): /bus@0/pcie@14160000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194.dtsi:2638.4-42: Warning (interrupt_map): /bus@0/pcie@14180000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
>> arch/arm64/boot/dts/nvidia/tegra194.dtsi:2734.4-42: Warning (interrupt_map): /bus@0/pcie@141a0000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
--
>> arch/arm64/boot/dts/nvidia/tegra186.dtsi:1355.3-41: Warning (interrupt_map): /pcie@10003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@3881000, using 0 as fallback
--
>> arch/arm64/boot/dts/nvidia/tegra194.dtsi:2391.4-42: Warning (interrupt_map): /bus@0/pcie@14100000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194.dtsi:2443.4-42: Warning (interrupt_map): /bus@0/pcie@14120000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194.dtsi:2495.4-42: Warning (interrupt_map): /bus@0/pcie@14140000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194.dtsi:2547.4-42: Warning (interrupt_map): /bus@0/pcie@14160000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194.dtsi:2638.4-42: Warning (interrupt_map): /bus@0/pcie@14180000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
>> arch/arm64/boot/dts/nvidia/tegra194.dtsi:2734.4-42: Warning (interrupt_map): /bus@0/pcie@141a0000:interrupt-map: Missing property '#address-cells' in node /bus@0/interrupt-controller@3881000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts:2148.12-2159.8: Warning (graph_child_address): /bus@0/i2c@c240000/typec@8/connector@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +2391 arch/arm64/boot/dts/nvidia/tegra194.dtsi

5425fb15d8ee64 Mikko Perttunen     2018-02-20    12  
5425fb15d8ee64 Mikko Perttunen     2018-02-20    13  / {
5425fb15d8ee64 Mikko Perttunen     2018-02-20    14  	compatible = "nvidia,tegra194";
5425fb15d8ee64 Mikko Perttunen     2018-02-20    15  	interrupt-parent = <&gic>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20    16  	#address-cells = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20    17  	#size-cells = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20    18  
5425fb15d8ee64 Mikko Perttunen     2018-02-20    19  	/* control backbone */
8b3aee8f08464b Thierry Reding      2020-06-12    20  	bus@0 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20    21  		compatible = "simple-bus";
2838cfddbc1c4e Thierry Reding      2022-11-17    22  
2838cfddbc1c4e Thierry Reding      2022-11-17    23  		#address-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17    24  		#size-cells = <2>;
4bb54c2ce48ffb Thierry Reding      2023-02-14    25  		ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20    26  
a47e173e5d1ceb Sumit Gupta         2022-05-12    27  		apbmisc: misc@100000 {
09903c5e07ac1f JC Kuo              2020-01-03    28  			compatible = "nvidia,tegra194-misc";
2838cfddbc1c4e Thierry Reding      2022-11-17    29  			reg = <0x0 0x00100000 0x0 0xf000>,
2838cfddbc1c4e Thierry Reding      2022-11-17    30  			      <0x0 0x0010f000 0x0 0x1000>;
09903c5e07ac1f JC Kuo              2020-01-03    31  		};
09903c5e07ac1f JC Kuo              2020-01-03    32  
f69ce393ec48a7 Mikko Perttunen     2018-06-20    33  		gpio: gpio@2200000 {
f69ce393ec48a7 Mikko Perttunen     2018-06-20    34  			compatible = "nvidia,tegra194-gpio";
f69ce393ec48a7 Mikko Perttunen     2018-06-20    35  			reg-names = "security", "gpio";
2838cfddbc1c4e Thierry Reding      2022-11-17    36  			reg = <0x0 0x2200000 0x0 0x10000>,
2838cfddbc1c4e Thierry Reding      2022-11-17    37  			      <0x0 0x2210000 0x0 0x10000>;
f69ce393ec48a7 Mikko Perttunen     2018-06-20    38  			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    39  				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    40  				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    41  				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    42  				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    43  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    44  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    45  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
f69ce393ec48a7 Mikko Perttunen     2018-06-20    46  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    47  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    48  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    49  				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    50  				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    51  				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    52  				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    53  				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
f69ce393ec48a7 Mikko Perttunen     2018-06-20    54  				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    55  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    56  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    57  				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    58  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    59  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    60  				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    61  				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
f69ce393ec48a7 Mikko Perttunen     2018-06-20    62  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    63  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    64  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    65  				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    66  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    67  				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    68  				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    69  				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
f69ce393ec48a7 Mikko Perttunen     2018-06-20    70  				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    71  				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    72  				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    73  				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    74  				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    75  				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    76  				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    77  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    78  				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    79  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    80  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    81  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    82  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    83  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    84  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07    85  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
f69ce393ec48a7 Mikko Perttunen     2018-06-20    86  			#interrupt-cells = <2>;
f69ce393ec48a7 Mikko Perttunen     2018-06-20    87  			interrupt-controller;
f69ce393ec48a7 Mikko Perttunen     2018-06-20    88  			#gpio-cells = <2>;
f69ce393ec48a7 Mikko Perttunen     2018-06-20    89  			gpio-controller;
6f380a4ec04fc9 Thierry Reding      2022-11-04    90  			gpio-ranges = <&pinmux 0 0 169>;
f69ce393ec48a7 Mikko Perttunen     2018-06-20    91  		};
f69ce393ec48a7 Mikko Perttunen     2018-06-20    92  
a47e173e5d1ceb Sumit Gupta         2022-05-12    93  		cbb-noc@2300000 {
a47e173e5d1ceb Sumit Gupta         2022-05-12    94  			compatible = "nvidia,tegra194-cbb-noc";
2838cfddbc1c4e Thierry Reding      2022-11-17    95  			reg = <0x0 0x02300000 0x0 0x1000>;
a47e173e5d1ceb Sumit Gupta         2022-05-12    96  			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
a47e173e5d1ceb Sumit Gupta         2022-05-12    97  				     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
a47e173e5d1ceb Sumit Gupta         2022-05-12    98  			nvidia,axi2apb = <&axi2apb>;
a47e173e5d1ceb Sumit Gupta         2022-05-12    99  			nvidia,apbmisc = <&apbmisc>;
a47e173e5d1ceb Sumit Gupta         2022-05-12   100  			status = "okay";
a47e173e5d1ceb Sumit Gupta         2022-05-12   101  		};
a47e173e5d1ceb Sumit Gupta         2022-05-12   102  
a47e173e5d1ceb Sumit Gupta         2022-05-12   103  		axi2apb: axi2apb@2390000 {
a47e173e5d1ceb Sumit Gupta         2022-05-12   104  			compatible = "nvidia,tegra194-axi2apb";
2838cfddbc1c4e Thierry Reding      2022-11-17   105  			reg = <0x0 0x2390000 0x0 0x1000>,
2838cfddbc1c4e Thierry Reding      2022-11-17   106  			      <0x0 0x23a0000 0x0 0x1000>,
2838cfddbc1c4e Thierry Reding      2022-11-17   107  			      <0x0 0x23b0000 0x0 0x1000>,
2838cfddbc1c4e Thierry Reding      2022-11-17   108  			      <0x0 0x23c0000 0x0 0x1000>,
2838cfddbc1c4e Thierry Reding      2022-11-17   109  			      <0x0 0x23d0000 0x0 0x1000>,
2838cfddbc1c4e Thierry Reding      2022-11-17   110  			      <0x0 0x23e0000 0x0 0x1000>;
a47e173e5d1ceb Sumit Gupta         2022-05-12   111  			status = "okay";
a47e173e5d1ceb Sumit Gupta         2022-05-12   112  		};
a47e173e5d1ceb Sumit Gupta         2022-05-12   113  
79ed18d9ece474 Thierry Reding      2022-11-22   114  		pinmux: pinmux@2430000 {
79ed18d9ece474 Thierry Reding      2022-11-22   115  			compatible = "nvidia,tegra194-pinmux";
79ed18d9ece474 Thierry Reding      2022-11-22   116  			reg = <0x0 0x2430000 0x0 0x17000>;
79ed18d9ece474 Thierry Reding      2022-11-22   117  			status = "okay";
79ed18d9ece474 Thierry Reding      2022-11-22   118  
79ed18d9ece474 Thierry Reding      2022-11-22   119  			pex_clkreq_c5_bi_dir_state: pinmux-pex-clkreq-c5-bi-dir {
79ed18d9ece474 Thierry Reding      2022-11-22   120  				clkreq {
79ed18d9ece474 Thierry Reding      2022-11-22   121  					nvidia,pins = "pex_l5_clkreq_n_pgg0";
79ed18d9ece474 Thierry Reding      2022-11-22   122  					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
79ed18d9ece474 Thierry Reding      2022-11-22   123  					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
79ed18d9ece474 Thierry Reding      2022-11-22   124  					nvidia,io-hv = <TEGRA_PIN_ENABLE>;
79ed18d9ece474 Thierry Reding      2022-11-22   125  					nvidia,tristate = <TEGRA_PIN_DISABLE>;
79ed18d9ece474 Thierry Reding      2022-11-22   126  					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
79ed18d9ece474 Thierry Reding      2022-11-22   127  				};
79ed18d9ece474 Thierry Reding      2022-11-22   128  			};
79ed18d9ece474 Thierry Reding      2022-11-22   129  
79ed18d9ece474 Thierry Reding      2022-11-22   130  			pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
79ed18d9ece474 Thierry Reding      2022-11-22   131  				pex_rst {
79ed18d9ece474 Thierry Reding      2022-11-22   132  					nvidia,pins = "pex_l5_rst_n_pgg1";
79ed18d9ece474 Thierry Reding      2022-11-22   133  					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
79ed18d9ece474 Thierry Reding      2022-11-22   134  					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
79ed18d9ece474 Thierry Reding      2022-11-22   135  					nvidia,io-hv = <TEGRA_PIN_ENABLE>;
79ed18d9ece474 Thierry Reding      2022-11-22   136  					nvidia,tristate = <TEGRA_PIN_DISABLE>;
79ed18d9ece474 Thierry Reding      2022-11-22   137  					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
79ed18d9ece474 Thierry Reding      2022-11-22   138  				};
79ed18d9ece474 Thierry Reding      2022-11-22   139  			};
79ed18d9ece474 Thierry Reding      2022-11-22   140  		};
79ed18d9ece474 Thierry Reding      2022-11-22   141  
f89b58ce71a949 Mikko Perttunen     2018-06-20   142  		ethernet@2490000 {
19dc772a94bc92 Thierry Reding      2019-09-25   143  			compatible = "nvidia,tegra194-eqos",
19dc772a94bc92 Thierry Reding      2019-09-25   144  				     "nvidia,tegra186-eqos",
f89b58ce71a949 Mikko Perttunen     2018-06-20   145  				     "snps,dwc-qos-ethernet-4.10";
2838cfddbc1c4e Thierry Reding      2022-11-17   146  			reg = <0x0 0x02490000 0x0 0x10000>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   147  			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   148  			clocks = <&bpmp TEGRA194_CLK_AXI_CBB>,
f89b58ce71a949 Mikko Perttunen     2018-06-20   149  				 <&bpmp TEGRA194_CLK_EQOS_AXI>,
f89b58ce71a949 Mikko Perttunen     2018-06-20   150  				 <&bpmp TEGRA194_CLK_EQOS_RX>,
f89b58ce71a949 Mikko Perttunen     2018-06-20   151  				 <&bpmp TEGRA194_CLK_EQOS_TX>,
f89b58ce71a949 Mikko Perttunen     2018-06-20   152  				 <&bpmp TEGRA194_CLK_EQOS_PTP_REF>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   153  			clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
f89b58ce71a949 Mikko Perttunen     2018-06-20   154  			resets = <&bpmp TEGRA194_RESET_EQOS>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   155  			reset-names = "eqos";
d5237c7c9bbee0 Thierry Reding      2019-12-13   156  			interconnects = <&mc TEGRA194_MEMORY_CLIENT_EQOSR &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13   157  					<&mc TEGRA194_MEMORY_CLIENT_EQOSW &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13   158  			interconnect-names = "dma-mem", "write";
c7289b1c8a4e10 Thierry Reding      2021-06-03   159  			iommus = <&smmu TEGRA194_SID_EQOS>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   160  			status = "disabled";
f89b58ce71a949 Mikko Perttunen     2018-06-20   161  
f89b58ce71a949 Mikko Perttunen     2018-06-20   162  			snps,write-requests = <1>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   163  			snps,read-requests = <3>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   164  			snps,burst-map = <0x7>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   165  			snps,txpbl = <16>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   166  			snps,rxpbl = <8>;
f89b58ce71a949 Mikko Perttunen     2018-06-20   167  		};
f89b58ce71a949 Mikko Perttunen     2018-06-20   168  
835553b3c64e24 Akhil R             2022-02-07   169  		gpcdma: dma-controller@2600000 {
835553b3c64e24 Akhil R             2022-02-07   170  			compatible = "nvidia,tegra194-gpcdma",
835553b3c64e24 Akhil R             2022-02-07   171  				     "nvidia,tegra186-gpcdma";
2838cfddbc1c4e Thierry Reding      2022-11-17   172  			reg = <0x0 0x2600000 0x0 0x210000>;
835553b3c64e24 Akhil R             2022-02-07   173  			resets = <&bpmp TEGRA194_RESET_GPCDMA>;
835553b3c64e24 Akhil R             2022-02-07   174  			reset-names = "gpcdma";
dd0be8278ab967 Akhil R             2022-11-10   175  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
dd0be8278ab967 Akhil R             2022-11-10   176  				     <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   177  				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   178  				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   179  				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   180  				     <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   181  				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   182  				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   183  				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   184  				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   185  				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   186  				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   187  				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   188  				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   189  				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   190  				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   191  				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   192  				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   193  				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   194  				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   195  				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   196  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   197  				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   198  				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   199  				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   200  				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   201  				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   202  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   203  				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   204  				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   205  				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
835553b3c64e24 Akhil R             2022-02-07   206  				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
835553b3c64e24 Akhil R             2022-02-07   207  			#dma-cells = <1>;
835553b3c64e24 Akhil R             2022-02-07   208  			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
835553b3c64e24 Akhil R             2022-02-07   209  			dma-coherent;
dd0be8278ab967 Akhil R             2022-11-10   210  			dma-channel-mask = <0xfffffffe>;
835553b3c64e24 Akhil R             2022-02-07   211  			status = "okay";
835553b3c64e24 Akhil R             2022-02-07   212  		};
835553b3c64e24 Akhil R             2022-02-07   213  
1aaa7698670cb9 Thierry Reding      2019-07-26   214  		aconnect@2900000 {
5d2249dda08e81 Sameer Pujar        2019-06-19   215  			compatible = "nvidia,tegra194-aconnect",
5d2249dda08e81 Sameer Pujar        2019-06-19   216  				     "nvidia,tegra210-aconnect";
5d2249dda08e81 Sameer Pujar        2019-06-19   217  			clocks = <&bpmp TEGRA194_CLK_APE>,
5d2249dda08e81 Sameer Pujar        2019-06-19   218  				 <&bpmp TEGRA194_CLK_APB2APE>;
5d2249dda08e81 Sameer Pujar        2019-06-19   219  			clock-names = "ape", "apb2ape";
5d2249dda08e81 Sameer Pujar        2019-06-19   220  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_AUD>;
5d2249dda08e81 Sameer Pujar        2019-06-19   221  			status = "disabled";
5d2249dda08e81 Sameer Pujar        2019-06-19   222  
2838cfddbc1c4e Thierry Reding      2022-11-17   223  			#address-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17   224  			#size-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17   225  			ranges = <0x0 0x02900000 0x0 0x02900000 0x0 0x200000>;
2838cfddbc1c4e Thierry Reding      2022-11-17   226  
177208f7b06d16 Sameer Pujar        2020-07-19   227  			tegra_ahub: ahub@2900800 {
177208f7b06d16 Sameer Pujar        2020-07-19   228  				compatible = "nvidia,tegra194-ahub",
177208f7b06d16 Sameer Pujar        2020-07-19   229  					     "nvidia,tegra186-ahub";
2838cfddbc1c4e Thierry Reding      2022-11-17   230  				reg = <0x0 0x02900800 0x0 0x800>;
177208f7b06d16 Sameer Pujar        2020-07-19   231  				clocks = <&bpmp TEGRA194_CLK_AHUB>;
177208f7b06d16 Sameer Pujar        2020-07-19   232  				clock-names = "ahub";
177208f7b06d16 Sameer Pujar        2020-07-19   233  				assigned-clocks = <&bpmp TEGRA194_CLK_AHUB>;
dc6d5d85ed3a3f Sameer Pujar        2023-06-29   234  				assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLP_OUT0>;
dc6d5d85ed3a3f Sameer Pujar        2023-06-29   235  				assigned-clock-rates = <81600000>;
177208f7b06d16 Sameer Pujar        2020-07-19   236  				status = "disabled";
177208f7b06d16 Sameer Pujar        2020-07-19   237  
2838cfddbc1c4e Thierry Reding      2022-11-17   238  				#address-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17   239  				#size-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17   240  				ranges = <0x0 0x02900800 0x0 0x02900800 0x0 0x11800>;
2838cfddbc1c4e Thierry Reding      2022-11-17   241  
177208f7b06d16 Sameer Pujar        2020-07-19   242  				tegra_i2s1: i2s@2901000 {
177208f7b06d16 Sameer Pujar        2020-07-19   243  					compatible = "nvidia,tegra194-i2s",
177208f7b06d16 Sameer Pujar        2020-07-19   244  						     "nvidia,tegra210-i2s";
2838cfddbc1c4e Thierry Reding      2022-11-17   245  					reg = <0x0 0x2901000 0x0 0x100>;
177208f7b06d16 Sameer Pujar        2020-07-19   246  					clocks = <&bpmp TEGRA194_CLK_I2S1>,
177208f7b06d16 Sameer Pujar        2020-07-19   247  						 <&bpmp TEGRA194_CLK_I2S1_SYNC_INPUT>;
177208f7b06d16 Sameer Pujar        2020-07-19   248  					clock-names = "i2s", "sync_input";
177208f7b06d16 Sameer Pujar        2020-07-19   249  					assigned-clocks = <&bpmp TEGRA194_CLK_I2S1>;
177208f7b06d16 Sameer Pujar        2020-07-19   250  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
177208f7b06d16 Sameer Pujar        2020-07-19   251  					assigned-clock-rates = <1536000>;
177208f7b06d16 Sameer Pujar        2020-07-19   252  					sound-name-prefix = "I2S1";
177208f7b06d16 Sameer Pujar        2020-07-19   253  					status = "disabled";
177208f7b06d16 Sameer Pujar        2020-07-19   254  				};
177208f7b06d16 Sameer Pujar        2020-07-19   255  
177208f7b06d16 Sameer Pujar        2020-07-19   256  				tegra_i2s2: i2s@2901100 {
177208f7b06d16 Sameer Pujar        2020-07-19   257  					compatible = "nvidia,tegra194-i2s",
177208f7b06d16 Sameer Pujar        2020-07-19   258  						     "nvidia,tegra210-i2s";
2838cfddbc1c4e Thierry Reding      2022-11-17   259  					reg = <0x0 0x2901100 0x0 0x100>;
177208f7b06d16 Sameer Pujar        2020-07-19   260  					clocks = <&bpmp TEGRA194_CLK_I2S2>,
177208f7b06d16 Sameer Pujar        2020-07-19   261  						 <&bpmp TEGRA194_CLK_I2S2_SYNC_INPUT>;
177208f7b06d16 Sameer Pujar        2020-07-19   262  					clock-names = "i2s", "sync_input";
177208f7b06d16 Sameer Pujar        2020-07-19   263  					assigned-clocks = <&bpmp TEGRA194_CLK_I2S2>;
177208f7b06d16 Sameer Pujar        2020-07-19   264  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
177208f7b06d16 Sameer Pujar        2020-07-19   265  					assigned-clock-rates = <1536000>;
177208f7b06d16 Sameer Pujar        2020-07-19   266  					sound-name-prefix = "I2S2";
177208f7b06d16 Sameer Pujar        2020-07-19   267  					status = "disabled";
177208f7b06d16 Sameer Pujar        2020-07-19   268  				};
177208f7b06d16 Sameer Pujar        2020-07-19   269  
177208f7b06d16 Sameer Pujar        2020-07-19   270  				tegra_i2s3: i2s@2901200 {
177208f7b06d16 Sameer Pujar        2020-07-19   271  					compatible = "nvidia,tegra194-i2s",
177208f7b06d16 Sameer Pujar        2020-07-19   272  						     "nvidia,tegra210-i2s";
2838cfddbc1c4e Thierry Reding      2022-11-17   273  					reg = <0x0 0x2901200 0x0 0x100>;
177208f7b06d16 Sameer Pujar        2020-07-19   274  					clocks = <&bpmp TEGRA194_CLK_I2S3>,
177208f7b06d16 Sameer Pujar        2020-07-19   275  						 <&bpmp TEGRA194_CLK_I2S3_SYNC_INPUT>;
177208f7b06d16 Sameer Pujar        2020-07-19   276  					clock-names = "i2s", "sync_input";
177208f7b06d16 Sameer Pujar        2020-07-19   277  					assigned-clocks = <&bpmp TEGRA194_CLK_I2S3>;
177208f7b06d16 Sameer Pujar        2020-07-19   278  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
177208f7b06d16 Sameer Pujar        2020-07-19   279  					assigned-clock-rates = <1536000>;
177208f7b06d16 Sameer Pujar        2020-07-19   280  					sound-name-prefix = "I2S3";
177208f7b06d16 Sameer Pujar        2020-07-19   281  					status = "disabled";
177208f7b06d16 Sameer Pujar        2020-07-19   282  				};
177208f7b06d16 Sameer Pujar        2020-07-19   283  
177208f7b06d16 Sameer Pujar        2020-07-19   284  				tegra_i2s4: i2s@2901300 {
177208f7b06d16 Sameer Pujar        2020-07-19   285  					compatible = "nvidia,tegra194-i2s",
177208f7b06d16 Sameer Pujar        2020-07-19   286  						     "nvidia,tegra210-i2s";
2838cfddbc1c4e Thierry Reding      2022-11-17   287  					reg = <0x0 0x2901300 0x0 0x100>;
177208f7b06d16 Sameer Pujar        2020-07-19   288  					clocks = <&bpmp TEGRA194_CLK_I2S4>,
177208f7b06d16 Sameer Pujar        2020-07-19   289  						 <&bpmp TEGRA194_CLK_I2S4_SYNC_INPUT>;
177208f7b06d16 Sameer Pujar        2020-07-19   290  					clock-names = "i2s", "sync_input";
177208f7b06d16 Sameer Pujar        2020-07-19   291  					assigned-clocks = <&bpmp TEGRA194_CLK_I2S4>;
177208f7b06d16 Sameer Pujar        2020-07-19   292  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
177208f7b06d16 Sameer Pujar        2020-07-19   293  					assigned-clock-rates = <1536000>;
177208f7b06d16 Sameer Pujar        2020-07-19   294  					sound-name-prefix = "I2S4";
177208f7b06d16 Sameer Pujar        2020-07-19   295  					status = "disabled";
177208f7b06d16 Sameer Pujar        2020-07-19   296  				};
177208f7b06d16 Sameer Pujar        2020-07-19   297  
177208f7b06d16 Sameer Pujar        2020-07-19   298  				tegra_i2s5: i2s@2901400 {
177208f7b06d16 Sameer Pujar        2020-07-19   299  					compatible = "nvidia,tegra194-i2s",
177208f7b06d16 Sameer Pujar        2020-07-19   300  						     "nvidia,tegra210-i2s";
2838cfddbc1c4e Thierry Reding      2022-11-17   301  					reg = <0x0 0x2901400 0x0 0x100>;
177208f7b06d16 Sameer Pujar        2020-07-19   302  					clocks = <&bpmp TEGRA194_CLK_I2S5>,
177208f7b06d16 Sameer Pujar        2020-07-19   303  						 <&bpmp TEGRA194_CLK_I2S5_SYNC_INPUT>;
177208f7b06d16 Sameer Pujar        2020-07-19   304  					clock-names = "i2s", "sync_input";
177208f7b06d16 Sameer Pujar        2020-07-19   305  					assigned-clocks = <&bpmp TEGRA194_CLK_I2S5>;
177208f7b06d16 Sameer Pujar        2020-07-19   306  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
177208f7b06d16 Sameer Pujar        2020-07-19   307  					assigned-clock-rates = <1536000>;
177208f7b06d16 Sameer Pujar        2020-07-19   308  					sound-name-prefix = "I2S5";
177208f7b06d16 Sameer Pujar        2020-07-19   309  					status = "disabled";
177208f7b06d16 Sameer Pujar        2020-07-19   310  				};
177208f7b06d16 Sameer Pujar        2020-07-19   311  
177208f7b06d16 Sameer Pujar        2020-07-19   312  				tegra_i2s6: i2s@2901500 {
177208f7b06d16 Sameer Pujar        2020-07-19   313  					compatible = "nvidia,tegra194-i2s",
177208f7b06d16 Sameer Pujar        2020-07-19   314  						     "nvidia,tegra210-i2s";
2838cfddbc1c4e Thierry Reding      2022-11-17   315  					reg = <0x0 0x2901500 0x0 0x100>;
177208f7b06d16 Sameer Pujar        2020-07-19   316  					clocks = <&bpmp TEGRA194_CLK_I2S6>,
177208f7b06d16 Sameer Pujar        2020-07-19   317  						 <&bpmp TEGRA194_CLK_I2S6_SYNC_INPUT>;
177208f7b06d16 Sameer Pujar        2020-07-19   318  					clock-names = "i2s", "sync_input";
177208f7b06d16 Sameer Pujar        2020-07-19   319  					assigned-clocks = <&bpmp TEGRA194_CLK_I2S6>;
177208f7b06d16 Sameer Pujar        2020-07-19   320  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
177208f7b06d16 Sameer Pujar        2020-07-19   321  					assigned-clock-rates = <1536000>;
177208f7b06d16 Sameer Pujar        2020-07-19   322  					sound-name-prefix = "I2S6";
177208f7b06d16 Sameer Pujar        2020-07-19   323  					status = "disabled";
177208f7b06d16 Sameer Pujar        2020-07-19   324  				};
177208f7b06d16 Sameer Pujar        2020-07-19   325  
848f3290ab75d1 Sameer Pujar        2021-09-13   326  				tegra_sfc1: sfc@2902000 {
848f3290ab75d1 Sameer Pujar        2021-09-13   327  					compatible = "nvidia,tegra194-sfc",
848f3290ab75d1 Sameer Pujar        2021-09-13   328  						     "nvidia,tegra210-sfc";
2838cfddbc1c4e Thierry Reding      2022-11-17   329  					reg = <0x0 0x2902000 0x0 0x200>;
848f3290ab75d1 Sameer Pujar        2021-09-13   330  					sound-name-prefix = "SFC1";
848f3290ab75d1 Sameer Pujar        2021-09-13   331  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   332  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   333  
848f3290ab75d1 Sameer Pujar        2021-09-13   334  				tegra_sfc2: sfc@2902200 {
848f3290ab75d1 Sameer Pujar        2021-09-13   335  					compatible = "nvidia,tegra194-sfc",
848f3290ab75d1 Sameer Pujar        2021-09-13   336  						     "nvidia,tegra210-sfc";
2838cfddbc1c4e Thierry Reding      2022-11-17   337  					reg = <0x0 0x2902200 0x0 0x200>;
848f3290ab75d1 Sameer Pujar        2021-09-13   338  					sound-name-prefix = "SFC2";
848f3290ab75d1 Sameer Pujar        2021-09-13   339  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   340  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   341  
848f3290ab75d1 Sameer Pujar        2021-09-13   342  				tegra_sfc3: sfc@2902400 {
848f3290ab75d1 Sameer Pujar        2021-09-13   343  					compatible = "nvidia,tegra194-sfc",
848f3290ab75d1 Sameer Pujar        2021-09-13   344  						     "nvidia,tegra210-sfc";
2838cfddbc1c4e Thierry Reding      2022-11-17   345  					reg = <0x0 0x2902400 0x0 0x200>;
848f3290ab75d1 Sameer Pujar        2021-09-13   346  					sound-name-prefix = "SFC3";
848f3290ab75d1 Sameer Pujar        2021-09-13   347  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   348  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   349  
848f3290ab75d1 Sameer Pujar        2021-09-13   350  				tegra_sfc4: sfc@2902600 {
848f3290ab75d1 Sameer Pujar        2021-09-13   351  					compatible = "nvidia,tegra194-sfc",
848f3290ab75d1 Sameer Pujar        2021-09-13   352  						     "nvidia,tegra210-sfc";
2838cfddbc1c4e Thierry Reding      2022-11-17   353  					reg = <0x0 0x2902600 0x0 0x200>;
848f3290ab75d1 Sameer Pujar        2021-09-13   354  					sound-name-prefix = "SFC4";
848f3290ab75d1 Sameer Pujar        2021-09-13   355  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   356  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   357  
848f3290ab75d1 Sameer Pujar        2021-09-13   358  				tegra_amx1: amx@2903000 {
848f3290ab75d1 Sameer Pujar        2021-09-13   359  					compatible = "nvidia,tegra194-amx";
2838cfddbc1c4e Thierry Reding      2022-11-17   360  					reg = <0x0 0x2903000 0x0 0x100>;
848f3290ab75d1 Sameer Pujar        2021-09-13   361  					sound-name-prefix = "AMX1";
848f3290ab75d1 Sameer Pujar        2021-09-13   362  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   363  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   364  
848f3290ab75d1 Sameer Pujar        2021-09-13   365  				tegra_amx2: amx@2903100 {
848f3290ab75d1 Sameer Pujar        2021-09-13   366  					compatible = "nvidia,tegra194-amx";
2838cfddbc1c4e Thierry Reding      2022-11-17   367  					reg = <0x0 0x2903100 0x0 0x100>;
848f3290ab75d1 Sameer Pujar        2021-09-13   368  					sound-name-prefix = "AMX2";
848f3290ab75d1 Sameer Pujar        2021-09-13   369  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   370  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   371  
848f3290ab75d1 Sameer Pujar        2021-09-13   372  				tegra_amx3: amx@2903200 {
848f3290ab75d1 Sameer Pujar        2021-09-13   373  					compatible = "nvidia,tegra194-amx";
2838cfddbc1c4e Thierry Reding      2022-11-17   374  					reg = <0x0 0x2903200 0x0 0x100>;
848f3290ab75d1 Sameer Pujar        2021-09-13   375  					sound-name-prefix = "AMX3";
848f3290ab75d1 Sameer Pujar        2021-09-13   376  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   377  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   378  
848f3290ab75d1 Sameer Pujar        2021-09-13   379  				tegra_amx4: amx@2903300 {
848f3290ab75d1 Sameer Pujar        2021-09-13   380  					compatible = "nvidia,tegra194-amx";
2838cfddbc1c4e Thierry Reding      2022-11-17   381  					reg = <0x0 0x2903300 0x0 0x100>;
848f3290ab75d1 Sameer Pujar        2021-09-13   382  					sound-name-prefix = "AMX4";
848f3290ab75d1 Sameer Pujar        2021-09-13   383  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   384  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   385  
848f3290ab75d1 Sameer Pujar        2021-09-13   386  				tegra_adx1: adx@2903800 {
848f3290ab75d1 Sameer Pujar        2021-09-13   387  					compatible = "nvidia,tegra194-adx",
848f3290ab75d1 Sameer Pujar        2021-09-13   388  						     "nvidia,tegra210-adx";
2838cfddbc1c4e Thierry Reding      2022-11-17   389  					reg = <0x0 0x2903800 0x0 0x100>;
848f3290ab75d1 Sameer Pujar        2021-09-13   390  					sound-name-prefix = "ADX1";
848f3290ab75d1 Sameer Pujar        2021-09-13   391  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   392  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   393  
848f3290ab75d1 Sameer Pujar        2021-09-13   394  				tegra_adx2: adx@2903900 {
848f3290ab75d1 Sameer Pujar        2021-09-13   395  					compatible = "nvidia,tegra194-adx",
848f3290ab75d1 Sameer Pujar        2021-09-13   396  						     "nvidia,tegra210-adx";
2838cfddbc1c4e Thierry Reding      2022-11-17   397  					reg = <0x0 0x2903900 0x0 0x100>;
848f3290ab75d1 Sameer Pujar        2021-09-13   398  					sound-name-prefix = "ADX2";
848f3290ab75d1 Sameer Pujar        2021-09-13   399  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   400  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   401  
848f3290ab75d1 Sameer Pujar        2021-09-13   402  				tegra_adx3: adx@2903a00 {
848f3290ab75d1 Sameer Pujar        2021-09-13   403  					compatible = "nvidia,tegra194-adx",
848f3290ab75d1 Sameer Pujar        2021-09-13   404  						     "nvidia,tegra210-adx";
2838cfddbc1c4e Thierry Reding      2022-11-17   405  					reg = <0x0 0x2903a00 0x0 0x100>;
848f3290ab75d1 Sameer Pujar        2021-09-13   406  					sound-name-prefix = "ADX3";
848f3290ab75d1 Sameer Pujar        2021-09-13   407  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   408  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   409  
848f3290ab75d1 Sameer Pujar        2021-09-13   410  				tegra_adx4: adx@2903b00 {
848f3290ab75d1 Sameer Pujar        2021-09-13   411  					compatible = "nvidia,tegra194-adx",
848f3290ab75d1 Sameer Pujar        2021-09-13   412  						     "nvidia,tegra210-adx";
2838cfddbc1c4e Thierry Reding      2022-11-17   413  					reg = <0x0 0x2903b00 0x0 0x100>;
848f3290ab75d1 Sameer Pujar        2021-09-13   414  					sound-name-prefix = "ADX4";
848f3290ab75d1 Sameer Pujar        2021-09-13   415  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   416  				};
848f3290ab75d1 Sameer Pujar        2021-09-13   417  
79ed18d9ece474 Thierry Reding      2022-11-22   418  				tegra_dmic1: dmic@2904000 {
79ed18d9ece474 Thierry Reding      2022-11-22   419  					compatible = "nvidia,tegra194-dmic",
79ed18d9ece474 Thierry Reding      2022-11-22   420  						     "nvidia,tegra210-dmic";
79ed18d9ece474 Thierry Reding      2022-11-22   421  					reg = <0x0 0x2904000 0x0 0x100>;
79ed18d9ece474 Thierry Reding      2022-11-22   422  					clocks = <&bpmp TEGRA194_CLK_DMIC1>;
79ed18d9ece474 Thierry Reding      2022-11-22   423  					clock-names = "dmic";
79ed18d9ece474 Thierry Reding      2022-11-22   424  					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC1>;
79ed18d9ece474 Thierry Reding      2022-11-22   425  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
79ed18d9ece474 Thierry Reding      2022-11-22   426  					assigned-clock-rates = <3072000>;
79ed18d9ece474 Thierry Reding      2022-11-22   427  					sound-name-prefix = "DMIC1";
79ed18d9ece474 Thierry Reding      2022-11-22   428  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   429  				};
79ed18d9ece474 Thierry Reding      2022-11-22   430  
79ed18d9ece474 Thierry Reding      2022-11-22   431  				tegra_dmic2: dmic@2904100 {
79ed18d9ece474 Thierry Reding      2022-11-22   432  					compatible = "nvidia,tegra194-dmic",
79ed18d9ece474 Thierry Reding      2022-11-22   433  						     "nvidia,tegra210-dmic";
79ed18d9ece474 Thierry Reding      2022-11-22   434  					reg = <0x0 0x2904100 0x0 0x100>;
79ed18d9ece474 Thierry Reding      2022-11-22   435  					clocks = <&bpmp TEGRA194_CLK_DMIC2>;
79ed18d9ece474 Thierry Reding      2022-11-22   436  					clock-names = "dmic";
79ed18d9ece474 Thierry Reding      2022-11-22   437  					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC2>;
79ed18d9ece474 Thierry Reding      2022-11-22   438  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
79ed18d9ece474 Thierry Reding      2022-11-22   439  					assigned-clock-rates = <3072000>;
79ed18d9ece474 Thierry Reding      2022-11-22   440  					sound-name-prefix = "DMIC2";
79ed18d9ece474 Thierry Reding      2022-11-22   441  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   442  				};
79ed18d9ece474 Thierry Reding      2022-11-22   443  
79ed18d9ece474 Thierry Reding      2022-11-22   444  				tegra_dmic3: dmic@2904200 {
79ed18d9ece474 Thierry Reding      2022-11-22   445  					compatible = "nvidia,tegra194-dmic",
79ed18d9ece474 Thierry Reding      2022-11-22   446  						     "nvidia,tegra210-dmic";
79ed18d9ece474 Thierry Reding      2022-11-22   447  					reg = <0x0 0x2904200 0x0 0x100>;
79ed18d9ece474 Thierry Reding      2022-11-22   448  					clocks = <&bpmp TEGRA194_CLK_DMIC3>;
79ed18d9ece474 Thierry Reding      2022-11-22   449  					clock-names = "dmic";
79ed18d9ece474 Thierry Reding      2022-11-22   450  					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC3>;
79ed18d9ece474 Thierry Reding      2022-11-22   451  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
79ed18d9ece474 Thierry Reding      2022-11-22   452  					assigned-clock-rates = <3072000>;
79ed18d9ece474 Thierry Reding      2022-11-22   453  					sound-name-prefix = "DMIC3";
79ed18d9ece474 Thierry Reding      2022-11-22   454  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   455  				};
79ed18d9ece474 Thierry Reding      2022-11-22   456  
79ed18d9ece474 Thierry Reding      2022-11-22   457  				tegra_dmic4: dmic@2904300 {
79ed18d9ece474 Thierry Reding      2022-11-22   458  					compatible = "nvidia,tegra194-dmic",
79ed18d9ece474 Thierry Reding      2022-11-22   459  						     "nvidia,tegra210-dmic";
79ed18d9ece474 Thierry Reding      2022-11-22   460  					reg = <0x0 0x2904300 0x0 0x100>;
79ed18d9ece474 Thierry Reding      2022-11-22   461  					clocks = <&bpmp TEGRA194_CLK_DMIC4>;
79ed18d9ece474 Thierry Reding      2022-11-22   462  					clock-names = "dmic";
79ed18d9ece474 Thierry Reding      2022-11-22   463  					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC4>;
79ed18d9ece474 Thierry Reding      2022-11-22   464  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
79ed18d9ece474 Thierry Reding      2022-11-22   465  					assigned-clock-rates = <3072000>;
79ed18d9ece474 Thierry Reding      2022-11-22   466  					sound-name-prefix = "DMIC4";
79ed18d9ece474 Thierry Reding      2022-11-22   467  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   468  				};
79ed18d9ece474 Thierry Reding      2022-11-22   469  
79ed18d9ece474 Thierry Reding      2022-11-22   470  				tegra_dspk1: dspk@2905000 {
79ed18d9ece474 Thierry Reding      2022-11-22   471  					compatible = "nvidia,tegra194-dspk",
79ed18d9ece474 Thierry Reding      2022-11-22   472  						     "nvidia,tegra186-dspk";
79ed18d9ece474 Thierry Reding      2022-11-22   473  					reg = <0x0 0x2905000 0x0 0x100>;
79ed18d9ece474 Thierry Reding      2022-11-22   474  					clocks = <&bpmp TEGRA194_CLK_DSPK1>;
79ed18d9ece474 Thierry Reding      2022-11-22   475  					clock-names = "dspk";
79ed18d9ece474 Thierry Reding      2022-11-22   476  					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK1>;
79ed18d9ece474 Thierry Reding      2022-11-22   477  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
79ed18d9ece474 Thierry Reding      2022-11-22   478  					assigned-clock-rates = <12288000>;
79ed18d9ece474 Thierry Reding      2022-11-22   479  					sound-name-prefix = "DSPK1";
79ed18d9ece474 Thierry Reding      2022-11-22   480  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   481  				};
79ed18d9ece474 Thierry Reding      2022-11-22   482  
79ed18d9ece474 Thierry Reding      2022-11-22   483  				tegra_dspk2: dspk@2905100 {
79ed18d9ece474 Thierry Reding      2022-11-22   484  					compatible = "nvidia,tegra194-dspk",
79ed18d9ece474 Thierry Reding      2022-11-22   485  						     "nvidia,tegra186-dspk";
79ed18d9ece474 Thierry Reding      2022-11-22   486  					reg = <0x0 0x2905100 0x0 0x100>;
79ed18d9ece474 Thierry Reding      2022-11-22   487  					clocks = <&bpmp TEGRA194_CLK_DSPK2>;
79ed18d9ece474 Thierry Reding      2022-11-22   488  					clock-names = "dspk";
79ed18d9ece474 Thierry Reding      2022-11-22   489  					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK2>;
79ed18d9ece474 Thierry Reding      2022-11-22   490  					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
79ed18d9ece474 Thierry Reding      2022-11-22   491  					assigned-clock-rates = <12288000>;
79ed18d9ece474 Thierry Reding      2022-11-22   492  					sound-name-prefix = "DSPK2";
79ed18d9ece474 Thierry Reding      2022-11-22   493  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   494  				};
79ed18d9ece474 Thierry Reding      2022-11-22   495  
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   496  				tegra_ope1: processing-engine@2908000 {
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   497  					compatible = "nvidia,tegra194-ope",
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   498  						     "nvidia,tegra210-ope";
2838cfddbc1c4e Thierry Reding      2022-11-17   499  					reg = <0x0 0x2908000 0x0 0x100>;
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   500  					sound-name-prefix = "OPE1";
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   501  					status = "disabled";
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   502  
2838cfddbc1c4e Thierry Reding      2022-11-17   503  					#address-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17   504  					#size-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17   505  					ranges;
2838cfddbc1c4e Thierry Reding      2022-11-17   506  
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   507  					equalizer@2908100 {
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   508  						compatible = "nvidia,tegra194-peq",
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   509  							     "nvidia,tegra210-peq";
2838cfddbc1c4e Thierry Reding      2022-11-17   510  						reg = <0x0 0x2908100 0x0 0x100>;
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   511  					};
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   512  
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   513  					dynamic-range-compressor@2908200 {
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   514  						compatible = "nvidia,tegra194-mbdrc",
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   515  							     "nvidia,tegra210-mbdrc";
2838cfddbc1c4e Thierry Reding      2022-11-17   516  						reg = <0x0 0x2908200 0x0 0x200>;
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   517  					};
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   518  				};
4b6a1b7cbdf5fd Sameer Pujar        2022-06-06   519  
79ed18d9ece474 Thierry Reding      2022-11-22   520  				tegra_mvc1: mvc@290a000 {
79ed18d9ece474 Thierry Reding      2022-11-22   521  					compatible = "nvidia,tegra194-mvc",
79ed18d9ece474 Thierry Reding      2022-11-22   522  						     "nvidia,tegra210-mvc";
79ed18d9ece474 Thierry Reding      2022-11-22   523  					reg = <0x0 0x290a000 0x0 0x200>;
79ed18d9ece474 Thierry Reding      2022-11-22   524  					sound-name-prefix = "MVC1";
79ed18d9ece474 Thierry Reding      2022-11-22   525  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   526  				};
79ed18d9ece474 Thierry Reding      2022-11-22   527  
79ed18d9ece474 Thierry Reding      2022-11-22   528  				tegra_mvc2: mvc@290a200 {
79ed18d9ece474 Thierry Reding      2022-11-22   529  					compatible = "nvidia,tegra194-mvc",
79ed18d9ece474 Thierry Reding      2022-11-22   530  						     "nvidia,tegra210-mvc";
79ed18d9ece474 Thierry Reding      2022-11-22   531  					reg = <0x0 0x290a200 0x0 0x200>;
79ed18d9ece474 Thierry Reding      2022-11-22   532  					sound-name-prefix = "MVC2";
79ed18d9ece474 Thierry Reding      2022-11-22   533  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   534  				};
79ed18d9ece474 Thierry Reding      2022-11-22   535  
848f3290ab75d1 Sameer Pujar        2021-09-13   536  				tegra_amixer: amixer@290bb00 {
848f3290ab75d1 Sameer Pujar        2021-09-13   537  					compatible = "nvidia,tegra194-amixer",
848f3290ab75d1 Sameer Pujar        2021-09-13   538  						     "nvidia,tegra210-amixer";
2838cfddbc1c4e Thierry Reding      2022-11-17   539  					reg = <0x0 0x290bb00 0x0 0x800>;
848f3290ab75d1 Sameer Pujar        2021-09-13   540  					sound-name-prefix = "MIXER1";
848f3290ab75d1 Sameer Pujar        2021-09-13   541  					status = "disabled";
848f3290ab75d1 Sameer Pujar        2021-09-13   542  				};
47a08153f32dc7 Sameer Pujar        2022-03-31   543  
79ed18d9ece474 Thierry Reding      2022-11-22   544  				tegra_admaif: admaif@290f000 {
79ed18d9ece474 Thierry Reding      2022-11-22   545  					compatible = "nvidia,tegra194-admaif",
79ed18d9ece474 Thierry Reding      2022-11-22   546  						     "nvidia,tegra186-admaif";
79ed18d9ece474 Thierry Reding      2022-11-22   547  					reg = <0x0 0x0290f000 0x0 0x1000>;
79ed18d9ece474 Thierry Reding      2022-11-22   548  					dmas = <&adma 1>, <&adma 1>,
79ed18d9ece474 Thierry Reding      2022-11-22   549  					       <&adma 2>, <&adma 2>,
79ed18d9ece474 Thierry Reding      2022-11-22   550  					       <&adma 3>, <&adma 3>,
79ed18d9ece474 Thierry Reding      2022-11-22   551  					       <&adma 4>, <&adma 4>,
79ed18d9ece474 Thierry Reding      2022-11-22   552  					       <&adma 5>, <&adma 5>,
79ed18d9ece474 Thierry Reding      2022-11-22   553  					       <&adma 6>, <&adma 6>,
79ed18d9ece474 Thierry Reding      2022-11-22   554  					       <&adma 7>, <&adma 7>,
79ed18d9ece474 Thierry Reding      2022-11-22   555  					       <&adma 8>, <&adma 8>,
79ed18d9ece474 Thierry Reding      2022-11-22   556  					       <&adma 9>, <&adma 9>,
79ed18d9ece474 Thierry Reding      2022-11-22   557  					       <&adma 10>, <&adma 10>,
79ed18d9ece474 Thierry Reding      2022-11-22   558  					       <&adma 11>, <&adma 11>,
79ed18d9ece474 Thierry Reding      2022-11-22   559  					       <&adma 12>, <&adma 12>,
79ed18d9ece474 Thierry Reding      2022-11-22   560  					       <&adma 13>, <&adma 13>,
79ed18d9ece474 Thierry Reding      2022-11-22   561  					       <&adma 14>, <&adma 14>,
79ed18d9ece474 Thierry Reding      2022-11-22   562  					       <&adma 15>, <&adma 15>,
79ed18d9ece474 Thierry Reding      2022-11-22   563  					       <&adma 16>, <&adma 16>,
79ed18d9ece474 Thierry Reding      2022-11-22   564  					       <&adma 17>, <&adma 17>,
79ed18d9ece474 Thierry Reding      2022-11-22   565  					       <&adma 18>, <&adma 18>,
79ed18d9ece474 Thierry Reding      2022-11-22   566  					       <&adma 19>, <&adma 19>,
79ed18d9ece474 Thierry Reding      2022-11-22   567  					       <&adma 20>, <&adma 20>;
79ed18d9ece474 Thierry Reding      2022-11-22   568  					dma-names = "rx1", "tx1",
79ed18d9ece474 Thierry Reding      2022-11-22   569  						    "rx2", "tx2",
79ed18d9ece474 Thierry Reding      2022-11-22   570  						    "rx3", "tx3",
79ed18d9ece474 Thierry Reding      2022-11-22   571  						    "rx4", "tx4",
79ed18d9ece474 Thierry Reding      2022-11-22   572  						    "rx5", "tx5",
79ed18d9ece474 Thierry Reding      2022-11-22   573  						    "rx6", "tx6",
79ed18d9ece474 Thierry Reding      2022-11-22   574  						    "rx7", "tx7",
79ed18d9ece474 Thierry Reding      2022-11-22   575  						    "rx8", "tx8",
79ed18d9ece474 Thierry Reding      2022-11-22   576  						    "rx9", "tx9",
79ed18d9ece474 Thierry Reding      2022-11-22   577  						    "rx10", "tx10",
79ed18d9ece474 Thierry Reding      2022-11-22   578  						    "rx11", "tx11",
79ed18d9ece474 Thierry Reding      2022-11-22   579  						    "rx12", "tx12",
79ed18d9ece474 Thierry Reding      2022-11-22   580  						    "rx13", "tx13",
79ed18d9ece474 Thierry Reding      2022-11-22   581  						    "rx14", "tx14",
79ed18d9ece474 Thierry Reding      2022-11-22   582  						    "rx15", "tx15",
79ed18d9ece474 Thierry Reding      2022-11-22   583  						    "rx16", "tx16",
79ed18d9ece474 Thierry Reding      2022-11-22   584  						    "rx17", "tx17",
79ed18d9ece474 Thierry Reding      2022-11-22   585  						    "rx18", "tx18",
79ed18d9ece474 Thierry Reding      2022-11-22   586  						    "rx19", "tx19",
79ed18d9ece474 Thierry Reding      2022-11-22   587  						    "rx20", "tx20";
79ed18d9ece474 Thierry Reding      2022-11-22   588  					status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22   589  					interconnects = <&mc TEGRA194_MEMORY_CLIENT_APEDMAR &emc>,
79ed18d9ece474 Thierry Reding      2022-11-22   590  							<&mc TEGRA194_MEMORY_CLIENT_APEDMAW &emc>;
79ed18d9ece474 Thierry Reding      2022-11-22   591  					interconnect-names = "dma-mem", "write";
79ed18d9ece474 Thierry Reding      2022-11-22   592  					iommus = <&smmu TEGRA194_SID_APE>;
79ed18d9ece474 Thierry Reding      2022-11-22   593  				};
79ed18d9ece474 Thierry Reding      2022-11-22   594  
47a08153f32dc7 Sameer Pujar        2022-03-31   595  				tegra_asrc: asrc@2910000 {
47a08153f32dc7 Sameer Pujar        2022-03-31   596  					compatible = "nvidia,tegra194-asrc",
47a08153f32dc7 Sameer Pujar        2022-03-31   597  						     "nvidia,tegra186-asrc";
2838cfddbc1c4e Thierry Reding      2022-11-17   598  					reg = <0x0 0x2910000 0x0 0x2000>;
47a08153f32dc7 Sameer Pujar        2022-03-31   599  					sound-name-prefix = "ASRC1";
47a08153f32dc7 Sameer Pujar        2022-03-31   600  					status = "disabled";
47a08153f32dc7 Sameer Pujar        2022-03-31   601  				};
177208f7b06d16 Sameer Pujar        2020-07-19   602  			};
dbb72e2c305b26 Vidya Sagar         2019-09-05   603  
79ed18d9ece474 Thierry Reding      2022-11-22   604  			adma: dma-controller@2930000 {
79ed18d9ece474 Thierry Reding      2022-11-22   605  				compatible = "nvidia,tegra194-adma",
79ed18d9ece474 Thierry Reding      2022-11-22   606  					     "nvidia,tegra186-adma";
79ed18d9ece474 Thierry Reding      2022-11-22   607  				reg = <0x0 0x02930000 0x0 0x20000>;
79ed18d9ece474 Thierry Reding      2022-11-22   608  				interrupt-parent = <&agic>;
79ed18d9ece474 Thierry Reding      2022-11-22   609  				interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   610  					      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   611  					      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   612  					      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   613  					      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   614  					      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   615  					      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   616  					      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   617  					      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   618  					      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   619  					      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   620  					      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   621  					      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   622  					      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   623  					      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   624  					      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   625  					      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   626  					      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   627  					      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   628  					      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   629  					      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   630  					      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   631  					      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   632  					      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   633  					      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   634  					      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   635  					      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   636  					      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   637  					      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   638  					      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   639  					      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
79ed18d9ece474 Thierry Reding      2022-11-22   640  					      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
79ed18d9ece474 Thierry Reding      2022-11-22   641  				#dma-cells = <1>;
79ed18d9ece474 Thierry Reding      2022-11-22   642  				clocks = <&bpmp TEGRA194_CLK_AHUB>;
79ed18d9ece474 Thierry Reding      2022-11-22   643  				clock-names = "d_audio";
79ed18d9ece474 Thierry Reding      2022-11-22   644  				status = "disabled";
dbb72e2c305b26 Vidya Sagar         2019-09-05   645  			};
dbb72e2c305b26 Vidya Sagar         2019-09-05   646  
79ed18d9ece474 Thierry Reding      2022-11-22   647  			agic: interrupt-controller@2a40000 {
79ed18d9ece474 Thierry Reding      2022-11-22   648  				compatible = "nvidia,tegra194-agic",
79ed18d9ece474 Thierry Reding      2022-11-22   649  					     "nvidia,tegra210-agic";
79ed18d9ece474 Thierry Reding      2022-11-22   650  				#interrupt-cells = <3>;
79ed18d9ece474 Thierry Reding      2022-11-22   651  				interrupt-controller;
79ed18d9ece474 Thierry Reding      2022-11-22   652  				reg = <0x0 0x02a41000 0x0 0x1000>,
79ed18d9ece474 Thierry Reding      2022-11-22   653  				      <0x0 0x02a42000 0x0 0x2000>;
79ed18d9ece474 Thierry Reding      2022-11-22   654  				interrupts = <GIC_SPI 145
79ed18d9ece474 Thierry Reding      2022-11-22   655  					      (GIC_CPU_MASK_SIMPLE(4) |
79ed18d9ece474 Thierry Reding      2022-11-22   656  					       IRQ_TYPE_LEVEL_HIGH)>;
79ed18d9ece474 Thierry Reding      2022-11-22   657  				clocks = <&bpmp TEGRA194_CLK_APE>;
79ed18d9ece474 Thierry Reding      2022-11-22   658  				clock-names = "clk";
79ed18d9ece474 Thierry Reding      2022-11-22   659  				status = "disabled";
dbb72e2c305b26 Vidya Sagar         2019-09-05   660  			};
dbb72e2c305b26 Vidya Sagar         2019-09-05   661  		};
dbb72e2c305b26 Vidya Sagar         2019-09-05   662  
be9b887f3bbafc Thierry Reding      2019-12-22   663  		mc: memory-controller@2c00000 {
be9b887f3bbafc Thierry Reding      2019-12-22   664  			compatible = "nvidia,tegra194-mc";
2838cfddbc1c4e Thierry Reding      2022-11-17   665  			reg = <0x0 0x02c00000 0x0 0x10000>,   /* MC-SID */
2838cfddbc1c4e Thierry Reding      2022-11-17   666  			      <0x0 0x02c10000 0x0 0x10000>,   /* MC Broadcast*/
2838cfddbc1c4e Thierry Reding      2022-11-17   667  			      <0x0 0x02c20000 0x0 0x10000>,   /* MC0 */
2838cfddbc1c4e Thierry Reding      2022-11-17   668  			      <0x0 0x02c30000 0x0 0x10000>,   /* MC1 */
2838cfddbc1c4e Thierry Reding      2022-11-17   669  			      <0x0 0x02c40000 0x0 0x10000>,   /* MC2 */
2838cfddbc1c4e Thierry Reding      2022-11-17   670  			      <0x0 0x02c50000 0x0 0x10000>,   /* MC3 */
2838cfddbc1c4e Thierry Reding      2022-11-17   671  			      <0x0 0x02b80000 0x0 0x10000>,   /* MC4 */
2838cfddbc1c4e Thierry Reding      2022-11-17   672  			      <0x0 0x02b90000 0x0 0x10000>,   /* MC5 */
2838cfddbc1c4e Thierry Reding      2022-11-17   673  			      <0x0 0x02ba0000 0x0 0x10000>,   /* MC6 */
2838cfddbc1c4e Thierry Reding      2022-11-17   674  			      <0x0 0x02bb0000 0x0 0x10000>,   /* MC7 */
2838cfddbc1c4e Thierry Reding      2022-11-17   675  			      <0x0 0x01700000 0x0 0x10000>,   /* MC8 */
2838cfddbc1c4e Thierry Reding      2022-11-17   676  			      <0x0 0x01710000 0x0 0x10000>,   /* MC9 */
2838cfddbc1c4e Thierry Reding      2022-11-17   677  			      <0x0 0x01720000 0x0 0x10000>,   /* MC10 */
2838cfddbc1c4e Thierry Reding      2022-11-17   678  			      <0x0 0x01730000 0x0 0x10000>,   /* MC11 */
2838cfddbc1c4e Thierry Reding      2022-11-17   679  			      <0x0 0x01740000 0x0 0x10000>,   /* MC12 */
2838cfddbc1c4e Thierry Reding      2022-11-17   680  			      <0x0 0x01750000 0x0 0x10000>,   /* MC13 */
2838cfddbc1c4e Thierry Reding      2022-11-17   681  			      <0x0 0x01760000 0x0 0x10000>,   /* MC14 */
2838cfddbc1c4e Thierry Reding      2022-11-17   682  			      <0x0 0x01770000 0x0 0x10000>;   /* MC15 */
000b99e5ed1c9e Ashish Mhetre       2022-04-26   683  			reg-names = "sid", "broadcast", "ch0", "ch1", "ch2", "ch3",
000b99e5ed1c9e Ashish Mhetre       2022-04-26   684  				    "ch4", "ch5", "ch6", "ch7", "ch8", "ch9", "ch10",
000b99e5ed1c9e Ashish Mhetre       2022-04-26   685  				    "ch11", "ch12", "ch13", "ch14", "ch15";
8613b4c8688412 Thierry Reding      2020-01-16   686  			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
d5237c7c9bbee0 Thierry Reding      2019-12-13   687  			#interconnect-cells = <1>;
be9b887f3bbafc Thierry Reding      2019-12-22   688  			status = "disabled";
be9b887f3bbafc Thierry Reding      2019-12-22   689  
be9b887f3bbafc Thierry Reding      2019-12-22   690  			#address-cells = <2>;
be9b887f3bbafc Thierry Reding      2019-12-22   691  			#size-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17   692  			ranges = <0x0 0x01700000 0x0 0x01700000 0x0 0x100000>,
2838cfddbc1c4e Thierry Reding      2022-11-17   693  				 <0x0 0x02b80000 0x0 0x02b80000 0x0 0x040000>,
2838cfddbc1c4e Thierry Reding      2022-11-17   694  				 <0x0 0x02c00000 0x0 0x02c00000 0x0 0x100000>;
be9b887f3bbafc Thierry Reding      2019-12-22   695  
be9b887f3bbafc Thierry Reding      2019-12-22   696  			/*
be9b887f3bbafc Thierry Reding      2019-12-22   697  			 * Bit 39 of addresses passing through the memory
be9b887f3bbafc Thierry Reding      2019-12-22   698  			 * controller selects the XBAR format used when memory
be9b887f3bbafc Thierry Reding      2019-12-22   699  			 * is accessed. This is used to transparently access
be9b887f3bbafc Thierry Reding      2019-12-22   700  			 * memory in the XBAR format used by the discrete GPU
be9b887f3bbafc Thierry Reding      2019-12-22   701  			 * (bit 39 set) or Tegra (bit 39 clear).
be9b887f3bbafc Thierry Reding      2019-12-22   702  			 *
be9b887f3bbafc Thierry Reding      2019-12-22   703  			 * As a consequence, the operating system must ensure
be9b887f3bbafc Thierry Reding      2019-12-22   704  			 * that bit 39 is never used implicitly, for example
be9b887f3bbafc Thierry Reding      2019-12-22   705  			 * via an I/O virtual address mapping of an IOMMU. If
be9b887f3bbafc Thierry Reding      2019-12-22   706  			 * devices require access to the XBAR switch, their
be9b887f3bbafc Thierry Reding      2019-12-22   707  			 * drivers must set this bit explicitly.
be9b887f3bbafc Thierry Reding      2019-12-22   708  			 *
be9b887f3bbafc Thierry Reding      2019-12-22   709  			 * Limit the DMA range for memory clients to [38:0].
be9b887f3bbafc Thierry Reding      2019-12-22   710  			 */
2838cfddbc1c4e Thierry Reding      2022-11-17   711  			dma-ranges = <0x0 0x0 0x0 0x0 0x80 0x0>;
be9b887f3bbafc Thierry Reding      2019-12-22   712  
be9b887f3bbafc Thierry Reding      2019-12-22   713  			emc: external-memory-controller@2c60000 {
be9b887f3bbafc Thierry Reding      2019-12-22   714  				compatible = "nvidia,tegra194-emc";
be9b887f3bbafc Thierry Reding      2019-12-22   715  				reg = <0x0 0x02c60000 0x0 0x90000>,
be9b887f3bbafc Thierry Reding      2019-12-22   716  				      <0x0 0x01780000 0x0 0x80000>;
cc9396676c1bc4 Thierry Reding      2021-12-13   717  				interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
be9b887f3bbafc Thierry Reding      2019-12-22   718  				clocks = <&bpmp TEGRA194_CLK_EMC>;
be9b887f3bbafc Thierry Reding      2019-12-22   719  				clock-names = "emc";
be9b887f3bbafc Thierry Reding      2019-12-22   720  
d5237c7c9bbee0 Thierry Reding      2019-12-13   721  				#interconnect-cells = <0>;
d5237c7c9bbee0 Thierry Reding      2019-12-13   722  
be9b887f3bbafc Thierry Reding      2019-12-22   723  				nvidia,bpmp = <&bpmp>;
be9b887f3bbafc Thierry Reding      2019-12-22   724  			};
be9b887f3bbafc Thierry Reding      2019-12-22   725  		};
be9b887f3bbafc Thierry Reding      2019-12-22   726  
5aa9083efd67f2 Thierry Reding      2022-07-04   727  		timer@3010000 {
5aa9083efd67f2 Thierry Reding      2022-07-04   728  			compatible = "nvidia,tegra186-timer";
2838cfddbc1c4e Thierry Reding      2022-11-17   729  			reg = <0x0 0x03010000 0x0 0x000e0000>;
5aa9083efd67f2 Thierry Reding      2022-07-04   730  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   731  				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   732  				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   733  				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   734  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   735  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   736  				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   737  				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   738  				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
5aa9083efd67f2 Thierry Reding      2022-07-04   739  				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
5aa9083efd67f2 Thierry Reding      2022-07-04   740  			status = "okay";
5aa9083efd67f2 Thierry Reding      2022-07-04   741  		};
5aa9083efd67f2 Thierry Reding      2022-07-04   742  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   743  		uarta: serial@3100000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20   744  			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
2838cfddbc1c4e Thierry Reding      2022-11-17   745  			reg = <0x0 0x03100000 0x0 0x40>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   746  			reg-shift = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   747  			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   748  			clocks = <&bpmp TEGRA194_CLK_UARTA>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   749  			resets = <&bpmp TEGRA194_RESET_UARTA>;
39e1cbf57e3034 Aaron Kling         2025-04-28   750  			dmas = <&gpcdma 8>, <&gpcdma 8>;
39e1cbf57e3034 Aaron Kling         2025-04-28   751  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   752  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   753  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   754  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   755  		uartb: serial@3110000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20   756  			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
2838cfddbc1c4e Thierry Reding      2022-11-17   757  			reg = <0x0 0x03110000 0x0 0x40>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   758  			reg-shift = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   759  			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   760  			clocks = <&bpmp TEGRA194_CLK_UARTB>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   761  			resets = <&bpmp TEGRA194_RESET_UARTB>;
39e1cbf57e3034 Aaron Kling         2025-04-28   762  			dmas = <&gpcdma 9>, <&gpcdma 9>;
39e1cbf57e3034 Aaron Kling         2025-04-28   763  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   764  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   765  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   766  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   767  		uartd: serial@3130000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20   768  			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
2838cfddbc1c4e Thierry Reding      2022-11-17   769  			reg = <0x0 0x03130000 0x0 0x40>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   770  			reg-shift = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   771  			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   772  			clocks = <&bpmp TEGRA194_CLK_UARTD>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   773  			resets = <&bpmp TEGRA194_RESET_UARTD>;
39e1cbf57e3034 Aaron Kling         2025-04-28   774  			dmas = <&gpcdma 19>, <&gpcdma 19>;
39e1cbf57e3034 Aaron Kling         2025-04-28   775  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   776  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   777  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   778  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   779  		uarte: serial@3140000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20   780  			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
2838cfddbc1c4e Thierry Reding      2022-11-17   781  			reg = <0x0 0x03140000 0x0 0x40>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   782  			reg-shift = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   783  			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   784  			clocks = <&bpmp TEGRA194_CLK_UARTE>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   785  			resets = <&bpmp TEGRA194_RESET_UARTE>;
39e1cbf57e3034 Aaron Kling         2025-04-28   786  			dmas = <&gpcdma 20>, <&gpcdma 20>;
39e1cbf57e3034 Aaron Kling         2025-04-28   787  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   788  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   789  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   790  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   791  		uartf: serial@3150000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20   792  			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
2838cfddbc1c4e Thierry Reding      2022-11-17   793  			reg = <0x0 0x03150000 0x0 0x40>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   794  			reg-shift = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   795  			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   796  			clocks = <&bpmp TEGRA194_CLK_UARTF>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   797  			resets = <&bpmp TEGRA194_RESET_UARTF>;
39e1cbf57e3034 Aaron Kling         2025-04-28   798  			dmas = <&gpcdma 12>, <&gpcdma 12>;
39e1cbf57e3034 Aaron Kling         2025-04-28   799  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   800  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   801  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   802  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   803  		gen1_i2c: i2c@3160000 {
d9fd22447ba59a Thierry Reding      2018-09-21   804  			compatible = "nvidia,tegra194-i2c";
2838cfddbc1c4e Thierry Reding      2022-11-17   805  			reg = <0x0 0x03160000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   806  			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   807  			#address-cells = <1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   808  			#size-cells = <0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   809  			clocks = <&bpmp TEGRA194_CLK_I2C1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   810  			clock-names = "div-clk";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   811  			resets = <&bpmp TEGRA194_RESET_I2C1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   812  			reset-names = "i2c";
8e4428051df12f Akhil R             2022-09-06   813  			dmas = <&gpcdma 21>, <&gpcdma 21>;
8e4428051df12f Akhil R             2022-09-06   814  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   815  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   816  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   817  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   818  		uarth: serial@3170000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20   819  			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
2838cfddbc1c4e Thierry Reding      2022-11-17   820  			reg = <0x0 0x03170000 0x0 0x40>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   821  			reg-shift = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   822  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   823  			clocks = <&bpmp TEGRA194_CLK_UARTH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   824  			resets = <&bpmp TEGRA194_RESET_UARTH>;
39e1cbf57e3034 Aaron Kling         2025-04-28   825  			dmas = <&gpcdma 13>, <&gpcdma 13>;
39e1cbf57e3034 Aaron Kling         2025-04-28   826  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   827  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   828  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   829  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   830  		cam_i2c: i2c@3180000 {
d9fd22447ba59a Thierry Reding      2018-09-21   831  			compatible = "nvidia,tegra194-i2c";
2838cfddbc1c4e Thierry Reding      2022-11-17   832  			reg = <0x0 0x03180000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   833  			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   834  			#address-cells = <1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   835  			#size-cells = <0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   836  			clocks = <&bpmp TEGRA194_CLK_I2C3>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   837  			clock-names = "div-clk";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   838  			resets = <&bpmp TEGRA194_RESET_I2C3>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   839  			reset-names = "i2c";
8e4428051df12f Akhil R             2022-09-06   840  			dmas = <&gpcdma 23>, <&gpcdma 23>;
8e4428051df12f Akhil R             2022-09-06   841  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   842  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   843  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   844  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   845  		/* shares pads with dpaux1 */
5425fb15d8ee64 Mikko Perttunen     2018-02-20   846  		dp_aux_ch1_i2c: i2c@3190000 {
d9fd22447ba59a Thierry Reding      2018-09-21   847  			compatible = "nvidia,tegra194-i2c";
2838cfddbc1c4e Thierry Reding      2022-11-17   848  			reg = <0x0 0x03190000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   849  			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   850  			#address-cells = <1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   851  			#size-cells = <0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   852  			clocks = <&bpmp TEGRA194_CLK_I2C4>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   853  			clock-names = "div-clk";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   854  			resets = <&bpmp TEGRA194_RESET_I2C4>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   855  			reset-names = "i2c";
a41315610bab6f Thierry Reding      2020-08-06   856  			pinctrl-0 = <&state_dpaux1_i2c>;
a41315610bab6f Thierry Reding      2020-08-06   857  			pinctrl-1 = <&state_dpaux1_off>;
a41315610bab6f Thierry Reding      2020-08-06   858  			pinctrl-names = "default", "idle";
8e4428051df12f Akhil R             2022-09-06   859  			dmas = <&gpcdma 26>, <&gpcdma 26>;
8e4428051df12f Akhil R             2022-09-06   860  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   861  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   862  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   863  
5425fb15d8ee64 Mikko Perttunen     2018-02-20   864  		/* shares pads with dpaux0 */
5425fb15d8ee64 Mikko Perttunen     2018-02-20   865  		dp_aux_ch0_i2c: i2c@31b0000 {
d9fd22447ba59a Thierry Reding      2018-09-21   866  			compatible = "nvidia,tegra194-i2c";
2838cfddbc1c4e Thierry Reding      2022-11-17   867  			reg = <0x0 0x031b0000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   868  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   869  			#address-cells = <1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   870  			#size-cells = <0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   871  			clocks = <&bpmp TEGRA194_CLK_I2C6>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   872  			clock-names = "div-clk";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   873  			resets = <&bpmp TEGRA194_RESET_I2C6>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   874  			reset-names = "i2c";
a41315610bab6f Thierry Reding      2020-08-06   875  			pinctrl-0 = <&state_dpaux0_i2c>;
a41315610bab6f Thierry Reding      2020-08-06   876  			pinctrl-1 = <&state_dpaux0_off>;
a41315610bab6f Thierry Reding      2020-08-06   877  			pinctrl-names = "default", "idle";
8e4428051df12f Akhil R             2022-09-06   878  			dmas = <&gpcdma 30>, <&gpcdma 30>;
8e4428051df12f Akhil R             2022-09-06   879  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   880  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   881  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   882  
a41315610bab6f Thierry Reding      2020-08-06   883  		/* shares pads with dpaux2 */
a41315610bab6f Thierry Reding      2020-08-06   884  		dp_aux_ch2_i2c: i2c@31c0000 {
d9fd22447ba59a Thierry Reding      2018-09-21   885  			compatible = "nvidia,tegra194-i2c";
2838cfddbc1c4e Thierry Reding      2022-11-17   886  			reg = <0x0 0x031c0000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   887  			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   888  			#address-cells = <1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   889  			#size-cells = <0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   890  			clocks = <&bpmp TEGRA194_CLK_I2C7>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   891  			clock-names = "div-clk";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   892  			resets = <&bpmp TEGRA194_RESET_I2C7>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   893  			reset-names = "i2c";
a41315610bab6f Thierry Reding      2020-08-06   894  			pinctrl-0 = <&state_dpaux2_i2c>;
a41315610bab6f Thierry Reding      2020-08-06   895  			pinctrl-1 = <&state_dpaux2_off>;
a41315610bab6f Thierry Reding      2020-08-06   896  			pinctrl-names = "default", "idle";
8e4428051df12f Akhil R             2022-09-06   897  			dmas = <&gpcdma 27>, <&gpcdma 27>;
8e4428051df12f Akhil R             2022-09-06   898  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   899  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   900  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   901  
a41315610bab6f Thierry Reding      2020-08-06   902  		/* shares pads with dpaux3 */
a41315610bab6f Thierry Reding      2020-08-06   903  		dp_aux_ch3_i2c: i2c@31e0000 {
d9fd22447ba59a Thierry Reding      2018-09-21   904  			compatible = "nvidia,tegra194-i2c";
2838cfddbc1c4e Thierry Reding      2022-11-17   905  			reg = <0x0 0x031e0000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   906  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   907  			#address-cells = <1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   908  			#size-cells = <0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   909  			clocks = <&bpmp TEGRA194_CLK_I2C9>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   910  			clock-names = "div-clk";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   911  			resets = <&bpmp TEGRA194_RESET_I2C9>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20   912  			reset-names = "i2c";
a41315610bab6f Thierry Reding      2020-08-06   913  			pinctrl-0 = <&state_dpaux3_i2c>;
a41315610bab6f Thierry Reding      2020-08-06   914  			pinctrl-1 = <&state_dpaux3_off>;
a41315610bab6f Thierry Reding      2020-08-06   915  			pinctrl-names = "default", "idle";
8e4428051df12f Akhil R             2022-09-06   916  			dmas = <&gpcdma 31>, <&gpcdma 31>;
8e4428051df12f Akhil R             2022-09-06   917  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   918  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20   919  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20   920  
96ded827a2e8da Sowjanya Komatineni 2020-12-21   921  		spi@3270000 {
96ded827a2e8da Sowjanya Komatineni 2020-12-21   922  			compatible = "nvidia,tegra194-qspi";
2838cfddbc1c4e Thierry Reding      2022-11-17   923  			reg = <0x0 0x3270000 0x0 0x1000>;
96ded827a2e8da Sowjanya Komatineni 2020-12-21   924  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
96ded827a2e8da Sowjanya Komatineni 2020-12-21   925  			#address-cells = <1>;
96ded827a2e8da Sowjanya Komatineni 2020-12-21   926  			#size-cells = <0>;
96ded827a2e8da Sowjanya Komatineni 2020-12-21   927  			clocks = <&bpmp TEGRA194_CLK_QSPI0>,
96ded827a2e8da Sowjanya Komatineni 2020-12-21   928  				 <&bpmp TEGRA194_CLK_QSPI0_PM>;
96ded827a2e8da Sowjanya Komatineni 2020-12-21   929  			clock-names = "qspi", "qspi_out";
96ded827a2e8da Sowjanya Komatineni 2020-12-21   930  			resets = <&bpmp TEGRA194_RESET_QSPI0>;
96ded827a2e8da Sowjanya Komatineni 2020-12-21   931  			status = "disabled";
96ded827a2e8da Sowjanya Komatineni 2020-12-21   932  		};
96ded827a2e8da Sowjanya Komatineni 2020-12-21   933  
6a574ec70c52c9 Thierry Reding      2018-09-21   934  		pwm1: pwm@3280000 {
6a574ec70c52c9 Thierry Reding      2018-09-21   935  			compatible = "nvidia,tegra194-pwm",
6a574ec70c52c9 Thierry Reding      2018-09-21   936  				     "nvidia,tegra186-pwm";
2838cfddbc1c4e Thierry Reding      2022-11-17   937  			reg = <0x0 0x3280000 0x0 0x10000>;
6a574ec70c52c9 Thierry Reding      2018-09-21   938  			clocks = <&bpmp TEGRA194_CLK_PWM1>;
6a574ec70c52c9 Thierry Reding      2018-09-21   939  			resets = <&bpmp TEGRA194_RESET_PWM1>;
6a574ec70c52c9 Thierry Reding      2018-09-21   940  			reset-names = "pwm";
6a574ec70c52c9 Thierry Reding      2018-09-21   941  			status = "disabled";
6a574ec70c52c9 Thierry Reding      2018-09-21   942  			#pwm-cells = <2>;
6a574ec70c52c9 Thierry Reding      2018-09-21   943  		};
6a574ec70c52c9 Thierry Reding      2018-09-21   944  
6a574ec70c52c9 Thierry Reding      2018-09-21   945  		pwm2: pwm@3290000 {
6a574ec70c52c9 Thierry Reding      2018-09-21   946  			compatible = "nvidia,tegra194-pwm",
6a574ec70c52c9 Thierry Reding      2018-09-21   947  				     "nvidia,tegra186-pwm";
2838cfddbc1c4e Thierry Reding      2022-11-17   948  			reg = <0x0 0x3290000 0x0 0x10000>;
6a574ec70c52c9 Thierry Reding      2018-09-21   949  			clocks = <&bpmp TEGRA194_CLK_PWM2>;
6a574ec70c52c9 Thierry Reding      2018-09-21   950  			resets = <&bpmp TEGRA194_RESET_PWM2>;
6a574ec70c52c9 Thierry Reding      2018-09-21   951  			reset-names = "pwm";
6a574ec70c52c9 Thierry Reding      2018-09-21   952  			status = "disabled";
6a574ec70c52c9 Thierry Reding      2018-09-21   953  			#pwm-cells = <2>;
6a574ec70c52c9 Thierry Reding      2018-09-21   954  		};
6a574ec70c52c9 Thierry Reding      2018-09-21   955  
6a574ec70c52c9 Thierry Reding      2018-09-21   956  		pwm3: pwm@32a0000 {
6a574ec70c52c9 Thierry Reding      2018-09-21   957  			compatible = "nvidia,tegra194-pwm",
6a574ec70c52c9 Thierry Reding      2018-09-21   958  				     "nvidia,tegra186-pwm";
2838cfddbc1c4e Thierry Reding      2022-11-17   959  			reg = <0x0 0x32a0000 0x0 0x10000>;
6a574ec70c52c9 Thierry Reding      2018-09-21   960  			clocks = <&bpmp TEGRA194_CLK_PWM3>;
6a574ec70c52c9 Thierry Reding      2018-09-21   961  			resets = <&bpmp TEGRA194_RESET_PWM3>;
6a574ec70c52c9 Thierry Reding      2018-09-21   962  			reset-names = "pwm";
6a574ec70c52c9 Thierry Reding      2018-09-21   963  			status = "disabled";
6a574ec70c52c9 Thierry Reding      2018-09-21   964  			#pwm-cells = <2>;
6a574ec70c52c9 Thierry Reding      2018-09-21   965  		};
6a574ec70c52c9 Thierry Reding      2018-09-21   966  
6a574ec70c52c9 Thierry Reding      2018-09-21   967  		pwm5: pwm@32c0000 {
6a574ec70c52c9 Thierry Reding      2018-09-21   968  			compatible = "nvidia,tegra194-pwm",
6a574ec70c52c9 Thierry Reding      2018-09-21   969  				     "nvidia,tegra186-pwm";
2838cfddbc1c4e Thierry Reding      2022-11-17   970  			reg = <0x0 0x32c0000 0x0 0x10000>;
6a574ec70c52c9 Thierry Reding      2018-09-21   971  			clocks = <&bpmp TEGRA194_CLK_PWM5>;
6a574ec70c52c9 Thierry Reding      2018-09-21   972  			resets = <&bpmp TEGRA194_RESET_PWM5>;
6a574ec70c52c9 Thierry Reding      2018-09-21   973  			reset-names = "pwm";
6a574ec70c52c9 Thierry Reding      2018-09-21   974  			status = "disabled";
6a574ec70c52c9 Thierry Reding      2018-09-21   975  			#pwm-cells = <2>;
6a574ec70c52c9 Thierry Reding      2018-09-21   976  		};
6a574ec70c52c9 Thierry Reding      2018-09-21   977  
6a574ec70c52c9 Thierry Reding      2018-09-21   978  		pwm6: pwm@32d0000 {
6a574ec70c52c9 Thierry Reding      2018-09-21   979  			compatible = "nvidia,tegra194-pwm",
6a574ec70c52c9 Thierry Reding      2018-09-21   980  				     "nvidia,tegra186-pwm";
2838cfddbc1c4e Thierry Reding      2022-11-17   981  			reg = <0x0 0x32d0000 0x0 0x10000>;
6a574ec70c52c9 Thierry Reding      2018-09-21   982  			clocks = <&bpmp TEGRA194_CLK_PWM6>;
6a574ec70c52c9 Thierry Reding      2018-09-21   983  			resets = <&bpmp TEGRA194_RESET_PWM6>;
6a574ec70c52c9 Thierry Reding      2018-09-21   984  			reset-names = "pwm";
6a574ec70c52c9 Thierry Reding      2018-09-21   985  			status = "disabled";
6a574ec70c52c9 Thierry Reding      2018-09-21   986  			#pwm-cells = <2>;
6a574ec70c52c9 Thierry Reding      2018-09-21   987  		};
6a574ec70c52c9 Thierry Reding      2018-09-21   988  
6a574ec70c52c9 Thierry Reding      2018-09-21   989  		pwm7: pwm@32e0000 {
6a574ec70c52c9 Thierry Reding      2018-09-21   990  			compatible = "nvidia,tegra194-pwm",
6a574ec70c52c9 Thierry Reding      2018-09-21   991  				     "nvidia,tegra186-pwm";
2838cfddbc1c4e Thierry Reding      2022-11-17   992  			reg = <0x0 0x32e0000 0x0 0x10000>;
6a574ec70c52c9 Thierry Reding      2018-09-21   993  			clocks = <&bpmp TEGRA194_CLK_PWM7>;
6a574ec70c52c9 Thierry Reding      2018-09-21   994  			resets = <&bpmp TEGRA194_RESET_PWM7>;
6a574ec70c52c9 Thierry Reding      2018-09-21   995  			reset-names = "pwm";
6a574ec70c52c9 Thierry Reding      2018-09-21   996  			status = "disabled";
6a574ec70c52c9 Thierry Reding      2018-09-21   997  			#pwm-cells = <2>;
6a574ec70c52c9 Thierry Reding      2018-09-21   998  		};
6a574ec70c52c9 Thierry Reding      2018-09-21   999  
6a574ec70c52c9 Thierry Reding      2018-09-21  1000  		pwm8: pwm@32f0000 {
6a574ec70c52c9 Thierry Reding      2018-09-21  1001  			compatible = "nvidia,tegra194-pwm",
6a574ec70c52c9 Thierry Reding      2018-09-21  1002  				     "nvidia,tegra186-pwm";
2838cfddbc1c4e Thierry Reding      2022-11-17  1003  			reg = <0x0 0x32f0000 0x0 0x10000>;
6a574ec70c52c9 Thierry Reding      2018-09-21  1004  			clocks = <&bpmp TEGRA194_CLK_PWM8>;
6a574ec70c52c9 Thierry Reding      2018-09-21  1005  			resets = <&bpmp TEGRA194_RESET_PWM8>;
6a574ec70c52c9 Thierry Reding      2018-09-21  1006  			reset-names = "pwm";
6a574ec70c52c9 Thierry Reding      2018-09-21  1007  			status = "disabled";
6a574ec70c52c9 Thierry Reding      2018-09-21  1008  			#pwm-cells = <2>;
6a574ec70c52c9 Thierry Reding      2018-09-21  1009  		};
6a574ec70c52c9 Thierry Reding      2018-09-21  1010  
79ed18d9ece474 Thierry Reding      2022-11-22  1011  		spi@3300000 {
79ed18d9ece474 Thierry Reding      2022-11-22  1012  			compatible = "nvidia,tegra194-qspi";
79ed18d9ece474 Thierry Reding      2022-11-22  1013  			reg = <0x0 0x3300000 0x0 0x1000>;
79ed18d9ece474 Thierry Reding      2022-11-22  1014  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
79ed18d9ece474 Thierry Reding      2022-11-22  1015  			#address-cells = <1>;
79ed18d9ece474 Thierry Reding      2022-11-22  1016  			#size-cells = <0>;
79ed18d9ece474 Thierry Reding      2022-11-22  1017  			clocks = <&bpmp TEGRA194_CLK_QSPI1>,
79ed18d9ece474 Thierry Reding      2022-11-22  1018  				 <&bpmp TEGRA194_CLK_QSPI1_PM>;
79ed18d9ece474 Thierry Reding      2022-11-22  1019  			clock-names = "qspi", "qspi_out";
79ed18d9ece474 Thierry Reding      2022-11-22  1020  			resets = <&bpmp TEGRA194_RESET_QSPI1>;
79ed18d9ece474 Thierry Reding      2022-11-22  1021  			status = "disabled";
79ed18d9ece474 Thierry Reding      2022-11-22  1022  		};
79ed18d9ece474 Thierry Reding      2022-11-22  1023  
67bb17f6109eb8 Thierry Reding      2020-06-11  1024  		sdmmc1: mmc@3400000 {
2c3578b3f30947 Thierry Reding      2020-01-16  1025  			compatible = "nvidia,tegra194-sdhci";
2838cfddbc1c4e Thierry Reding      2022-11-17  1026  			reg = <0x0 0x03400000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1027  			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1028  			clocks = <&bpmp TEGRA194_CLK_SDMMC1>,
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1029  				 <&bpmp TEGRA194_CLK_SDMMC_LEGACY_TM>;
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1030  			clock-names = "sdhci", "tmclk";
7ac853ba789d1d Aniruddha Rao       2022-03-16  1031  			assigned-clocks = <&bpmp TEGRA194_CLK_SDMMC1>,
7ac853ba789d1d Aniruddha Rao       2022-03-16  1032  					  <&bpmp TEGRA194_CLK_PLLC4_MUXED>;
7ac853ba789d1d Aniruddha Rao       2022-03-16  1033  			assigned-clock-parents =
7ac853ba789d1d Aniruddha Rao       2022-03-16  1034  					  <&bpmp TEGRA194_CLK_PLLC4_MUXED>,
7ac853ba789d1d Aniruddha Rao       2022-03-16  1035  					  <&bpmp TEGRA194_CLK_PLLC4_VCO_DIV2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1036  			resets = <&bpmp TEGRA194_RESET_SDMMC1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1037  			reset-names = "sdhci";
d5237c7c9bbee0 Thierry Reding      2019-12-13  1038  			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRA &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  1039  					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1040  			interconnect-names = "dma-mem", "write";
c7289b1c8a4e10 Thierry Reding      2021-06-03  1041  			iommus = <&smmu TEGRA194_SID_SDMMC1>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1042  			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
ff21087e6131e7 Prathamesh Shete    2021-11-16  1043  			pinctrl-0 = <&sdmmc1_3v3>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1044  			pinctrl-1 = <&sdmmc1_1v8>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1045  			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
4e0f122991943b Sowjanya Komatineni 2019-01-10  1046  									<0x07>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1047  			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
4e0f122991943b Sowjanya Komatineni 2019-01-10  1048  									<0x07>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1049  			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x06>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1050  			nvidia,pad-autocal-pull-down-offset-1v8-timeout =
4e0f122991943b Sowjanya Komatineni 2019-01-10  1051  									<0x07>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1052  			nvidia,pad-autocal-pull-up-offset-sdr104 = <0x00>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1053  			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1054  			nvidia,default-tap = <0x9>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1055  			nvidia,default-trim = <0x5>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1056  			sd-uhs-sdr25;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1057  			sd-uhs-sdr50;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1058  			sd-uhs-ddr50;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1059  			sd-uhs-sdr104;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1060  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1061  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1062  
67bb17f6109eb8 Thierry Reding      2020-06-11  1063  		sdmmc3: mmc@3440000 {
2c3578b3f30947 Thierry Reding      2020-01-16  1064  			compatible = "nvidia,tegra194-sdhci";
2838cfddbc1c4e Thierry Reding      2022-11-17  1065  			reg = <0x0 0x03440000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1066  			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1067  			clocks = <&bpmp TEGRA194_CLK_SDMMC3>,
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1068  				 <&bpmp TEGRA194_CLK_SDMMC_LEGACY_TM>;
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1069  			clock-names = "sdhci", "tmclk";
7ac853ba789d1d Aniruddha Rao       2022-03-16  1070  			assigned-clocks = <&bpmp TEGRA194_CLK_SDMMC3>,
7ac853ba789d1d Aniruddha Rao       2022-03-16  1071  					  <&bpmp TEGRA194_CLK_PLLC4_MUXED>;
7ac853ba789d1d Aniruddha Rao       2022-03-16  1072  			assigned-clock-parents =
7ac853ba789d1d Aniruddha Rao       2022-03-16  1073  					  <&bpmp TEGRA194_CLK_PLLC4_MUXED>,
7ac853ba789d1d Aniruddha Rao       2022-03-16  1074  					  <&bpmp TEGRA194_CLK_PLLC4_VCO_DIV2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1075  			resets = <&bpmp TEGRA194_RESET_SDMMC3>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1076  			reset-names = "sdhci";
d5237c7c9bbee0 Thierry Reding      2019-12-13  1077  			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCR &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  1078  					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1079  			interconnect-names = "dma-mem", "write";
c7289b1c8a4e10 Thierry Reding      2021-06-03  1080  			iommus = <&smmu TEGRA194_SID_SDMMC3>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1081  			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
ff21087e6131e7 Prathamesh Shete    2021-11-16  1082  			pinctrl-0 = <&sdmmc3_3v3>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1083  			pinctrl-1 = <&sdmmc3_1v8>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1084  			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1085  			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1086  			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x07>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1087  			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
4e0f122991943b Sowjanya Komatineni 2019-01-10  1088  									<0x07>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1089  			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x06>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1090  			nvidia,pad-autocal-pull-down-offset-1v8-timeout =
4e0f122991943b Sowjanya Komatineni 2019-01-10  1091  									<0x07>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1092  			nvidia,pad-autocal-pull-up-offset-sdr104 = <0x00>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1093  			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1094  			nvidia,default-tap = <0x9>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1095  			nvidia,default-trim = <0x5>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1096  			sd-uhs-sdr25;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1097  			sd-uhs-sdr50;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1098  			sd-uhs-ddr50;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1099  			sd-uhs-sdr104;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1100  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1101  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1102  
67bb17f6109eb8 Thierry Reding      2020-06-11  1103  		sdmmc4: mmc@3460000 {
2c3578b3f30947 Thierry Reding      2020-01-16  1104  			compatible = "nvidia,tegra194-sdhci";
2838cfddbc1c4e Thierry Reding      2022-11-17  1105  			reg = <0x0 0x03460000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1106  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1107  			clocks = <&bpmp TEGRA194_CLK_SDMMC4>,
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1108  				 <&bpmp TEGRA194_CLK_SDMMC_LEGACY_TM>;
c956c0cd4f6f4a Sowjanya Komatineni 2020-08-27  1109  			clock-names = "sdhci", "tmclk";
351648d0cc6d32 Sowjanya Komatineni 2018-12-13  1110  			assigned-clocks = <&bpmp TEGRA194_CLK_SDMMC4>,
351648d0cc6d32 Sowjanya Komatineni 2018-12-13  1111  					  <&bpmp TEGRA194_CLK_PLLC4>;
351648d0cc6d32 Sowjanya Komatineni 2018-12-13  1112  			assigned-clock-parents =
351648d0cc6d32 Sowjanya Komatineni 2018-12-13  1113  					  <&bpmp TEGRA194_CLK_PLLC4>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1114  			resets = <&bpmp TEGRA194_RESET_SDMMC4>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1115  			reset-names = "sdhci";
d5237c7c9bbee0 Thierry Reding      2019-12-13  1116  			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRAB &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  1117  					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWAB &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1118  			interconnect-names = "dma-mem", "write";
c7289b1c8a4e10 Thierry Reding      2021-06-03  1119  			iommus = <&smmu TEGRA194_SID_SDMMC4>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1120  			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1121  			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1122  			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x0a>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1123  			nvidia,pad-autocal-pull-down-offset-1v8-timeout =
4e0f122991943b Sowjanya Komatineni 2019-01-10  1124  									<0x0a>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1125  			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x0a>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1126  			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
4e0f122991943b Sowjanya Komatineni 2019-01-10  1127  									<0x0a>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1128  			nvidia,default-tap = <0x8>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1129  			nvidia,default-trim = <0x14>;
4e0f122991943b Sowjanya Komatineni 2019-01-10  1130  			nvidia,dqs-trim = <40>;
c2fee44399af4f Prathamesh Shete    2021-12-16  1131  			cap-mmc-highspeed;
c2fee44399af4f Prathamesh Shete    2021-12-16  1132  			mmc-ddr-1_8v;
c2fee44399af4f Prathamesh Shete    2021-12-16  1133  			mmc-hs200-1_8v;
c2fee44399af4f Prathamesh Shete    2021-12-16  1134  			mmc-hs400-1_8v;
c2fee44399af4f Prathamesh Shete    2021-12-16  1135  			mmc-hs400-enhanced-strobe;
dfd3cb6feb73a3 Sowjanya Komatineni 2019-01-23  1136  			supports-cqe;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1137  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1138  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1139  
4878cc0c9fab0c Sameer Pujar        2018-12-04  1140  		hda@3510000 {
7f0ea5acfc1950 Thierry Reding      2022-11-04  1141  			compatible = "nvidia,tegra194-hda";
2838cfddbc1c4e Thierry Reding      2022-11-17  1142  			reg = <0x0 0x3510000 0x0 0x10000>;
4878cc0c9fab0c Sameer Pujar        2018-12-04  1143  			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
4878cc0c9fab0c Sameer Pujar        2018-12-04  1144  			clocks = <&bpmp TEGRA194_CLK_HDA>,
48f6e195039486 Sameer Pujar        2020-11-18  1145  				 <&bpmp TEGRA194_CLK_HDA2HDMICODEC>,
48f6e195039486 Sameer Pujar        2020-11-18  1146  				 <&bpmp TEGRA194_CLK_HDA2CODEC_2X>;
48f6e195039486 Sameer Pujar        2020-11-18  1147  			clock-names = "hda", "hda2hdmi", "hda2codec_2x";
4878cc0c9fab0c Sameer Pujar        2018-12-04  1148  			resets = <&bpmp TEGRA194_RESET_HDA>,
146b3a77af8091 Sameer Pujar        2021-12-23  1149  				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
146b3a77af8091 Sameer Pujar        2021-12-23  1150  			reset-names = "hda", "hda2hdmi";
4878cc0c9fab0c Sameer Pujar        2018-12-04  1151  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1152  			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  1153  					<&mc TEGRA194_MEMORY_CLIENT_HDAW &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1154  			interconnect-names = "dma-mem", "write";
c7289b1c8a4e10 Thierry Reding      2021-06-03  1155  			iommus = <&smmu TEGRA194_SID_HDA>;
4878cc0c9fab0c Sameer Pujar        2018-12-04  1156  			status = "disabled";
4878cc0c9fab0c Sameer Pujar        2018-12-04  1157  		};
4878cc0c9fab0c Sameer Pujar        2018-12-04  1158  
fab7a0391b8bd4 JC Kuo              2020-02-12  1159  		xusb_padctl: padctl@3520000 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1160  			compatible = "nvidia,tegra194-xusb-padctl";
2838cfddbc1c4e Thierry Reding      2022-11-17  1161  			reg = <0x0 0x03520000 0x0 0x1000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1162  			      <0x0 0x03540000 0x0 0x1000>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1163  			reg-names = "padctl", "ao";
6450da3dab73e2 JC Kuo              2020-11-19  1164  			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1165  
fab7a0391b8bd4 JC Kuo              2020-02-12  1166  			resets = <&bpmp TEGRA194_RESET_XUSB_PADCTL>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1167  			reset-names = "padctl";
fab7a0391b8bd4 JC Kuo              2020-02-12  1168  
fab7a0391b8bd4 JC Kuo              2020-02-12  1169  			status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1170  
fab7a0391b8bd4 JC Kuo              2020-02-12  1171  			pads {
fab7a0391b8bd4 JC Kuo              2020-02-12  1172  				usb2 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1173  					clocks = <&bpmp TEGRA194_CLK_USB2_TRK>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1174  					clock-names = "trk";
fab7a0391b8bd4 JC Kuo              2020-02-12  1175  
fab7a0391b8bd4 JC Kuo              2020-02-12  1176  					lanes {
fab7a0391b8bd4 JC Kuo              2020-02-12  1177  						usb2-0 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1178  							nvidia,function = "xusb";
fab7a0391b8bd4 JC Kuo              2020-02-12  1179  							status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1180  							#phy-cells = <0>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1181  						};
fab7a0391b8bd4 JC Kuo              2020-02-12  1182  
fab7a0391b8bd4 JC Kuo              2020-02-12  1183  						usb2-1 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1184  							nvidia,function = "xusb";
fab7a0391b8bd4 JC Kuo              2020-02-12  1185  							status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1186  							#phy-cells = <0>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1187  						};
fab7a0391b8bd4 JC Kuo              2020-02-12  1188  
fab7a0391b8bd4 JC Kuo              2020-02-12  1189  						usb2-2 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1190  							nvidia,function = "xusb";
fab7a0391b8bd4 JC Kuo              2020-02-12  1191  							status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1192  							#phy-cells = <0>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1193  						};
fab7a0391b8bd4 JC Kuo              2020-02-12  1194  
fab7a0391b8bd4 JC Kuo              2020-02-12  1195  						usb2-3 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1196  							nvidia,function = "xusb";
fab7a0391b8bd4 JC Kuo              2020-02-12  1197  							status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1198  							#phy-cells = <0>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1199  						};
fab7a0391b8bd4 JC Kuo              2020-02-12  1200  					};
fab7a0391b8bd4 JC Kuo              2020-02-12  1201  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1202  
fab7a0391b8bd4 JC Kuo              2020-02-12  1203  				usb3 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1204  					lanes {
fab7a0391b8bd4 JC Kuo              2020-02-12  1205  						usb3-0 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1206  							nvidia,function = "xusb";
fab7a0391b8bd4 JC Kuo              2020-02-12  1207  							status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1208  							#phy-cells = <0>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1209  						};
fab7a0391b8bd4 JC Kuo              2020-02-12  1210  
fab7a0391b8bd4 JC Kuo              2020-02-12  1211  						usb3-1 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1212  							nvidia,function = "xusb";
fab7a0391b8bd4 JC Kuo              2020-02-12  1213  							status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1214  							#phy-cells = <0>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1215  						};
fab7a0391b8bd4 JC Kuo              2020-02-12  1216  
fab7a0391b8bd4 JC Kuo              2020-02-12  1217  						usb3-2 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1218  							nvidia,function = "xusb";
fab7a0391b8bd4 JC Kuo              2020-02-12  1219  							status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1220  							#phy-cells = <0>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1221  						};
fab7a0391b8bd4 JC Kuo              2020-02-12  1222  
fab7a0391b8bd4 JC Kuo              2020-02-12  1223  						usb3-3 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1224  							nvidia,function = "xusb";
fab7a0391b8bd4 JC Kuo              2020-02-12  1225  							status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1226  							#phy-cells = <0>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1227  						};
fab7a0391b8bd4 JC Kuo              2020-02-12  1228  					};
fab7a0391b8bd4 JC Kuo              2020-02-12  1229  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1230  			};
fab7a0391b8bd4 JC Kuo              2020-02-12  1231  
fab7a0391b8bd4 JC Kuo              2020-02-12  1232  			ports {
fab7a0391b8bd4 JC Kuo              2020-02-12  1233  				usb2-0 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1234  					status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1235  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1236  
fab7a0391b8bd4 JC Kuo              2020-02-12  1237  				usb2-1 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1238  					status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1239  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1240  
fab7a0391b8bd4 JC Kuo              2020-02-12  1241  				usb2-2 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1242  					status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1243  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1244  
fab7a0391b8bd4 JC Kuo              2020-02-12  1245  				usb2-3 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1246  					status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1247  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1248  
fab7a0391b8bd4 JC Kuo              2020-02-12  1249  				usb3-0 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1250  					status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1251  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1252  
fab7a0391b8bd4 JC Kuo              2020-02-12  1253  				usb3-1 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1254  					status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1255  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1256  
fab7a0391b8bd4 JC Kuo              2020-02-12  1257  				usb3-2 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1258  					status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1259  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1260  
fab7a0391b8bd4 JC Kuo              2020-02-12  1261  				usb3-3 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1262  					status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1263  				};
fab7a0391b8bd4 JC Kuo              2020-02-12  1264  			};
fab7a0391b8bd4 JC Kuo              2020-02-12  1265  		};
fab7a0391b8bd4 JC Kuo              2020-02-12  1266  
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1267  		usb@3550000 {
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1268  			compatible = "nvidia,tegra194-xudc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1269  			reg = <0x0 0x03550000 0x0 0x8000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1270  			      <0x0 0x03558000 0x0 0x1000>;
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1271  			reg-names = "base", "fpci";
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1272  			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1273  			clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_DEV>,
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1274  				 <&bpmp TEGRA194_CLK_XUSB_CORE_SS>,
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1275  				 <&bpmp TEGRA194_CLK_XUSB_SS>,
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1276  				 <&bpmp TEGRA194_CLK_XUSB_FS>;
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1277  			clock-names = "dev", "ss", "ss_src", "fs_src";
c667dcd4dfcd51 Thierry Reding      2021-07-08  1278  			interconnects = <&mc TEGRA194_MEMORY_CLIENT_XUSB_DEVR &emc>,
c667dcd4dfcd51 Thierry Reding      2021-07-08  1279  					<&mc TEGRA194_MEMORY_CLIENT_XUSB_DEVW &emc>;
c667dcd4dfcd51 Thierry Reding      2021-07-08  1280  			interconnect-names = "dma-mem", "write";
c667dcd4dfcd51 Thierry Reding      2021-07-08  1281  			iommus = <&smmu TEGRA194_SID_XUSB_DEV>;
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1282  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBB>,
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1283  					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1284  			power-domain-names = "dev", "ss";
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1285  			nvidia,xusb-padctl = <&xusb_padctl>;
f19bb95dc53169 Jon Hunter          2023-01-19  1286  			dma-coherent;
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1287  			status = "disabled";
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1288  		};
bc8788b2f3a0c1 Nagarjuna Kristam   2020-04-16  1289  
fab7a0391b8bd4 JC Kuo              2020-02-12  1290  		usb@3610000 {
fab7a0391b8bd4 JC Kuo              2020-02-12  1291  			compatible = "nvidia,tegra194-xusb";
2838cfddbc1c4e Thierry Reding      2022-11-17  1292  			reg = <0x0 0x03610000 0x0 0x40000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1293  			      <0x0 0x03600000 0x0 0x10000>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1294  			reg-names = "hcd", "fpci";
fab7a0391b8bd4 JC Kuo              2020-02-12  1295  
fab7a0391b8bd4 JC Kuo              2020-02-12  1296  			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
a57421390def6c Thierry Reding      2020-06-12  1297  				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1298  
fab7a0391b8bd4 JC Kuo              2020-02-12  1299  			clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_HOST>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1300  				 <&bpmp TEGRA194_CLK_XUSB_FALCON>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1301  				 <&bpmp TEGRA194_CLK_XUSB_CORE_SS>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1302  				 <&bpmp TEGRA194_CLK_XUSB_SS>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1303  				 <&bpmp TEGRA194_CLK_CLK_M>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1304  				 <&bpmp TEGRA194_CLK_XUSB_FS>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1305  				 <&bpmp TEGRA194_CLK_UTMIPLL>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1306  				 <&bpmp TEGRA194_CLK_CLK_M>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1307  				 <&bpmp TEGRA194_CLK_PLLE>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1308  			clock-names = "xusb_host", "xusb_falcon_src",
fab7a0391b8bd4 JC Kuo              2020-02-12  1309  				      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
fab7a0391b8bd4 JC Kuo              2020-02-12  1310  				      "xusb_fs_src", "pll_u_480m", "clk_m",
fab7a0391b8bd4 JC Kuo              2020-02-12  1311  				      "pll_e";
c667dcd4dfcd51 Thierry Reding      2021-07-08  1312  			interconnects = <&mc TEGRA194_MEMORY_CLIENT_XUSB_HOSTR &emc>,
c667dcd4dfcd51 Thierry Reding      2021-07-08  1313  					<&mc TEGRA194_MEMORY_CLIENT_XUSB_HOSTW &emc>;
c667dcd4dfcd51 Thierry Reding      2021-07-08  1314  			interconnect-names = "dma-mem", "write";
c667dcd4dfcd51 Thierry Reding      2021-07-08  1315  			iommus = <&smmu TEGRA194_SID_XUSB_HOST>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1316  
fab7a0391b8bd4 JC Kuo              2020-02-12  1317  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBC>,
fab7a0391b8bd4 JC Kuo              2020-02-12  1318  					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1319  			power-domain-names = "xusb_host", "xusb_ss";
fab7a0391b8bd4 JC Kuo              2020-02-12  1320  
fab7a0391b8bd4 JC Kuo              2020-02-12  1321  			nvidia,xusb-padctl = <&xusb_padctl>;
fab7a0391b8bd4 JC Kuo              2020-02-12  1322  			status = "disabled";
fab7a0391b8bd4 JC Kuo              2020-02-12  1323  		};
fab7a0391b8bd4 JC Kuo              2020-02-12  1324  
09903c5e07ac1f JC Kuo              2020-01-03  1325  		fuse@3820000 {
09903c5e07ac1f JC Kuo              2020-01-03  1326  			compatible = "nvidia,tegra194-efuse";
2838cfddbc1c4e Thierry Reding      2022-11-17  1327  			reg = <0x0 0x03820000 0x0 0x10000>;
09903c5e07ac1f JC Kuo              2020-01-03  1328  			clocks = <&bpmp TEGRA194_CLK_FUSE>;
09903c5e07ac1f JC Kuo              2020-01-03  1329  			clock-names = "fuse";
09903c5e07ac1f JC Kuo              2020-01-03  1330  		};
09903c5e07ac1f JC Kuo              2020-01-03  1331  
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1332  		gic: interrupt-controller@3881000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1333  			compatible = "arm,gic-400";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1334  			#interrupt-cells = <3>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1335  			interrupt-controller;
2838cfddbc1c4e Thierry Reding      2022-11-17  1336  			reg = <0x0 0x03881000 0x0 0x1000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1337  			      <0x0 0x03882000 0x0 0x2000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1338  			      <0x0 0x03884000 0x0 0x2000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1339  			      <0x0 0x03886000 0x0 0x2000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1340  			interrupts = <GIC_PPI 9
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1341  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1342  			interrupt-parent = <&gic>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1343  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1344  
badb80bed04136 Thierry Reding      2018-12-06  1345  		cec@3960000 {
34ff0bfda6f296 Aaron Kling         2025-04-13  1346  			compatible = "nvidia,tegra194-cec", "nvidia,tegra210-cec";
2838cfddbc1c4e Thierry Reding      2022-11-17  1347  			reg = <0x0 0x03960000 0x0 0x10000>;
badb80bed04136 Thierry Reding      2018-12-06  1348  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
badb80bed04136 Thierry Reding      2018-12-06  1349  			clocks = <&bpmp TEGRA194_CLK_CEC>;
badb80bed04136 Thierry Reding      2018-12-06  1350  			clock-names = "cec";
badb80bed04136 Thierry Reding      2018-12-06  1351  			status = "disabled";
badb80bed04136 Thierry Reding      2018-12-06  1352  		};
badb80bed04136 Thierry Reding      2018-12-06  1353  
8fbd2d11891738 Dipen Patel         2022-11-03  1354  		hte_lic: hardware-timestamp@3aa0000 {
8fbd2d11891738 Dipen Patel         2022-11-03  1355  			compatible = "nvidia,tegra194-gte-lic";
2838cfddbc1c4e Thierry Reding      2022-11-17  1356  			reg = <0x0 0x3aa0000 0x0 0x10000>;
8fbd2d11891738 Dipen Patel         2022-11-03  1357  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
8fbd2d11891738 Dipen Patel         2022-11-03  1358  			nvidia,int-threshold = <1>;
8fbd2d11891738 Dipen Patel         2022-11-03  1359  			nvidia,slices = <11>;
8fbd2d11891738 Dipen Patel         2022-11-03  1360  			#timestamp-cells = <1>;
8fbd2d11891738 Dipen Patel         2022-11-03  1361  			status = "okay";
8fbd2d11891738 Dipen Patel         2022-11-03  1362  		};
8fbd2d11891738 Dipen Patel         2022-11-03  1363  
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1364  		hsp_top0: hsp@3c00000 {
cd6157c1978c84 Thierry Reding      2021-12-07  1365  			compatible = "nvidia,tegra194-hsp";
2838cfddbc1c4e Thierry Reding      2022-11-17  1366  			reg = <0x0 0x03c00000 0x0 0xa0000>;
a38570c22e9d06 Mikko Perttunen     2018-11-28  1367  			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1368  			             <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1369  			             <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1370  			             <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1371  			             <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1372  			             <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1373  			             <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1374  			             <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1375  			             <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
a38570c22e9d06 Mikko Perttunen     2018-11-28  1376  			interrupt-names = "doorbell", "shared0", "shared1", "shared2",
a38570c22e9d06 Mikko Perttunen     2018-11-28  1377  			                  "shared3", "shared4", "shared5", "shared6",
a38570c22e9d06 Mikko Perttunen     2018-11-28  1378  			                  "shared7";
a38570c22e9d06 Mikko Perttunen     2018-11-28  1379  			#mbox-cells = <2>;
a38570c22e9d06 Mikko Perttunen     2018-11-28  1380  		};
a38570c22e9d06 Mikko Perttunen     2018-11-28  1381  
2602c32f15e717 Vidya Sagar         2019-06-12  1382  		p2u_hsio_0: phy@3e10000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1383  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1384  			reg = <0x0 0x03e10000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1385  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1386  
2602c32f15e717 Vidya Sagar         2019-06-12  1387  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1388  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1389  
2602c32f15e717 Vidya Sagar         2019-06-12  1390  		p2u_hsio_1: phy@3e20000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1391  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1392  			reg = <0x0 0x03e20000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1393  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1394  
2602c32f15e717 Vidya Sagar         2019-06-12  1395  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1396  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1397  
2602c32f15e717 Vidya Sagar         2019-06-12  1398  		p2u_hsio_2: phy@3e30000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1399  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1400  			reg = <0x0 0x03e30000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1401  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1402  
2602c32f15e717 Vidya Sagar         2019-06-12  1403  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1404  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1405  
2602c32f15e717 Vidya Sagar         2019-06-12  1406  		p2u_hsio_3: phy@3e40000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1407  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1408  			reg = <0x0 0x03e40000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1409  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1410  
2602c32f15e717 Vidya Sagar         2019-06-12  1411  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1412  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1413  
2602c32f15e717 Vidya Sagar         2019-06-12  1414  		p2u_hsio_4: phy@3e50000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1415  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1416  			reg = <0x0 0x03e50000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1417  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1418  
2602c32f15e717 Vidya Sagar         2019-06-12  1419  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1420  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1421  
2602c32f15e717 Vidya Sagar         2019-06-12  1422  		p2u_hsio_5: phy@3e60000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1423  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1424  			reg = <0x0 0x03e60000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1425  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1426  
2602c32f15e717 Vidya Sagar         2019-06-12  1427  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1428  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1429  
2602c32f15e717 Vidya Sagar         2019-06-12  1430  		p2u_hsio_6: phy@3e70000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1431  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1432  			reg = <0x0 0x03e70000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1433  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1434  
2602c32f15e717 Vidya Sagar         2019-06-12  1435  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1436  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1437  
2602c32f15e717 Vidya Sagar         2019-06-12  1438  		p2u_hsio_7: phy@3e80000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1439  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1440  			reg = <0x0 0x03e80000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1441  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1442  
2602c32f15e717 Vidya Sagar         2019-06-12  1443  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1444  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1445  
2602c32f15e717 Vidya Sagar         2019-06-12  1446  		p2u_hsio_8: phy@3e90000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1447  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1448  			reg = <0x0 0x03e90000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1449  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1450  
2602c32f15e717 Vidya Sagar         2019-06-12  1451  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1452  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1453  
2602c32f15e717 Vidya Sagar         2019-06-12  1454  		p2u_hsio_9: phy@3ea0000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1455  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1456  			reg = <0x0 0x03ea0000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1457  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1458  
2602c32f15e717 Vidya Sagar         2019-06-12  1459  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1460  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1461  
2602c32f15e717 Vidya Sagar         2019-06-12  1462  		p2u_nvhs_0: phy@3eb0000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1463  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1464  			reg = <0x0 0x03eb0000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1465  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1466  
2602c32f15e717 Vidya Sagar         2019-06-12  1467  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1468  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1469  
2602c32f15e717 Vidya Sagar         2019-06-12  1470  		p2u_nvhs_1: phy@3ec0000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1471  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1472  			reg = <0x0 0x03ec0000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1473  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1474  
2602c32f15e717 Vidya Sagar         2019-06-12  1475  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1476  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1477  
2602c32f15e717 Vidya Sagar         2019-06-12  1478  		p2u_nvhs_2: phy@3ed0000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1479  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1480  			reg = <0x0 0x03ed0000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1481  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1482  
2602c32f15e717 Vidya Sagar         2019-06-12  1483  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1484  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1485  
2602c32f15e717 Vidya Sagar         2019-06-12  1486  		p2u_nvhs_3: phy@3ee0000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1487  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1488  			reg = <0x0 0x03ee0000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1489  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1490  
2602c32f15e717 Vidya Sagar         2019-06-12  1491  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1492  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1493  
2602c32f15e717 Vidya Sagar         2019-06-12  1494  		p2u_nvhs_4: phy@3ef0000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1495  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1496  			reg = <0x0 0x03ef0000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1497  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1498  
2602c32f15e717 Vidya Sagar         2019-06-12  1499  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1500  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1501  
2602c32f15e717 Vidya Sagar         2019-06-12  1502  		p2u_nvhs_5: phy@3f00000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1503  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1504  			reg = <0x0 0x03f00000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1505  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1506  
2602c32f15e717 Vidya Sagar         2019-06-12  1507  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1508  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1509  
2602c32f15e717 Vidya Sagar         2019-06-12  1510  		p2u_nvhs_6: phy@3f10000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1511  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1512  			reg = <0x0 0x03f10000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1513  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1514  
2602c32f15e717 Vidya Sagar         2019-06-12  1515  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1516  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1517  
2602c32f15e717 Vidya Sagar         2019-06-12  1518  		p2u_nvhs_7: phy@3f20000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1519  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1520  			reg = <0x0 0x03f20000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1521  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1522  
2602c32f15e717 Vidya Sagar         2019-06-12  1523  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1524  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1525  
2602c32f15e717 Vidya Sagar         2019-06-12  1526  		p2u_hsio_10: phy@3f30000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1527  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1528  			reg = <0x0 0x03f30000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1529  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1530  
2602c32f15e717 Vidya Sagar         2019-06-12  1531  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1532  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1533  
2602c32f15e717 Vidya Sagar         2019-06-12  1534  		p2u_hsio_11: phy@3f40000 {
2602c32f15e717 Vidya Sagar         2019-06-12  1535  			compatible = "nvidia,tegra194-p2u";
2838cfddbc1c4e Thierry Reding      2022-11-17  1536  			reg = <0x0 0x03f40000 0x0 0x10000>;
2602c32f15e717 Vidya Sagar         2019-06-12  1537  			reg-names = "ctl";
2602c32f15e717 Vidya Sagar         2019-06-12  1538  
2602c32f15e717 Vidya Sagar         2019-06-12  1539  			#phy-cells = <0>;
2602c32f15e717 Vidya Sagar         2019-06-12  1540  		};
2602c32f15e717 Vidya Sagar         2019-06-12  1541  
a47e173e5d1ceb Sumit Gupta         2022-05-12  1542  		sce-noc@b600000 {
a47e173e5d1ceb Sumit Gupta         2022-05-12  1543  			compatible = "nvidia,tegra194-sce-noc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1544  			reg = <0x0 0xb600000 0x0 0x1000>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1545  			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
a47e173e5d1ceb Sumit Gupta         2022-05-12  1546  				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1547  			nvidia,axi2apb = <&axi2apb>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1548  			nvidia,apbmisc = <&apbmisc>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1549  			status = "okay";
a47e173e5d1ceb Sumit Gupta         2022-05-12  1550  		};
a47e173e5d1ceb Sumit Gupta         2022-05-12  1551  
a47e173e5d1ceb Sumit Gupta         2022-05-12  1552  		rce-noc@be00000 {
a47e173e5d1ceb Sumit Gupta         2022-05-12  1553  			compatible = "nvidia,tegra194-rce-noc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1554  			reg = <0x0 0xbe00000 0x0 0x1000>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1555  			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
a47e173e5d1ceb Sumit Gupta         2022-05-12  1556  				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1557  			nvidia,axi2apb = <&axi2apb>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1558  			nvidia,apbmisc = <&apbmisc>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1559  			status = "okay";
a47e173e5d1ceb Sumit Gupta         2022-05-12  1560  		};
a47e173e5d1ceb Sumit Gupta         2022-05-12  1561  
a38570c22e9d06 Mikko Perttunen     2018-11-28  1562  		hsp_aon: hsp@c150000 {
cd6157c1978c84 Thierry Reding      2021-12-07  1563  			compatible = "nvidia,tegra194-hsp";
2838cfddbc1c4e Thierry Reding      2022-11-17  1564  			reg = <0x0 0x0c150000 0x0 0x90000>;
a38570c22e9d06 Mikko Perttunen     2018-11-28  1565  			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1566  			             <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1567  			             <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
a38570c22e9d06 Mikko Perttunen     2018-11-28  1568  			             <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
a38570c22e9d06 Mikko Perttunen     2018-11-28  1569  			/*
a38570c22e9d06 Mikko Perttunen     2018-11-28  1570  			 * Shared interrupt 0 is routed only to AON/SPE, so
a38570c22e9d06 Mikko Perttunen     2018-11-28  1571  			 * we only have 4 shared interrupts for the CCPLEX.
a38570c22e9d06 Mikko Perttunen     2018-11-28  1572  			 */
a38570c22e9d06 Mikko Perttunen     2018-11-28  1573  			interrupt-names = "shared1", "shared2", "shared3", "shared4";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1574  			#mbox-cells = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1575  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1576  
8fbd2d11891738 Dipen Patel         2022-11-03  1577  		hte_aon: hardware-timestamp@c1e0000 {
8fbd2d11891738 Dipen Patel         2022-11-03  1578  			compatible = "nvidia,tegra194-gte-aon";
2838cfddbc1c4e Thierry Reding      2022-11-17  1579  			reg = <0x0 0xc1e0000 0x0 0x10000>;
8fbd2d11891738 Dipen Patel         2022-11-03  1580  			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
8fbd2d11891738 Dipen Patel         2022-11-03  1581  			nvidia,int-threshold = <1>;
8fbd2d11891738 Dipen Patel         2022-11-03  1582  			nvidia,slices = <3>;
8fbd2d11891738 Dipen Patel         2022-11-03  1583  			#timestamp-cells = <1>;
8fbd2d11891738 Dipen Patel         2022-11-03  1584  			status = "okay";
8fbd2d11891738 Dipen Patel         2022-11-03  1585  		};
8fbd2d11891738 Dipen Patel         2022-11-03  1586  
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1587  		gen2_i2c: i2c@c240000 {
d9fd22447ba59a Thierry Reding      2018-09-21  1588  			compatible = "nvidia,tegra194-i2c";
2838cfddbc1c4e Thierry Reding      2022-11-17  1589  			reg = <0x0 0x0c240000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1590  			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1591  			#address-cells = <1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1592  			#size-cells = <0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1593  			clocks = <&bpmp TEGRA194_CLK_I2C2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1594  			clock-names = "div-clk";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1595  			resets = <&bpmp TEGRA194_RESET_I2C2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1596  			reset-names = "i2c";
8e4428051df12f Akhil R             2022-09-06  1597  			dmas = <&gpcdma 22>, <&gpcdma 22>;
8e4428051df12f Akhil R             2022-09-06  1598  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1599  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1600  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1601  
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1602  		gen8_i2c: i2c@c250000 {
d9fd22447ba59a Thierry Reding      2018-09-21  1603  			compatible = "nvidia,tegra194-i2c";
2838cfddbc1c4e Thierry Reding      2022-11-17  1604  			reg = <0x0 0x0c250000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1605  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1606  			#address-cells = <1>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1607  			#size-cells = <0>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1608  			clocks = <&bpmp TEGRA194_CLK_I2C8>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1609  			clock-names = "div-clk";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1610  			resets = <&bpmp TEGRA194_RESET_I2C8>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1611  			reset-names = "i2c";
8e4428051df12f Akhil R             2022-09-06  1612  			dmas = <&gpcdma 0>, <&gpcdma 0>;
8e4428051df12f Akhil R             2022-09-06  1613  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1614  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1615  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1616  
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1617  		uartc: serial@c280000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1618  			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
2838cfddbc1c4e Thierry Reding      2022-11-17  1619  			reg = <0x0 0x0c280000 0x0 0x40>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1620  			reg-shift = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1621  			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1622  			clocks = <&bpmp TEGRA194_CLK_UARTC>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1623  			resets = <&bpmp TEGRA194_RESET_UARTC>;
39e1cbf57e3034 Aaron Kling         2025-04-28  1624  			dmas = <&gpcdma 3>, <&gpcdma 3>;
39e1cbf57e3034 Aaron Kling         2025-04-28  1625  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1626  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1627  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1628  
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1629  		uartg: serial@c290000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1630  			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
2838cfddbc1c4e Thierry Reding      2022-11-17  1631  			reg = <0x0 0x0c290000 0x0 0x40>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1632  			reg-shift = <2>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1633  			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1634  			clocks = <&bpmp TEGRA194_CLK_UARTG>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1635  			resets = <&bpmp TEGRA194_RESET_UARTG>;
39e1cbf57e3034 Aaron Kling         2025-04-28  1636  			dmas = <&gpcdma 2>, <&gpcdma 2>;
39e1cbf57e3034 Aaron Kling         2025-04-28  1637  			dma-names = "rx", "tx";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1638  			status = "disabled";
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1639  		};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1640  
37e5a31df5431c Thierry Reding      2018-11-28  1641  		rtc: rtc@c2a0000 {
37e5a31df5431c Thierry Reding      2018-11-28  1642  			compatible = "nvidia,tegra194-rtc", "nvidia,tegra20-rtc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1643  			reg = <0x0 0x0c2a0000 0x0 0x10000>;
37e5a31df5431c Thierry Reding      2018-11-28  1644  			interrupt-parent = <&pmc>;
37e5a31df5431c Thierry Reding      2018-11-28  1645  			interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
37e5a31df5431c Thierry Reding      2018-11-28  1646  			clocks = <&bpmp TEGRA194_CLK_CLK_32K>;
37e5a31df5431c Thierry Reding      2018-11-28  1647  			clock-names = "rtc";
37e5a31df5431c Thierry Reding      2018-11-28  1648  			status = "disabled";
37e5a31df5431c Thierry Reding      2018-11-28  1649  		};
37e5a31df5431c Thierry Reding      2018-11-28  1650  
4d286331bdee4b Thierry Reding      2018-11-28  1651  		gpio_aon: gpio@c2f0000 {
4d286331bdee4b Thierry Reding      2018-11-28  1652  			compatible = "nvidia,tegra194-gpio-aon";
4d286331bdee4b Thierry Reding      2018-11-28  1653  			reg-names = "security", "gpio";
2838cfddbc1c4e Thierry Reding      2022-11-17  1654  			reg = <0x0 0xc2f0000 0x0 0x1000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1655  			      <0x0 0xc2f1000 0x0 0x1000>;
0a85cf288a7482 pshete              2021-09-07  1656  			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07  1657  				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07  1658  				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
0a85cf288a7482 pshete              2021-09-07  1659  				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
4d286331bdee4b Thierry Reding      2018-11-28  1660  			gpio-controller;
4d286331bdee4b Thierry Reding      2018-11-28  1661  			#gpio-cells = <2>;
4d286331bdee4b Thierry Reding      2018-11-28  1662  			interrupt-controller;
4d286331bdee4b Thierry Reding      2018-11-28  1663  			#interrupt-cells = <2>;
979ac5ef58d12a Thierry Reding      2022-04-14  1664  			gpio-ranges = <&pinmux_aon 0 0 30>;
6f380a4ec04fc9 Thierry Reding      2022-11-04  1665  		};
6f380a4ec04fc9 Thierry Reding      2022-11-04  1666  
6f380a4ec04fc9 Thierry Reding      2022-11-04  1667  		pinmux_aon: pinmux@c300000 {
6f380a4ec04fc9 Thierry Reding      2022-11-04  1668  			compatible = "nvidia,tegra194-pinmux-aon";
2838cfddbc1c4e Thierry Reding      2022-11-17  1669  			reg = <0x0 0xc300000 0x0 0x4000>;
6f380a4ec04fc9 Thierry Reding      2022-11-04  1670  
6f380a4ec04fc9 Thierry Reding      2022-11-04  1671  			status = "okay";
4d286331bdee4b Thierry Reding      2018-11-28  1672  		};
4d286331bdee4b Thierry Reding      2018-11-28  1673  
6a574ec70c52c9 Thierry Reding      2018-09-21  1674  		pwm4: pwm@c340000 {
6a574ec70c52c9 Thierry Reding      2018-09-21  1675  			compatible = "nvidia,tegra194-pwm",
6a574ec70c52c9 Thierry Reding      2018-09-21  1676  				     "nvidia,tegra186-pwm";
2838cfddbc1c4e Thierry Reding      2022-11-17  1677  			reg = <0x0 0xc340000 0x0 0x10000>;
6a574ec70c52c9 Thierry Reding      2018-09-21  1678  			clocks = <&bpmp TEGRA194_CLK_PWM4>;
6a574ec70c52c9 Thierry Reding      2018-09-21  1679  			resets = <&bpmp TEGRA194_RESET_PWM4>;
6a574ec70c52c9 Thierry Reding      2018-09-21  1680  			reset-names = "pwm";
6a574ec70c52c9 Thierry Reding      2018-09-21  1681  			status = "disabled";
6a574ec70c52c9 Thierry Reding      2018-09-21  1682  			#pwm-cells = <2>;
6a574ec70c52c9 Thierry Reding      2018-09-21  1683  		};
6a574ec70c52c9 Thierry Reding      2018-09-21  1684  
38ecf1e5f47167 Thierry Reding      2018-11-28  1685  		pmc: pmc@c360000 {
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1686  			compatible = "nvidia,tegra194-pmc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1687  			reg = <0x0 0x0c360000 0x0 0x10000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1688  			      <0x0 0x0c370000 0x0 0x10000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1689  			      <0x0 0x0c380000 0x0 0x10000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1690  			      <0x0 0x0c390000 0x0 0x10000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1691  			      <0x0 0x0c3a0000 0x0 0x10000>;
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1692  			reg-names = "pmc", "wake", "aotag", "scratch", "misc";
38ecf1e5f47167 Thierry Reding      2018-11-28  1693  
38ecf1e5f47167 Thierry Reding      2018-11-28  1694  			#interrupt-cells = <2>;
38ecf1e5f47167 Thierry Reding      2018-11-28  1695  			interrupt-controller;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1696  
ff21087e6131e7 Prathamesh Shete    2021-11-16  1697  			sdmmc1_1v8: sdmmc1-1v8 {
ff21087e6131e7 Prathamesh Shete    2021-11-16  1698  				pins = "sdmmc1-hv";
ff21087e6131e7 Prathamesh Shete    2021-11-16  1699  				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1700  			};
79ed18d9ece474 Thierry Reding      2022-11-22  1701  
79ed18d9ece474 Thierry Reding      2022-11-22  1702  			sdmmc1_3v3: sdmmc1-3v3 {
79ed18d9ece474 Thierry Reding      2022-11-22  1703  				pins = "sdmmc1-hv";
ff21087e6131e7 Prathamesh Shete    2021-11-16  1704  				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1705  			};
ff21087e6131e7 Prathamesh Shete    2021-11-16  1706  
ff21087e6131e7 Prathamesh Shete    2021-11-16  1707  			sdmmc3_1v8: sdmmc3-1v8 {
ff21087e6131e7 Prathamesh Shete    2021-11-16  1708  				pins = "sdmmc3-hv";
ff21087e6131e7 Prathamesh Shete    2021-11-16  1709  				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
ff21087e6131e7 Prathamesh Shete    2021-11-16  1710  			};
ff21087e6131e7 Prathamesh Shete    2021-11-16  1711  
79ed18d9ece474 Thierry Reding      2022-11-22  1712  			sdmmc3_3v3: sdmmc3-3v3 {
79ed18d9ece474 Thierry Reding      2022-11-22  1713  				pins = "sdmmc3-hv";
79ed18d9ece474 Thierry Reding      2022-11-22  1714  				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
79ed18d9ece474 Thierry Reding      2022-11-22  1715  			};
5425fb15d8ee64 Mikko Perttunen     2018-02-20  1716  		};
3db6d3ba0863f4 Thierry Reding      2018-11-23  1717  
a47e173e5d1ceb Sumit Gupta         2022-05-12  1718  		aon-noc@c600000 {
a47e173e5d1ceb Sumit Gupta         2022-05-12  1719  			compatible = "nvidia,tegra194-aon-noc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1720  			reg = <0x0 0xc600000 0x0 0x1000>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1721  			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
a47e173e5d1ceb Sumit Gupta         2022-05-12  1722  				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1723  			nvidia,apbmisc = <&apbmisc>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1724  			status = "okay";
a47e173e5d1ceb Sumit Gupta         2022-05-12  1725  		};
a47e173e5d1ceb Sumit Gupta         2022-05-12  1726  
a47e173e5d1ceb Sumit Gupta         2022-05-12  1727  		bpmp-noc@d600000 {
a47e173e5d1ceb Sumit Gupta         2022-05-12  1728  			compatible = "nvidia,tegra194-bpmp-noc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1729  			reg = <0x0 0xd600000 0x0 0x1000>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1730  			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
a47e173e5d1ceb Sumit Gupta         2022-05-12  1731  				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1732  			nvidia,axi2apb = <&axi2apb>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1733  			nvidia,apbmisc = <&apbmisc>;
a47e173e5d1ceb Sumit Gupta         2022-05-12  1734  			status = "okay";
a47e173e5d1ceb Sumit Gupta         2022-05-12  1735  		};
a47e173e5d1ceb Sumit Gupta         2022-05-12  1736  
e762232f946679 Jon Hunter          2021-12-01  1737  		iommu@10000000 {
e762232f946679 Jon Hunter          2021-12-01  1738  			compatible = "nvidia,tegra194-smmu", "nvidia,smmu-500";
2838cfddbc1c4e Thierry Reding      2022-11-17  1739  			reg = <0x0 0x10000000 0x0 0x800000>;
e762232f946679 Jon Hunter          2021-12-01  1740  			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1741  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1742  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1743  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1744  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1745  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1746  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1747  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1748  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1749  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1750  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1751  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1752  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1753  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1754  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1755  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1756  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1757  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1758  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1759  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1760  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1761  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1762  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1763  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1764  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1765  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1766  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1767  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1768  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1769  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1770  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1771  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1772  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1773  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1774  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1775  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1776  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1777  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1778  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1779  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1780  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1781  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1782  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1783  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1784  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1785  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1786  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1787  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1788  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1789  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1790  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1791  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1792  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1793  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1794  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1795  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1796  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1797  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1798  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1799  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1800  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1801  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1802  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1803  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
e762232f946679 Jon Hunter          2021-12-01  1804  				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
e762232f946679 Jon Hunter          2021-12-01  1805  			stream-match-mask = <0x7f80>;
e762232f946679 Jon Hunter          2021-12-01  1806  			#global-interrupts = <1>;
e762232f946679 Jon Hunter          2021-12-01  1807  			#iommu-cells = <1>;
e762232f946679 Jon Hunter          2021-12-01  1808  
e762232f946679 Jon Hunter          2021-12-01  1809  			nvidia,memory-controller = <&mc>;
ebea268ea583ba Jon Hunter          2022-01-13  1810  			status = "disabled";
e762232f946679 Jon Hunter          2021-12-01  1811  		};
e762232f946679 Jon Hunter          2021-12-01  1812  
c7289b1c8a4e10 Thierry Reding      2021-06-03  1813  		smmu: iommu@12000000 {
c7289b1c8a4e10 Thierry Reding      2021-06-03  1814  			compatible = "nvidia,tegra194-smmu", "nvidia,smmu-500";
2838cfddbc1c4e Thierry Reding      2022-11-17  1815  			reg = <0x0 0x12000000 0x0 0x800000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1816  			      <0x0 0x11000000 0x0 0x800000>;
c7289b1c8a4e10 Thierry Reding      2021-06-03  1817  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1818  				     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1819  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1820  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1821  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1822  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1823  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1824  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1825  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1826  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1827  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1828  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1829  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1830  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1831  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1832  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1833  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1834  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1835  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1836  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1837  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1838  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1839  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1840  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1841  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1842  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1843  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1844  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1845  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1846  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1847  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1848  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1849  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1850  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1851  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1852  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1853  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1854  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1855  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1856  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1857  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1858  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1859  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1860  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1861  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1862  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1863  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1864  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1865  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1866  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1867  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1868  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1869  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1870  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1871  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1872  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1873  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1874  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1875  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1876  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1877  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1878  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1879  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1880  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1881  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
c7289b1c8a4e10 Thierry Reding      2021-06-03  1882  				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
c7289b1c8a4e10 Thierry Reding      2021-06-03  1883  			stream-match-mask = <0x7f80>;
c7289b1c8a4e10 Thierry Reding      2021-06-03  1884  			#global-interrupts = <2>;
c7289b1c8a4e10 Thierry Reding      2021-06-03  1885  			#iommu-cells = <1>;
c7289b1c8a4e10 Thierry Reding      2021-06-03  1886  
c7289b1c8a4e10 Thierry Reding      2021-06-03  1887  			nvidia,memory-controller = <&mc>;
c7289b1c8a4e10 Thierry Reding      2021-06-03  1888  			status = "okay";
c7289b1c8a4e10 Thierry Reding      2021-06-03  1889  		};
c7289b1c8a4e10 Thierry Reding      2021-06-03  1890  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1891  		host1x@13e00000 {
ef126bc4f3d450 Thierry Reding      2020-06-12  1892  			compatible = "nvidia,tegra194-host1x";
2838cfddbc1c4e Thierry Reding      2022-11-17  1893  			reg = <0x0 0x13e00000 0x0 0x10000>,
2838cfddbc1c4e Thierry Reding      2022-11-17  1894  			      <0x0 0x13e10000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1895  			reg-names = "hypervisor", "vm";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1896  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  1897  				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
052d3f6523044c Thierry Reding      2020-02-07  1898  			interrupt-names = "syncpt", "host1x";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1899  			clocks = <&bpmp TEGRA194_CLK_HOST1X>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1900  			clock-names = "host1x";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1901  			resets = <&bpmp TEGRA194_RESET_HOST1X>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1902  			reset-names = "host1x";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1903  
2838cfddbc1c4e Thierry Reding      2022-11-17  1904  			#address-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17  1905  			#size-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17  1906  			ranges = <0x0 0x14800000 0x0 0x14800000 0x0 0x02800000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1907  
d5237c7c9bbee0 Thierry Reding      2019-12-13  1908  			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HOST1XDMAR &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1909  			interconnect-names = "dma-mem";
c7289b1c8a4e10 Thierry Reding      2021-06-03  1910  			iommus = <&smmu TEGRA194_SID_HOST1X>;
361238cdc52523 Mikko Perttunen     2023-01-19  1911  			dma-coherent;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1912  
e30cf1011b9615 Mikko Perttunen     2022-06-27  1913  			/* Context isolation domains */
b0c1a994f66050 Thierry Reding      2022-09-02  1914  			iommu-map = <0 &smmu TEGRA194_SID_HOST1X_CTX0 1>,
b0c1a994f66050 Thierry Reding      2022-09-02  1915  				    <1 &smmu TEGRA194_SID_HOST1X_CTX1 1>,
b0c1a994f66050 Thierry Reding      2022-09-02  1916  				    <2 &smmu TEGRA194_SID_HOST1X_CTX2 1>,
b0c1a994f66050 Thierry Reding      2022-09-02  1917  				    <3 &smmu TEGRA194_SID_HOST1X_CTX3 1>,
b0c1a994f66050 Thierry Reding      2022-09-02  1918  				    <4 &smmu TEGRA194_SID_HOST1X_CTX4 1>,
b0c1a994f66050 Thierry Reding      2022-09-02  1919  				    <5 &smmu TEGRA194_SID_HOST1X_CTX5 1>,
b0c1a994f66050 Thierry Reding      2022-09-02  1920  				    <6 &smmu TEGRA194_SID_HOST1X_CTX6 1>,
b0c1a994f66050 Thierry Reding      2022-09-02  1921  				    <7 &smmu TEGRA194_SID_HOST1X_CTX7 1>;
e30cf1011b9615 Mikko Perttunen     2022-06-27  1922  
78a058737b5e0e Mikko Perttunen     2021-09-16  1923  			nvdec@15140000 {
78a058737b5e0e Mikko Perttunen     2021-09-16  1924  				compatible = "nvidia,tegra194-nvdec";
2838cfddbc1c4e Thierry Reding      2022-11-17  1925  				reg = <0x0 0x15140000 0x0 0x00040000>;
78a058737b5e0e Mikko Perttunen     2021-09-16  1926  				clocks = <&bpmp TEGRA194_CLK_NVDEC1>;
78a058737b5e0e Mikko Perttunen     2021-09-16  1927  				clock-names = "nvdec";
78a058737b5e0e Mikko Perttunen     2021-09-16  1928  				resets = <&bpmp TEGRA194_RESET_NVDEC1>;
78a058737b5e0e Mikko Perttunen     2021-09-16  1929  				reset-names = "nvdec";
78a058737b5e0e Mikko Perttunen     2021-09-16  1930  
78a058737b5e0e Mikko Perttunen     2021-09-16  1931  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVDECB>;
78a058737b5e0e Mikko Perttunen     2021-09-16  1932  				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDEC1SRD &emc>,
78a058737b5e0e Mikko Perttunen     2021-09-16  1933  						<&mc TEGRA194_MEMORY_CLIENT_NVDEC1SRD1 &emc>,
78a058737b5e0e Mikko Perttunen     2021-09-16  1934  						<&mc TEGRA194_MEMORY_CLIENT_NVDEC1SWR &emc>;
78a058737b5e0e Mikko Perttunen     2021-09-16  1935  				interconnect-names = "dma-mem", "read-1", "write";
78a058737b5e0e Mikko Perttunen     2021-09-16  1936  				iommus = <&smmu TEGRA194_SID_NVDEC1>;
78a058737b5e0e Mikko Perttunen     2021-09-16  1937  				dma-coherent;
78a058737b5e0e Mikko Perttunen     2021-09-16  1938  
78a058737b5e0e Mikko Perttunen     2021-09-16  1939  				nvidia,host1x-class = <0xf5>;
78a058737b5e0e Mikko Perttunen     2021-09-16  1940  			};
78a058737b5e0e Mikko Perttunen     2021-09-16  1941  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1942  			display-hub@15200000 {
aa342b536d51e3 Thierry Reding      2020-06-12  1943  				compatible = "nvidia,tegra194-display";
2838cfddbc1c4e Thierry Reding      2022-11-17  1944  				reg = <0x0 0x15200000 0x0 0x00040000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1945  				resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_MISC>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  1946  					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP0>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  1947  					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP1>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  1948  					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP2>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  1949  					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP3>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  1950  					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP4>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  1951  					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP5>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1952  				reset-names = "misc", "wgrp0", "wgrp1", "wgrp2",
3db6d3ba0863f4 Thierry Reding      2018-11-23  1953  					      "wgrp3", "wgrp4", "wgrp5";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1954  				clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_DISP>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  1955  					 <&bpmp TEGRA194_CLK_NVDISPLAYHUB>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1956  				clock-names = "disp", "hub";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1957  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1958  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1959  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1960  
2838cfddbc1c4e Thierry Reding      2022-11-17  1961  				#address-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17  1962  				#size-cells = <2>;
2838cfddbc1c4e Thierry Reding      2022-11-17  1963  				ranges = <0x0 0x15200000 0x0 0x15200000 0x0 0x40000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1964  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1965  				display@15200000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  1966  					compatible = "nvidia,tegra194-dc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1967  					reg = <0x0 0x15200000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1968  					interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1969  					clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1970  					clock-names = "dc";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1971  					resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1972  					reset-names = "dc";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1973  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1974  					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1975  					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  1976  							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1977  					interconnect-names = "dma-mem", "read-1";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1978  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1979  					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1980  					nvidia,head = <0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1981  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  1982  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1983  				display@15210000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  1984  					compatible = "nvidia,tegra194-dc";
2838cfddbc1c4e Thierry Reding      2022-11-17  1985  					reg = <0x0 0x15210000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1986  					interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1987  					clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1988  					clock-names = "dc";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1989  					resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1990  					reset-names = "dc";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1991  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1992  					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1993  					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  1994  							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  1995  					interconnect-names = "dma-mem", "read-1";
3db6d3ba0863f4 Thierry Reding      2018-11-23  1996  
3db6d3ba0863f4 Thierry Reding      2018-11-23  1997  					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1998  					nvidia,head = <1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  1999  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2000  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2001  				display@15220000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2002  					compatible = "nvidia,tegra194-dc";
2838cfddbc1c4e Thierry Reding      2022-11-17  2003  					reg = <0x0 0x15220000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2004  					interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2005  					clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P2>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2006  					clock-names = "dc";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2007  					resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD2>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2008  					reset-names = "dc";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2009  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2010  					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  2011  					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  2012  							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  2013  					interconnect-names = "dma-mem", "read-1";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2014  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2015  					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2016  					nvidia,head = <2>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2017  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2018  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2019  				display@15230000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2020  					compatible = "nvidia,tegra194-dc";
2838cfddbc1c4e Thierry Reding      2022-11-17  2021  					reg = <0x0 0x15230000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2022  					interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2023  					clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2024  					clock-names = "dc";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2025  					resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2026  					reset-names = "dc";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2027  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2028  					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  2029  					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  2030  							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  2031  					interconnect-names = "dma-mem", "read-1";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2032  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2033  					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2034  					nvidia,head = <3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2035  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2036  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2037  
8d424ec221d0b7 Thierry Reding      2018-11-23  2038  			vic@15340000 {
8d424ec221d0b7 Thierry Reding      2018-11-23  2039  				compatible = "nvidia,tegra194-vic";
2838cfddbc1c4e Thierry Reding      2022-11-17  2040  				reg = <0x0 0x15340000 0x0 0x00040000>;
8d424ec221d0b7 Thierry Reding      2018-11-23  2041  				interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
8d424ec221d0b7 Thierry Reding      2018-11-23  2042  				clocks = <&bpmp TEGRA194_CLK_VIC>;
8d424ec221d0b7 Thierry Reding      2018-11-23  2043  				clock-names = "vic";
8d424ec221d0b7 Thierry Reding      2018-11-23  2044  				resets = <&bpmp TEGRA194_RESET_VIC>;
8d424ec221d0b7 Thierry Reding      2018-11-23  2045  				reset-names = "vic";
8d424ec221d0b7 Thierry Reding      2018-11-23  2046  
8d424ec221d0b7 Thierry Reding      2018-11-23  2047  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_VIC>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  2048  				interconnects = <&mc TEGRA194_MEMORY_CLIENT_VICSRD &emc>,
d5237c7c9bbee0 Thierry Reding      2019-12-13  2049  						<&mc TEGRA194_MEMORY_CLIENT_VICSWR &emc>;
d5237c7c9bbee0 Thierry Reding      2019-12-13  2050  				interconnect-names = "dma-mem", "write";
c7289b1c8a4e10 Thierry Reding      2021-06-03  2051  				iommus = <&smmu TEGRA194_SID_VIC>;
a52280c844c054 Jon Hunter          2021-10-25  2052  				dma-coherent;
8d424ec221d0b7 Thierry Reding      2018-11-23  2053  			};
78a058737b5e0e Mikko Perttunen     2021-09-16  2054  
f7eb2785728442 Jon Hunter          2021-11-17  2055  			nvjpg@15380000 {
f7eb2785728442 Jon Hunter          2021-11-17  2056  				compatible = "nvidia,tegra194-nvjpg";
2838cfddbc1c4e Thierry Reding      2022-11-17  2057  				reg = <0x0 0x15380000 0x0 0x40000>;
f7eb2785728442 Jon Hunter          2021-11-17  2058  				clocks = <&bpmp TEGRA194_CLK_NVJPG>;
f7eb2785728442 Jon Hunter          2021-11-17  2059  				clock-names = "nvjpg";
f7eb2785728442 Jon Hunter          2021-11-17  2060  				resets = <&bpmp TEGRA194_RESET_NVJPG>;
f7eb2785728442 Jon Hunter          2021-11-17  2061  				reset-names = "nvjpg";
f7eb2785728442 Jon Hunter          2021-11-17  2062  
f7eb2785728442 Jon Hunter          2021-11-17  2063  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVJPG>;
f7eb2785728442 Jon Hunter          2021-11-17  2064  				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVJPGSRD &emc>,
f7eb2785728442 Jon Hunter          2021-11-17  2065  						<&mc TEGRA194_MEMORY_CLIENT_NVJPGSWR &emc>;
f7eb2785728442 Jon Hunter          2021-11-17  2066  				interconnect-names = "dma-mem", "write";
f7eb2785728442 Jon Hunter          2021-11-17  2067  				iommus = <&smmu TEGRA194_SID_NVJPG>;
f7eb2785728442 Jon Hunter          2021-11-17  2068  				dma-coherent;
f7eb2785728442 Jon Hunter          2021-11-17  2069  			};
f7eb2785728442 Jon Hunter          2021-11-17  2070  
78a058737b5e0e Mikko Perttunen     2021-09-16  2071  			nvdec@15480000 {
78a058737b5e0e Mikko Perttunen     2021-09-16  2072  				compatible = "nvidia,tegra194-nvdec";
2838cfddbc1c4e Thierry Reding      2022-11-17  2073  				reg = <0x0 0x15480000 0x0 0x00040000>;
78a058737b5e0e Mikko Perttunen     2021-09-16  2074  				clocks = <&bpmp TEGRA194_CLK_NVDEC>;
78a058737b5e0e Mikko Perttunen     2021-09-16  2075  				clock-names = "nvdec";
78a058737b5e0e Mikko Perttunen     2021-09-16  2076  				resets = <&bpmp TEGRA194_RESET_NVDEC>;
78a058737b5e0e Mikko Perttunen     2021-09-16  2077  				reset-names = "nvdec";
78a058737b5e0e Mikko Perttunen     2021-09-16  2078  
78a058737b5e0e Mikko Perttunen     2021-09-16  2079  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVDECA>;
78a058737b5e0e Mikko Perttunen     2021-09-16  2080  				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD &emc>,
78a058737b5e0e Mikko Perttunen     2021-09-16  2081  						<&mc TEGRA194_MEMORY_CLIENT_NVDECSRD1 &emc>,
78a058737b5e0e Mikko Perttunen     2021-09-16  2082  						<&mc TEGRA194_MEMORY_CLIENT_NVDECSWR &emc>;
78a058737b5e0e Mikko Perttunen     2021-09-16  2083  				interconnect-names = "dma-mem", "read-1", "write";
78a058737b5e0e Mikko Perttunen     2021-09-16  2084  				iommus = <&smmu TEGRA194_SID_NVDEC>;
78a058737b5e0e Mikko Perttunen     2021-09-16  2085  				dma-coherent;
78a058737b5e0e Mikko Perttunen     2021-09-16  2086  
78a058737b5e0e Mikko Perttunen     2021-09-16  2087  				nvidia,host1x-class = <0xf0>;
78a058737b5e0e Mikko Perttunen     2021-09-16  2088  			};
8d424ec221d0b7 Thierry Reding      2018-11-23  2089  
f7eb2785728442 Jon Hunter          2021-11-17  2090  			nvenc@154c0000 {
f7eb2785728442 Jon Hunter          2021-11-17  2091  				compatible = "nvidia,tegra194-nvenc";
2838cfddbc1c4e Thierry Reding      2022-11-17  2092  				reg = <0x0 0x154c0000 0x0 0x40000>;
f7eb2785728442 Jon Hunter          2021-11-17  2093  				clocks = <&bpmp TEGRA194_CLK_NVENC>;
f7eb2785728442 Jon Hunter          2021-11-17  2094  				clock-names = "nvenc";
f7eb2785728442 Jon Hunter          2021-11-17  2095  				resets = <&bpmp TEGRA194_RESET_NVENC>;
f7eb2785728442 Jon Hunter          2021-11-17  2096  				reset-names = "nvenc";
f7eb2785728442 Jon Hunter          2021-11-17  2097  
f7eb2785728442 Jon Hunter          2021-11-17  2098  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVENCA>;
f7eb2785728442 Jon Hunter          2021-11-17  2099  				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVENCSRD &emc>,
f7eb2785728442 Jon Hunter          2021-11-17  2100  						<&mc TEGRA194_MEMORY_CLIENT_NVENCSRD1 &emc>,
f7eb2785728442 Jon Hunter          2021-11-17  2101  						<&mc TEGRA194_MEMORY_CLIENT_NVENCSWR &emc>;
f7eb2785728442 Jon Hunter          2021-11-17  2102  				interconnect-names = "dma-mem", "read-1", "write";
f7eb2785728442 Jon Hunter          2021-11-17  2103  				iommus = <&smmu TEGRA194_SID_NVENC>;
f7eb2785728442 Jon Hunter          2021-11-17  2104  				dma-coherent;
f7eb2785728442 Jon Hunter          2021-11-17  2105  
f7eb2785728442 Jon Hunter          2021-11-17  2106  				nvidia,host1x-class = <0x21>;
f7eb2785728442 Jon Hunter          2021-11-17  2107  			};
f7eb2785728442 Jon Hunter          2021-11-17  2108  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2109  			dpaux0: dpaux@155c0000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2110  				compatible = "nvidia,tegra194-dpaux";
2838cfddbc1c4e Thierry Reding      2022-11-17  2111  				reg = <0x0 0x155c0000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2112  				interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2113  				clocks = <&bpmp TEGRA194_CLK_DPAUX>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2114  					 <&bpmp TEGRA194_CLK_PLLDP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2115  				clock-names = "dpaux", "parent";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2116  				resets = <&bpmp TEGRA194_RESET_DPAUX>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2117  				reset-names = "dpaux";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2118  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2119  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2120  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2121  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2122  				state_dpaux0_aux: pinmux-aux {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2123  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2124  					function = "aux";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2125  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2126  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2127  				state_dpaux0_i2c: pinmux-i2c {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2128  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2129  					function = "i2c";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2130  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2131  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2132  				state_dpaux0_off: pinmux-off {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2133  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2134  					function = "off";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2135  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2136  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2137  				i2c-bus {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2138  					#address-cells = <1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2139  					#size-cells = <0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2140  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2141  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2142  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2143  			dpaux1: dpaux@155d0000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2144  				compatible = "nvidia,tegra194-dpaux";
2838cfddbc1c4e Thierry Reding      2022-11-17  2145  				reg = <0x0 0x155d0000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2146  				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2147  				clocks = <&bpmp TEGRA194_CLK_DPAUX1>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2148  					 <&bpmp TEGRA194_CLK_PLLDP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2149  				clock-names = "dpaux", "parent";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2150  				resets = <&bpmp TEGRA194_RESET_DPAUX1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2151  				reset-names = "dpaux";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2152  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2153  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2154  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2155  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2156  				state_dpaux1_aux: pinmux-aux {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2157  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2158  					function = "aux";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2159  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2160  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2161  				state_dpaux1_i2c: pinmux-i2c {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2162  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2163  					function = "i2c";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2164  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2165  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2166  				state_dpaux1_off: pinmux-off {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2167  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2168  					function = "off";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2169  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2170  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2171  				i2c-bus {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2172  					#address-cells = <1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2173  					#size-cells = <0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2174  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2175  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2176  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2177  			dpaux2: dpaux@155e0000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2178  				compatible = "nvidia,tegra194-dpaux";
2838cfddbc1c4e Thierry Reding      2022-11-17  2179  				reg = <0x0 0x155e0000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2180  				interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2181  				clocks = <&bpmp TEGRA194_CLK_DPAUX2>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2182  					 <&bpmp TEGRA194_CLK_PLLDP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2183  				clock-names = "dpaux", "parent";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2184  				resets = <&bpmp TEGRA194_RESET_DPAUX2>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2185  				reset-names = "dpaux";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2186  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2187  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2188  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2189  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2190  				state_dpaux2_aux: pinmux-aux {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2191  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2192  					function = "aux";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2193  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2194  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2195  				state_dpaux2_i2c: pinmux-i2c {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2196  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2197  					function = "i2c";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2198  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2199  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2200  				state_dpaux2_off: pinmux-off {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2201  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2202  					function = "off";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2203  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2204  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2205  				i2c-bus {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2206  					#address-cells = <1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2207  					#size-cells = <0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2208  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2209  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2210  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2211  			dpaux3: dpaux@155f0000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2212  				compatible = "nvidia,tegra194-dpaux";
2838cfddbc1c4e Thierry Reding      2022-11-17  2213  				reg = <0x0 0x155f0000 0x0 0x10000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2214  				interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2215  				clocks = <&bpmp TEGRA194_CLK_DPAUX3>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2216  					 <&bpmp TEGRA194_CLK_PLLDP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2217  				clock-names = "dpaux", "parent";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2218  				resets = <&bpmp TEGRA194_RESET_DPAUX3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2219  				reset-names = "dpaux";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2220  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2221  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2222  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2223  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2224  				state_dpaux3_aux: pinmux-aux {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2225  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2226  					function = "aux";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2227  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2228  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2229  				state_dpaux3_i2c: pinmux-i2c {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2230  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2231  					function = "i2c";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2232  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2233  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2234  				state_dpaux3_off: pinmux-off {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2235  					groups = "dpaux-io";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2236  					function = "off";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2237  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2238  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2239  				i2c-bus {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2240  					#address-cells = <1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2241  					#size-cells = <0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2242  				};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2243  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2244  
f7eb2785728442 Jon Hunter          2021-11-17  2245  			nvenc@15a80000 {
f7eb2785728442 Jon Hunter          2021-11-17  2246  				compatible = "nvidia,tegra194-nvenc";
2838cfddbc1c4e Thierry Reding      2022-11-17  2247  				reg = <0x0 0x15a80000 0x0 0x00040000>;
f7eb2785728442 Jon Hunter          2021-11-17  2248  				clocks = <&bpmp TEGRA194_CLK_NVENC1>;
f7eb2785728442 Jon Hunter          2021-11-17  2249  				clock-names = "nvenc";
f7eb2785728442 Jon Hunter          2021-11-17  2250  				resets = <&bpmp TEGRA194_RESET_NVENC1>;
f7eb2785728442 Jon Hunter          2021-11-17  2251  				reset-names = "nvenc";
f7eb2785728442 Jon Hunter          2021-11-17  2252  
f7eb2785728442 Jon Hunter          2021-11-17  2253  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVENCB>;
f7eb2785728442 Jon Hunter          2021-11-17  2254  				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVENC1SRD &emc>,
f7eb2785728442 Jon Hunter          2021-11-17  2255  						<&mc TEGRA194_MEMORY_CLIENT_NVENC1SRD1 &emc>,
f7eb2785728442 Jon Hunter          2021-11-17  2256  						<&mc TEGRA194_MEMORY_CLIENT_NVENC1SWR &emc>;
f7eb2785728442 Jon Hunter          2021-11-17  2257  				interconnect-names = "dma-mem", "read-1", "write";
f7eb2785728442 Jon Hunter          2021-11-17  2258  				iommus = <&smmu TEGRA194_SID_NVENC1>;
f7eb2785728442 Jon Hunter          2021-11-17  2259  				dma-coherent;
f7eb2785728442 Jon Hunter          2021-11-17  2260  
f7eb2785728442 Jon Hunter          2021-11-17  2261  				nvidia,host1x-class = <0x22>;
f7eb2785728442 Jon Hunter          2021-11-17  2262  			};
f7eb2785728442 Jon Hunter          2021-11-17  2263  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2264  			sor0: sor@15b00000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2265  				compatible = "nvidia,tegra194-sor";
2838cfddbc1c4e Thierry Reding      2022-11-17  2266  				reg = <0x0 0x15b00000 0x0 0x40000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2267  				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2268  				clocks = <&bpmp TEGRA194_CLK_SOR0_REF>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2269  					 <&bpmp TEGRA194_CLK_SOR0_OUT>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2270  					 <&bpmp TEGRA194_CLK_PLLD>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2271  					 <&bpmp TEGRA194_CLK_PLLDP>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2272  					 <&bpmp TEGRA194_CLK_SOR_SAFE>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2273  					 <&bpmp TEGRA194_CLK_SOR0_PAD_CLKOUT>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2274  				clock-names = "sor", "out", "parent", "dp", "safe",
3db6d3ba0863f4 Thierry Reding      2018-11-23  2275  					      "pad";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2276  				resets = <&bpmp TEGRA194_RESET_SOR0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2277  				reset-names = "sor";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2278  				pinctrl-0 = <&state_dpaux0_aux>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2279  				pinctrl-1 = <&state_dpaux0_i2c>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2280  				pinctrl-2 = <&state_dpaux0_off>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2281  				pinctrl-names = "aux", "i2c", "off";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2282  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2283  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2284  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2285  				nvidia,interface = <0>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2286  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2287  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2288  			sor1: sor@15b40000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2289  				compatible = "nvidia,tegra194-sor";
2838cfddbc1c4e Thierry Reding      2022-11-17  2290  				reg = <0x0 0x15b40000 0x0 0x40000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2291  				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2292  				clocks = <&bpmp TEGRA194_CLK_SOR1_REF>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2293  					 <&bpmp TEGRA194_CLK_SOR1_OUT>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2294  					 <&bpmp TEGRA194_CLK_PLLD2>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2295  					 <&bpmp TEGRA194_CLK_PLLDP>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2296  					 <&bpmp TEGRA194_CLK_SOR_SAFE>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2297  					 <&bpmp TEGRA194_CLK_SOR1_PAD_CLKOUT>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2298  				clock-names = "sor", "out", "parent", "dp", "safe",
3db6d3ba0863f4 Thierry Reding      2018-11-23  2299  					      "pad";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2300  				resets = <&bpmp TEGRA194_RESET_SOR1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2301  				reset-names = "sor";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2302  				pinctrl-0 = <&state_dpaux1_aux>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2303  				pinctrl-1 = <&state_dpaux1_i2c>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2304  				pinctrl-2 = <&state_dpaux1_off>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2305  				pinctrl-names = "aux", "i2c", "off";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2306  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2307  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2308  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2309  				nvidia,interface = <1>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2310  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2311  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2312  			sor2: sor@15b80000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2313  				compatible = "nvidia,tegra194-sor";
2838cfddbc1c4e Thierry Reding      2022-11-17  2314  				reg = <0x0 0x15b80000 0x0 0x40000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2315  				interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2316  				clocks = <&bpmp TEGRA194_CLK_SOR2_REF>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2317  					 <&bpmp TEGRA194_CLK_SOR2_OUT>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2318  					 <&bpmp TEGRA194_CLK_PLLD3>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2319  					 <&bpmp TEGRA194_CLK_PLLDP>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2320  					 <&bpmp TEGRA194_CLK_SOR_SAFE>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2321  					 <&bpmp TEGRA194_CLK_SOR2_PAD_CLKOUT>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2322  				clock-names = "sor", "out", "parent", "dp", "safe",
3db6d3ba0863f4 Thierry Reding      2018-11-23  2323  					      "pad";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2324  				resets = <&bpmp TEGRA194_RESET_SOR2>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2325  				reset-names = "sor";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2326  				pinctrl-0 = <&state_dpaux2_aux>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2327  				pinctrl-1 = <&state_dpaux2_i2c>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2328  				pinctrl-2 = <&state_dpaux2_off>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2329  				pinctrl-names = "aux", "i2c", "off";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2330  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2331  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2332  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2333  				nvidia,interface = <2>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2334  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2335  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2336  			sor3: sor@15bc0000 {
3db6d3ba0863f4 Thierry Reding      2018-11-23  2337  				compatible = "nvidia,tegra194-sor";
2838cfddbc1c4e Thierry Reding      2022-11-17  2338  				reg = <0x0 0x15bc0000 0x0 0x40000>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2339  				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2340  				clocks = <&bpmp TEGRA194_CLK_SOR3_REF>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2341  					 <&bpmp TEGRA194_CLK_SOR3_OUT>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2342  					 <&bpmp TEGRA194_CLK_PLLD4>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2343  					 <&bpmp TEGRA194_CLK_PLLDP>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2344  					 <&bpmp TEGRA194_CLK_SOR_SAFE>,
3db6d3ba0863f4 Thierry Reding      2018-11-23  2345  					 <&bpmp TEGRA194_CLK_SOR3_PAD_CLKOUT>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2346  				clock-names = "sor", "out", "parent", "dp", "safe",
3db6d3ba0863f4 Thierry Reding      2018-11-23  2347  					      "pad";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2348  				resets = <&bpmp TEGRA194_RESET_SOR3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2349  				reset-names = "sor";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2350  				pinctrl-0 = <&state_dpaux3_aux>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2351  				pinctrl-1 = <&state_dpaux3_i2c>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2352  				pinctrl-2 = <&state_dpaux3_off>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2353  				pinctrl-names = "aux", "i2c", "off";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2354  				status = "disabled";
3db6d3ba0863f4 Thierry Reding      2018-11-23  2355  
3db6d3ba0863f4 Thierry Reding      2018-11-23  2356  				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2357  				nvidia,interface = <3>;
3db6d3ba0863f4 Thierry Reding      2018-11-23  2358  			};
3db6d3ba0863f4 Thierry Reding      2018-11-23  2359  		};
0f134e39ae651f Thierry Reding      2020-07-16  2360  
2602c32f15e717 Vidya Sagar         2019-06-12  2361  		pcie@14100000 {
f9f711efd441ad Jon Hunter          2020-02-14  2362  			compatible = "nvidia,tegra194-pcie";
2602c32f15e717 Vidya Sagar         2019-06-12  2363  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
79ed18d9ece474 Thierry Reding      2022-11-22  2364  			reg = <0x00 0x14100000 0x0 0x00020000>, /* appl registers (128K)      */
79ed18d9ece474 Thierry Reding      2022-11-22  2365  			      <0x00 0x30000000 0x0 0x00040000>, /* configuration space (256K) */
79ed18d9ece474 Thierry Reding      2022-11-22  2366  			      <0x00 0x30040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
79ed18d9ece474 Thierry Reding      2022-11-22  2367  			      <0x00 0x30080000 0x0 0x00040000>; /* DBI reg space (256K)       */
2602c32f15e717 Vidya Sagar         2019-06-12  2368  			reg-names = "appl", "config", "atu_dma", "dbi";
2602c32f15e717 Vidya Sagar         2019-06-12  2369  
2602c32f15e717 Vidya Sagar         2019-06-12  2370  			status = "disabled";
2602c32f15e717 Vidya Sagar         2019-06-12  2371  
2602c32f15e717 Vidya Sagar         2019-06-12  2372  			#address-cells = <3>;
2602c32f15e717 Vidya Sagar         2019-06-12  2373  			#size-cells = <2>;
2602c32f15e717 Vidya Sagar         2019-06-12  2374  			device_type = "pci";
2602c32f15e717 Vidya Sagar         2019-06-12  2375  			num-lanes = <1>;
2602c32f15e717 Vidya Sagar         2019-06-12  2376  			linux,pci-domain = <1>;
2602c32f15e717 Vidya Sagar         2019-06-12  2377  
2602c32f15e717 Vidya Sagar         2019-06-12  2378  			clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_1>;
2602c32f15e717 Vidya Sagar         2019-06-12  2379  			clock-names = "core";
2602c32f15e717 Vidya Sagar         2019-06-12  2380  
2602c32f15e717 Vidya Sagar         2019-06-12  2381  			resets = <&bpmp TEGRA194_RESET_PEX0_CORE_1_APB>,
2602c32f15e717 Vidya Sagar         2019-06-12  2382  				 <&bpmp TEGRA194_RESET_PEX0_CORE_1>;
2602c32f15e717 Vidya Sagar         2019-06-12  2383  			reset-names = "apb", "core";
2602c32f15e717 Vidya Sagar         2019-06-12  2384  
2602c32f15e717 Vidya Sagar         2019-06-12  2385  			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
2602c32f15e717 Vidya Sagar         2019-06-12  2386  				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
2602c32f15e717 Vidya Sagar         2019-06-12  2387  			interrupt-names = "intr", "msi";
2602c32f15e717 Vidya Sagar         2019-06-12  2388  
2602c32f15e717 Vidya Sagar         2019-06-12  2389  			#interrupt-cells = <1>;
2602c32f15e717 Vidya Sagar         2019-06-12  2390  			interrupt-map-mask = <0 0 0 0>;
2602c32f15e717 Vidya Sagar         2019-06-12 @2391  			interrupt-map = <0 0 0 0 &gic GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;

:::::: The code at line 2391 was first introduced by commit
:::::: 2602c32f15e71729f3d638da5ad1692099cacf97 arm64: tegra: Add P2U and PCIe controller nodes to Tegra194 DT

:::::: TO: Vidya Sagar <vidyas@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
