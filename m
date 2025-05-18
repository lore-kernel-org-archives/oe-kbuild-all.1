Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56273FC7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 02:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747534547; cv=none; b=QmQTOQeTFB+pTKv2+JYVfXPM0O+ZQcnf1HmRmM4whLEiAYG0/P928ZNhxwPjfanAyIsf6ONb0MNYtX1fTQ1r6YwQa8BITGurAh0Dh2V4s9Vczsy/1vBWJCzy/obmpJO1SHUHDsiH0FnQoWbb/S8nkFi8QODtsyFIrgImsFrwbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747534547; c=relaxed/simple;
	bh=PhVi5V0ZQ71dzODqhuZQ54vg/D7BaLBNe3u38FHMA50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5IZfkrHxLdNXiov296IXs+KYPcvP1lYiUkkODZHYt0jU7KMR0PZis7qoTBb9Tg2nGhSdH06fWGOp8uZrUWhcA0E/vQmz/PVBIOwg8NV7PwvJreM1Hq/WZXyMknenZmkDXW3vJ93pqzym9mcJnQdada07wUZ7ruUnPLytRmbSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWV301eC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWV301eC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747534546; x=1779070546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PhVi5V0ZQ71dzODqhuZQ54vg/D7BaLBNe3u38FHMA50=;
  b=KWV301eCnP5mhRrcJMJMHObWriDcEGaDgFKu9TasUxRnLmrXtkpFSyfK
   /c7VUZ84rM127P7L7fMA7pcqdnNLkQ24xVLrr9tN/r9d8kvcFeq3baGoV
   vSiwhTOu80Z4CFUMmJ+GsoyIJ01YgkV6/eZ8Vhat/d7FHt9tH4pZMRahf
   F82+T7dHYP1Zs6g+9i4i360yWg9EiuOJ4ABS2GeHpUoC9CmE4Kf4NaSIk
   oOSawKCfsYCGCFR5xt4Smaq/sBmQ0QSq1iU5w9DYQ+1rq6ph15j6/e4ut
   BwfDHOtythIVMCBuasxJl57av0RMxlNE9RrQbHJFVWWE+kLOPnq5iO+T0
   w==;
X-CSE-ConnectionGUID: fmFHPIjuSOO39aRbMn5bzQ==
X-CSE-MsgGUID: ppS/YIgoQciPpfNzD7nsGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="67018928"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="67018928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:15:45 -0700
X-CSE-ConnectionGUID: hhjVvAO4QUC9Ady1Ig5qIw==
X-CSE-MsgGUID: gNMJKMvnQeyHxLQIf9XTfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139087826"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 May 2025 19:15:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGTYy-000KZ5-2w;
	Sun, 18 May 2025 02:15:40 +0000
Date: Sun, 18 May 2025 10:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-startup-confine-v4 27/29]
 arch/x86/boot/startup/gdt_idt.c:50: undefined reference to
 `__pi_latent_entropy'
Message-ID: <202505181032.8PFF7Auc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-startup-confine-v4
head:   7e9d35c1bf625062baf388f87ff1dbd8979d7b4c
commit: f4769751e13d257902f1300859bf32aeeb75768d [27/29] x86/boot: Move startup code out of __head section
config: x86_64-buildonly-randconfig-003-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181032.8PFF7Auc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181032.8PFF7Auc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181032.8PFF7Auc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: Unexpected GOT entries detected!
   ld: arch/x86/boot/startup/gdt_idt.pi.o: in function `startup_64_setup_gdt_idt':
>> arch/x86/boot/startup/gdt_idt.c:50: undefined reference to `__pi_latent_entropy'
   ld: arch/x86/boot/startup/map_kernel.pi.o: in function `__startup_64':
>> arch/x86/boot/startup/map_kernel.c:73: undefined reference to `__pi_latent_entropy'
>> ld: arch/x86/boot/startup/map_kernel.c:200: undefined reference to `__pi_latent_entropy'


vim +50 arch/x86/boot/startup/gdt_idt.c

4cecebf200efea Ard Biesheuvel 2025-04-10  45  
4cecebf200efea Ard Biesheuvel 2025-04-10  46  /*
4cecebf200efea Ard Biesheuvel 2025-04-10  47   * Setup boot CPU state needed before kernel switches to virtual addresses.
4cecebf200efea Ard Biesheuvel 2025-04-10  48   */
f4769751e13d25 Ard Biesheuvel 2025-04-22  49  void __init startup_64_setup_gdt_idt(void)
4cecebf200efea Ard Biesheuvel 2025-04-10 @50  {

:::::: The code at line 50 was first introduced by commit
:::::: 4cecebf200efea0fc865b5656f6d12ead2eb5573 x86/boot: Move the early GDT/IDT setup code into startup/

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
