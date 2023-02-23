Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AAB23A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677143096; x=1708679096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRQ0A2IVH1Uu3Nprlk2JOs6RlHKzpwL8Qfsl+/YFQrs=;
  b=RSJGDwqevIphefU5VG0uoZH5bNuoSKEmdJ5a1IU8HjA4v9nfgNnqB6Te
   sHbEaASCUXRxWFGSZSx1MtpSIyrUOojgNn3rR/zh4zCLlQux+IoW6VLb3
   gp7VPnRyO1L/tbGY8emtlYgyBgHoJWtz/VQp1+S6I5t6VSh8XJRUA4oMg
   BOMjaqRGbJ6V55W+nzYQVSjBF2/t6Cs+G/f6+asQeD6+eJsHklWl6IQIA
   QDH09Lj9sg4YQFq14AvQEa54N9OibMw5+KcadFx6k19WKg8CJdKToEvXk
   Z0RbnALM/c5lynsI21qzeZ4vu3IO/kqp7Q0KRNdAB/redBU+LvXETJ/K/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="335362531"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="335362531"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 01:04:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="622259209"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="622259209"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2023 01:04:55 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV7X4-0001Cf-0F;
	Thu, 23 Feb 2023 09:04:54 +0000
Date: Thu, 23 Feb 2023 17:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: LCPD Auto Merger <lcpd_integration@list.ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-5.10.y 1/1] mm/hugetlb.c:5543:6: warning: no
 previous prototype for 'want_pmd_share'
Message-ID: <202302231704.043SPUv4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-5.10.y
head:   7719cd0b7e86f706a1467a15a115cabb56f78d6e
commit: 839fcdf8509080be95f6f4be06704e5f22ee3aef [1/1] Merge remote-tracking branch 'ti-linux-5.10.y' into HEAD
config: ia64-randconfig-r012-20230222 (https://download.01.org/0day-ci/archive/20230223/202302231704.043SPUv4-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-android-linux-5.10.y
        git checkout 839fcdf8509080be95f6f4be06704e5f22ee3aef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231704.043SPUv4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:5543:6: warning: no previous prototype for 'want_pmd_share' [-Wmissing-prototypes]
    5543 | bool want_pmd_share(struct vm_area_struct *vma, unsigned long addr)
         |      ^~~~~~~~~~~~~~


vim +/want_pmd_share +5543 mm/hugetlb.c

8b03b571138897 Peter Xu     2021-03-18  5542  
8b03b571138897 Peter Xu     2021-03-18 @5543  bool want_pmd_share(struct vm_area_struct *vma, unsigned long addr)
8b03b571138897 Peter Xu     2021-03-18  5544  {
8b03b571138897 Peter Xu     2021-03-18  5545  	return false;
8b03b571138897 Peter Xu     2021-03-18  5546  }
3212b535f200c8 Steve Capper 2013-04-23  5547  #endif /* CONFIG_ARCH_WANT_HUGE_PMD_SHARE */
3212b535f200c8 Steve Capper 2013-04-23  5548  

:::::: The code at line 5543 was first introduced by commit
:::::: 8b03b571138897e9192ce69ef6bb86b90924978e FROMGIT: mm/hugetlb: fix build with !ARCH_WANT_HUGE_PMD_SHARE

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
