Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844F45018
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707638936; cv=none; b=kzrgN11+vjAy9JNkwFepBgAT/cTGwYuv/XtgRboX/gfDlJ/HxOFJMbK+wIyYNjYLr9cw1Trt6YPoESklB7UXyukFcCgBBWHbY/2AcZ9JpIOtYjklwOUHQQXu6Ti0UysZa3MrjVAG7QXmcj4jpHUMjSOqJc5FO2CsakR1+LdM7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707638936; c=relaxed/simple;
	bh=pPWgKVKKptmCIhSd4ZfguHgdjLQ8JHKnGjZvYDcN0sA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUxYcukrHNwMcgf4QGhwK20Xv/jYzhyvvOgt0RJdBPOo9f4BWj3XyQRz36uoFpqWxpigAjwKTPFQUIFA6KJ+buuXvdeM4R0260tRzIWnBdAwOQsg/pggMWvD1X+fLW4sne3eCk6qpW9OVFX3wgFZzmpcZtS0OwbACXn0t/ntEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgyfxCbE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgyfxCbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707638933; x=1739174933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pPWgKVKKptmCIhSd4ZfguHgdjLQ8JHKnGjZvYDcN0sA=;
  b=NgyfxCbEk5a7QD4mZl4OS50/t/fJGCYX2o/LJBjM5LyNZvEKFqu0HqCw
   iY9BffFquP5HVpjewrobl/787ss2RM+y+ESY7itmbNBl3obwHKTPdc2l3
   3Q78SU4b1TevR4hAbz0gtzO5gSdnX3eGQY+TNm6ViJDeDsB/l3mYGIDMI
   SMSBgDrqdc0AtFMifl8vms1o5i1RSch7ZxWnB01HF7dmePllHojgXcIW5
   dtS2FXtQ5LxV3Wyfzw2C+UkFXwwlZxubWJpJJ5Lh7hN+JixXYrXyG8OPg
   +JamyXfCLgJ18qX1qUzZxQx+2wtHvHRYm84W7VYmbAL67Wv9bjeZaBNuE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1739895"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="1739895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 00:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="2668606"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Feb 2024 00:08:51 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ4tN-0006RU-08;
	Sun, 11 Feb 2024 08:08:49 +0000
Date: Sun, 11 Feb 2024 16:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.8-dango 5266/5296]
 drivers/nvmem/layouts/adtran.c:113:20: error: incompatible function pointer
 types assigning to 'int (*)(struct nvmem_layout *)' from 'int (struct device
 *, struct nvmem_device *)'
Message-ID: <202402111609.fsC8xWzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.8-dango
head:   28d064b272e5ddac5987b689fefe36d6c7f524b3
commit: 06790a84c9d33ab94a5ef622a661b05ca75e259f [5266/5296] nvmem: add layout for Adtran devices
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240211/202402111609.fsC8xWzY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402111609.fsC8xWzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402111609.fsC8xWzY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvmem/layouts/adtran.c:113:20: error: incompatible function pointer types assigning to 'int (*)(struct nvmem_layout *)' from 'int (struct device *, struct nvmem_device *)' [-Wincompatible-function-pointer-types]
     113 |         layout->add_cells = adtran_add_cells;
         |                           ^ ~~~~~~~~~~~~~~~~
   1 error generated.


vim +113 drivers/nvmem/layouts/adtran.c

   110	
   111	static int adtran_probe(struct nvmem_layout *layout)
   112	{
 > 113		layout->add_cells = adtran_add_cells;
   114	
   115		return nvmem_layout_register(layout);
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
