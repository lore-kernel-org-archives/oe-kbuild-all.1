Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5B62A1BF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769944853; cv=none; b=Xl47LZiDTDP6qFiNA3BuGt8QDpq79y59RqyfrnThXXpOwQVVjjP69GYzjMEIZV59b2D53WwHSYBGFnDEMK4lautTOqEf0Ua7U84PdPx2G/Dcr2mTtZtjCOW8tZrxvLNyriBOUYiN1Ell/lqcYNa6keFw2nAC9/b/F1nVjKpW0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769944853; c=relaxed/simple;
	bh=CmWr9CNhYPU/1S0bx7a2O8qt/KRz8aokPh+LDXePU1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cwU0dyfmEkSeyItPIHUy2Gij31CeGmpUTVSse2CfV1yA2lQIGCXNyx4ClCWfg7t8dJgZ+sJK4aR5NUKr5OUoQPxJhbd1Ug5Lf53c43hDk7vQs0pQMww7Cbd6gBxP6U0++Mj1rNoFi7UAlF0tRnX+HKhRsBRRs5wPZdEKKXgnx88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp97RBB3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp97RBB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769944852; x=1801480852;
  h=date:from:to:cc:subject:message-id;
  bh=CmWr9CNhYPU/1S0bx7a2O8qt/KRz8aokPh+LDXePU1c=;
  b=Fp97RBB3ec8hWC0g/PyaLts2wrlcRrFYfkR7HvWQJv30bqTbh3JPEeRv
   LFqZz0ZjooukX3jQaKe/4mWZOatHcQE7urgy/q72yfQ5n/9oK28GfOxji
   b2vVSTkfbtDm/7JLksIhE/qthGk5f1an+umeL7BeB0/LiecrT9++8wcrJ
   8KUOQAbuDfG4ReINEMSvA2IEw2kj2byXAM0FKuX5IaXqXjoFcHDV+19JS
   ZV08FeSIO/FHT3AplVgSvP//ujyGmxP2olQm6EIst4g/YIeTGl8UvRuT3
   qe5/qU35r1gF3DHSSzmsOz9AHGTMrKdc2Rft7nQ7YcdODXjb5BjXrrmNY
   A==;
X-CSE-ConnectionGUID: c9aUkCl6SeGR2LSc8DrrSQ==
X-CSE-MsgGUID: AGc9SrHGSmeTddkWFeQVrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="88550288"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="88550288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 03:20:51 -0800
X-CSE-ConnectionGUID: cHscSEQzTPqVrbO4EqMbLw==
X-CSE-MsgGUID: eeVB37rcRzKNmK4+OV6m5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="240508886"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Feb 2026 03:20:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmVVX-00000000ejO-0L6j;
	Sun, 01 Feb 2026 11:20:47 +0000
Date: Sun, 01 Feb 2026 19:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:for-wsamuel2 40/40]
 drivers/usb/gadget/function/f_fs.c:2089:13: warning: conflicting types for
 'ffs_data_reset'
Message-ID: <202602011959.L4VH7Pzv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-wsamuel2
head:   9a8dd89bd5c65c4189f2bf6291f0f9a3d0df31c5
commit: 9a8dd89bd5c65c4189f2bf6291f0f9a3d0df31c5 [40/40] serialize ffs_ep0_open() on ffs->mutex, this time without ffs_data_reset() under ->mutex
config: nios2-randconfig-001-20260201 (https://download.01.org/0day-ci/archive/20260201/202602011959.L4VH7Pzv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602011959.L4VH7Pzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602011959.L4VH7Pzv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_fs.c: In function 'ffs_ep0_open':
   drivers/usb/gadget/function/f_fs.c:660:3: error: implicit declaration of function 'ffs_data_reset'; did you mean 'ffs_data_get'? [-Werror=implicit-function-declaration]
     660 |   ffs_data_reset(ffs);
         |   ^~~~~~~~~~~~~~
         |   ffs_data_get
   drivers/usb/gadget/function/f_fs.c: At top level:
>> drivers/usb/gadget/function/f_fs.c:2089:13: warning: conflicting types for 'ffs_data_reset'
    2089 | static void ffs_data_reset(struct ffs_data *ffs);
         |             ^~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:2089:13: error: static declaration of 'ffs_data_reset' follows non-static declaration
   drivers/usb/gadget/function/f_fs.c:660:3: note: previous implicit declaration of 'ffs_data_reset' was here
     660 |   ffs_data_reset(ffs);
         |   ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ffs_data_reset +2089 drivers/usb/gadget/function/f_fs.c

ddf8abd2599491 drivers/usb/gadget/f_fs.c          Michal Nazarewicz 2010-05-05  2088  
fcb8985143540c drivers/usb/gadget/function/f_fs.c Al Viro           2025-11-17 @2089  static void ffs_data_reset(struct ffs_data *ffs);
fcb8985143540c drivers/usb/gadget/function/f_fs.c Al Viro           2025-11-17  2090  

:::::: The code at line 2089 was first introduced by commit
:::::: fcb8985143540cbcb8e91c0ea8b7fb5d37c88177 functionfs: don't abuse ffs_data_closed() on fs shutdown

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
