Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF79122A7EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534553; cv=none; b=FEkARidR1pnD2NC2r3ve3EukUkC5ook48ybVaJzNGtB7sggR3UJzWWR6E7jRCKEMf4dPaUDJqqNXsQnHYKPa0CIVURI18BcBJbcgzuP8wQd1L/SfGxbv9yOm2mH8RDMcPiMOnBtU/O7aY6Njnxy1S3RBhF0hoBE21FtzNO56mSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534553; c=relaxed/simple;
	bh=fx3BBsTv7WBiFtJdGGN3GNtVNt9e1TifjXP5tJUoBPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErRDqdGwyp3d0qkzJowFhGt+LAO91g+/1SX/8OvvgQuJbyAOQKqKtgNAfrtwtPHBASiUUEU4oAubSQjNnScrp8rKIDDhhv+SuHgENwMHPsDWynMPdeRpeCG4pXOab8/mXtV/98loWBW5v/jGYhqb7XsZ7UsU3H3MmJ1qTYN2eAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbewwfL6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbewwfL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736534551; x=1768070551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fx3BBsTv7WBiFtJdGGN3GNtVNt9e1TifjXP5tJUoBPo=;
  b=XbewwfL6UPwy385B05yM6pVIekUnOx1dokmTj14CeHdQKqB1sL/1pXrT
   9334antbb631dUK8rn0RfFQTcifqc9HJSG+v2psgCQEopslC9KCWA9xDI
   jo8lAkwE37zY8+Zil2TQqbtzrXpdyyJ3DPeQ1d/Riw/5osQUa8mC+YKBf
   evDWfDHxO9KQGle5jeiczzqhcp2E3EnitSeolHONGFfRq/jDTBiZtfXYB
   3vfmu3DKA34W88bKghuZKGzmbAmHzkPvQ+1HxyHAVsUB8QXsnVFsP/rRU
   RqlJPahaepG0aEYG+PKNlVR07KEyiIEwqt8Ziegwrz+6C2TCmYFf2Txkd
   Q==;
X-CSE-ConnectionGUID: lT0219iXTZStwoeF9sgYYA==
X-CSE-MsgGUID: nsQ/KqNcRQik5TXxXhq7kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47830222"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47830222"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 10:42:26 -0800
X-CSE-ConnectionGUID: UA6NJYG1SJqkGJfw/fu9Mw==
X-CSE-MsgGUID: GUMd/bWaT1yo3Ki14narvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="104364333"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2025 10:42:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWJxe-000Jdd-2s;
	Fri, 10 Jan 2025 18:42:22 +0000
Date: Sat, 11 Jan 2025 02:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: Pallav Joshi <pallav.joshi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 89/504]
 drivers/staging/uartlite-rs485/uartlite-rs485.c:677:13: warning: variable
 'rc' set but not used
Message-ID: <202501110244.jUDg3CK4-lkp@intel.com>
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
commit: d11653418f7967e167d903d090c1e979b98a6a16 [89/504] staging: uartlite-rs485: Initial commit to add drv
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110244.jUDg3CK4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110244.jUDg3CK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110244.jUDg3CK4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/uartlite-rs485/uartlite-rs485.c: In function 'ulite_remove':
>> drivers/staging/uartlite-rs485/uartlite-rs485.c:677:13: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     677 |         int rc;
         |             ^~


vim +/rc +677 drivers/staging/uartlite-rs485/uartlite-rs485.c

   672	
   673	static void ulite_remove(struct platform_device *pdev)
   674	{
   675		struct uart_port *port = dev_get_drvdata(&pdev->dev);
   676		struct uartlite_data *pdata = port->private_data;
 > 677		int rc;
   678	
   679		clk_disable_unprepare(pdata->clk);
   680		rc = ulite_release(&pdev->dev);
   681		pm_runtime_disable(&pdev->dev);
   682		pm_runtime_set_suspended(&pdev->dev);
   683		pm_runtime_dont_use_autosuspend(&pdev->dev);
   684	}
   685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
