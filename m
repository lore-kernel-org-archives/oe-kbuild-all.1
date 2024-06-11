Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1511184F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 00:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718065373; cv=none; b=JZgntd4E4CBgDtS5ejbJ3/OSmVfyD7hU8jMOfb61m9bZ8DzcK1ogHVeyMloNGW79CiGQPgf8LPRxsBPXS2qdKTyzHVv1s0Kw69Vi1B++BLRNOKal8FuUtkCdl3mDxsuAINjo1nHr9eVBQSO9VFt1arlNRcHTpn5y0iXKhzK/0Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718065373; c=relaxed/simple;
	bh=uk+D6RfjkklOAbW2OoXj3upABWDQpSuRkHNuLSGiZTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8uX7f6P/t0hh6bIqkZ6TKQZkBtkSsmJj6zpyvV2LNLWVmdluBbciDEG+h3xZBVYdhWwhSkywMTc3GSZqMCrtwrIH6UAXkzp8nQ5MNOJsbg0Jm+QB/4dIsks2wIHxd4sgMG+H1X2GO+a1InOL0qbnh2rZrPq0OvG2NSkLEhh1gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqFZwsS4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqFZwsS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718065370; x=1749601370;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uk+D6RfjkklOAbW2OoXj3upABWDQpSuRkHNuLSGiZTs=;
  b=YqFZwsS4OidNsDcY7dt5MDHgmpbUaE2sS8Qxr0O3tJuYhxbKozOFwLyN
   I8Cu1fb7+slXgKhkpWoPjQsM73s6R2XILN/jY/AevdAjqEc5NQmGFdsjU
   tgzkEAUKoyAM2eXoXW89FJRMgQa7yitJvjeZ2Vgu0r9pK4312R2dI09g7
   IMxAQMo5vZNegpC7R2AzUeqA5UtV+Hj01J8TAA6kKABYVyPA5uQ9M3rgV
   Zb+vWICefUeaaHQXrBF6FvCg62r6kOyy4f0AvFpK6dumsL0o4W0CNftoi
   uPNN3VMe72bVTaN7JH/zYu2/qTT82gOoKkOJPvlQ+dqWvi4ercAAVFfGN
   g==;
X-CSE-ConnectionGUID: R1ZzNe3UTDGeTZqCM6+PBg==
X-CSE-MsgGUID: jNT5lcxqQKarRZgx+Y8gFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14588740"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14588740"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 17:22:50 -0700
X-CSE-ConnectionGUID: mBnj1qQDQK6zCzYINCRUdg==
X-CSE-MsgGUID: 24q+yGU1S32euphWc0TbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39804310"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jun 2024 17:22:49 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGpHi-0002cz-2c;
	Tue, 11 Jun 2024 00:22:46 +0000
Date: Tue, 11 Jun 2024 08:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.15-r2pro 29/100]
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts:154.17-219.4:
 Warning (avoid_unnecessary_addr_size): /ethernet@1b100000/mdio-bus:
 unnecessary #address-cells/#size-cells without "ranges" or child "reg"
 property
Message-ID: <202406110835.czWRVoH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/frank-w/BPI-R2-4.14 5.15-r2pro
head:   b603f40b85f7cd8e92ed3ceefef5a0a3c4dec34b
commit: 384f0eb75d6fd529b1b892235d1d619b518ecd19 [29/100] dts64: add r64 variant with rtl8367 switch again
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240611/202406110835.czWRVoH4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110835.czWRVoH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110835.czWRVoH4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622.dtsi:889.27-903.4: Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts:79.9-81.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts:15.29-22.4: Warning (unit_address_vs_reg): /rtkgswsys@1b100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts:154.17-219.4: Warning (avoid_unnecessary_addr_size): /ethernet@1b100000/mdio-bus: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7622.dtsi:923.25-952.4: Warning (unique_unit_address): /ethernet@1b100000: duplicate unit-address (also used in node /rtkgswsys@1b100000)

vim +154 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts

