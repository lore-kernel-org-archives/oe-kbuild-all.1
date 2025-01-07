Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39021F37DD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 23:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736291088; cv=none; b=I0T/Dus5L9Ki0vSr8ZI9oWqzbOSW/+NXviIlqRgSleF4OfgMCcNtphpthrU0fgaTJhWHeyn4eykNp09K8Kfe4W0EqFxGtvC6U1gDyfm5NAnjG036xpxAd3VMnzo758P9yQ4CwBUWlehuZeRnBikeiQrsDVb2VeCEQmoumqiD7YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736291088; c=relaxed/simple;
	bh=xz+0mjyd9S0yakZbSsH16Xg/qzTMXAHYaYHEGzhrA5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eH4aPviv0TsviXG+GIfIr0PPGG/TfJn2/7UKu/WMfejyc8UVJSBCDU9SNNe51TY7EFPfaMbx2A72SQcJaGh2H7KUumxalNs4jN/Ap0C6obcMZZw+sYJToQ6z26UmvEpRS0jAQBQxEMVMG0XMmC2N+RhU4NxXPeLcY8uytqRa1so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVYJiZNQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVYJiZNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736291086; x=1767827086;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xz+0mjyd9S0yakZbSsH16Xg/qzTMXAHYaYHEGzhrA5k=;
  b=YVYJiZNQv6VgP3lhclYh2IlOMmy2jO8XtCdQXd9NQNLw68raRBBMH9Ty
   C0q45xNAR6LtQoWs37d1esA8N8MkHRlyTyaSfW1xs2Uuirmg4HUShg6RC
   QhObjnE9dzQnzl94gJ4s7PfQyDbuH3Nzc3PQidXCC9zo2KfPSZRiC174o
   xLbJG1dOWjE0DCefkKA/XErjQkLlxSEbmGO87OfM5zCAHXDxrCHLz3XOI
   CDCAdnbWE1o+MDpf7c6yU74VLij1Xv1cywoMgIVbwnfpZi9CJvr6WSsH4
   FS05jAuheeG/Zi6McBWhZrLAY+LgviJPZN3OrAjM0BDyK7wN4/BRPYPx7
   g==;
X-CSE-ConnectionGUID: YukN8Ug6RIOIWG9MmDnnSQ==
X-CSE-MsgGUID: 4A6ENrXZSDOVYHV7Ws68Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36660604"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36660604"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 15:04:46 -0800
X-CSE-ConnectionGUID: azWfKYl8SjyzmbUpfcHfNQ==
X-CSE-MsgGUID: y9Fm/JlsTaKs4bRQTJsQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102818893"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jan 2025 15:04:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVIcr-000FKB-2b;
	Tue, 07 Jan 2025 23:04:41 +0000
Date: Wed, 8 Jan 2025 07:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 41/64]
 drivers/video/fbdev/udlfb.c:1485:21: error: 'edid_show' undeclared here (not
 in a function)
Message-ID: <202501080639.Tvc3Ruzb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   1c76e0940bd2d02a30ddaf76ef5bcb648c3fffb1
commit: 57cb559ad9c6a7e5d0f0eb96f05c4eeba5bf2bd2 [41/64] udlfb
config: x86_64-buildonly-randconfig-004-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080639.Tvc3Ruzb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080639.Tvc3Ruzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080639.Tvc3Ruzb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/video/fbdev/udlfb.c:1485:21: error: 'edid_show' undeclared here (not in a function)
    1485 |         .read_new = edid_show,
         |                     ^~~~~~~~~
>> drivers/video/fbdev/udlfb.c:1486:22: error: 'edid_store' undeclared here (not in a function); did you mean 'edid_attr'?
    1486 |         .write_new = edid_store
         |                      ^~~~~~~~~~
         |                      edid_attr
