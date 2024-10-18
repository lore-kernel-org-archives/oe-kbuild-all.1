Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3674A29
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 00:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729210138; cv=none; b=a26BAT0geXivKhvU+IlzGnOWe9EZXO/mMfNmD+jQw21hJXQEoYuBWickI/bvzRqTKUyGJMbEAJsAuwPyKflABo9pXdsUX9jWLDqMDQQ5r/BmXIAyq6EIkeE5eWA9Ab45A/OSU2YvtZQlf0VSGsP4BfbUMcRwValdl6P3RpGn3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729210138; c=relaxed/simple;
	bh=sf64gOwRSn9bQ+v2/ckCBHYO0f40fVtpoTs06U5eUKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbpnXJxe2DxmhRlcIV7GaXcN3bwSZRkenIOunWJU0b+FZR4qOIop8mb2eYOif+zJevThddEmXmvrjcgb105I/eNzrUc1KKfZEiy5ZF2Uw9+1ClvvMWW2o9q5QJdu/489+qUeJt3SoYkExhlcpxHkQqO6GL7jBvhaUBh/IDblYj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FB40oCQz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FB40oCQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729210137; x=1760746137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sf64gOwRSn9bQ+v2/ckCBHYO0f40fVtpoTs06U5eUKk=;
  b=FB40oCQzDPQ3eUhDNL2c4gEud+d4sYktX/Xy4sDOnUMgkVyL2pZ/+Q0O
   Xc51DZkLEDXJCCwneNgzB+vDTcgAMXyPioQ75RgLZ+asTQriQIkfkLqOO
   8DlQAM36QO4PSPntOjCfipuOnlZrrL5M+Qld+/JiyC3azxIrBEH8ApDpP
   75GKy/acM8OvBtc34NzmKNcA2yOZOfcoIfs9eKdIAFV8jPU5CRa9CHUCn
   B+aBgHjxS8fG1xV6xZSm6gofdi+bbKvYJmPQ+tOB0ReN6iP0r1ToF2glK
   n8Z0W3IvH9G2pA7L3Fyc22oBmhYmLsMrhOiIQd1rLO8P/KcXb3RigyBbz
   Q==;
X-CSE-ConnectionGUID: fazMs10HRgW5NYWbsg+hxw==
X-CSE-MsgGUID: k3AfTzD9R8mh4jyk4ObrYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="31594247"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="31594247"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 17:08:56 -0700
X-CSE-ConnectionGUID: shYuvkNkSaK87MGBmSvfAw==
X-CSE-MsgGUID: +jPS8QIpStSk/FkOtivyAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78756248"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Oct 2024 17:08:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1aY0-000N3f-1U;
	Fri, 18 Oct 2024 00:08:52 +0000
Date: Fri, 18 Oct 2024 08:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 11/44]
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning
 (unit_address_vs_reg):
 /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a
 unit name, but no reg or ranges property
Message-ID: <202410180737.bBUDOWN1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 453e0e54ada305a3320d743e5511ee0fe844f23f [11/44] arm64: dts: ti: k3-j721e-mcu-wakeup: Add HyperBus node
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241018/202410180737.bBUDOWN1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180737.bBUDOWN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180737.bBUDOWN1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning (unit_address_vs_reg): /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:71.39-76.8: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1909.34-1918.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:725.25-751.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:773.25-799.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:821.25-847.4: Warning (unique_unit_address): /bus@100000/pcie@2920000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2920000)
--
>> arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning (unit_address_vs_reg): /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:71.39-76.8: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:725.25-751.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:773.25-799.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:821.25-847.4: Warning (unique_unit_address): /bus@100000/pcie@2920000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2920000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:869.25-895.4: Warning (unique_unit_address): /bus@100000/pcie@2930000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2930000)

vim +184 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi

 > 184			hbmc_mux: mux-controller@47000004 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
