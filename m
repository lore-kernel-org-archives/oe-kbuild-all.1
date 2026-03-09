Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C3A2D8760
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058413; cv=none; b=Hqxe82HVS2eh+cwgB2+0d3XPmSgytDK05+9rfy0KGfjpCPO1BDoqpPIJ2OMPPhJDd3fAycX4WwYgAlYvFZ2zgtzkfeL8HsOl9zGkhnCXTcBeiRVYK93AjMxozaybP92L1z23ZOfDI4pSSymr4hsj5EICM+aHrT5xqXJaRQ1xmd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058413; c=relaxed/simple;
	bh=/rC4//AC5CHDeldzdvqknpuJgHuJuwSXsV5fY9fclq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MY4TT0wI2haM+MbBo/MReA1TctoiSdDgvsmrmea39M/yFpuqNRr1W9VY7ubkHcjJWEZ6SXcLCajxVVkLHSamyrB87HrNIiob3rMZPmx04jcUvy9Md8trjkSKHF6UbDEYs69+bPkcUt3gxXgKS97PofmMvT+/vtzuT1k0bZOYGkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zd3Ku4rG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zd3Ku4rG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773058411; x=1804594411;
  h=date:from:to:cc:subject:message-id;
  bh=/rC4//AC5CHDeldzdvqknpuJgHuJuwSXsV5fY9fclq0=;
  b=Zd3Ku4rGjM0UV6jOyX3ECUUk/vHX4aT18ssOIa9kgz7VVAnoznPBV9tx
   mLLYga6S+VcL2Kfu6vciCVy3sHbtAT2AfPnV+Kp55DMe2XpGB2ShQJUoL
   wSKjQ4QcRHHCCRUvNX/QCXb8fPS0C2wbh82HtapX32Ksf9yH8suRieUyL
   gjo0F3r4+wWha8STJUtYtiGJ9syuhiD1nu4viFFZM1p/iT0X61RshhZxw
   xgzifMIlPFpg5vJ0qPJE9uN9+WpGC2IH/y/TyuibFDbHcuTIzGjNq2Hii
   zm+tQKK7e4BUq9AFBMA6LI+6OFjze3q3+dF4WCUA3vIM++l6PnK+0VzmL
   Q==;
X-CSE-ConnectionGUID: yHCZpS8fQSqC5W3G+4PQuA==
X-CSE-MsgGUID: 5C/TwTlxSfu8yf8qU0Bgyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84401433"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84401433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 05:13:31 -0700
X-CSE-ConnectionGUID: E0nkN5HcSLuG+FqcqdNfjg==
X-CSE-MsgGUID: DaVaDqJJT/+8q/ID0RJvNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="217791969"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2026 05:13:28 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzZUE-000000002qX-1eRV;
	Mon, 09 Mar 2026 12:13:26 +0000
Date: Mon, 09 Mar 2026 13:13:19 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000
 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too
 long
Message-ID: <202603091312.YzzZe3qe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: 27357b61522f7c06e81ab71cc20329f695f8f346 [3/3] arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links
config: arm64-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260309/202603091312.YzzZe3qe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091312.YzzZe3qe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603091312.YzzZe3qe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[60, 13], [60, 0], [60, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[60, 13], [60, 0], [60, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4541.12-4545.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
