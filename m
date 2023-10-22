Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707803C30
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJrWTFpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697998568; x=1729534568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMGMcC38TDAgWJt+CHNrXJaeLe+2phfkZeGfLkfPejQ=;
  b=EJrWTFpMsATsCtBJ9kSfdmX0txAR5vTCz3fObRcr5CcS7RsV7EyNIcw1
   wMjrtMpuTPwdD0FQtUuy0s118QV80X3kxgdFYLY8mGeHuhZ+TqDbXRi2G
   U5KawqUaqCgyN+YYm4TAINj2mY4mrxySpgIoJ6kGQgz1/1b4AhLopKmOF
   DZUecpl805DXfSU1B5j8jKtBC8rnmdN7NYscBkluih5clVZvy194egeTm
   bjzjCXHvyaT6T2g08IrnENTxQ34SwjCYvu9x83PmcicMlrIJbSaH2jsTO
   4KjqXoc7lS8RsxJc/mVxct94d5chAw/A4cJkUD8HqwKdrPYlXT2pApNHX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="5347137"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="5347137"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 11:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="881540239"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="881540239"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Oct 2023 11:16:05 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quczb-0006Ba-0z;
	Sun, 22 Oct 2023 18:16:03 +0000
Date: Mon, 23 Oct 2023 02:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 16/23] checkpatch: WARNING: Block
 comments use * on subsequent lines
Message-ID: <202310230242.oZDO8mKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   7c273a7526ad5e3284b1763207b1d8d6178d9ca4
commit: 7494d8b8e3a5b9946cfc678c1603f7c993577ca7 [16/23] arm64: dts: mt7988: try to implement i2c-switch and change sfp-gpio
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230242.oZDO8mKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230242.oZDO8mKS-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#41: FILE: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:56:
+	/*
+	GPIO69_GPIO_B: SFP1_TX_Fault

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#73: FILE: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:74:
+	/*
+	GPIO1_UART2_TXD: SFP2_TX_Fault

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#111: FILE: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:286:
+^I^IGPIO5_SMI_0_MDC ^IPCA9545APW Reset$

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#111: FILE: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:286:
+		/*
+		GPIO5_SMI_0_MDC 	PCA9545APW Reset

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#112: FILE: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:287:
+^I^IGPIO6_SMI_0_MDIO ^IPCA9545APW INT$

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#116: FILE: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:291:
+		/*interrupt-parent = <&ipic>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#118: FILE: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:293:
+		#interrupt-cells = <2>;*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
