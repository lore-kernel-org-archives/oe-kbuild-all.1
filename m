Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4CB1D88D7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741636734; cv=none; b=ny/SMMnbOikFbwBNK+T76Yt7nQz68B6nrn8anicRI/2z1d6epNT7cz5mvoxIPVoG47mNsuQk+TGuS3cLqXIi9TYotSMxx3A2/UHEQhYVy/M+Bgk3SLsAA3rXgUxP/XMguBdlIijc3voViVQ/0mSmbXocCCkMuQQWFNX5twC1078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741636734; c=relaxed/simple;
	bh=o7f1jbNFtTLWKKzfABjyHe/UVbAzYAi35kBuEYQqWuI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0/Q8WngViZHGUvlyzczWxUlVZ7N8yuzLi8JQPUcqKiAS57y7fIAZLqjdol9P2zBVpy+tVP8AySwcG5OMvJ+tYh5eGKbG0ffM2hr/KjQWVW1jQXJYcrT682UU7i1uxGeeJ927MwZn0ZdKhtBcIz+DUvQ+IyZlpYvTQi8aa5NjYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m76Pr3hc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m76Pr3hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741636732; x=1773172732;
  h=date:from:cc:subject:message-id:mime-version;
  bh=o7f1jbNFtTLWKKzfABjyHe/UVbAzYAi35kBuEYQqWuI=;
  b=m76Pr3hcVzbwxjw2VXauuyS08HtNWCHr76lusaTGBMJMMdyhgQolE6aB
   oDYyN8H4/+5oFC8er5PVojTT6ZHRbxKFDVQygANbyOVs1qPJ7fXjk1qIy
   Xuszbf8jQl0K7f1A0hfoxtEqMWr6juBzgCIk2h20hVQnC/BeDQQP6ytKy
   6DUgBMVFR3l7V+gx9LyW9J+4/mkdYUNHOJkhc7qgv2X9osQo6ET1AUmio
   ODKLAENs5dZLbEwfLgb1zUGdrhEsgzaf00ZdDynlVvxQo+KiQjbKnLTri
   E4ypJwcPC43XBUdiJLQiUMc6vqQOYzscKKMdKdY2GihegRqG1WwQTSPl1
   Q==;
X-CSE-ConnectionGUID: WlRdOkwgRQ6m5dXihy0YTQ==
X-CSE-MsgGUID: a0+0WQEmT/+RW2vsTnrquw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="65105761"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="65105761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 12:58:51 -0700
X-CSE-ConnectionGUID: QKIyFHzTT3iy0PPg29X4xw==
X-CSE-MsgGUID: rHaoyQbMQBiLCKnXAvI3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="125103608"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Mar 2025 12:58:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trjGx-00062S-1w
	for oe-kbuild-all@lists.linux.dev;
	Mon, 10 Mar 2025 19:58:47 +0000
Date: Tue, 11 Mar 2025 03:58:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/gpu/drm/i915/intel_dpll_mgr.c:2649:17:
 warning: arithmetic between different enumeration types ('enum tc_port' and
 'enum intel_dpll_id')
