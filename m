Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55304199A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHiFssn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699526186; x=1731062186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BzUCmE8ob6dil/VhEnsz3jgMX8f1ifdzn8BULgnEwM=;
  b=oHiFssn/G3ST7dNIfhK79SFAMPrrt8WCfv3uQRjvuRCs2Rh5j0R0bRLc
   RXobNySSSO5uBjSk/luNtg3g9w6/rXOqB3xENcr2k1+2JSowOxvVm70bC
   oxOCcBKX8j+rMIBWRPpXcamjdzE/ZgsO1A9up1m/JNzrJXTLRlpvtuM+r
   J0uT5KYVbmFZ7Ky/59AOwj7dI3GZJbArWokS16sUuxzRm1P/jLZxZvFO3
   ZyXnMRW0xe28rIA5tWlndL0BqokhQpLnk5veRfUbJm/12A4I7oDQtJt4P
   w9/Qbc7e8hsmxnz/P1KMfpRLzWd+ARniiissbd3BhCOlVZL+fyC2RZ4gq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="392830051"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="392830051"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 02:36:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4693615"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2023 02:36:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r12Oa-0008fA-2L;
	Thu, 09 Nov 2023 10:36:22 +0000
Date: Thu, 9 Nov 2023 18:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 73/92]
 arch/x86/kernel/cpu/topology.c:33:3: sparse: sparse: symbol 'topo_info' was
 not declared. Should it be static?
Message-ID: <202311091806.iExMOMdL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   5fbf54acdbd566c7573587a76105f844685e3ec7
commit: bbd6f0cf585334206b5f1f18a6e31c6193a68a01 [73/92] x86/cpu/topology: Use a data structure for topology info
config: i386-randconfig-062-20231101 (https://download.01.org/0day-ci/archive/20231109/202311091806.iExMOMdL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091806.iExMOMdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091806.iExMOMdL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/topology.c:33:3: sparse: sparse: symbol 'topo_info' was not declared. Should it be static?
   arch/x86/kernel/cpu/topology.c:177:13: sparse: sparse: symbol 'prefill_possible_map' was not declared. Should it be static?

vim +/topo_info +33 arch/x86/kernel/cpu/topology.c

    24	
    25	/*
    26	 * Keep track of assigned, disabled and rejected CPUs. Present assigned
    27	 * with 1 as CPU #0 is reserved for the boot CPU.
    28	 */
    29	struct {
    30		unsigned int		nr_assigned_cpus;
    31		unsigned int		nr_disabled_cpus;
    32		unsigned int		nr_rejected_cpus;
  > 33	} topo_info __read_mostly = {
    34		.nr_assigned_cpus	= 1,
    35	};
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
