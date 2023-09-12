Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888917F4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 01:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694482936; x=1726018936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rd97u+UDokwVUnO2Fv0qHg5ZWFhiF2NlEyyvzNK1EuQ=;
  b=oAYimlxt3gRNxK/8HAwRmt8/vCqlru6kYOsBHI37fBiPiDMvJ35yYAXE
   HKG6aFEPwb85pthjink0n4k2WDeRCG7wUHDBgRsFU/bPg0pjewhdT6zOu
   1++jzw7QZAl3HV9T3jD8tNRdT0oxyH3nGLc39u7u1jui/Y/AtB8dUPtw4
   P9dDwUtMjDJ60fp37oAJ+ep5ko0g947NmPJ+91O+o2ZOyBlcWMceC1aVl
   CuUYIh1AvePuV3gV9QHwczXnpkAl+/EEmPIKMWDxbeBqQQBxJ2o/5WVPY
   WVHxl0PLXNuE4OSpD0vvgujz0+IPbP+rx+MCeCpaSzfTI7g/YvQB7gZ94
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363286058"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="363286058"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 18:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074376687"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="1074376687"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Sep 2023 18:42:06 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfsPk-00074t-1k;
	Tue, 12 Sep 2023 01:42:04 +0000
Date: Tue, 12 Sep 2023 09:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 261/321]
 arch/x86/include/asm/tdx.h:183:55: error: expected ';' before '}' token
Message-ID: <202309120932.6b4HCygU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   f6388449e0300e7413c7e2ea4875923875ddb340
commit: 3ff8b28b76c71d5e87fd02971c2c48e70fee10d9 [261/321] [REVERTME] debugfs to operation on TDX debug op
config: x86_64-randconfig-001-20230912 (https://download.01.org/0day-ci/archive/20230912/202309120932.6b4HCygU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120932.6b4HCygU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120932.6b4HCygU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:22:
   arch/x86/include/asm/tdx.h: In function 'tdx_is_enabled':
>> arch/x86/include/asm/tdx.h:183:55: error: expected ';' before '}' token
     183 | static inline bool tdx_is_enabled(void) { return false };
         |                                                       ^~
         |                                                       ;
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1792562771
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=1792562771
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1792562771
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1792562771
   make: Target 'prepare' not remade because of errors.


vim +183 arch/x86/include/asm/tdx.h

   172	
   173	struct tdsysinfo_struct;
   174	static inline const struct tdsysinfo_struct *tdx_get_sysinfo(void) { return NULL; }
   175	static inline bool platform_tdx_enabled(void) { return false; }
   176	static inline int tdx_cpu_enable(void) { return -ENODEV; }
   177	static inline int tdx_enable(void)  { return -ENODEV; }
   178	static inline void tdx_reset_memory(void) { }
   179	static inline bool tdx_is_private_mem(unsigned long phys) { return false; }
   180	static inline u32 tdx_get_nr_guest_keyids(void) { return 0; }
   181	static inline int tdx_guest_keyid_alloc(void) { return -EOPNOTSUPP; }
   182	static inline void tdx_guest_keyid_free(int keyid) { }
 > 183	static inline bool tdx_is_enabled(void) { return false };
   184	#endif	/* CONFIG_INTEL_TDX_HOST */
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
