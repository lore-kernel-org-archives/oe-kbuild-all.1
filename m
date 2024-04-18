Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918E1178CEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713463916; cv=none; b=J2l5Q5TJ1FAHh8vE1lXqD8vAmCRgRDkLE2PGyRNiQL+fsK0AoOcA4igxBeRD2FiXbo1pNAIXukdjUyoTuo4m+gFOCT6u5p58O+jntjkQXIiCvDeb4iYfWjLTYSMhxvcaCXCq9+TCS1jDYu7K/Ijr+CDsaUUtuCdDnsYFreqCKSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713463916; c=relaxed/simple;
	bh=hIXLliz24ksmSH05IvozrdF1Bp6QW2Ul9MpKeTGNg2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j06ClSM4aRWe5LkrX7BCiCZZQ6lPTkh70D8+KcO9V/ditfH2J7W4hk2E5a7N2WMDlxE5K1aULakWxHF9huEt4D7mldgtixusziAsrz5PY95Q80Q0kC4kI2vflqIV2ykOwfMftmqh3Y9jNEU5i37xit6dCQ0HOVQnK3KhiL+k9MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awzd77yu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awzd77yu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713463913; x=1744999913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIXLliz24ksmSH05IvozrdF1Bp6QW2Ul9MpKeTGNg2I=;
  b=awzd77yu95BbOP7+2c5tJQCE1HoK/MnLfYtWZYcS7GFyPE9eN5/FH2Dm
   925FNzlEwrYKgBJRywM7DGAZCYmZgSrsSM2/Qbm1hzO3kr+0HMZfqyQsd
   8fUX25y6ZQLvv54SZdmytBAJnbWmOvsa2ssJmOdNOqdWGEYH3EKczuK/u
   etoExceMSwMjvldriRWWXtusA3xTxutym0oOYDtodc0mSCsFWLPlme/c7
   c0RiAlEWiD+84JPsR3YdyZZzdggb6+z0CDCeyAdMyIFa9u8rIJoFhi5lr
   q2+nX9oNDVowvJ/TY5jrkFmHoLysUSxK+ugLd6P3+XGwQhADBCe7MPp2Z
   A==;
X-CSE-ConnectionGUID: LAfEbbGNSe+3IlsY2IdvJQ==
X-CSE-MsgGUID: 2u2gyAj7SbGlxqrd0ubq/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9256794"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="9256794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 11:11:53 -0700
X-CSE-ConnectionGUID: 1NNwl+WXQKOOisrMVy+1vw==
X-CSE-MsgGUID: iiO/3l2jTfKaA8wHF4Lzog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="27904958"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Apr 2024 11:11:49 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxWEc-000958-2Z;
	Thu, 18 Apr 2024 18:11:46 +0000
Date: Fri, 19 Apr 2024 02:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 79/98] kernel/sysctl.c:580:54: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <202404190235.b0TftmFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   1a77a557522cf821eb3cb19959da7093902866ed
commit: 8f985ca9fe5f441dfaf6824bc08222f91f34a10c [79/98] pagecachelimit: limit the pagecache ratio of totalram
config: x86_64-randconfig-122-20240419 (https://download.01.org/0day-ci/archive/20240419/202404190235.b0TftmFJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190235.b0TftmFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190235.b0TftmFJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl.c:580:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:580:54: sparse:     expected void *
   kernel/sysctl.c:580:54: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:592:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:592:54: sparse:     expected void *
   kernel/sysctl.c:592:54: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:610:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:610:54: sparse:     expected void *
   kernel/sysctl.c:610:54: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:967:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:967:47: sparse:     expected void *buffer
   kernel/sysctl.c:967:47: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:954:5: sparse: sparse: symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
   kernel/sysctl.c:1127:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1127:45: sparse:     expected void *buffer
   kernel/sysctl.c:1127:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1885:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:1885:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:1885:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2294:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2294:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2294:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2419:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2419:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2419:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2428:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2428:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2428:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2444:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2444:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2444:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:317:66: sparse: sparse: self-comparison always evaluates to false

vim +580 kernel/sysctl.c

   576	
   577	static int pc_limit_proc_dointvec(struct ctl_table *table, int write,
   578					  void __user *buffer, size_t *lenp, loff_t *ppos)
   579	{
 > 580		int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   581	
   582		if (write && !ret)
   583			ret = setup_pagecache_limit();
   584	
   585		return ret;
   586	}
   587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
