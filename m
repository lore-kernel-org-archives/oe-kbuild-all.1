Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B71C3312
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787139; cv=none; b=YvGNpHMJaDObyGVddMtpsC/fnG7pRIvE3ZcG8p0lEws/YS72J0+F3r2JQhAVEFZM5OwxK4ds44rBFIOOK+OZRvGhFDjh4oKlz0HwQURqLYI1LItlPBinOrfN7YlWDfHohKLHGpk8Ihf4bn0cBEDnPq3AUfYNSH00MxycdbFd7PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787139; c=relaxed/simple;
	bh=XxVObnY67dFAizOKE9NcUUBjiPlNbQ6ivvIwDcUmnZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZWsTxC7aLzzSMeJSU8GUXgmayOCbTJrQqRHm8AluJj5JWXWV23LV3mA3/lByn5vVSDrtPuk2xvUMfWUe8iv0DY7+hXUGu/ucCw8Qg85MsVaOjXh7nR8jWqBjS7E4/uwXJiLnBJlHnDoRteIzGONPNMxZtqdkydyeuChrn5Z7dGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHdbCOFy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHdbCOFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727787138; x=1759323138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XxVObnY67dFAizOKE9NcUUBjiPlNbQ6ivvIwDcUmnZA=;
  b=kHdbCOFyoCTKkkvU/YLSwOumogn5Fsrwv1v0MeC4Vh4befwN7piPnpqc
   mSIse78A0D8/ED+jAYWOU9TvuJm5rGRG7bTR95BfqjsJmgPWzupzlCJkq
   VxeMJwy6X/AUoEiW78Eq5Pe320wsxR1BiMvQV7FXI3ijYU7T5IAsNoc8O
   D05OgJucgB/7pmpCBa82P8vwCfYcuMK08sR32v4We4fsBnX6LHXbAG6JF
   6Dfjt3We/adYyvh1xov3fcfqDkGEXGAtQ45PKIKcr5rypAywtPZL/BUOK
   d5IukUP93mBjE7K38GMXzuiTYx4KrKCYkoAjUO2uS2nWLh1SX4JYtEVLt
   w==;
X-CSE-ConnectionGUID: 7dw4Q1uYSM6R5aEOQEpoVA==
X-CSE-MsgGUID: VA/DM3cdS4yo2mB78rqVBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26378620"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26378620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 05:52:17 -0700
X-CSE-ConnectionGUID: rjh4f42JQ4WbyaI8yXOw0g==
X-CSE-MsgGUID: Yvi0VVtQQZq8s0ZPm6uMTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="104490122"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Oct 2024 05:52:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svcMP-000Qhd-2F;
	Tue, 01 Oct 2024 12:52:13 +0000
Date: Tue, 1 Oct 2024 20:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 878/966]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202410012006.fhymIUCd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 2082f16aa774df2c7bc27bcab12f5de76860fdae [878/966] arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2H
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410012006.fhymIUCd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410012006.fhymIUCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410012006.fhymIUCd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
