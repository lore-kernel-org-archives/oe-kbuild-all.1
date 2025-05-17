Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590614EC5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747464679; cv=none; b=BPGvYqLSWVqNo0mDMJB3LpJVbuXQqrotJ+TBilV4R44UBzNaS8CvELDLtHMrK0I44XLVLE5EiMV1yUZ1nCj7asSCiUq4sgY3Ww83si/u180SsAX+SFThlI41B6E/2J89MOG4ZEdOGb2dbGrm8w/ZdFtoU5vmur6JdEgrXz81X1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747464679; c=relaxed/simple;
	bh=brPCdPXnr/iI5Irvyay/HwttusRt+cKyTD/g0sE/xEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDyBfMya8u3Yzuvq+x5/YYVdGlVjXqWPa4xNduNaOdcpFP4HamzZlpL1RuUczASg68eDG5R0DfAD3QejMdFK0ZrEpqiX2sIHH3MhzbveFOZ9gOwdcMZgYsnsQZkgKvO+KffDIojyzNQwzhxO9wrPYyXATzGH6fyI3jTuQ6CfLZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfPGGHVx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfPGGHVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747464677; x=1779000677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brPCdPXnr/iI5Irvyay/HwttusRt+cKyTD/g0sE/xEk=;
  b=jfPGGHVxp/qAfd0gjxosYr/gRpaMoaRqyPsDaGizP6Cv5VGKkFQGXrkQ
   oreQ9rqETSk5J+LZQ8VLElIaE3kRCBW3lXXZKHv7NYZvoOSN4eYs0Z+qG
   jDYsJlPUx3FCXmnUEjVrckmq3w7Lof4zIFvtuIS/bcVDN571Vorf+//8l
   FiPVY73MQhDSYMPIold2t90SfMnv6/iFVs2lHw3W6UGcaJ9Z+TJ9ko/CU
   QG/hQTd7hsqmxEuwkWSVzO4oOY3BW6cO5ckJysr0agH3Al2lSK00VhjWx
   0m83Mqw+3IFk/QjuKCWg7CnmpAdqVRAu4yDH9+K0m2qohtKGmsNu+aVz1
   w==;
X-CSE-ConnectionGUID: MEn2uV4yT8Ov4vbNR7Yk0g==
X-CSE-MsgGUID: proaHBOoQXSHat5BBACEOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60829699"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="60829699"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 23:51:16 -0700
X-CSE-ConnectionGUID: ihZin31kQne6mKb3C844xg==
X-CSE-MsgGUID: ntz3hPUNTHG9PmtpsvJ8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="143767821"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2025 23:51:15 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGBO4-0000VH-2d;
	Sat, 17 May 2025 06:51:12 +0000
Date: Sat, 17 May 2025 14:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 Documentation/devicetree/bindings/iommu/google,s2mpu.yaml: title: 'S2MPU
 device tree bindings' should not be valid under {'pattern': '([Bb]inding|
 [Ss]chema)'}
Message-ID: <202505171404.XD6ylE5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: f43970daf2ba60180a120df01c4b9dcdbdbed254 [1/1] ANDROID: dt-bindings: iommu: Add Google S2MPU
config: arm-randconfig-2052-20250516 (https://download.01.org/0day-ci/archive/20250517/202505171404.XD6ylE5V-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171404.XD6ylE5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171404.XD6ylE5V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml: title: 'Marvell PXA/MMP EHCI bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/ti/k3.yaml: title: 'Texas Instruments K3 Multicore SoC architecture device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml: title: 'Qualcomm SMEM NAND flash partition parser binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/iommu/google,s2mpu.yaml: title: 'S2MPU device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml: title: 'Allwinner A31 MIPI-DSI Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/vt8500.yaml: title: 'VIA/Wondermedia VT8500 Platforms Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml: -pins$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
