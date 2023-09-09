Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0671FA7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694252108; x=1725788108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hy0eqD3QVUOXd4MOm0mTdWs58PSO2AdpkHj5yQBUunA=;
  b=IhjYyD9SNiHc/zZuBGmLdnL0yOkv5X5/WKZoqWvdfUc176MybZMWKl1D
   r0u02YPJc/YNzt62BOIODzmwIrPkhGkeP52aUHVfy33PUwQH/x6bUh1Vh
   m+e3YPbevSkZiAiSgXIjRyEunktae9aIU68A6iZxkCPNMEDBSH86MuidH
   QKm4isz2vY8XLKHghghmgmCoD7sXewMsL5OMuMxxjkNJ0hZqTVSzW28B8
   tag6gKfsnVz9Eb3VJ/9AjSYyYh7l6Ct+x++KonnrH7gWsxp9mJN7JnkEY
   19Oz4VUMtdZUOMIkT82qsjqgTGnnhNhC1NyvpYBk6c1O7SsDcaydSPPG7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="358114015"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="358114015"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 02:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="719417146"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="719417146"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Sep 2023 02:35:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeuMm-0003FY-2S;
	Sat, 09 Sep 2023 09:35:00 +0000
Date: Sat, 9 Sep 2023 17:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: drivers/block/drbd/drbd_bitmap.c:1222: warning: Function parameter
 or member 'peer_device' not described in 'drbd_bm_read'
Message-ID: <202309091744.vwevUDG1-lkp@intel.com>
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
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 8164dd6c8ae158ec0740bf37f0f14645a1fb5355 drbd: Add peer device parameter to whole-bitmap I/O handlers
date:   5 months ago
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230909/202309091744.vwevUDG1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091744.vwevUDG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091744.vwevUDG1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/drbd/drbd_bitmap.c:1222: warning: Function parameter or member 'peer_device' not described in 'drbd_bm_read'
>> drivers/block/drbd/drbd_bitmap.c:1234: warning: Function parameter or member 'peer_device' not described in 'drbd_bm_write'
>> drivers/block/drbd/drbd_bitmap.c:1246: warning: Function parameter or member 'peer_device' not described in 'drbd_bm_write_all'
>> drivers/block/drbd/drbd_bitmap.c:1273: warning: Function parameter or member 'peer_device' not described in 'drbd_bm_write_copy_pages'
--
>> drivers/block/drbd/drbd_main.c:3415: warning: Function parameter or member 'peer_device' not described in 'drbd_bmio_set_n_write'
>> drivers/block/drbd/drbd_main.c:3441: warning: Function parameter or member 'peer_device' not described in 'drbd_bmio_clear_n_write'
>> drivers/block/drbd/drbd_main.c:3502: warning: Function parameter or member 'peer_device' not described in 'drbd_queue_bitmap_io'
>> drivers/block/drbd/drbd_main.c:3544: warning: Function parameter or member 'peer_device' not described in 'drbd_bitmap_io'


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