>> drivers/video/fbdev/udlfb.c:1439:16: warning: 'edid_write' defined but not used [-Wunused-function]
    1439 | static ssize_t edid_write(
         |                ^~~~~~~~~~
>> drivers/video/fbdev/udlfb.c:1417:16: warning: 'edid_read' defined but not used [-Wunused-function]
    1417 | static ssize_t edid_read(
         |                ^~~~~~~~~


vim +/edid_show +1485 drivers/video/fbdev/udlfb.c

7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1416  
57cb559ad9c6a7 drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh  2024-11-17 @1417  static ssize_t edid_read(
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1418  			struct file *filp,
59aa03ac70cccf drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh  2024-12-15  1419  			struct kobject *kobj, const struct bin_attribute *a,
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1420  			 char *buf, loff_t off, size_t count) {
6bfea83eec8e26 drivers/video/fbdev/udlfb.c   kernel test robot 2020-08-26  1421  	struct device *fbdev = kobj_to_dev(kobj);
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1422  	struct fb_info *fb_info = dev_get_drvdata(fbdev);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1423  	struct dlfb_data *dlfb = fb_info->par;
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1424  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1425  	if (dlfb->edid == NULL)
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1426  		return 0;
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1427  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1428  	if ((off >= dlfb->edid_size) || (count > dlfb->edid_size))
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1429  		return 0;
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1430  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1431  	if (off + count > dlfb->edid_size)
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1432  		count = dlfb->edid_size - off;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1433  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1434  	memcpy(buf, dlfb->edid, count);
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1435  
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1436  	return count;
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1437  }
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1438  
57cb559ad9c6a7 drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh  2024-11-17 @1439  static ssize_t edid_write(
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1440  			struct file *filp,
59aa03ac70cccf drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh  2024-12-15  1441  			struct kobject *kobj, const struct bin_attribute *a,
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1442  			char *src, loff_t src_off, size_t src_size) {
6bfea83eec8e26 drivers/video/fbdev/udlfb.c   kernel test robot 2020-08-26  1443  	struct device *fbdev = kobj_to_dev(kobj);
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1444  	struct fb_info *fb_info = dev_get_drvdata(fbdev);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1445  	struct dlfb_data *dlfb = fb_info->par;
e71ff6f265c80b drivers/video/udlfb.c         Olivier Sobrie    2012-02-29  1446  	int ret;
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1447  
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1448  	/* We only support write of entire EDID at once, no offset*/
b9f03a3cd06c6f drivers/video/udlfb.c         Paul Mundt        2011-01-06  1449  	if ((src_size != EDID_LENGTH) || (src_off != 0))
e71ff6f265c80b drivers/video/udlfb.c         Olivier Sobrie    2012-02-29  1450  		return -EINVAL;
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1451  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1452  	ret = dlfb_setup_modes(dlfb, fb_info, src, src_size);
e71ff6f265c80b drivers/video/udlfb.c         Olivier Sobrie    2012-02-29  1453  	if (ret)
e71ff6f265c80b drivers/video/udlfb.c         Olivier Sobrie    2012-02-29  1454  		return ret;
e71ff6f265c80b drivers/video/udlfb.c         Olivier Sobrie    2012-02-29  1455  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1456  	if (!dlfb->edid || memcmp(src, dlfb->edid, src_size))
e71ff6f265c80b drivers/video/udlfb.c         Olivier Sobrie    2012-02-29  1457  		return -EINVAL;
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1458  
7433914efd584b drivers/video/fbdev/udlfb.c   Mikulas Patocka   2018-07-25  1459  	ret = dlfb_ops_set_par(fb_info);
7433914efd584b drivers/video/fbdev/udlfb.c   Mikulas Patocka   2018-07-25  1460  	if (ret)
7433914efd584b drivers/video/fbdev/udlfb.c   Mikulas Patocka   2018-07-25  1461  		return ret;
7433914efd584b drivers/video/fbdev/udlfb.c   Mikulas Patocka   2018-07-25  1462  
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1463  	return src_size;
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-09-05  1464  }
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1465  
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1466  static ssize_t metrics_reset_store(struct device *fbdev,
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1467  			   struct device_attribute *attr,
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1468  			   const char *buf, size_t count)
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1469  {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1470  	struct fb_info *fb_info = dev_get_drvdata(fbdev);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1471  	struct dlfb_data *dlfb = fb_info->par;
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1472  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1473  	atomic_set(&dlfb->bytes_rendered, 0);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1474  	atomic_set(&dlfb->bytes_identical, 0);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1475  	atomic_set(&dlfb->bytes_sent, 0);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl    2018-01-15  1476  	atomic_set(&dlfb->cpu_kcycles_used, 0);
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1477  
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1478  	return count;
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1479  }
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1480  
598b2eedfc3fbe drivers/video/fbdev/udlfb.c   Bhumika Goyal     2017-08-18  1481  static const struct bin_attribute edid_attr = {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1482  	.attr.name = "edid",
66cf911986d082 drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh  2024-11-17  1483  	.attr.mode = 0600,
b9f03a3cd06c6f drivers/video/udlfb.c         Paul Mundt        2011-01-06  1484  	.size = EDID_LENGTH,
59aa03ac70cccf drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh  2024-12-15 @1485  	.read_new = edid_show,
59aa03ac70cccf drivers/video/fbdev/udlfb.c   Thomas Weiﬂschuh  2024-12-15 @1486  	.write_new = edid_store
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1487  };
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson   2010-02-15  1488  

:::::: The code at line 1485 was first introduced by commit
:::::: 59aa03ac70cccf8b40f49311d2bccba8ff5f12e6 fbdev: udlfb: Use const 'struct bin_attribute' callback

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
