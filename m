Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD4BE40
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 04:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734841766; cv=none; b=rTByAyS6tdCtl6APEhQ8utZfyGGrlZZKXbfSWLtwjOXpK+fV8D5MUPUGIzN8euHcmZMdloPMi07yNmhThnWFNqbo+S1KogBH9Yz81uL8v3lpu9BCUHcqiskJV7YnF0t3X1N/6+fsAM28izX6EpkVih5sMNZrSCyJU0SO5GBEjXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734841766; c=relaxed/simple;
	bh=93M5+e7ObN/mxdlARprtX9qHfK5OFYQF/qOdU4HYUo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B54g3XrgqB5vouU3csuMfCPe+tFzS3pV5X89UEvoXSwTnTFJNlNpNkUpFZQWRR3DLu5zJC1ZQLxneYKzgS4WVCZXgD9ifM/+MoXZ/lrYWcJZmnI2IS4XSYrvLnoFocpAQYBanqkW9qHBxuw9cmIaapwvW+eoadepF09GIDvI9QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZB1Wylmb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZB1Wylmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734841764; x=1766377764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=93M5+e7ObN/mxdlARprtX9qHfK5OFYQF/qOdU4HYUo8=;
  b=ZB1WylmbBYQA+tGYQe2Zt9U+HqoUznZ7w31mI+VGQyw9i6Bfv8mb1hMq
   19O+mWBjWmsA8DN1c+RThzjeE+6Ws9ZlrMQM493/9vhIkmrQm+FLDMU98
   BKusNALqdOuzO2ed+PpQgjCtUW79vY7lS03kRO7Ug901HR9DPyqTDHDI0
   rc+fSIX0ylHMKByOcWid8/fTXAc6FTW6+29MUGJaYEspIc3bB83OwWZ10
   49pYt1dVtsgeX6oi/jhbKoWmcMw/3CnCkcn0l4Dcy/xqGlJ9hjBxnBCus
   BOiRbTONRpIQish6apltisUju4TdSolLs21V+Ga3p6SgOHOEcRqjMY3ZN
   g==;
X-CSE-ConnectionGUID: oUJEj+ftS5e+Z5pAH4+VGg==
X-CSE-MsgGUID: zxktI+EzTcOUjRW5DIRWzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35559924"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35559924"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 20:29:23 -0800
X-CSE-ConnectionGUID: BeaZFab9SJGJ6zF9rur25w==
X-CSE-MsgGUID: TW5HKh/+R0ikIe/03c/kLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99285712"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 20:29:22 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPDai-0002jF-11;
	Sun, 22 Dec 2024 04:29:20 +0000
Date: Sun, 22 Dec 2024 12:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 440/540]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: pinctrl@3500000:
 Unevaluated properties are not allowed ('cam_sensor_front_active',
 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active',
 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam...
Message-ID: <202412221201.VQu2EOIJ-lkp@intel.com>
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
commit: 51594ceda35aa53145e2d0e766c0432862b0ff21 [440/540] CHROMIUM: arm64: dts: qcom: sc7180: Include camera dtsi bits on homestar
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241222/202412221201.VQu2EOIJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221201.VQu2EOIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221201.VQu2EOIJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
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
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
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
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
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
