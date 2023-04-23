Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC7370
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682246169; x=1713782169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nrnr0mbFWf75mGQ2NnI5duyTX7vZq96TH5Mok4fHlHc=;
  b=GhqMqtsObSV9E7WGHG/5rGhPA9o/Vc29X5lT9BqOsr9DFinop2/xIth/
   X9+AgUIvwUi5FtWxMZZCYGUOZ6SoxH/3cvUBeKrRIo96XOFy9nuH1iO6l
   qZvhBZKZiUaGbXGoOBXeX4qzVvLbKl64LZUrKZNf4clq5iMLkFX9EdQ7Z
   U5dnmS1IsuSiwrEeQD5axkGZy4fLJLtuSQtjthaJh4RJI4kestSwo/WbW
   PXr/UNm/HVrNwvGYRYENC0vnN4OaitzXUvJRWsUa9lMWs2fycYgYG4Vad
   tBSCQFSn7ms9HGRt61YT91CMRvTaRYn3G3y1Cu/iBQJhpMwBdXzQYqawi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="409202738"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="409202738"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 03:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="643021787"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="643021787"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Apr 2023 03:36:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqX4g-000hqE-2O;
	Sun, 23 Apr 2023 10:36:06 +0000
Date: Sun, 23 Apr 2023 18:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:make-buffer_heads-optional 15/16] xtensa-linux-ld:
 fops.c:undefined reference to `iomap_file_buffered_write'
Message-ID: <202304231803.hilX93cu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git make-buffer_heads-optional
head:   eaf2d819fe6b5701a4c373d52d31a5fd93316bad
commit: 5e0d1cd62a524368945cb1623b1790c366b9dd07 [15/16] block: use iomap for writes to block devices
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20230423/202304231803.hilX93cu-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block make-buffer_heads-optional
        git checkout 5e0d1cd62a524368945cb1623b1790c366b9dd07
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231803.hilX93cu-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: block/fops.o: in function `__blkdev_direct_IO':
   fops.c:(.text+0xaac): undefined reference to `iomap_file_buffered_write'
>> xtensa-linux-ld: fops.c:(.text+0xc31): undefined reference to `iomap_file_buffered_write'
   xtensa-linux-ld: block/fops.o: in function `blkdev_direct_IO.part.0':
   fops.c:(.text+0xc50): undefined reference to `iomap_file_buffered_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
