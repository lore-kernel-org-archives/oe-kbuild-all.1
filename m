Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69051179AA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 03:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977847; cv=none; b=mZTDeU7sVvh7sNlRQq8o1zL1j/54bGce0pSGmXl5I8MdcjWNM4QLUltYvM5h71pq14AokOs7XBBP0OukYWvtDr0YZGQywCHjvbca320VQ1w/LsuIxWPsOYgKOfdS7N0u97vvEB8QuFeLLIBgOKlKOgtm9Mp9a7ERiiCauX59Jng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977847; c=relaxed/simple;
	bh=LR8y9C97CCkoswk0GJImG+cbLxVXXI0RHpx+sKqeVDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZ2uMDsuTHUMbRZrMGm8ofk3aCryhNEutPgJdxrTI3BKzO4vAbMaOOCupyEgGBusXdub33inxQLld9jIw+FY6ecVTiVRpThzZjrZFZifN/gmzTkPTouKjNlX4MOufMArwkLU9ItJam0U5NmBFOkWUHtbzN/W+K5I3uVK68DUnAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHb+s2L4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHb+s2L4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719977846; x=1751513846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LR8y9C97CCkoswk0GJImG+cbLxVXXI0RHpx+sKqeVDU=;
  b=VHb+s2L4a1IXU8ZWukGGqA/Ub9lOwz2IoFha9ZcttBU7qyM8K43OqoQt
   YAEtk8i+kC12Xse50v51iJ7HpJIYwocKt8vKJuislkFspySQumJEJ+kLU
   NkS8jxYIsOdqZvFLMsJu5wYrsyTiagJIpv107Kdl1ybKAm9FRjEcztiK2
   CiDR2WCQqEdfz9BwbOV3XGy3WNpgk4TNjDZVATVe9PzXkbxAWpXQxEyZ3
   et7OnIARpeKMg1leenv9skOtoWTm2Rq4T/7ZC3UdiAtZx6MfioCDynDw4
   rQsa5Bx8hOnauc6rT9KBWXl1zsqksdZzItMpMpdcxa9z/Hx/di4zWkllO
   A==;
X-CSE-ConnectionGUID: K0UGecxPT7uRuwaD8CCC4Q==
X-CSE-MsgGUID: M6Zx94vfSM6gxyBr1Vo1NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28579340"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="28579340"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 20:37:26 -0700
X-CSE-ConnectionGUID: ja+58z/LQieImVjFlLRd9g==
X-CSE-MsgGUID: Ox44XXOSTtaNVuMmkaYGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="83663600"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2024 20:37:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOqo5-000PDh-14;
	Wed, 03 Jul 2024 03:37:21 +0000
Date: Wed, 3 Jul 2024 11:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 132/264]
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: clock-controller@1800000:
 '#power-domain-cells' is a required property
Message-ID: <202407031114.6QgSXb3Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   818c2676e5816dad5a77df5a1c0d99d0e160d0b1
commit: 6c2e3ca212dd57678fbd38d66d63a0dcab45e81a [132/264] arm64: dts: qcom: ipq6018: fix GCC node name
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240703/202407031114.6QgSXb3Y-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031114.6QgSXb3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031114.6QgSXb3Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,ipq6018-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,tsens-v2' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: /soc@0/thermal-sensor@4a9000: failed to match any schema with compatible: ['qcom,ipq6018-tsens', 'qcom,ipq8074-tsens']
>> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-ipq6018.yaml#
>> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-ipq6018.yaml#
   arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: usb@70f8800: interrupt-names: ['pwr_event', 'qusb2_phy'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq6018-wcss-pil']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
