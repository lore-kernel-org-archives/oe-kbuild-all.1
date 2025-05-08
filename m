Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045F6215772
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 23:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747182; cv=none; b=nuhLp7Tww20ug9/2mI32+ffDcGFvA41FvdeS4X+5ESbN1Yp3zEk4sfHbY3FeA8fLQ4gfxjJtFKtXAl2YgvqJvkSC2d3MzLtEi4Kb4qi/f/RPTSi5+G60/hLYtUaKDipHpDCh2uaROsm0uCGruPkuYPAVHJI1BapX1FRo0VNYLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747182; c=relaxed/simple;
	bh=GzJvRtz4jLGr5nTLzmcy2/qzUET3sUEdh2hLRvg2iFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ip/Ho4xvhkJjpX5YgXNDYSgYRg1ItK1+W7w3Hcm6eTVgyQkiyss+ujRMSP73uC+/3M7xI82mCozfhPcPooNhrLnwSPB1cBfSSpr4rsFchPOQd7gwnUzVt+904XYvF+DPjBUaXDkAaLl5UQBhiZrVkCvqhNneyv2iEhQyD8lfEEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ejm+85QY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ejm+85QY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746747180; x=1778283180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GzJvRtz4jLGr5nTLzmcy2/qzUET3sUEdh2hLRvg2iFs=;
  b=Ejm+85QYIkSCPjTuI7swu317/uODjVqy9ZICZ/GFjeG1rCKxIGuwewGK
   v4S/dFzI0s4nVZKR0Ppup6nAeFjJJRNYlaU4lpaG0adhvb3DVNl4bGf7N
   BbpwSSI1899UFzatVnG1d2pgTWzPc708LH/vIqKsy2TFbtTmhaCf2cuUt
   F+5fWnDd0/Uvil16dLLNB/SDlaWtO2Uf7wZoIHqqGiNKivNEebtiC9B7d
   YES52pKVkTNozJ9dZm1KDWsHzZKaX4laWQMdWUQ63D/IQ5d843n5QC5W3
   GEbKfX2paGt0vRAr4RVXcmM6K/A33H3lRCQkTHGiCPoEQA2ZfFkIGj7cy
   Q==;
X-CSE-ConnectionGUID: DLfgCq0/SBauqL689UDMqA==
X-CSE-MsgGUID: D/M7D3/JQt6Purcnxa1X3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52372248"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="52372248"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:32:59 -0700
X-CSE-ConnectionGUID: lDV3WYdnTZiBKOBBrpp90w==
X-CSE-MsgGUID: vliJDrJ8QdeWNAxn21YeXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136453368"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2025 16:32:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDAjX-000BT5-2b;
	Thu, 08 May 2025 23:32:55 +0000
Date: Fri, 9 May 2025 07:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 8282/9729]
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000 (fsl,imx6-mipi-csi2):
 'port' does not match any of the regexes: '^port@[1-4]$', 'pinctrl-[0-9]+'
Message-ID: <202505090738.CNCKpuyW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 48dbb76cef65fabaa3ac97461eda90495e954ecd [8282/9729] dt-bindings: media: convert imx.txt to yaml format
config: arm-randconfig-051-20250507 (https://download.01.org/0day-ci/archive/20250509/202505090738.CNCKpuyW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090738.CNCKpuyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090738.CNCKpuyW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: pcf8523@68 (nxp,pcf8523): $nodename:0: 'pcf8523@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf8523.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/bus@2100000/i2c@21a0000/tc358743@f: failed to match any schema with compatible: ['toshiba,tc358743']
>> arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes: '^port@[1-4]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/fsl,imx6-mipi-csi2.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