Message-ID: <202503110306.gj24wiBZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Paulo Zanoni <paulo.r.zanoni@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 584fca111d0cf32f6002472d9cb13c4555587438 [1/1] drm/i915/icl: use tc_port in MG_PLL macros
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250311/202503110306.gj24wiBZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110306.gj24wiBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110306.gj24wiBZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/intel_dpll_mgr.c:24:
   In file included from drivers/gpu/drm/i915/intel_drv.h:29:
   In file included from include/linux/i2c.h:30:
   In file included from include/linux/device.h:16:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:14:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:27:
   In file included from include/linux/preempt.h:78:
   In file included from arch/x86/include/asm/preempt.h:7:
   In file included from include/linux/thread_info.h:38:
   arch/x86/include/asm/thread_info.h:186:13: warning: calling '__builtin_frame_address' with a nonzero argument is unsafe [-Wframe-address]
     186 |         oldframe = __builtin_frame_address(1);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:188:11: warning: calling '__builtin_frame_address' with a nonzero argument is unsafe [-Wframe-address]
     188 |                 frame = __builtin_frame_address(2);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/intel_dpll_mgr.c:24:
   In file included from drivers/gpu/drm/i915/intel_drv.h:34:
   In file included from drivers/gpu/drm/i915/i915_drv.h:44:
   In file included from include/linux/perf_event.h:48:
   include/linux/ftrace.h:702:9: warning: calling '__builtin_return_address' with a nonzero argument is unsafe [-Wframe-address]
     702 |         addr = CALLER_ADDR1;
         |                ^~~~~~~~~~~~
   include/linux/ftrace.h:689:38: note: expanded from macro 'CALLER_ADDR1'
     689 | #define CALLER_ADDR1 ((unsigned long)ftrace_return_address(1))
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:682:36: note: expanded from macro 'ftrace_return_address'
     682 | #  define ftrace_return_address(n) __builtin_return_address(n)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:705:9: warning: calling '__builtin_return_address' with a nonzero argument is unsafe [-Wframe-address]
     705 |         return CALLER_ADDR2;
         |                ^~~~~~~~~~~~
   include/linux/ftrace.h:690:38: note: expanded from macro 'CALLER_ADDR2'
     690 | #define CALLER_ADDR2 ((unsigned long)ftrace_return_address(2))
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:682:36: note: expanded from macro 'ftrace_return_address'
     682 | #  define ftrace_return_address(n) __builtin_return_address(n)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/intel_dpll_mgr.c:24:
   In file included from drivers/gpu/drm/i915/intel_drv.h:34:
   In file included from drivers/gpu/drm/i915/i915_drv.h:47:
   In file included from include/linux/shmem_fs.h:7:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/intel_dpll_mgr.c:24:
   In file included from drivers/gpu/drm/i915/intel_drv.h:34:
   drivers/gpu/drm/i915/i915_drv.h:3018:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
    3018 |         return i915_reset_backoff(error) | i915_terminally_wedged(error);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          ||
   drivers/gpu/drm/i915/i915_drv.h:3018:9: note: cast one or both operands to int to silence this warning
>> drivers/gpu/drm/i915/intel_dpll_mgr.c:2649:17: warning: arithmetic between different enumeration types ('enum tc_port' and 'enum intel_dpll_id') [-Wenum-enum-conversion]
    2649 |         return tc_port + DPLL_ID_ICL_MGPLL1;
         |                ~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   7 warnings generated.
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   scripts/extract-cert.cscripts/sign-file.c:46:14: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      46 |         while ((e = ERR_get_error_line(&file, &line))) {
         |                     ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line:89:14: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      89 |         while ((e = ERR_get_error_line(&file, &line))) {
         |                     ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:102:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
     102 |         while (ERR_get_error_line(&file, &line)) {}
         |                ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:142:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
     142 |                 ENGINE_load_builtin_engines();
         |                 ^
   /usr/include/openssl/engine.h:358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:144:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
     144 |                 e = ENGINE_by_id("pkcs11");
         |                     ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:146:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     146 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:151:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     151 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0),
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
>> (&file, scripts/sign-file.c:153:17: warning: 'ENGINE_load_private_key' is deprecated [-Wdeprecated-declarations]
     &line)) {}
         |                ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c153 |                 private_key = ENGINE_load_private_key(e, private_key_name,
         |                               ^
   /usr/include/openssl/engine.h:637:1: note: 'ENGINE_load_private_key' has been explicitly marked deprecated here
     637 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   :124:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^
   /usr/include/openssl/engine.h:358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:126:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                     ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:128:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:133:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:134:3: warning: 'ENGINE_ctrl_cmd' is deprecated [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^
   /usr/include/openssl/engine.h:450:1: note: 'ENGINE_ctrl_cmd' has been explicitly marked deprecated here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   7 warnings generated.
   7 warnings generated.


vim +2649 drivers/gpu/drm/i915/intel_dpll_mgr.c

  2646	
  2647	enum intel_dpll_id icl_tc_port_to_pll_id(enum tc_port tc_port)
  2648	{
> 2649		return tc_port + DPLL_ID_ICL_MGPLL1;
  2650	}
  2651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
