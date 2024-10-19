Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FFF1DFD84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729337253; cv=none; b=FABgQJxj83siIKNWq+SfcrF3ZBBBq4Rdsz3wAX9K0lo21V9ANHtJist2uC/Zkq//i3x+3DFjiQFOqMEcqpWITZpslR08oyP/g2+ooQVltTQlI5LiqZe//Oub4KDgTEQFuWePfVFG0WiKLXyZSpmov8GkUMRvy6CgtrPb2OE5nqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729337253; c=relaxed/simple;
	bh=4uLCbHjz6u+pwSur30w5kAFkuA7FuH8X+Gaqt4qUcZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pV+5OiGTgAsXR+iS/LO2QoxF2dXZvraPey1Xd//DOn9dc6K1xdpD8fKBifKxzrMjyDje9whI/ETyNkJY1l1aIqqoNmuNqXBjVIaknTmNFSsmGnjPw/VJPnd9P/UrMKa7+SaSzb327gAXbYeflkA07rGCyh7pkEHEaFrAWX5SVuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIjutOt6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIjutOt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729337252; x=1760873252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4uLCbHjz6u+pwSur30w5kAFkuA7FuH8X+Gaqt4qUcZA=;
  b=DIjutOt6+kVZsfvrcx/rQzAVHHf7EQJxAOJRbMkqIACaT9H3HXT2cEvq
   wn4pWa1ErHy3KxEvwyYGS5nQIqIGnfz7jDXyRh47I1bcNieCqKa1qgvmo
   rx4KAUpMOgz+QV6be2AXTlnnKPDC093xamtHhFlzVe9BnHp4AVnNg3PLr
   z4HUcV2kYOzVAFXbcMJ7sH8qD3RKfhKrhlZwXup+Gjf2rp90QiWDPW8sS
   fLTAAxqf4e+m6q1lKnSuKqFCmHVarYzUoPDEjliqIKT1kedrDd6M0n56i
   Rt2EEIoQ+7FCjnzKDhHLjFM+6MZSUb8sofojTTHU8ENJzWgJYVW3ElxHf
   g==;
X-CSE-ConnectionGUID: lGNIOjFATSGboVhXbyM9Ng==
X-CSE-MsgGUID: 4N5wD1TaRGGMeMl/vUaF/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28294889"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="28294889"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 04:27:31 -0700
X-CSE-ConnectionGUID: 1gDv1X3KS9qtLql+3gs+ig==
X-CSE-MsgGUID: wqAy/eiaSgGl4G4s+hZQDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="78688671"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Oct 2024 04:27:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t27cG-000Ovx-03;
	Sat, 19 Oct 2024 11:27:28 +0000
Date: Sat, 19 Oct 2024 19:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-6.1.y-wip 11/25]
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts:284.9-339.4: Warning
 (unique_unit_address): /bus@f0000/bus@fc00000/spi@fc40000/flash@0: duplicate
 unit-address (also used in node /bus@f0000/bus@fc00000/spi@fc40000/nand@0)
Message-ID: <202410191953.9lY6Ee38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   c1c2f1971fbf6ddad93a8c94314fe8221e7aa6be
commit: f229a3df595c48005b67786bea1f9f79871ae8b0 [11/25] arm64: dts: ti: k3-j722s-evm: Add support for OSPI flash and eMMC
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241019/202410191953.9lY6Ee38-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191953.9lY6Ee38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191953.9lY6Ee38-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-j722s-evm.dts:341.21-396.4: Warning (avoid_unnecessary_addr_size): /bus@f0000/bus@fc00000/spi@fc40000/nand@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dts:284.9-339.4: Warning (unique_unit_address): /bus@f0000/bus@fc00000/spi@fc40000/flash@0: duplicate unit-address (also used in node /bus@f0000/bus@fc00000/spi@fc40000/nand@0)

vim +284 arch/arm64/boot/dts/ti/k3-j722s-evm.dts

   277	
   278	&ospi0 {
   279		status = "okay";
   280		pinctrl-names = "default";
   281		pinctrl-0 = <&ospi0_pins_default>;
   282		bootph-all;
   283	
 > 284		flash@0{
   285			compatible = "jedec,spi-nor";
   286			reg = <0x0>;
   287			spi-tx-bus-width = <8>;
   288			spi-rx-bus-width = <8>;
   289			spi-max-frequency = <25000000>;
   290			cdns,tshsl-ns = <60>;
   291			cdns,tsd2d-ns = <60>;
   292			cdns,tchsh-ns = <60>;
   293			cdns,tslch-ns = <60>;
   294			cdns,read-delay = <4>;
   295			bootph-all;
   296	
   297			partitions {
   298				compatible = "fixed-partitions";
   299				#address-cells = <1>;
   300				#size-cells = <1>;
   301				bootph-all;
   302	
   303				partition@0 {
   304					label = "ospi.tiboot3";
   305					reg = <0x00 0x80000>;
   306				};
   307	
   308				partition@80000 {
   309					label = "ospi.tispl";
   310					reg = <0x80000 0x200000>;
   311				};
   312	
   313				partition@280000 {
   314					label = "ospi.u-boot";
   315					reg = <0x280000 0x400000>;
   316				};
   317	
   318				partition@680000 {
   319					label = "ospi.env";
   320					reg = <0x680000 0x40000>;
   321				};
   322	
   323				partition@6c0000 {
   324					label = "ospi.env.backup";
   325					reg = <0x6c0000 0x40000>;
   326				};
   327	
   328				partition@800000 {
   329					label = "ospi.rootfs";
   330					reg = <0x800000 0x37c0000>;
   331				};
   332	
   333				partition@3fc0000 {
   334					label = "ospi.phypattern";
   335					reg = <0x3fc0000 0x40000>;
   336					bootph-all;
   337				};
   338			};
   339		};
   340	
   341		ospi0_nand: nand@0 {
   342			compatible = "spi-nand";
   343			reg = <0x0>;
   344			spi-tx-bus-width = <8>;
   345			spi-rx-bus-width = <8>;
   346			spi-max-frequency = <25000000>;
   347			cdns,tshsl-ns = <60>;
   348			cdns,tsd2d-ns = <60>;
   349			cdns,tchsh-ns = <60>;
   350			cdns,tslch-ns = <60>;
   351			cdns,read-delay = <2>;
   352			#address-cells = <1>;
   353			#size-cells = <1>;
   354			status = "disabled";
   355	
   356			partitions {
   357				compatible = "fixed-partitions";
   358				#address-cells = <1>;
   359				#size-cells = <1>;
   360	
   361				partition@0 {
   362					label = "ospi_nand.tiboot3";
   363					reg = <0x0 0x80000>;
   364				};
   365	
   366				partition@80000 {
   367					label = "ospi_nand.tispl";
   368					reg = <0x80000 0x200000>;
   369				};
   370	
   371				partition@280000 {
   372					label = "ospi_nand.u-boot";
   373					reg = <0x280000 0x400000>;
   374				};
   375	
   376				partition@680000 {
   377					label = "ospi_nand.env";
   378					reg = <0x680000 0x40000>;
   379				};
   380	
   381				partition@6c0000 {
   382					label = "ospi_nand.env.backup";
   383					reg = <0x6c0000 0x40000>;
   384				};
   385	
   386				partition@2000000 {
   387					label = "ospi_nand.rootfs";
   388					reg = <0x2000000 0x5fc0000>;
   389				};
   390	
   391				partition@7fc0000 {
   392					label = "ospi_nand.phypattern";
   393					reg = <0x7fc0000 0x40000>;
   394				};
   395			};
   396		};
   397	};
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
