Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E56101F3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687260972; x=1718796972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRqprIak72y6OBIr0NXqcxvOolWaVCvqMXBa3h5xkK4=;
  b=EmS8O8aUNByVeGo4oDmFiH+S5LwqkfOAxMz4CyhAMl8O6ZfQ5jsA+VVS
   GaajSn4HWDpuBNSIFw/KkrqNUX/f106HvsMWHJpoR7Z9nYkmzZg+3aCWU
   JElScyTxpUgq6wJPzycvgD85l+5AX02HpaurRGoyiey3WjZMTFVCd7pTt
   zXHqYz6f/CTVMrcgSYVJGzF0ik3VMwj9g3K+xXYuWvRXx+6qSc+GiVQc6
   si8MLKBGRGxYask9F7IP9n+TrnOHW4Fvynmz+93C8HQfHFkVPdx1eXebU
   aoIV98FAbrrTcnriYip1iwdhgxXjE3owyGYFYOJpTS8WtWElDQq6USAAw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="359835734"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="359835734"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 04:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="717211361"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="717211361"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 04:36:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBZeb-0005qo-2o;
	Tue, 20 Jun 2023 11:36:09 +0000
Date: Tue, 20 Jun 2023 19:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2023-07 8602/23369]
 include/trace/hooks/timekeeping.h:14:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306201951.2Nl0MghJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15-2023-07
head:   d465a446d2549c989410b321e2993d49a18dd124
commit: 5168caa32a196470b560403662a31cf20837626d [8602/23369] ANDROID: Add vendor hook for tk_based_time_sync
config: i386-randconfig-s003-20230620 (https://download.01.org/0day-ci/archive/20230620/202306201951.2Nl0MghJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201951.2Nl0MghJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201951.2Nl0MghJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/time/timekeeping.c: note: in included file:
>> include/trace/hooks/timekeeping.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/timekeeping.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/timekeeping.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +14 include/trace/hooks/timekeeping.h

    12	
    13	struct timekeeper;
  > 14	DECLARE_RESTRICTED_HOOK(android_rvh_tk_based_time_sync,
    15		TP_PROTO(struct timekeeper *tk),
    16		TP_ARGS(tk), 1);
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
