Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59201FA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 03:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685590801; x=1717126801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrXq4956NjKBQyilMhHpB7Qzmgrqjj/PCzaD8mrwmkY=;
  b=OUc6Mwsuso6B60+6yHH3GESC2uo+omPT7Ws3kYLbiyAXrLxNFhTuiSm/
   Vq//YGJe7EHyfMsyxKgAtv0mJrVhElHQbNkWGr+OVTZyTkp4m+YPFyPF0
   8VBENIl3epBIv/5PjP8gXo0DSr4gnHCgrTSF+1OxRl05ncGqsiMzf3JK8
   NA0jRYefQCl358PFS0DlecYnDTS0lKhskKdEEIM59YC5PUO0rB5bHsyIz
   BswJ+UxgUE4XMJxahVttSkaSnweDffoJJepcW2Uv5pKfn+1+6SDlW+r8z
   cw+ani99mGr2IM9O/nKGLh2g6WXp/kzxyiRZiQgtVrU9iVWNbgfGfXtcN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418942092"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="418942092"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 20:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="851485704"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="851485704"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 May 2023 20:39:59 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4ZAN-0001st-0Z;
	Thu, 01 Jun 2023 03:39:59 +0000
Date: Thu, 1 Jun 2023 11:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 83/85] ld.lld: error: undefined
 symbol: acc_disconnect
Message-ID: <202306011122.5sw2QYY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   45b8bb886df7422b136ba2703469302d9310974f
commit: ca5cc6bc4cfbed230afa5894c2cd508a8dc9f393 [83/85] BACKPORT: treewide: Add missing includes masked by cgroup -> bpf dependency
config: x86_64-randconfig-x054-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011122.5sw2QYY7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout ca5cc6bc4cfbed230afa5894c2cd508a8dc9f393
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011122.5sw2QYY7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acc_disconnect
   >>> referenced by configfs.c:1633 (drivers/usb/gadget/configfs.c:1633)
   >>>               usb/gadget/configfs.o:(configfs_composite_disconnect) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
