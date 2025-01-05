Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CCE14D717
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736087272; cv=none; b=g6YNm0X+tlk32VURCTWQAndNfvZmeFaK2ZIR8soL4+29igeUJnsFzyG6gq6Oj9T3WO8UKdtTCfJLUpbf6sEagIrYEWFOuwpgPQ58uW5eo/meGK4KWNvqMvaEuCbhMzvBkHaXjI2lf/3yVKMNPltC7hbtV7GthKhzG7Y2V70Dot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736087272; c=relaxed/simple;
	bh=SJnvufnnQoY1yb77qQGimUMPR7s2SjTg1SdcUzGYGZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvjCH7RwXoKAhkElhQ3qbkIcwijng3xoz5rlElyMQ8n3Nsy496AWk18cyj8FP4oGCvtXIiNvoQnaj5CSDxdZN4aPqvqCFu1RaR97dqeT21CzjleMvVnoBY0t4Xgp2Sg0FynkvWPMlJiT3RmwxOnmePk/MUiAEEyxagn/jawe0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6/5F7q2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6/5F7q2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736087270; x=1767623270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJnvufnnQoY1yb77qQGimUMPR7s2SjTg1SdcUzGYGZw=;
  b=X6/5F7q2tsMEjuQi2q7C4rjEAAORc1yCakAuaSopKe8PLXyEDLSwXt2R
   OiAWoRx0arNWOEfVAWWY7T9NXx5T9L0qFEd8dkGhZU3gpB7SH2+fXoC7/
   YpZOvMHmwkIRiFsRuelui4Jrj9tHBQ9T44Z8qGi+razQaNmrsOZItWGUr
   0Ygd7bSOMT6QPE18VuO+WUwKMhzPTY/QDDDk9dE23o3K1YU24Xx1ICGqd
   w0o2mgpCC0hN3GiA46gacgGZKyhYkFGdnfFnVC8noR7QTNqVyyb5re8ez
   QwhjleoeEvajQ7Z+yrm7PiGTC9gtpLj3B0TFuwtKUoScmY8EoemjB8lL5
   A==;
X-CSE-ConnectionGUID: FR+GANTnRLKQlreQAojcDw==
X-CSE-MsgGUID: s0/J/peeTvax5Lf31ZZlQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="35491345"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="35491345"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 06:27:50 -0800
X-CSE-ConnectionGUID: sTTfmpNtQ/SL9UbMxxWaQw==
X-CSE-MsgGUID: LzpspvyQTR6UcbkZu7OVZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="102009632"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jan 2025 06:27:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tURbW-000Bkl-0b;
	Sun, 05 Jan 2025 14:27:46 +0000
Date: Sun, 5 Jan 2025 22:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: drivers/block/drbd/drbd_bitmap.c:1222: warning: Function parameter
 or struct member 'peer_device' not described in 'drbd_bm_read'
