Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A744158D80
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 07:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734853783; cv=none; b=hWLonOQMtWmGCykuAf+QxKX1cr0ona7Z06aDP8z58hoMy81Eh5gYQZc/1e2qi8dSXYXpdLsuGaEqG+cKLJK7bDs1QHb6OcLMhvyXPmhSOLYbyOGoAa4qMDItR8tLldN9tadrsi3l6dhwRwMNiU+qaF60dEb2CQbk0bL5InWykqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734853783; c=relaxed/simple;
	bh=i6rkF/LJ4t3pETPYKti7UY4E1DJsRniqIAL84IEaiUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n9MrxmybLsYGlILQMP1lFtXyAHOFjrVHnnx+WIelPKvGXzvc4+hD7XUNYzfPId6dPlqXpR6Z8hAkhKwxXgCcdqCu5CDJwVXOSvn1vyWQp/6D3lgXdyslEHAsmbFnbcGm08NGHk51nD4RF7lNumzXZBQeljbZY5B35OeC/+BOVKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2th4w4b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2th4w4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734853782; x=1766389782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i6rkF/LJ4t3pETPYKti7UY4E1DJsRniqIAL84IEaiUI=;
  b=P2th4w4bNLbyqwi7MIA2oyqMsDyP77ni2qUjxELPgWYtMj5c01aq8iRi
   YwVALdMt52/3tQpyfY9VoIQweeiW7sldeBL/pZ+WpvUOaPb0+KHKuJ/Ys
   ykkWUHKa5wvfwipyYBq76HKksTKczRoyEDAIhJU94reF2l3q9osbOE+CH
   UcAvTsWAz1VNe9a3q79yxEBpiN29/p7KGG2yaylIorzlkmOm0orzganP3
   +h18VHG9Z0/gyRCPENml27zfa5LFo7+YCe3LFxIIEkijoBp6rbFzMvCGB
   pKgq9GZMt7i4PLqj96mAK9qw33xoBR5nBS61aAZ9R2UsYnLWmX2uD+92c
   w==;
X-CSE-ConnectionGUID: SQYKareoRd6VCexatUvWgw==
X-CSE-MsgGUID: kEXL15PgRg2g7YOrg+KXTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46767029"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46767029"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 23:49:38 -0800
X-CSE-ConnectionGUID: iQowAPZoSjqo/Lne+DenSw==
X-CSE-MsgGUID: PB7IGvjlQXq0mTnvwY95cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98686991"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 23:49:37 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPGiV-0002nL-16;
	Sun, 22 Dec 2024 07:49:35 +0000
Date: Sun, 22 Dec 2024 15:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 442/540]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb:
 pinctrl@3500000: Unevaluated properties are not allowed
 ('cam_sensor_front_active', 'cam_sensor_front_suspend',
 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend',
 'cam_sensor_mclk1_active',...
Message-ID: <202412221559.DN6xcs1p-lkp@intel.com>
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
commit: 9eb4da56ac11238b4d176dd887f03a1a3220ea07 [442/540] CHROMIUM: arm64: dts: qcom: Restore camera bits on quackingstick/wormdingler
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241222/202412221559.DN6xcs1p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221559.DN6xcs1p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221559.DN6xcs1p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: soc@0: qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'avee-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: panel@0: 'avee-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: soc@0: qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
