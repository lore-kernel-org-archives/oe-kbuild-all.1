Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525417D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682658260; x=1714194260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YJu8k++Waeij4djvBTthlaoXOCW+weqORWJgqAwFueI=;
  b=I7tHyy20euQODA0t5iI4/Gr+VcYhQV1pFIs9U+Wgq7tISgX2cqzRHOV5
   ZOV7sRHFbp0VAsUOjUS+pfP8Ykcn5JVqEFIdH1vaICfK2CfrRRb2GdHCw
   Srl7PfoT4raix7ns9hdpM2Gb9BfSMVOg4JI9IOs+WuT64SgyNAxZJkZ8s
   92yCyX/+cippMocxKs2OAIqGI8B/lYUD87eBmwQdm711nP11OQfsjf+Ef
   at4r+coSjepPe7bDCni8T/DsIQFd/Iiu9DjsuK63LAvjMAvlUdCQbdGHq
   kpmqwhRE3QS3Sa5F3WumUlLbF24JDNx1H7R2AB+i1WTkb7VSxHc5gb1Re
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336692052"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="336692052"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 22:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="869016068"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="869016068"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 22:04:19 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psGHK-00008b-3A;
	Fri, 28 Apr 2023 05:04:18 +0000
Date: Fri, 28 Apr 2023 13:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:for-next 72/73] ld: efi-stub-helper.c:undefined reference to
 `efi_icache_sync'
Message-ID: <202304281228.2QdOAd3v-lkp@intel.com>
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
commit: a43274a086691ea4083380047174e623c666c62e [72/73] riscv: libstub: Implement KASLR by using generic functions
config: i386-randconfig-a014 (https://download.01.org/0day-ci/archive/20230428/202304281228.2QdOAd3v-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=a43274a086691ea4083380047174e623c666c62e
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer for-next
        git checkout a43274a086691ea4083380047174e623c666c62e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281228.2QdOAd3v-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: Unexpected GOT/PLT entries detected!
   ld: Unexpected run-time procedure linkages detected!
   ld: Unexpected run-time relocations (.rel) detected!
   ld: drivers/firmware/efi/libstub/efi-stub-helper.stub.o: in function `efi_kaslr_relocate_kernel':
   efi-stub-helper.c:(.text+0xc0e): undefined reference to `efi_get_kimg_min_align'
>> ld: efi-stub-helper.c:(.text+0xd77): undefined reference to `efi_icache_sync'
   ld: arch/x86/boot/compressed/vmlinux: hidden symbol `efi_icache_sync' isn't defined
   ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
