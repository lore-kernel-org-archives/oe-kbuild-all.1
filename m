Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BDEDDDB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695589485; x=1727125485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7SZ6pgYw1ytFWG3CavJMUmQJWrP3FZmT8ZdUzl5Di4=;
  b=VC5PyfygqDULRBuyyxb9Nnwitg+GhpPTqSXAtbxU0BRoSsau98iZlChP
   CRvZgpKf3aPb8XgKNY4WWvClQJ1EPt9rPYNc1+ihpZ9ZbVB+GX7KycpxT
   6yrWaYhiF2wb34/ekgdJUpUdZlxlPSIlBF+7HdeNO1a9K2BDX9e989f4o
   P2VQhzlKaqpl7EvPvZhuq5nvP3GFv/dvXQS+ovz9tN/JBgfGSsJkY5gx5
   MpnITrUUUwF7YAajpQcIDo0W+CdkdTGLfliPPCfi9T9hcGb55yFi5xe1R
   8/jBD9nuBQClEmSJJjkgLaYy3iPRKSItvvjH5s3bWE9MRA9yyxO2RdMNk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360513437"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="360513437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 14:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="871849896"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="871849896"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Sep 2023 14:04:42 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkWHR-0000Sk-10;
	Sun, 24 Sep 2023 21:04:41 +0000
Date: Mon, 25 Sep 2023 05:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 4666/28548] ERROR:
 "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!
Message-ID: <202309250540.GmObJidh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   19cff29fe49cb187d02a308880d58ad8ce1cdc71
commit: 3ebeb5687243e405fbf34032249cada998ee4779 [4666/28548] FROMGIT: power: supply: Allow charger manager can be built as a module
config: i386-randconfig-011-20230915 (https://download.01.org/0day-ci/archive/20230925/202309250540.GmObJidh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250540.GmObJidh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250540.GmObJidh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
