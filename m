Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C000201264
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 21:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719954855; cv=none; b=H6F7XywrmX+6cFfCE1fLU0UciEeter3kykAzSTaHHPHY885j6Jb1IJ1VmU7ohzpJtjqrYn+KQm9NkJlwkrTbZFnLkfK2czho2GYjieEQ5A1vZtIUu9cuAWoiApcqhbHUyyzVvpzt3sGI7TnwCpyruzI53+8ANz4uzk1UJg0fnYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719954855; c=relaxed/simple;
	bh=JWobcdExDKpjw4aJZvuDDRJbUJ8kWZhYeXMH2p8djsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFO3j1Z3RAwtQ1N9Enzo87pcuuifPKKTiOhHT8ntPofCPOwmuulr3KizZvILng7J7k8AKYT7ZbOwGiUnET9AIVA3vJkxawH9ko0I29E3JZzHi/NSZPS4EvAj5veHVpcgz8NIhKaUXKFfaaB2oBX5lYAJ1e/1OdjxC3D/BENBNFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XczK6rZr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XczK6rZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719954853; x=1751490853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JWobcdExDKpjw4aJZvuDDRJbUJ8kWZhYeXMH2p8djsM=;
  b=XczK6rZrRaoHMWCSwMM3qhI8QlJW56Gsk6c5r0Mcf3DIBxhAvv3GH8aQ
   r4KbclmeF5CW+9izECsr5rfeZ/JTZoWqsTcqRWEXNYLEeAxl8sBE6nFEm
   lis9+iPMDMb8LkivllJAsIBgwZDZ7Vak6YbjetD3AC10mIAFy6IT0LqL5
   sI1EHjMn8aG5B5f6TvoMIkWDyk+9yiPOoF7r9bJ+HKnyPuOrZp/NxHuLB
   JdfZmC6/1s3AUOjpVADkA58qxOX5Auynq27o5pQVc+xHGx8zvKcQhTq+7
   KhY5nXqJQmTnVtVpIUjoK5mbzmS0pmyjReqdMZNq+vgkJTSpiosiIyII8
   A==;
X-CSE-ConnectionGUID: Cs+D1sUHTjigsy3Splj+XQ==
X-CSE-MsgGUID: o1dwVzyeSLGNKakkEc3qdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16814002"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="16814002"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 14:14:13 -0700
X-CSE-ConnectionGUID: CBaeG6rZQk2i7T7gn98apQ==
X-CSE-MsgGUID: D2C/HMEERiaQmbl+oJ22jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46675048"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jul 2024 14:14:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOkpE-000Ogg-3D;
	Tue, 02 Jul 2024 21:14:09 +0000
Date: Wed, 3 Jul 2024 05:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 32/264] arch/arm64/boot/dts/qcom/sdx75-idp.dtb:
 power-controller@c310000: compatible:0: 'qcom,sdx75-aoss-qmp' is not one of
 ['qcom,qdu1000-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sc7180-aoss-qmp',
 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-...
Message-ID: <202407030527.PhgIfwwD-lkp@intel.com>
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
commit: 91f767eb693881c0424e05866fde3c033c86c2d3 [32/264] arm64: dts: qcom: sdx75: Add AOSS node
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030527.PhgIfwwD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030527.PhgIfwwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030527.PhgIfwwD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sdx75-idp.dtb: power-controller@c310000: compatible:0: 'qcom,sdx75-aoss-qmp' is not one of ['qcom,qdu1000-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: power-controller@c310000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: /soc@0/power-controller@c310000: failed to match any schema with compatible: ['qcom,sdx75-aoss-qmp', 'qcom,aoss-qmp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
