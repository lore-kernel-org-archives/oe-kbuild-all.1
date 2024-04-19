Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1296A13D2B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713563315; cv=none; b=mQe3DgSO4OvVgFZ2A71Fuy6AR3jEJ4CPXBc3FgFCzk8Vx7aWca7L/88kSUnXZ8L5YlO3ssusQiiYF2zmooY2b9le3imzDlAHwu7l1GgP7px/wUrhFR1emVLIaXPxRhVV7jtId6fYYD7S5iK/dD6NdzWPubvHh7dfvkSG/a9g2YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713563315; c=relaxed/simple;
	bh=7554g02sCbtJglsDzDP+kFh3u5NIfHx+bWqq68WgOGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqeZISMhwbBby+A9Dum9gzhw0ETWBkbPA3BpxqfG+bBMQwpHLVdGECZDwo0lIpXr6dNPWDbymxHk2l2EpVp9bvbCSSNyAO/thGQpiiJgi3VQlG0IY0YlNv0DwYSB6ouuk1db9OxpMg3O/usPClW6F58GAtwA9BbYYnfns4fJYn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YN562DkY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YN562DkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713563314; x=1745099314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7554g02sCbtJglsDzDP+kFh3u5NIfHx+bWqq68WgOGM=;
  b=YN562DkY595H82g2/x1pPRdFT2/qQ8Fet6XzHyacjA2oPqor2qmbnHQR
   g3pEU7Ba7/29a6Mypi8nm2TEd+1e1WkMuOLG2jzKcWw3BPdWESsTk1HRZ
   4NZ7pW8My1bY7iDLOcM5Qel8I3sPwi99Bb6zmuYY420NRPvkLw4JIyiQ0
   fcBPc4dGJwr0NbV7kORi7L7d2qyK+7F5EiDDPgIB4CBwXIUsyq25srJQe
   khDrB6NNPBxJ7TO3/akoAKGpNvnh5BAtcVrZq64LNlH85POI7Ul8ow+R/
   bk7E+jBATw/+RPBNBpX3cR0GzqMBHIiOInP4jTP1UoJYZUaJy7TZ5cq9e
   w==;
X-CSE-ConnectionGUID: n0RGWGcgSImIYs4ZsiaRIw==
X-CSE-MsgGUID: /e/e1M+fTxeFicLRewquMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="31664744"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="31664744"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 14:48:33 -0700
X-CSE-ConnectionGUID: dQE7xHVYQdu6A+O6XKbwSA==
X-CSE-MsgGUID: 7HYszaECTa+MwGGPHI9bHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="28108476"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 Apr 2024 14:48:32 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxw5u-000ATs-0j;
	Fri, 19 Apr 2024 21:48:30 +0000
Date: Sat, 20 Apr 2024 05:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21291/22156]
 drivers/spi/spi-phytium-plat.c:186:34: warning: unused variable
 'phytium_spi_of_match'
Message-ID: <202404200543.01XPXriL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e9eac2f8ec0d6e36fe87c658851c3c77f990b098
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [21291/22156] spi: add phytium spi support
config: x86_64-randconfig-005-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200543.01XPXriL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200543.01XPXriL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200543.01XPXriL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:186:34: warning: unused variable 'phytium_spi_of_match' [-Wunused-const-variable]
     186 | static const struct of_device_id phytium_spi_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
   Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
   Selected by [y]:
   - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]


vim +/phytium_spi_of_match +186 drivers/spi/spi-phytium-plat.c

   185	
 > 186	static const struct of_device_id phytium_spi_of_match[] = {
   187		{ .compatible = "phytium,spi", .data = (void *)0 },
   188		{ /* end of table */}
   189	};
   190	MODULE_DEVICE_TABLE(of, phytium_spi_of_match);
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
