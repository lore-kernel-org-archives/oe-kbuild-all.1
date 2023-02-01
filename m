Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776157F4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 06:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675231448; x=1706767448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZsCpG3EcniQB4Nvv/Fi+W5QRLsyOHJtEwqxGrrroUkk=;
  b=oAK1nvFfKFmVMbge8w+1Y8A9POXx3ps4IhEaQoT9EoJ7P4gRf5hQNSTg
   9KfNh/CxCTCrxOSfI39Fbz5lk1ovMti5A5HufFlBD/X+hLixQroueFAmO
   6XglMwLujMp2w5dA6Tr3Ug/pZ6f/PRaUGxXWtUWlSXQRQEmO1kQTReLA7
   8iOz8TuA+25odu+LhPO7HnyMCEdGJcFjlgEdjle9/ksFCVPxBd3TFgE4K
   k1+DMBUKQB45JiXWHVMxgNKs9V1sO912kBT774RkVDvhV+MFA7AIHwNe9
   phlKPpnBxkT4vhSHg04G4BQiRZqurffQGyDP5cT/wFJnKfZVWH+yCXDhb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="326712868"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="326712868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 22:04:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="664768724"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="664768724"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2023 22:04:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN6E2-00058a-0V;
	Wed, 01 Feb 2023 06:04:06 +0000
Date: Wed, 1 Feb 2023 14:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 65/67]
 fs/xfs/scrub/parent.c:38:25: error: implicit declaration of function
 'xrep_setup_parent'; did you mean 'xchk_setup_parent'?
Message-ID: <202302011331.6XJ4k3FQ-lkp@intel.com>
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
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230201/202302011331.6XJ4k3FQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=b45b926cb9f1018cd4246d48b62c0e543fb2a211
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs pptrs-online-parent-repair
        git checkout b45b926cb9f1018cd4246d48b62c0e543fb2a211
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/xfs/scrub/parent.c: In function 'xchk_setup_parent':
>> fs/xfs/scrub/parent.c:38:25: error: implicit declaration of function 'xrep_setup_parent'; did you mean 'xchk_setup_parent'? [-Werror=implicit-function-declaration]
      38 |                 error = xrep_setup_parent(sc);
         |                         ^~~~~~~~~~~~~~~~~
         |                         xchk_setup_parent
   cc1: some warnings being treated as errors


vim +38 fs/xfs/scrub/parent.c

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
