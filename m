Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4411F956
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727536401; cv=none; b=GI5emjiznlOcM3S1tBdYeFaB0WVvkt8cSIerVchw0G4t98e8kuSKgLjCnZ6nGcehEYCjXVoO9yfAfET6pd/8JjLWTVko+pcATORjSwo1wRwPKWPynefYBAirn/KIpjgpcY12kNdZ4Pw0S4DL/a22SfZTpOhJywQ6xf5LRWqVs8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727536401; c=relaxed/simple;
	bh=F0XyuDWKTZgKZr1ytmVXdwJ+3ShvFp9yCMrIetGSvZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kclInFRc+2r/Sd7xGN0b09p9Hnsv9R/UXRfgRtM1Dta98WNKONiKhyheMoRK1fWiXx+isx/QnWLHVgH68pARqLhyL+ZOxLv0rTjDFjVnlCUmRkUvpQ1HjOzg++yDDZufHrCCTo8y3FVzbz5Vb9fFHijWS6W4DbxpLnxoX5oFO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4B9BGNL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4B9BGNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727536400; x=1759072400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0XyuDWKTZgKZr1ytmVXdwJ+3ShvFp9yCMrIetGSvZY=;
  b=U4B9BGNLq9sSG7Z0zRbUmSJrSldQwFJMim7Oc3of233a+cIu862S7oOC
   mpk0/CKQxgGkYcWvbqJg4Sv3gFB9g/lOtOjK1nfRWY+xWnsW/UuUOi/y+
   qiiTK5otAkKDdxVvzCBGR8/KciSSC1uD3nu9N65ePyR0NqGKU/RAdAun1
   I7qC4dAdk1G0x+Kc81aY5f4mvloQj5Vj6YHq5OYQAamjsMUIl2Ip5l3co
   srsVewvP+ghynDIcTOXSC0bkFKBEl/uVd4HcMznDnAvTgw1YCjp6/1wtE
   vSegTQ4vH+Mr/TMj1x7WXXmX2L0IY5upaEb2hwmGeTm/s4BpcMgbgoeVg
   g==;
X-CSE-ConnectionGUID: p3OVcsRxSgKvi9MYpI11+w==
X-CSE-MsgGUID: W8bkuNRxRiKxsf+DIsRY5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26179678"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26179678"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 08:13:19 -0700
X-CSE-ConnectionGUID: JncKeGwHQyGAj9UIMU3gmg==
X-CSE-MsgGUID: ntIl9nnOSt+sO2AsSqkDaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73618958"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Sep 2024 08:13:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suZ8F-000NMB-2X;
	Sat, 28 Sep 2024 15:13:15 +0000
Date: Sat, 28 Sep 2024 23:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 5986/9999]
 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202409282343.8eRQ0Xd7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   95b722b3ebb739e01ce712254a92789f843917e3
commit: 0e469137cd784e952b10670400ce2b9143741fd2 [5986/9999] arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2N
config: arm64-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240928/202409282343.8eRQ0Xd7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282343.8eRQ0Xd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282343.8eRQ0Xd7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
