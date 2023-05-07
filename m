Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C297C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683454653; x=1714990653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYp+QyVHZkXsUSwABOsal2eQwrFaHn5FYACwgCsy4sU=;
  b=F3C1Cksrm+MnLnyHODA/zxo5M47bNFPwYphgbdudKkve0PbuTHgf4h5N
   T6De0V8wlgWl6Bt16BydsAVFGQ/6KGkAByEMO0gjVnS/Br5cGOxcW0bg1
   tLAmIko/LdXGHkQVcEoD1XNtYOzdX3p17vQGuM+jQ71dya/1TEctaucGP
   EmRgVQ1ya6qopHXxti5DbqvrNRXw6L0/qCmBQbNrMoz3dysn/euPsp0tI
   LjTIazREcaVRPspexdhMjccEv2oBGkz3fqJ3sKrZHB1t2w2Tt+T0ehNRG
   c//vDIkCE3NTWtZ2y/hb4clWE5M/1dSvtjqQMfGvJVwqf/0mH3YGnoVwD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="333903284"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="333903284"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 03:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="809907326"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="809907326"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 May 2023 03:17:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvbSM-0000ij-2v;
	Sun, 07 May 2023 10:17:30 +0000
Date: Sun, 7 May 2023 18:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>
Subject: [mcgrof-next:20230506-fs-freeze-v2 6/8] fs/super.c:404:5: warning:
 no previous prototype for 'grab_lock_super'
Message-ID: <202305071814.YK3mHK4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20230506-fs-freeze-v2
head:   407b8f408f5ce2944501836f15a73b7ea003ea11
commit: c25cd98c3bdb784d6acbb5a716ebec41f30da391 [6/8] fs: add automatic kernel fs freeze / thaw and remove kthread freezing
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230507/202305071814.YK3mHK4E-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=c25cd98c3bdb784d6acbb5a716ebec41f30da391
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next 20230506-fs-freeze-v2
        git checkout c25cd98c3bdb784d6acbb5a716ebec41f30da391
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071814.YK3mHK4E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/super.c:404:5: warning: no previous prototype for 'grab_lock_super' [-Wmissing-prototypes]
     404 | int grab_lock_super(struct super_block *s)
         |     ^~~~~~~~~~~~~~~


vim +/grab_lock_super +404 fs/super.c

   392	
   393	/**
   394	 *	grab_lock_super - lock and grab_super() to get an active reference
   395	 *	@s: reference we are trying to make active
   396	 *
   397	 *	Using grab_super() assumes you have the sb_lock held, this gets it
   398	 *	for you and calls grab_super() to get an acquire an active reference an
   399	 *	active for the superblock. Once done with the superblock user should
   400	 *	call deactivate_locked_super().
   401	 *
   402	 *	Returns 0 when the successful otherwise 0 is returned.
   403	 */
 > 404	int grab_lock_super(struct super_block *s)
   405	{
   406		spin_lock(&sb_lock);
   407		if (!grab_super(s))
   408			return 0;
   409		return 1;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
