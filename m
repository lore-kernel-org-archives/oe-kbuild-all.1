Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9B610E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 03:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681787725; x=1713323725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T4423g7T4ICx6p7BSQP2UhXIQUtIxm/CCdVoZLkMYSM=;
  b=FjIn0cT+ZwNBZ2Iq0BbvmP8Ywzg7NGNBzPzMEbN1X3o0Ao2MYqey4u/a
   h9McK6CDGH/oQvAWZz96/hWzL6p/apVPWIgb9yOKHsAlkL3ppK/dN5TvX
   H72nQlvHLIEu3kjZzOUv28k4Bf9+kybbvBPncIT0adf+hPEHgFKI18Kwt
   5c+U5Mxqy/ZfkVzETFPhDYQC60+l1RTUBSPARlkNBzABfiXjBFg0/5fZP
   r5KNhXHKfnu3X0FkRN1Bk86AyF9f4Un0CMP0rsWCyDi/vabaokAA4gd9l
   x1VRKMQhaJ3AjFkMMa4C0ax0qy90AH3kZqgrCrFSQP4uxzqxtGL/GcKdb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="324681405"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="324681405"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 20:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="1020649625"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="1020649625"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Apr 2023 20:15:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poboK-000cty-0L;
	Tue, 18 Apr 2023 03:15:16 +0000
Date: Tue, 18 Apr 2023 11:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] f2fs: remove power-of-two limitation fo zoned device
Message-ID: <202304181120.748RLJTl-lkp@intel.com>
References: <20230418004049.3262659-1-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418004049.3262659-1-jaegeuk@kernel.org>

Hi Jaegeuk,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev next-20230417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaegeuk-Kim/f2fs-remove-power-of-two-limitation-fo-zoned-device/20230418-084241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230418004049.3262659-1-jaegeuk%40kernel.org
patch subject: [PATCH] f2fs: remove power-of-two limitation fo zoned device
config: m68k-randconfig-r015-20230416 (https://download.01.org/0day-ci/archive/20230418/202304181120.748RLJTl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/50158b3d258eb40eb81f3460d91c71126c08cdb8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jaegeuk-Kim/f2fs-remove-power-of-two-limitation-fo-zoned-device/20230418-084241
        git checkout 50158b3d258eb40eb81f3460d91c71126c08cdb8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181120.748RLJTl-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: fs/f2fs/super.o: in function `init_blkz_info':
>> super.c:(.text+0x1b1e): undefined reference to `__udivdi3'
   m68k-linux-ld: fs/f2fs/gc.o: in function `update_fs_metadata':
>> gc.c:(.text+0x2ae): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
