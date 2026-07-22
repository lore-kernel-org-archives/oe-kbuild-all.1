Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6F63612F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 01:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682497; cv=none; b=O4g3/u7wcvb2idkI7/63WSJu/SLF8DAFjOzHCq+jUQj5Og/rZ13v9CLJk4OwpJgreqhM1MlCyioHDklFEi1jiJKeyJ8edcPXoRMwEj4SNwBqjqTTEEn/yfFmwDP0LCXyMdwVypeQa1RV2m/7gVcjOp41cy3L0wmVZc4V+B7QWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682497; c=relaxed/simple;
	bh=/DZ+JpKtpC0OLs4SoKs16r5yPudUxz+EzslZ5Fi6IBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uUxy/bLkGCzi5aEI3aPQfzPto0q1RBvSBEeQuE5ba1MYaq/q7j7J6Wr1yq8pzHTRtmbziLq3LXcy8lsTi0rNl38zc4/kaqMQs45hcK4/23R5r2KDEDhBaXaGBkZOWdJr488JAT1X5BYhICcmuDYi5aKvH3TY9tGIdBsDW/g6Xj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gl0lBavC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gl0lBavC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784682494; x=1816218494;
  h=date:from:to:cc:subject:message-id;
  bh=/DZ+JpKtpC0OLs4SoKs16r5yPudUxz+EzslZ5Fi6IBk=;
  b=Gl0lBavCOTG5vM5eqLSYbb66ir9FDGNLKTYOMl3QMNiC//Sz+k3Yjj8j
   89h3Omq4haSakRdzdRN/tczGHe++bNQi3iXOFHcaPCpzb2CWScUJ1xhFA
   SJPGLbDO/KkAXZxF1p4jJcVrVcU8DNE3Qs4Y8ZYaG11T6kdIOEwpQxBTL
   fA0fKW8vQbdLCAn+xyrGxFKAFwcK93tEL+D/rM20odaIPABj2SteoWaSU
   YFccUUdxteKOBMEqbWNPIrP8Sklmkc8+h9ZaZTFvavlH1WKmhGcjeA7tt
   SceCC9RrO8dmUZuncU5njoXhufRT6jNFgebeWyxb/CLOpwg4PTZaFVbcd
   Q==;
X-CSE-ConnectionGUID: n8YlDOqsQTaR89a7T9M8zA==
X-CSE-MsgGUID: +12ObM6GTN+DSekswzgIug==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95958405"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="95958405"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 18:08:14 -0700
X-CSE-ConnectionGUID: taD29I4uRECGSpn1mQ24sw==
X-CSE-MsgGUID: i0R4WgMGSc2PbUa6BGE7pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="262873708"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2026 18:08:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmLRS-00000000YFl-22ir;
	Wed, 22 Jul 2026 01:08:10 +0000
Date: Wed, 22 Jul 2026 09:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 192/192]
 drivers/android/android_debug_symbols.c:56:9: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <202607220816.o6HMNLrO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   b3c531e1677cf574dd7ffc9bfce3a298c74ef2f8
commit: bb732365f7ad44aab1eaed253cd130f9b49679da [192/192] ANDROID: android: Create debug_symbols driver
config: arm64-randconfig-r123-20260716 (https://download.01.org/0day-ci/archive/20260722/202607220816.o6HMNLrO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607220816.o6HMNLrO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220816.o6HMNLrO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:56:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +56 drivers/android/android_debug_symbols.c

    50	
    51	/*
    52	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    53	 */
    54	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    55	#ifdef CONFIG_ARM64
  > 56		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    57	#endif
    58	#ifdef CONFIG_X86
    59		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    60	#endif
    61	};
    62	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
