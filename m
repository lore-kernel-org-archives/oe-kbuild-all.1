Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F51139CFF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737050560; cv=none; b=Mb8Cuo1G6MmUVzCqmV++cAWa+Sdpm6Seh3NCbNT03hdoVbKgcDVB+XvTFut/XlVi1CtwgQJWQuEwuTWcTGncIjvnfNMbN0ONB1e6lr65Nbt96m/7VjOaIhsFsbUYI9UZCQShwqI+VF3mGgl//AY6zLJP1YDb3ILxFoTCi8OL/t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737050560; c=relaxed/simple;
	bh=rz7Mos3bN3m/O9c3/tADX8Onc5834o1kKXjVsES8qqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9rdYeO9Eo9Blu0Z+//Ylx0izorW8EL9cQDGySO+6+itvcofh0cRNRGwP+3MwjRxI+T7Vf2DYOZVkmJG4Eedfu6NJKGNu08CGPc3V27BcUMGrfH85UAdgqcAbB5mq9zxCjNjyWMCUU1NQaQARy3/zceofLL5Xqywdh1VKkUn1q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKE6SWpG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKE6SWpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737050558; x=1768586558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rz7Mos3bN3m/O9c3/tADX8Onc5834o1kKXjVsES8qqA=;
  b=DKE6SWpGG/b6OQ4ScWdelvNp+uPdgVjfmmiy+NaaQnHgylgKrgLAzahc
   tGRh5nEZTDHGUaYSxlNHGHjJjAFOf0N1hHmoHiVaNvX3JsYP+vldhIf9h
   1dsKcOF6EhmNbuti8ouY1IyXN0ySd8Rj++Lk5h5JHwoFo2hizOz8Ur607
   TmK+jj4N6cZJsI5rrbECLvN0IyH15jOD5M82Mx8uqWpd0dlnuxP6MoZeo
   tBef0Gwc7n2xuESLaYZurQWXiTAOqCBkUDGrQY6BtZoNzgW/4qaD4i3/b
   clX1BFqJ0rQKHjb5et78fMCuxw5WUapc0B1GkG03TbFZGQYQXCACgHLJf
   Q==;
X-CSE-ConnectionGUID: LTuifqvDS9iH8VVcGdgxsw==
X-CSE-MsgGUID: 0TKw0Gk9Qt6JjSDY9T8zBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="62827499"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="62827499"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 10:02:37 -0800
X-CSE-ConnectionGUID: LKDvRJD4Tj+Uv71BY+gO4w==
X-CSE-MsgGUID: K2g2/bMdRke0XwQ4B3YRAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105420913"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2025 10:02:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYUCQ-000SDf-0E;
	Thu, 16 Jan 2025 18:02:34 +0000
Date: Fri, 17 Jan 2025 02:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] include/linux/kern_levels.h:5:25:
 warning: format '%ld' expects argument of type 'long int', but argument 2
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202501170156.P88FmtBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   bf5b85fe246873efa65a9dc0631ad70c59eece6c
commit: 1be052b20ba04b635cf87bcff80de5314697953e [1/1] ANDROID: Initial commit of Incremental FS
config: arm-randconfig-003-20250117 (https://download.01.org/0day-ci/archive/20250117/202501170156.P88FmtBK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501170156.P88FmtBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501170156.P88FmtBK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/incfs/format.c:5:
   fs/incfs/format.c: In function 'incfs_read_next_metadata_record':
>> include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:306:16: note: in expansion of macro 'KERN_WARNING'
     306 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   include/linux/printk.h:307:17: note: in expansion of macro 'pr_warning'
     307 | #define pr_warn pr_warning
         |                 ^~~~~~~~~~
   fs/incfs/format.c:616:17: note: in expansion of macro 'pr_warn'
     616 |                 pr_warn("incfs: The record is too large. Size: %ld",
         |                 ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
