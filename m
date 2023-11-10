Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60B15E98
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jl51eupy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699615734; x=1731151734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VaXlccZ/yJ8N0r+eIosEuSKaFNS2ZliAL6r05bErFPQ=;
  b=jl51eupy56FOO+KCL3rCAITeN/EfdKehgZ07bTU1XjISNrAgrqW6lLbn
   JqPASqKT1cpvhxsG+cfc1mq//mN9HoQrXygFcR893stu05UfataGeUMuU
   BGsvY5XCRNtsD/nMbavFBwUAj+zsh/MqCEkkHa0tfsQXQytje9vc7fj2i
   XoJylMd3rj++3Ni1slmr72Ous1u7f9sSX2atF5xRP1uyrdzbEFBABKCwf
   xcFAbblMG0WH2E1zYfD3A9qW5/IIlGe+dBuLyuw0p/2595wg5r6EUH76B
   mOUQzs6FtvS1NotUCN9+7kDyhxjwYl3GgZdYpIcPaEq1w7ik2/ftGA0DX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389977089"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="389977089"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 03:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="763737648"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763737648"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 03:28:51 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Pgv-0009ZO-1c;
	Fri, 10 Nov 2023 11:28:49 +0000
Date: Fri, 10 Nov 2023 19:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:atomics/stats 3/3] lib/atomic_stats.c:72:12: sparse: sparse:
 symbol 'atomic_stats_init' was not declared. Should it be static?
Message-ID: <202311101921.Zn8Z7rQ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git atomics/stats
head:   faac67799e50bb8a7b09f56f10128e6718959467
commit: faac67799e50bb8a7b09f56f10128e6718959467 [3/3] HACK/WIP: locking/atomic: allow statistics to be collected for atomics
config: i386-randconfig-062-20231005 (https://download.01.org/0day-ci/archive/20231110/202311101921.Zn8Z7rQ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101921.Zn8Z7rQ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101921.Zn8Z7rQ6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/atomic_stats.c:72:12: sparse: sparse: symbol 'atomic_stats_init' was not declared. Should it be static?

vim +/atomic_stats_init +72 lib/atomic_stats.c

    71	
  > 72	int __init atomic_stats_init(void)
    73	{
    74		debugfs_create_file("atomic_stats", 0400, NULL, NULL, &atomic_stats_fops);
    75		return 0;
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
