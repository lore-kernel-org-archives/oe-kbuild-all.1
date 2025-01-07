Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44019DF62
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 22:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736288442; cv=none; b=RjTh6dxBKW8wP41v/QqKzyP4tOHhAu5Ai3pU7cPoTauYGdcNJt84LbbLrcJX6/Yjhah1FU6Ta5YRL19N5s51qykitVR9ylSnQsYnV6jJPue+EOQliAKxJXnpTZGD2CIJBImJXeY5Tn6QLojN1EloagRTcfWTPT+OzFNtiyQr6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736288442; c=relaxed/simple;
	bh=YZ7ZOhu1ck2HWLUtA4EohE5iR6kUXkP887imQUOMm5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1ZqENaOMY3wznWdegsbdWDL6glkFuDbVxxMFa4/nYuj9b6H/X/bf2oG4ASGCy/+d24bek/JW9EhyyLNyqMgbNdWDHfgA29FJPxaimbKLOueH5nRGrmHasiBTuWW2OPAoIus2f+iMqMBclN3bQVBctm7SXj1ILFy3yoshJlj58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrjzyzLS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrjzyzLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736288441; x=1767824441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YZ7ZOhu1ck2HWLUtA4EohE5iR6kUXkP887imQUOMm5Y=;
  b=UrjzyzLSPS3qk7PnNe7WuatYr7sr4kKQiAwTcaX0Pk04m9tVtlhzr7ki
   BU0F+rf/DjhO61oCu8O6qY3XgUG9WQd7EMKqgR7CvgtCgRxbMC99FA7SX
   WJI1N2DK+F4Bl1bi38nl7AdW62Mp9az9Y+FhbPvhAl2htdtFgmY6XiEl8
   aCoG8rRLtzrGHiLAv7xUBQsOFd3m6WmWuBIaISegK0fJISIeh8kApw75G
   7mXJAxSyr/Q3kTywNmDnykApjAhPVv/anK2svnlzu5FrcSvb4pUxNQi1i
   eG+oWpBC+3rGFPojVNTGrK6/fjvIwfQcdaz7sD+vzJK2NY1YtUX8UMWp/
   Q==;
X-CSE-ConnectionGUID: ac+xKfiLTEONeh3gT97FJA==
X-CSE-MsgGUID: WsaXyoGSRiumfBLuUCa2Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="46992951"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="46992951"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 14:20:40 -0800
X-CSE-ConnectionGUID: fKu6yqv7RC6/wfqjQ2DPNw==
X-CSE-MsgGUID: 95DAbkPmQf+Er63E5P1fqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107997043"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jan 2025 14:20:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVHwC-000FHX-1A;
	Tue, 07 Jan 2025 22:20:36 +0000
Date: Wed, 8 Jan 2025 06:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 63/64]
 init/initramfs.c:594:31: error: initialization of 'ssize_t (*)(struct file
 *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)'
 {aka 'int (*)(struct file *, struct kobject *, const struct bin_attribute *,
 char *, long long int,  un...
Message-ID: <202501080637.Tp6PzMXl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   1c76e0940bd2d02a30ddaf76ef5bcb648c3fffb1
commit: da56a14a657e9763156eeac71d74f3d73bcb11f5 [63/64] read/write
config: i386-buildonly-randconfig-003-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080637.Tp6PzMXl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080637.Tp6PzMXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080637.Tp6PzMXl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/async.h:14,
                    from init/initramfs.c:3:
>> init/initramfs.c:594:31: error: initialization of 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     594 | static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:17: note: in definition of macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   init/initramfs.c:594:8: note: in expansion of macro 'BIN_ATTR'
     594 | static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
         |        ^~~~~~~~
   init/initramfs.c:594:31: note: (near initialization for 'bin_attr_initrd.read')
     594 | static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:17: note: in definition of macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   init/initramfs.c:594:8: note: in expansion of macro 'BIN_ATTR'
     594 | static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
         |        ^~~~~~~~
   cc1: some warnings being treated as errors


vim +594 init/initramfs.c

0f3d2bd54f8fb1 Jan Beulich    2005-09-13  593  
66bc1a173328de Lukas Wunner   2024-04-06 @594  static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
2678fd2fe9ee2c Alexander Graf 2023-12-07  595  

:::::: The code at line 594 was first introduced by commit
:::::: 66bc1a173328dec3e37c203a999f2a2914c96b56 treewide: Use sysfs_bin_attr_simple_read() helper

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
