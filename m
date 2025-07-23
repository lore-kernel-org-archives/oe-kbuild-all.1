Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486BD1957FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753278500; cv=none; b=t7/dqvzl5lchl3OCWNPeWexj9LqI+p3b3JxE22bsF8ebGmOu8bO8ySvvp5CPSQi1s1EnWystgQupRvhVpoz4bwemAXIfQHpZf0t5dd+PBIZBILX99/nva24FJBnhtKcJF8OJ8gDh4ZoePXrB+xYal5PreOQi2EHPCs1EpYIlWoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753278500; c=relaxed/simple;
	bh=GKoeNDSAi/mcQlt648sBMtLDfpbM0DEPh137eFLA76Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsiKDfJBW9gP0KFAvIlvicuvzPLde84Ha62KJ6jMdJTh/jav4xvUqGSi/mIoeedrolTLFfaEM7UImUx9UGqJ5LwhQshg1ytnQx0MXAkS0vk7VWuCMQnxq5CqxXO1lonpwafYoNN/azv4PDy62Rs/O3Kk3XR5VWdEhQKmc79X4aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d52jMuns; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d52jMuns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753278499; x=1784814499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GKoeNDSAi/mcQlt648sBMtLDfpbM0DEPh137eFLA76Q=;
  b=d52jMunswsQ/4DaH9S0kx+3/PazQlxbhUXY5lgoNEyql50oTM3FUIpk0
   MulfmLZdgoK1DRnvRaEwCTz0C44m6id30QEowtRcHpgbtRWbfbNtwN351
   rtmnh+VhXrCEErB/qWPqFGv3c9tkSP7xzN5OhBc5ldXomu2QkJdliKYcw
   gTcDwqP9CD6giLKuzRRFFQZlZn5MR1bG9LKF56BFjIUBR15JVjn7pG59J
   +dAuh1uJUCxi1+Kv65ryiVTaauIS2ioC26EzwqNAY7pQokA5ji7owpjoB
   UtoQmokZac/rx6TpYE82ay0mRnWvcJyO6nxeWxVuw8K2nM8LyCCyLVIXN
   g==;
X-CSE-ConnectionGUID: KABP5ccUR2q78pO6amQ6+A==
X-CSE-MsgGUID: fBTmL2ucTw6pUT9yY0+GpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73138433"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="73138433"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 06:48:16 -0700
X-CSE-ConnectionGUID: S0jMiOm0QDC3v8YgbR5y3Q==
X-CSE-MsgGUID: 6ZILBXtFSsSQPipYNyWL7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159819310"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2025 06:48:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueZpM-000JOl-2y;
	Wed, 23 Jul 2025 13:48:12 +0000
Date: Wed, 23 Jul 2025 21:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/next-fixes 7/7] net/core/net_namespace.c:815:13:
 warning: unused variable 'ret'
Message-ID: <202507232149.WCvhHcIb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   a225423b2eaee3811813f96bfe4402b667aed2bc
commit: a225423b2eaee3811813f96bfe4402b667aed2bc [7/7] net: testing
config: x86_64-buildonly-randconfig-001-20250723 (https://download.01.org/0day-ci/archive/20250723/202507232149.WCvhHcIb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507232149.WCvhHcIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507232149.WCvhHcIb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/net_namespace.c: In function 'net_ns_net_init':
>> net/core/net_namespace.c:815:13: warning: unused variable 'ret' [-Wunused-variable]
     815 |         int ret;
         |             ^~~
   net/core/net_namespace.c: At top level:
>> net/core/net_namespace.c:808:13: warning: 'net_ns_net_debugfs' defined but not used [-Wunused-function]
     808 | static void net_ns_net_debugfs(struct net *net)
         |             ^~~~~~~~~~~~~~~~~~


vim +/ret +815 net/core/net_namespace.c

8f2079f8da5b6d Jeff Layton       2025-06-18  798  
8f2079f8da5b6d Jeff Layton       2025-06-18  799  static int __init init_net_debugfs(void)
8f2079f8da5b6d Jeff Layton       2025-06-18  800  {
8f2079f8da5b6d Jeff Layton       2025-06-18  801  	ref_tracker_dir_debugfs(&init_net.refcnt_tracker);
8f2079f8da5b6d Jeff Layton       2025-06-18  802  	ref_tracker_dir_debugfs(&init_net.notrefcnt_tracker);
8f2079f8da5b6d Jeff Layton       2025-06-18  803  	net_ns_net_debugfs(&init_net);
8f2079f8da5b6d Jeff Layton       2025-06-18  804  	return 0;
8f2079f8da5b6d Jeff Layton       2025-06-18  805  }
8f2079f8da5b6d Jeff Layton       2025-06-18  806  late_initcall(init_net_debugfs);
8f2079f8da5b6d Jeff Layton       2025-06-18  807  #else
8f2079f8da5b6d Jeff Layton       2025-06-18 @808  static void net_ns_net_debugfs(struct net *net)
8f2079f8da5b6d Jeff Layton       2025-06-18  809  {
8f2079f8da5b6d Jeff Layton       2025-06-18  810  }
8f2079f8da5b6d Jeff Layton       2025-06-18  811  #endif
8f2079f8da5b6d Jeff Layton       2025-06-18  812  
98f842e675f96f Eric W. Biederman 2011-06-15  813  static __net_init int net_ns_net_init(struct net *net)
98f842e675f96f Eric W. Biederman 2011-06-15  814  {
8f2079f8da5b6d Jeff Layton       2025-06-18 @815  	int ret;
8f2079f8da5b6d Jeff Layton       2025-06-18  816  

:::::: The code at line 815 was first introduced by commit
:::::: 8f2079f8da5b6d4373d125a05cb076b0d6dc646b net: add symlinks to ref_tracker_dir for netns

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
