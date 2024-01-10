Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02914BA82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNstkZ8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704899288; x=1736435288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jgfy4KS8GNFjezTiehYPzeV1uHCxZWvh1cVpfXb9L+I=;
  b=UNstkZ8q4wT1Dx8tYB+qMhhFK+gOI0w4lFQtPNs4Fr5VOxUrFNXNkdLI
   J5DefrbC9jsaoddLPubJmbBdd2HDG9wMKiYSTAJAyDoDXsEQRxdN7XhfY
   aU7qzrM1wpglrPSK1+j/mG1jSNA9oiKP/YR5f3qmYVz7NZrLhLM43Zxdt
   ov3s7KiiEGDpU6+W6Ygnkyd+UXzJndi0fqv+8nx8R0f8MtjVNxCKRu1ME
   4CdzERN803jP/j4rUZNjqUU5xMzo2r90YRfOzYhURsBpObk4K9KkXK6FO
   c72CC8JRwze1PkdIO+cDXX6+BF2Z8ttGdE2gA+OhMApnpkbreH9yU3J4n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="11890490"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="11890490"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 07:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="16676067"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jan 2024 07:08:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNaBW-0007A2-1R;
	Wed, 10 Jan 2024 15:08:02 +0000
Date: Wed, 10 Jan 2024 23:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1840/2334] fs/filescontrol.c:89:5: warning: no
 previous prototype for 'files_cgroup_count_fds'
Message-ID: <202401102348.H1IQ3kfa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c780cd23389087490b4199975c7e16cb696da852
commit: be6df5f1e6b8fdc2ae0dabda8f84b7fb8bfaedb5 [1840/2334] cgroups: Resource controller for open files
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240110/202401102348.H1IQ3kfa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401102348.H1IQ3kfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401102348.H1IQ3kfa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/filescontrol.c:89:5: warning: no previous prototype for 'files_cgroup_count_fds' [-Wmissing-prototypes]
      89 | u64 files_cgroup_count_fds(struct files_struct *files)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/files_cgroup_count_fds +89 fs/filescontrol.c

    88	
  > 89	u64 files_cgroup_count_fds(struct files_struct *files)
    90	{
    91		int i;
    92		struct fdtable *fdt;
    93		int retval = 0;
    94	
    95		fdt = files_fdtable(files);
    96		for (i = 0; i < DIV_ROUND_UP(fdt->max_fds, BITS_PER_LONG); i++)
    97			retval += hweight64((__u64)fdt->open_fds[i]);
    98		return retval;
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
