Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654A6FB8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044913; x=1726580913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iUUr7DrnEnCgYylPd1mEbdAQScHs2pVxy7LdvVdbChM=;
  b=D8tL30cxAdH9mLkMQ9w4m5lWI4jSydkVSxX+gIU/YoQKfMRfY6HUzYwc
   VLbmKGSq54J5wl1otlog5c+YiyeVfTezy5L+dK7nrllAFk2YZ2CwvtYuP
   Qn2AyfxImDxzGXlNXF5Jf/8Phi0B/I9IdZ9Y/uVq/202SYjKDDSGciTGS
   8sR1hZsNiPfCn2eDqa1vuLfpdRBOWrXKU0QVAUKflNpCexpwJOA6lAc/E
   ZW6E7BLWfpsIOiqB155EgdoUiqMYo89vW6+2thZ54jwYRBCsuqYmlo9CZ
   rIenlcQlyyiVuWU3fFYp1rubUtKm6MOKVRspA/oR8+PA85GHKsT3vctdI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443732345"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="443732345"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811363895"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811363895"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2023 06:48:31 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiEc1-00068q-0K;
	Mon, 18 Sep 2023 13:48:29 +0000
Date: Mon, 18 Sep 2023 21:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5k 29/29] test_dynamic_debug.c:undefined reference to
 `dd_mt_sites'
Message-ID: <202309182146.8lJSbQSE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5k
head:   4ddb17b77bfb55e87a4ee98d72b9432d229fb1a6
commit: 4ddb17b77bfb55e87a4ee98d72b9432d229fb1a6 [29/29] dyndbg: add sites_mt into _ddebug_info
config: csky-randconfig-002-20230918 (https://download.01.org/0day-ci/archive/20230918/202309182146.8lJSbQSE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309182146.8lJSbQSE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309182146.8lJSbQSE-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: lib/test_dynamic_debug.o: in function `do_prints':
>> test_dynamic_debug.c:(.text+0x570): undefined reference to `dd_mt_sites'
   csky-linux-ld: lib/test_dynamic_debug_submod.o: in function `do_prints':
>> test_dynamic_debug_submod.c:(.text+0x570): undefined reference to `dd_mt_sites'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
