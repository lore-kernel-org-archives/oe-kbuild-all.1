Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75773257E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694369176; x=1725905176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GuWkts7cK66umI5jWrMkoWYYMNGTIR+Ltc9Nke6Phuk=;
  b=l2pOa3hel7ZKlgZPZmcAq71IohEcGDROrQThLdTMRSoi8kQn0ukyMz+w
   IbV+uJU1jiNjrWnWFLwpmz73VF8b0++viIqVEAgGkxzL7cGJnHgD0KYjh
   erlxQ2cV0gAdzxWjYhvC6lSgE0aqxv+l5p5L+wGWQciFVKAtDMS+EvBZU
   DyfUhfCXm9clBuXUnFZu+frHYxlneXNfBQqgM/NPx/UL1CT/JEyXH+OZh
   rRTHwlagHpH9yqUyOaX1CZV2lHs56Ex+GVoHRiDfZNDrhoBNp0Q9Vj+/x
   vTOY3jlttPv9uozzxWTCKQtcI2bNw283KB/LE0xCBJsW49jCSwwaIDVpe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="362959404"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="362959404"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 11:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="772326819"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="772326819"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Sep 2023 11:06:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfOp2-0005Fb-25;
	Sun, 10 Sep 2023 18:06:12 +0000
Date: Mon, 11 Sep 2023 02:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [intel-tdx:guest 2/4] arch/x86/kernel/tdx-tests.c:66:12: warning: no
 previous prototype for 'kvm_unit_test_debug_init'
Message-ID: <202309110227.lx7Y9V0V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: 4cd6be90a565d847e1d7ccfe28264a1610a02a34 [2/4] x86/tdx-tests: Add a port of a kvm unit test
config: x86_64-randconfig-005-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110227.lx7Y9V0V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110227.lx7Y9V0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110227.lx7Y9V0V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/tdx-tests.c:66:12: warning: no previous prototype for 'kvm_unit_test_debug_init' [-Wmissing-prototypes]
      66 | int __init kvm_unit_test_debug_init(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_unit_test_debug_init +66 arch/x86/kernel/tdx-tests.c

    65	
  > 66	int __init kvm_unit_test_debug_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
