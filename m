Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F93438B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779234051; cv=none; b=LFOrVZbKJmbnES+RYF4FLGRMRVsiwCFpHrz4PnXACns65kLXL6A3COF1m9LgHwV5VYB+d6ZtuFvfmXOHHK26Nl2ISWgCY9N7dXSS3SrutAXHfEndY4m41eIP/Q5qqNt4qINS3jrUP4Pjme/WGfrCeaTgC79NLat1cfqXAdQ/vQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779234051; c=relaxed/simple;
	bh=Iyh2X4QOgb4lV84Lk4Fsl2FK4u1sIS8hgIKQ/pijwqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WzgX/hUG0M2gi8cvdDIgKc9ajlYuOpgqpOSqG9XZ5+ttmiIKiMf9sdrPxiVdJhdqF7Jw/cJTEQXatqVxt3Wn4kK3cUhFm++q+UZt9x/jUj6px5kQfvm9gvTnEya2rwHH8y4ljUMhV+8/ZTrIwJOiM8sVS3zu1iJx8ypCSikNE4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwtMG8kS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwtMG8kS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779234050; x=1810770050;
  h=date:from:to:cc:subject:message-id;
  bh=Iyh2X4QOgb4lV84Lk4Fsl2FK4u1sIS8hgIKQ/pijwqE=;
  b=EwtMG8kSVGTKCuleB0h1tYb29ZetcBSNhN2bphHLyi/ZnCGS54SzsCPP
   GWOsbtkRpII/3DWizXDB8Z1J+7zFf2GAYWot8ECjga9cvT6wD0yYtUt08
   q7kHL7SKWh+SNqRpdtiA0F1X5tJw9yGob8+5YCvIzn9bQ8QI12uICRjHX
   yMmH9mD6eiVtqVhAfuaTbOssjnfrRVpsn0Kt/tyP9+y/zBD9Ae2zuCJyK
   4S+ZKlaSLnjbz8SjPa4ICpQmBFsh/7TLPLS046mF3QC1r17IvXWbBIOV9
   IRBQ2NbJ8BBps2hNNoZRITmXppsEV/puq/2uToqca7P2iu6ZovzWcp3fp
   g==;
X-CSE-ConnectionGUID: 8zhmL76sSvK1jaDBu3xLcQ==
X-CSE-MsgGUID: 6f+OJxAXR2exjwjxW6n66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80300528"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80300528"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 16:40:50 -0700
X-CSE-ConnectionGUID: Xg/+EoGzRMyrmVyZnKDMOA==
X-CSE-MsgGUID: noJ6Ww0jQx2MEFfcmVxcMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244233063"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2026 16:40:49 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPU2p-0000000028x-1wgf;
	Tue, 19 May 2026 23:40:28 +0000
Date: Wed, 20 May 2026 07:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.exit_mm 3/4]
 drivers/firmware/efi/efi.c:76:14: warning: initialization of 'char' from
 'struct user_namespace *' makes integer from pointer without a cast
Message-ID: <202605200727.g6IplqPM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.exit_mm
head:   822aa51be2cae2813d42b998a12558fa76afbc4f
commit: a8f2b6f303fb0cdc7fef1b4e8966828a1dc7e10a [3/4] sched: move mm->user_ns to task->exec_state
config: riscv-randconfig-001 (https://download.01.org/0day-ci/archive/20260520/202605200727.g6IplqPM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200727.g6IplqPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200727.g6IplqPM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/efi.c:76:3: error: 'struct mm_struct' has no member named 'user_ns'
     .user_ns  = &init_user_ns,
      ^~~~~~~
>> drivers/firmware/efi/efi.c:76:14: warning: initialization of 'char' from 'struct user_namespace *' makes integer from pointer without a cast [-Wint-conversion]
     .user_ns  = &init_user_ns,
                 ^
   drivers/firmware/efi/efi.c:76:14: note: (near initialization for 'efi_mm.flexible_array[0]')
   drivers/firmware/efi/efi.c:76:14: error: initializer element is not computable at load time
   drivers/firmware/efi/efi.c:76:14: note: (near initialization for 'efi_mm.flexible_array[0]')
   drivers/firmware/efi/efi.c:68:27: warning: missing braces around initializer [-Wmissing-braces]
    struct mm_struct efi_mm = {
                              ^
   drivers/firmware/efi/efi.c:68:27: warning: missing braces around initializer [-Wmissing-braces]


vim +76 drivers/firmware/efi/efi.c

732ea9db9d8a6a Ard Biesheuvel    2022-10-11  67  
7e904a91bf6049 Sai Praneeth      2018-03-12  68  struct mm_struct efi_mm = {
d4af56c5c7c678 Liam R. Howlett   2022-09-06  69  	.mm_mt			= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, efi_mm.mmap_lock),
7e904a91bf6049 Sai Praneeth      2018-03-12  70  	.mm_users		= ATOMIC_INIT(2),
7e904a91bf6049 Sai Praneeth      2018-03-12  71  	.mm_count		= ATOMIC_INIT(1),
57efa1fe595769 Jason Gunthorpe   2020-12-14  72  	.write_protect_seq      = SEQCNT_ZERO(efi_mm.write_protect_seq),
14c3656b7284a8 Michel Lespinasse 2020-06-08  73  	MMAP_LOCK_INITIALIZER(efi_mm)
7e904a91bf6049 Sai Praneeth      2018-03-12  74  	.page_table_lock	= __SPIN_LOCK_UNLOCKED(efi_mm.page_table_lock),
7e904a91bf6049 Sai Praneeth      2018-03-12  75  	.mmlist			= LIST_HEAD_INIT(efi_mm.mmlist),
61ed08c2fd1db0 Breno Leitao      2025-12-23 @76  	.user_ns		= &init_user_ns,
40374d308e4e45 Ard Biesheuvel    2025-10-15  77  #ifdef CONFIG_SCHED_MM_CID
44fc84337b6eae Linus Torvalds    2025-12-02  78  	.mm_cid.lock		= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.mm_cid.lock),
40374d308e4e45 Ard Biesheuvel    2025-10-15  79  #endif
6ac433f8b2590b Mathieu Desnoyers 2025-12-24  80  	.flexible_array		= MM_STRUCT_FLEXIBLE_ARRAY_INIT,
7e904a91bf6049 Sai Praneeth      2018-03-12  81  };
7e904a91bf6049 Sai Praneeth      2018-03-12  82  

:::::: The code at line 76 was first introduced by commit
:::::: 61ed08c2fd1db0eb43c8b62ade249a3061e39444 arm64: efi: Fix NULL pointer dereference by initializing user_ns

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
