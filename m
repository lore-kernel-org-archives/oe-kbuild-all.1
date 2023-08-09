Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9962517FE2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691583216; x=1723119216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p7CExHZ3Z+Zpwwm4bO6V5r+DCzU5otB7dn/rYy8S6ak=;
  b=nyA2W1Ri1skxQkDMTmNFHvxmEnGCMyXfb7fcBm7X2hF4LnbpsgINo4BD
   KmQBJTLVAU8e8gpwMbnDJYecj3RMfSQPzDNub/T0+KJrRDBHAflRGU7f6
   IHK//boPG7Cavzu366mgs+Z8rhyHA4/oB04p/2dsSmXEF+o2fPPYEKrSI
   +NXHjqRXU3dBCX+LqDbxKgV05Ezuf0Fn4cM7Yt2RGbjL8ZpxM1fYZyOqa
   OyDciNJzCRD8JT29V/adifssga8nwFkEjOnw64DO2k97954ZZd9Tngqbg
   S3SDnTOgDQt7FM7bXIEtksU4jru8pIU44xoGu6mVu/8mwlq9Xpy4+5Aa+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="402070056"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="402070056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 05:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="761356894"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="761356894"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Aug 2023 05:13:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTi4B-00065o-2n;
	Wed, 09 Aug 2023 12:13:31 +0000
Date: Wed, 9 Aug 2023 20:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-runtime-cleanup 10/11]
 arch/x86/include/asm/efi.h:104:66: error: expected statement before ')'
 token
Message-ID: <202308092043.L5aR5MXx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-runtime-cleanup
head:   c71456a199541783dbb943e07547fc0d0c929ea2
commit: 9777a4479484a54a897205eef6dbe27675cb31e8 [10/11] efi/x86: Rely on compiler to emit MS ABI calls
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230809/202308092043.L5aR5MXx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092043.L5aR5MXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092043.L5aR5MXx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/efi/runtime-wrappers.c:36:
   drivers/firmware/efi/runtime-wrappers.c: In function 'efi_call_rts':
   drivers/firmware/efi/runtime-wrappers.c:297:40: error: expected identifier before '&' token
     297 |                 status = efi_call_virt(&args->ACPI_PRM_HANDLER,
         |                                        ^
   arch/x86/include/asm/efi.h:103:58: note: in definition of macro 'arch_efi_call_virt'
     103 |                 __builtin_types_compatible_p(typeof((p)->f(args)),void),\
         |                                                          ^
   drivers/firmware/efi/runtime-wrappers.c:297:26: note: in expansion of macro 'efi_call_virt'
     297 |                 status = efi_call_virt(&args->ACPI_PRM_HANDLER,
         |                          ^~~~~~~~~~~~~
   drivers/firmware/efi/runtime-wrappers.c:297:40: error: expected identifier before '&' token
     297 |                 status = efi_call_virt(&args->ACPI_PRM_HANDLER,
         |                                        ^
   arch/x86/include/asm/efi.h:104:31: note: in definition of macro 'arch_efi_call_virt'
     104 |                         ((p)->f(args), EFI_ABORTED), (p)->f(args));     \
         |                               ^
   drivers/firmware/efi/runtime-wrappers.c:297:26: note: in expansion of macro 'efi_call_virt'
     297 |                 status = efi_call_virt(&args->ACPI_PRM_HANDLER,
         |                          ^~~~~~~~~~~~~
   drivers/firmware/efi/runtime-wrappers.c:297:40: error: expected identifier before '&' token
     297 |                 status = efi_call_virt(&args->ACPI_PRM_HANDLER,
         |                                        ^
   arch/x86/include/asm/efi.h:104:59: note: in definition of macro 'arch_efi_call_virt'
     104 |                         ((p)->f(args), EFI_ABORTED), (p)->f(args));     \
         |                                                           ^
   drivers/firmware/efi/runtime-wrappers.c:297:26: note: in expansion of macro 'efi_call_virt'
     297 |                 status = efi_call_virt(&args->ACPI_PRM_HANDLER,
         |                          ^~~~~~~~~~~~~
>> arch/x86/include/asm/efi.h:104:66: error: expected statement before ')' token
     104 |                         ((p)->f(args), EFI_ABORTED), (p)->f(args));     \
         |                                                                  ^
   drivers/firmware/efi/runtime-wrappers.c:47:9: note: in expansion of macro 'arch_efi_call_virt'
      47 |         arch_efi_call_virt(efi.runtime, f, args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/runtime-wrappers.c:297:26: note: in expansion of macro 'efi_call_virt'
     297 |                 status = efi_call_virt(&args->ACPI_PRM_HANDLER,
         |                          ^~~~~~~~~~~~~


vim +104 arch/x86/include/asm/efi.h

    98	
    99	#undef arch_efi_call_virt
   100	#define arch_efi_call_virt(p, f, args...) ({				\
   101		u64 ret, ibt = ibt_save(efi_disable_ibt_for_runtime);		\
   102		ret = __builtin_choose_expr(					\
   103			__builtin_types_compatible_p(typeof((p)->f(args)),void),\
 > 104				((p)->f(args), EFI_ABORTED), (p)->f(args));	\
   105		ibt_restore(ibt);						\
   106		ret;								\
   107	})
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
