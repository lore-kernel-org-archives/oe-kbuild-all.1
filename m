Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588135692
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 12:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676635335; x=1708171335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91ld7DpLzHC+EfO+i0DRHGJxCvEWoULIpCbTvG+oSl0=;
  b=H8szVcwNM6wp4vXvW3ui4NhlH0wCUQ/j5BF/XZAk6MbQQ/DGha+2YOtQ
   HbHxbbBrXufAS65U91FJoU/V0UST5GgQz+otT1bQGSoVBFCwrGdu8kj0V
   6Bt5rqV1q8VCZmG/1REZFkRESGo8lrseBWV5zJK+ARGyo4dWvdJk1BEOE
   HpjEAXituR5ki9fOzZXaWWd0RvyYI60AvEWWcQyOkNyeN7VZgd9dnnxve
   Svpx2V2VZgVcn8wqoQV/EwzK2fQTB0axQ+4aX9I+ndauJTyLxVJ3/L1Gn
   qZNUPncFZ1gemx+gy/W/Ck/d9z2j3yMEeaZOpcwK0mX5yyP+0WxsizSlO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396646598"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="396646598"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 04:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="739240903"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="739240903"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 04:02:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSzRK-000BQX-1Z;
	Fri, 17 Feb 2023 12:02:10 +0000
Date: Fri, 17 Feb 2023 20:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	David Sterba <dsterba@suse.com>
Subject: ERROR: modpost: "__umoddi3" [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202302171933.SVePAuDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block kdave/linux/for-next
head:   5c202ce4169d7220f67b0c8b3650f26ed5f9bcaf
commit: 4a8c6e8a6dc8ae4ce2adb1f807b61b6d99088293 btrfs: replace btrfs_io_context::raid_map with a fixed u64 value
date:   2 days ago
config: m68k-apollo_defconfig (https://download.01.org/0day-ci/archive/20230217/202302171933.SVePAuDM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/4a8c6e8a6dc8ae4ce2adb1f807b61b6d99088293
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block kdave/linux/for-next
        git checkout 4a8c6e8a6dc8ae4ce2adb1f807b61b6d99088293
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171933.SVePAuDM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
