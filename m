Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2293947BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805792; cv=none; b=jWoSo/lasYtvb7XGWQUk76EcieDNdO3cxY/C319aShEBaemmQ7bmjH5ypSH39XeuHk3CMWFfpXUCLGUMONE3Hgi0hOFdIvlSYUPeXmMVkfi0RHE+dryQeOMdBvMrDh+es67ovQMrK9rR3XHAOsPzT2Kr9N/ZiVmB3MIwIzcaKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805792; c=relaxed/simple;
	bh=HiC8a+QccsTF07/oD5Qk8UZ0ETkXa359tUgK9CHlHbE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e3Q5Ykk0307cMbPAaPHJDmBmGeDGM5BE2ZoYWC/JC5TgY8aZ3eHAaKxCcjpA1I9mkKLCQ3eQto3sk8hkeu5dnM3T/4BroskUEObRA3GprTHw1Yz5Xsz/K20H8NFzs3SZpoGq3TQj4a3ITGJ+FxVH5FeCHm9zLEcHTRMKRguBS60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5+znfoU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5+znfoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775805790; x=1807341790;
  h=date:from:to:cc:subject:message-id;
  bh=HiC8a+QccsTF07/oD5Qk8UZ0ETkXa359tUgK9CHlHbE=;
  b=C5+znfoUSguJ5gmXLuummMMYo/1vT4pD+7JBmug5XmPHLOGQ+z7UIV7c
   wcHwHbyqCuBSuYql8Rzlit9XxedaEPF+IuHqdHk724AZQhYF+DOXH7DuB
   3qS6Qt7Kw/taTOWAidViszzUoj3l+PDzD+ga1XE/vf4mao4h1EwbYRy4f
   HkAsMuw4WzlwaEMEdCbRMiyhClW5ULRsddZVGLP+Waeyug7gMZy+N58ee
   D20Eb5s+pcpDDB+pLR1BIyih/V2YiZr+WN9lUHEWDIiA59pogjU6YBf0+
   OkVB1WfwKY3hjEZVAAD+O+Jbn/ZcfXHy1SOts8iNpSpfOjeHtoEvuqYRE
   w==;
X-CSE-ConnectionGUID: NyEU3F9lRLuWqb7VB5q0NQ==
X-CSE-MsgGUID: CczRWVRDQNWDMy3iTxuJSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="99453526"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="99453526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 00:23:10 -0700
X-CSE-ConnectionGUID: wAsXD0pyTBay8IhE5Z+5nQ==
X-CSE-MsgGUID: APrDBi5hSz+MSi57pe/wxQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 00:23:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB6Cm-00000000Aq9-2jFr;
	Fri, 10 Apr 2026 07:23:04 +0000
Date: Fri, 10 Apr 2026 09:22:07 +0200
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: 
 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb:
 /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible:
 ['adi,ad7147_captouch']
Message-ID: <202604100932.aBQXzfT0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: 7db5fbe508deedec6c183d5056cf3c504c027f40 arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
date:   3 months ago
config: arm64-randconfig-2055-20260409 (https://download.01.org/0day-ci/archive/20260410/202604100932.aBQXzfT0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604100932.aBQXzfT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7db5fbe508de ("arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604100932.aBQXzfT0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
>> arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['adi,ad7147_captouch']
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
>> arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['adi,ad7147_captouch']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
