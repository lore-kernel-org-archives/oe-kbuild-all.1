Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1E12DD97
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713561440; cv=none; b=vCi0k0ClvKujifnq7taFBZ4xfNpyENfpYKXVQGRRpIGQLAn6SJQNe/53iQwqL9ZAm4P3Y/1Lb9lp/4nKpb2MLg9F7EirdPZnWMmsmYojh3mV2KkXn9rzW2zWZWfOZ4GTgEtXQSojrTJWh7eMw73p7JXgZ9MKfivJP46bSDIjTNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713561440; c=relaxed/simple;
	bh=Q275GlKJX9I/ZhCBZeerw8cRw4yJuwHBBW/4XSS3qks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2EZbDd51k37uzFdJFlJD0wnF2tu+nh/ZxHcaWC+KzXVV3qj9I38pFDRp1veyWDBaThi3O+SeSS9lX/m/XXg4o9DagO9Ft/ioT69TLYa1Glqg7lWXjSBXIPQDLL4HbRt1C3DiWWvscUmusG5/jzvcAyrToeSD1mokdnx/Ptl7Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bboXmo0h; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bboXmo0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713561438; x=1745097438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q275GlKJX9I/ZhCBZeerw8cRw4yJuwHBBW/4XSS3qks=;
  b=bboXmo0huJjcVJwUpHWNNq4DcyNlQzepemThjudHqDQSc9Qb2YkLEkne
   nH5IYNUc9JfT7uTaJRsOVbLaEqjHRf5TFaOoD50UYRog2Rp0ueDdRRWTe
   KAmtv2HORYQRBDeugT+wQ95PYbTWQc7B2J8heracEwZE738e4jlG0kBAa
   zdlwOGISHEWWPJ3L50wE7g8O4Y4v6+7vsesmHelRchGWDMZZ8nyAaGfrk
   4UBqLd4/n51ilQ1sYukIRPG2pfRvutQ3jFoHHKK7rtzkfDwmQiPogUaSf
   iXWpPeyaZ+Bml1qnvl/qeoF9IT6eJvHmcj0gFgCnWpQ8CZsvCa1+AqNlf
   w==;
X-CSE-ConnectionGUID: AxoLrxZ1RSOqdGG/Hu2OPQ==
X-CSE-MsgGUID: nbVz8IqPSs+mUifn8HhvHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9402964"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9402964"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 14:17:17 -0700
X-CSE-ConnectionGUID: 3N6kcv/bRhOGMwirOXBCHw==
X-CSE-MsgGUID: nELb2BY2QVyXcIdvMYdgiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="28099101"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Apr 2024 14:17:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxvbe-000ASk-1B;
	Fri, 19 Apr 2024 21:17:14 +0000
Date: Sat, 20 Apr 2024 05:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tdx-fixes 23/23] arch/x86/include/asm/coco.h:28:17:
 error: expected identifier or '(' before numeric constant
Message-ID: <202404200535.YMdL1Zx2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tdx-fixes
head:   c4646a88b2e25d777404d7f29fe093031e75456d
commit: c4646a88b2e25d777404d7f29fe093031e75456d [23/23] x86/tdx: Preserve shared bit on mprotect()
config: i386-buildonly-randconfig-001-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200535.YMdL1Zx2-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200535.YMdL1Zx2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200535.YMdL1Zx2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable.h:23,
                    from arch/x86/include/asm/tlbflush.h:16,
                    from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/tpm.h:23,
                    from drivers/char/tpm/tpm.h:27,
                    from drivers/char/tpm/tpm2-cmd.c:14:
   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_find_cc':
>> arch/x86/include/asm/coco.h:28:17: error: expected identifier or '(' before numeric constant
      28 | #define cc_mask 0
         |                 ^
   drivers/char/tpm/tpm2-cmd.c:780:13: note: in expansion of macro 'cc_mask'
     780 |         u32 cc_mask;
         |             ^~~~~~~
>> drivers/char/tpm/tpm2-cmd.c:783:17: error: lvalue required as left operand of assignment
     783 |         cc_mask = 1 << TPM2_CC_ATTR_VENDOR | GENMASK(15, 0);
         |                 ^


vim +28 arch/x86/include/asm/coco.h

    22	
    23	u64 cc_mkenc(u64 val);
    24	u64 cc_mkdec(u64 val);
    25	void cc_random_init(void);
    26	#else
    27	#define cc_vendor (CC_VENDOR_NONE)
  > 28	#define cc_mask 0
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
