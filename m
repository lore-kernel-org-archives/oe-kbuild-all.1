Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612990;
	b=tPWRpPs8NV2qBRVZfUhmb1ZZQ8CTqh45eP/JnccMBVDA2qUbgUIgj1qjaWVudGfs9v1T
	 5pDdsfG49EY7nHJYh3d437CM23z19MtEEY7SLTMHh0UvWjIPmjYiUcwfWJUfZyfHoHmfV
	 dA1lQZU+9X8cBdfxPZSo2omPzEbuclz3OeBKagkUq74aDjkNCoX/VLyR1329xPFE9mi6e
	 pOkYwWifJ4kihcr/x8JbPfNQXhbwIQzAXbnzBYaOQ6stpOibybuBo4CWp5RPlmLWEDCRM
	 HE3UP0aSAcCIo166RoGASBfh0+gbPmMQdFtSIfyXaXHaXsk2bqkVW+MisiZXLPozSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612990;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cw8Eo3s9hpBOpgZ1pVOautjWcYbl+YxD4YiNncEFUHg=;
	b=2udEGbqyGu4fpwfIDehpKDL2J4dGM1COjO9eiQv67ISnrKRTofkvwvkXhxmVR4l6lFLG
	 IWy7KBMHcnybetQh9bcsxmgNIjG55gGVrXF8Hd9qXQ01zTV4TLDj3RNt4KNKx3wyxPsvZ
	 JL5sxQyDoMO3iDunuPjnywhTTaZUYdibcJHr+KuNYYrEqkLPtU/0aIQ3BtOS9Q3sjglC3
	 zCODermRDIiEVLXASQt0YhVbagD4fI33LxMQFez6Dbw/qojS2YVofknmxS4QR2cG/0e3V
	 Ygj3aQxFNEql2Ow+wcZRrDd8AP3Iff9G+ksXLEvnbjYJKbkCSvTOyX1rgi7uJ0e8Rvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J6ycSjRq;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FEF606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 20:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FEF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J6ycSjRq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612990; x=1824148990;
  h=date:from:to:cc:subject:message-id;
  bh=IO3ri4k+idFpve9R/7SMnY245X5DxDhYfVV4QvpJljE=;
  b=J6ycSjRqErGtLjne3UbBZ81pX4sVinvV49PNzwcDEtsHCsb7NdQ2vuAe
   iim2hZymqTJXj+VPUIq/RyMPhx0wust8fDUHDpvf6m38uuS0n4CIKytLx
   ycc6hC96tZmFBcZjoNz04MFk/Lx6/8/1OE8NdXDMUQIai4jWal8M+30tf
   lvwx7ngglb6dXzxfNYp0YqaW/xgAY937TqnhGCapkbFGnFaOVMpA/kLTN
   s6Ys2bvsi5YRw3we2g+o0MMhrKVZQUtmwV/yp4JN/P5fpRvjdCsso/lWY
   4FxKpmzpC3E3S1P7W3ZWg4EYCWSKT9ShxxTtNE/5jcB9Xy52nweJhf6ik
   g==;
X-CSE-ConnectionGUID: 7LyJnwqkRou96gYyc0t3Cg==
X-CSE-MsgGUID: nF4l4aeARkSnCiB2ahDQVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1231236"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1231236"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:03:10 -0700
X-CSE-ConnectionGUID: i5z5+nhdTFeDyHwm5jldpQ==
X-CSE-MsgGUID: iSj0+PxuRiSghmnkNOFfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3096062"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 13:03:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJcWf-00000000Q1q-4AEe;
	Wed, 21 Oct 2026 20:03:05 +0000
Date: Thu, 22 Oct 2026 04:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-19 16/24]
 arch/x86/include/asm/thread_info.h:237:6: warning: no previous prototype for
 'arch_kernel_shstk_enabled'
Message-ID: <202610220331.gTfoHeL9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss-2026-10-19
head:   b28e7d03a8472efab137c77cbb5dd666fa08e9a7
commit: 967449663fb3eb7dcca67c4652293712530809c8 [16/24] arch-shadow-stacks-enabled
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20261022/202610220331.gTfoHeL9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220331.gTfoHeL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220331.gTfoHeL9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:62,
                    from include/linux/smp.h:118,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> arch/x86/include/asm/thread_info.h:237:6: warning: no previous prototype for 'arch_kernel_shstk_enabled' [-Wmissing-prototypes]
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:237:20: error: redefinition of 'arch_kernel_shstk_enabled'
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition of 'arch_kernel_shstk_enabled' with type 'bool(void)' {aka '_Bool(void)'}
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/arch_kernel_shstk_enabled +237 arch/x86/include/asm/thread_info.h

   236	
 > 237	bool arch_kernel_shstk_enabled(void)
   238	{
   239		return cpu_feature_enabled(X86_FEATURE_KERN_SHSTK);
   240	}
   241	#define arch_init_thread_stacks arch_init_thread_stacks
   242	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
