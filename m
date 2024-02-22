Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792144C73
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708560039; cv=none; b=DBNzue30Obiy/Y5s3BoLVtGu0yvezjwhBjSESonyAhjJ1LeUsyOFU7PosRjY6nOf+cbMEndekVjPzbvlAwa3Vb8tCY58Oqk+hUC/XskK5Ol8TKxrOlBbzZ3M1mKqC0VNVKES5D8xL5ZFJ3fOowLOm+gCaslhKp1/VlT5xaGqils=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708560039; c=relaxed/simple;
	bh=vIAUWffbpsiwmNW8GGLAf6g3DAhxpOWqsQ1hJDciehQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3SdwSbq++KmpHjsWH3GK1okgu12mo5nOrts5adPBF2A8XXKllSBpDd2jD3HpcPTU7mghSwM2eKq0HTq2FbQfcoYjTmj6a1AupR+lFevCug3W8hmNoD5x9TAk01+Vc0W14T0q9ffAvcWG+RoebpurofrqD9aZ40iFnk6nEcthQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0Ui/M6k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0Ui/M6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708560038; x=1740096038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIAUWffbpsiwmNW8GGLAf6g3DAhxpOWqsQ1hJDciehQ=;
  b=Q0Ui/M6kHRwBV1GEDGp8Xm/H5klRKF8lXEDuU0EuI50+lsDM1+ADSFOc
   6VxY5UtIKNByhwWcsaNxg6XbBZeEX5vh4npnybFvtWO2j/xsJSoTbXU80
   ctzeSPk5GpLx4g/LE9Qqg8GULzq+ChfipD9aCYXM6WhyF7IMyWuGPfVJ9
   +W4+9LspHp9aeqXtpKi6hEjeB9BnbgVLn7Eq9NFzFseMGIv0tWDKuhkZc
   xr6DnRM5domdU2b3l5RQ6uWRMbiQls7gWR+m9l9SAXAYykEPjjHGUCqiT
   LVw1qThDUq875QVPbtQI+XVHnHicWZS73WZUYjyXbJRI5c4PXh7vgRVMq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2866228"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2866228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 16:00:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5458136"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2024 16:00:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcwVW-0005o0-2L;
	Thu, 22 Feb 2024 00:00:17 +0000
Date: Thu, 22 Feb 2024 08:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mlankhorst:xe 1/9] kernel/printk/printk.c:2965:1: sparse: sparse:
 symbol 'printk_legacy_map' was not declared. Should it be static?
Message-ID: <202402220701.67E1l038-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~mlankhorst/linux xe
head:   3058d3ef744fec22fe3ecb11754cb0c7849ccb15
commit: 11eba233922d88a72241f11043ba4cbc60f5a244 [1/9] rc4-rt4
config: x86_64-randconfig-122-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220701.67E1l038-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220701.67E1l038-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220701.67E1l038-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/printk/printk.c:489:6: sparse: sparse: symbol 'have_nbcon_console' was not declared. Should it be static?
>> kernel/printk/printk.c:2965:1: sparse: sparse: symbol 'printk_legacy_map' was not declared. Should it be static?
   kernel/printk/printk.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   kernel/printk/printk.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/printk_legacy_map +2965 kernel/printk/printk.c

  2950	
  2951	/*
  2952	 * Legacy console printing from printk() caller context does not respect
  2953	 * raw_spinlock/spinlock nesting. For !PREEMPT_RT the lockdep warning is a
  2954	 * false positive. For PREEMPT_RT the false positive condition does not
  2955	 * occur.
  2956	 *
  2957	 * This map is used to establish LD_WAIT_SLEEP context for the console write
  2958	 * callbacks when legacy printing to avoid false positive lockdep complaints,
  2959	 * thus allowing lockdep to continue to function for real issues.
  2960	 */
  2961	#ifdef CONFIG_PREEMPT_RT
  2962	static inline void printk_legacy_lock_map_acquire_try(void) { }
  2963	static inline void printk_legacy_lock_map_release(void) { }
  2964	#else
> 2965	DEFINE_WAIT_OVERRIDE_MAP(printk_legacy_map, LD_WAIT_SLEEP);
  2966	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
