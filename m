Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3AC34CEF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685562348; x=1717098348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVo/zdew8FiAem8A/flFEioayTDcbv9rv8xaZ4lLNsM=;
  b=j9kM+mx1G1UBDxot+1fxQ5tVzaxm+zItAjbzrCMYoHKUlmOIMd9KXUIy
   fV/6ttbXY7+rEYg91SoIk7UY7K9JZCcAQxRL6YarafRYRwJeeTABBX03w
   oXCeljflD35CdiiKKy4qrKcAK81JjKvRzc9WapLCHhkBXAuMJnueIywtQ
   q2FurWvUbtDtvFG6GIXGFAp8NIEVHtJATfqtEl+Q5m48xPAPLqEW5JRqh
   TCJp1dFYc6VY+qfEU2TH5v85/thg4GRMCtlbUEK8taCyvG/V4XsIzewCI
   vOrp9d/iHdv0nGE1SEJe+fsHiupjskc2exVPF3NBw7uXncaWMRmFAIN2F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418841888"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="418841888"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 12:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="881319052"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="881319052"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 May 2023 12:44:38 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4RkL-0001Z5-1E;
	Wed, 31 May 2023 19:44:37 +0000
Date: Thu, 1 Jun 2023 03:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [axboe-block:for-6.5/block 65/74] include/linux/gfp.h:320:36:
 warning: passing argument 1 of 'free_pages' makes integer from pointer
 without a cast
Message-ID: <202306010344.RTCWrUvf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block
head:   8e8fedab1194ef90e007636eb3d224c4f8e979a7
commit: 6473bc325644b9c8473e6c92bfb520a68dce1e12 [65/74] md: check for failure when adding pages in alloc_behind_master_bio
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230601/202306010344.RTCWrUvf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=6473bc325644b9c8473e6c92bfb520a68dce1e12
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.5/block
        git checkout 6473bc325644b9c8473e6c92bfb520a68dce1e12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010344.RTCWrUvf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/slab.h:15,
                    from drivers/md/raid1.c:26:
   drivers/md/raid1.c: In function 'alloc_behind_master_bio':
>> include/linux/gfp.h:320:36: warning: passing argument 1 of 'free_pages' makes integer from pointer without a cast [-Wint-conversion]
     320 | #define free_page(addr) free_pages((addr), 0)
         |                                    ^~~~~~
         |                                    |
         |                                    struct page *
   drivers/md/raid1.c:1151:25: note: in expansion of macro 'free_page'
    1151 |                         free_page(page);
         |                         ^~~~~~~~~
   include/linux/gfp.h:303:38: note: expected 'long unsigned int' but argument is of type 'struct page *'
     303 | extern void free_pages(unsigned long addr, unsigned int order);
         |                        ~~~~~~~~~~~~~~^~~~


vim +/free_pages +320 include/linux/gfp.h

b63ae8ca096dfd Alexander Duyck 2015-05-06  318  
^1da177e4c3f41 Linus Torvalds  2005-04-16  319  #define __free_page(page) __free_pages((page), 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16 @320  #define free_page(addr) free_pages((addr), 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  321  

:::::: The code at line 320 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
