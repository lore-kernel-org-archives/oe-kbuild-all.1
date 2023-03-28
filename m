Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344EA3D74
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680021817; x=1711557817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ifJv7WGm1PqAKW94HBCfLiMSqfXPhD4dC+ZV5tdmfwM=;
  b=aDJ+0TyPSb8EIcP71EkfnLHLanem1mTetVBk/yr1S9pA63FFl3ZPZZ11
   TeFWkslJwDl0EUymI00kci2hZCSy/ga1p1K1/zUh8L91rswIzh2KsblQY
   Kz9Yip1KCi317udEZCNSeurE4KkGrZDMdIxnJOA3k681dyHQQoj6l4lCG
   86dySXc7ybtHsmZANSiCVtLqvUS7P8kZr63PhVlXWAQi40yeV/HZg6KmB
   oWYx2A2PnHP6jPetftRi+mWgIn7H2EkCfFWB/Iv94y5pGtaRo9LGrwrIN
   9DHniGZETqzK7pR0rTvHdU3lElH/vQiQ6FeHZjNaYjsfguM/+jy7DBhTi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339346784"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="339346784"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 09:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="748457429"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="748457429"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2023 09:43:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phCPg-000Iih-22;
	Tue, 28 Mar 2023 16:43:12 +0000
Date: Wed, 29 Mar 2023 00:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/md/dm-verity-target.c:1178:24-30: ERROR: application of
 sizeof to pointer
Message-ID: <202303290051.KhwlQ27Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 08eb8d58a182a6fdebef25088bde6fc6cb5b10b9 CHROMIUM: md: dm-verity fixes chromeos needs
date:   2 years, 3 months ago
config: powerpc-randconfig-c003-20230326 (https://download.01.org/0day-ci/archive/20230329/202303290051.KhwlQ27Q-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290051.KhwlQ27Q-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-verity-target.c:1178:24-30: ERROR: application of sizeof to pointer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
