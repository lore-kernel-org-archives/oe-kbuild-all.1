Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2E5A0ACD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788893986; cv=none; b=Et+E7Ctp85YpO/Zk7SHt7WFHQzFPyxIPMWTvt7tyPmQzL/CoFheACLiYnsx2AnT7OqOBjK6Kjxki32DlCSkbZyOZYLFkJQjbjE1l1gy9eE4HtqLigf7EFpFVbi1v/0Zag8LnR1w3dN6zS5TYr1StpgPn3l5csYF6imzuypOm0CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788893986; c=relaxed/simple;
	bh=s9jqVOt7AzY8k+su+SqTYV18CqgGwJG3IrPemaAg5qc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JhgJU7y/nvDViCWaBPjNGoHyBgOrGIA59W1Hr3DvAAt28nVtcoG3hjD91Orw7PaMSEueUxIld5dr1Uc2Ye0g0NTc5ZUHEMGJZhalPeYTnXH8RGRXhsuAv3UZEO7T920Q6uGEYlCry3aQwJ/eHGBSx+gjZMcX8f26YIGr/h8WiS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iehVs3i2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iehVs3i2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788893984; x=1820429984;
  h=date:from:to:cc:subject:message-id;
  bh=s9jqVOt7AzY8k+su+SqTYV18CqgGwJG3IrPemaAg5qc=;
  b=iehVs3i2xaP0poE/Z+zfYOTV58VJbUpy6T+DXA6FbfFE2L+7mJ4VGuCj
   mQlAxrM9t7Lqh5jKCWpwx3Tsw2DAtJ1weZw5G94jkNtnYPEMuCDiFz27z
   xeXYkC/evLcxvmMMygCeHFSRaEuZkkvdhYGdAQMEMi44cegUVCL1F8nyo
   kBvNQBH+gEDz8naBWydZWW0lb9Gp7+jAujJfwAHXqTdx9m3YE1ue8ZBGk
   j78hguyCtMVfcjODP8BnnySDYrp8PsDF36aKhBnKz3nfWWfvWOdqowbsn
   m4fwgqUpuRNB4ce7tzaSk6A3lPKVfh+oVEK6ZWNo/f+oUqdgZ5VRWWLvT
   w==;
X-CSE-ConnectionGUID: KzAAFSuzTh+jbKragLDXmQ==
X-CSE-MsgGUID: yawcXsV+Qkq/W0QKYPQ2Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100661905"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="100661905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 11:59:42 -0700
X-CSE-ConnectionGUID: APWDDInxSwSOyRQFiVMS7A==
X-CSE-MsgGUID: ThDlRs5ASy+4Y9xiNQy85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="269744654"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 11:59:41 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x412g-000000000oE-2k1I;
	Tue, 08 Sep 2026 18:59:38 +0000
Date: Tue, 08 Sep 2026 20:58:39 +0200
From: kernel test robot <lkp@intel.com>
To: Franz Schnyder <franz.schnyder@toradex.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 2542/4316]
 arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphynop2
 (usb-nop-xceiv): '#phy-cells' is a required property
Message-ID: <202609082058.gjkFuxpv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   944a035ecca915ae947905dcfb03f2b9dc6d032c
commit: cf08ef6995204752d8423226f3588c76c6403996 [2542/4316] arm64: dts: apalis-imx8: Add USB HSIC support
config: arm64-randconfig-2051-20260907 (https://download.01.org/0day-ci/archive/20260908/202609082058.gjkFuxpv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609082058.gjkFuxpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609082058.gjkFuxpv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
>> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
