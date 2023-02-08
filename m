Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6D879D0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 21:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675890932; x=1707426932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5gOtrsXQJG9sZPKrOzeb9s8Lh7k3EoNvCg2KDDWiBg=;
  b=RJHYerh8Hv98UhTZR2l7ZqUWMIjuB3dYttjQo6IS5e6a+O2DOqmKiMns
   dhtdYK5zOhkk0zUG7axcxGR/QamU8tFmXakFxPGgc3rNGik8k+3Y6Mopr
   PqDeD/UVz61QgOqS5SWyyblPe6/SLbOJYoWxlGcxCKBjZo1syCctxO42t
   grXpwXn8ly9AYYkKmkXODZ2QrSEimRioDka+tFldYFmV2DgZQ2vYl8lwt
   Q+q3c4fkYrVzrKTkiIB4kvmA1mrZJ60rcEGKwmaXl1Z325YlojFVFt6cF
   wIlbdN1IWrgaZOcv617UcRajGss82lOK67JJujhSmxjwsNtiCrbUHjl9i
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310286244"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310286244"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 13:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="669330289"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="669330289"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2023 13:15:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPrmc-0004eq-26;
	Wed, 08 Feb 2023 21:15:14 +0000
Date: Thu, 9 Feb 2023 05:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-for-next 2/2] drivers/ufs/host/ufs-sprd.c:21:34:
 warning: array 'ufs_sprd_of_match' assumed to have one element
Message-ID: <202302090518.dheLEZ1s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-for-next
head:   473b8dce834121e5e075c5f94b93762990781799
commit: 473b8dce834121e5e075c5f94b93762990781799 [2/2] scsi: ufs: Suppress !defined(MODULE) warnings
config: ia64-randconfig-c023-20230209 (https://download.01.org/0day-ci/archive/20230209/202302090518.dheLEZ1s-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/473b8dce834121e5e075c5f94b93762990781799
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche scsi-for-next
        git checkout 473b8dce834121e5e075c5f94b93762990781799
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/ufs/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302090518.dheLEZ1s-lkp@intel.com

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/ufs-sprd.c:21:34: warning: array 'ufs_sprd_of_match' assumed to have one element
      21 | static const struct of_device_id ufs_sprd_of_match[];
         |                                  ^~~~~~~~~~~~~~~~~
   drivers/ufs/host/ufs-sprd.c:388:29: warning: 'n6_ufs' defined but not used [-Wunused-variable]
     388 | static struct ufs_sprd_priv n6_ufs = {
         |                             ^~~~~~
   drivers/ufs/host/ufs-sprd.c:21:34: warning: 'ufs_sprd_of_match' defined but not used [-Wunused-const-variable=]
      21 | static const struct of_device_id ufs_sprd_of_match[];
         |                                  ^~~~~~~~~~~~~~~~~


vim +/ufs_sprd_of_match +21 drivers/ufs/host/ufs-sprd.c

df7320bac37e83 Zhe Wang 2022-12-09  20  
df7320bac37e83 Zhe Wang 2022-12-09 @21  static const struct of_device_id ufs_sprd_of_match[];
df7320bac37e83 Zhe Wang 2022-12-09  22  

:::::: The code at line 21 was first introduced by commit
:::::: df7320bac37e837f43883a51ce879c07c4429180 scsi: ufs: ufs-unisoc: Add support for Unisoc UFS host controller

:::::: TO: Zhe Wang <zhe.wang1@unisoc.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
