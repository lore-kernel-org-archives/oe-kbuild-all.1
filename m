Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0692B22094
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374353; cv=none; b=Fj025XTvQUenx8W+ioaKAqcCZB4CNUFkp3+3+8V0p2Bgz1uVFCEvQR4/kDpnPaxQ/KMTs2rNJ+WuNsTKTMW337so6cGb8Z0eqUXZnDb3BxQCTi1p8nr5SdKRBwHXS3trdaEtSKQwhifDMFjxgujjUWOP8cEONcMW8c+8+vHqXF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374353; c=relaxed/simple;
	bh=CQ1nzKEdUJHUQxGjQHXOriS5/UgwjPv2HMQ0pjt3aLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4eHJDXC81/E0SUYZip2CR2QL8tdoyd+rt1sQVsdeZFxYQhr+joWBsDRF6rHLKun0tQovMzpZM6LM9JGqPbLI4ZIIgk7UEpCoFcJOZ8aBP9PGsWXIkwGN7JCOA81C2EiqBBVVf4p5D5Gh9/io0GQCOxJlrkOA2uovfhcsol/q1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjx9ju2h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjx9ju2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751374350; x=1782910350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQ1nzKEdUJHUQxGjQHXOriS5/UgwjPv2HMQ0pjt3aLQ=;
  b=fjx9ju2hjn9R4SfOsEDCj+EbdLKVQ/DNn90wDhn5AhclrCaySdQnbzFT
   jPe+pUhoM2D2zpolXtRU5LapfGCGcCocFU6GeiJtmFy6dnPnMCauA4w2U
   HlpfZJmcrbSU59Yj0HAvuf830dGS3egr8jUpEMsuk+V22e/NCnZ69eejf
   ZDppoonSmX/2kNdOGFtNsZihNE4DR4yekF3Oje2osAy6czVvhy3kPJ1XY
   B/ZL4q3lJIBltAiHXJgN9t1K8NMCeduNrldMHBBaQJ1A7pM9YOAMq3txC
   c8F5UMxVtshh/tZmHSsuMtAPNpnGhEARXoTgq7/bTyEaLJAh/05WhT2LC
   A==;
X-CSE-ConnectionGUID: gbYEH/S2QZSeooLbhyULJg==
X-CSE-MsgGUID: 6P2xgGpFRPq99pY+eVVBoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64333741"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64333741"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:52:29 -0700
X-CSE-ConnectionGUID: CiRoKHQKSDK9XEEG4ZZ4GQ==
X-CSE-MsgGUID: BmKq/7MdQ02tg4RWJfvyBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159479249"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 01 Jul 2025 05:52:29 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWaTJ-000057-2m;
	Tue, 01 Jul 2025 12:52:25 +0000
Date: Tue, 1 Jul 2025 14:51:57 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] arch/x86/lib/copy_highpages.c:20:5:
 warning: no previous prototype for function 'sysctl_hugepage_nocache_copy'
Message-ID: <202507011441.j7rBaRlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c90dc8f5217147c6c3cfb99d952cfdcaf7e194e1
commit: 50d5bf1b6da9f74bf93f9dec601c09d45d6d8406 [2882/2882] x86: hugepage: use nt copy hugepage to AEP in x86
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250701/202507011441.j7rBaRlC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011441.j7rBaRlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011441.j7rBaRlC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/copy_highpages.c:20:5: warning: no previous prototype for function 'sysctl_hugepage_nocache_copy' [-Wmissing-prototypes]
      20 | int sysctl_hugepage_nocache_copy(struct ctl_table *table, int write,
         |     ^
   arch/x86/lib/copy_highpages.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | int sysctl_hugepage_nocache_copy(struct ctl_table *table, int write,
         | ^
         | static 
   1 warning generated.


vim +/sysctl_hugepage_nocache_copy +20 arch/x86/lib/copy_highpages.c

    19	
  > 20	int sysctl_hugepage_nocache_copy(struct ctl_table *table, int write,
    21			void __user *buffer, size_t *lenp, loff_t *ppos)
    22	{
    23		struct ctl_table t;
    24		int err;
    25		int state;
    26	
    27		if (write && !capable(CAP_SYS_ADMIN))
    28			return -EPERM;
    29	
    30		state = static_branch_unlikely(&hugepage_nocache_copy);
    31		t = *table;
    32		t.data = &state;
    33		err = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
    34		if (err < 0)
    35			return err;
    36		if (write)
    37			set_hugepage_nocache_copy(state);
    38		return err;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
