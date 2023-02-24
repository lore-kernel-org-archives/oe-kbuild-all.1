Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443022902
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677229966; x=1708765966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KzzkdPJCQ6IsAsPzjGN2NXI3wLlWpWtaVJzybrbur3Q=;
  b=jwu1BepU7MHXcn0Re39THt/7xIDkyCxdZ+rcoWXxkVKn72fau6ZTQPT7
   GxsiPp8Cbs2vif8DuKGvfBj0g8qb0aMrvZsKRVm7w+ib939UHFp3oDG94
   hESbO2hHswBkj09EbzmWT6lbjsCwnIaC5fTqJxo4GueTSJnRKYZ21327p
   ofLkF/2hmPzVSObWvnToHdtBLqbAKnUJWJY5RQCdua/ci7ITnNemnk6KA
   lbbPHw8w0PpsWeRjrmJC313B4ZxhCCp+FoDgklE53oVl5gLgVltpcZqeC
   I2wwCBrrGDDwFnr1gTjGlzgcvcwxKSpxN8LOaxv7l/0jdYOk7J7lJDI+M
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="321631945"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="321631945"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 01:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="796675897"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="796675897"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Feb 2023 01:12:45 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVU8C-0002IL-1D;
	Fri, 24 Feb 2023 09:12:44 +0000
Date: Fri, 24 Feb 2023 17:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 5/5] arch/arm64/mm/ptdump.c:396:25: error:
 'KIMAGE_START_NR' undeclared
Message-ID: <202302241728.Le3UPBbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   598740ce69a5b773ad978c3d14328fe8ec0ec8f6
commit: 598740ce69a5b773ad978c3d14328fe8ec0ec8f6 [5/5] arm64: kaslr: Use dedicated region for randomized kernel image
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302241728.Le3UPBbn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=598740ce69a5b773ad978c3d14328fe8ec0ec8f6
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout 598740ce69a5b773ad978c3d14328fe8ec0ec8f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241728.Le3UPBbn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/ptdump.c: In function 'ptdump_init':
>> arch/arm64/mm/ptdump.c:396:25: error: 'KIMAGE_START_NR' undeclared (first use in this function)
     396 |         address_markers[KIMAGE_START_NR].start_address = VMALLOC_END;
         |                         ^~~~~~~~~~~~~~~
   arch/arm64/mm/ptdump.c:396:25: note: each undeclared identifier is reported only once for each function it appears in


vim +/KIMAGE_START_NR +396 arch/arm64/mm/ptdump.c

   388	
   389	static int __init ptdump_init(void)
   390	{
   391		address_markers[PAGE_END_NR].start_address = PAGE_END;
   392	#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
   393		address_markers[KASAN_START_NR].start_address = KASAN_SHADOW_START;
   394	#endif
   395		address_markers[VMALLOC_END_NR].start_address = VMALLOC_END;
 > 396		address_markers[KIMAGE_START_NR].start_address = VMALLOC_END;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
