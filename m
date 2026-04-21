Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3BB3D7D84
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782833; cv=none; b=AmiIO6JyfqohMVagYBwhkhH5GEX/pH5ZdcfPmJ4Zxc6jjs0ETnSgNuyrkZi4xcc2+bk8NsE4USYtfuNMI/xmRId4rsRYr8U5+tVoOegX18emywTghqWO0q4jVsv6lhHlGySnv7ZkcB/MNqGdi4vU/eFJeXR5C2/1uPY7JS7PScg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782833; c=relaxed/simple;
	bh=bpaF+qz5bBYgDokd2OwNCXX9eO62JT/TTEUr81l/eGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TNYkW00dkLka0CyI/r9XC2FaKKys8fnU/p9uh0uM/esDhRFvIpf1yXFdxCfzk0RO39uPLgx/mPz3uAff8Q6dWKUJJm1Y2/hyqm8TXEHUnTYlUdtGV4S/C6IEhg7MiuGVm7gmbqlWZH1ZYmQjYfEZoJ+gxewIdGbvAOynqxaKMck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rvk2kKDD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rvk2kKDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776782832; x=1808318832;
  h=date:from:to:cc:subject:message-id;
  bh=bpaF+qz5bBYgDokd2OwNCXX9eO62JT/TTEUr81l/eGY=;
  b=Rvk2kKDDVvkOWV3JuagJuTCQELFtWm1zJ26w7bjMnolAleQXJwKSTZJw
   cBCkjefgqQfL3WuNNLwGFvyah/5kFGFkOlhllk+colavM67fgsCey/Bjf
   ykIwwR4Kei6uDMZrf6YSRWelxhCdrCAIbBidkkFEPP/Rqew+EwNYq89uF
   4cz00fRVDE9x3iz2sewzh1k8r8YWimR+omogg7FlFIXHAoRAe2apgyQhh
   PdgpoJAkVpvZHPjGNGU1rMOXjVTcKWSOtGBQ6AzhvTCefOEKe7ioYIzIe
   eKjJ2QVSWwSd5EbeIG1SdFksTsjgI5IG3YV1ZKYw7COg/nLV7ryfS6icQ
   g==;
X-CSE-ConnectionGUID: qFxYaV+BSIOsv0SKVt1XCw==
X-CSE-MsgGUID: 9LVL3sdqStyHOzAOcpC4eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81331909"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="81331909"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 07:47:12 -0700
X-CSE-ConnectionGUID: CtqLHy0rSm2pLb4/mHRTAg==
X-CSE-MsgGUID: 9CK51rJjS6qlmCxwAJhDBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="255517148"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Apr 2026 07:47:10 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFCNX-000000003em-17yz;
	Tue, 21 Apr 2026 14:47:07 +0000
Date: Tue, 21 Apr 2026 22:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Swarna Prabhu <sw.prabhu6@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Pankaj Raghav <p.raghav@samsung.com>
Subject: [linux-next:master 1761/14297] drivers/scsi/sd.c:4493:2-17:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202604212233.FA0funYe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97e797263a5e963da3d1e66e743fd518567dfe37
commit: 7179e626b76eb42f2529c6f6dd6ba88ea2445372 [1761/14297] scsi: sd: Enable sector size > PAGE_SIZE in SCSI sd driver
config: powerpc-randconfig-r051-20260421 (https://download.01.org/0day-ci/archive/20260421/202604212233.FA0funYe-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604212233.FA0funYe-lkp@intel.com/

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
