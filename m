Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577F6AD6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678282788; x=1709818788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aunCnQFMNSHkMmXNg0BHyU6gZJMHDgFXfxQu/QBp+c8=;
  b=DRHyCFFn8+1H2rJhgU4QrbLUN1s0kjdbhZRZnBSFDgJgOxxj7DCwsS3y
   Fh2WvHCYVF5mUlU6DMc/Wib4shY64ac6pmSJ2kqmrBD7ZiV20AXacTx+D
   nWyw+FeeV1QyECIgTVlbciXyYZ1bQgZz3gF8Ac8iDc432ErxZSLOjrhnu
   2Sd4sXCNKT3l9zT/ITtCkO8UAw7XcZ/eb0Z/mNVhD238ty9stcOh1rB1B
   4DS5Shy4NqWOKycZwuWvHTU0Kw4d3j3KSMtIdwfP5LEIGsSIcOimnCaYp
   9vJQgk/RCmKLy+5FXkLSY/3oS60xqhqukmfpZRY4Kc11zmuKjJ6UVMP0J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422421744"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="422421744"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 05:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787123778"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="787123778"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2023 05:39:46 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZu1B-00029h-2Y;
	Wed, 08 Mar 2023 13:39:45 +0000
Date: Wed, 8 Mar 2023 21:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sh4-linux-gcc: error: unrecognized command-line option
 '-Wout-of-line-declaration'; did you mean '-Wold-style-declaration'?
Message-ID: <202303082142.4c6xfUOe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63355b9884b3d1677de6bd1517cd2b8a9bf53978
commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
date:   1 year, 7 months ago
config: sh-randconfig-r013-20230307 (https://download.01.org/0day-ci/archive/20230308/202303082142.4c6xfUOe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6e5be40d32fb1907285277c02e74493ed43d77fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e5be40d32fb1907285277c02e74493ed43d77fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082142.4c6xfUOe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sh4-linux-gcc: error: unrecognized command-line option '-Wout-of-line-declaration'; did you mean '-Wold-style-declaration'?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
