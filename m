Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3167056B8C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 08:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734768435; cv=none; b=Ax989eQhXcjIpyJqnIydOKPbdWZzyaEwHfQMKprYOm8nKo6PWJHopFtyDB3o3Frif1nDf8rqhTohQZPO/yWIl/NYt2zt4grac6X47qfW0QskrkPrQjQ0t/P9zj5lpcU/6ghTbkF7gkGmAaNrWpkJBglyCAW7SlXgxcevfj+OkOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734768435; c=relaxed/simple;
	bh=dhZmguP4krhCsfKp7z4Jk0mK2lBChkmWfDJZmK9sP+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gp6dxGbO7bphxOVu1OHi3DXvbcjqRcT/77ySN0HmKOUwuDeNoqXSLACgEkQlyDRiUdaVBh00FWxWRhpkl5/91UKi/UVOzFDXUsDwz+FTYsgPV3zEnVpGPIGVfv67IEix65HsOLyZla/SVAXD+qVJrD1DmvcEdZVCPkpFIJUxWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiN7VHxQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiN7VHxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734768432; x=1766304432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dhZmguP4krhCsfKp7z4Jk0mK2lBChkmWfDJZmK9sP+8=;
  b=DiN7VHxQCENIYbjfB0fMkTPnzeBfiqn5qO06NxX8ZAiCzk3FDKeDpETL
   EYdxX5T78VGXexUIQOJcJHKlzyEIqwrYpDInKCLSTRdet8O/qS3SuJ8lA
   zqkIfJRWkB6jPXMreQ/VYsTyRprLcaTzbqGiKqObD3vPh05zsmhpNDiQH
   PNOflKUw+1R2Gcge3S62bIA9/FIHTrDKH4FhbrhsdEB2bn6y6zOXPEhZH
   c2gT/kFbpom2xwAaQrDorQ4o551OO4O5R65XmNFy+rxBJUhPVb+k3u8eO
   36F/lrT86YJrnsreI39Z0n+uTMXjL/zvQJts2Ey786KHyy6XL0Jcdf+3A
   Q==;
X-CSE-ConnectionGUID: WRC+nd28Rsi5s4X2hH0lwQ==
X-CSE-MsgGUID: lH7bcS9bQ7Ku7+QuBbkvMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39093708"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="39093708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 00:07:11 -0800
X-CSE-ConnectionGUID: ZjAr985fQiCe+Oqu0v8QqA==
X-CSE-MsgGUID: FfsqwdZwTaq0swV9haW2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98499525"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 00:07:10 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOuVw-00024M-1F;
	Sat, 21 Dec 2024 08:07:08 +0000
Date: Sat, 21 Dec 2024 16:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 421/540]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: pinctrl@3500000:
 Unevaluated properties are not allowed ('cam_sensor_front_active',
 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active',
 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_s...
Message-ID: <202412211502.rhmt5hI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   76e007709ba23b69273c6c8ed1a893c1ec7b7df7
commit: 0be9df50c4f22ee1297964e758b58a7d76379c63 [421/540] CHROMIUM: arm64: boot: dts: qcom: Bring in camera dtsi bits
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241221/202412211502.rhmt5hI2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211502.rhmt5hI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211502.rhmt5hI2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: soc@0: qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('chromium-enable-overlays' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc7180-dpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('chromium-enable-overlays' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc7180-dpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('chromium-enable-overlays' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc7180-dpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('chromium-enable-overlays' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc7180-dpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
