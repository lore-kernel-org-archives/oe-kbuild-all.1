Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793162184;
	b=DViWqcSScvNV33XARhxlEOrSYIKvyUal4I/GFF5KyeTF8bpn9Xb7LQKOwNpDwtL4rj6b
	 gK7PmcNkAqC5FwoanFDQmIpoltH7SLMfsRGqYTQ9VpL7UzcaO1E3wln/uCU6xOCFbtEcJ
	 awH2xbmrzaXLccrKCYaypbVGMRvxt+M8yN9IlaXWTPlsE/MUS3RrtezT5GiCZkL4TwLxe
	 8HJGdX5r9ZVmGGGdg2EfIo7eFZzeW6d1TTdC/5LcnU8qkO3o108SqWVnaxXFP6nzxZLQH
	 q1/EQvvA5/WnDpMsNhE2GHZ7MVfcs92B5iy6D3p7ZLXya8wVN8vwULuqRaU6nAj5dYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793162184;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=j1wQ4YjAt0HAxTKF93leHHMf3nC/7mAqjXYSd2aKTDE=;
	b=Fb17XSmUWSJhtYMprMcInLoWTh3O40272t23rFEpACEDMBX8eIRoZ+8o8mxpzdzg3UBT
	 iguVAoRqVbL0DpeXDccRyK73RLUAHWcrBLlJBfY6IUiegQF9yN0O4HP697sBqUK60rAIy
	 Lk5gHoV7JiEkuecFvdq4rQYUNseQW6QqPfPcbQiSUshlyatlkbSYJEF7opjwrsf85NTH8
	 4DcAhOlnB/YlDZNcl1BvcpPrQ/9wnnfBkCaHdnO90DZQ9KJ/N3aCIevXtFWUZWMwznHmc
	 EYCL+WHM3unrp6p4F0MfBwWOiewFVQICE0azs4cPtu2axpsTF3dI/lY5P4WPY1FlquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yz6Tr7sY;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD8B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 04:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yz6Tr7sY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793162184; x=1824698184;
  h=date:from:to:cc:subject:message-id;
  bh=ciGgeQbZShGPPjMHuEYWXmMHUNKEdSThEFiVq54UW2k=;
  b=Yz6Tr7sYxtG1FqhkXKLKDRwJ2LDTN+SCvg6W/Ayjp297/az9RH1x2VPM
   3/+j9PppbVGO2KLbd79Un5wBdJTRL+5Gq91o9GRSxXivgvwmXn1OvXvFe
   SO/HB34qg2ZS5bjVQbbvsnoSVF680Uo97ve+wz3twzAmdJarA8jUe+8dn
   nVblDsfGGjgDAGv5PICekECYfH0dwhZF7RP31AYfm6rSKIPir5lYz1t8Z
   vvvEWjw000FYGO5Tk9sQPtxyN2Hpv05DWZbS5EVpwkVDRfwwQFqa1iVQw
   GK+AOhj7kKjNRw9aDLhskv2DjGC8P3wDlAvIlr2oUfNQZBjMq2F9OXhj3
   A==;
X-CSE-ConnectionGUID: 3/oo0/QUQSSKuWJoPXlDVQ==
X-CSE-MsgGUID: iDf6Yo+sQCuyYNhHxWRM+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1980219"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1980219"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 21:36:23 -0700
X-CSE-ConnectionGUID: jhnmyLOCTNKNdi31/lcReg==
X-CSE-MsgGUID: ynFuZpMDTLyJPiiee5OWHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4863020"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Oct 2026 21:36:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvOZ-00000000YDc-2Yzi;
	Wed, 28 Oct 2026 04:36:15 +0000
Date: Wed, 28 Oct 2026 12:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rsslro3 3/17]
 utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202610281214.43GSaSKS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rsslro3
head:   1e2ab754d102ac67e5c12206bd1b87738f807ab6
commit: 3a1d90cc8bccb2c478fe2df039404d7431ed8e13 [3/17] build.sh/defconfig
config: x86_64-buildonly-randconfig-1003-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281214.43GSaSKS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281214.43GSaSKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281214.43GSaSKS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.1.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.2.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7987/i2p5ge-phy-pmb.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
