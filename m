Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098C3CA58
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 05:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9kQP9aI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699422997; x=1730958997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dx4cWhOo4OErTTtkr1p773bgEl2+e1B3qseCTWJL0ck=;
  b=G9kQP9aIMHmGTLuGmE9xcu+gwLHNsR+ctFCmOUx7sm48XTls4ssBNChB
   ioUn8+E2++MlpNrixfv5rG71G2wkmgASFW5/co+QrawpmMxL8R0lVt5cZ
   MHNOQwfBE8qh0LQBbZnLM+AaWa0/qyxnQ0JvGqzJY23jZhNvnE4w16trE
   Hu50yvtFzJMSwdViSuNN3WfnWSbYyT1Ro18elTqaGeGQDYoRLjVXGtg9a
   RY3p3ficqLBgSXI68bGHULObHAuC3Hh1c5ury8tIJtKu75w+SJqDLREi/
   PB8gxctxf7UO7XFVeQZzIso6ULP1MRLp5IIObYOfQ4Mufx40YZaouGkoR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8348743"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="8348743"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 21:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880095791"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="880095791"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2023 21:56:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bYD-0007ih-0D;
	Wed, 08 Nov 2023 05:56:29 +0000
Date: Wed, 8 Nov 2023 13:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl_remove_empty_elem_fs 3/5] s390-linux-ld:
 fs/verity/init.o:undefined reference to `fsverity_require_signatures'
Message-ID: <202311081320.VjnaeXck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl_remove_empty_elem_fs
head:   cc57fa42508dc4948c2d55181c1b93969f080b2a
commit: ef08bfd5d44a75aa63c121e1d57ffa19572babd3 [3/5] aio: Remove the now superfluous sentinel elements from ctl_table array
config: s390-randconfig-002-20231108 (https://download.01.org/0day-ci/archive/20231108/202311081320.VjnaeXck-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081320.VjnaeXck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081320.VjnaeXck-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld: fs/verity/init.o:(.data.rel+0x8): undefined reference to `fsverity_require_signatures'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
