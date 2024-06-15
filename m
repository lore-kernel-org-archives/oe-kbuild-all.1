Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91C71870
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718481461; cv=none; b=fiRyojupLgLpAdMBJrrTHRcgOOYo2wyVn99x/KEPvXKUF/v3XUCnCT7NpU3QPah9S1k6vytsfqtvPgVisioG/q9AASIqllyrICHr5pv8BhPVr9jL5oezQF/mIP1nHrRyxGO6jnobikdFDaLFym1+7GdZHPu8mWggMKaOUtYZN2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718481461; c=relaxed/simple;
	bh=B24VexTxacsSAV52adzDcjF4o4fTU0nSSrsVMLU4/pM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k+/IqWWCAokABaKSjCjBgI8k5P1ar4KaO9NPRqVB2281/avYIh80/aW2c79MAEyHwrsNmLEa6X5Y3gBRla6jTMAW9UmkcGpBJwD90YIFRQ7LLtA91d/NGxhDYb9mq7ZfQHml1Xw99nerlt9gwcO9EA1FXC0CS70dF9+BnqiApS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoOM+s/x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoOM+s/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718481459; x=1750017459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B24VexTxacsSAV52adzDcjF4o4fTU0nSSrsVMLU4/pM=;
  b=WoOM+s/x/p3XMxqbVDIayaaBoKIDFjN1G1hnJMA2xYh0+qnC6JN1J6ra
   cQiXkZ952lJYA7P6lVeHuOropBPESnsY+VRmbTTZXu0GyZoqTwcnxePiB
   Wjghtjc62o5cZxYMve66pbOElYqSt3MrRTBA4K2nThJHX4++3jryECO22
   P+XH/gZmJPZ/dhs7YeSAkfCCipv3COsbw2IaXzu1sacTx962hu6SfVgvd
   whW8vEnpq3lpme1PruxcKetG6vfQRhgoSS+cMcmmYmbVgfr1bQ0MKteAJ
   Pi1WMtuE2m/K7HDFI+O9Jjv4ttgJw5frNFpkSh8YRQBWJ68oGtFQZ07ca
   g==;
X-CSE-ConnectionGUID: IlWvj/1BQte3I/YJke7F4w==
X-CSE-MsgGUID: aFNrtrlKRVKG3Dwu/GOsVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="25933806"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="25933806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 12:57:38 -0700
X-CSE-ConnectionGUID: zqAnu6nuRY6H11it20lC9Q==
X-CSE-MsgGUID: DELfMQu/ReOpRW1Ir8vEjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41494326"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2024 12:57:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIZWp-0000SY-1B;
	Sat, 15 Jun 2024 19:57:35 +0000
Date: Sun, 16 Jun 2024 03:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 34/184]
 arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning
 (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty
 reg/ranges property
Message-ID: <202406160352.Ck2lXV4K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   7a67f4836b8673379e8014405fc0a17abea55160
commit: a9c1572548f5a0f1751dd003c44f586b1137e442 [34/184] arch: arm64: apple: t600x: Add display controller related device tree nodes
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240616/202406160352.Ck2lXV4K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160352.Ck2lXV4K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160352.Ck2lXV4K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:227.14-243.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:245.14-254.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:137.42-140.7: Warning (unique_unit_address_if_enabled): /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:13.10-20.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:69.10-78.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:95.10-104.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:121.10-130.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:147.10-156.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3c/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dts:41.10-50.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@39/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dts:68.10-77.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3a/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +230 arch/arm64/boot/dts/apple/t600x-die0.dtsi

 > 230		display: display-subsystem {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
