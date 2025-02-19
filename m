Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1124B34
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739928794; cv=none; b=gQ27PlFofeBZYL0+e+1cUQRE0saJnWxSXygxGbQEyEV2XpKozfXM4T0wzTXCq0SSwzsAI5WaNBhpCDMUuQapfF5QDBK10nIapyH1ADGMy4mfYPZBb0sPlAG5Pj1PGBAsEppoi+v3DcHOG+zH2D/wVcJM1QOCrlBM4GZBuSBAf9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739928794; c=relaxed/simple;
	bh=axWQL+M5cKuPHZHDLo1o7+tsR20aRvv7FWFLVFOI0Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRbHCEwmWsQ8MuGvg9zfGOpZwaW4wHkFC54kreFDrU9MiXW0QMIiPsOpId0F+2YCsRorLTX636GnwpxLCJkpQN0VDPqq20BsmtLeIGhdWorBxzJhb9Gc5x62Tj3uySy4rqx0PhoFSxCgVsRDjBJucsheCSPp+pKUp75eSB6vTUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4bHfi0k; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4bHfi0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739928793; x=1771464793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axWQL+M5cKuPHZHDLo1o7+tsR20aRvv7FWFLVFOI0Zs=;
  b=K4bHfi0kLC81VcxoQztNv50YzGNLQV2oHlLzBCqSCLrI6n+jT1otuHeg
   q1rnTkpJwT/p8A1cFqKWlObQWw+VNhT8fhqjhRApVl4EBnBpQng5xd7QA
   bmUfbhrdT17lg1dRpEKDTyepTWWIl1exZ8mQtcIsRw7kXZxWbNyE8daDV
   zQpvWzz/VzJH0RYELC4H9x/1VVSxZJ5eG2xkXKakNo8c5bWpqG0gaJxjB
   03AaQptAMbhYQQ8ZPZrm0SLSWRV6xTkctZx9HpMX6iIIMqrd4HbvdIfUr
   9kGide/xFPDmt5hCaMjBocoTC0+WPLtvmNOgG8RCptmzPFsS5YjZyt9ej
   A==;
X-CSE-ConnectionGUID: 0hrMeIoYRHO7zqcXpblZ5Q==
X-CSE-MsgGUID: GVWrtcn5RMervA7tRqkn6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40906352"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40906352"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 17:33:10 -0800
X-CSE-ConnectionGUID: 7LGULbJ1SMCq+74mrsrHng==
X-CSE-MsgGUID: anUxnAtdSq6UCZ8yMyGMlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="145418110"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Feb 2025 17:33:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkYxW-00015V-2J;
	Wed, 19 Feb 2025 01:33:06 +0000
Date: Wed, 19 Feb 2025 09:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [rafael-pm:pm-sleep-testing 5/6] include/linux/device.h:1030:26:
 error: 'struct dev_pm_info' has no member named 'smart_suspend'
Message-ID: <202502190916.pODQrvQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git pm-sleep-testing
head:   e0d95f1b2b755e2cd05b11dcddabb6cab24a041b
commit: d7aa9525f39c3c2f5520db30b40edb9c8f13774e [5/6] PM: sleep: Use DPM_FLAG_SMART_SUSPEND conditionally
config: i386-buildonly-randconfig-006-20250219 (https://download.01.org/0day-ci/archive/20250219/202502190916.pODQrvQP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190916.pODQrvQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190916.pODQrvQP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   include/linux/device.h: In function 'dev_pm_smart_suspend':
>> include/linux/device.h:1030:26: error: 'struct dev_pm_info' has no member named 'smart_suspend'
    1030 |         return dev->power.smart_suspend;
         |                          ^
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=686350231
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=686350231
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=686350231
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=686350231
   make: Target 'prepare' not remade because of errors.


vim +1030 include/linux/device.h

  1027	
  1028	static inline bool dev_pm_smart_suspend(struct device *dev)
  1029	{
> 1030		return dev->power.smart_suspend;
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
