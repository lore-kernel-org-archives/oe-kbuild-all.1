Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA546405C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708703646; cv=none; b=XaIR4SGNYyuoP1KbWPg0G4q03oFRcKRzAtO5i2zjEtzfyRL9RZevUzZeqUhKoYv8f+bjV0OxvVmpij4izxhhx0ia16BkC0KBbHucalavXKXXRU1lxHhI2wkeeI/8R6bXBX0yr3uiKhxsvlIRA4Gb9aGXYdpGwNHDes1HlwHc8f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708703646; c=relaxed/simple;
	bh=K9u+88K+WbFyexJitlPQ/YYRWzhaaMmQfKd6W8W+Jos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CFcUk6KWRSOOeKKtLYC/boZTiY1E3MWhuhedY7CVd4mNbc0i0wvQCSjrblEUzaFNc/9rpdPE6NgdEuAzsoJn1gHLOk8L+cak+yAQPcER32KD2jY0Wugp+2tJp5nriFcVZt9q23i7v9CERj67oPmPvdAeGMNx2sVbPp0FLHe8kdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVmswrrP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVmswrrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708703643; x=1740239643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9u+88K+WbFyexJitlPQ/YYRWzhaaMmQfKd6W8W+Jos=;
  b=iVmswrrPYTp/8p+3XPkv/gm5zLX5uiAcapr+aB19N5V0x9FD6rXhHkvf
   2uVxNGp8Gtbt+jaXcYbluN9AEr8MzDx1PBAd0Pl8xdpXi89SEyA7qr6n5
   6QzBTHrWxX6MMGxy71UtEVtU6tc85wys82/sdl+HUnwzb3JbK38rG2RTl
   WkCpACAehHXL0VgHdGLUlxDN63yTr0yIlzzOJA8AOjD20/faTUP4GxEZl
   AW0KT4Q2yKwnhMfc0rC76GBqlX04tj6+YQiu4y5ajDkZuPc9F3w9m+dki
   zvuKnFKXvS5sxAXDxyKLWQezcgAYdMzkxpE/BYGD1hW1BlxUodpTxTTSj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2938220"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2938220"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:54:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="10608250"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Feb 2024 07:53:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdXs5-0007dA-1i;
	Fri, 23 Feb 2024 15:53:57 +0000
Date: Fri, 23 Feb 2024 23:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/sysctl.c:403:5: warning: no previous prototype for
 'sysctl_enable_fast_copy_page'
Message-ID: <202402232323.Jz0fwDDY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi soonflywang,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 1c71eccbd7ef7f2b34209aad51c8a4d161cf976d arm64: fix NEON/VFP reentrant in fast_copy_page
date:   1 year ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240223/202402232323.Jz0fwDDY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402232323.Jz0fwDDY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402232323.Jz0fwDDY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sysctl.c:403:5: warning: no previous prototype for 'sysctl_enable_fast_copy_page' [-Wmissing-prototypes]
     403 | int sysctl_enable_fast_copy_page(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:2757:5: warning: no previous prototype for 'setup_pagecache_limit' [-Wmissing-prototypes]
    2757 | int setup_pagecache_limit(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec_max_map_count':
   kernel/sysctl.c:3122:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3122 |         struct do_proc_dointvec_minmax_conv_param param = {
         |         ^~~~~~


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
