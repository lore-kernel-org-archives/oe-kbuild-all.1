Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1D528421
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171361; cv=none; b=l5/rjK+y+M2ZArZqHZwTlW8pa4Y28o06oXA4Sx11b+6id8swMClHI5+9apmApyYtKVo648KAi+o9jP/djC6WXCU1rPXMipyB+rgJXxI6G6vQ3030QSGTz4HM3i5F81eVPjK4Lt+Dg/IfolvDQsaL0cVqxstGiXY+H3NbP2+qciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171361; c=relaxed/simple;
	bh=E+R9cX8itJsUYgV1Tdnfk1U9fdzczHzW8W8/uMDOGN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZZcJYYKTx8FoWPxwOAMRKg9RtexHx+4trC3OE545j6qFBWzenWGV1g1hj7LlA38BcqN/CIHaVUw6PbJhrED8zSbRJOL1cgvmk+468odG6C4bJsejYkMuJuDhWP7w9+VnBU6CqYvtWoNie2NO5qq36WIJ5USzohHnZ0LZkxr2dy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAmwRe+3; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAmwRe+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790171360; x=1821707360;
  h=date:from:to:cc:subject:message-id;
  bh=E+R9cX8itJsUYgV1Tdnfk1U9fdzczHzW8W8/uMDOGN4=;
  b=jAmwRe+3QYFQh9R/gN5DeQbzrgC/05cVfs9ga0+7rd/X0Wdu7s6vz2hO
   nIe7LHa5Ap3cU+3S4QvJMItsEXFJ2CMNgnOdyJKmz3xSKCIHUzkaqvqmt
   H1GPlaDdBYwBTsq8iw508JFJAl8dJhK3rU9RzgQSadJL4soipQPbXPsWv
   mLQB0BbqMsBHwd40g3ROpUWngoavy930aEbT4+tjQxc46VUd+fYAkW2CG
   ptiqxaIPoZgLbZasPbbyFaxMCcnQBbsRPONBpoqD9yAXVxkoK+dUj75Kf
   gaWwtpaOtBsAccIqwqHFEWAaBoyDRz/N7UfOX1qwSdwUPtgA3nHq+eh6H
   w==;
X-CSE-ConnectionGUID: t7ne7hpfSwS8I39Qqv/r0A==
X-CSE-MsgGUID: FVpNT+LrQvSQuAM5rsx6CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1362508"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1362508"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:49:19 -0700
X-CSE-ConnectionGUID: 6RM+V7s9Rea6Moq6LAJ50A==
X-CSE-MsgGUID: QIP1xnSeRGS7+lm7di6L/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272232553"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 06:49:17 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9NLV-000000000hd-1v7w;
	Wed, 23 Sep 2026 13:49:13 +0000
Date: Wed, 23 Sep 2026 15:49:10 +0200
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/x86/include/asm/microcode.h:30:1: warning: no return
 statement in function returning non-void
Message-ID: <202609231539.00cOgDJO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chang-S-Bae/cpu-hotplug-Allow-architecture-specific-primary-CPU-bringup/20260912-000807
head:   6292a940e059adcb75fbc062aef68030a1c893b8
commit: 6292a940e059adcb75fbc062aef68030a1c893b8 x86/microcode/intel: Enable uniform loading
date:   12 days ago
config: x86_64-randconfig-r2100-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231539.00cOgDJO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231539.00cOgDJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231539.00cOgDJO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/power/cpu.c:29:
   arch/x86/include/asm/microcode.h: In function 'microcode_disable_loader':
>> arch/x86/include/asm/microcode.h:30:1: warning: no return statement in function returning non-void [-Wreturn-type]
      30 | static inline bool __init microcode_disable_loader(void) { }
         | ^~~~~~


vim +30 arch/x86/include/asm/microcode.h

    18	
    19	#ifdef CONFIG_MICROCODE
    20	void load_ucode_bsp(void);
    21	void load_ucode_ap(void);
    22	void microcode_bsp_resume(void);
    23	bool __init microcode_loader_disabled(void);
    24	void __init microcode_disable_loader(void);
    25	#else
    26	static inline void load_ucode_bsp(void)	{ }
    27	static inline void load_ucode_ap(void) { }
    28	static inline void microcode_bsp_resume(void) { }
    29	static inline bool __init microcode_loader_disabled(void) { return false; }
  > 30	static inline bool __init microcode_disable_loader(void) { }
    31	#endif
    32	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
