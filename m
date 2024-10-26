Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA94CA5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729926539; cv=none; b=W33UCNCK5fd8272jbyWOLxF9np8FZ8q2WVhPPq7CnoVDrxJVW6O33RxBtTwiyItHh1Wdo5l3cZC4lL/4/5+mFSFaSAn6QXF0IResQUhiTs/g9Zm6AVOmrZMUNs6n/Fv2N4qFlfgdwn6wUWzm0X6fIw0fm/O7ea2YuNSIWddE/D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729926539; c=relaxed/simple;
	bh=5blku/eVzKN/datqcVFyyHhM8Zd0Oo3mS7r9XSsRERw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/F4H5EQd4LkOIAKwFFuE4ce0WwJO5sPW5APvbb4YgMnSbP3O2+O3XfkMauc0drrUw3DleBciT8soixBP15WlbrFGq8j4VlZujM1cFHFu1fvVvXV+SlW08L+PFFT1/xhZLk/0LtZX0eWn6EMNinG0ZqM6pPSZ4URhGQ9YNaBH0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6UPBURj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6UPBURj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729926537; x=1761462537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5blku/eVzKN/datqcVFyyHhM8Zd0Oo3mS7r9XSsRERw=;
  b=D6UPBURjgO1+bnirfxPwPQKwhPjbBPL2HyWDRPJUbMmvI/LEOYT2Bc5b
   gk+1R3sxGgBAVLR6B1+isNQmTycFl+GTQk8BuvALILu0rJIf45dJQSfLp
   ApfpMKRxsJ8n8E03yWbNUVF1RGkL5vudR2LUvpEPcHy1t8OY02WRoDAZx
   sX9+SOH45vHczN99aWycCiY9adDS3GWKhhOFpMRjmYM7puA9F8YuxL4Wa
   IwvhOSJRZaV/8QjWS5Me4qI3PC/ZffJhMtzYuEFKRFwbR2R6VQdex9X86
   CDnzTvTnV2IPowmZZuUl/O1eQ8AsoOGoWslVq+tTFvLJTSHPYIvGCqEEC
   A==;
X-CSE-ConnectionGUID: SdxEdCdZQyWDN5xN+NqVLg==
X-CSE-MsgGUID: Y6f3GXErSXiEN2hnStgI8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29375311"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29375311"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 00:08:57 -0700
X-CSE-ConnectionGUID: etVRpX2tRgCK9VPW8tJeww==
X-CSE-MsgGUID: 6bxTnVOcTvqgoMVmzVY+FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81957234"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2024 00:08:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ajA-000ZN6-2g;
	Sat, 26 Oct 2024 06:56:48 +0000
Date: Sat, 26 Oct 2024 14:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/45]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtsi:59.14-61.4:
 Warning (unit_address_vs_reg): /soc/i2c@11009000/touchpad@2c: node has a
 unit name, but no reg or ranges property
Message-ID: <202410261429.6QcnXYw0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3f6ca9a14beff697ce0ae43cd742d5ee1ba03b97
commit: 1e05dc8b4efeb06c4e55b28a2dfb5af82ca01625 [35/45] CHROMIUM: arm64: dts: mt8186: Disable trackpad node
config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261429.6QcnXYw0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261429.6QcnXYw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261429.6QcnXYw0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtsi:59.14-61.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/touchpad@2c: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:379.16-385.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:387.16-390.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2255.30-2259.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2261.23-2265.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2267.35-2271.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2247.32-2364.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtsi:59.14-61.4: Warning (i2c_bus_reg): /soc/i2c@11009000/touchpad@2c: missing or empty reg property

vim +59 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtsi

    57	
    58	&i2c2 {
  > 59		touchpad@2c {
    60			status = "disabled";
    61		};
    62	
    63		touchpad@68 {
    64			compatible = "hid-over-i2c";
    65			reg = <0x68>;
    66			hid-descr-addr = <0x20>;
    67			interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
    68			vcc-supply = <&pp3300_s3>;
    69			wakeup-source;
    70		};
    71	};
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
