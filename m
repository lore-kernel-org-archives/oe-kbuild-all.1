Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA17483
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 02:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714010801; cv=none; b=M0SUshRsCUsPimIvZCXgMY9gvee7pM313JSGN5hz4t13yUoH0cZeuOUmF58CqCSeTmgxgSKAbuLcmShj+znPtchj6OThsbREGBFjqMov/E+srJcansNMm01hRkLKuoz1l79BTYBFtd97nK/mcLosKS7n2WwakPTzffrvdDRwpnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714010801; c=relaxed/simple;
	bh=IkALqTp5LM0QtRjWzTxVNV3/BojtSDj4pSC08ZJFOMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAMt5oStStFlMKrkkmfs86baNJoaY7PSRprMBZRQLVEiOExzt9dq3J4+LSHJLq0MqJyC8eNO4hRfTN3XZw7iKtaIUuf7NVzM2BT1GfMDT3jrwBAV6Nu/6DbF4Sezlr2CTOjRXJbX7k/aRrPJIrwCioCN7d4vuLWUjbEUMCTZz2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fkjqn4r/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fkjqn4r/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714010800; x=1745546800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkALqTp5LM0QtRjWzTxVNV3/BojtSDj4pSC08ZJFOMU=;
  b=Fkjqn4r/umW941RZEVO6BRkgOjJ3cpRgPhTw9TVEkdZukC+345blUhE+
   Cs9CzdSRQVQESeXTbAmPcIx6O+oE+uYWFPn+2I8sWu2fTz346l5NIjm6i
   skgYj7Wv+SqIMyrNi+zT7wKdkkE+Y8FkYPIHXM0VhaEPdwvKN0nyCefH9
   Z3aVBQhjv5T25Me8T1OKDYxuQaRxrTFC8kJjQLJQ3nke/phOxAq1Ef8RI
   dNxaUv+m+Mr1AYGHuV6Dem+2cGLyE7akzAyrOQ7mOopU1UdNYwPqpMllN
   Av71opwsvl22E5RuoCtV8fSdc8Up4R+3/fqCMikyv/arQKQss0MQbpifJ
   A==;
X-CSE-ConnectionGUID: VshNJGjQTcOnBAjOxSYEUw==
X-CSE-MsgGUID: 3VU1cPgzSwmSwDrvFQ8X3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32164410"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="32164410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 19:06:39 -0700
X-CSE-ConnectionGUID: o8jGWDkVQb6OLGb+oU9LxQ==
X-CSE-MsgGUID: VRPSpaFaRgKxvGdDb2sptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="29528386"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Apr 2024 19:06:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzoVP-0001qp-2P;
	Thu, 25 Apr 2024 02:06:35 +0000
Date: Thu, 25 Apr 2024 10:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13535/30000] mm/vmscan.c:3467:undefined
 reference to `kernel_swap_enabled'
Message-ID: <202404250936.oh8T8o87-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d25aa47f7625457e7ace24ad08e3450ee083e07a
commit: 79c68ab3280fab8ace1b10bf8eadce508ee89c3c [13535/30000] etmem: add original kernel swap enabled options
config: x86_64-randconfig-014-20240425 (https://download.01.org/0day-ci/archive/20240425/202404250936.oh8T8o87-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250936.oh8T8o87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250936.oh8T8o87-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: mm/vmscan.o: in function `kernel_swap_check':
>> mm/vmscan.c:3467:(.text+0x2961f): undefined reference to `kernel_swap_enabled'
>> ld: mm/vmscan.c:3467:(.text+0x2d6fc): undefined reference to `kernel_swap_enabled'
   ld: fs/proc/base.o:(.rodata+0x18c0): undefined reference to `proc_mm_idle_operations'
   ld: fs/proc/base.o:(.rodata+0x18e8): undefined reference to `proc_mm_swap_operations'
   ld: fs/proc/base.o:(.rodata+0x2420): undefined reference to `proc_mm_idle_operations'
   ld: fs/proc/base.o:(.rodata+0x2448): undefined reference to `proc_mm_swap_operations'
   ld: fs/proc/etmem_scan.o: in function `page_scan_entry':
   fs/proc/etmem_scan.c:1339:(.text+0x189): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1339:(.text+0x1b4): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1340:(.text+0x1c5): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1341:(.text+0x1e4): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1340:(.text+0x1f5): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.o:fs/proc/etmem_scan.c:1342: more undefined references to `proc_page_scan_operations' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +3467 mm/vmscan.c

  3459	
  3460	#ifdef CONFIG_ETMEM
  3461	/*
  3462	 * Check if original kernel swap is enabled
  3463	 * turn off kernel swap,but leave page cache reclaim on
  3464	 */
  3465	static inline void kernel_swap_check(struct scan_control *sc)
  3466	{
> 3467		if (sc != NULL && !kernel_swap_enabled())
  3468			sc->may_swap = 0;
  3469	}
  3470	#endif
  3471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
