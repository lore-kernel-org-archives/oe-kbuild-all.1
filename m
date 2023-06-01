Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079C23DF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685649882; x=1717185882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B8kPwQzjGL8clfyFjf3vhkZF/hkEvEM5oFzx3kQWEOg=;
  b=GEe061XBqoFOeQjfeUiLWFt01v39y8+BHDpKknUz1SlY9UGGH2kV2ElC
   vzL1UpBLV1N7OdOoa4lLZeFonEUxhP3R3DmJGkVNNg8ntbaJkU2DkBSY4
   /WHHZT85RYNKbAfC3cL5c8RxSPb3/E/Vi6E5RGy8dRpE5HMCqXPXKSikd
   OpWAK+VEx7NHLUyU2bSv0QdxfNmNHgH1JPEVBaOMB6mSqPfQEv6N2lmrc
   01mbxYKAR7l6OY3XHTvCM8fW3nk3QfcR7tVQyvMXPvcsx8pzMrQzACLCg
   W8NMZZ0ld3/zkSTdrmBmhCO6H0p0STQTtVkQm/gSrKOPiHvtVUz9B/JLT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="383947576"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="383947576"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 13:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="701681936"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="701681936"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Jun 2023 13:04:41 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4oXI-0002f8-0m;
	Thu, 01 Jun 2023 20:04:40 +0000
Date: Fri, 2 Jun 2023 04:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2] ERROR: modpost: module pstore
 uses symbol sync_filesystem from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202306020455.BbTZ2Irr-lkp@intel.com>
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
commit: d4d78c7278ee4f6fd8f3b02c18e472e55558a98b [2/2] ANDROID: fuse-bpf: Fix non-fusebpf build
config: arm64-buildonly-randconfig-r002-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020455.BbTZ2Irr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout d4d78c7278ee4f6fd8f3b02c18e472e55558a98b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020455.BbTZ2Irr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: module dax uses symbol iget5_locked from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module dax uses symbol inode_init_once from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module dax uses symbol unlock_new_inode from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module pstore uses symbol sync_filesystem from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module pstore uses symbol clear_inode from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
