Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D498C0F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690208357; x=1721744357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oXD+tPYtdhQvR5GUB3Cciez1he74nY/HgHY4epEFtu0=;
  b=WW6En3zpgltt/3Q974xQgFvJnIjCWjW/nNCTTV2CaSbjDSWH8zvFYDgr
   73EKDVBWgTfU1DRQwNwEteGpX5x2o6nAAjjzvQT8WbPVli6WobqAiR+iw
   pqTOwHpaDhuxnJX5/cGUljUNUZ3x54O/joT3v9dd9FUVoRFy4f/j8Qc7w
   0o9ZjY5ob4b1pryB7ff1jEiRbVhoib+XemVuaYWqeOVRWCm44qBLtSAUj
   llGkiqTt7q+0GR21erqjgh13uOJyrExpR6X8GGaoVd7av1ei8uUrSpfEt
   /Uy3F2iSJthRQER3D2yT2p6dRIHJVSGMBxxyvJj9LKqRzVggX7X1j3ypN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398360454"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398360454"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 07:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="790982097"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="790982097"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 07:19:12 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNwP1-0009lS-34;
	Mon, 24 Jul 2023 14:19:11 +0000
Date: Mon, 24 Jul 2023 22:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>
Subject: drivers/iommu/io-pgtable-dart.c:157:25: warning: variable 'new' set
 but not used
Message-ID: <202307242225.d5UjdQao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6eaae198076080886b9e7d57f4ae06fa782f90ef
commit: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery
date:   7 weeks ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230724/202307242225.d5UjdQao-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242225.d5UjdQao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242225.d5UjdQao-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/io-pgtable-dart.c: In function 'dart_install_table':
   drivers/iommu/io-pgtable-dart.c:168:13: error: void value not ignored as it ought to be
     168 |         old = cmpxchg64_relaxed(ptep, curr, new);
         |             ^
>> drivers/iommu/io-pgtable-dart.c:157:25: warning: variable 'new' set but not used [-Wunused-but-set-variable]
     157 |         dart_iopte old, new;
         |                         ^~~


vim +/new +157 drivers/iommu/io-pgtable-dart.c

745ef1092bcfcf Janne Grunau 2022-09-16  151  
745ef1092bcfcf Janne Grunau 2022-09-16  152  static dart_iopte dart_install_table(dart_iopte *table,
745ef1092bcfcf Janne Grunau 2022-09-16  153  					     dart_iopte *ptep,
745ef1092bcfcf Janne Grunau 2022-09-16  154  					     dart_iopte curr,
745ef1092bcfcf Janne Grunau 2022-09-16  155  					     struct dart_io_pgtable *data)
745ef1092bcfcf Janne Grunau 2022-09-16  156  {
745ef1092bcfcf Janne Grunau 2022-09-16 @157  	dart_iopte old, new;
745ef1092bcfcf Janne Grunau 2022-09-16  158  
745ef1092bcfcf Janne Grunau 2022-09-16  159  	new = paddr_to_iopte(__pa(table), data) | APPLE_DART_PTE_VALID;
745ef1092bcfcf Janne Grunau 2022-09-16  160  
745ef1092bcfcf Janne Grunau 2022-09-16  161  	/*
745ef1092bcfcf Janne Grunau 2022-09-16  162  	 * Ensure the table itself is visible before its PTE can be.
745ef1092bcfcf Janne Grunau 2022-09-16  163  	 * Whilst we could get away with cmpxchg64_release below, this
745ef1092bcfcf Janne Grunau 2022-09-16  164  	 * doesn't have any ordering semantics when !CONFIG_SMP.
745ef1092bcfcf Janne Grunau 2022-09-16  165  	 */
745ef1092bcfcf Janne Grunau 2022-09-16  166  	dma_wmb();
745ef1092bcfcf Janne Grunau 2022-09-16  167  
745ef1092bcfcf Janne Grunau 2022-09-16  168  	old = cmpxchg64_relaxed(ptep, curr, new);
745ef1092bcfcf Janne Grunau 2022-09-16  169  
745ef1092bcfcf Janne Grunau 2022-09-16  170  	return old;
745ef1092bcfcf Janne Grunau 2022-09-16  171  }
745ef1092bcfcf Janne Grunau 2022-09-16  172  

:::::: The code at line 157 was first introduced by commit
:::::: 745ef1092bcfcf3bca8d82c260947ca498022dde iommu/io-pgtable: Move Apple DART support to its own file

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