Message-ID: <202501052231.mR0zBYvX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andreas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 8164dd6c8ae158ec0740bf37f0f14645a1fb5355 drbd: Add peer device parameter to whole-bitmap I/O handlers
date:   1 year, 9 months ago
config: csky-randconfig-r026-20230729 (https://download.01.org/0day-ci/archive/20250105/202501052231.mR0zBYvX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501052231.mR0zBYvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501052231.mR0zBYvX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/drbd/drbd_bitmap.c:1222: warning: Function parameter or struct member 'peer_device' not described in 'drbd_bm_read'
>> drivers/block/drbd/drbd_bitmap.c:1234: warning: Function parameter or struct member 'peer_device' not described in 'drbd_bm_write'
>> drivers/block/drbd/drbd_bitmap.c:1246: warning: Function parameter or struct member 'peer_device' not described in 'drbd_bm_write_all'
>> drivers/block/drbd/drbd_bitmap.c:1273: warning: Function parameter or struct member 'peer_device' not described in 'drbd_bm_write_copy_pages'


vim +1222 drivers/block/drbd/drbd_bitmap.c

b411b3637fa71f Philipp Reisner     2009-09-25  1214  
b411b3637fa71f Philipp Reisner     2009-09-25  1215  /**
b411b3637fa71f Philipp Reisner     2009-09-25  1216   * drbd_bm_read() - Read the whole bitmap from its on disk location.
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  1217   * @device:	DRBD device.
b411b3637fa71f Philipp Reisner     2009-09-25  1218   */
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1219  int drbd_bm_read(struct drbd_device *device,
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1220  		 struct drbd_peer_device *peer_device) __must_hold(local)
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1221  
b411b3637fa71f Philipp Reisner     2009-09-25 @1222  {
4ce4926683b820 Lars Ellenberg      2014-05-06  1223  	return bm_rw(device, BM_AIO_READ, 0);
b411b3637fa71f Philipp Reisner     2009-09-25  1224  }
b411b3637fa71f Philipp Reisner     2009-09-25  1225  
b411b3637fa71f Philipp Reisner     2009-09-25  1226  /**
b411b3637fa71f Philipp Reisner     2009-09-25  1227   * drbd_bm_write() - Write the whole bitmap to its on disk location.
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  1228   * @device:	DRBD device.
19f843aa08e2d8 Lars Ellenberg      2010-12-15  1229   *
19f843aa08e2d8 Lars Ellenberg      2010-12-15  1230   * Will only write pages that have changed since last IO.
b411b3637fa71f Philipp Reisner     2009-09-25  1231   */
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1232  int drbd_bm_write(struct drbd_device *device,
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1233  		 struct drbd_peer_device *peer_device) __must_hold(local)
b411b3637fa71f Philipp Reisner     2009-09-25 @1234  {
4ce4926683b820 Lars Ellenberg      2014-05-06  1235  	return bm_rw(device, 0, 0);
b411b3637fa71f Philipp Reisner     2009-09-25  1236  }
b411b3637fa71f Philipp Reisner     2009-09-25  1237  
d1aa4d04da8de5 Philipp Reisner     2012-08-08  1238  /**
d1aa4d04da8de5 Philipp Reisner     2012-08-08  1239   * drbd_bm_write_all() - Write the whole bitmap to its on disk location.
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  1240   * @device:	DRBD device.
d1aa4d04da8de5 Philipp Reisner     2012-08-08  1241   *
d1aa4d04da8de5 Philipp Reisner     2012-08-08  1242   * Will write all pages.
d1aa4d04da8de5 Philipp Reisner     2012-08-08  1243   */
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1244  int drbd_bm_write_all(struct drbd_device *device,
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1245  		struct drbd_peer_device *peer_device) __must_hold(local)
d1aa4d04da8de5 Philipp Reisner     2012-08-08 @1246  {
4ce4926683b820 Lars Ellenberg      2014-05-06  1247  	return bm_rw(device, BM_AIO_WRITE_ALL_PAGES, 0);
d1aa4d04da8de5 Philipp Reisner     2012-08-08  1248  }
d1aa4d04da8de5 Philipp Reisner     2012-08-08  1249  
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1250  /**
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1251   * drbd_bm_write_lazy() - Write bitmap pages 0 to @upper_idx-1, if they have changed.
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1252   * @device:	DRBD device.
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1253   * @upper_idx:	0: write all changed pages; +ve: page index to stop scanning for changed pages
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1254   */
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1255  int drbd_bm_write_lazy(struct drbd_device *device, unsigned upper_idx) __must_hold(local)
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1256  {
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1257  	return bm_rw(device, BM_AIO_COPY_PAGES, upper_idx);
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1258  }
c7a58db4e9dc52 Lars Ellenberg      2013-12-20  1259  
0e8488ade26b4b Lars Ellenberg      2012-04-25  1260  /**
0e8488ade26b4b Lars Ellenberg      2012-04-25  1261   * drbd_bm_write_copy_pages() - Write the whole bitmap to its on disk location.
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  1262   * @device:	DRBD device.
0e8488ade26b4b Lars Ellenberg      2012-04-25  1263   *
0e8488ade26b4b Lars Ellenberg      2012-04-25  1264   * Will only write pages that have changed since last IO.
0e8488ade26b4b Lars Ellenberg      2012-04-25  1265   * In contrast to drbd_bm_write(), this will copy the bitmap pages
0e8488ade26b4b Lars Ellenberg      2012-04-25  1266   * to temporary writeout pages. It is intended to trigger a full write-out
0e8488ade26b4b Lars Ellenberg      2012-04-25  1267   * while still allowing the bitmap to change, for example if a resync or online
0e8488ade26b4b Lars Ellenberg      2012-04-25  1268   * verify is aborted due to a failed peer disk, while local IO continues, or
0e8488ade26b4b Lars Ellenberg      2012-04-25  1269   * pending resync acks are still being processed.
0e8488ade26b4b Lars Ellenberg      2012-04-25  1270   */
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1271  int drbd_bm_write_copy_pages(struct drbd_device *device,
8164dd6c8ae158 Andreas Gruenbacher 2023-03-30  1272  		struct drbd_peer_device *peer_device) __must_hold(local)
0e8488ade26b4b Lars Ellenberg      2012-04-25 @1273  {
4ce4926683b820 Lars Ellenberg      2014-05-06  1274  	return bm_rw(device, BM_AIO_COPY_PAGES, 0);
19f843aa08e2d8 Lars Ellenberg      2010-12-15  1275  }
19f843aa08e2d8 Lars Ellenberg      2010-12-15  1276  

:::::: The code at line 1222 was first introduced by commit
:::::: b411b3637fa71fce9cf2acf0639009500f5892fe The DRBD driver

:::::: TO: Philipp Reisner <philipp.reisner@linbit.com>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
