Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9927D610C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717833390; cv=none; b=JDZzlkh45FsqVwNaMUVibDXzZm5Q2ZcbtLs1q85wtQo6hOgtIaWRwoSEq1xdKPw4LgVdZohZ73N5yyWFhHDq4S57hEAl3m3UZL7UIvj/FgMuRM8PD/cFfiAULupuLufh8M7RDbmBdvqCP9OPXE+iC1+5isgZcAKqnaxXUDf+b+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717833390; c=relaxed/simple;
	bh=qkem+kwsvEoUSXTGvdNq7EoCzX3vwJN4ujpam4E7nNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pO4CxL0/jFQQ0vc8SqcXnTDGvquI11UNPahjmIEd33n7JAL2h0hsUM+uhbO5pOgjQjLJzMrlghO0fu40cyct63CEM/h1wLjMCGD5NEA85qH4NMsuENca9o6yaLqAY31cLeYqfbECrIxdE+nFfr0clLtAj++ZPqi/f7fgiq7m4nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOsdYBu7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOsdYBu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717833385; x=1749369385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkem+kwsvEoUSXTGvdNq7EoCzX3vwJN4ujpam4E7nNs=;
  b=mOsdYBu7+5VFbZ9tHCyE9u+MtmOBJDIkOPKiHL6ntD/QeJUkyGVZIRwO
   ZPoWTJc6d5PSFU/VthFI4ycSLwvOtObmY5lOXq4290Ktk/D2yNJpPUUXZ
   4FYpscve8ygfhjPKv6kMjUe+Zpo1p01n7cbkxm3jr0g9X6ZK0GNgcX3z6
   1KyDVLFKbU8pytKBTzd9S6rzoHNZ/3oB3O5Q8bAv8Tdtyce8iP9qcV5H+
   W05XQgliBCOWqrXLEO5VB0M/vdO6gvevqhTyn6otkL43XtQtvvDsX5Zmg
   D32UJBEHjK8zZtFpFKtggluxPPGncy7vhc+XUuCOhCIOsFirWVEKfytfF
   A==;
X-CSE-ConnectionGUID: BUJpYMUWSM6uZD12EhP5qg==
X-CSE-MsgGUID: 3tBJDpu6T3KHXMW2vctlPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14742992"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14742992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 00:56:24 -0700
X-CSE-ConnectionGUID: RMitzn4mTsS+0Lk9dJDWqg==
X-CSE-MsgGUID: EL1lDlmDSmCGNbQVtf1j5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="42995450"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jun 2024 00:56:24 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFqw2-0001HZ-0R;
	Sat, 08 Jun 2024 07:56:22 +0000
Date: Sat, 8 Jun 2024 15:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 34/184]
 arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning
 (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty
 reg/ranges property
Message-ID: <202406081521.gxyp7Eak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   f5ebb40d8ef5b574bedcdf949aadfdce5a590d7d
commit: a9c1572548f5a0f1751dd003c44f586b1137e442 [34/184] arch: arm64: apple: t600x: Add display controller related device tree nodes
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081521.gxyp7Eak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081521.gxyp7Eak-lkp@intel.com/

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
