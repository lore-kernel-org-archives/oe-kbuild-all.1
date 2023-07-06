Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6705F15AFC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 23:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688687628; x=1720223628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grlDMbf4BFIEGw0V0JonSXApFsS8XIa84zjnYAl9MgE=;
  b=VGS0FcMaXHOIXKigFZVcfHlDZtSHqrhlV7j90nWw9ynmHwddElXTKcDd
   CdLJRCFt/Q9NDH3HZhzSCNtvxWahPQZyPu7hjCz6q6NEh+YsY2da7SSdl
   WqZryICeoBfTtXZNxwXwIDMDq/8RuU9/tnNC9yZfiIV3QlJIBVdglbUI6
   Yk0qKY56KadHDsPxYU5XmPQbQD8Z+lbaelkrS3YRVbhBQwNGSxGnj2NaS
   L9f3wK3CXTA7++qWkpJQtH3yz7NNdKk5GRnsQfq6Yr5phgHg5sSXcHqNU
   7lN090WhpWNLN7bMGFkxlPbQpVRRuLS8q9vjbiAeCSrHoZ7xvJJyYkC7D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="361229446"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="361229446"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 16:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="893761328"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="893761328"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Jul 2023 16:53:45 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHYnA-0001cE-1y;
	Thu, 06 Jul 2023 23:53:44 +0000
Date: Fri, 7 Jul 2023 07:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/md/dm-verity-avb.c:177:6: warning: no previous prototype for
 function 'dm_verity_avb_error_handler'
Message-ID: <202307070730.OladzPXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: f6219b7d72f896548c596ddb6249ecffdab8b041 ANDROID: AVB error handler to invalidate vbmeta partition.
date:   2 years, 7 months ago
config: riscv-randconfig-r013-20230707 (https://download.01.org/0day-ci/archive/20230707/202307070730.OladzPXw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070730.OladzPXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070730.OladzPXw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-verity-avb.c:177:6: warning: no previous prototype for function 'dm_verity_avb_error_handler' [-Wmissing-prototypes]
     177 | void dm_verity_avb_error_handler(void)
         |      ^
   drivers/md/dm-verity-avb.c:177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     177 | void dm_verity_avb_error_handler(void)
         | ^
         | static 
   1 warning generated.


vim +/dm_verity_avb_error_handler +177 drivers/md/dm-verity-avb.c

   176	
 > 177	void dm_verity_avb_error_handler(void)
   178	{
   179		dev_t dev;
   180	
   181		DMINFO("AVB error handler called for %s", avb_vbmeta_device);
   182	
   183		if (strcmp(avb_invalidate_on_error, "yes") != 0) {
   184			DMINFO("Not configured to invalidate");
   185			return;
   186		}
   187	
   188		if (avb_vbmeta_device[0] == '\0') {
   189			DMERR("avb_vbmeta_device parameter not set");
   190			goto fail_no_dev;
   191		}
   192	
   193		dev = name_to_dev_t(avb_vbmeta_device);
   194		if (!dev) {
   195			DMERR("No matching partition for device: %s",
   196			      avb_vbmeta_device);
   197			goto fail_no_dev;
   198		}
   199	
   200		invalidate_vbmeta(dev);
   201	
   202	fail_no_dev:
   203		;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
