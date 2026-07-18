Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAD72BE7AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784357607; cv=none; b=DAPmEWtNbFORPjjXvZf6zh+Xhpx0/yE6xUq9t2p+HgWMJ5P4SmK8OSEAmDlvPPmgjxZP1NB3CxIktNXivIOPTOdA8O5UYvejOaS/TmX6f4C2v0amEVyAqfWGgbhIsRC9dV441Cr4vBIsAp5GX+VIFvuCtThHRfNB4WDylnpgMDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784357607; c=relaxed/simple;
	bh=O4AbXcOqwiUViuZRszQug57evdGD1Xp+Zu2gXJP/96I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nji4BwlCs2e+8mE07FrzZ3IKzh3OFQFSr7GLvvqCPZdDfIaAZ+VpmJ3nYqAADPZB4Ii+ICb4WkL0eoq40eg/ITFeo8wAPHxjiwlYjinYjQGtcBSt8q0mP5WM+y/tf8Jmo55B3eVSJQFYQuHKZrCSaYdt3GD6KwbnaYfUIYDsosM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlkkCZB0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlkkCZB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784357606; x=1815893606;
  h=date:from:to:cc:subject:message-id;
  bh=O4AbXcOqwiUViuZRszQug57evdGD1Xp+Zu2gXJP/96I=;
  b=XlkkCZB0Z3i5G7lg1xfKc50+L+9x5gPaC7SrWlFQB3+2uZyaezluP2Jp
   46hWfgurVjNMZAWay+0T5Njd5VZZIAqdK1buBDslVjaSDh944sKTDXSP6
   FUEQ22N9rsR24fHaY8rrFbAQWGyV3FKOU/1wdN5PZDs/PVm5Vrou+/BFy
   iU677JF9EIJPLKOGmPQllgv1R9x4qH9CTFcpTjRMyP/NVHxRMk5HJ7hmD
   DBBn6IxJ/5FtheUAY/5H9gqR79OAm5PDwq38qZW1IpwD9QO4v82Z0e8D2
   1Uq1eP9QuijuHh35L3wG/Iyj53GhJPHgLmDKqT8HRdoRSEzyoauvSwrC/
   w==;
X-CSE-ConnectionGUID: 06cTZoQdQo6HWD1u43RMCQ==
X-CSE-MsgGUID: G/Dq/hJ/S3mS0EPZJss+8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85137049"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85137049"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 23:53:25 -0700
X-CSE-ConnectionGUID: XBEKCwFMTmiDqqd7TI2Thg==
X-CSE-MsgGUID: spUoCET5T/ukK89yFcnIuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261241705"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 17 Jul 2026 23:53:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkyvJ-00000000TXP-1VBD;
	Sat, 18 Jul 2026 06:53:21 +0000
Date: Sat, 18 Jul 2026 14:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 drivers/md/dm-bow.c:793:6: sparse: sparse: symbol 'dm_bow_resume' was not
 declared. Should it be static?
Message-ID: <202607181440.RgHiudwG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: d242fc9bf14a655afe36d65223e9e0d44d8ce636 [12/12] ANDROID: dm-bow: Fix 5.15 compatibility issue
config: arm-randconfig-r112-20260716 (https://download.01.org/0day-ci/archive/20260718/202607181440.RgHiudwG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181440.RgHiudwG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181440.RgHiudwG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/dm-bow.c:97:10: sparse: sparse: symbol 'range_top' was not declared. Should it be static?
   drivers/md/dm-bow.c:148:6: sparse: sparse: symbol 'add_before' was not declared. Should it be static?
   drivers/md/dm-bow.c:178:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:178:24: sparse:     expected int
   drivers/md/dm-bow.c:178:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:186:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:186:32: sparse:     expected int
   drivers/md/dm-bow.c:186:32: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:205:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:205:24: sparse:     expected int
   drivers/md/dm-bow.c:205:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:282:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:282:24: sparse:     expected int
   drivers/md/dm-bow.c:282:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:395:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:395:24: sparse:     expected int
   drivers/md/dm-bow.c:395:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:339:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:339:24: sparse:     expected int
   drivers/md/dm-bow.c:339:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:344:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:344:24: sparse:     expected int
   drivers/md/dm-bow.c:344:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:350:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:350:24: sparse:     expected int
   drivers/md/dm-bow.c:350:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:358:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:358:24: sparse:     expected int
   drivers/md/dm-bow.c:358:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:422:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:422:24: sparse:     expected int
   drivers/md/dm-bow.c:422:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:427:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:427:24: sparse:     expected int
   drivers/md/dm-bow.c:427:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:437:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:437:24: sparse:     expected int
   drivers/md/dm-bow.c:437:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:443:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:443:24: sparse:     expected int
   drivers/md/dm-bow.c:443:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:462:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:462:24: sparse:     expected int
   drivers/md/dm-bow.c:462:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:553:53: sparse: sparse: Using plain integer as NULL pointer
>> drivers/md/dm-bow.c:793:6: sparse: sparse: symbol 'dm_bow_resume' was not declared. Should it be static?
   drivers/md/dm-bow.c:827:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:827:24: sparse:     expected int
   drivers/md/dm-bow.c:827:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:846:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:846:24: sparse:     expected int
   drivers/md/dm-bow.c:846:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:939:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:939:24: sparse:     expected int
   drivers/md/dm-bow.c:939:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:975:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted blk_status_t [usertype] bi_status @@     got int [assigned] ret @@
   drivers/md/dm-bow.c:975:32: sparse:     expected restricted blk_status_t [usertype] bi_status
   drivers/md/dm-bow.c:975:32: sparse:     got int [assigned] ret
   drivers/md/dm-bow.c:1103:5: sparse: sparse: symbol 'remap_unless_illegal_trim' was not declared. Should it be static?
   drivers/md/dm-bow.c:1259:5: sparse: sparse: symbol 'dm_bow_prepare_ioctl' was not declared. Should it be static?
   drivers/md/dm-bow.c:1292:12: sparse: sparse: symbol 'dm_bow_init' was not declared. Should it be static?
   drivers/md/dm-bow.c:1301:6: sparse: sparse: symbol 'dm_bow_exit' was not declared. Should it be static?
   drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/md/dm-bow.c:523:26: sparse: signed value source

vim +/dm_bow_resume +793 drivers/md/dm-bow.c

   792	
 > 793	void dm_bow_resume(struct dm_target *ti)
   794	{
   795		struct mapped_device *md = dm_table_get_md(ti->table);
   796		struct bow_context *bc = ti->private;
   797		int ret;
   798	
   799		if (bc->kobj_holder.kobj.state_initialized)
   800			return;
   801	
   802		ret = kobject_init_and_add(&bc->kobj_holder.kobj, &bow_ktype,
   803					   &disk_to_dev(dm_disk(md))->kobj, "%s",
   804					   "bow");
   805		if (ret)
   806			ti->error = "Cannot create sysfs node";
   807	}
   808	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
