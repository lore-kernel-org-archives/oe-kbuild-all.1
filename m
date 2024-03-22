Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B272311713
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711092623; cv=none; b=gTzSDkLS8b8vnJscEscs6uW63199kXDN+AHHyhan+6uBrOkGQDwr9LrqFnfiAcyTv1jNMouCg2lwimZHNg8AEJleF7SSmUBjlLrrjwRQcDfMjHdP/Oifh91OsqibbRR30A7VhNx3FO3CukPGrczrgMPS85PEFeVL2/jG88tNiDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711092623; c=relaxed/simple;
	bh=XCmeev7FCNN1LxxgkEvK7tfHEcJngUZI4+6Drhia3CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j5lb14jzKWh3XMMqyBimxO9pj9BYJ6ukpJcV8Bu6N3099/JwnCi0ueIu4OFebVDrBK1z82bkroAVPleYATSPNVnugxSs6tkQy4cxu1GXSc8y3o7ij85qig0/LmD+BOLw1rAGNfZLua0gtV117FudK/SxOGsVZpZJINLHf37UMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZyd/rtF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZyd/rtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711092621; x=1742628621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XCmeev7FCNN1LxxgkEvK7tfHEcJngUZI4+6Drhia3CA=;
  b=PZyd/rtFebvUvPgDnkh/fyjvzfjJAmNyuasb2izmhWEjvZrTBjuQnKF1
   cFYWydhQIjSFznMGneHZ3MCGMbQfvqtPaYqnsJnokQVEuXTYD2gBeQzBu
   1cvLHz+SWlAHWZdKUE0kM/aR5/MlyyHn6WZS9SOlWsbasRqUEk8WOybX5
   vrioaoqnqcD9z0AwGxu0XsqeZ0TA9Wkq2186Y7sFRDYdHmIwuUY9Yfb8t
   Fhxa3KTV6bm/tg7jyvoiXrE5RmJ1oGGczvx31e8VnsZ238tCbAYoVWXgq
   u5qCupYZW/iDKW4ivfAUSc06of8ZQHvuHyajVbqENT4C3/5T0L2GaLfFj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9077488"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9077488"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 00:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="52234896"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Mar 2024 00:30:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnZLx-000K7b-20;
	Fri, 22 Mar 2024 07:30:13 +0000
Date: Fri, 22 Mar 2024 15:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-remove-absolute-percpu 3/5]
 arch/x86/kernel/cpu/common.c:762:22: error: implicit declaration of function
 'per_cpu_offset'; did you mean 'percpu_ref_get'?
Message-ID: <202403221505.WUAeQdeS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-remove-absolute-percpu
head:   811d6eeae9abffb646afa9c418d4658e6d91cdd6
commit: 82b7a620962b18edb7cb6eaca34fd0bd06073611 [3/5] x86/percpu: Get rid of absolute per-CPU variable placement
config: x86_64-buildonly-randconfig-001-20240321 (https://download.01.org/0day-ci/archive/20240322/202403221505.WUAeQdeS-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403221505.WUAeQdeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403221505.WUAeQdeS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/common.c: In function 'switch_gdt_and_percpu_base':
>> arch/x86/kernel/cpu/common.c:762:22: error: implicit declaration of function 'per_cpu_offset'; did you mean 'percpu_ref_get'? [-Werror=implicit-function-declaration]
     wrmsrl(MSR_GS_BASE, per_cpu_offset(cpu));
                         ^~~~~~~~~~~~~~
                         percpu_ref_get
   cc1: some warnings being treated as errors


vim +762 arch/x86/kernel/cpu/common.c

   733	
   734	/**
   735	 * switch_gdt_and_percpu_base - Switch to direct GDT and runtime per CPU base
   736	 * @cpu:	The CPU number for which this is invoked
   737	 *
   738	 * Invoked during early boot to switch from early GDT and early per CPU to
   739	 * the direct GDT and the runtime per CPU area. On 32-bit the percpu base
   740	 * switch is implicit by loading the direct GDT. On 64bit this requires
   741	 * to update GSBASE.
   742	 */
   743	void __init switch_gdt_and_percpu_base(int cpu)
   744	{
   745		load_direct_gdt(cpu);
   746	
   747	#ifdef CONFIG_X86_64
   748		/*
   749		 * No need to load %gs. It is already correct.
   750		 *
   751		 * Writing %gs on 64bit would zero GSBASE which would make any per
   752		 * CPU operation up to the point of the wrmsrl() fault.
   753		 *
   754		 * Set GSBASE to the new offset. Until the wrmsrl() happens the
   755		 * early mapping is still valid. That means the GSBASE update will
   756		 * lose any prior per CPU data which was not copied over in
   757		 * setup_per_cpu_areas().
   758		 *
   759		 * This works even with stackprotector enabled because the
   760		 * per CPU stack canary is 0 in both per CPU areas.
   761		 */
 > 762		wrmsrl(MSR_GS_BASE, per_cpu_offset(cpu));
   763	#else
   764		/*
   765		 * %fs is already set to __KERNEL_PERCPU, but after switching GDT
   766		 * it is required to load FS again so that the 'hidden' part is
   767		 * updated from the new GDT. Up to this point the early per CPU
   768		 * translation is active. Any content of the early per CPU data
   769		 * which was not copied over in setup_per_cpu_areas() is lost.
   770		 */
   771		loadsegment(fs, __KERNEL_PERCPU);
   772	#endif
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
