Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3C29453
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688657431; x=1720193431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqXGwkgMnAiw1GTPVwug2932CLunMdkS2bQPEAvW1f4=;
  b=Gw5dyI8KlmkkTgwp2VMAH0pX8HULxed63fjGcT2Iv1E6Zcu4mD2JtmnX
   n5FJ8y1Tzj93IdxDM2wyc617gRqOffzulrNf3Pa5mZevpjpd56Ao39e3W
   ZIEqCz2xK43WgD1kX+RLNBE9jiPaUcv3uThaFRmXaK8lnYoC9sgcf9GvK
   dDcfjnLMBi9U/tLbyQp+MnQCHMPPHVcWE0rdsqZN/r4cuPK+WQag43XlA
   EH3fytVGtOKA3Da9gy6M6MfViViGw2+dBmRVCN272DRAZNmIbqE2Epy2I
   S2kULrr9Nbi5izC2AiIPgDeGG66zarayQAhem9dX9selEZIfco1k/3rVW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="367123240"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="367123240"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 08:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="719615454"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="719615454"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jul 2023 08:30:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHQw8-0001Pe-15;
	Thu, 06 Jul 2023 15:30:28 +0000
Date: Thu, 6 Jul 2023 23:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 95/101] fs/inode.c:2560:19: error: redefinition of
 'current_time'
Message-ID: <202307062342.QPloUwTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   8f9d94d69805b4abc24e544ae75e69993a62b76f
commit: 1a4d24a00a8bdb3d5d105e01c6ab83f5a16f6657 [95/101] fs: add infrastructure for multigrain inode i_m/ctime
config: m68k-randconfig-r023-20230706 (https://download.01.org/0day-ci/archive/20230706/202307062342.QPloUwTB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307062342.QPloUwTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307062342.QPloUwTB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/inode.c:2560:19: error: redefinition of 'current_time'
    2560 | struct timespec64 current_time(struct inode *inode)
         |                   ^~~~~~~~~~~~
   fs/inode.c:2117:19: note: previous definition of 'current_time' with type 'struct timespec64(struct inode *)'
    2117 | struct timespec64 current_time(struct inode *inode)
         |                   ^~~~~~~~~~~~


vim +/current_time +2560 fs/inode.c

50e17c000c467f Deepa Dinamani 2018-01-21  2549  
3cd886666ff19e Deepa Dinamani 2016-09-14  2550  /**
3cd886666ff19e Deepa Dinamani 2016-09-14  2551   * current_time - Return FS time
3cd886666ff19e Deepa Dinamani 2016-09-14  2552   * @inode: inode.
3cd886666ff19e Deepa Dinamani 2016-09-14  2553   *
3cd886666ff19e Deepa Dinamani 2016-09-14  2554   * Return the current time truncated to the time granularity supported by
3cd886666ff19e Deepa Dinamani 2016-09-14  2555   * the fs.
3cd886666ff19e Deepa Dinamani 2016-09-14  2556   *
3cd886666ff19e Deepa Dinamani 2016-09-14  2557   * Note that inode and inode->sb cannot be NULL.
3cd886666ff19e Deepa Dinamani 2016-09-14  2558   * Otherwise, the function warns and returns time without truncation.
3cd886666ff19e Deepa Dinamani 2016-09-14  2559   */
95582b00838837 Deepa Dinamani 2018-05-08 @2560  struct timespec64 current_time(struct inode *inode)
3cd886666ff19e Deepa Dinamani 2016-09-14  2561  {
d651d1607f22fd Arnd Bergmann  2018-12-05  2562  	struct timespec64 now;
d651d1607f22fd Arnd Bergmann  2018-12-05  2563  
d651d1607f22fd Arnd Bergmann  2018-12-05  2564  	ktime_get_coarse_real_ts64(&now);
3cd886666ff19e Deepa Dinamani 2016-09-14  2565  
3cd886666ff19e Deepa Dinamani 2016-09-14  2566  	if (unlikely(!inode->i_sb)) {
3cd886666ff19e Deepa Dinamani 2016-09-14  2567  		WARN(1, "current_time() called with uninitialized super_block in the inode");
3cd886666ff19e Deepa Dinamani 2016-09-14  2568  		return now;
3cd886666ff19e Deepa Dinamani 2016-09-14  2569  	}
3cd886666ff19e Deepa Dinamani 2016-09-14  2570  
50e17c000c467f Deepa Dinamani 2018-01-21  2571  	return timestamp_truncate(now, inode);
3cd886666ff19e Deepa Dinamani 2016-09-14  2572  }
3cd886666ff19e Deepa Dinamani 2016-09-14  2573  EXPORT_SYMBOL(current_time);
2b3416ceff5e6b Yang Xu        2022-07-14  2574  

:::::: The code at line 2560 was first introduced by commit
:::::: 95582b00838837fc07e042979320caf917ce3fe6 vfs: change inode times to use struct timespec64

:::::: TO: Deepa Dinamani <deepa.kernel@gmail.com>
:::::: CC: Deepa Dinamani <deepa.kernel@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
