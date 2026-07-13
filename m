Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297FE2D1913
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 02:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783908149; cv=none; b=AkSVrirgvhrn19CKJ8PJfiildH2MXIVeD0gfc3wU+f4tOWRCBf8bnN4RwoV7G+fLdZ5Nl6Xt/hzmKv9wSOpsZRMl/FkLyCRbRgDjyhHwjKcbyOXAcI4o9SSF9Zz9iUz1+uAEZGFq74W8Swp7benvyenDyTuH+Yb7ffBmHO090S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783908149; c=relaxed/simple;
	bh=yrx3k9cE2I/GVXGnqB3HexoXv1yY27sineGLoZSH7Ik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3xpaBNOxg3HLEez2CXjGjQJqYvLqtCv3cs4Sp/93Tm1IKkRX3OhT44GXqrvE2NxqBmIsJUOCaNY8Y2fQQUDOMsfoU+xuw6JtvaYcGvouPSmc4Oe8EU/PXiiBkMwtC46zZENitHkIRqXZJoZ8eQQZ3o3F3MHN3+NCSZQpt6JJyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jP/BNhMp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jP/BNhMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783908149; x=1815444149;
  h=date:from:to:cc:subject:message-id;
  bh=yrx3k9cE2I/GVXGnqB3HexoXv1yY27sineGLoZSH7Ik=;
  b=jP/BNhMp9iEkx3qOQcQqoLGiE2lPTHjJFBqJHZ2Q+ZdAVgH5xGyU+wWf
   dA+8gDcLg31Riaqd6X7rKlEuqlDlohbPQ5jrwAFXbZsB6O8iQKXIlHCVk
   h3UmGn70gCkabrC4lUncxX+IraMFMYSiHESe5ESnHhJvs8hJo2xg0dvnV
   GKLTsKuZ3t9ZyCGz+HfwhNu23w2C8ontZkgVD5bGsn2IY557OqGdRVIpW
   FTFPPV5IQGKrTsVBGcD6gHcEfbbvIBHjAUsNwsFYpqKsDwIkrtvI7nTya
   8GIyhN7Lzp5KSuu8YBuQz/rBBXZcTl1ASqmy5tTS2z+ChyNVkFPamp4qG
   w==;
X-CSE-ConnectionGUID: 0l+cYdrZT1GpuxgiVeCMhQ==
X-CSE-MsgGUID: 9l9WPBR9RpKudrpaALKQyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84480189"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84480189"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 19:02:12 -0700
X-CSE-ConnectionGUID: v594oBVTRNuF1EOG5EGafQ==
X-CSE-MsgGUID: UAla3/ErRRiLCpmRvU6S9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256048644"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2026 19:02:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj5zi-00000000LHZ-3t05;
	Mon, 13 Jul 2026 02:02:06 +0000
Date: Mon, 13 Jul 2026 10:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Swarna Prabhu <sw.prabhu6@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Pankaj Raghav <p.raghav@samsung.com>
Subject: drivers/scsi/sd.c:4493:2-17: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202607130828.bp1CccX4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44696aa3a489d2baf58efa61b37833f100072bee
commit: 7179e626b76eb42f2529c6f6dd6ba88ea2445372 scsi: sd: Enable sector size > PAGE_SIZE in SCSI sd driver
date:   4 months ago
config: hexagon-randconfig-r051-20260709 (https://download.01.org/0day-ci/archive/20260713/202607130828.bp1CccX4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7179e626b76e ("scsi: sd: Enable sector size > PAGE_SIZE in SCSI sd driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130828.bp1CccX4-lkp@intel.com/

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
