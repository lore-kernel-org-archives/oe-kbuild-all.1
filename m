Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A591EABD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729782105; cv=none; b=AmHJQZ1L30U+lWio07V/CLK4bEGLiVa5wfQOXngr6iKSHGMkL9a2Mbi+8N/aHaR847WUYYcI8caTdcmK5YMFzZ2xdunWm28j8dQ7o9JnMqA17bS4n2J7zpNTDS+RTAnNFCGtL02U69W+5vh6+s/xF0H7/8xru3bae64KHTqfUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729782105; c=relaxed/simple;
	bh=x4D3ov8dJp14QHHWeobeI/z0nolbpktKvxd13fbBHDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G6nHwsYcD2jEeUb3EHvUG8ttlBOrFJa4/7bqCEr0T8/u1cX+I4flUfvEvKUYgVi+zdNcxESZHD21I+1v7tCtml/IemLkPk7JjQETJldgnZxwKccXE6qPLr8C2WqP66z3GhbyhXaGl388GYKWtXHc+3FLe77ab6w5bKx4zMinwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvOg7/++; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvOg7/++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729782103; x=1761318103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x4D3ov8dJp14QHHWeobeI/z0nolbpktKvxd13fbBHDI=;
  b=SvOg7/++Wq13ci9l4HV5yfP/4E64Kr3wBINZopMvs+I5N87egyJv0QU6
   8THlbjcR5fnEHf6h6P4Hhe8FlcsxhxYrfuiH+Efvv9B5LC6ygLbBsIRFg
   5nZgLjHn1nh3SlFnHoY+uLgG/FNJ716n5IfjMqb98BkzHnsbGVRCYJ8/P
   Or2yFPpmOKBFUp993ZW6IuLQtclchQ3J2Dhsrfg2K/4rtjIJTAsD2f/Gj
   lhy1DiF/3cWRTzAd+y62tyhxhWKNp0PS6580Jtgr0t13x1YrEepSC6Wec
   2g+t/Ls81r+gAO2EcFYipS53P0nVcDln//IbKw5rLiq+n4mhTwtJSpzIl
   w==;
X-CSE-ConnectionGUID: 40/zQuzATU+3n/Rx9lFAfQ==
X-CSE-MsgGUID: L6ZpZ7NrSLmtVsfW+bj2jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33213840"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33213840"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:01:00 -0700
X-CSE-ConnectionGUID: efK3GRmlRqqpDm1Xsfrddw==
X-CSE-MsgGUID: em1qczFhTyGFuV/wBJi00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85403704"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Oct 2024 08:00:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3zKa-000WYG-1l;
	Thu, 24 Oct 2024 15:00:56 +0000
Date: Thu, 24 Oct 2024 23:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 6091/6766]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@800000: $nodename:0:
 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
Message-ID: <202410242228.DQODP2jt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
commit: 34d17ccb5db804ad38d63cbb997a7f98f1e94ee1 [6091/6766] arm64: dts: qcom: sa8775p: Add GPI configuration
config: arm64-randconfig-051-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242228.DQODP2jt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242228.DQODP2jt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242228.DQODP2jt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
--
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