0b6286dd96c072 Ryder Lee        2018-08-19  127  
0b6286dd96c072 Ryder Lee        2018-08-19  128  &eth {
0b6286dd96c072 Ryder Lee        2018-08-19  129  	status = "okay";
bd69baaace06e6 René van Dorst   2019-08-25  130  	gmac0: mac@0 {
bd69baaace06e6 René van Dorst   2019-08-25  131  		compatible = "mediatek,eth-mac";
bd69baaace06e6 René van Dorst   2019-08-25  132  		reg = <0>;
bd69baaace06e6 René van Dorst   2019-08-25  133  		phy-mode = "2500base-x";
bd69baaace06e6 René van Dorst   2019-08-25  134  
bd69baaace06e6 René van Dorst   2019-08-25  135  		fixed-link {
bd69baaace06e6 René van Dorst   2019-08-25  136  			speed = <2500>;
bd69baaace06e6 René van Dorst   2019-08-25  137  			full-duplex;
bd69baaace06e6 René van Dorst   2019-08-25  138  			pause;
bd69baaace06e6 René van Dorst   2019-08-25  139  		};
bd69baaace06e6 René van Dorst   2019-08-25  140  	};
0b6286dd96c072 Ryder Lee        2018-08-19  141  
0b6286dd96c072 Ryder Lee        2018-08-19  142  	gmac1: mac@1 {
0b6286dd96c072 Ryder Lee        2018-08-19  143  		compatible = "mediatek,eth-mac";
0b6286dd96c072 Ryder Lee        2018-08-19  144  		reg = <1>;
bd69baaace06e6 René van Dorst   2019-08-25  145  		phy-mode = "rgmii";
bd69baaace06e6 René van Dorst   2019-08-25  146  
bd69baaace06e6 René van Dorst   2019-08-25  147  		fixed-link {
bd69baaace06e6 René van Dorst   2019-08-25  148  			speed = <1000>;
bd69baaace06e6 René van Dorst   2019-08-25  149  			full-duplex;
bd69baaace06e6 René van Dorst   2019-08-25  150  			pause;
bd69baaace06e6 René van Dorst   2019-08-25  151  		};
0b6286dd96c072 Ryder Lee        2018-08-19  152  	};
0b6286dd96c072 Ryder Lee        2018-08-19  153  
bd69baaace06e6 René van Dorst   2019-08-25 @154  	mdio: mdio-bus {
0b6286dd96c072 Ryder Lee        2018-08-19  155  		#address-cells = <1>;
0b6286dd96c072 Ryder Lee        2018-08-19  156  		#size-cells = <0>;
79a675e6b1ced5 Landen Chao      2020-09-11  157  
384f0eb75d6fd5 Frank Wunderlich 2021-11-05  158  		switch: switch@0 {
79a675e6b1ced5 Landen Chao      2020-09-11  159  			compatible = "mediatek,mt7531";
79a675e6b1ced5 Landen Chao      2020-09-11  160  			reg = <0>;
79a675e6b1ced5 Landen Chao      2020-09-11  161  			reset-gpios = <&pio 54 0>;
79a675e6b1ced5 Landen Chao      2020-09-11  162  
79a675e6b1ced5 Landen Chao      2020-09-11  163  			ports {
79a675e6b1ced5 Landen Chao      2020-09-11  164  				#address-cells = <1>;
79a675e6b1ced5 Landen Chao      2020-09-11  165  				#size-cells = <0>;
79a675e6b1ced5 Landen Chao      2020-09-11  166  
79a675e6b1ced5 Landen Chao      2020-09-11  167  				port@0 {
79a675e6b1ced5 Landen Chao      2020-09-11  168  					reg = <0>;
79a675e6b1ced5 Landen Chao      2020-09-11  169  					label = "wan";
79a675e6b1ced5 Landen Chao      2020-09-11  170  				};
79a675e6b1ced5 Landen Chao      2020-09-11  171  
79a675e6b1ced5 Landen Chao      2020-09-11  172  				port@1 {
79a675e6b1ced5 Landen Chao      2020-09-11  173  					reg = <1>;
79a675e6b1ced5 Landen Chao      2020-09-11  174  					label = "lan0";
79a675e6b1ced5 Landen Chao      2020-09-11  175  				};
79a675e6b1ced5 Landen Chao      2020-09-11  176  
79a675e6b1ced5 Landen Chao      2020-09-11  177  				port@2 {
79a675e6b1ced5 Landen Chao      2020-09-11  178  					reg = <2>;
79a675e6b1ced5 Landen Chao      2020-09-11  179  					label = "lan1";
79a675e6b1ced5 Landen Chao      2020-09-11  180  				};
79a675e6b1ced5 Landen Chao      2020-09-11  181  
79a675e6b1ced5 Landen Chao      2020-09-11  182  				port@3 {
79a675e6b1ced5 Landen Chao      2020-09-11  183  					reg = <3>;
79a675e6b1ced5 Landen Chao      2020-09-11  184  					label = "lan2";
79a675e6b1ced5 Landen Chao      2020-09-11  185  				};
79a675e6b1ced5 Landen Chao      2020-09-11  186  
79a675e6b1ced5 Landen Chao      2020-09-11  187  				port@4 {
79a675e6b1ced5 Landen Chao      2020-09-11  188  					reg = <4>;
79a675e6b1ced5 Landen Chao      2020-09-11  189  					label = "lan3";
79a675e6b1ced5 Landen Chao      2020-09-11  190  				};
79a675e6b1ced5 Landen Chao      2020-09-11  191  
0445e005777606 Frank Wunderlich 2021-09-22  192  				port@5 {
0445e005777606 Frank Wunderlich 2021-09-22  193  					reg = <5>;
0445e005777606 Frank Wunderlich 2021-09-22  194  					label = "aux";
0445e005777606 Frank Wunderlich 2021-09-22  195  					phy-mode = "rgmii";
0445e005777606 Frank Wunderlich 2021-09-22  196  
0445e005777606 Frank Wunderlich 2021-09-22  197  					fixed-link {
0445e005777606 Frank Wunderlich 2021-09-22  198  						speed = <1000>;
0445e005777606 Frank Wunderlich 2021-09-22  199  						full-duplex;
0445e005777606 Frank Wunderlich 2021-09-22  200  						pause;
0445e005777606 Frank Wunderlich 2021-09-22  201  					};
0445e005777606 Frank Wunderlich 2021-09-22  202  				};
0445e005777606 Frank Wunderlich 2021-09-22  203  
79a675e6b1ced5 Landen Chao      2020-09-11  204  				port@6 {
79a675e6b1ced5 Landen Chao      2020-09-11  205  					reg = <6>;
79a675e6b1ced5 Landen Chao      2020-09-11  206  					label = "cpu";
79a675e6b1ced5 Landen Chao      2020-09-11  207  					ethernet = <&gmac0>;
79a675e6b1ced5 Landen Chao      2020-09-11  208  					phy-mode = "2500base-x";
79a675e6b1ced5 Landen Chao      2020-09-11  209  
79a675e6b1ced5 Landen Chao      2020-09-11  210  					fixed-link {
79a675e6b1ced5 Landen Chao      2020-09-11  211  						speed = <2500>;
79a675e6b1ced5 Landen Chao      2020-09-11  212  						full-duplex;
79a675e6b1ced5 Landen Chao      2020-09-11  213  						pause;
79a675e6b1ced5 Landen Chao      2020-09-11  214  					};
79a675e6b1ced5 Landen Chao      2020-09-11  215  				};
79a675e6b1ced5 Landen Chao      2020-09-11  216  			};
79a675e6b1ced5 Landen Chao      2020-09-11  217  		};
79a675e6b1ced5 Landen Chao      2020-09-11  218  
0b6286dd96c072 Ryder Lee        2018-08-19  219  	};
0b6286dd96c072 Ryder Lee        2018-08-19  220  };
0b6286dd96c072 Ryder Lee        2018-08-19  221  

:::::: The code at line 154 was first introduced by commit
:::::: bd69baaace06e659299dc3cacc6eaa26102ca3fc dt-bindings: net: ethernet: Update mt7622 docs and dts to reflect the new phylink API

:::::: TO: René van Dorst <opensource@vdorst.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
