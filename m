Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF33BA27
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 03:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706239604; cv=none; b=M2ozDgz9Uvc3dqv3s2yeGgC7kMoIofsOIJ4ix7yGQ51aeLfLmu9YVg8fujQcI6xZdnb/CWDC3LSfPr05VWCAq3oC7dCHWbTT/jsvMYc3V5IPVFAri3hcrzgvJYiBaMkBg/pKt7l0/kqqfMvFeI4yT0e/kvYK0eXu8HxSdJ9zY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706239604; c=relaxed/simple;
	bh=U34O/dhqN0bHI03C78usk8vbwcwqyvXyk5KBir/aKu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZS5rTIGitxNjiJpnXGqGMUMsNjykTdKxgLrkBTRPjFEQQZf3ns8njj6lL/2Cy0gwMwKt73MaRqcRRQJVaJca6UW22YhUBqLgyZ9mG5D1pWY8toCBSzVxo1PIn6jj/70nle9z+v44dH3EWAQ2clomAcWLgr9o2tZw8upf+cimLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+Szxqa9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+Szxqa9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706239602; x=1737775602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U34O/dhqN0bHI03C78usk8vbwcwqyvXyk5KBir/aKu8=;
  b=k+Szxqa9rrpTZIVwKgt7d43lOYFL8x/4BN+5OFOg8YctoPHrIs8MOy6J
   9C745gc62wQ3EObVyYquCnhdnL301XOyWqDkS9kHFAplren+gsfYGV6Pa
   tg0VV2/P8Rd5IgXfj6YK+RTiLUGn7VmDG7V3laYOYUE7h2UGb0OdHgKAQ
   46ZFMFh3ysGB2xIq0H+7jy/8N+332b0eAwWGAZj/x4Pm7xW4PDqne+Ry8
   9iz+aa6SUYqTSZp2mqePyOc/e5Qp4rd2woWWuxnWohsLRr4B/nJDP6rzq
   TVxSYbXP8d8CSMXgVH9C3kypaCRiisZgfiG3RCTfneGD/wz4IKFTe21Q0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2268609"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2268609"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 19:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736554343"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736554343"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 19:26:30 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTCrM-0000d2-02;
	Fri, 26 Jan 2024 03:26:28 +0000
Date: Fri, 26 Jan 2024 11:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 4/26] dtbs_check:
 arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: Warning (pci_device_reg):
 Failed prerequisite 'reg_format'
Message-ID: <202401261146.v3F48U3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   fb6a0994823f342830125766a3a87639cffea5de
commit: ae731dda9a603073b32b2daaafdaea6d294acc45 [4/26] BACKPORT: FROMLIST: arm64: dts: mediatek: Add socinfo efuses to MT8173/83/96/92/95 SoCs
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240126/202401261146.v3F48U3z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240126/202401261146.v3F48U3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261146.v3F48U3z-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/boot/dts/mediatek/mt8183.dtsi:718.5-23: Warning (reg_format): /soc/efuse@11f10000/socinfo-data1@4c:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:722.5-23: Warning (reg_format): /soc/efuse@11f10000/socinfo-data2@60:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:172.36-179.6: Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:180.36-187.6: Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183-evb.dts:208.23-241.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc0@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183-evb.dts:267.23-285.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc1@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:744.26-750.6: Warning (unit_address_format): /soc/usb-phy@11f40000/usb-phy@0700: unit name should not have leading 0s
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:717.21-719.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data1@4c: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:717.21-719.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data1@4c: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:721.21-723.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data2@60: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:721.21-723.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data2@60: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
