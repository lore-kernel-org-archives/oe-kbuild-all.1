Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37A3C25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686655378; x=1718191378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvSUzzFpEsXDi8piYBa+9nShGDHItMRiKtviUMajhiM=;
  b=P+qNL8L62AmVCONpXZGYPvKkHOZGpg2mKi4KETormUnekeZe6pr0qC4Z
   9HtV+BY87KolITVM/4MaO7OTUJvZJyr3bXQmGjsv7Wg3P5SD+mmP22GZb
   5H1dBD24n7bV+yfSHyZ2++Rvzuq/EbVhx/h3SgMlPSmoMwsFucrL/oSi5
   GMJSolOahzX8Ng00F4yFbM9pUhW9GWMPXFpnUeciIkdvcOTMMehtswHcE
   mUGmqm5oFMQqBGf2RAD3pJjfrp9zZskhX/OpcgewCRmr26Iwac/soCOTm
   UFQ+B3gSwXr7XILEGXwZyCzgvbBRH6DKJu6eBxDlXQSCBRdLF9FjpP7UW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="421897491"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="421897491"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 04:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="801433220"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="801433220"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2023 04:22:53 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q926u-0001IG-13;
	Tue, 13 Jun 2023 11:22:52 +0000
Date: Tue, 13 Jun 2023 19:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 44/158] xtensa-linux-ld: section
 .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data
 VMA [00000000,0008e497]
Message-ID: <202306131917.e5RstWlq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   dd69ce3382a254a1022334e8106d97787a03d966
commit: 8accc0c6bbdb3b5ccccf82e861d9089f7dfa0a47 [44/158] Merge branch 'mm-stable' into mm-unstable
config: xtensa-buildonly-randconfig-r005-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131917.e5RstWlq-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=8accc0c6bbdb3b5ccccf82e861d9089f7dfa0a47
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 8accc0c6bbdb3b5ccccf82e861d9089f7dfa0a47
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131917.e5RstWlq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data VMA [00000000,0008e497]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
