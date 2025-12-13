Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE422B2D7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765606590; cv=none; b=qsOGPOBRsFHOfO5vOSnFAwP700ON2iCXPXo5yBQ1Z+KTffQdiUQQDXv9OoVsJ5hZIs66knRXDTHdSbIwRUPETUCzGyrEvF0fMqxbEWGKhTSXT9DU53yCTHIckh7u2zxw1pqS39tU4OiOYokN6jUVy5/Em9NYcTMFnR+FL/nX2co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765606590; c=relaxed/simple;
	bh=cR/BtVB66pUNM28+FUZx+hA2IWWoArQfHElpwgtAE9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W4ZfTG6tWSR9YhP1AZRyDHSPSe05D11UiTHQQB99PRFM4DTZjIWFiZmO04uNLtPg5OG7AN5XaxzHnUCoETn81JnNMNTUIT4jk1/bo19kLQ8XyDSp7BlX++tgV9oq5pMZctduZ5o90w229xqBMp6i1SKkScKCB2SX05diV1RzGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cX3/YOL8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cX3/YOL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765606588; x=1797142588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cR/BtVB66pUNM28+FUZx+hA2IWWoArQfHElpwgtAE9I=;
  b=cX3/YOL8+OhQ7ipUP5qHYYClHPkSLihdBvdIQk9Ea9+lTmoFG3/GfZy0
   1JxY4gVipvLRAmfwx8I4tgfYZEkY5cGSz0XwL6UshQYdI2GPV2Ik6Vizd
   1uQ1ovO0QXAzzqTdkxSsPwDKZxk7DLQdHuP3/CMKL8SIob7DudFsFJuiQ
   VGBjHNsjmmVdZL49MXT/EgNZwL2WIMYDdqETl2SatYxE5hxa3Moxriy7k
   qUZBl9H+XQGXFf9VbfuCzhKMbHn3w7krur9WyGLJ4jkzD21WgXDV5xbLy
   EsFHHUiNz4R7/p/EqNEa8Z6M24Uzbrm3nX1rBfSD3CW6XTy2j9egzyW47
   A==;
X-CSE-ConnectionGUID: EoyaS5i4SRGRqVJUZTSobw==
X-CSE-MsgGUID: ufkANedjTfS7zIwzbcrD/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71459641"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71459641"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:16:27 -0800
X-CSE-ConnectionGUID: c7k8oYuOSWaBkBlxZjjuAQ==
X-CSE-MsgGUID: cucsjQqeS4uk649Byft6sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="234661069"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 22:16:27 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIvY-000000001yi-1BQ7;
	Sat, 13 Dec 2025 06:16:24 +0000
Date: Sat, 13 Dec 2025 07:15:32 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] fs/proc/stat.c:41:5: warning:
 no previous prototype for 'get_iowait_time'
Message-ID: <202512130703.vZ8Mg6Av-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 54008cf1b9e8b58f3f83c35ac48cb5c2b4a263d0 [50/50] anolis: cpuacct: export cpuacct.proc_stat interface
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512130703.vZ8Mg6Av-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130703.vZ8Mg6Av-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130703.vZ8Mg6Av-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/stat.c:41:5: warning: no previous prototype for 'get_iowait_time' [-Wmissing-prototypes]
      41 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |     ^~~~~~~~~~~~~~~


vim +/get_iowait_time +41 fs/proc/stat.c

    40	
  > 41	u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
    42	{
    43		u64 iowait, iowait_usecs = -1ULL;
    44	
    45		if (cpu_online(cpu))
    46			iowait_usecs = get_cpu_iowait_time_us(cpu, NULL);
    47	
    48		if (iowait_usecs == -1ULL)
    49			/* !NO_HZ or cpu offline so we can rely on cpustat.iowait */
    50			iowait = kcs->cpustat[CPUTIME_IOWAIT];
    51		else
    52			iowait = iowait_usecs * NSEC_PER_USEC;
    53	
    54		return iowait;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
