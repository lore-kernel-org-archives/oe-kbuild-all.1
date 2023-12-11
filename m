Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420874BAA2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGz2uz2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702309537; x=1733845537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5kpDBhEmv7ASQVHtFBy2s+J5GC87EzXZSy88lUoIs0A=;
  b=MGz2uz2K40/ucPv72eyYGd8dAebcAvp7sPP+DYjo+CQ6GYEpppF6SHk2
   YpIRVK017mlzSPskN1hR8yJccchLLb6rvokHLu2y5c6asluyq6lq+h7ER
   h1XGjzDr4yWJPXTsdmv51cvoxMz1ZC50LUO88hlioA9HaYFEEWE9vI38E
   U4jK3y0qpncIQqjzgL9icd0xAWw+Bstp3B9CwO0eQzSvefVOxc6Xvhj+Z
   P+ZkA9VV9G9U4q9qw9gBzgyhlL4NXjjfU3f+G0kfGbqwiTUTvtkz94AKB
   KCtNHw1xK8tgZGwFBIj5mpdQJbLC/Y8B5zzWjH61RCvrCtIBT6QILUU6X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="398517442"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="398517442"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 07:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946370265"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946370265"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 07:45:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCiTL-000IAa-24;
	Mon, 11 Dec 2023 15:45:31 +0000
