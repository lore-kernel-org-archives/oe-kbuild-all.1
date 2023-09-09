Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4909E184C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694245382; x=1725781382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hYr2VwfAaLnOctvPWIUIGEy8ustH3dkGynVzIWU0hc=;
  b=QF6FFSz/dz7Qk7oZJ6Q9IwolieJDUkdzQY9X4H0yL3Jb5onmnrV2sW4X
   jdjYVSr5Vb4QxjRQUUC9GPfwnZfuav3q+BtHgBrftwdCWyhD+L4PijYhs
   7jDwx4owfirjbF2gFFx6sXlafkWca6HZrV7VZU2T7WFFY6ANTVkLZTyIM
   tuPBWAX2q4x0YD6wpfa5n22e/COn8IyjKD8kgXOeWHqEo1QaJs8E1Vk1b
   KywpvhJbtlcFEJjMzqG2p4eLCPmntluC3nUJWo0awFAau1VLr8ZAY4lSm
   cJmAgzbuKnBh6SmQfUkKTi6vdmrkE++zGm/zRvaWHdZEF6a9OLDsv/ZQm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375175458"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="375175458"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 00:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="808261401"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="808261401"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2023 00:42:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qescE-000363-2R;
	Sat, 09 Sep 2023 07:42:50 +0000
Date: Sat, 9 Sep 2023 15:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: cc1: warning: arch/xtensa/boot/include: No such file or directory
Message-ID: <202309091516.igMNktIu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 8939c58d68f97ce530f02d46c9f2b56c3ec88399 xtensa: add __umulsidi3 helper
date:   9 months ago
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20230909/202309091516.igMNktIu-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091516.igMNktIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091516.igMNktIu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: arch/xtensa/boot/include: No such file or directory [-Wmissing-include-dirs]
--
>> cc1: warning: arch/xtensa/boot/include: No such file or directory [-Wmissing-include-dirs]
>> arch/xtensa/boot/lib/zmem.c:8:6: warning: no previous prototype for 'exit' [-Wmissing-prototypes]
       8 | void exit (void)
         |      ^~~~
>> arch/xtensa/boot/lib/zmem.c:13:7: warning: no previous prototype for 'zalloc' [-Wmissing-prototypes]
      13 | void *zalloc(unsigned size)
         |       ^~~~~~
>> arch/xtensa/boot/lib/zmem.c:35:6: warning: no previous prototype for 'gunzip' [-Wmissing-prototypes]
      35 | void gunzip (void *dst, int dstlen, unsigned char *src, int *lenp)
         |      ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
