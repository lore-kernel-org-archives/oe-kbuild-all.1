Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3859A2EAEA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAfr+MTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697570332; x=1729106332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZ3eB+oCDwnWDLhOzhIgiJNjq3MnEpx6QhwptGlF+lM=;
  b=CAfr+MTBpBp4TV8ul/UFFqdHCz7iYiYKuKzFZPsTVSSLwxfH1yBF+2l9
   2FF1X2BJzjxQCmDyGcXBuvlhflBFI4LrMnq2rHrhXsG3zzPRAIQCwEK42
   znRKD8X4PtFyo3T/LpFAGfD33UCkN+HMDvH1OBOeHckvSMNGfKSpxOsXk
   EHYp0nKqVB8vo64qszssLD7tKWAM6yInuYDHYOkmrPfTAwXz4n93CKLcW
   VZuwUQ71C7M4fFjlSfV+mV+ipG1IWRma7PmxcUUFJ94kczlR4v/WT6Y4X
   ogVVJhVb8xdgrNNOdcw2n9N0LPBbLmRg069VtOia/kpH02w1GTOF5BVSy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384742053"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="384742053"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 12:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="1003463798"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="1003463798"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2023 12:18:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qspaX-0009zD-2y;
	Tue, 17 Oct 2023 19:18:46 +0000
Date: Wed, 18 Oct 2023 03:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: drivers/hv/channel.c:597: warning: Function parameter or member
 'size' not described in 'request_arr_init'
Message-ID: <202310180325.z51l0QSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: f83705a51275ed29117d46e1d68e8b16dcb40507 Driver: VMBus: Add Devicetree support
date:   6 months ago
config: x86_64-buildonly-randconfig-003-20230823 (https://download.01.org/0day-ci/archive/20231018/202310180325.z51l0QSy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180325.z51l0QSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180325.z51l0QSy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/channel.c:597: warning: Function parameter or member 'size' not described in 'request_arr_init'


vim +597 drivers/hv/channel.c

3e7ee4902fe699 drivers/staging/hv/Channel.c Hank Janssen   2009-07-13  588  
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  589  /**
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  590   * request_arr_init - Allocates memory for the requestor array. Each slot
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  591   * keeps track of the next available slot in the array. Initially, each
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  592   * slot points to the next one (as in a Linked List). The last slot
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  593   * does not point to anything, so its value is U64_MAX by default.
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  594   * @size The size of the array
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  595   */
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  596  static u64 *request_arr_init(u32 size)
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09 @597  {
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  598  	int i;
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  599  	u64 *req_arr;
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  600  
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  601  	req_arr = kcalloc(size, sizeof(u64), GFP_KERNEL);
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  602  	if (!req_arr)
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  603  		return NULL;
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  604  
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  605  	for (i = 0; i < size - 1; i++)
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  606  		req_arr[i] = i + 1;
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  607  
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  608  	/* Last slot (no more available slots) */
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  609  	req_arr[i] = U64_MAX;
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  610  
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  611  	return req_arr;
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  612  }
e8b7db38449ac5 drivers/hv/channel.c         Andres Beltran 2020-11-09  613  

:::::: The code at line 597 was first introduced by commit
:::::: e8b7db38449ac5b950a3f00519171c4be3e226ff Drivers: hv: vmbus: Add vmbus_requestor data structure for VMBus hardening

:::::: TO: Andres Beltran <lkmlabelt@gmail.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
