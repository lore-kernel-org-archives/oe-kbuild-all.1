Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFDA2117
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676727723; x=1708263723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gNIRKDM8dxcRBW+hVY2H2fHMEe2YXUp52cRk2ts7In8=;
  b=Nb8tTpmodTI6DMe/h44L4J4SCNPhu8N5d+USrrmX+zl+F49ijIigY9B1
   BrIAPBSEadSqyfIMS0B3T4Qm8ShDT5OW9PULH+GkZ+IaXyUJEkQGLpiqK
   A/0Q3oUtjNohq9Px4PUI1b2tMJk5Wl6/1qXSot3SUw8wO4GYGlZJtkorx
   UkdNouQwfvHPhqf/hzE91Go9OFViseRcgJrgVdQomomW6w8mG1QaMpbp/
   5zrd/rp/xzL20wMOgm0ak55vF0zfWotzPtRMoAoQEhA3rS4CnYuYo1Vou
   rvuBMc0a9/P2f9Xrqj5XYB9IjfuC8LQZAuYmzCirdAJGFs2j/jLvQsHgi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="332175483"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="332175483"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 05:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="734643098"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="734643098"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Feb 2023 05:42:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTNTV-000CRB-1q;
	Sat, 18 Feb 2023 13:42:01 +0000
Date: Sat, 18 Feb 2023 21:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 132/273] ld.lld: error: assignment to
 symbol __efistub__end does not converge
Message-ID: <202302182107.Xdk8rdWr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   118ba6d00ef9ac0b521db376a0c136c51ddbf038
commit: 6e8abff337b191bcd4e20daee8697f10169be191 [132/273] xfs: rewrite xfs_icache_inode_is_allocated
config: arm64-buildonly-randconfig-r002-20230217 (https://download.01.org/0day-ci/archive/20230218/202302182107.Xdk8rdWr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=6e8abff337b191bcd4e20daee8697f10169be191
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout 6e8abff337b191bcd4e20daee8697f10169be191
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302182107.Xdk8rdWr-lkp@intel.com/

Note: the djwong-xfs/xfile-page-caching HEAD 118ba6d00ef9ac0b521db376a0c136c51ddbf038 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol __efistub__end does not converge

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
