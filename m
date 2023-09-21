Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2308123B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 23:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695339022; x=1726875022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2L9Ev4EIa5zlnkURDYJC34T8tDeoOnVrXrLhqJs93g=;
  b=LCeCqasop6lr/OINvQtERJU6aN8tN8t7fY+GYdZYyNpS0Ie98u3KB8QU
   4tkgxRvauM8k3IM47giGySrzB437JlAvUjTkY+hjAHihQF/26Z5KXNnCe
   R3TDCuQYo1Oi50OV0vz9z7xAMu+PbkTRCZGAJNu/vyW2s2i6S6EXdAT8X
   Uuzn5+xXd5SF9NQdD2ULbxvBX3RRMBVw6199shGmiEqVlds5lwrIA0dwv
   IYRmpwnw8WDokkAtZC+SUsAjvPheqlFQt2rUWGFHo7A89RpDXAYaLacfU
   6kQp4pmO5tRA2opO29co+igzZ8m2DzDNiJ6I4bm7hdE3mEPXwl1sqMCx4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="360076095"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="360076095"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 16:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="723960312"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="723960312"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Sep 2023 16:30:14 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjT7c-0000Xr-1X;
	Thu, 21 Sep 2023 23:30:12 +0000
Date: Fri, 22 Sep 2023 07:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 31/63] drivers/md/raid1.c:1798:21:
 warning: mixing declarations and code is a C99 extension
Message-ID: <202309220753.CQF4aA9B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   5a90c926e01cf088dd8bf644537830dc4d160af1
commit: e7f32dee32014b600d94ed2ba6884d090a960e5b [31/63] md: raid1: fix potential OOB in raid1_remove_disk()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230922/202309220753.CQF4aA9B-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220753.CQF4aA9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220753.CQF4aA9B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/raid1.c:1798:21: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           struct raid1_info *p = conf->mirrors + number;
                              ^
   1 warning generated.


