Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A1FA50
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682245569; x=1713781569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sPmADk8GjPaPb+f4UTycUwRtJsf3tNtFQfX4HheXqXM=;
  b=hDwGlfqQ7Kiu1t9mFj5DAQ2ny9SPLQ8ZTqRE7H4wAbpNKrJqO6pBUSKC
   V9lOuFZ/1Tj/ByKzBDQVFtZPPDs1lPediG/tQ/FhpWYfednwoOGnIKiKC
   6LPuOWSWMzQyV3esC7x2n173XQpBS7k2Z8ZrWDkMvgFqapy37mjhzs/Mg
   JEugfUoxE4h5TLGjcpaVTVUNSqvd9swCUl2zK3x9sUsn5nF4q+wcraSzK
   nrsOrJSZFYOK+mMtLJGADRItG3kfPMgGR4vSyTHJTzmyuY5jHVb34kJxJ
   9VnYGIHzAmFa7l8c5Fg9prZ+H++9mEaq8IXp/5TBd7eyw0oDJL3mVLDhc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="374215649"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="374215649"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 03:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="867167566"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="867167566"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Apr 2023 03:26:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqWv0-000hq4-1w;
	Sun, 23 Apr 2023 10:26:06 +0000
Date: Sun, 23 Apr 2023 18:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:make-buffer_heads-optional 15/16] or1k-linux-ld:
 fops.c:undefined reference to `iomap_file_buffered_write'
Message-ID: <202304231822.7QM3WTDb-lkp@intel.com>
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
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20230423/202304231822.7QM3WTDb-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block make-buffer_heads-optional
        git checkout 5e0d1cd62a524368945cb1623b1790c366b9dd07
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231822.7QM3WTDb-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: block/fops.o: in function `blkdev_write_iter':
   fops.c:(.text+0x1824): undefined reference to `iomap_file_buffered_write'
   fops.c:(.text+0x1824): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_file_buffered_write'
>> or1k-linux-ld: fops.c:(.text+0x193c): undefined reference to `iomap_file_buffered_write'
   fops.c:(.text+0x193c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_file_buffered_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
