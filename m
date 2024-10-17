Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753AE1D6DB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157115; cv=none; b=m4zgVhvSNTk4U/KU2vRHy67H5g9M8r3PZFW/RCNIyaafPCcN0mpL0txx3AibqZ2iFWwZ8YGqmXBfp0oPbGv3YPYcOmo26aHxFyCoOBhqDMVccI93DEAcSPv3RsUVnwqVyur9AUQAo/WnqEnFBhiFj5Z1AeteYTJQbFZSajifrIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157115; c=relaxed/simple;
	bh=KmJ4IIDBwiQmw+cGpwKcD6KO+rgwQC0feje6dTWBo4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6XKIzTYCy3HMRmipN+LN/Fs5QDSDCRCHyMvxuGpru+0HcecaEjQ+kgsT9GUpYmYG4m/0wFfVOzCFVicz8292gdpAMc9H8YgOOW/fuzVm4ckK4v3rmgBiMjR42rPb4Rc3Uh0Q2/qbaP76RRINhGz5up8PHtzwmxR5CKRo3/c0f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5YhDY6V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5YhDY6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729157112; x=1760693112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmJ4IIDBwiQmw+cGpwKcD6KO+rgwQC0feje6dTWBo4o=;
  b=h5YhDY6VkaIrHNWc0ptIuQKQ6Jfe/USN9U6xVfkzDl5poECLgd7ciK22
   dyqmbXwVqqbMoVMo4j88aChP+VJKY0dElTwRsKf2ppsvs8oEx84H+IBhu
   6tYLbamRPBFQTJrnk+JqFd0RiDpdUxFCoyNIREj0bi5BnLZ1ASG49i1pX
   06+Zn0/5zoioe+8e/jCupwY6uaGs7n5cj7UOEe9g7tDFbMtP8WWTprOyr
   XokIiAZaBUUNFB+W5dmtaLf2UgnuhCV6/y5okb1Cch9kM/sts2W60CYbC
   H2Z/5AXf9tBcWGcXhh7xDDM9bSO96lUyDB0qdYsAzvBXzjo/juCb7NNha
   w==;
X-CSE-ConnectionGUID: rZ0WLLu4RBuSZZPeBpBLvw==
X-CSE-MsgGUID: I6b9BARjRvWo/7Whi9hyvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51178442"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51178442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:25:11 -0700
X-CSE-ConnectionGUID: y8jB75SDQSO+xfyT7+pR/A==
X-CSE-MsgGUID: KHT3evUOQR68274e86RRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78924011"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Oct 2024 02:25:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Mkn-000M75-03;
	Thu, 17 Oct 2024 09:25:09 +0000
Date: Thu, 17 Oct 2024 17:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 16/447] drivers/char/pc8736x_gpio.c:236:19:
 error: 'nsc_gpio_write' undeclared here (not in a function)
Message-ID: <202410171738.Y9VrK5mC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   019e5b86faffd0b70c51787fb0e5d430438b1dec
commit: fc9c917af3a60386818b0554243550687e4eb849 [16/447] char/nsc_gpio: convert to read/write iterators
config: i386-randconfig-016-20241016 (https://download.01.org/0day-ci/archive/20241017/202410171738.Y9VrK5mC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171738.Y9VrK5mC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171738.Y9VrK5mC-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD 019e5b86faffd0b70c51787fb0e5d430438b1dec builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/char/pc8736x_gpio.c:236:19: error: 'nsc_gpio_write' undeclared here (not in a function)
     236 |         .write  = nsc_gpio_write,
         |                   ^~~~~~~~~~~~~~
>> drivers/char/pc8736x_gpio.c:237:19: error: 'nsc_gpio_read' undeclared here (not in a function); did you mean 'nsc_gpio_dump'?
     237 |         .read   = nsc_gpio_read,
         |                   ^~~~~~~~~~~~~
         |                   nsc_gpio_dump


vim +/nsc_gpio_write +236 drivers/char/pc8736x_gpio.c

681a3e7dab868a Jim Cromie 2006-06-27  232  
2e8f7a3128bb8f Jim Cromie 2006-07-14  233  static const struct file_operations pc8736x_gpio_fileops = {
681a3e7dab868a Jim Cromie 2006-06-27  234  	.owner	= THIS_MODULE,
681a3e7dab868a Jim Cromie 2006-06-27  235  	.open	= pc8736x_gpio_open,
681a3e7dab868a Jim Cromie 2006-06-27 @236  	.write	= nsc_gpio_write,
681a3e7dab868a Jim Cromie 2006-06-27 @237  	.read	= nsc_gpio_read,
681a3e7dab868a Jim Cromie 2006-06-27  238  };
681a3e7dab868a Jim Cromie 2006-06-27  239  

:::::: The code at line 236 was first introduced by commit
:::::: 681a3e7dab868a8c390724494e8b79dc596b9e0f [PATCH] chardev: GPIO for SCx200 & PC-8736x: add new pc8736x_gpio module

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
