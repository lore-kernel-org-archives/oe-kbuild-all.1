Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59810221DAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 03:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779678234; cv=none; b=m/fezuBCcM1FaONsWyugSQXfs6TEW9Ck7USJq35cr72//gE7pdM/A8SQbF3M3/MO9bQcrHSjHQQFpZlocb/Gj5MXkSLem9+vZcjrIb4FHtKsdobgxiLDKTEysfDFD7rS0rEY6FEy6pTT8XEvkcPe37ditaRgOQxtPVsSXFvM0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779678234; c=relaxed/simple;
	bh=LZF4QBpav5ISliGn+Rd4rSbkacTUBUnWU7Y5by7Zxi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J1Is1rCWUeMPF3ALddNaGqXo0BnqnoH9uuIkHqV7Ko+0IbWWmkcB9AHmyVN4MBcpkvJal0mJILd7h2ur961Gs1MPVGrEAWBGUVeLtj86Ts4MFEej6fvqui1RgSpCYYWbxMirPAXJRHg3zzQHqQs5y0S4TrLMfcqvgxHkNTqawDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrvPowbd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrvPowbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779678234; x=1811214234;
  h=date:from:to:cc:subject:message-id;
  bh=LZF4QBpav5ISliGn+Rd4rSbkacTUBUnWU7Y5by7Zxi8=;
  b=KrvPowbdb6OQVbZPMIuHgd8ao1FEv/wY/U0ZIuZYDSIhUdZ7m1pwIHyj
   ETEK5ki2sMUvTM+Suzb05p12tkqXkhGmPKTlsUXHSlitiWdz7sg9LyQzI
   WFIE5C81NnV35eulzkSezBosh++axL0Sbnuc6omgvoK/bEEVPvsq2g6k/
   64nvhciY08jpjYv85UPJ/iXqEaYbUn2WcVLsnJsyZpg33ykpnyFW6aSA7
   KJRUe0hjy646Rlhos2LdiYPRQoQrY7bl01t6c9ZV42lmVCjXwE1WgiCbP
   4pQe+gFlUXIQws2OScui0p/qr227FOPlI+U/2XgqL1CeUewFnPFxVzPw6
   Q==;
X-CSE-ConnectionGUID: nAUi0mkdSxi+NmR1LEo9YQ==
X-CSE-MsgGUID: nawWAcNHSAOMv0KIgYIijg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80467452"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80467452"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 20:03:53 -0700
X-CSE-ConnectionGUID: tpiNLkLaQzKBihmp6oeI3g==
X-CSE-MsgGUID: R/ssYKWLTkOmlOdMqVwXxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="237055208"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2026 20:03:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRLbY-000000000ub-1FG1;
	Mon, 25 May 2026 03:03:48 +0000
Date: Mon, 25 May 2026 11:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Swarna Prabhu <sw.prabhu6@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Pankaj Raghav <p.raghav@samsung.com>
Subject: drivers/scsi/sd.c:4493:2-17: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202605251009.62v7URec-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
commit: 7179e626b76eb42f2529c6f6dd6ba88ea2445372 scsi: sd: Enable sector size > PAGE_SIZE in SCSI sd driver
date:   3 months ago
config: riscv-randconfig-r064-20260525 (https://download.01.org/0day-ci/archive/20260525/202605251009.62v7URec-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7179e626b76e ("scsi: sd: Enable sector size > PAGE_SIZE in SCSI sd driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251009.62v7URec-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/sd.c:4493:2-17: WARNING: NULL check before some freeing functions is not needed.

vim +4493 drivers/scsi/sd.c

  4478	
  4479	/**
  4480	 *	exit_sd - exit point for this driver (when it is a module).
  4481	 *
  4482	 *	Note: this function unregisters this driver from the scsi mid-level.
  4483	 **/
  4484	static void __exit exit_sd(void)
  4485	{
  4486		int i;
  4487	
  4488		SCSI_LOG_HLQUEUE(3, printk("exit_sd: exiting sd driver\n"));
  4489	
  4490		scsi_unregister_driver(&sd_template);
  4491		mempool_destroy(sd_page_pool);
  4492		if (sd_large_page_pool)
> 4493			mempool_destroy(sd_large_page_pool);
  4494	
  4495		class_unregister(&sd_disk_class);
  4496	
  4497		for (i = 0; i < SD_MAJORS; i++)
  4498			unregister_blkdev(sd_major(i), "sd");
  4499	}
  4500	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
