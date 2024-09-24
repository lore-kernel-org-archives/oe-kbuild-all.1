Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D013AD05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209545; cv=none; b=YFOvAgKN5dGRtxRKRM2JvwYEpkHtzqU0X6TpnE1o06o6v3MnYqUGrg22QMK3mkWhwEwVA99Yl0Rs8t7Kqwjf5mI50g2iDHe6C5zLwH1WLCpnsNum3DZZCXD7T6yZgKvHfotJB7xrfU8bRAmeG+NekC0j5P2VXjzAe3pTFYSiO+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209545; c=relaxed/simple;
	bh=X2woXZ+NBe+U0sO+AejUPlyyeb0MryY2XP8gaIVag8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUgKCMWODGyZSLt2L4Afhl/YPEqy53eHZRmRvBEVISi3w1cmdz4f3DtltxNbqWKzlnXXCwISfTn0PQ2c8yRhaEg1gsgZM3c8p/9NSYJnaAnmpVaDOhEAX9U+jYsxedfmZdld8utIYzCxhwsCi+SWW7L/AVCITFIiKrOsq+t0dnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmwv9uPW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmwv9uPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727209544; x=1758745544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X2woXZ+NBe+U0sO+AejUPlyyeb0MryY2XP8gaIVag8s=;
  b=fmwv9uPWVLUhuAKglDze/rruYDyqG6l2CTFhHi6Db48XPRsBqlICsFQy
   JkGcVt1+2spOsSKOa8qusqox0CbaXAEouRt+mABG/k9uvDG+2SdvsqPpb
   WU50efuCJIjh2aEerdisCCgRZM8x6bav7B7PwiSiPkWVf/zoBNIJAFiQc
   o3WNabprhTz0L1I28qB0RubJZhCfHzi+MmYCJE+dYiD/fH4wUC3Z6l31X
   JtvRgDGMVBNpPtca7XRw+BRMlzK1UkXfr1xQC+VpyvFCvkHq2eScFQ1Io
   ZfGefluR5ai4EUDrcOdPj+tE4R344n/zJEZ/bN6Q6dujo+9RM6jmUBEM7
   Q==;
X-CSE-ConnectionGUID: T27kmPAKRbe8S8ZhLjqorA==
X-CSE-MsgGUID: kNCNSQehRcWI6OO75K3rbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="25743925"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="25743925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 13:25:41 -0700
X-CSE-ConnectionGUID: ubKKTeBxTti0OU+kbXKbJQ==
X-CSE-MsgGUID: nZXlCQeNRoyvvI1ZR2ywhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="102300168"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2024 13:25:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stC6K-000IoJ-2c;
	Tue, 24 Sep 2024 20:25:36 +0000
Date: Wed, 25 Sep 2024 04:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 703/1001] htmldocs:
 Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a
 file that doesn't exist: Documentation/hwmon/pmbus
Message-ID: <202409250603.7achimjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 1dfb4885eaa39fb3269b13eee7d97481c409b8bb [703/1001] arm64: zynqmp: Add/Update/Sync DTs for xilinx platforms
reproduce: (https://download.01.org/0day-ci/archive/20240925/202409250603.7achimjs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250603.7achimjs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
   Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
   Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
