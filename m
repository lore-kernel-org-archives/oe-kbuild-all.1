Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4830A2F50
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 22:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318060; cv=none; b=b/QNAoPfASREwxCGg4opEwbx8VvjGiAkjzQ3x4ugsWXdOAjKcHp+KVhwaSRcRoJUJwpuWdaCQBWTAdKdLar2C25n/P+Dxh36B2maiH3zDYTXRc2u0PAZYJaxj5UuZ1twHjR/rHHk1BBDU6g41sIwws/CXhSj4ogJwctUfm+CZ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318060; c=relaxed/simple;
	bh=0WqEhDI++ucbrD21jEyucJ0vxignkWOTHHtYgYRP7lM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5Zf0jpHmBH0ed2E2xe7PBP9dXb1rFSHEb7N2YEu6yj8sfwEQBpAiSVguRObLXo9YSx7pZVnI6/esB32Eh2BUd4lp4BH2/SY6gcK1/7WAmkg/GzjDZ9WxnX9/c2GVfJ4etVbGHJE3NOUR1de/5RrQi+BGpc2sqQGOaWErksP+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIXNRmXy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIXNRmXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718318058; x=1749854058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0WqEhDI++ucbrD21jEyucJ0vxignkWOTHHtYgYRP7lM=;
  b=QIXNRmXyfiouYYhAg/AFLygj7ANgl/JWODWjz8M6cy2QSn+QJ26sWfgu
   /CEsZ9nZgTmCEVu2VYeMMWFCHzWmLCceHoBUOt3uHDFy0+M9vYPn5hWJO
   xSHj4DYcYHAPxlGOD9BANKBEPYKEhTLNoe2vD7Ib8pMYATTDAbX+/aRyw
   0P3jkb264rdeSZCFMEdQgYUFiVIWAhGcIXUiY9O/Q2A/y0AFJBtCXDAjQ
   GREKeiE5ihiU18VV7/NE+EwfZRvtKaibPsN/2bbEKYXjN3Hm3F+beZi2S
   jmcg7qSY4HrNoNJBnh4xAQkX2ZfNC2a9NyoRl8LXbwAch2bG5QWAMUGdI
   g==;
X-CSE-ConnectionGUID: maHDKS1USeCMCHeKWe777g==
X-CSE-MsgGUID: Q8lNT2mcS7qVp0GMcrnHqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15343362"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="15343362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 15:34:18 -0700
X-CSE-ConnectionGUID: G+D6cUbdRPC/V8i/osEr7g==
X-CSE-MsgGUID: ZeK5vhEnQKCAmIX1OeM/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="45429713"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jun 2024 15:34:17 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHt1K-0000To-0r;
	Thu, 13 Jun 2024 22:34:14 +0000
Date: Fri, 14 Jun 2024 06:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 23/52] arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800:
 interrupt-names:0: 'pwr_event' was expected
Message-ID: <202406140639.duTUs4LI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   1c608efa13a09b28407cf405e922e4a80c778dd1
commit: 7cf69eecba2ebdb6a21019350973796e8d89c90b [23/52] dt-bindings: usb: qcom,dwc3: Add SC8180x binding
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406140639.duTUs4LI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406140639.duTUs4LI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406140639.duTUs4LI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@4080000: power-domains: False schema does not allow [[43, 0], [43, 8]]
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@4080000: power-domain-names: False schema does not allow ['cx', 'mss']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@8300000: power-domains: [[43, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@8300000: power-domain-names:0: 'lcx' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@8300000: power-domain-names: ['cx'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:2: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupts-extended: [[1, 0, 131, 4], [78, 6, 4], [78, 8, 3], [78, 9, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:2: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupts-extended: [[1, 0, 136, 4], [78, 40, 4], [78, 10, 3], [78, 11, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@17300000: power-domains: [[43, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@17300000: power-domain-names:0: 'lcx' was expected
--
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@4080000: power-domains: False schema does not allow [[43, 0], [43, 8]]
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@4080000: power-domain-names: False schema does not allow ['cx', 'mss']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@8300000: power-domains: [[43, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@8300000: power-domain-names:0: 'lcx' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@8300000: power-domain-names: ['cx'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:2: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupts-extended: [[1, 0, 131, 4], [81, 6, 4], [81, 8, 3], [81, 9, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:2: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupts-extended: [[1, 0, 136, 4], [81, 40, 4], [81, 10, 3], [81, 11, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@17300000: power-domains: [[43, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@17300000: power-domain-names:0: 'lcx' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
