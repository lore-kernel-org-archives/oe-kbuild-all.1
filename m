Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF37F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 13:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682171027; x=1713707027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S53oauB8fA6DcuhgkBgDyFExEnF3dVfckLAqO+Ezd08=;
  b=gWZs/BRZT0nW9BB2mSywH07ZRolGE6M15K0SVwcaPvRgNBOxGVGvwwM2
   4ljwf+N4EYpxOY9NuCU6a3qtDmvsn08tyKfaefHsK15XKxofahQp1TlMR
   kCvOCAUTTPLi61aKBDkGocsJogPMG4hB1hke5AMEewTR7v7QrOD/CbwF+
   O05U5GpwklHim9xigE43M1Q6HcC/E+WyO6G9yMc6ic1FdaUioc2B9tTvA
   qNIIJDL8kudPEIIjSgLvt+v3HswIwUltNjQoyBB9WplBTCR5iA5mfuz8t
   Xtw4HBUl/YFJrUFZSR2KML2zjVlAxjoLxoi9ifx1R8WIA1PL3QHW48Kxc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="344904544"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="344904544"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 06:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="642809863"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="642809863"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Apr 2023 06:43:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqDWi-000hK8-2f;
	Sat, 22 Apr 2023 13:43:44 +0000
Date: Sat, 22 Apr 2023 21:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:make-buffer_heads-optional 14/14] fops.c:undefined
 reference to `iomap_invalidate_folio'
Message-ID: <202304222106.mn4gQqrh-lkp@intel.com>
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
commit: 174c941608ab09d2dc94900c64dd05128de04796 [14/14] fs: add CONFIG_BUFFER_HEAD
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230422/202304222106.mn4gQqrh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block make-buffer_heads-optional
        git checkout 174c941608ab09d2dc94900c64dd05128de04796
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222106.mn4gQqrh-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: block/fops.o: in function `blkdev_readahead':
   fops.c:(.text+0x8): undefined reference to `iomap_readahead'
   riscv64-linux-ld: block/fops.o: in function `.L0 ':
   fops.c:(.text+0xe6): undefined reference to `iomap_writepages'
   riscv64-linux-ld: block/fops.o: in function `blkdev_read_folio':
   fops.c:(.text+0xfe): undefined reference to `iomap_read_folio'
   riscv64-linux-ld: block/fops.o: in function `.L244':
   fops.c:(.text+0xb8a): undefined reference to `iomap_file_buffered_write'
   riscv64-linux-ld: block/fops.o: in function `blkdev_write_iter':
   fops.c:(.text+0xbae): undefined reference to `iomap_file_buffered_write'
   riscv64-linux-ld: block/fops.o: in function `.LANCHOR0':
>> fops.c:(.rodata+0x178): undefined reference to `iomap_invalidate_folio'
>> riscv64-linux-ld: fops.c:(.rodata+0x180): undefined reference to `iomap_release_folio'
>> riscv64-linux-ld: fops.c:(.rodata+0x1a8): undefined reference to `iomap_is_partially_uptodate'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
