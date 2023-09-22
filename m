Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B990F385
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 03:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695352815; x=1726888815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vl+UznL5kAoKZDISGt5YoOopfZ2YWYi+zvNi/bKVkko=;
  b=nTpcYnp+UjNwo/EWYYVx78UteWGwSr9qUOBUUWqSVtaGcYWVcXGbmAMB
   ZNe2eWT31pqElk1OLp/BxKBwccDMU2c/a7eynjvYOtx2c6mvIrZmjCv9O
   ut782d34d+pzgLr7GDwVwFrcnm86nZMvCfGwI5aWOpkh9zZwTJRk/K90Y
   WDV9Vt/qKZeVg8JSM4CLF0d3BjJN5SjB6BYHGRbQFUAsWZTFRat/4nner
   juHavK6Zk4H3Ja9ixSUhIMQ6tH7Avdip6K/6Aygtc2xekBKsXL2p5Pwee
   O+8PTzgLaaA2Dyuw9yWY19o522b2/6qRWDV8J59TAsArvi12yrP5WgELV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="411665645"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="411665645"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 20:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="1078197291"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="1078197291"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2023 20:20:08 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjWi6-0000lN-1N;
	Fri, 22 Sep 2023 03:20:06 +0000
Date: Fri, 22 Sep 2023 11:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 58/116] drivers/md/raid1.c:1833:21:
 warning: mixing declarations and code is incompatible with standards before
 C99
Message-ID: <202309221140.BVl9bkzt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   2484246e96e01f62d47572e1ac731054b511cd26
commit: 9275c3c8be42ac8da348eaf1e88931248f06095c [58/116] md: raid1: fix potential OOB in raid1_remove_disk()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230922/202309221140.BVl9bkzt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309221140.BVl9bkzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221140.BVl9bkzt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/raid1.c:1833:21: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           struct raid1_info *p = conf->mirrors + number;
                              ^
   1 warning generated.


