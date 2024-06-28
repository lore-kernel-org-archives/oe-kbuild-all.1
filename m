Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6E155CBF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565769; cv=none; b=bRv9UyvUqnFZO+2kiBYJ+bFogY2OVwiGWUSM84yBSPFPa9rqtUtnKksptSqtSZ0pA7MVjaPl860KcBXdTlVJnmkFHc2k41n93+HwA7TdG1CqVTPnuFS71SvvRr6qhY6pKo7k9Q5vEN7HJSPmwOz2AjRw+PKBk7h1GLeRG1Q5MZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565769; c=relaxed/simple;
	bh=LTdIoP2WCEaKg7a2Y/36+SfPw9/Wcjs2IvMGWlZeDik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/yooYtOIKUbRBRrQWUWW2abL62aErb7lF1Mvhqi2D01H9Nptrs0Ly3DMgvbqg7HiIQkFPaTt0f4hxVKlMXytxf88e0XASYONmRji+wp0KgeSLRFqzlcf9ckEIljWfSziY68rQRXc1i/FMmlz0dAkWE2d9sTJuYUViLz0yHcaOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bG5ci1a8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bG5ci1a8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719565767; x=1751101767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LTdIoP2WCEaKg7a2Y/36+SfPw9/Wcjs2IvMGWlZeDik=;
  b=bG5ci1a8IsAny9IpL0Sk6lsJK33OdmVgvbxfehLhA2Q307F786mDzRCz
   A57gt/boXiW0pYBX7wf2Hsea4ZurcYM25iEIA0TVWUVm9SMrmcnJB1JW5
   BXqC/aT6ZT3vwbU9sV0se/7yoC1tuW2yLOe3y6Ggiw8wNLx2E0zn5e5H0
   jNnnEM4HDtvQBQkyQxbNDY0txviYXsvQKphIKWHnFloDTTQTgA2fCfkT7
   YU4n1MTT1dbv2GMSOUQ4gpXbT4MKbD4VnhYu80KRf9gfUxcRQvrshtQlj
   MoXAkY27o41eDnhr1GO5v4SlsifEIubsg9YjcIOr+jpqFjG4DyNMjFS3B
   g==;
X-CSE-ConnectionGUID: e4kKZK87SBCDV+RQbDjEiQ==
X-CSE-MsgGUID: 0v09BD2XQkON6D818aAn7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16873182"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="16873182"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 02:09:26 -0700
X-CSE-ConnectionGUID: 7fjNiNbzSaaAODaaOLwROQ==
X-CSE-MsgGUID: xNKFTuwYRlS7Cdy3bhihqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="45090976"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jun 2024 02:09:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN7bf-000Gve-1F;
	Fri, 28 Jun 2024 09:09:23 +0000
Date: Fri, 28 Jun 2024 17:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 32/251] arch/arm64/boot/dts/qcom/sdx75-idp.dtb:
 /soc@0/power-controller@c310000: failed to match any schema with compatible:
 ['qcom,sdx75-aoss-qmp', 'qcom,aoss-qmp']
Message-ID: <202406281731.xcp6l5yy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   fd513b922e34edb0db1284a4abee7f6c10ffd9a7
commit: 91f767eb693881c0424e05866fde3c033c86c2d3 [32/251] arm64: dts: qcom: sdx75: Add AOSS node
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406281731.xcp6l5yy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281731.xcp6l5yy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281731.xcp6l5yy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: power-controller@c310000: compatible:0: 'qcom,sdx75-aoss-qmp' is not one of ['qcom,qdu1000-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: power-controller@c310000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
>> arch/arm64/boot/dts/qcom/sdx75-idp.dtb: /soc@0/power-controller@c310000: failed to match any schema with compatible: ['qcom,sdx75-aoss-qmp', 'qcom,aoss-qmp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
