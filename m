Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3945E56C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692344369; x=1723880369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EwKstDjFWfbFD2tpoMnA0t7cc5qZ4H00h9EEaWlOMTM=;
  b=IRQPEns4eX4XEhk66Euervtjwvm0M9dhjS1ByQ+FGGfE9KleTJPP9bOF
   WfEv3T4AvPC2HrNNTTu+I2m64fwgNwzgBG7OmxQ/PQzKQEU/zpUBBsVgr
   M9GYA+Fwg0R6hT3pT6HaSzDSF/V294Ij6jBnjfPhkXKa0nwtDCJIdckEm
   7gBQVQX7ArgcbpsGNv6vff/H5Lq1Y+3sDRcqj/ZO2g7UNgUyFPpQH0tCs
   BHavhtq/aK3ZuTpzhK2IkhYmGYU/ZApMziMZ8dwplaDSlra6GKB6qIepK
   ih39H9scd/A3pk9KboJS7x4gkEJGQa3RcIW47UxFC8zGnckmz6j/B7vxR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="352627634"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="352627634"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 00:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728511800"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="728511800"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Aug 2023 00:39:05 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWu4W-0002EB-1N;
	Fri, 18 Aug 2023 07:39:04 +0000
Date: Fri, 18 Aug 2023 15:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:for-next 37/39] cpufeature.c:undefined reference to
 `__udivdi3'
Message-ID: <202308181507.l5bsbcjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   1948317e04f46e278acf875aa1e8042eb0b165c4
commit: 37e0c16254d5ca54484341b4cebc24fd9b0d5b15 [37/39] RISC-V: Probe for unaligned access speed
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230818/202308181507.l5bsbcjU-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181507.l5bsbcjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181507.l5bsbcjU-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: arch/riscv/kernel/cpufeature.o: in function `.L180':
>> cpufeature.c:(.text+0x286): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
