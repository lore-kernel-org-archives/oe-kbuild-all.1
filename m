Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FE7171D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687274666; x=1718810666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DOHe+47gfRN5BZ5ekGR5K3lF5AMvQ6FsxkfYr+Tdp6Q=;
  b=AKTTHxtkyVbUZtyz9HLnftcCpBKUtyrWhuJ6SD+06a4R7seMk4/48gbp
   u2EVPhzvISJHUz0X2dWxlrw3WgTJJOoapxSjzXB9xCODqW6fdT/+ClkZE
   OLe7jOhUtyQ/5cU/p+a1k89eT811zLE+STtGF/npLVPxT7d12ugSSTPFr
   GCbpIoJ1bJyISRBmS2EsW/Helsv8pC107TTw0DFslZsG5xJZc9AkueyLD
   ZYN7ll1X813HsbF7sGqTsAjSi+jRuH1XEzqUcwRB7U9dwV/7pT9ktre+5
   t43ezoaUMQkRvHKVitqTYrOFfuiKj9RYsZaHD+uP3uscHbvR60OmHKBOm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340230642"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="340230642"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 08:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="708320969"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="708320969"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jun 2023 08:24:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBdDT-00060O-1g;
	Tue, 20 Jun 2023 15:24:23 +0000
Date: Tue, 20 Jun 2023 23:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 29/37]
 drivers/gpu/drm/i915/intel_engine_cs.c:1014:24: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202306202300.lFgchrQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   a9728f9d57d7458743dad615048675784738fe7e
