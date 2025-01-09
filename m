Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6521E0A8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435509; cv=none; b=XyoJ9SfEAd04eGrgCYcCy/rGodga6fh8Qow5FZ1jFTQhMLQlkSr9WUgpoX4yeWPbtOGgyhvSZFnIYjYp303WNPKZflws7rBNVY/Gj+ehAn2fgzTLoEUM/lEmBRoRyUd9JDcs2DLYEstc5HyQXHrJu5wgPLHe8e4yEOjicYAG964=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435509; c=relaxed/simple;
	bh=9mJclZmLQK503a5gOhOazaqKN+5wVfFKtdz/SNqE0wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhIlX20wypnmZUWcpB9WKTJ6SM7+RBxekaFAdREed9NQAs3Ll/74ThgagjlldMeXwUZSqjnNYGcVDUNFsC2+NmDTvMUCUvCwOdQPs1FwgDigM/vqS8Jjv7I80magHkR4+QuD95tYn7AbxfvXMga2iPwNdpVbYhQXRcYYQBcm3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpYxr7BY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpYxr7BY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736435507; x=1767971507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9mJclZmLQK503a5gOhOazaqKN+5wVfFKtdz/SNqE0wQ=;
  b=UpYxr7BYXOhFH6ernvH+C7UQHFwOaqn8Cjvj1/h0j22kCxpHonh+LmQy
   POf06mUp7TGOCGx83RjGZpComKnpHoZIj+3YZu3t24eUbmdAtvhgDL2oE
   UfcFyOiyW19CgMKCWXVbeJuPLlVHegLyj6C7Jbkdq+nwkTDndMETNDRjN
   /AovXmv4OT2qo3M40h6nnP2H242v4Dc6rUHRw8kbbzmCRDSledpbMJN6w
   N+1sCHS7niDqnaz7y8EvA6yDoSX3LKXgtxO/uCvi1cqYsIAHF/m9kqq/K
   xK8Lwn2NKr7bzMyDPrB7/7y0q+fGltsHRZETr1bw54YorFZESYNrtiI+G
   g==;
X-CSE-ConnectionGUID: RliR7yzzQ3qML0FFsKsOSw==
X-CSE-MsgGUID: l8NHZtRCT7qFYdDB0UWiwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54245102"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="54245102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 07:11:13 -0800
X-CSE-ConnectionGUID: PLqefO1sT+K1pC+pSbD7sQ==
X-CSE-MsgGUID: HoR+p02mR3y7nQCkspzc6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103306423"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jan 2025 07:11:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVuBf-000HiP-2O;
	Thu, 09 Jan 2025 15:11:07 +0000
Date: Thu, 9 Jan 2025 23:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/ctl_table_const 1/1] kernel/watchdog.c:1195:52:
 error: assignment of member 'mode' in read-only object
Message-ID: <202501092341.LnLKaQGN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/ctl_table_const
head:   3eed56785bcc57cb6f3184f24a22a4b79692ea5c
commit: 3eed56785bcc57cb6f3184f24a22a4b79692ea5c [1/1] treewide: const qualify ctl_tables where applicable
config: arc-randconfig-002-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092341.LnLKaQGN-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092341.LnLKaQGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092341.LnLKaQGN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/watchdog.c: In function 'watchdog_sysctl_init':
>> kernel/watchdog.c:1195:52: error: assignment of member 'mode' in read-only object
    1195 |                 watchdog_hardlockup_sysctl[0].mode = 0644;
         |                                                    ^


vim +/mode +1195 kernel/watchdog.c

9ec272c586b07d1 Douglas Anderson 2023-05-26  1189  
dd0693fdf054f2e Xiaoming Ni      2022-01-21  1190  static void __init watchdog_sysctl_init(void)
dd0693fdf054f2e Xiaoming Ni      2022-01-21  1191  {
dd0693fdf054f2e Xiaoming Ni      2022-01-21  1192  	register_sysctl_init("kernel", watchdog_sysctls);
9ec272c586b07d1 Douglas Anderson 2023-05-26  1193  
9ec272c586b07d1 Douglas Anderson 2023-05-26  1194  	if (watchdog_hardlockup_available)
9ec272c586b07d1 Douglas Anderson 2023-05-26 @1195  		watchdog_hardlockup_sysctl[0].mode = 0644;
9ec272c586b07d1 Douglas Anderson 2023-05-26  1196  	register_sysctl_init("kernel", watchdog_hardlockup_sysctl);
dd0693fdf054f2e Xiaoming Ni      2022-01-21  1197  }
9ec272c586b07d1 Douglas Anderson 2023-05-26  1198  

:::::: The code at line 1195 was first introduced by commit
:::::: 9ec272c586b07d1abf73438524bd12b1df9c5f9b watchdog/hardlockup: keep kernel.nmi_watchdog sysctl as 0444 if probe fails

:::::: TO: Douglas Anderson <dianders@chromium.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
