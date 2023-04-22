Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D0623A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682168567; x=1713704567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbB0Ze572u8pyynLJP6I9Xxm16hPAf10ld1+TkMtcn8=;
  b=d2wtPKCcVxbRg8a6DshAAdgIEu0CYq/t8EbC5Fwtt9Kjybq/8VVMQ8DF
   5TAiQxXMGdhU0s2SWDDp3hh6zj9JsuivdSPanxwmeC9mWB3ixbzcVz1is
   gCqVQKBms+ic0BJDp4ndwFnhXC9AC+KjXnupPZSro5duN/QwwXTzYLt8F
   TL1Vt7BKPtY0DMssd0Hc9JHReMOccivEllYrH/CE+ymOPKqK/yRoPw1n+
   5PbQYxdIebrAsMig4gA55FnlnK4aDQMxi2pjBuMPH3M9wVq27ILXq+sNd
   vweGKLt/7qXEv77h935jx/carqMtJsc3HJIcFbVyX+U37KVqOTzXhPUIx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="348066781"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="348066781"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 06:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="692547331"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="692547331"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Apr 2023 06:02:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqCt2-000hJC-0m;
	Sat, 22 Apr 2023 13:02:44 +0000
Date: Sat, 22 Apr 2023 21:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:make-buffer_heads-optional 13/14] block/fops.c:557:
 undefined reference to `iomap_file_buffered_write'
Message-ID: <202304222035.fjofMKbf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git make-buffer_heads-optional
head:   174c941608ab09d2dc94900c64dd05128de04796
commit: 854fe8e72a7e983e250b80e95a99f45ea035f317 [13/14] block: use iomap for writes to block devices
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230422/202304222035.fjofMKbf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block make-buffer_heads-optional
        git checkout 854fe8e72a7e983e250b80e95a99f45ea035f317
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222035.fjofMKbf-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: block/fops.o: in function `blkdev_buffered_write':
>> block/fops.c:557: undefined reference to `iomap_file_buffered_write'
   block/fops.c:557:(.text+0x142c): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_file_buffered_write'
>> nios2-linux-ld: block/fops.c:557: undefined reference to `iomap_file_buffered_write'
   block/fops.c:557:(.text+0x1464): relocation truncated to fit: R_NIOS2_CALL26 against `iomap_file_buffered_write'


vim +557 block/fops.c

   554	
   555	static ssize_t blkdev_buffered_write(struct kiocb *iocb, struct iov_iter *from)
   556	{
 > 557		return iomap_file_buffered_write(iocb, from, &blkdev_iomap_ops);
   558	}
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
