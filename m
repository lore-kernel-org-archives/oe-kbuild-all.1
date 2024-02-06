Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7D1362
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707182390; cv=none; b=aWUhyfn8f3lUaXWZm/Y5TdB8EGkD6FNR175Zgcc3Rm8rN0XkBZBxGyRZJw/pwK7aiJNz6PcV6l2wmxxlXplLRBfL6LDzGt1Fa3LEC9nxlxC+5Czb51Mz02OXbWD3KNAk+EwIaR02Ng93yhzlaomOaNTRCOXP4/yI1obAhK/xfA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707182390; c=relaxed/simple;
	bh=iszzNcA3dMIZAZzeiVir88K53Os5kBnTW0qQqPyXPF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAjmWyMoF0nb6ozNN7eJY/gTvm1qcI3oQwpNO8l64SbN9qZJhRmOorrYGRYeC+DT9ID+GkQKcSJI73f8OP2jH98E9xFb6uFs4jPBmcblL8vS+JTq/DvQkaKVfGQlu4SO0uAdF+KzFepghJJA4evy/q62kA7m92zJ2BCIjVm8pS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePcimeah; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePcimeah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707182388; x=1738718388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iszzNcA3dMIZAZzeiVir88K53Os5kBnTW0qQqPyXPF4=;
  b=ePcimeahaZm5Nr3Su+PxHvQjC31qXmp/DHttrqMCr1mkL9k7bzmInV/Q
   NwivaUHvK3NqstL66vRqvY8JR3pze+/0veRRvuunsmBT88scA5C0oeCls
   0OLBIRQdCc79MXRyrkTNOOB8oRYVywGx049ht7GIozusU5uXQ5XEQz+7S
   J0t/w+A0yyC5utZKrsiUUS74ZMH270xnJh5cN38Jn3oFy7QMPFEYJ8XdI
   HsP956RzHPfXkLliTVtzWGU1qYjxAbhwj01H9IZnzUYwjys+j9vyUR9nM
   FoIyDURDNXX8/c46whWPEJFLvBlB1ef2LBGYypYiHSUF6Hj2n/sCuhKwh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26086309"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="26086309"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 17:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="31942296"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2024 17:19:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXA7k-0000xa-1f;
	Tue, 06 Feb 2024 01:19:44 +0000
Date: Tue, 6 Feb 2024 09:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19033/21616] mm/mem_reliable.c:41:22:
 warning: 'zero' defined but not used
Message-ID: <202402060953.Dyai9myI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [19033/21616] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-003-20240205 (https://download.01.org/0day-ci/archive/20240206/202402060953.Dyai9myI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060953.Dyai9myI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060953.Dyai9myI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mem_reliable.c:42:22: warning: 'reliable_pagecache_max_bytes' defined but not used [-Wunused-variable]
      42 | static unsigned long reliable_pagecache_max_bytes = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/mem_reliable.c:41:22: warning: 'zero' defined but not used [-Wunused-variable]
      41 | static unsigned long zero;
         |                      ^~~~


vim +/zero +41 mm/mem_reliable.c

    40	
  > 41	static unsigned long zero;
    42	static unsigned long reliable_pagecache_max_bytes = ULONG_MAX;
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
