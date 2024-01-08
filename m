Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12F79CD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 04:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHSPIJ0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704687151; x=1736223151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lM1IdrLrvPyT+iiDZGwYismJoLL9BxyG9xrPTHKClxg=;
  b=UHSPIJ0/t+I24abaeVZ+VVQzA1a1bs8s8DBwICK15siVoHlxP4IQY7kR
   SziXtQA6BusV/3tyfayQBzoiSkTGHs5CpcZOlBhFlo0dUotaohOHk++p7
   KLqfii8Y08gdFKyUXSLAGzGaCyrWn2HeXJCHdiN/IhxqMrFFaH1Z8MPZn
   qeEOfT972l7zAzu8vm6XZKRjbK49jYsMlqNwRcZPSP1oeSx24tROu24BK
   Wn1+9J+/ivn+7muI1FEQHa7ktIeMdrax2nq6apbhl2VubqAA0NQTv0PgE
   eTJAhmgiS1cDljCI1Gj4PF17a3BHBiT0X+XZ1xdndryMxOtdOZ/t74i0W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4550783"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4550783"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 20:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="781300233"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="781300233"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 07 Jan 2024 20:12:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMgzy-0004SO-2S;
	Mon, 08 Jan 2024 04:12:26 +0000
Date: Mon, 8 Jan 2024 12:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] fs/fuse/passthrough.c:20:20:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202401081228.CgVAFUjd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   9c09afab6e348ac0e11d63c6680819ad2103dfc3
commit: 9c09afab6e348ac0e11d63c6680819ad2103dfc3 [2/2] ANDROID: fs: Move iocb_to_rw_flags to fuse/passthrough
config: x86_64-randconfig-121-20240108 (https://download.01.org/0day-ci/archive/20240108/202401081228.CgVAFUjd-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081228.CgVAFUjd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081228.CgVAFUjd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/passthrough.c:20:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   fs/fuse/passthrough.c:20:20: sparse:     expected restricted __kernel_rwf_t
   fs/fuse/passthrough.c:20:20: sparse:     got int
>> fs/fuse/passthrough.c:20:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   fs/fuse/passthrough.c:20:20: sparse:     expected restricted __kernel_rwf_t
   fs/fuse/passthrough.c:20:20: sparse:     got int

vim +20 fs/fuse/passthrough.c

    17	
    18	static inline rwf_t fuse_iocb_to_rw_flags(int ifl, int iocb_mask)
    19	{
  > 20		return ifl & iocb_mask;
    21	}
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
