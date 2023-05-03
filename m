Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF8D1FA6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683102004; x=1714638004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Occ6i+MkpBiW2wF0+Rlo9n4FKRs65wPAMl+6VVLQGjU=;
  b=PrCHzhKfVPhwHlxg3iWiYPH/ugVxftYRoHd3JoqWZFI6OmNDGYGA1434
   vUqJ0eiqpwRWE8S1FCBgIx0cDQSHX8bXjh/xeBq04VahWu0QZ/A3M/IDX
   70ySUSdUKJd7cDGlU00Ahr2xOzc+mgY01OP0xMIOBa3228bWyh3SbrLli
   gaS60WcTouyqlfkohWN5SznVIMNC7GL8UYpC2lpXJc4Vsy1XgAJX8Mhiu
   A/20pG1g28ptWMkSPSlO72QUzwc1CJ9RCNxs7GrGtHQqjkrpnt7DMuhxZ
   ThcXuv3e40J8F6Pt5mTYdKVAYAhPKYHRSF70ON9BIGL/PZ4VBcFhqifqd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="346076341"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="346076341"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 01:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026417890"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="1026417890"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 May 2023 01:20:03 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu7iU-0001hs-1J;
	Wed, 03 May 2023 08:20:02 +0000
Date: Wed, 3 May 2023 16:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: "__ld_r13_to_r20_ret" [lib/zstd/zstd_decompress.ko]
 undefined!
Message-ID: <202305031603.AnNjkTn6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   348551ddaf311c76b01cdcbaf61b6fef06a49144
commit: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f zstd: import usptream v1.5.2
date:   6 months ago
config: arc-randconfig-r014-20230503 (https://download.01.org/0day-ci/archive/20230503/202305031603.AnNjkTn6-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2aa14b1ab2c41a4fe41efae80d58bb77da91f19f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031603.AnNjkTn6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__st_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r17" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r19_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r22_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r24" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r17_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r19" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r24_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r20_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
