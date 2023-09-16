Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027F1BDE3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694890099; x=1726426099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJ+CThD8Mq29MJVFla0/FYUZqROvlksmmH8HFbbrhx0=;
  b=b/5PtnBa6a+N9o8T6MKAnsFO8cIm2I5BGhfaDQN0Yjl36C3MnEIHkif3
   q2e9ZN8hTVFT82F9MPWBi5/he6B1Xzsgbx+vGh+SyOHzvIuwwiugb2CSo
   r0QgvnlSlhd5hHGGQ9U6lTKmxq1YzXIMKNnSkT4CfFck6+NWP9/TtNc2T
   o3L+joPjDn33YyR2A2VU33Jugzbru60SKtTzsj5+cIrKkpEYRt1kH5csT
   9mqkfXOjYeinRP0qggT8ZPOSQ4jv+XnlOJWT2Ad0DU0GOfWYi6WMUVTgc
   ghH+DmYtsD1fRI+y0QzF8zIVbLk69e8mFenIAX8c9rZRPQ4yplg29GekG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="379360835"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="379360835"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 11:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="695089850"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="695089850"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Sep 2023 11:48:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhaL0-0004ZV-34;
	Sat, 16 Sep 2023 18:48:14 +0000
Date: Sun, 17 Sep 2023 02:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 264/323]
 arch/x86/include/asm/tdx.h:212:55: error: expected ';' after return
 statement
Message-ID: <202309170249.mT2euhI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   5f6df2bb916b5aca21bbdc6962234979b1476ef1
commit: 8e9e638ff7940fca948ae6ddaaea541ad372d5dc [264/323] [REVERTME] debugfs to operation on TDX debug op
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230917/202309170249.mT2euhI0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170249.mT2euhI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170249.mT2euhI0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:22:
>> arch/x86/include/asm/tdx.h:212:55: error: expected ';' after return statement
   static inline bool tdx_is_enabled(void) { return false };
                                                         ^
                                                         ;
   1 error generated.


vim +212 arch/x86/include/asm/tdx.h

   201	
   202	struct tdsysinfo_struct;
   203	static inline const struct tdsysinfo_struct *tdx_get_sysinfo(void) { return NULL; }
   204	static inline bool platform_tdx_enabled(void) { return false; }
   205	static inline int tdx_cpu_enable(void) { return -ENODEV; }
   206	static inline int tdx_enable(void)  { return -ENODEV; }
   207	static inline void tdx_reset_memory(void) { }
   208	static inline bool tdx_is_private_mem(unsigned long phys) { return false; }
   209	static inline u32 tdx_get_nr_guest_keyids(void) { return 0; }
   210	static inline int tdx_guest_keyid_alloc(void) { return -EOPNOTSUPP; }
   211	static inline void tdx_guest_keyid_free(int keyid) { }
 > 212	static inline bool tdx_is_enabled(void) { return false };
   213	#endif	/* CONFIG_INTEL_TDX_HOST */
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
