Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFC1990C9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 22:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718664258; cv=none; b=gYvAVM0sHDA0R1Wzb1KvkRSvca+sIwu26U4mhoF8ATtGLMFn5tRhM8Chuy6HT91OamyCv4urXfZh8O5eDFTJixmnh6jPJ+70pM5QIaf0dRSSPO1xswq1NCrnSeX7Y74QHgQxtb0WoHwmYSGhr32AbRZ2cwi0IiyhAmchG/LwiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718664258; c=relaxed/simple;
	bh=vIxoYuZE/tG3s6phwieJZFZaHyismGLyLKy1d/Yueec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMepOKIaAWhSDZhz0+U2W9ZjTjbGfFHedHPVFmNICghG34axRuKq9NXpOfmNPtIhLedo1gdSJAHSBxbQki9ypXkHNjbDaitMg17OxDu93qTAes86jrilF4ZATqVUl8bgiZCVECurooptIRttYMPngmWWxpBAYS2a6WwdvERpg/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JebxRW3u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JebxRW3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718664257; x=1750200257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIxoYuZE/tG3s6phwieJZFZaHyismGLyLKy1d/Yueec=;
  b=JebxRW3uEmu6575pDsRa4njU0+nJzRCr8kCOSq5ikihSvv0SmJO25Jni
   FENmEsrICsLIEt1jhL4cKoRbw11SShvluJ4lQ51eIKupztBNLN8270wFU
   j25LCOr+XOwT/8nH4eD7nzHI2kwZm/4m5GMPWLq5AB3aAS2PKa6mb9eZX
   ptB1FBv6XttvI0aols9SJQ6E7ywO/mdeuDObC52LEBSSC16ghZFHTlsmD
   DHHMT6TyEJ0lwF318c5EVcjByub4UXDgEUEDM/RfBYl02o9sO1P8goInO
   zeTS0wpjw5be08LJlJGcPIkKRYPkXvrIARPgYpQJeLVJoajehyhZzZzbS
   Q==;
X-CSE-ConnectionGUID: FmqvXiUIQTa9XsNQU868qA==
X-CSE-MsgGUID: 5mKgrloSTQeQ+HUNil2SYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15232066"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15232066"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 15:44:16 -0700
X-CSE-ConnectionGUID: iI5W11cGR4+pQnrV8svXQQ==
X-CSE-MsgGUID: CxXDoh1vQ1mYSwj6kulWxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="45783512"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jun 2024 15:44:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJL5A-0004xl-37;
	Mon, 17 Jun 2024 22:44:12 +0000
Date: Tue, 18 Jun 2024 06:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Agarwal <rohiagar@qti.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 58/211] arch/arm64/boot/dts/qcom/sdx75-idp.dtb:
 /soc@0/dma-controller@900000: failed to match any schema with compatible:
 ['qcom,sdx75-gpi-dma', 'qcom,sm6350-gpi-dma']
Message-ID: <202406180637.OdryJK6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   f55a758fd355c1b5ed7c73434a99ae07d5741226
commit: e07c4a702eb0abbb200c07593cfc429338ec42bf [58/211] arm64: dts: qcom: sdx75: Support for I2C and SPI
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240618/202406180637.OdryJK6f-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180637.OdryJK6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180637.OdryJK6f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sdx75-idp.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sdx75-gpi-dma', 'qcom,sm6350-gpi-dma']
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: /soc@0/mmc@8804000: failed to match any schema with compatible: ['qcom,sdx75-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
