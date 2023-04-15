Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EABED5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681545635; x=1713081635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsmj2BcoU2L1en6vu2zhyJc+34WHbF/MH5Uddgdi96s=;
  b=gpbyhrJawtvreMQiXsS1nU0YBqVRVmmb3Ar9QRfwM8vGMi0l4SysVDx/
   m2Isk5DvK/L3fj9GzxiDQr8bbb6FThd20prG6hPfIWZ+JXUJpZrz/zKT0
   YpuzySju8Egs2QLHGlUSJazL0ASighJVZH0bS6zFiz2tmUuJ4gwRJGD+s
   kzEhCD/1MPrdK+HfjnJoIeYJo9US+mgOY5j792scdnhq0s7v1NOZ6/xTv
   9loko4rRkPGF3OGsWNKBL+tjpsCTynTISdOQ5avTMWpiBEkhBz8B4P8bb
   5oU3mgGid8lc5KxzoD70FdBcStakXui4RdeH2+a+XJrEhm+mYiHdbRf4U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324974760"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324974760"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 01:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722744300"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="722744300"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Apr 2023 01:00:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnapZ-000aic-2I;
	Sat, 15 Apr 2023 08:00:21 +0000
Date: Sat, 15 Apr 2023 15:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:ctime 1/4] fs/stat.c:38: undefined reference to
 `__aarch64_ldset8_relax'
Message-ID: <202304151541.Wo60cfLD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ctime
head:   10fbc119ad14c9f58d85f8a7acececc9213ba069
commit: d30ff83ee9d572a87e5b09fe1734fba3dc7afbf2 [1/4] fs: add infrastructure for opportunistic high-res ctime/mtime updates
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230415/202304151541.Wo60cfLD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=d30ff83ee9d572a87e5b09fe1734fba3dc7afbf2
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ctime
        git checkout d30ff83ee9d572a87e5b09fe1734fba3dc7afbf2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151541.Wo60cfLD-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: fs/stat.o: in function `generic_fill_ctime':
>> fs/stat.c:38: undefined reference to `__aarch64_ldset8_relax'
   aarch64-linux-ld: fs/inode.o: in function `current_ctime':
>> fs/inode.c:2085: undefined reference to `__aarch64_ldclr8_relax'


vim +38 fs/stat.c

    28	
    29	/* FIXME: seqlock? */
    30	void generic_fill_ctime(struct inode *inode, struct kstat *stat)
    31	{
    32		stat->ctime = inode->i_ctime;
    33		if (is_hires_ctime(inode)) {
    34			/*
    35			 * Atomically set the QUERIED flag and fetch the new value with
    36			 * the flag masked.
    37			 */
  > 38			stat->ctime.tv_nsec = __atomic_or_fetch(&inode->i_ctime.tv_nsec,
    39								I_CTIME_QUERIED,
    40								__ATOMIC_RELAXED) &
    41						      ~I_CTIME_QUERIED;
    42		}
    43	}
    44	EXPORT_SYMBOL(generic_fill_ctime);
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
