Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C83320E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693393246; x=1724929246;
  h=date:from:cc:subject:message-id:mime-version;
  bh=N+TW6/6ii7i3dlDqkDeR9Pv5Rc26INoe9VL+VuxE/jg=;
  b=hQgyfLiBAKZv4RZM2WfiXyKoMRJ9zncplgcdo3syLKN7uYGW8HJ0AdS7
   kxVOjnVHaFe4vYrA9lHs4b6FCxSLvgOVRYD6JtXFW6pgwj1bX1E39jice
   PKC1Z4m7+PmvpKQFEq2/iyYUUDnKIljTMbz6FtE350FobK2tkFhnbTdRi
   CQZtTH8q8y8PPZzAFIIb0fZUP9P7rK6klZUhGx5ZtDMOqNkkXrBmxB418
   ej2Je6QLWq5UCKNfT9LFAkLw/PDp1rbopaRS5Rl+EC0OEUA5izNzhul0r
   HbxQEU0UwNjs9y7i1FBY1RaBvnqg+mnHNqcIfve+2SA9f7ljyamxAkuPL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355926833"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="355926833"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 04:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="768370981"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="768370981"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 04:00:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbIwG-0009ka-2v
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Aug 2023 11:00:44 +0000
Date: Wed, 30 Aug 2023 19:00:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 6403/9999]
 kernel/watchdog.c:337:13: warning: no previous declaration for
 'watchdog_check_hardlockup'
Message-ID: <202308301830.xL5WrdOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: c257fa8632bb98df1fbc4e2ac46c91c938428be2 [6403/9999] CHROMIUM: hardlockup: detect hard lockups without NMIs using secondary cpus
config: x86_64-randconfig-006-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301830.xL5WrdOZ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301830.xL5WrdOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301830.xL5WrdOZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog.c:337:13: warning: no previous declaration for 'watchdog_check_hardlockup' [-Wmissing-declarations]
    void __weak watchdog_check_hardlockup(void) {}
                ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/watchdog_check_hardlockup +337 kernel/watchdog.c

   336	
 > 337	void __weak watchdog_check_hardlockup(void) {}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
