Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3F4696
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 02:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxvXBmKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702349823; x=1733885823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ywRB86rdNkyVrZMSIl86FILU0n+4ow596Zxd6g/7yQ=;
  b=cxvXBmKyiNb6bX+dxHLdkPYq1c8DYQTqEPgKIwHIO8599WWygXoL5EKb
   LwNcCmYmiYzxlgcl/k1Nnr4VNN6AMsQM1ofT7twLvcf2VK3pUbhrvI5rx
   qSeZqC/VO91ecGAh+UYqTBD23dLKF30CTNSG9/65nKYz5dqH6UUkciQ9V
   JYswydAMEQOhUILKA+UHQ4AipXBBDd+COja0IPX17jmnH6xLrFY4PP91q
   msi5I+v6yyqfyPEBXzTs/6kPM9pGaRVe1uZtDmVtAIzs8UvlpUgiovhDj
   srvIImph4S9NNyzQwrrrpZOR2/Otbj+ozPEYlqG34hHaYfvwsMqxWBkFL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1864781"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1864781"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 18:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="864041697"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="864041697"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Dec 2023 18:57:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCsx7-000Ihb-2h;
	Tue, 12 Dec 2023 02:56:57 +0000
Date: Tue, 12 Dec 2023 10:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 6/9] kernel/power/user.c:277:20: error:
 incompatible integer to pointer conversion passing 'blk_mode_t' (aka
 'unsigned int') to parameter of type 'void *'
Message-ID: <202312121054.qkwNFggh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   662311a97caf6cbb9e82e188ccc303ed14fad50b
commit: cd323d13deca39a6bf99aa7fd617f68234cd99a9 [6/9] CHROMIUM: PM: hibernate: Add three ioctls for secure image transfer
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231212/202312121054.qkwNFggh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312121054.qkwNFggh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312121054.qkwNFggh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/power/user.c:277:20: error: incompatible integer to pointer conversion passing 'blk_mode_t' (aka 'unsigned int') to parameter of type 'void *' [-Wint-conversion]
                   blkdev_put(bdev, BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:118:24: note: expanded from macro 'BLK_OPEN_READ'
   #define BLK_OPEN_READ           ((__force blk_mode_t)(1 << 0))
                                   ^
   include/linux/blkdev.h:1489:50: note: passing argument to parameter 'holder' here
   void blkdev_put(struct block_device *bdev, void *holder);
                                                    ^
   kernel/power/user.c:296:25: error: incompatible integer to pointer conversion passing 'blk_mode_t' (aka 'unsigned int') to parameter of type 'void *' [-Wint-conversion]
           blkdev_put(data->bdev, BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:118:24: note: expanded from macro 'BLK_OPEN_READ'
   #define BLK_OPEN_READ           ((__force blk_mode_t)(1 << 0))
                                   ^
   include/linux/blkdev.h:1489:50: note: passing argument to parameter 'holder' here
   void blkdev_put(struct block_device *bdev, void *holder);
                                                    ^
   2 errors generated.


vim +277 kernel/power/user.c

   256	
   257	static int snapshot_set_block_device(struct snapshot_data *data, __u32 device)
   258	{
   259		dev_t dev;
   260		struct block_device *bdev;
   261		int res;
   262	
   263		if (swsusp_swap_in_use())
   264			return -EPERM;
   265	
   266		if (data->swap > 0 || data->bdev)
   267			return -EBUSY;
   268	
   269		dev = new_decode_dev(device);
   270		bdev = blkdev_get_by_dev(dev,
   271					 BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL, &snapshot_state, NULL);
   272		if (IS_ERR(bdev))
   273			return PTR_ERR(bdev);
   274	
   275		res = set_blocksize(bdev, PAGE_SIZE);
   276		if (res < 0) {
 > 277			blkdev_put(bdev, BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL);
   278			return res;
   279		}
   280	
   281		data->dev = dev;
   282		data->bdev = bdev;
   283		pr_info("snapshot block device set to %02x:%02x: %lld blocks", MAJOR(dev), MINOR(dev),
   284			i_size_read(bdev->bd_inode) >> PAGE_SHIFT);
   285		return 0;
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
