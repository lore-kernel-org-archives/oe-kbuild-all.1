Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A081CEAC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735198003; cv=none; b=ncP4pt5qNWQCSL/Rdf/gIQmT63rrP2wAGJEZNwVKSwClwtmFFp5w7Mef6f5ZIspwyrO3VVoGz0ZEHzlERa/bQ5jQAm9owApSycVawwxwZqQW1f0BYUtVQCnIX/0/dbaH6wtt68HdhVve4SFHzAjpd6Ece1u9HZenrsRJBsMX0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735198003; c=relaxed/simple;
	bh=7hhGB5fEWNFOG7FlPMOiGj/+Dl+PsXg6NfHlb7WCRbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCIer5P67BElyqfXZ+WxaNKef0G0RPdOLMoSI/vX9GLnfatfOBaBaG9pQqjrrERigVD2hNVpPMOE0TL3a5802cczsGYs3gdDGNaTMtrMOVRbFS5lzpnXtKxCfr+24gwWR1s/RtVoNfkNU5z5oX+n7b9RHLk3zy1KOWaL+ZEbH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUNpPm9v; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUNpPm9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735198002; x=1766734002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7hhGB5fEWNFOG7FlPMOiGj/+Dl+PsXg6NfHlb7WCRbE=;
  b=IUNpPm9vnLP7JkNzdaAH46lfQs1dD3IvKVQi7THo59ToOjxCHwGCjWDj
   zAQ44loZ6492KQiC+0oUxZ7JEEkqjqiZJ1zz3WdGO6uAHHa1CIRXx/2OH
   aIczQvbU0be96n3sdms6d0mfXZJgSwR2ou+XdXJXlUS4vb3wYAyTZOFVt
   c0q0slAQBvwHqekuG+31zgQ1+njoCkMWwXP0OUSo9/nVKNPVTBHOAGVVf
   15ckrOepO1z1as/19vyz+nbWm01oFgUiMZXTYkRbPMCLYexzmOTJXlgDs
   W9D/lGLhlE8J56c7+ly4oidJVbY9QKdlMsM1+/nIQjDBeNRG0gS3scc/8
   Q==;
X-CSE-ConnectionGUID: yJsU+wPmSe+YJgCjTJT7xA==
X-CSE-MsgGUID: pBp1FtyaQgOkTDI5im2qgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39394242"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="39394242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 23:26:40 -0800
X-CSE-ConnectionGUID: 4P0CjwbgSS2ISvvsPXacSQ==
X-CSE-MsgGUID: JN38TBl9SFacaqW4RaK6+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="104714140"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Dec 2024 23:26:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQiGS-0002OM-1O;
	Thu, 26 Dec 2024 07:26:36 +0000
Date: Thu, 26 Dec 2024 15:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: pinctrl@3500000:
 Unevaluated properties are not allowed ('cam_sensor_front_active',
 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active',
 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam...
Message-ID: <202412261544.y3ldx4L5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   811e48e07be5a00b2472cecba280dd56c8c200ef
commit: 51594ceda35aa53145e2d0e766c0432862b0ff21 [4/4] CHROMIUM: arm64: dts: qcom: sc7180: Include camera dtsi bits on homestar
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241226/202412261544.y3ldx4L5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261544.y3ldx4L5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261544.y3ldx4L5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
