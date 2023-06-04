Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF6E883C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685903050; x=1717439050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FsrPxwCy8jRoYCjtG8929zjNFeS2MvPL1FiteXH9vmI=;
  b=OrJ93SJkic8yqYCKqMmv8bQBMJ2bYnUm/cORxZoD6qYBI6ipLlckViUw
   pCbmX9r8NwwsifMdhHOmso4/Jw6SVeLGroRNrIAMq8U1C3OTRC03+0ebm
   OVNo1K5/Del+TdemBCxvbuJv+iXh8xWW3lvXQsBSTB2hPHcpp7dTM2WA+
   +B60n/P17JTuHrdxBFHXCq+C3+EG2mmwmFubPNSFByUodbMPkhClXQUx4
   puHP5hgKWhV/mpVHO7YPwV9++T0/4fgoMYlbngijNMb1HRYqTFAPrS/7o
   oSGelAMEul8YyOJEJGmQW9ymX8rwFnIQtiF+iAoUbdIC51NLKYqfSkT+J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="356229038"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="356229038"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 11:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="955085364"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="955085364"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2023 11:24:08 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5sOe-0003JP-14;
	Sun, 04 Jun 2023 18:24:08 +0000
Date: Mon, 5 Jun 2023 02:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 10/11] drivers/block/ataflop.c:1961:27:
 error: passing argument 1 of 'floppy_open' from incompatible pointer type
Message-ID: <202306050243.nm8VOWPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.infradead.org/users/hch/block.git blk-open-release
head:   82e16464921aeb370b735b19188e8d1078e1867f
commit: 2b796dbf82e1a60a694e7f59815bc3c55320ccb2 [10/11] block: pass a gendisk to ->open
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230605/202306050243.nm8VOWPq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block blk-open-release
        git checkout 2b796dbf82e1a60a694e7f59815bc3c55320ccb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050243.nm8VOWPq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/ataflop.c: In function 'floppy_unlocked_open':
>> drivers/block/ataflop.c:1961:27: error: passing argument 1 of 'floppy_open' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1961 |         ret = floppy_open(bdev, mode);
         |                           ^~~~
         |                           |
         |                           struct block_device *
   drivers/block/ataflop.c:1918:40: note: expected 'struct gendisk *' but argument is of type 'struct block_device *'
    1918 | static int floppy_open(struct gendisk *disk, fmode_t mode)
         |                        ~~~~~~~~~~~~~~~~^~~~
   drivers/block/ataflop.c: At top level:
>> drivers/block/ataflop.c:1982:27: error: initialization of 'int (*)(struct gendisk *, fmode_t)' {aka 'int (*)(struct gendisk *, unsigned int)'} from incompatible pointer type 'int (*)(struct block_device *, fmode_t)' {aka 'int (*)(struct block_device *, unsigned int)'} [-Werror=incompatible-pointer-types]
    1982 |         .open           = floppy_unlocked_open,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/block/ataflop.c:1982:27: note: (near initialization for 'floppy_fops.open')
   cc1: some warnings being treated as errors


vim +/floppy_open +1961 drivers/block/ataflop.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1955  
6e9624b8caec29 Arnd Bergmann   2010-08-07  1956  static int floppy_unlocked_open(struct block_device *bdev, fmode_t mode)
6e9624b8caec29 Arnd Bergmann   2010-08-07  1957  {
6e9624b8caec29 Arnd Bergmann   2010-08-07  1958  	int ret;
6e9624b8caec29 Arnd Bergmann   2010-08-07  1959  
2a48fc0ab24241 Arnd Bergmann   2010-06-02  1960  	mutex_lock(&ataflop_mutex);
6e9624b8caec29 Arnd Bergmann   2010-08-07 @1961  	ret = floppy_open(bdev, mode);
2a48fc0ab24241 Arnd Bergmann   2010-06-02  1962  	mutex_unlock(&ataflop_mutex);
6e9624b8caec29 Arnd Bergmann   2010-08-07  1963  
6e9624b8caec29 Arnd Bergmann   2010-08-07  1964  	return ret;
6e9624b8caec29 Arnd Bergmann   2010-08-07  1965  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1966  
db2a144bedd58b Al Viro         2013-05-05  1967  static void floppy_release(struct gendisk *disk, fmode_t mode)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1968  {
60ad23400717f7 Al Viro         2008-03-02  1969  	struct atari_floppy_struct *p = disk->private_data;
2a48fc0ab24241 Arnd Bergmann   2010-06-02  1970  	mutex_lock(&ataflop_mutex);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1971  	if (p->ref < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1972  		p->ref = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1973  	else if (!p->ref--) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1974  		printk(KERN_ERR "floppy_release with fd_ref == 0");
^1da177e4c3f41 Linus Torvalds  2005-04-16  1975  		p->ref = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1976  	}
2a48fc0ab24241 Arnd Bergmann   2010-06-02  1977  	mutex_unlock(&ataflop_mutex);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1978  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1979  
83d5cde47dedf0 Alexey Dobriyan 2009-09-21  1980  static const struct block_device_operations floppy_fops = {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1981  	.owner		= THIS_MODULE,
6e9624b8caec29 Arnd Bergmann   2010-08-07 @1982  	.open		= floppy_unlocked_open,
60ad23400717f7 Al Viro         2008-03-02  1983  	.release	= floppy_release,
8a6cfeb6deca3a Arnd Bergmann   2010-07-08  1984  	.ioctl		= fd_ioctl,
1a8a74f03fcde1 Tejun Heo       2011-03-09  1985  	.check_events	= floppy_check_events,
^1da177e4c3f41 Linus Torvalds  2005-04-16  1986  };
^1da177e4c3f41 Linus Torvalds  2005-04-16  1987  

:::::: The code at line 1961 was first introduced by commit
:::::: 6e9624b8caec290d28b4c6d9ec75749df6372b87 block: push down BKL into .open and .release

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Jens Axboe <jaxboe@fusionio.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
