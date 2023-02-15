Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F775CB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676470673; x=1708006673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MShxxSuA+1Y/DQDSgbgpqxlVPdcTVUJK7+48wEYsdjk=;
  b=EpJyuT/v5RJPRsxOtNq/hc9VXPLh5zyNnFiR0xym9TN7eN/KTmw6m2Qc
   Se+pMYBf1KwVotA4XfZUeXemPJBla5SLr2wxmZuMqv6xmnAKFUFH8Ovjp
   EFrBvb8ldHzYcSqTdZ6ehmmMayZE1iyidYTUgOiVfVXZvYYTs2UV3Brta
   9sM0OAfPt3qNsarjWYHEcnxHIvvfOyWo2ZLU1mc1072mXpk5sReiZdJk+
   djGRRXFUsp8ViuPy2ZeD1QHy3IcqlUV0ZyptMkhzI2qmmouVVk5DCpZfi
   Fd8h5kNDXbbHS62T1w3ZYMrwUpQSTv/q/gQ7i76XGJD/V4PBlSuuWDCyd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333577188"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="333577188"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 06:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="793509706"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="793509706"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Feb 2023 06:17:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSIbU-0009Qz-1V;
	Wed, 15 Feb 2023 14:17:48 +0000
Date: Wed, 15 Feb 2023 22:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 72/84] ERROR: modpost:
 "xbitmap_init" [fs/xfs/xfs.ko] undefined!
Message-ID: <202302152242.WrIpebLN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-parent-repair
head:   3d6a7fbcc79ebb1a96479c8b10d26de1c3591f36
commit: 211c4efb2241d80825c302ee45de35fbff1b3cb3 [72/84] xfs: create an xattr iteration function for scrub
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230215/202302152242.WrIpebLN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=211c4efb2241d80825c302ee45de35fbff1b3cb3
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs pptrs-online-parent-repair
        git checkout 211c4efb2241d80825c302ee45de35fbff1b3cb3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152242.WrIpebLN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xbitmap_init" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "xbitmap_test" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "xbitmap_destroy" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "xbitmap_set" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
