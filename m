Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D17364B9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705835474; cv=none; b=BA1JcVjs/Rv8XtUL+4KOhtYhztZMVcmEfPAGgsMFwh6ymvqbW9C+92dyZns6B3rZKj3X0J+4v2CeqIIf57pDEGlnI4Wm9N62929SrpQ8eaBiRsr8xn8KUys//Hm4vgmgaQF6Nxv682djCkmWsi0pKPWhNLoZulicp4G32kWTgjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705835474; c=relaxed/simple;
	bh=DoHmIUq9EKhveqhwQuuJRK8se9E+arvquxO+v5Z6rC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSb8ttbHPqFliZn2HiOrnoTciyXekFFPeEqIj5/WWpdzEXP6THa7/1lWBrIBugN3nKzasjo8zpvq3FkhsmZ66yCkGGTiHYBoSiyLohhMb7tzXNKyv4J+ZLjth32/63tpNShnHQ4Upqgaf293WFlBnNw0ioq8HHSieYggmRw3tMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHdFOhGr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHdFOhGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705835472; x=1737371472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DoHmIUq9EKhveqhwQuuJRK8se9E+arvquxO+v5Z6rC0=;
  b=FHdFOhGrbHXI5sOIyqDSL5o3NT+iEH1Joy9jpAZOHxTHJs2hRdZZV8FQ
   nvkeqlgacR4xFaVxLs7LZPpTYGBhHVcZtO6H9/yg7Kjt2fSfa9B7HslFX
   lQwBgtaWBY4vEXFE2nnc//NLvL6W1+u4XKWj0xSGUPG0djpeH/GxP2fLy
   h8VDn0Vcy9B0Fo16wwvM7UQb5lPGzmVsZpIDd0Eket+yozNqN3ZSACIqg
   8tDDcHdW/TVY6j7SysU27rztbwLYLN3QlbDXk5StobVhE1GhUnoGviCtO
   QZhoqt4HNd2IBaz17OzbRP7VLNz1qE8S1fUZ20boT2GZhdzFiYRx2Bizl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="22503438"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="22503438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 03:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="33783133"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jan 2024 03:11:09 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRVjH-0005rm-12;
	Sun, 21 Jan 2024 11:11:07 +0000
Date: Sun, 21 Jan 2024 19:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 22494/30000] kernel/sched/topology.c:1618:9:
 error: implicit declaration of function 'register_sysctl_init'; did you mean
 'register_sysctl'?
Message-ID: <202401211925.wKNCyW6O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   297307a8bbb354ddba271dfebf528961834ddf14
commit: 8ce3e706b31409147f035c037055caa68e450ce5 [22494/30000] scheduler: Add runtime knob sysctl_sched_cluster
config: arm64-randconfig-004-20240121 (https://download.01.org/0day-ci/archive/20240121/202401211925.wKNCyW6O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401211925.wKNCyW6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401211925.wKNCyW6O-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/topology.c: In function 'sched_cluster_sysctl_init':
>> kernel/sched/topology.c:1618:9: error: implicit declaration of function 'register_sysctl_init'; did you mean 'register_sysctl'? [-Werror=implicit-function-declaration]
    1618 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         register_sysctl
   cc1: some warnings being treated as errors


vim +1618 kernel/sched/topology.c

  1615	
  1616	static int __init sched_cluster_sysctl_init(void)
  1617	{
> 1618		register_sysctl_init("kernel", sched_cluster_sysctls);
  1619		return 0;
  1620	}
  1621	late_initcall(sched_cluster_sysctl_init);
  1622	#endif
  1623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
