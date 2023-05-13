Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC09A2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 02:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683944643; x=1715480643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eORSew7QDOHOivDkye7ekoIBL/4mLGjxsXIZrp4eWCw=;
  b=AOVhOpEuGfDJrDgbBksAWJ2vIzOLmEyFNHoAhOk2U1n0bSznBMTg+FkX
   Xy3MFg0TAJFSWCD+q4NbQKwbA64Ud5SB3FFhg0CMgsM22bQ+AiMzSN+1O
   JZIOnIBXru/k47vj0SN6IwvsbXORP91zycCx0osSbNKkK/1e5VPmMs+oy
   aWA05nDYuRKcdURKErMrfsEkmi8fZpUj69b1P67nfTKZWEfcnJNADYr40
   vY5gL8jRkdmf97RCyijpxl9aTAmUQitkNUuRx1A/jJzD7CU584VH3FLLq
   hxTwRQNH/2gWoBunOiACVgxjirTd5lhQWFCPJPTZl6ITtXxRHZq9CEiox
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="437254369"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="437254369"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 19:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769998568"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="769998568"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 May 2023 19:24:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxevQ-0005Fm-2s;
	Sat, 13 May 2023 02:24:00 +0000
Date: Sat, 13 May 2023 10:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-remove-mixed-mode 25/30] include/linux/efi.h:576:41:
 warning: initialization of 'const efi_config_table_t *' from 'long unsigned
 int' makes pointer from integer without a cast
Message-ID: <202305131018.3TGPQTGY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-remove-mixed-mode
head:   cd57f70012e67876ab331fb83fd05670727e44d1
commit: e078fe8a2777069c99a70bcfac840380d2bbf578 [25/30] efi: get rid of efi_table_attr()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230513/202305131018.3TGPQTGY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=e078fe8a2777069c99a70bcfac840380d2bbf578
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-remove-mixed-mode
        git checkout e078fe8a2777069c99a70bcfac840380d2bbf578
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/xen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131018.3TGPQTGY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/xen/efi.c:7:
>> include/linux/efi.h:576:41: warning: initialization of 'const efi_config_table_t *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     576 | #define EFI_INVALID_TABLE_ADDR          (~0UL)
         |                                         ^
   arch/x86/xen/efi.c:42:27: note: in expansion of macro 'EFI_INVALID_TABLE_ADDR'
      42 |         .tables         = EFI_INVALID_TABLE_ADDR  /* Initialized later. */
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/efi.h:576:41: note: (near initialization for 'efi_systab_xen.tables')
     576 | #define EFI_INVALID_TABLE_ADDR          (~0UL)
         |                                         ^
   arch/x86/xen/efi.c:42:27: note: in expansion of macro 'EFI_INVALID_TABLE_ADDR'
      42 |         .tables         = EFI_INVALID_TABLE_ADDR  /* Initialized later. */
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/xen/efi.c: In function 'xen_efi_probe':
>> arch/x86/xen/efi.c:62:31: warning: assignment to 'const efi_config_table_t *' from 'uint64_t' {aka 'long long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
      62 |         efi_systab_xen.tables = info->cfg.addr;
         |                               ^
   arch/x86/xen/efi.c: At top level:
   arch/x86/xen/efi.c:130:13: warning: no previous prototype for 'xen_efi_init' [-Wmissing-prototypes]
     130 | void __init xen_efi_init(struct boot_params *boot_params)
         |             ^~~~~~~~~~~~


vim +576 include/linux/efi.h

fe4db90a80cd12 Ard Biesheuvel 2020-01-23  575  
b2c99e3c70d77f Bjorn Helgaas  2006-03-26 @576  #define EFI_INVALID_TABLE_ADDR		(~0UL)
b2c99e3c70d77f Bjorn Helgaas  2006-03-26  577  

:::::: The code at line 576 was first introduced by commit
:::::: b2c99e3c70d77fb194df5aa1642030080d28ea48 [PATCH] EFI: keep physical table addresses in efi structure

:::::: TO: Bjorn Helgaas <bjorn.helgaas@hp.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
