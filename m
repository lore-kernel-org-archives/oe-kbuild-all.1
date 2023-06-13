Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D0136A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 19:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686685942; x=1718221942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBVDI25J5OFX+5jf8FtaaRLvZJPQbplONqVpDPRRh4w=;
  b=ZarI00knaOwqmEXRgk2pVMqVuhBQRFCaWu598pb1GWlwg89thM5l2XrO
   o7GQ7vcAe6yd+3Ohg2iFRnFruca/IQoVw5nq9HpPhRw3OY84rX8jpHpOJ
   t2fSRTMO+n8xDFQTh0IMYLq7YOVH4EbD8BLlO63BNDyVA6xuX5jCyJIXe
   7gh+rhkpD4BiCaxA+dhe/VcwRHFGIje8j5O4RateTIF2lUeXegAk9U5UU
   g1cXYTj0Vzo3GxOKxbuxHnuNi5dkZwoKgwJrYJsz5K0hz7WGhaviCX5DZ
   pknyUe8lYz1VcCFksQQAeV6jCQ1bA4qFSOn9d7I4dejVybucmvnMe4DRL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="422036091"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="422036091"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 12:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="711777095"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="711777095"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jun 2023 12:52:19 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9A3u-0001iu-25;
	Tue, 13 Jun 2023 19:52:18 +0000
Date: Wed, 14 Jun 2023 03:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: Daejun Park <daejun7.park@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [linux-next:master 8718/9385] xtensa-linux-ld: section
 .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data
 VMA [00000000,0008e797]
Message-ID: <202306140300.TbpBYup1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
commit: 25f9080576b9549be9435123d7e45bfeebd2dc97 [8718/9385] f2fs: add async reset zone command support
config: xtensa-buildonly-randconfig-r005-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140300.TbpBYup1-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=25f9080576b9549be9435123d7e45bfeebd2dc97
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 25f9080576b9549be9435123d7e45bfeebd2dc97
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140300.TbpBYup1-lkp@intel.com/

Note: the linux-next/master HEAD 1f6ce8392d6ff486af5ca96df9ded5882c4b6977 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data VMA [00000000,0008e797]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
