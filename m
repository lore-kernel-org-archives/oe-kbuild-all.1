Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839F746C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0uslGO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700618782; x=1732154782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6L9qWIYt+AcDutd4iBDFhtgXhl7/fUz4m6eAzy99akE=;
  b=d0uslGO9ZlbMg7HAUyT5AE6HWnoHD0S9AhEHp/v80sgg5T0JPZiCr9Xq
   mgmjv32ghuFSA3QV6qlPujvonHHAv1mt51GJPLP+k8TsvihVn29zb08YI
   DpFF7OhiEKj21WxEtzgTnxxh7ZZfITS/V8FXJvqvmwDyGKIVjtufY86oj
   qUkWgWMgJRA/oAdvD3dSu5tLQzUUrUOkNvmNAx0uztZgwRiNJ0u4gXHtD
   Z16uLbno045orkAmO6Vp2a2zvCpTBmr5F722ch9ANMVL3jg9WaKFR2lnI
   9Nt9HpBmcXFZaG7wbWwv6FMVwAZ8ojiLX4iqMrLk64r2FXZQNsoPdMzEQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="395884556"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="395884556"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 18:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760286779"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="760286779"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 18:06:21 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5ccq-0008Wj-2z;
	Wed, 22 Nov 2023 02:06:05 +0000
Date: Wed, 22 Nov 2023 10:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/rtc/nvmem.c:1: warning: no structured comments found
Message-ID: <202311220906.ijAdquSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2d5304e6c648ebcf653bace7e51e0e6742e46c8
commit: 697e5a47aa12cdab6f2a8b284cc923cdf704eafc rtc: add generic nvmem support
date:   6 years ago
config: i386-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231122/202311220906.ijAdquSF-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220906.ijAdquSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220906.ijAdquSF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/nvmem.c:1: warning: no structured comments found


vim +1 drivers/rtc/nvmem.c

   > 1	/*
     2	 * RTC subsystem, nvmem interface
     3	 *
     4	 * Copyright (C) 2017 Alexandre Belloni
     5	 *
     6	 * This program is free software; you can redistribute it and/or modify
     7	 * it under the terms of the GNU General Public License version 2 as
     8	 * published by the Free Software Foundation.
     9	 */
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
