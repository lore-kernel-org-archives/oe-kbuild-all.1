Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15032F22
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJTeW4oL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700476983; x=1732012983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yC8uiBzIQtKBElCnvHe+GY3B1nxu4VxXXGQY2z9b/IU=;
  b=eJTeW4oL7hkMlbWluYC+j3lrReftMHc8um3LAGQ4I/L+flm8eYRm85l8
   oAIYKWuasCUCzQNuspbF3ROzK1P6XXIIm+ggGh4ry4uocnX0BZmksKWvA
   FYbVzuJc2D0huUlR+RC+CJKjlvnU03dTfJzSeQVJj3p7pSGaH8r979QAL
   nTuY3h2lajF7TjvfhS4c2IQoqJd/9zwphQJOYPc+8g0ku7gdbb7mIx6GB
   bRZcwCKH5PmPHCkL8qD3KC2dGn+IknwcsiJ90U5rdd2YUfkyeiL0ZCTpl
   tFiSHOJzZvYqwxQM17GunlHd6B00Lo3KFGHL3mwQCTo028pzKqgOnVTca
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="390452986"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="390452986"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 02:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856949372"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="856949372"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2023 02:43:02 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r51k4-0006Mz-0N;
	Mon, 20 Nov 2023 10:43:00 +0000
Date: Mon, 20 Nov 2023 18:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 334/449] kernel/sched/smp.h:14:20: error: redefinition
 of 'flush_smp_call_function_queue'
Message-ID: <202311201815.WpMqessd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/prjc
head:   a343b008e1bf155cdcfe9a46e38336032adeb65a
commit: d3eaf77e9b721b7ead96e32ec9e08dc48c33d176 [334/449] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311201815.WpMqessd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201815.WpMqessd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201815.WpMqessd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:35:
>> kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
      14 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/build_policy.c:34:
   kernel/sched/alt_sched.h:296:20: note: previous definition of 'flush_smp_call_function_queue' with type 'void(void)'
     296 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_smp_call_function_queue +14 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  10  
d664e399128bd7 Thomas Gleixner 2022-04-13  11  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  12  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  13  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @14  static inline void flush_smp_call_function_queue(void) { }

:::::: The code at line 14 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
