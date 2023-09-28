Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3852C3FB07
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695913566; x=1727449566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRDuK/qZW8dClwvIaLEX4zk2J7VwIwLJJ8gj2yIWAc4=;
  b=UEASKd09Q0tLYwAHuMgYAo66OZrF84atjrlFiCtDQ2AKryi9umKrediG
   gqjuGWyqk+29DrkiJIHWY/yNVmHbrg6DnXpI3Nu9whKia4/bSy2H/xt0/
   mitKpf9HJdL3eTFFFCqITU0V5zEkjWBb9oCsbK7Y8HfbVdEpTQ9Z2UYo9
   Pv3GTijMxCKF4uGijx/mshFN6/dMs5CSxI3ZnmBvA8Ecslb8wJEtPqjWw
   xGYj1F+J9GE9jKKP++v/v+MJY2v+AmgUcqZ/kFoRGSAwGOdkWK6iywiKY
   9GnmGKpvc6oX1lH1R+tWy/yO5hEniPWHvSpSkZGW+3Ebv2NMRDxFS7HVZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446235839"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="446235839"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 08:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873321350"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="873321350"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Sep 2023 08:06:01 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlsaV-0001aB-1e;
	Thu, 28 Sep 2023 15:05:59 +0000
Date: Thu, 28 Sep 2023 23:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Andrew Donnellan <ajd@linux.ibm.com>
Subject: arch/powerpc/kernel/rtas-proc.c:771: warning: Function parameter or
 member 'm' not described in 'ppc_rtas_rmo_buf_show'
Message-ID: <202309282350.RxbSbVM5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   633b47cb009d09dc8f4ba9cdb3a0ca138809c7c7
commit: c13ff6f3251318f5e1ff5b1a6d05f76996db672a powerpc/rtas: improve ppc_rtas_rmo_buf_show documentation
date:   2 years, 5 months ago
config: powerpc-mgcoge_defconfig (https://download.01.org/0day-ci/archive/20230928/202309282350.RxbSbVM5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309282350.RxbSbVM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309282350.RxbSbVM5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/rtas-proc.c:771: warning: Function parameter or member 'm' not described in 'ppc_rtas_rmo_buf_show'
>> arch/powerpc/kernel/rtas-proc.c:771: warning: Function parameter or member 'v' not described in 'ppc_rtas_rmo_buf_show'


vim +771 arch/powerpc/kernel/rtas-proc.c

^1da177e4c3f41 arch/ppc64/kernel/rtas-proc.c   Linus Torvalds 2005-04-16  759  
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  760  /**
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  761   * ppc_rtas_rmo_buf_show() - Describe RTAS-addressable region for user space.
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  762   *
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  763   * Base + size description of a range of RTAS-addressable memory set
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  764   * aside for user space to use as work area(s) for certain RTAS
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  765   * functions. User space accesses this region via /dev/mem. Apart from
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  766   * security policies, the kernel does not arbitrate or serialize
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  767   * access to this region, and user space must ensure that concurrent
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  768   * users do not interfere with each other.
c13ff6f3251318 arch/powerpc/kernel/rtas-proc.c Nathan Lynch   2021-04-08  769   */
^1da177e4c3f41 arch/ppc64/kernel/rtas-proc.c   Linus Torvalds 2005-04-16  770  static int ppc_rtas_rmo_buf_show(struct seq_file *m, void *v)
^1da177e4c3f41 arch/ppc64/kernel/rtas-proc.c   Linus Torvalds 2005-04-16 @771  {

:::::: The code at line 771 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
