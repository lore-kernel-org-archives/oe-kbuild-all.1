Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281A3BADB1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361666; cv=none; b=nT8G2mUFh0sNdqgeNonDaGfwtWPr9bzGGVuAxeBUhDzrhd1sto2dAXbJI/LYigH1IllbxP5F89+jwN3vWulSL6CxMIQe1IAiieVZMo92bbs7PD6hCX55Fki9MTD/PIJDL/RibhsT3yi/tdYvNj7VtE4XH4BzlH2rmYoIm0AWHa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361666; c=relaxed/simple;
	bh=KU5j3BRwPj0noSQ1dKr0plwiDrYyUYGtn9SVYioEzUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JJGDMvbg8M1ppuc1W7gn507Lohog2bJaYFOpyeoEJfkEggzc9snMY/D3kJF9OGLkoMLD2QgKY5cGAgh5zBSsVDAanI1f5Yk1vc+73XwgdB8d4VKQbjtcs308cfrG8XEksaj+x3fp1MxbAYiu7OYB24s9hyumQfHkFsV2VHVF0B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJN6zfkM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJN6zfkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779361664; x=1810897664;
  h=date:from:to:cc:subject:message-id;
  bh=KU5j3BRwPj0noSQ1dKr0plwiDrYyUYGtn9SVYioEzUw=;
  b=JJN6zfkMVnhruLU4CfXv2xwMIWRaNkC5bCfsP8pz/Jil6vSUSotMwPQu
   aVC91d/iXuCDlYTRVnkgDyeus7jM9M7u6DFahQMYsLvS+Ft5bndVlolod
   ahmUvzv56qIPM0UH+F9++f38KJJDyg3MKJk4thGZ3Zg0F8dp0QLdfQ9Y3
   FLSlbIaMg4ZLwCSpb72b2IhjXyzMiHzNKYvpjBsf7YuUtHju0WHx6QF0z
   Q9x9IYM30exgTo8zhJ3BdL5lfqpGpFq8BgUFhfwWTCnJkL4Jfm5qNdwTx
   CvPb6vh+O42K2NhMrnG/fwBfFq8RDea6KHFhYluztKD/R2wlLCk2epJ9B
   Q==;
X-CSE-ConnectionGUID: gT6vKRkuTSStA1RkIo8lzg==
X-CSE-MsgGUID: okQ8a2W8T7GpOaU9G5ePOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="67801941"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="67801941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:07:43 -0700
X-CSE-ConnectionGUID: yJ7U5sH9RUqqo7v5PXdvXA==
X-CSE-MsgGUID: Bn5GdCUNSq+xH2ZLKbsIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="264305033"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2026 04:07:43 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ1Fc-000000000Ax-2H5n;
	Thu, 21 May 2026 11:07:40 +0000
Date: Thu, 21 May 2026 19:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 52/1130]
 drivers/counter/counter-sysfs.c:711:35: warning: format '%zu' expects
 argument of type 'size_t', but argument 3 has type 'long unsigned int'
Message-ID: <202605211913.A7rhIqGr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: b83eb705701d2a1b492af6ef6e8fa2c403b55cef [52/1130] cheri: Apply automatic FixCapFormat clang-tidy changes
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211913.A7rhIqGr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211913.A7rhIqGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211913.A7rhIqGr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/counter/counter-sysfs.c: In function 'counter_comp_id_show':
>> drivers/counter/counter-sysfs.c:711:35: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'long unsigned int' [-Wformat=]
     711 |         return sysfs_emit(buf, "%zu\n", (unsigned long)id);
         |                                 ~~^     ~~~~~~~~~~~~~~~~~
         |                                   |     |
         |                                   |     long unsigned int
         |                                   unsigned int
         |                                 %lu


vim +711 drivers/counter/counter-sysfs.c

   705	
   706	static ssize_t counter_comp_id_show(struct device *dev,
   707					    struct device_attribute *attr, char *buf)
   708	{
   709		const uintptr_t id = (uintptr_t)to_counter_attribute(attr)->comp.priv;
   710	
 > 711		return sysfs_emit(buf, "%zu\n", (unsigned long)id);
   712	}
   713	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
