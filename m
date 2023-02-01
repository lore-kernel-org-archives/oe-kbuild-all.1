Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89561A32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675239558; x=1706775558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Li+TT0B+WKiCJIRjk7Vh/Kz2qZAyycjXugDVo7vQKw=;
  b=D63iCYxjxIszRAlTrrbmB48tcKStsaa7fooDk/XnCJFCdtGMgnGEoOhr
   IwaOsZTtHgq7gtPf/4y1IjM+HG0JkqrIlBVyRHui9gseHjCMIvSgwykUc
   0OKVsvsv2+vx1FN08lsS3ptHNkrkGl6rwxD6TOxxypMqk8izRCHjFv4Ly
   3AwEYy6fHDEKVFVg6M1gcH3rLkKeiVYT938tq9sWMgLAlveR0yEaejIZV
   Q0RQa1SRAmwkduWiIhUTHOQXvZt/mNqQCnAZwOqyPmP46Zd0GHxbMZtlC
   Gl1rX1VpWRncRyyqszl1aQOAAFphh3L9xvG8PvxtAG78LRwVIaJSXnsNx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392658447"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392658447"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 00:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="664810060"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="664810060"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Feb 2023 00:19:17 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN8Kq-0005Fu-1c;
	Wed, 01 Feb 2023 08:19:16 +0000
Date: Wed, 1 Feb 2023 16:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 65/67]
 fs/xfs/scrub/parent.c:38:11: error: implicit declaration of function
 'xrep_setup_parent' is invalid in C99
Message-ID: <202302011634.GFC1F7RB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-parent-repair
head:   f626c6ab9f4919bc03d3c2d4be8965662cf0b208
commit: b45b926cb9f1018cd4246d48b62c0e543fb2a211 [65/67] xfs: repair parent pointers by scanning directories
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230201/202302011634.GFC1F7RB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=b45b926cb9f1018cd4246d48b62c0e543fb2a211
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs pptrs-online-parent-repair
        git checkout b45b926cb9f1018cd4246d48b62c0e543fb2a211
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/parent.c:38:11: error: implicit declaration of function 'xrep_setup_parent' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   error = xrep_setup_parent(sc);
                           ^
   fs/xfs/scrub/parent.c:38:11: note: did you mean 'xchk_setup_parent'?
   fs/xfs/scrub/parent.c:32:1: note: 'xchk_setup_parent' declared here
   xchk_setup_parent(
   ^
   1 error generated.


vim +/xrep_setup_parent +38 fs/xfs/scrub/parent.c

    29	
    30	/* Set us up to scrub parents. */
    31	int
    32	xchk_setup_parent(
    33		struct xfs_scrub	*sc)
    34	{
    35		int			error;
    36	
    37		if (xchk_could_repair(sc)) {
  > 38			error = xrep_setup_parent(sc);
    39			if (error)
    40				return error;
    41		}
    42	
    43		return xchk_setup_inode_contents(sc, 0);
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
