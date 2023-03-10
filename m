Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2197B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 03:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678419533; x=1709955533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzW+0+zVRAQZpgxT4BamnHspksg/J/6KLmrBeWSYeok=;
  b=VOA3DVhr89XZLRJSB7+oCsw3rHtdzqu1Mn25xcyNTBi+ePQx6L/wq10v
   mw9kVzJLf7NI/yubVr5CdNMCi+48wRVTQ8jeSgJxrU01VxpXAOQXSEkbw
   t9RB4kZQ334Zce4A3531ot5wy9Uk3FAVjPtjnmoVdB7cHkW0T7DXkj1lw
   AniHG/gZioyRA7iLWLIFPuWfF3xFuB43hDZD877vouzOkYskuPRPVxfIB
   7YPrDJ0e8XqJtK1Aa3d5vwZKmVKxJvw+D/aCClcJp5qGNmnkQbKUZhYRR
   /+e9hakv/PE29Q6C/VeY+551aSH90oD4WuQwMi/VE+Y4yxPk0Pn0JTzoi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364288493"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="364288493"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 19:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677656545"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="677656545"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 19:38:51 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paTal-0003SR-0l;
	Fri, 10 Mar 2023 03:38:51 +0000
Date: Fri, 10 Mar 2023 11:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 5/6]
 drivers/scsi/ufs/ufshcd.c:150:13: warning: 'system_suspending' defined but
 not used
Message-ID: <202303101115.LKnkeCZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   174add77871fae6fc97f2e8a6dcaa15541b4077b
commit: 9ec67418f588672a0034fe7a5284accaaa98a6bd [5/6] BACKPORT: UPSTREAM: scsi: ufs: Track system suspend / resume activity
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230310/202303101115.LKnkeCZv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout 9ec67418f588672a0034fe7a5284accaaa98a6bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/scsi/ufs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101115.LKnkeCZv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ufs/ufshcd.c:150:13: warning: 'system_suspending' defined but not used [-Wunused-variable]
     150 | static bool system_suspending;
         |             ^~~~~~~~~~~~~~~~~


vim +/system_suspending +150 drivers/scsi/ufs/ufshcd.c

   149	
 > 150	static bool system_suspending;
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
