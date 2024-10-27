Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F41367
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 03:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729998310; cv=none; b=m75LnuNJXO3ClrA8tKV9NUPO76AC29noWJnYJ9MIk+GLUuglcVNvdVGT1tjjKKQUjtH/mDCM3+tSmgbDX3wOHc2ia2mb0uFhk1WVX2RVFQDxiyN6ZnIjP0DUHhu0ku6KrJdVNsdLApx07TQ9cSsFM+ufQ29GLDZMlSl7+jufaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729998310; c=relaxed/simple;
	bh=Wvox1uZS831yRhz8r2TeaNswBJwVWIMCXZKoNAPDdqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9nU9Q8Wx5tYrv5PhCOpGg/NP16tFIUsOaipjQlepB7ZVoKyVTPypUvTJxXJZycSffa0efWXKYLnQ95bFoOGgALwfpvwEGfuVBc7O29bL2ICBnepCGudTsFcZn8eWOj4ZSGhiyOb8MgDkU+yx1wIyLGP0PGv9Kh8um8ViQMRdpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBRvTivr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBRvTivr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729998308; x=1761534308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wvox1uZS831yRhz8r2TeaNswBJwVWIMCXZKoNAPDdqo=;
  b=CBRvTivr0wZqvwExKxr8gQjHakYaZCrYIEWyOsDdwO52+8L41d5P8RK/
   3JbV5KWNkh6plTknr6a/wdPS+WClus0E25AOU6NIwQF6dDTVd83y0ARyz
   ehrWgbVf288TRM7Z+r7wRVsaEsFEKd1stWV/OKoTWSZKln163XNIgWZxv
   dMhQbxD8DCdXsm1bYYFg8GrgImVM9J3pqIXNv1WKGCPC5Usf+EctEc8Zp
   o2+RhjaMr3IKXy87ry+Q7ux9CuozytfYbstQUS/mBkU5h0JMtnobwCGQY
   9D8O5eZ8cNEPwsnVEVn+uZeRHZHs4xj7D2bX6bPBuIG5NbQjLxK8lQ26U
   Q==;
X-CSE-ConnectionGUID: KfsVXeQLQe60Oetb7GLx2g==
X-CSE-MsgGUID: TK4RDgf8TmaI8rpG9N4iVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52184839"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52184839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:05:07 -0700
X-CSE-ConnectionGUID: YXyE/b9VT6+cP3pcECB8aQ==
X-CSE-MsgGUID: xi0znNXtSy6UnCxQcr4HhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="80867482"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2024 20:05:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4taR-000aIq-2H;
	Sun, 27 Oct 2024 03:05:03 +0000
Date: Sun, 27 Oct 2024 11:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19033/23866] mm/mem_reliable.c:41:22:
 warning: 'zero' defined but not used
Message-ID: <202410271040.2DFjHIvY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [19033/23866] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-001-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271040.2DFjHIvY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271040.2DFjHIvY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271040.2DFjHIvY-lkp@intel.com/

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
