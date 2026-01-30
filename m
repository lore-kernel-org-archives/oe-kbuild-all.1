Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAED2284898
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769762893; cv=none; b=sJk1JwnHc0SG/qA1VKuRp/rnlbu07gh+U5ve3gj25iDpdFaAxnrpoVro5i3suqDMYZOBaZkpZbWMwD/FkCa8xvHIcctNCIZGqz6HrkKB1V/MDzneyqsUF69Tz2iMWEBFZGtQ4v0oJfleCM/MhvwWVhXB2+E4uO6Qj90aqZte6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769762893; c=relaxed/simple;
	bh=6iFq00No75rv3QQ29nN/tLWkOvoo4GYMQ0j0R4WQXog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YOLjNbqUqf8XLuAUeuu1FHDqMjY92Q+VZ6UmIamxdztuqfri23ndqlJPz4684vFzMq7SAFcGEbw3vDlPpCq6pAwvdjBFKDCl3UPjQ6XY83100uk+1trQELwhOkVSFf+LnlMwKxA3S8NMqC2EFXsv77Tf9InWx5qJdX/3Or8agSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTDL8kfd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTDL8kfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769762889; x=1801298889;
  h=date:from:to:cc:subject:message-id;
  bh=6iFq00No75rv3QQ29nN/tLWkOvoo4GYMQ0j0R4WQXog=;
  b=bTDL8kfdwdoFQ2viWc4if3ElqeaH+iBnl0GeOXrbLbbdrnjMKc6Pu51Y
   uCq+nuVDjTc/tmyfdH14/jf+jXPoh7W7BPR23y23Vdd+FQJ3uXA2p3rmb
   nZakMF1+RO4yLFRC4hSeYp/At08DpiOeRohho4V78zTx4wRjx0vKHJlDM
   z6r7NnjFALOysVWBlwUpqNNRjPUdFVY9/O6zDn9BJkz260XoTgrcjUSl0
   oUh6M0rjsIlQWDBZWb9eZHkK6FKjhF6oRzMM6Ctz+sBvNPezoloxYBiDL
   dyq1E00VpD5tEy5sHEQvqAH1BcBIHT3rtkOFTELgPRtM1tKacPmLWFiJf
   A==;
X-CSE-ConnectionGUID: oMEWKLrrRee8fPsUtAf5sg==
X-CSE-MsgGUID: G7xt1fEKSQ6MWF8lUH65oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71048188"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="71048188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 00:48:08 -0800
X-CSE-ConnectionGUID: qK3DvPOfQcuYobqtKiIXyA==
X-CSE-MsgGUID: pfwZpoHURvWTHxO+rXOeWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="239529741"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 00:48:05 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlkAc-000000002TD-3qIO;
	Fri, 30 Jan 2026 08:48:02 +0000
Date: Fri, 30 Jan 2026 09:47:34 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 William Zhang <william.zhang@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8649/9539]
 arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb:
 nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202601300929.Y6qmRQNX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 4db35366d6dcda7475b75887f89078a11fb2d89a [8649/9539] dt-bindings: mtd: brcm,brcmnand: Drop "brcm,brcmnand" compatible for iProc
config: arm-randconfig-2051-20260125 (https://download.01.org/0day-ci/archive/20260130/202601300929.Y6qmRQNX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601300929.Y6qmRQNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601300929.Y6qmRQNX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@7: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp2.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp2.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp2.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp2.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@7: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@7: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@7: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@7: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('dsa,member', 'ports' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0 (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0 (brcm,bcm53125): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-gpios', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0 (brcm,bcm53125): 'resets' is a dependency of 'reset-names'
   	from schema $id: http://devicetree.org/schemas/reset/reset.yaml
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('dsa,member', 'ports' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm94708.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm94708.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm94708.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm94708.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm94708.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm94708.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm94709.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm94709.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm94709.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm94709.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm94709.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm94709.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012er.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm953012er.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm953012er.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm953012er.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm953012hr.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012hr.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012hr.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012hr.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012hr.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm953012hr.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
--
   arch/arm/boot/dts/broadcom/bcm953012k.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012k.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012k.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012k.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm953012k.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm953012k.dtb: nand-controller@18028000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too long
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1', 'brcm,brcmnand'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	'brcm,brcmnand-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
