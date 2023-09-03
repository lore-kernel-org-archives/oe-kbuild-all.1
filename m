Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ADF15A2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693726309; x=1725262309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yLPLSkbqHyZdHuGGKRbOPX37rGgmjcbVflDqsdrlyZk=;
  b=AAy6sM37leOXkAjvh4TVc0OfZqWAVuPZQKrFpepyg5YV2A8RxTAb/BvT
   Wccj28wItvBmLdRzcOUZpEG+2ADqvU/rOMvB/gZfLWPaxeC40PQjZJDOp
   J9zEKdaKmokup95Lasuo1/8xVH+StrMzdyu3kqKYK+zl5h+eaYbA15kfr
   goSLiPVKrToixjQFGtFMAFSuCo+6Ce55YeY3MXwjWaSOgOekTBXlSafly
   MBWcVUqlFSMsPjkaoNGDlSBtjL4gGvbHBKncJNnH2x3pf+7wvoYFbOkkV
   9xBMdnR3krJHg6xweYXVESpgqcqav1++Jy9zIrNbfGcpHtL+DLcE/H9Ub
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="366657080"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="366657080"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 00:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="855219446"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="855219446"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2023 00:31:47 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qchaD-00030K-1D;
	Sun, 03 Sep 2023 07:31:45 +0000
Date: Sun, 3 Sep 2023 15:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_3 14413/14511]
 drivers/nvmem/core.c:80:23: sparse: sparse: symbol 'nvmem_nb' was not
 declared. Should it be static?
Message-ID: <202309031528.MnyWkq8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_3
head:   bd334514d2acb4d7ae8675e52ad6faf9cd7e64b6
commit: c4f9cc45943b23c6201b3d970ee3af735ed17d45 [14413/14511] nvmem: core: Rework layouts to become platform devices
config: x86_64-randconfig-123-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031528.MnyWkq8S-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031528.MnyWkq8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031528.MnyWkq8S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvmem/core.c:80:23: sparse: sparse: symbol 'nvmem_nb' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
