Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCC36D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 00:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728432443; cv=none; b=tQxarl1NCq025J69FEv3+8LorV4qC6127zm0pmg0kllR9Ep60a3OFayGftkjDDPpxdzkI3P6V+ZMF2V6JUcDZuhQBFAxwPi9sYUPnMnmBVNyEcXCzrw3TEsYDDQVLbnPZMj4SF9RqnO8TeYAH76md32WmNuGGRZkb+9ThDmANKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728432443; c=relaxed/simple;
	bh=bGhhOb5B1pbitpykZrtWRVTH9dARYnIsuF8p3rM9hLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6eBziH1Xu3vRxJbx89wZVYJ+gYA6bCpKDZtqiBbc1pqJmN5k+Wwx9PseUDAbmSH/BL4LgUgqBXE8zfArh0Du6+iNY8DlqRoA/qCCOsZin5WuQrl4NtyXzJuMEBj3PkADAEpY4oEwOuZQWb+uWbFf4vFaTfV/RAgcIXQEbmv9MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+WPzu0A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+WPzu0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728432442; x=1759968442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGhhOb5B1pbitpykZrtWRVTH9dARYnIsuF8p3rM9hLw=;
  b=P+WPzu0AlQ/wHerlr3PVzGj2CvAExlX44I2FOWSdc9V38fkuaOqdacin
   yjCNBV27xjYSNRjlFdm13OxEGv4h25VASnr1coFkZBdwvDHouPECcOrHK
   oEexE3Fczpl8JawGlzCMScaUH2tMgADaPMYCI2BPgejPd092G5BL2whK3
   v+m1jIBTVjzAkKhyh7E0CpRWuFYflE3NLnbThEytXGeMjVWv8lnm+eNwt
   YYkySBBpQy3k1Pt35J2MzHi7nsHnRM2kppBVeH8AE4Z29InR6OyAwrka0
   PUYTPnrmokUqmO9c1vj5YiBiPqbNc5j9VgfHV6OYAcvA/kMZBwuBDLDot
   g==;
X-CSE-ConnectionGUID: wAAjJECjQSWOnVQJTIdu8w==
X-CSE-MsgGUID: JG5lMdoTRfKPjPr9Unp8BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="53099452"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="53099452"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 17:07:18 -0700
X-CSE-ConnectionGUID: Knf/ezbQTrm3bNh1S2l18Q==
X-CSE-MsgGUID: 5WRvBIyqRZy2f8aA6OENZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="81049677"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Oct 2024 17:07:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syKEU-0008Vs-16;
	Wed, 09 Oct 2024 00:07:14 +0000
Date: Wed, 9 Oct 2024 08:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <quic_kdybcio@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 2334/2853]
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb:
 /soc@0/geniqup@bc0000/i2c@b94000/redriver@4f: failed to match any schema
 with compatible: ['nxp,ptn3222']
Message-ID: <202410090757.UHilCjZL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
commit: facead4ce0c45c6d2de535df8376f728cb9e7064 [2334/2853] arm64: dts: qcom: x1e80100-romulus: Set up USB Multiport controller
config: arm64-randconfig-051-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090757.UHilCjZL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090757.UHilCjZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090757.UHilCjZL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4142.11-4152.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/geniqup@bc0000/i2c@b94000/redriver@4f: failed to match any schema with compatible: ['nxp,ptn3222']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4142.11-4152.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/geniqup@bc0000/i2c@b94000/redriver@4f: failed to match any schema with compatible: ['nxp,ptn3222']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
