Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399EF17C6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 05:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691211678; x=1722747678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hxxRlWXwCFRoJkbg3tYoyPxZ82HWVNpZ4btppfXHyDA=;
  b=BVBF0a0JbZ/WU0IBEYiQY4vzX/GAgygv2Y4dqU7ARKheaWqLCibANBEw
   /vGylQeEOTHeonzt/ykS6H/R4wON64iumCA7QDUssseV3S6BmJR2RHiew
   xTKlHR9RIvlmls1blFY6cSqlie/AEdR8j6lOZyMKU+sbDjgLWeY2qIjxr
   VdNDt8ArXnRq2iSR+53z0EQSw2if1+VC/q416Lv+VGSm6K5y+SOl6rWto
   I8kPM3M1AbNqrrk0uD6YdUVCc2fe+vC0GNBOuhd+lUpJU3J7TvHbY7NbQ
   CSC349HeLcqfE6nFbw8ubFfP9wfXU9fVpmuHUGBfyL1Vbg0SBQo2NwAkp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350599555"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="350599555"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 22:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="723903590"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="723903590"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Aug 2023 22:01:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS9Pf-0003KN-0S;
	Sat, 05 Aug 2023 05:01:15 +0000
Date: Sat, 5 Aug 2023 13:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 7/8] arch/x86/include/asm/mshyperv.h:251:12:
 warning: 'hv_snp_boot_ap' defined but not used
Message-ID: <202308051235.6ooe6dyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   3a5274c555c28bd6906103b0d9bbfd6e9e9df1ff
commit: 78812dcc77c23c72b019e517b296f15943922bd7 [7/8] x86/hyperv: Add smp support for SEV-SNP guest
config: i386-buildonly-randconfig-r005-20230731 (https://download.01.org/0day-ci/archive/20230805/202308051235.6ooe6dyM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051235.6ooe6dyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051235.6ooe6dyM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hv/channel.c:22:
   arch/x86/include/asm/mshyperv.h: In function 'hv_snp_boot_ap':
   arch/x86/include/asm/mshyperv.h:251:1: error: no return statement in function returning non-void [-Werror=return-type]
     251 | static int hv_snp_boot_ap(int cpu, unsigned long start_ip) {}
         | ^~~~~~
   arch/x86/include/asm/mshyperv.h: At top level:
>> arch/x86/include/asm/mshyperv.h:251:12: warning: 'hv_snp_boot_ap' defined but not used [-Wunused-function]
     251 | static int hv_snp_boot_ap(int cpu, unsigned long start_ip) {}
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/hv_snp_boot_ap +251 arch/x86/include/asm/mshyperv.h

   237	
   238	#ifdef CONFIG_AMD_MEM_ENCRYPT
   239	void hv_ghcb_msr_write(u64 msr, u64 value);
   240	void hv_ghcb_msr_read(u64 msr, u64 *value);
   241	bool hv_ghcb_negotiate_protocol(void);
   242	void __noreturn hv_ghcb_terminate(unsigned int set, unsigned int reason);
   243	void hv_vtom_init(void);
   244	int hv_snp_boot_ap(int cpu, unsigned long start_ip);
   245	#else
   246	static inline void hv_ghcb_msr_write(u64 msr, u64 value) {}
   247	static inline void hv_ghcb_msr_read(u64 msr, u64 *value) {}
   248	static inline bool hv_ghcb_negotiate_protocol(void) { return false; }
   249	static inline void hv_ghcb_terminate(unsigned int set, unsigned int reason) {}
   250	static inline void hv_vtom_init(void) {}
 > 251	static int hv_snp_boot_ap(int cpu, unsigned long start_ip) {}
   252	#endif
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
