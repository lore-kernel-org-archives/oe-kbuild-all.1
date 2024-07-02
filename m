Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350042F5A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719941429; cv=none; b=TCo6nQEg5UsIplok0eH0+PIGWC7ZfZwv8Sf5Be7S4MIAkEK9J6s0+tk/P2Y1lPJcoDd5CYrbGY2gHB4vKUFpiz/wXqlCYChv38/Sg/DIUva4rQG12d9vaJUqMW9YRyf3nL6VqxSGpe/kBYFa/KGkNl1e9ai7IdW44joMfNNb2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719941429; c=relaxed/simple;
	bh=8P/8cZf2gQu4C71RQgtCzXt/7hbk6OZ0WMvZZS92ZS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qlTn7b4I95hT9o8nsH6c+kyboVnDz4clGQbmDnpfBlBg9/3DdBjpOBPZSBkClevMFtggbbnSKd3BB14jvtI6FXmR5I7rIhaMVBnNMBxViAmsCHetgbjGXMWeb3ytZv1QV3dNBWTLPEJ+SKMb5Bznay+y4ijcPLUvF/eOrXK05pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFSN2eOC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFSN2eOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719941427; x=1751477427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8P/8cZf2gQu4C71RQgtCzXt/7hbk6OZ0WMvZZS92ZS0=;
  b=oFSN2eOCiUiJWyFpKrIDoeXI1LUIKZ3o9fody1VIRkuhewZA0nywvHg4
   89Pi26wOBVtEoNGU7pIJBsSrWXLngCWP7Jyx00WYlxN1AmLr6Dfvqch/W
   lnPDvr3AB6XYuE5Fg1RLOaY8LS5ej0CBbLWifVXzqTqOPiYtRizb9RGnQ
   iZTslElPUoJ9/i7zVpzHqGdoSmo5cpf5TSQsSDqgZi05r+1CPpcq3etvl
   OkrT/5aW7v8JivL6zLQ/wsLotQJmvB5+qXgwO8IiFGSr/l9PkknwA4i7N
   9/+AjNDeaYPyktOovvOImIVUEx0KDyTOReq3p0MDb1CK4NJZZN8HXc1eK
   A==;
X-CSE-ConnectionGUID: vR6sA48YRfObEIBw8Bpi2g==
X-CSE-MsgGUID: jM3tzckLQbCOBxXOvuDOqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34579870"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="34579870"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 10:30:13 -0700
X-CSE-ConnectionGUID: S/ZEScbiSCKmXUkaPXPjaQ==
X-CSE-MsgGUID: UMTmTjEMTVeRdov2gxMM6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="76712924"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2024 10:30:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOhKS-000OTA-0U;
	Tue, 02 Jul 2024 17:30:08 +0000
