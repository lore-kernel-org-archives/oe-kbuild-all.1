Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350233997
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754407006; cv=none; b=nZOHMojD7AhGKFpZAWmg/N5RUN3dfuIabDZvRMRSJR57hvObt6zVvQLJvuDLrOqP+vxPK4ODPBjxKevgn5Ti7mu8gMFD//YrkMc3OiJ51TpEFeTSlPoW3LmSsIrNj1q4a62XJokF55Z30KO/Bqs1GDYpMCbJ4AWO15+xrEewIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754407006; c=relaxed/simple;
	bh=EOYtAcaMnokMfb7RBZ7CH1LTgM4WzFAxpNbTRN6LOKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=esrrB8EwgVgn5lorFLq4KrpMXmgR8PdVRVuv6YVR8Nhxm33sF4KostjhI7tqtRP0PzZQrJ/eIkJTtFDkkqLKFHeokqdi9Lk83t9Fovejn66wDTHjyULL+98hbDMEsNrAe+zC7FXi6zJOjHuA8BLr8h9+SiW/ypCNMsXHxCbNULE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkja8tQ1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkja8tQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754407004; x=1785943004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOYtAcaMnokMfb7RBZ7CH1LTgM4WzFAxpNbTRN6LOKo=;
  b=gkja8tQ1zZMMTD6d+0MUvlMErC/dPgS60RtX0Hxpv4Ah/zNhcbhMht9k
   k2MF5p45zZir+wBfQyDbupkKHSQxZvmkTToQJPntUkbDKdDJF6N/ELVIf
   pUP/SPxbEI3+OpGp6rqdP5JN2V0Ooktc9RUGTKPJpz0ocwPVyFDOSOYcI
   xK+pxoqUPmY5d0ewFi2hJvjjFlmHBEdbO4Z4t/98JAh5Qbw6aXxbv876u
   rq2N3asLVJg2pewTUtcTd5uhfC+uRVjuSCseK+CjyQPLiytJa4u6yGL7T
   f5+Ina3iLfhpSy9VnRjOZH8FIplutuJP0rY1uyUHuaMkQWDFuvaY27k7/
   w==;
X-CSE-ConnectionGUID: 7+UC7mx/S4qEsoCgOvFfgA==
X-CSE-MsgGUID: 49thstYeTNSid7aDPEC/SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56847999"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56847999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 08:16:43 -0700
X-CSE-ConnectionGUID: fyzwsKkSQSiJpt3neas2VQ==
X-CSE-MsgGUID: 02nmbbzdSuSFa6QocKd3uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="163767090"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2025 08:16:42 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujJP5-00021H-2G;
	Tue, 05 Aug 2025 15:16:39 +0000
Date: Tue, 5 Aug 2025 17:16:24 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743] block/genhd.c:642:5:
 warning: no previous prototype for 'disk_scan_partitions'
Message-ID: <202508051758.1jFhoh8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3c7bbbad8e4b8331c0db8c827bcd03a54741d7fa
commit: cdfb5c11ad89867cd28c903369fbfebe3f36ca26 [1743/1743] block: fix kabi broken in ioctl.c
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250805/202508051758.1jFhoh8X-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051758.1jFhoh8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051758.1jFhoh8X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:642:5: warning: no previous prototype for 'disk_scan_partitions' [-Wmissing-prototypes]
     642 | int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
         |     ^~~~~~~~~~~~~~~~~~~~
   block/genhd.c:533: warning: Function parameter or member 'devt' not described in 'blk_invalidate_devt'


vim +/disk_scan_partitions +642 block/genhd.c

d2bf1b6723ed0ea Tejun Heo         2010-12-08  641  
efc73feb2901d27 Christoph Hellwig 2023-04-07 @642  int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
b9484a857f600ca Yu Kuai           2022-08-09  643  {
b9484a857f600ca Yu Kuai           2022-08-09  644  	struct block_device *bdev;
efc73feb2901d27 Christoph Hellwig 2023-04-07  645  	int ret;
b9484a857f600ca Yu Kuai           2022-08-09  646  
efc73feb2901d27 Christoph Hellwig 2023-04-07  647  	if (!disk_part_scan_enabled(disk))
efc73feb2901d27 Christoph Hellwig 2023-04-07  648  		return -EINVAL;
b9484a857f600ca Yu Kuai           2022-08-09  649  
b9484a857f600ca Yu Kuai           2022-08-09  650  	bdev = bdget_disk(disk, 0);
b9484a857f600ca Yu Kuai           2022-08-09  651  	if (!bdev)
efc73feb2901d27 Christoph Hellwig 2023-04-07  652  		return -ENOMEM;
b9484a857f600ca Yu Kuai           2022-08-09  653  
b9484a857f600ca Yu Kuai           2022-08-09  654  	bdev->bd_invalidated = 1;
efc73feb2901d27 Christoph Hellwig 2023-04-07  655  
efc73feb2901d27 Christoph Hellwig 2023-04-07  656  	ret = blkdev_get(bdev, mode, NULL);
efc73feb2901d27 Christoph Hellwig 2023-04-07  657  	if (!ret)
efc73feb2901d27 Christoph Hellwig 2023-04-07  658  		blkdev_put(bdev, mode);
efc73feb2901d27 Christoph Hellwig 2023-04-07  659  
efc73feb2901d27 Christoph Hellwig 2023-04-07  660  	return ret;
fbbec472351c994 Christoph Hellwig 2023-04-07  661  }
fbbec472351c994 Christoph Hellwig 2023-04-07  662  

:::::: The code at line 642 was first introduced by commit
:::::: efc73feb2901d27dcd01fa859d1378aee42850aa block: merge disk_scan_partitions and blkdev_reread_part

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Yongqiang Liu <duanzi@zju.edu.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