vim +1833 drivers/md/raid1.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1823  
b8321b68d1445f NeilBrown          2011-12-23  1824  static int raid1_remove_disk(struct mddev *mddev, struct md_rdev *rdev)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1825  {
e8096360476689 NeilBrown          2011-10-11  1826  	struct r1conf *conf = mddev->private;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1827  	int err = 0;
b8321b68d1445f NeilBrown          2011-12-23  1828  	int number = rdev->raid_disk;
9275c3c8be42ac Zhang Shurong      2023-07-22  1829  
9275c3c8be42ac Zhang Shurong      2023-07-22  1830  	if (unlikely(number >= conf->raid_disks))
9275c3c8be42ac Zhang Shurong      2023-07-22  1831  		goto abort;
9275c3c8be42ac Zhang Shurong      2023-07-22  1832  
0eaf822cb3dfcf Jonathan Brassow   2012-07-31 @1833  	struct raid1_info *p = conf->mirrors + number;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1834  
b014f14c81bc5d NeilBrown          2011-12-23  1835  	if (rdev != p->rdev)
b014f14c81bc5d NeilBrown          2011-12-23  1836  		p = conf->mirrors + conf->raid_disks + number;
b014f14c81bc5d NeilBrown          2011-12-23  1837  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1838  	print_conf(conf);
b8321b68d1445f NeilBrown          2011-12-23  1839  	if (rdev == p->rdev) {
b2d444d7ad975d NeilBrown          2005-11-08  1840  		if (test_bit(In_sync, &rdev->flags) ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  1841  		    atomic_read(&rdev->nr_pending)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1842  			err = -EBUSY;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1843  			goto abort;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1844  		}
046abeede71790 NeilBrown          2010-10-26  1845  		/* Only remove non-faulty devices if recovery
dfc70645000616 NeilBrown          2008-05-23  1846  		 * is not possible.
dfc70645000616 NeilBrown          2008-05-23  1847  		 */
dfc70645000616 NeilBrown          2008-05-23  1848  		if (!test_bit(Faulty, &rdev->flags) &&
5389042ffa3697 NeilBrown          2011-07-27  1849  		    mddev->recovery_disabled != conf->recovery_disabled &&
dfc70645000616 NeilBrown          2008-05-23  1850  		    mddev->degraded < conf->raid_disks) {
dfc70645000616 NeilBrown          2008-05-23  1851  			err = -EBUSY;
dfc70645000616 NeilBrown          2008-05-23  1852  			goto abort;
dfc70645000616 NeilBrown          2008-05-23  1853  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1854  		p->rdev = NULL;
d787be4092e277 NeilBrown          2016-06-02  1855  		if (!test_bit(RemoveSynchronized, &rdev->flags)) {
fbd568a3e61a7d Paul E. McKenney   2005-05-01  1856  			synchronize_rcu();
^1da177e4c3f41 Linus Torvalds     2005-04-16  1857  			if (atomic_read(&rdev->nr_pending)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1858  				/* lost the race, try later */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1859  				err = -EBUSY;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1860  				p->rdev = rdev;
ac5e7113e74872 Andre Noll         2009-08-03  1861  				goto abort;
d787be4092e277 NeilBrown          2016-06-02  1862  			}
d787be4092e277 NeilBrown          2016-06-02  1863  		}
d787be4092e277 NeilBrown          2016-06-02  1864  		if (conf->mirrors[conf->raid_disks + number].rdev) {
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1865  			/* We just removed a device that is being replaced.
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1866  			 * Move down the replacement.  We drain all IO before
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1867  			 * doing this to avoid confusion.
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1868  			 */
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1869  			struct md_rdev *repl =
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1870  				conf->mirrors[conf->raid_disks + number].rdev;
e2d59925221cd5 NeilBrown          2013-06-12  1871  			freeze_array(conf, 0);
3de59bb9d55142 Yufen Yu           2018-02-24  1872  			if (atomic_read(&repl->nr_pending)) {
3de59bb9d55142 Yufen Yu           2018-02-24  1873  				/* It means that some queued IO of retry_list
3de59bb9d55142 Yufen Yu           2018-02-24  1874  				 * hold repl. Thus, we cannot set replacement
3de59bb9d55142 Yufen Yu           2018-02-24  1875  				 * as NULL, avoiding rdev NULL pointer
3de59bb9d55142 Yufen Yu           2018-02-24  1876  				 * dereference in sync_request_write and
3de59bb9d55142 Yufen Yu           2018-02-24  1877  				 * handle_write_finished.
3de59bb9d55142 Yufen Yu           2018-02-24  1878  				 */
3de59bb9d55142 Yufen Yu           2018-02-24  1879  				err = -EBUSY;
3de59bb9d55142 Yufen Yu           2018-02-24  1880  				unfreeze_array(conf);
3de59bb9d55142 Yufen Yu           2018-02-24  1881  				goto abort;
3de59bb9d55142 Yufen Yu           2018-02-24  1882  			}
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1883  			clear_bit(Replacement, &repl->flags);
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1884  			p->rdev = repl;
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1885  			conf->mirrors[conf->raid_disks + number].rdev = NULL;
e2d59925221cd5 NeilBrown          2013-06-12  1886  			unfreeze_array(conf);
e5bc9c3c5432f5 Guoqing Jiang      2017-04-24  1887  		}
e5bc9c3c5432f5 Guoqing Jiang      2017-04-24  1888  
b014f14c81bc5d NeilBrown          2011-12-23  1889  		clear_bit(WantReplacement, &rdev->flags);
a91a2785b20086 Martin K. Petersen 2011-03-17  1890  		err = md_integrity_register(mddev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1891  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1892  abort:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1893  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1894  	print_conf(conf);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1895  	return err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1896  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1897  

:::::: The code at line 1833 was first introduced by commit
:::::: 0eaf822cb3dfcf2a64b2d27f4f6219186adb2695 MD RAID1: rename mirror_info structure

:::::: TO: Jonathan Brassow <jbrassow@redhat.com>
:::::: CC: NeilBrown <neilb@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
