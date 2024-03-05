Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67E51272D8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709653493; cv=none; b=SifJzZjX13xGo/27hJJSBvwv8bXgehsSLOoxU5kSAfwOH1POmAenEZNV7rvr/gpFEpcwhHugrLPsWbeW3s8AYoLXZJUGsg9rvB8h/zTMGME4Z0D0Fueu2RoVpKtkyWXYbpH2bcC9bG13sqPIDJLJWrFPE4s4ekUqazWtFfpFAnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709653493; c=relaxed/simple;
	bh=FyVRNTrTeHoe+YT/RRZ1WU2yOpIb8N3F+dmq+h8nUWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYACVeMiovxxzptWI26+6oQNy+u/1FwHtfxhEH6yUGFnyQFufBhGFN8SInkC4hI5kvAdcuBEkwWBMfz58HL6HhlKu/qLPRpfIYiSgkv38Uvxcz+uNxv6tGHaNhzxDnVZomAk9he3D5Whk7yafYU09EDucScXrSnw1S+oFjhH/0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XycjdyZY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XycjdyZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709653492; x=1741189492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FyVRNTrTeHoe+YT/RRZ1WU2yOpIb8N3F+dmq+h8nUWk=;
  b=XycjdyZYUBMNyCoJ28r5cjqkPSG9H989J8GcY1pQly43EXSSgbcMAaP3
   e2BRhr9L5Lg4/L4RbH4VQx267QxkqfrN63KgHt5eHFROmzJ4YRrCTIgV1
   Ti1jJIO+ZcQaI+KoGEbK4OpHNPa/rzH7lLK/cftTFiky8oauH55KM/dWE
   2TscfPu5LuvAscqWgmQv21ccUoCLMLIWdZI2OatZfqAqKwa9r6yzEMxEm
   JsU83rHeWNA4HTvvg24pMxXCm0keJsCE641TTUiS2h7kQNAC6d/M+SeLW
   Hs83vl5k5CCvAR5Az3K4g7aVliv9Ehi9UXlJxc90nKlcLUhjo49ov7H64
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4330296"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4330296"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 07:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14090659"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Mar 2024 07:44:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhWyD-0003Pl-0T;
	Tue, 05 Mar 2024 15:44:45 +0000
Date: Tue, 5 Mar 2024 23:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/sysctl.c:403:5: sparse: sparse: symbol
 'sysctl_enable_fast_copy_page' was not declared. Should it be static?
Message-ID: <202403052346.655rAhtL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 1c71eccbd7ef7f2b34209aad51c8a4d161cf976d arm64: fix NEON/VFP reentrant in fast_copy_page
date:   1 year ago
config: arm64-randconfig-r131-20240303 (https://download.01.org/0day-ci/archive/20240305/202403052346.655rAhtL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403052346.655rAhtL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052346.655rAhtL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl.c:403:5: sparse: sparse: symbol 'sysctl_enable_fast_copy_page' was not declared. Should it be static?
   kernel/sysctl.c:1723:36: sparse: sparse: undefined identifier 'vm_pagecache_limit_retry_times'
   kernel/sysctl.c:1724:42: sparse: sparse: undefined identifier 'vm_pagecache_limit_retry_times'
   kernel/sysctl.c:2757:5: sparse: sparse: symbol 'setup_pagecache_limit' was not declared. Should it be static?
   kernel/sysctl.c:2502:66: sparse: sparse: self-comparison always evaluates to false

vim +/sysctl_enable_fast_copy_page +403 kernel/sysctl.c

   400	
   401	#ifdef CONFIG_ARM64
   402	extern struct static_key_false fast_copy_page_enabled;
 > 403	int sysctl_enable_fast_copy_page(struct ctl_table *table, int write,
   404					void __user *buffer, size_t *lenp, loff_t *ppos)
   405	{
   406		struct ctl_table t;
   407		int err;
   408		int state = static_branch_likely(&fast_copy_page_enabled);
   409	
   410		if (write && !capable(CAP_SYS_ADMIN))
   411			return -EPERM;
   412	
   413		t = *table;
   414		t.data = &state;
   415		err = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
   416		if (err < 0)
   417			return err;
   418		if (write) {
   419			if (state)
   420				static_branch_enable(&fast_copy_page_enabled);
   421			else
   422				static_branch_disable(&fast_copy_page_enabled);
   423		}
   424		return err;
   425	}
   426	#endif
   427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
