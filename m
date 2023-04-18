Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0C215C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 05:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681795763; x=1713331763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cnW1HIbHJB2apjTjxgan6xX/YPeRIxu/ZQwGwoUIG8Q=;
  b=URrPQAvaaC4Z9GXas+IPC1m5mD2RmtV+wAHvSX5K68ZqHpNt5sYy+13K
   biO1YycIwZmntuZ3MUQ9RmU4UMw0mMXq9ao32PKXjEcjZML2SNnMKLGB2
   o/zeHG+eJidAsJI3O4tKeb5zEM67ICSxuKdDrKeTxqM8rKXRePPnKqZrP
   38W9/XKmVFGi0d44ffELoMtqNvlgMhoiGYk5dyHVb5PFEeXk4F+UB7rKW
   FGOUbkw19EE+5jcbf75O8O+Y8gX6JRLVvusj1onEl75d6K338wlBLG+Gi
   vfijW4CROHo/P43g8cZwWlfcisr2xYT/tBh0pkYPFKtWVV0v/T4BnxNBm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="325418736"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="325418736"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 22:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834723462"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="834723462"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2023 22:29:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1podu5-000d1b-2C;
	Tue, 18 Apr 2023 05:29:21 +0000
Date: Tue, 18 Apr 2023 13:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] f2fs: remove power-of-two limitation fo zoned device
Message-ID: <202304181333.nA0YW6FC-lkp@intel.com>
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
config: i386-debian-10.3-kunit (https://download.01.org/0day-ci/archive/20230418/202304181333.nA0YW6FC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/50158b3d258eb40eb81f3460d91c71126c08cdb8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jaegeuk-Kim/f2fs-remove-power-of-two-limitation-fo-zoned-device/20230418-084241
        git checkout 50158b3d258eb40eb81f3460d91c71126c08cdb8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181333.nA0YW6FC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [fs/f2fs/f2fs.ko] undefined!
>> ERROR: modpost: "__udivdi3" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
