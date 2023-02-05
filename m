Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF37F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675576691; x=1707112691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JY17x6nKx68gWlYdX4tyMuroak/N+RvlyXk4EWAUmg8=;
  b=I2USQOLsOwm0uRq4pSvOj3kQQZYETty+RHK81XZJGZgNdqXYW67Wj+1c
   OlI4PxQzUpqB/bPQ+5oy6j6Nkdg2jWnsD944+YHut9g0Lx0jnX9VZ7lIX
   GReThNG86rFSWxMxZXBvQOQ42sFaGtfGKiTyLqzf5tcL3yWorjCBs2NG2
   oxC8l9Z1VRSYas/+qZb9FwYcg0crTBRDw0z3LMSdDf+Csh5Ma+6D643hf
   /Yf+v6Jwy3Dv9g4dbvER2zOfQXa0y0RgBJUj0cupVLUzLcL/ylfUYdi8d
   HzOZvb0BYb9hfAtETvmOSHhVy8Db/BeYHkNXttozYnCzYVqeQLU1eCKwE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393617637"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393617637"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 21:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="668086951"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="668086951"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2023 21:58:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOY2T-0001mA-1u;
	Sun, 05 Feb 2023 05:58:09 +0000
Date: Sun, 5 Feb 2023 13:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 1331/20208]
 ./usr/include/linux/videodev2.h:2398:20: error: field has incomplete type
 'struct timespec'
Message-ID: <202302051311.Ul87HgJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 0103d73732ea64a7956c8423ff3ec99d9f8b119f [1331/20208] MLK-21876-13 ipu: add uapi headfile for yocto build pass
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230205/202302051311.Ul87HgJq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/0103d73732ea64a7956c8423ff3ec99d9f8b119f
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 0103d73732ea64a7956c8423ff3ec99d9f8b119f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/ipu.h:29:
>> ./usr/include/linux/videodev2.h:2398:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   ./usr/include/linux/videodev2.h:2398:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