Date: Mon, 11 Dec 2023 23:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Luca Abeni <luca.abeni@santannapisa.it>
Subject: arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202312112339.FTC7H0dV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: aa5222e92f8000ed3c1c38dddf11c83222aadfb3 sched/deadline: Don't use dubious signed bitfields
date:   6 years ago
config: mips-randconfig-r122-20231108 (https://download.01.org/0day-ci/archive/20231211/202312112339.FTC7H0dV-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312112339.FTC7H0dV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312112339.FTC7H0dV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:295:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:295:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:295:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:295:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:295:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:295:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:295:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:295:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:295:1: sparse:     got void [noderef] __iomem *
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
>> arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     got void *
>> arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     got void *
>> arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     got void *
>> arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:153:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:153:1: sparse:     got void [noderef] __iomem *
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:155:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:155:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:134:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:134:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
--
   drivers/gpu/drm/drm_bufs.c:213:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *handle @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/drm_bufs.c:213:45: sparse:     expected void *handle
   drivers/gpu/drm/drm_bufs.c:213:45: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/drm_bufs.c:216:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *handle @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/drm_bufs.c:216:45: sparse:     expected void *handle
   drivers/gpu/drm/drm_bufs.c:216:45: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/drm_bufs.c:331:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *handle @@
   drivers/gpu/drm/drm_bufs.c:331:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/drm_bufs.c:331:36: sparse:     got void *handle
   drivers/gpu/drm/drm_bufs.c:348:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *handle @@
   drivers/gpu/drm/drm_bufs.c:348:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/drm_bufs.c:348:36: sparse:     got void *handle
   drivers/gpu/drm/drm_bufs.c:514:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *handle @@
   drivers/gpu/drm/drm_bufs.c:514:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/drm_bufs.c:514:28: sparse:     got void *handle
   drivers/gpu/drm/drm_bufs.c:125: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Core function to create a range of memory available for mapping by a
   drivers/gpu/drm/drm_bufs.c:379: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Ioctl to specify a range of memory that is available for mapping by a
   drivers/gpu/drm/drm_bufs.c:480: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Remove a map private from list and deallocate resources if the mapping
   drivers/gpu/drm/drm_bufs.c:633: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Cleanup after an error on one of the addbufs() functions.
   drivers/gpu/drm/drm_bufs.c:668: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Add AGP buffers for DMA transfers.
   drivers/gpu/drm/drm_bufs.c:1204: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Add buffers for DMA transfers (ioctl).
   drivers/gpu/drm/drm_bufs.c:1245: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get information about the buffer mappings.
   drivers/gpu/drm/drm_bufs.c:1333: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Specifies a low and high water mark for buffer allocation
   drivers/gpu/drm/drm_bufs.c:1382: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Unreserve the buffers in list, previously reserved using drmDMA.
   drivers/gpu/drm/drm_bufs.c:1451: warning: Function parameter or member 'dev' not described in '__drm_legacy_mapbufs'
   drivers/gpu/drm/drm_bufs.c:1451: warning: Function parameter or member 'data' not described in '__drm_legacy_mapbufs'
   drivers/gpu/drm/drm_bufs.c:1451: warning: Function parameter or member 'p' not described in '__drm_legacy_mapbufs'
   drivers/gpu/drm/drm_bufs.c:1451: warning: Function parameter or member 'v' not described in '__drm_legacy_mapbufs'
   drivers/gpu/drm/drm_bufs.c:1451: warning: Function parameter or member 'f' not described in '__drm_legacy_mapbufs'
   drivers/gpu/drm/drm_bufs.c:1451: warning: Function parameter or member 'file_priv' not described in '__drm_legacy_mapbufs'
   drivers/gpu/drm/drm_bufs.c:1451: warning: expecting prototype for Maps all of the DMA buffers into client(). Prototype was for __drm_legacy_mapbufs() instead
--
   drivers/gpu/drm/drm_memory.c:128:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *handle @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/drm_memory.c:128:29: sparse:     expected void *handle
   drivers/gpu/drm/drm_memory.c:128:29: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/drm_memory.c:137:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *handle @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/drm_memory.c:137:29: sparse:     expected void *handle
   drivers/gpu/drm/drm_memory.c:137:29: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/drm_memory.c:149:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *handle @@
   drivers/gpu/drm/drm_memory.c:149:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/drm_memory.c:149:28: sparse:     got void *handle
   drivers/gpu/drm/drm_memory.c:2: warning: Cannot understand  * file drm_memory.c
    on line 2 - I thought it was a doc line
--
>> drivers/gpu/drm/drm_vm.c:265:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *handle @@
   drivers/gpu/drm/drm_vm.c:265:44: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/drm_vm.c:265:44: sparse:     got void *handle
   drivers/gpu/drm/drm_vm.c:476:51: sparse: sparse: undefined identifier '_PAGE_RW'
   drivers/gpu/drm/drm_vm.c:560:51: sparse: sparse: undefined identifier '_PAGE_RW'
   drivers/gpu/drm/drm_vm.c: In function 'drm_mmap_locked':
   drivers/gpu/drm/drm_vm.c:575:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     575 |                 if (dev->agp && dev->agp->cant_use_aperture) {
         |                    ^
   drivers/gpu/drm/drm_vm.c:589:9: note: here
     589 |         case _DRM_FRAME_BUFFER:
         |         ^~~~
   drivers/gpu/drm/drm_vm.c:612:37: warning: this statement may fall through [-Wimplicit-fallthrough=]
     612 |                 vma->vm_page_prot = drm_dma_prot(map->type, vma);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_vm.c:614:9: note: here
     614 |         case _DRM_SHM:
         |         ^~~~
   drivers/gpu/drm/drm_vm.c:2: warning: Cannot understand  * file drm_vm.c
    on line 2 - I thought it was a doc line
   drivers/gpu/drm/drm_vm.c:93: warning: Cannot understand  * c fault method for AGP virtual memory.
    on line 93 - I thought it was a doc line
   drivers/gpu/drm/drm_vm.c:183: warning: Cannot understand  * c nopage method for shared virtual memory.
    on line 183 - I thought it was a doc line
   drivers/gpu/drm/drm_vm.c:216: warning: Cannot understand  * c close method for shared virtual memory.
    on line 216 - I thought it was a doc line
   drivers/gpu/drm/drm_vm.c:287: warning: Cannot understand  * c fault method for DMA virtual memory.
    on line 287 - I thought it was a doc line
   drivers/gpu/drm/drm_vm.c:322: warning: Cannot understand  * c fault method for scatter-gather virtual memory.
    on line 322 - I thought it was a doc line
   drivers/gpu/drm/drm_vm.c:428: warning: Cannot understand  * c close method for all virtual memory types.
    on line 428 - I thought it was a doc line
   drivers/gpu/drm/drm_vm.c:446: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * mmap DMA memory.
   drivers/gpu/drm/drm_vm.c:506: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * mmap DMA memory.

vim +153 arch/mips/include/asm/mips-cpc.h

9c38cf44712af9 Paul Burton 2014-01-15  151  
23cb600e3fd406 Paul Burton 2017-08-12  152  /* CPC_Cx_CONFIG - Mirrors GCR_Cx_CONFIG */
23cb600e3fd406 Paul Burton 2017-08-12 @153  CPC_CX_ACCESSOR_RW(32, 0x090, config)
23cb600e3fd406 Paul Burton 2017-08-12  154  

:::::: The code at line 153 was first introduced by commit
:::::: 23cb600e3fd4068697d6fa207848d93e74ec7333 MIPS: CPS: Add CM/CPC 3.5 register definitions

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
