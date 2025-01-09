Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD61217652
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433370; cv=none; b=kzlc0CvH0lIv+kM5eMM0AqudVCv1ljTtfDBw3DXgeJ4SZe/Li64cCVhxp4/UDUd5Oz6ub+DqaL8YivI5MipbXUBF9u1izDxbv0aeQPbNaXElf9duImD+Tltvdk6GMzQqtlkIw7iNKobP9ATXPuBo8U1PJtFpMcVJrPVoUN+23i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433370; c=relaxed/simple;
	bh=t+bN1xEh7+bZQrhsHtiqEV36/WHN8Jln59BKhDHblhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j3A+jdRi58VS2TSFD7nWFKguHtqJLVuz+eoQzMPLpk6gXh62A3eoyiB2lWQTT32JLqUwzB2EvhJLEKfjt4jHRpQivFn1049ZN0i2aw6+0mFQI45CLUKnezSlAIDNm/YjjM9dgSS/Nj0UiLBrIhzxEl9dxu1vS5Q4vbutv+HpXSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+csPlWe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+csPlWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736433367; x=1767969367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+bN1xEh7+bZQrhsHtiqEV36/WHN8Jln59BKhDHblhk=;
  b=X+csPlWes4dCOr2FQgD1iyPwAZ2xOR9kZkBoQSYj1G4Fcv5PH3I7SS4q
   TYMN7mmUE1M8hFQ0UzY3TewqeLf5qnkFmxnZtsNKO0+6fJLyfbMEPc7OO
   /Yof2xPEvh4fRBW340obCF59AYnDwTdV4H1ISlI7ag/4TlEKQe/TS4iTd
   K6PTA9B9d/+QpBejbjtW6gKUQcW9xjmtleMz6gRAR2Gj2FNg6eyOC/iTi
   jBbOWGoWeAO5fZZst8/mIZKJmgeGZufAqeVD8sH3mXq4r4qqpJXgMbwMS
   iXrx3O7zeaQCdBNoonZfjlGw3oopmAlO/vUEt3RHM0dcVCrzQFZ0FsYco
   A==;
X-CSE-ConnectionGUID: Yac2z5PKRweJT3Mr6aF/XQ==
X-CSE-MsgGUID: tgZuGaBXQlGZFgzJVKSxPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36581992"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36581992"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:36:06 -0800
X-CSE-ConnectionGUID: 5tclTvYRSLSgCXtKjyZ7vw==
X-CSE-MsgGUID: Q7mwpvmkTo6ORWS0kQ5+ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="108413992"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jan 2025 06:36:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVtdj-000HgD-0r;
	Thu, 09 Jan 2025 14:36:03 +0000
Date: Thu, 9 Jan 2025 22:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/ctl_table_const 1/1] lib/alloc_tag.c:729:61:
 error: assignment of member 'mode' in read-only object
Message-ID: <202501092243.6TskHDKT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/ctl_table_const
head:   3eed56785bcc57cb6f3184f24a22a4b79692ea5c
commit: 3eed56785bcc57cb6f3184f24a22a4b79692ea5c [1/1] treewide: const qualify ctl_tables where applicable
config: arc-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092243.6TskHDKT-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092243.6TskHDKT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092243.6TskHDKT-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/alloc_tag.c: In function 'sysctl_init':
>> lib/alloc_tag.c:729:61: error: assignment of member 'mode' in read-only object
     729 |                 memory_allocation_profiling_sysctls[0].mode = 0444;
         |                                                             ^


vim +/mode +729 lib/alloc_tag.c

22d407b164ff79d Suren Baghdasaryan 2024-03-21  725  
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  726  static void __init sysctl_init(void)
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  727  {
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  728  	if (!mem_profiling_support)
c944bf60c16a65a Suren Baghdasaryan 2024-06-01 @729  		memory_allocation_profiling_sysctls[0].mode = 0444;
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  730  
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  731  	register_sysctl_init("vm", memory_allocation_profiling_sysctls);
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  732  }
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  733  #else /* CONFIG_SYSCTL */
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  734  static inline void sysctl_init(void) {}
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  735  #endif /* CONFIG_SYSCTL */
c944bf60c16a65a Suren Baghdasaryan 2024-06-01  736  

:::::: The code at line 729 was first introduced by commit
:::::: c944bf60c16a65ae812a59fd1b66f6c9e18c91c9 lib/alloc_tag: do not register sysctl interface when CONFIG_SYSCTL=n

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
