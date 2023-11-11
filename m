Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4A13AF9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSwJhA87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699702646; x=1731238646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dCFOqUwkN6sBHK5FUJpTcwN+j0ToNLogPn1sAZB8Iik=;
  b=ZSwJhA87+c3PC0y0PDI7ykOf6UhSgDaWJk/Y2OzHnPIFNzXD8Ugs0/eS
   iUl+JH0vNiEz2WNowaphoOVqNA09Q0C42nF8is1EiQ/OKeWCEPKIaOFyX
   5DepjWWWzv2Ms7Zuq9u/msI5xBe5L5ixSC7He6c6yeaRbEElh2VEedtLC
   fR6nUb2cF+kMS+MAmBAouyXZ5OfXobdK4q4B7hzwpBJ3hlQw7QJs3GE/m
   nOdz2Pe7+W6OABnJ20CwJg7Ub2DiX6FIF8zgioRAli1fHrE0ugritkxd4
   n4ZIzj64FwDumaUQudchLei7GE+AbsQBE9+WVSfEioEt4p/o6BzWE/F8w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="389134459"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="389134459"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 03:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011144667"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="1011144667"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2023 03:37:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1mIj-000APS-38;
	Sat, 11 Nov 2023 11:37:21 +0000
Date: Sat, 11 Nov 2023 19:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 22/22] kernel/power/user.c:279:3: warning:
 format specifies type 'long' but the argument has type 'loff_t' (aka 'long
 long')
Message-ID: <202311111914.c29RJSLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   0b15f05ae56061c55d3fb9d7412fef3385132ecd
commit: 0b15f05ae56061c55d3fb9d7412fef3385132ecd [22/22] CHROMIUM: PM: hibernate: Rewrite xfer block device ioctls
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231111/202311111914.c29RJSLc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111914.c29RJSLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111914.c29RJSLc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/user.c:279:3: warning: format specifies type 'long' but the argument has type 'loff_t' (aka 'long long') [-Wformat]
                   i_size_read(bdev->bd_inode) >> PAGE_SHIFT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:523:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +279 kernel/power/user.c

   251	
   252	static int snapshot_set_block_device(struct snapshot_data *data, __u32 device)
   253	{
   254		dev_t dev;
   255		struct block_device *bdev;
   256		int res;
   257	
   258		if (swsusp_swap_in_use())
   259			return -EPERM;
   260	
   261		if (data->swap > 0 || data->bdev)
   262			return -EBUSY;
   263	
   264		dev = new_decode_dev(device);
   265		bdev = blkdev_get_by_dev(dev,
   266				FMODE_WRITE | FMODE_READ | FMODE_EXCL, &snapshot_state);
   267		if (IS_ERR(bdev))
   268			return PTR_ERR(bdev);
   269	
   270		res = set_blocksize(bdev, PAGE_SIZE);
   271		if (res < 0) {
   272			blkdev_put(bdev, FMODE_WRITE | FMODE_READ | FMODE_EXCL);
   273			return res;
   274		}
   275	
   276		data->dev = dev;
   277		data->bdev = bdev;
   278		pr_info("snapshot block device set to %02x:%02x: %ld blocks", MAJOR(dev), MINOR(dev),
 > 279			i_size_read(bdev->bd_inode) >> PAGE_SHIFT);
   280		return 0;
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
