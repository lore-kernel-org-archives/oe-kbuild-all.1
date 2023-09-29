Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74C399
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 05:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695964522; x=1727500522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFOQGMJkmyt72fn5FQHjtm+T/zfGWsE1E61Q95IGhVw=;
  b=nfLjcaNxiyucVVOJrP/Hm4rR1JMai1/PaBtthvrTn21fmrp5fKds6Kqn
   LmemCATLkf/R+pNzZ07aRmdaovdkEj9LxyisZgCtil1qdhSYrZXuK1b+H
   xXJEGwkLEeVWGj4A8WKpV8+pfZJVL2ITOvVAHLmjOhZF9rg8GHLtnoZmT
   U1K0aGMTvyv1MltVrJyJUJ0hYkIpV1mQPda5QlTteUnvqjYimL8sa7ZpP
   iwUiXCKxUIbN2KJlabeUX87+b5IAsLX7UgAaMIQb+nCDo+glQFX6CLc22
   rvjy7ObKGDvS/kJRplh2Hg1WUniAswqsq/H8lNcxr0zKwvMXDgfRLi6LA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840957"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="840957"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 22:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726491814"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="726491814"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2023 22:15:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm5qP-0002VC-1A;
	Fri, 29 Sep 2023 05:15:17 +0000
Date: Fri, 29 Sep 2023 13:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 83/89] ld: file.c:undefined reference to
 `ioread64'
Message-ID: <202309291322.3pZiyosI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   10c060edf581fdd0d8f23cab84e6c8546c2df8fc
commit: 09289d0ad1226c4735f8d9f68c9c3e54cbaba3d4 [83/89] debugfs_create_regset32() support 8/16/64 bit width registers
config: x86_64-buildonly-randconfig-003-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291322.3pZiyosI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291322.3pZiyosI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291322.3pZiyosI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/debugfs/file.o: in function `debugfs_print_regs':
   file.c:(.text+0x95a): undefined reference to `ioread64be'
>> ld: file.c:(.text+0x9dd): undefined reference to `ioread64'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
