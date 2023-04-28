Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132AA17C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682650817; x=1714186817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6xZOHVp7O/X7SGHfxRrHqZf7TRh9Wj9eU+MnTUftNU=;
  b=P/0Z5/IySPQV/MBvJD4optFTaLhrn6Q4jmV94sCcUhZyKnnPpaxImokJ
   o/auEsT5mDNr5P44ftW3NG254aDG5raHt9El2u/cxk6FTkBkjEK+7AUyk
   rmfEBeO9yNWWOmmhWqQ4fsihAfmfTPVxYsVFnOm9/NnMta3dC9eIl/0gb
   AKJhyUJciFdT3rM76Iz+bqbfymi1CLkzMu6TLKp2W/DqQWT7ZEPGSa21z
   sSYMJv+Rpm1u3EuZotBZGzylnl8qOewQKjkaslqSeV/59LMt18SGhSGPR
   GdoAXWAt41eTsStC+D+/Q89DezNcraLKe89pL+HeCiGT72Wl70d+Qn6jP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="433914038"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="433914038"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 20:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838688535"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="838688535"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2023 20:00:15 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psELG-000031-1v;
	Fri, 28 Apr 2023 03:00:14 +0000
Date: Fri, 28 Apr 2023 10:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Cross <ccross@android.com>
Cc: oe-kbuild-all@lists.linux.dev, Matthias Kaehlcke <mka@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 6248/9999]
 kernel/watchdog.c:339:13: warning: no previous prototype for
 'watchdog_check_hardlockup'
Message-ID: <202304281022.1DJrPWy1-lkp@intel.com>
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
commit: 1466322e07575c51f2af67a6616e8a983c0c7678 [6248/9999] CHROMIUM: hardlockup: detect hard lockups without NMIs using secondary cpus
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230428/202304281022.1DJrPWy1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/1466322e07575c51f2af67a6616e8a983c0c7678
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 1466322e07575c51f2af67a6616e8a983c0c7678
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281022.1DJrPWy1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog.c:339:13: warning: no previous prototype for 'watchdog_check_hardlockup' [-Wmissing-prototypes]
     339 | void __weak watchdog_check_hardlockup(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/watchdog_check_hardlockup +339 kernel/watchdog.c

   338	
 > 339	void __weak watchdog_check_hardlockup(void) {}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