commit: 767336b68f8a3096aa690b9799357245895a8ea8 [29/37] BACKPORT: drm/i915: store all subslice masks
config: i386-randconfig-s002-20230620 (https://download.01.org/0day-ci/archive/20230620/202306202300.lFgchrQ2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202300.lFgchrQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202300.lFgchrQ2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/intel_engine_cs.c:1014:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int x @@     got unsigned char const * @@
   drivers/gpu/drm/i915/intel_engine_cs.c:1014:24: sparse:     expected int x
   drivers/gpu/drm/i915/intel_engine_cs.c:1014:24: sparse:     got unsigned char const *
   drivers/gpu/drm/i915/intel_engine_cs.c: In function 'gen9_wa_init_mcr':
   drivers/gpu/drm/i915/intel_engine_cs.c:1014:17: warning: passing argument 1 of 'ffs' makes integer from pointer without a cast [-Wint-conversion]
     subslice = ffs(sseu->subslice_mask);
                    ^~~~
   In file included from include/linux/bitops.h:19:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:19,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/seq_file.h:7,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/i915/intel_engine_cs.c:25:
   arch/x86/include/asm/bitops.h:413:28: note: expected 'int' but argument is of type 'const u8 * {aka const unsigned char *}'
    static __always_inline int ffs(int x)
                               ^~~
   In file included from include/drm/drm_print.h:29:0,
                    from drivers/gpu/drm/i915/intel_engine_cs.c:25:
   drivers/gpu/drm/i915/intel_engine_cs.c: In function '__intel_engine_context_size':
   include/linux/compiler.h:77:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
    # define unlikely(x) __builtin_expect(!!(x), 0)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:115:2: note: in expansion of macro 'unlikely'
     unlikely(__ret_warn_on);     27-  ^~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:43:25: note: in expansion of macro 'WARN'
    #define MISSING_CASE(x) WARN(1, "Missing switch case (%lu) in %sn", 30-                         ^~~~
   drivers/gpu/drm/i915/intel_engine_cs.c:160:4: note: in expansion of macro 'MISSING_CASE'
       MISSING_CASE(INTEL_GEN(dev_priv));
       ^~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_engine_cs.c:161:3: note: here
      case 10:
      ^~~~
   In file included from include/drm/drm_print.h:29:0,
                    from drivers/gpu/drm/i915/intel_engine_cs.c:25:
   include/linux/compiler.h:77:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
    # define unlikely(x) __builtin_expect(!!(x), 0)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:115:2: note: in expansion of macro 'unlikely'
     unlikely(__ret_warn_on);     44-  ^~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:43:25: note: in expansion of macro 'WARN'
    #define MISSING_CASE(x) WARN(1, "Missing switch case (%lu) in %sn", 47-                         ^~~~
   drivers/gpu/drm/i915/intel_engine_cs.c:190:3: note: in expansion of macro 'MISSING_CASE'
      MISSING_CASE(class);
      ^~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_engine_cs.c:191:2: note: here
     case VIDEO_DECODE_CLASS:
     ^~~~

vim +1014 drivers/gpu/drm/i915/intel_engine_cs.c

133b4bd74d8922 Tvrtko Ursulin 2017-02-16   992  
7e8b7b831eef88 Cooper Chiou   2021-01-28   993  static void
7e8b7b831eef88 Cooper Chiou   2021-01-28   994  gen9_wa_init_mcr(struct drm_i915_private *dev_priv)
7e8b7b831eef88 Cooper Chiou   2021-01-28   995  {
7e8b7b831eef88 Cooper Chiou   2021-01-28   996  	const struct sseu_dev_info *sseu = &INTEL_INFO(dev_priv)->sseu;
7e8b7b831eef88 Cooper Chiou   2021-01-28   997  	unsigned int slice, subslice;
7e8b7b831eef88 Cooper Chiou   2021-01-28   998  	u32 mcr, mcr_mask;
7e8b7b831eef88 Cooper Chiou   2021-01-28   999  
7e8b7b831eef88 Cooper Chiou   2021-01-28  1000  	GEM_BUG_ON(INTEL_GEN(dev_priv) != 9);
7e8b7b831eef88 Cooper Chiou   2021-01-28  1001  
7e8b7b831eef88 Cooper Chiou   2021-01-28  1002  	/*
7e8b7b831eef88 Cooper Chiou   2021-01-28  1003  	 * WaProgramMgsrForCorrectSliceSpecificMmioReads:glk,kbl,cml
7e8b7b831eef88 Cooper Chiou   2021-01-28  1004  	 * Before any MMIO read into slice/subslice specific registers, MCR
7e8b7b831eef88 Cooper Chiou   2021-01-28  1005  	 * packet control register needs to be programmed to point to any
7e8b7b831eef88 Cooper Chiou   2021-01-28  1006  	 * enabled s/ss pair. Otherwise, incorrect values will be returned.
7e8b7b831eef88 Cooper Chiou   2021-01-28  1007  	 * This means each subsequent MMIO read will be forwarded to an
7e8b7b831eef88 Cooper Chiou   2021-01-28  1008  	 * specific s/ss combination, but this is OK since these registers
7e8b7b831eef88 Cooper Chiou   2021-01-28  1009  	 * are consistent across s/ss in almost all cases. In the rare
7e8b7b831eef88 Cooper Chiou   2021-01-28  1010  	 * occasions, such as INSTDONE, where this value is dependent
7e8b7b831eef88 Cooper Chiou   2021-01-28  1011  	 * on s/ss combo, the read should be done with read_subslice_reg.
7e8b7b831eef88 Cooper Chiou   2021-01-28  1012  	 */
7e8b7b831eef88 Cooper Chiou   2021-01-28  1013  	slice = ffs(sseu->slice_mask) - 1;
7e8b7b831eef88 Cooper Chiou   2021-01-28 @1014  	subslice = ffs(sseu->subslice_mask);
7e8b7b831eef88 Cooper Chiou   2021-01-28  1015  	GEM_BUG_ON(!subslice);
7e8b7b831eef88 Cooper Chiou   2021-01-28  1016  	subslice--;
7e8b7b831eef88 Cooper Chiou   2021-01-28  1017  
7e8b7b831eef88 Cooper Chiou   2021-01-28  1018  	/*
7e8b7b831eef88 Cooper Chiou   2021-01-28  1019  	 * We use GEN8_MCR..() macros to calculate the |mcr| value for
7e8b7b831eef88 Cooper Chiou   2021-01-28  1020  	 * Gen 9 to address WaProgramMgsrForCorrectSliceSpecificMmioReads
7e8b7b831eef88 Cooper Chiou   2021-01-28  1021  	 */
7e8b7b831eef88 Cooper Chiou   2021-01-28  1022  	mcr = GEN8_MCR_SLICE(slice) | GEN8_MCR_SUBSLICE(subslice);
7e8b7b831eef88 Cooper Chiou   2021-01-28  1023  	mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
7e8b7b831eef88 Cooper Chiou   2021-01-28  1024  
7e8b7b831eef88 Cooper Chiou   2021-01-28  1025  	DRM_DEBUG_DRIVER("MCR slice:%d/subslice:%d = 0x%x\n", slice, subslice, mcr);
7e8b7b831eef88 Cooper Chiou   2021-01-28  1026  
7e8b7b831eef88 Cooper Chiou   2021-01-28  1027  	I915_WRITE(GEN8_MCR_SELECTOR, (I915_READ(GEN8_MCR_SELECTOR) & ~(mcr_mask)) | mcr);
7e8b7b831eef88 Cooper Chiou   2021-01-28  1028  }
7e8b7b831eef88 Cooper Chiou   2021-01-28  1029  

:::::: The code at line 1014 was first introduced by commit
:::::: 7e8b7b831eef8845968681254854d4423d47acb4 BACKPORT: FROMLIST: drm/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9

:::::: TO: Cooper Chiou <cooper.chiou@intel.com>
:::::: CC: Commit Bot <commit-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
