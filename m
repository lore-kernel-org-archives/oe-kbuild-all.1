Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0191CD2A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717940834; cv=none; b=fjr61a982v+TyqkbZfVFD7Qdi7BT1UsyIiP2mMdgR2r09VyMjXzwm6ueUA4bA6dKkwcOBOl3b9Tt1viRArfxYb9q10fjFLSxWhpNq0t+HFoBfPrOB0y5yearssQCPvhufmjqlwd/H+6woOBz5xqLTnamet0AZfvBtcvkrLVaQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717940834; c=relaxed/simple;
	bh=PyQ8z4KHUb5AaGTJuRX1H1+7Fgo6Wwjzld2NDztvEls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lkgpiPkV2o+6Z6/peLW/tJKYl4lSOHqxuWSq6HI4bST5K/3rfK38C5rBM5tHexhl1ZnXNU3HzfMB2uOXyiXLiC7TXS8Zfl30l/KTM4a2d0lOmulgCnRhz5dDknw8qznh5cTWnChrS8xTXaiFeARlfUHEb16hZ0C27rcdc1l/UnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmySt1i/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmySt1i/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717940832; x=1749476832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PyQ8z4KHUb5AaGTJuRX1H1+7Fgo6Wwjzld2NDztvEls=;
  b=BmySt1i/e8vwC1C1UoULHSk930pb5D2EZkjyoJs/oIS/pGN7KMl6O7To
   m7RrrdjrZPNs1+HsyjjndOaDdcPSxCKNz85Oc43XHJRC//lkJdozM9nj8
   d1bW9FXAdYeAr/JWwdlPsxUSY3E26rMHXfD4N5bIgPcnk3/+waTZony3Q
   InwJ9p4YQl4TQLRgLbDwSJ4WeJ5Aq9+ILdPU5lkCCutQW2bPjd4JprE+2
   60LoGo0acYtl4Y0YCrqU/c9BYNqMbvdo/rFRvsFt1XyT0uiQZyCF2EPfr
   x0eXcoVftczxnWXFxLlNRS1iNi7BlUzj1kIPEIl6jDmLxzrK7T7WvghVr
   A==;
X-CSE-ConnectionGUID: bCA1lnBRRDuXnp+yASMLNg==
X-CSE-MsgGUID: a9IY4BBLR5C5UnmAsyqOzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25265246"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="25265246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 06:47:12 -0700
X-CSE-ConnectionGUID: /zasrJOSS3C2SPB9AEuBfg==
X-CSE-MsgGUID: HPzVtNHYS5SCmbtPIamMuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="69592559"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jun 2024 06:47:11 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGIt2-0001GC-1m;
	Sun, 09 Jun 2024 13:47:08 +0000
Date: Sun, 9 Jun 2024 21:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 34/184]
 arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning
 (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty
 reg/ranges property
Message-ID: <202406092157.rwaHkm1P-lkp@intel.com>
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
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092157.rwaHkm1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092157.rwaHkm1P-lkp@intel.com/

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
