Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0BC19C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 02:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682649496; x=1714185496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fym2DDvuBuTm6gkmupVU9Kksc8aF1e8aG4lcMzW6SZI=;
  b=Ibllx2UQzG1V2V6kisKbrcAcEi56YgF6Utf5iWp3OL9yeWpxqLcDvTq5
   1bCF8rMlLvwAA8oUfbw1qvflhcaeINeKfaS6W7aLTZHoQicJPoqXorNvq
   +PQZoT+avmHxufc1Xsms7tNbG2ZJxMNuDtDToGigSnAFDRXO/tC5V+491
   yfgS+zUHspnoqN+azTb+5wcbplmUKFpYdcOFToz7GG4gHwIvEPji0QDBp
   zbzKj5JpnunzTdVlP1NI/MRX4iVd2i3RPk3hX2MBx+QYDi1Mog8TmI8Ob
   eo5x7f8vjkZEBGdIPUmmdHzduE88rsB7WSghoAsPvPRS/jxBjGTYW4E/I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349650546"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="349650546"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 19:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="1024403278"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="1024403278"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Apr 2023 19:38:14 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psDzx-00001t-30;
	Fri, 28 Apr 2023 02:38:13 +0000
Date: Fri, 28 Apr 2023 10:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:for-next 71/73] efi-stub-helper.c:undefined reference to
 `efi_get_kimg_min_align'
Message-ID: <202304281058.pDPrNgyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   6ea13757cbd6077ce0a7f54c80f9a75ec16e14d1
commit: 17e3193214a13b77e1ce3ec38d819904da2ab7a8 [71/73] arm64: libstub: Move KASLR handling functions to efi-stub-helper.c
config: i386-randconfig-a014 (https://download.01.org/0day-ci/archive/20230428/202304281058.pDPrNgyU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=17e3193214a13b77e1ce3ec38d819904da2ab7a8
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer for-next
        git checkout 17e3193214a13b77e1ce3ec38d819904da2ab7a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281058.pDPrNgyU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/efi-stub-helper.c: In function 'efi_kaslr_relocate_kernel':
>> drivers/firmware/efi/libstub/efi-stub-helper.c:825:30: warning: implicit declaration of function 'efi_get_kimg_min_align' [-Wimplicit-function-declaration]
     825 |         u64 min_kimg_align = efi_get_kimg_min_align();
         |                              ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/efi/libstub/efi-stub-helper.c:845:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     845 |                            (u64)_end < EFI_ALLOC_LIMIT) {
         |                            ^
   drivers/firmware/efi/libstub/efi-stub-helper.c:868:9: warning: implicit declaration of function 'caches_clean_inval_pou' [-Wimplicit-function-declaration]
     868 |         caches_clean_inval_pou(*image_addr, *image_addr + kernel_codesize);
         |         ^~~~~~~~~~~~~~~~~~~~~~
--
>> ld: Unexpected GOT/PLT entries detected!
>> ld: Unexpected run-time procedure linkages detected!
>> ld: Unexpected run-time relocations (.rel) detected!
   ld: drivers/firmware/efi/libstub/efi-stub-helper.stub.o: in function `efi_kaslr_relocate_kernel':
>> efi-stub-helper.c:(.text+0xc0e): undefined reference to `efi_get_kimg_min_align'
   ld: efi-stub-helper.c:(.text+0xd79): undefined reference to `caches_clean_inval_pou'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
