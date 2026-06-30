Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475DC1DF248
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 01:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781250; cv=none; b=OpzzYmcI6ObOZ6m++s8/GhsWJrEpA3k3iV7uCOquKsbE9gZl5sbT5Oqm1BzLG52xsq/S4PVfsm2F6Bk7XXxmNGK2phTCf1gvIXwDtjFjq0/P6mtGOABNr1dVOZnhRJq9hW8+0bu8cFPsF2kVU0yx+ZGgF7dNxVyHStBq08e+xj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781250; c=relaxed/simple;
	bh=oM81/ERQV+2UMTyiZFaVIIHuJiELbkd8dzfvAQMzOoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hyZZ1uF/hrD4Ey1Ojotiff4Bs/dXq91vZ52PlFkiiXN3hr4W/cJM9LLflDdMURD9U9aF0wSKqfRrwizQGOlxbfsqkhv1CiWFMnofOo9DVJ4C5E4W5BXjMnroETObJu2N5Gw6+akwHWsEmQKxCpgX8b5IgBvvYXlbzjpaGKxaLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rf69JLB3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rf69JLB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782781248; x=1814317248;
  h=date:from:to:cc:subject:message-id;
  bh=oM81/ERQV+2UMTyiZFaVIIHuJiELbkd8dzfvAQMzOoo=;
  b=Rf69JLB3SJbq2wZ+5SNhz5Bi+7XQLp775NG0lqbY1/8WVsgnj0QzSKFK
   WwUqPfZG85bC7+EJ0LPpeSGFRDN3ZprLIKhpvNiStPXZeKEGoJ7fTYGrX
   IM/aY4D1AlQCO26r/VGRaOcNLk2SfQIdeuW33fpEHVfqDrTM8FQ6lXCtR
   yNJF4GwQZlYD3LaN3XInphMy7dtFZ0X/TNeJG5TiKbLi6J5hIjF0zybbC
   j8pEJcKCNrdqI+B3D/muTfDam3cnnIsK3XLzS0Wj+ahxGYQ7RN08UPXqq
   e57+Oxk2qsYdN1uKX3HtwcvhPorhPLi0daflum6+XVoEvjf1Vbi0zWCSI
   Q==;
X-CSE-ConnectionGUID: 9QCFay6FTai/q+63ezRGCA==
X-CSE-MsgGUID: z5EhifGBTYOGp0F/ss5spA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="109037028"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="109037028"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 18:00:47 -0700
X-CSE-ConnectionGUID: IYUA+NAtSBOg7hFEr0jSXw==
X-CSE-MsgGUID: fz7B44eFRyCxNPRf5ZQgUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="251707050"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Jun 2026 18:00:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weMqB-000000007tl-03kI;
	Tue, 30 Jun 2026 01:00:43 +0000
Date: Tue, 30 Jun 2026 08:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/050-nvme 1/1]
 drivers/nvme/host/apple.c:216:14: sparse: sparse: symbol 'flush_interval' was
 not declared. Should it be static?
Message-ID: <202606300825.ezsxC4CI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/050-nvme
head:   801c12513602572d32acfb884a854d518489db7a
commit: 801c12513602572d32acfb884a854d518489db7a [1/1] apple-nvme: defer cache flushes by a specified amount
config: riscv-randconfig-r132-20260630 (https://download.01.org/0day-ci/archive/20260630/202606300825.ezsxC4CI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300825.ezsxC4CI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300825.ezsxC4CI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/nvme/host/apple.c:216:14: sparse: sparse: symbol 'flush_interval' was not declared. Should it be static?

vim +/flush_interval +216 drivers/nvme/host/apple.c

   215	
 > 216	unsigned int flush_interval = 1000;
   217	module_param(flush_interval, uint, 0644);
   218	MODULE_PARM_DESC(flush_interval, "Grace period in msecs between flushes");
   219	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
