Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51194A5E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682249290; x=1713785290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tzr7C3oRPGneRrdR7DGFON7CSsZjO1Caqt9n/XLAieY=;
  b=Mn7RPlgMoUftj6I/ITr9bOx4GMIVNlbKXIuRmQzthzOOweyEyybFoIL1
   fmHjsl5Yj7aDZxxaEhYYdPeObtXwbCpULy/z9MS3I9K6PqZ/2oP0Te2Bt
   o32UgECIeTNMjVBbwmtWiaxX3ANjXfZeXkJZNTDhBo2cHAFB/Fb3awQIZ
   JxOQTyNSCUeJ8WGytqDqv9//wYZrhBrPIKJ3vLIpkB4nSpWO0Fhwkit/K
   qapwIBWF0mQ2dnOXrjnB0HlL9cyXUUZq5xjX6bBb/zQrjA3dVO18O7SPC
   /14tOVQ3F7t9wJcJP4UapGXHeGKmfWaawxBm2rc7iM4OFVIXNqkd0cYg8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="411546887"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="411546887"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 04:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="725373405"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="725373405"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Apr 2023 04:28:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqXt1-000hrm-1p;
	Sun, 23 Apr 2023 11:28:07 +0000
Date: Sun, 23 Apr 2023 19:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:make-buffer_heads-optional 16/16] or1k-linux-ld:
 block/fops.o:undefined reference to `iomap_invalidate_folio'
Message-ID: <202304231926.0pyj1eQS-lkp@intel.com>
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
commit: eaf2d819fe6b5701a4c373d52d31a5fd93316bad [16/16] fs: add CONFIG_BUFFER_HEAD
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20230423/202304231926.0pyj1eQS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block make-buffer_heads-optional
        git checkout eaf2d819fe6b5701a4c373d52d31a5fd93316bad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231926.0pyj1eQS-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: block/fops.o: in function `blkdev_readahead':
   fops.c:(.text+0x4): undefined reference to `iomap_readahead'
   fops.c:(.text+0x4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_readahead'
   or1k-linux-ld: block/fops.o: in function `blkdev_writepages':
   fops.c:(.text+0x3cc): undefined reference to `iomap_writepages'
   fops.c:(.text+0x3cc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_writepages'
   or1k-linux-ld: block/fops.o: in function `blkdev_read_folio':
   fops.c:(.text+0x3f0): undefined reference to `iomap_read_folio'
   fops.c:(.text+0x3f0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_read_folio'
   or1k-linux-ld: block/fops.o: in function `blkdev_write_iter':
   fops.c:(.text+0x1874): undefined reference to `iomap_file_buffered_write'
   fops.c:(.text+0x1874): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_file_buffered_write'
   or1k-linux-ld: fops.c:(.text+0x198c): undefined reference to `iomap_file_buffered_write'
   fops.c:(.text+0x198c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_file_buffered_write'
>> or1k-linux-ld: block/fops.o:(.rodata+0xbc): undefined reference to `iomap_invalidate_folio'
>> or1k-linux-ld: block/fops.o:(.rodata+0xc0): undefined reference to `iomap_release_folio'
>> or1k-linux-ld: block/fops.o:(.rodata+0xd4): undefined reference to `iomap_is_partially_uptodate'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
