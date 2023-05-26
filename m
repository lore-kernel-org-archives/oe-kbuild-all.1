Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B6156D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685096847; x=1716632847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VV6FgMAvUBBZnbRI4UrsVNAyDzoBbTp0QLkzvR0+dBo=;
  b=ikSr9D4CBy42ERd20CKZJ0XYsNMmLXFgMAwyMjw4RGZENl6CIrvrryDv
   gBvNkh51zsbLlFVaWU6/ZnW5/XpzGrqMsDcLbTvIVEMdzGP9g5odA6N+f
   ngMoIyI11d8ub9G9JFEgN8nvyBsEflTEZJa+zwYqLDPJEYbz0xepqU41M
   169j2viSQMItbDdDWhRTgbpa1B6sviPjmSf/WpBTUlLki3Ji7rUhw7Mzg
   BdfKEJ0u2NbC1cm+RXZIj2dEokUAbDtd6dDyXiQYPlSgo+HpLhgZSSXYa
   OiaxeVOMo59farsX4KLyvA0BBeCbKCYx30CKyt+a40s9APFv5xXGayYRw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357424195"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="357424195"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 03:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699380130"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="699380130"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 May 2023 03:27:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2UfN-000JFN-2N;
	Fri, 26 May 2023 10:27:25 +0000
Date: Fri, 26 May 2023 18:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230525 6/31] block/fops.c:560: undefined
 reference to `iomap_file_buffered_write'
Message-ID: <202305261819.f3Xw0WQr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230525
head:   1e9b17615c8ad5829f88f54de36523f291a145cc
commit: 1c054f288031a44c5b7d174d51f4889dfd755d17 [6/31] block: use iomap for writes to block devices
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230526/202305261819.f3Xw0WQr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=1c054f288031a44c5b7d174d51f4889dfd755d17
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-20230525
        git checkout 1c054f288031a44c5b7d174d51f4889dfd755d17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261819.f3Xw0WQr-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: block/fops.o: in function `blkdev_buffered_write':
>> block/fops.c:560: undefined reference to `iomap_file_buffered_write'
   block/fops.c:560:(.text+0x1504): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_file_buffered_write'
>> nios2-linux-ld: block/fops.c:560: undefined reference to `iomap_file_buffered_write'
   block/fops.c:560:(.text+0x15b8): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_file_buffered_write'


vim +560 block/fops.c

   557	
   558	static ssize_t blkdev_buffered_write(struct kiocb *iocb, struct iov_iter *from)
   559	{
 > 560		return iomap_file_buffered_write(iocb, from, &blkdev_iomap_ops);
   561	}
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