Date: Wed, 3 Jul 2024 01:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 9596/10049]
 arch/arm/boot/dts/arm/vexpress-v2m.dtsi:354.33-360.6: Warning
 (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/regulator-3v3:
 missing or empty reg/ranges property
Message-ID: <202407030124.2VGGIuLS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf [9596/10049] arm/arm64: dts: arm: Use generic clock and regulator nodenames
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20240703/202407030124.2VGGIuLS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030124.2VGGIuLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030124.2VGGIuLS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:88.21-96.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/flash@0,00000000: simple-bus unit address format error, expected "0"
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:98.21-102.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/psram@2,00000000: simple-bus unit address format error, expected "200000000"
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:104.24-114.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/ethernet@3,02000000: simple-bus unit address format error, expected "302000000"
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:116.19-121.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/usb@3,03000000: simple-bus unit address format error, expected "303000000"
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:123.22-352.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/iofpga@7,00000000: simple-bus unit address format error, expected "700000000"
>> arch/arm/boot/dts/arm/vexpress-v2m.dtsi:354.33-360.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/regulator-3v3: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/vexpress-v2m.dtsi:362.33-367.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/clock-24000000: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:369.34-374.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/clock-1000000: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:376.33-381.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/clock-32768: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:383.9-433.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/leds: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m.dtsi:435.8-506.6: Warning (simple_bus_reg): /bus@40000000/motherboard-bus@40000000/mcc: missing or empty reg/ranges property

vim +354 arch/arm/boot/dts/arm/vexpress-v2m.dtsi

    21	
    22	/ {
    23		bus@40000000 {
    24			compatible = "simple-bus";
    25			#address-cells = <1>;
    26			#size-cells = <1>;
    27			ranges = <0x40000000 0x40000000 0x10000000>,
    28				 <0x10000000 0x10000000 0x00020000>;
    29	
    30			#interrupt-cells = <1>;
    31			interrupt-map-mask = <0 63>;
    32			interrupt-map = <0  0 &gic GIC_SPI  0 IRQ_TYPE_LEVEL_HIGH>,
    33					<0  1 &gic GIC_SPI  1 IRQ_TYPE_LEVEL_HIGH>,
    34					<0  2 &gic GIC_SPI  2 IRQ_TYPE_LEVEL_HIGH>,
    35					<0  3 &gic GIC_SPI  3 IRQ_TYPE_LEVEL_HIGH>,
    36					<0  4 &gic GIC_SPI  4 IRQ_TYPE_LEVEL_HIGH>,
    37					<0  5 &gic GIC_SPI  5 IRQ_TYPE_LEVEL_HIGH>,
    38					<0  6 &gic GIC_SPI  6 IRQ_TYPE_LEVEL_HIGH>,
    39					<0  7 &gic GIC_SPI  7 IRQ_TYPE_LEVEL_HIGH>,
    40					<0  8 &gic GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>,
    41					<0  9 &gic GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
    42					<0 10 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
    43					<0 11 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
    44					<0 12 &gic GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
    45					<0 13 &gic GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
    46					<0 14 &gic GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
    47					<0 15 &gic GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
    48					<0 16 &gic GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
    49					<0 17 &gic GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
    50					<0 18 &gic GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
    51					<0 19 &gic GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
    52					<0 20 &gic GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
    53					<0 21 &gic GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
    54					<0 22 &gic GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
    55					<0 23 &gic GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
    56					<0 24 &gic GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
    57					<0 25 &gic GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
    58					<0 26 &gic GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
    59					<0 27 &gic GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
    60					<0 28 &gic GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
    61					<0 29 &gic GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
    62					<0 30 &gic GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
    63					<0 31 &gic GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
    64					<0 32 &gic GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
    65					<0 33 &gic GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
    66					<0 34 &gic GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
    67					<0 35 &gic GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
    68					<0 36 &gic GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
    69					<0 37 &gic GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
    70					<0 38 &gic GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
    71					<0 39 &gic GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
    72					<0 40 &gic GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
    73					<0 41 &gic GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
    74					<0 42 &gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
    75	
    76			motherboard-bus@40000000 {
    77				arm,hbi = <0x190>;
    78				arm,vexpress,site = <0>;
    79				compatible = "arm,vexpress,v2m-p1", "simple-bus";
    80				#address-cells = <2>; /* SMB chipselect number and offset */
    81				#size-cells = <1>;
    82				ranges = <0 0 0x40000000 0x04000000>,
    83					 <1 0 0x44000000 0x04000000>,
    84					 <2 0 0x48000000 0x04000000>,
    85					 <3 0 0x4c000000 0x04000000>,
    86					 <7 0 0x10000000 0x00020000>;
    87	
    88				flash@0,00000000 {
    89					compatible = "arm,vexpress-flash", "cfi-flash";
    90					reg = <0 0x00000000 0x04000000>,
    91					      <1 0x00000000 0x04000000>;
    92					bank-width = <4>;
    93					partitions {
    94						compatible = "arm,arm-firmware-suite";
    95					};
    96				};
    97	
    98				psram@2,00000000 {
    99					compatible = "arm,vexpress-psram", "mtd-ram";
   100					reg = <2 0x00000000 0x02000000>;
   101					bank-width = <4>;
   102				};
   103	
   104				ethernet@3,02000000 {
   105					compatible = "smsc,lan9118", "smsc,lan9115";
   106					reg = <3 0x02000000 0x10000>;
   107					interrupts = <15>;
   108					phy-mode = "mii";
   109					reg-io-width = <4>;
   110					smsc,irq-active-high;
   111					smsc,irq-push-pull;
   112					vdd33a-supply = <&v2m_fixed_3v3>;
   113					vddvario-supply = <&v2m_fixed_3v3>;
   114				};
   115	
   116				usb@3,03000000 {
   117					compatible = "nxp,usb-isp1761";
   118					reg = <3 0x03000000 0x20000>;
   119					interrupts = <16>;
   120					dr_mode = "peripheral";
   121				};
   122	
   123				iofpga@7,00000000 {
   124					compatible = "simple-bus";
   125					#address-cells = <1>;
   126					#size-cells = <1>;
   127					ranges = <0 7 0 0x20000>;
   128	
   129					v2m_sysreg: sysreg@0 {
   130						compatible = "arm,vexpress-sysreg";
   131						reg = <0x00000 0x1000>;
   132						#address-cells = <1>;
   133						#size-cells = <1>;
   134						ranges = <0 0 0x1000>;
   135	
   136						v2m_led_gpios: gpio@8 {
   137							compatible = "arm,vexpress-sysreg,sys_led";
   138							reg = <0x008 4>;
   139							gpio-controller;
   140							#gpio-cells = <2>;
   141						};
   142	
   143						v2m_mmc_gpios: gpio@48 {
   144							compatible = "arm,vexpress-sysreg,sys_mci";
   145							reg = <0x048 4>;
   146							gpio-controller;
   147							#gpio-cells = <2>;
   148						};
   149	
   150						v2m_flash_gpios: gpio@4c {
   151							compatible = "arm,vexpress-sysreg,sys_flash";
   152							reg = <0x04c 4>;
   153							gpio-controller;
   154							#gpio-cells = <2>;
   155						};
   156					};
   157	
   158					v2m_sysctl: sysctl@1000 {
   159						compatible = "arm,sp810", "arm,primecell";
   160						reg = <0x01000 0x1000>;
   161						clocks = <&v2m_refclk32khz>, <&v2m_refclk1mhz>, <&smbclk>;
   162						clock-names = "refclk", "timclk", "apb_pclk";
   163						#clock-cells = <1>;
   164						clock-output-names = "timerclken0", "timerclken1", "timerclken2", "timerclken3";
   165						assigned-clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&v2m_sysctl 3>, <&v2m_sysctl 3>;
   166						assigned-clock-parents = <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
   167					};
   168	
   169					/* PCI-E I2C bus */
   170					v2m_i2c_pcie: i2c@2000 {
   171						compatible = "arm,versatile-i2c";
   172						reg = <0x02000 0x1000>;
   173	
   174						#address-cells = <1>;
   175						#size-cells = <0>;
   176	
   177						pcie-switch@60 {
   178							compatible = "idt,89hpes32h8";
   179							reg = <0x60>;
   180						};
   181					};
   182	
   183					aaci@4000 {
   184						compatible = "arm,pl041", "arm,primecell";
   185						reg = <0x04000 0x1000>;
   186						interrupts = <11>;
   187						clocks = <&smbclk>;
   188						clock-names = "apb_pclk";
   189					};
   190	
   191					mmci@5000 {
   192						compatible = "arm,pl180", "arm,primecell";
   193						reg = <0x05000 0x1000>;
   194						interrupts = <9>, <10>;
   195						cd-gpios = <&v2m_mmc_gpios 0 0>;
   196						wp-gpios = <&v2m_mmc_gpios 1 0>;
   197						max-frequency = <12000000>;
   198						vmmc-supply = <&v2m_fixed_3v3>;
   199						clocks = <&v2m_clk24mhz>, <&smbclk>;
   200						clock-names = "mclk", "apb_pclk";
   201					};
   202	
   203					kmi@6000 {
   204						compatible = "arm,pl050", "arm,primecell";
   205						reg = <0x06000 0x1000>;
   206						interrupts = <12>;
   207						clocks = <&v2m_clk24mhz>, <&smbclk>;
   208						clock-names = "KMIREFCLK", "apb_pclk";
   209					};
   210	
   211					kmi@7000 {
   212						compatible = "arm,pl050", "arm,primecell";
   213						reg = <0x07000 0x1000>;
   214						interrupts = <13>;
   215						clocks = <&v2m_clk24mhz>, <&smbclk>;
   216						clock-names = "KMIREFCLK", "apb_pclk";
   217					};
   218	
   219					v2m_serial0: serial@9000 {
   220						compatible = "arm,pl011", "arm,primecell";
   221						reg = <0x09000 0x1000>;
   222						interrupts = <5>;
   223						clocks = <&v2m_oscclk2>, <&smbclk>;
   224						clock-names = "uartclk", "apb_pclk";
   225					};
   226	
   227					v2m_serial1: serial@a000 {
   228						compatible = "arm,pl011", "arm,primecell";
   229						reg = <0x0a000 0x1000>;
   230						interrupts = <6>;
   231						clocks = <&v2m_oscclk2>, <&smbclk>;
   232						clock-names = "uartclk", "apb_pclk";
   233					};
   234	
   235					v2m_serial2: serial@b000 {
   236						compatible = "arm,pl011", "arm,primecell";
   237						reg = <0x0b000 0x1000>;
   238						interrupts = <7>;
   239						clocks = <&v2m_oscclk2>, <&smbclk>;
   240						clock-names = "uartclk", "apb_pclk";
   241					};
   242	
   243					v2m_serial3: serial@c000 {
   244						compatible = "arm,pl011", "arm,primecell";
   245						reg = <0x0c000 0x1000>;
   246						interrupts = <8>;
   247						clocks = <&v2m_oscclk2>, <&smbclk>;
   248						clock-names = "uartclk", "apb_pclk";
   249					};
   250	
   251					wdt@f000 {
   252						compatible = "arm,sp805", "arm,primecell";
   253						reg = <0x0f000 0x1000>;
   254						interrupts = <0>;
   255						clocks = <&v2m_refclk32khz>, <&smbclk>;
   256						clock-names = "wdog_clk", "apb_pclk";
   257					};
   258	
   259					v2m_timer01: timer@11000 {
   260						compatible = "arm,sp804", "arm,primecell";
   261						reg = <0x11000 0x1000>;
   262						interrupts = <2>;
   263						clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&smbclk>;
   264						clock-names = "timclken1", "timclken2", "apb_pclk";
   265					};
   266	
   267					v2m_timer23: timer@12000 {
   268						compatible = "arm,sp804", "arm,primecell";
   269						reg = <0x12000 0x1000>;
   270						interrupts = <3>;
   271						clocks = <&v2m_sysctl 2>, <&v2m_sysctl 3>, <&smbclk>;
   272						clock-names = "timclken1", "timclken2", "apb_pclk";
   273					};
   274	
   275					/* DVI I2C bus */
   276					v2m_i2c_dvi: i2c@16000 {
   277						compatible = "arm,versatile-i2c";
   278						reg = <0x16000 0x1000>;
   279						#address-cells = <1>;
   280						#size-cells = <0>;
   281	
   282						dvi-transmitter@39 {
   283							compatible = "sil,sii9022-tpi", "sil,sii9022";
   284							reg = <0x39>;
   285	
   286							ports {
   287								#address-cells = <1>;
   288								#size-cells = <0>;
   289	
   290								/*
   291								 * Both the core tile and the motherboard routes their output
   292								 * pads to this transmitter. The motherboard system controller
   293								 * can select one of them as input using a mux register in
   294								 * "arm,vexpress-muxfpga". The Vexpress with the CA9 core tile is
   295								 * the only platform with this specific set-up.
   296								 */
   297								port@0 {
   298									reg = <0>;
   299									dvi_bridge_in_ct: endpoint {
   300										remote-endpoint = <&clcd_pads_ct>;
   301									};
   302								};
   303								port@1 {
   304									reg = <1>;
   305									dvi_bridge_in_mb: endpoint {
   306										remote-endpoint = <&clcd_pads_mb>;
   307									};
   308								};
   309							};
   310						};
   311	
   312						dvi-transmitter@60 {
   313							compatible = "sil,sii9022-cpi", "sil,sii9022";
   314							reg = <0x60>;
   315						};
   316					};
   317	
   318					rtc@17000 {
   319						compatible = "arm,pl031", "arm,primecell";
   320						reg = <0x17000 0x1000>;
   321						interrupts = <4>;
   322						clocks = <&smbclk>;
   323						clock-names = "apb_pclk";
   324					};
   325	
   326					compact-flash@1a000 {
   327						compatible = "arm,vexpress-cf", "ata-generic";
   328						reg = <0x1a000 0x100
   329						       0x1a100 0xf00>;
   330						reg-shift = <2>;
   331					};
   332	
   333	
   334					clcd@1f000 {
   335						compatible = "arm,pl111", "arm,primecell";
   336						reg = <0x1f000 0x1000>;
   337						interrupt-names = "combined";
   338						interrupts = <14>;
   339						clocks = <&v2m_oscclk1>, <&smbclk>;
   340						clock-names = "clcdclk", "apb_pclk";
   341						/* 800x600 16bpp @36MHz works fine */
   342						max-memory-bandwidth = <54000000>;
   343						memory-region = <&vram>;
   344	
   345						port {
   346							clcd_pads_mb: endpoint {
   347								remote-endpoint = <&dvi_bridge_in_mb>;
   348								arm,pl11x,tft-r0g0b0-pads = <0 8 16>;
   349							};
   350						};
   351					};
   352				};
   353	
 > 354				v2m_fixed_3v3: regulator-3v3 {
   355					compatible = "regulator-fixed";
   356					regulator-name = "3V3";
   357					regulator-min-microvolt = <3300000>;
   358					regulator-max-microvolt = <3300000>;
   359					regulator-always-on;
   360				};
   361	
 > 362				v2m_clk24mhz: clock-24000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
