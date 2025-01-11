Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2DA1BDABE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736640010; cv=none; b=EAW/1bPpCUfzAfXuvJibOo1TuajTPHQQOJJfE6+bXwlBsjBbhVrs852e4Za5II27R2KBEuUmfmUvGi0aVVGQZ+gkX4OSpHIwkQpRsZEcOKjiDJL2iShqSTX4oK7Oc0wL1B7zJLq2D4dBJ0khn/TJCgwpF8l/T5+OIN/JowEj0fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736640010; c=relaxed/simple;
	bh=xy7CgdcxKqO98D6ib5jwZZO9sj+yOUOvgWZdWZF0oPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQjaZ9F8WxRrshSINphTKcfaqB9va/sThStCEnBnOCNEZ4DgnYkUyoVEjxnAK3PMtqS9Gzo8DcVWeYvvhkmeOaPDuK9HT6THBIRIXFEQHsCGLHnO1+kDz+d4K0Fp+olrLP1ibV6VRvsHQd5FrAOiNgF+x3+KRBEaVorN6RAd5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cG7KRsgj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cG7KRsgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736640009; x=1768176009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xy7CgdcxKqO98D6ib5jwZZO9sj+yOUOvgWZdWZF0oPM=;
  b=cG7KRsgjXf1nmcBylwDmGHi6k5FNV0Tq+V9drVuqAU8Mefdi6bnW3YOc
   FWkUBdo3n2J79f4vhtB9kKNO29evNIDZjCVgnXh9VN5jYU6NHFrO3AaFT
   AC9ZlN1rab5LshTFW3HrRVYg0ehQBo01xWHRGsR5Bjw5UTbGb7Fv9IZNk
   0loK7lMEu+w4JCAgZNq7FPPQn2FAC1x4pov+b42NbpUOMQye1KfC6Sw9d
   UDpTRJzZfZzdGdSTBDtGlFtOGcZP0goZsdsxSKQy4Kbtioq8ZvnpB0Z0e
   z9Z0nGRbxoWDsz3w2YmrP1eptsy7tNqJz1KoDv4CmkUBtFbw/aVU4cEaU
   w==;
X-CSE-ConnectionGUID: 4DwFSDSyS3C29+8K9vWPnA==
X-CSE-MsgGUID: w9CXFvNDT1WrFosO9SgZAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36116834"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36116834"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 16:00:06 -0800
X-CSE-ConnectionGUID: 8SfC5QgbQF+gqhRXWUCbBA==
X-CSE-MsgGUID: QELExXyITmylzEFOPCVBiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="109073601"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2025 16:00:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWlOc-000LL9-1F;
	Sun, 12 Jan 2025 00:00:02 +0000
Date: Sun, 12 Jan 2025 07:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 473/504] kismet: WARNING: unmet direct
 dependencies detected for PTP_1588_CLOCK when selected by
 XILINX_AXI_EMAC_HWTSTAMP
Message-ID: <202501121057.cJE1cPiB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: fcb9452c49d9b571af4f0a308105623d3a5ab6fc [473/504] net: axienet: Add support for 1588
config: nios2-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_XILINX_AXI_EMAC_HWTSTAMP-0-0 (https://download.01.org/0day-ci/archive/20250112/202501121057.cJE1cPiB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121057.cJE1cPiB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121057.cJE1cPiB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by XILINX_AXI_EMAC_HWTSTAMP
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - XILINX_AXI_EMAC_HWTSTAMP [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && XILINX_AXI_EMAC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