vim +1798 drivers/md/raid1.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1788  
b8321b68d1445f NeilBrown          2011-12-23  1789  static int raid1_remove_disk(struct mddev *mddev, struct md_rdev *rdev)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1790  {
e8096360476689 NeilBrown          2011-10-11  1791  	struct r1conf *conf = mddev->private;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1792  	int err = 0;
b8321b68d1445f NeilBrown          2011-12-23  1793  	int number = rdev->raid_disk;
e7f32dee32014b Zhang Shurong      2023-07-22  1794  
e7f32dee32014b Zhang Shurong      2023-07-22  1795  	if (unlikely(number >= conf->raid_disks))
e7f32dee32014b Zhang Shurong      2023-07-22  1796  		goto abort;
e7f32dee32014b Zhang Shurong      2023-07-22  1797  
0eaf822cb3dfcf Jonathan Brassow   2012-07-31 @1798  	struct raid1_info *p = conf->mirrors + number;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1799  
b014f14c81bc5d NeilBrown          2011-12-23  1800  	if (rdev != p->rdev)
b014f14c81bc5d NeilBrown          2011-12-23  1801  		p = conf->mirrors + conf->raid_disks + number;
b014f14c81bc5d NeilBrown          2011-12-23  1802  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1803  	print_conf(conf);
b8321b68d1445f NeilBrown          2011-12-23  1804  	if (rdev == p->rdev) {
b2d444d7ad975d NeilBrown          2005-11-08  1805  		if (test_bit(In_sync, &rdev->flags) ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  1806  		    atomic_read(&rdev->nr_pending)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1807  			err = -EBUSY;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1808  			goto abort;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1809  		}
046abeede71790 NeilBrown          2010-10-26  1810  		/* Only remove non-faulty devices if recovery
dfc70645000616 NeilBrown          2008-05-23  1811  		 * is not possible.
dfc70645000616 NeilBrown          2008-05-23  1812  		 */
dfc70645000616 NeilBrown          2008-05-23  1813  		if (!test_bit(Faulty, &rdev->flags) &&
5389042ffa3697 NeilBrown          2011-07-27  1814  		    mddev->recovery_disabled != conf->recovery_disabled &&
dfc70645000616 NeilBrown          2008-05-23  1815  		    mddev->degraded < conf->raid_disks) {
dfc70645000616 NeilBrown          2008-05-23  1816  			err = -EBUSY;
dfc70645000616 NeilBrown          2008-05-23  1817  			goto abort;
dfc70645000616 NeilBrown          2008-05-23  1818  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1819  		p->rdev = NULL;
d787be4092e277 NeilBrown          2016-06-02  1820  		if (!test_bit(RemoveSynchronized, &rdev->flags)) {
fbd568a3e61a7d Paul E. McKenney   2005-05-01  1821  			synchronize_rcu();
^1da177e4c3f41 Linus Torvalds     2005-04-16  1822  			if (atomic_read(&rdev->nr_pending)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1823  				/* lost the race, try later */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1824  				err = -EBUSY;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1825  				p->rdev = rdev;
ac5e7113e74872 Andre Noll         2009-08-03  1826  				goto abort;
d787be4092e277 NeilBrown          2016-06-02  1827  			}
d787be4092e277 NeilBrown          2016-06-02  1828  		}
d787be4092e277 NeilBrown          2016-06-02  1829  		if (conf->mirrors[conf->raid_disks + number].rdev) {
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1830  			/* We just removed a device that is being replaced.
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1831  			 * Move down the replacement.  We drain all IO before
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1832  			 * doing this to avoid confusion.
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1833  			 */
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1834  			struct md_rdev *repl =
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1835  				conf->mirrors[conf->raid_disks + number].rdev;
e2d59925221cd5 NeilBrown          2013-06-12  1836  			freeze_array(conf, 0);
3de59bb9d55142 Yufen Yu           2018-02-24  1837  			if (atomic_read(&repl->nr_pending)) {
3de59bb9d55142 Yufen Yu           2018-02-24  1838  				/* It means that some queued IO of retry_list
3de59bb9d55142 Yufen Yu           2018-02-24  1839  				 * hold repl. Thus, we cannot set replacement
3de59bb9d55142 Yufen Yu           2018-02-24  1840  				 * as NULL, avoiding rdev NULL pointer
3de59bb9d55142 Yufen Yu           2018-02-24  1841  				 * dereference in sync_request_write and
3de59bb9d55142 Yufen Yu           2018-02-24  1842  				 * handle_write_finished.
3de59bb9d55142 Yufen Yu           2018-02-24  1843  				 */
3de59bb9d55142 Yufen Yu           2018-02-24  1844  				err = -EBUSY;
3de59bb9d55142 Yufen Yu           2018-02-24  1845  				unfreeze_array(conf);
3de59bb9d55142 Yufen Yu           2018-02-24  1846  				goto abort;
3de59bb9d55142 Yufen Yu           2018-02-24  1847  			}
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1848  			clear_bit(Replacement, &repl->flags);
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1849  			p->rdev = repl;
8c7a2c2bcfaf0e NeilBrown          2011-12-23  1850  			conf->mirrors[conf->raid_disks + number].rdev = NULL;
e2d59925221cd5 NeilBrown          2013-06-12  1851  			unfreeze_array(conf);
e5bc9c3c5432f5 Guoqing Jiang      2017-04-24  1852  		}
e5bc9c3c5432f5 Guoqing Jiang      2017-04-24  1853  
b014f14c81bc5d NeilBrown          2011-12-23  1854  		clear_bit(WantReplacement, &rdev->flags);
a91a2785b20086 Martin K. Petersen 2011-03-17  1855  		err = md_integrity_register(mddev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1856  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1857  abort:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1858  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1859  	print_conf(conf);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1860  	return err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1861  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1862  

:::::: The code at line 1798 was first introduced by commit
:::::: 0eaf822cb3dfcf2a64b2d27f4f6219186adb2695 MD RAID1: rename mirror_info structure

:::::: TO: Jonathan Brassow <jbrassow@redhat.com>
:::::: CC: NeilBrown <neilb@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
