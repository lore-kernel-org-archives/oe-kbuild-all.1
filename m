Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45824199FCE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 21:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727819892; cv=none; b=VqpVbggdq9ifDO0ORvjXJUroQQd/cjj82IJPLxMtAoSETMebbhUIyIPHV0pR4HflXP4NizHJwchsyeyMOAlqDfqEZ7A3YMgD8XMTBT76+vsP/Ca9G3+J3AvZ6JgBE8Z3p3YRBIE/kObQBfdUWPrZ4ZI8x/2+76MeJu9qJ937P8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727819892; c=relaxed/simple;
	bh=vF/cfn35PET5MUhj52HEPIJQBnUxWZhzjvcc+BeMb38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsjcPSvO27BJnJAP34Hyrv5lwF2pDZKUxeXL5+QMkAmcivVHa/D1Qu2hINl6+f+CVWMm99F8ZxNI+rM0DuOI5Qp44q899teAeeEwo+jND/w+Lu+2lqv0VR4zMo5cYmS8fNY64T3Os9hZ67xKa1WkgDGzatfuxRSMlDglxTrPg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hbu2PZCJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hbu2PZCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727819890; x=1759355890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vF/cfn35PET5MUhj52HEPIJQBnUxWZhzjvcc+BeMb38=;
  b=Hbu2PZCJABIRfK47a1Ljrd1UK85Zat8m5C5DAL+zgDUrkKouSxwiV6Cf
   va4iPQ9Nx88rV6ZUTlABgnDpltqU3ONB6cjV06dAIB0EmMVVl7q16lZVQ
   EVmFze7yj7oWsTjnVQnSr/byo2mqQWNpRtmKwPRKA1stR44pyPPlaMPOm
   cNjuo0Suglc8Zyj7nKWk710OrVMJIySyhPTEgAP5YHTnlG14cDQjZoERo
   59eRXr8AdpusI8qXRubs+18NhbxarUW5EvsckPfEcgc62YqRcf6/cbolg
   YwPPwE1Y5UwJEHfz8KsvFNhtl/OOBuWbhZaqRTfxBZCEbmtqJd7dlmk0U
   w==;
X-CSE-ConnectionGUID: x4lFqoFNSO6g7tjH3QlwqQ==
X-CSE-MsgGUID: KNWCsAHpTl+oo9bbwflSwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27137812"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="27137812"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 14:58:10 -0700
X-CSE-ConnectionGUID: q1bpfn5XRCqbqNEAV7Qm3A==
X-CSE-MsgGUID: 9W06b5gzQB2/Lkpn3c/YOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="73840585"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Oct 2024 14:58:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svksf-000RDb-2Y;
	Tue, 01 Oct 2024 21:58:05 +0000
Date: Wed, 2 Oct 2024 05:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 838/1347]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0:
 'vddrfacmn-supply' is a required property
Message-ID: <202410020525.JeJ1vb8f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   77df9e4bb2224d8ffbddec04c333a9d7965dad6c
commit: 02d697272cc62665a66930f3a3f9fd12f820eba7 [838/1347] dt-bindings: net: ath11k: document the inputs of the ath11k on WCN6855
config: arm64-randconfig-051-20241001 (https://download.01.org/0day-ci/archive/20241002/202410020525.JeJ1vb8f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020525.JeJ1vb8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020525.JeJ1vb8f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
