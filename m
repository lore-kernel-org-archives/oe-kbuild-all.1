Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB02C2C6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kmt/JQup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698298204; x=1729834204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4NqMSW+TpNWsuZeTBZwl/HJ7QzEkXMESxPHaoBKr8E=;
  b=Kmt/JQupeu/Prar0vxscpYO+n+Ke5L2CfehBVnN75IszQW9ABedXzoU/
   TZXCuQD+CEQgXSM4qcRDynfxv9Op7p3gZPoC6XfGPw6oHmt1Io7oQQK+H
   xwMj3xkl0I8oICJqKf3fs0yWJwRiv9A2M7yqUTcFeXONoPxYyZXSoUBgE
   901O4A1eVU3mIvMDxUC84WhwUp4NQ85D9+bQpU/vKu/YA+4JOKlZYYdvI
   utVu7WotHuAlPCHNaaDD1Se/6QmKWgLegq8p1B/bLMb99aXlLA3XKJDZ3
   BTTacspSNt+JeFaZuGg5d1Frrob1h2lSwesoaNwxQOYnOzP4rnE8KAJzw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="453931511"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="453931511"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 22:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="794082057"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="794082057"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Oct 2023 22:30:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvswR-0009VP-33;
	Thu, 26 Oct 2023 05:29:59 +0000
Date: Thu, 26 Oct 2023 13:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-04 2627/20110]
 include/linux/compiler_types.h:140:41: error: invalid use of undefined type
 'struct module'
Message-ID: <202310261354.PRcnWXUJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jone,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-04
head:   171753a15b59ff7c3f72f761532ef29441b42fb3
commit: 180f8b73199bd665c03ff43853170280fc82e02d [2627/20110] ANDROID: kernel: add module info for debug_kinfo
config: x86_64-buildonly-randconfig-005-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261354.PRcnWXUJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261354.PRcnWXUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261354.PRcnWXUJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/staging/android/debug_kinfo.c: In function 'debug_kinfo_probe':
>> include/linux/compiler_types.h:140:41: error: invalid use of undefined type 'struct module'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:162:40: note: in expansion of macro 'offsetof'
     162 |         info->mod_core_layout_offset = offsetof(struct module, core_layout);
         |                                        ^~~~~~~~
>> include/linux/compiler_types.h:140:41: error: invalid use of undefined type 'struct module'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:163:40: note: in expansion of macro 'offsetof'
     163 |         info->mod_init_layout_offset = offsetof(struct module, init_layout);
         |                                        ^~~~~~~~
>> include/linux/compiler_types.h:140:41: error: invalid use of undefined type 'struct module'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:164:37: note: in expansion of macro 'offsetof'
     164 |         info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
         |                                     ^~~~~~~~
   drivers/staging/android/debug_kinfo.c: At top level:
   drivers/staging/android/debug_kinfo.c:171:34: warning: 'debug_kinfo_of_match' defined but not used [-Wunused-const-variable=]
     171 | static const struct of_device_id debug_kinfo_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +140 include/linux/compiler_types.h

71391bdd2e9aab Xiaozhou Liu 2018-12-14  139  
71391bdd2e9aab Xiaozhou Liu 2018-12-14 @140  #define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
71391bdd2e9aab Xiaozhou Liu 2018-12-14  141  

:::::: The code at line 140 was first introduced by commit
:::::: 71391bdd2e9aab188f86bf1ecd9b232531ec7eea include/linux/compiler_types.h: don't pollute userspace with macro definitions

:::::: TO: Xiaozhou Liu <liuxiaozhou@bytedance.com>
:::::: CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
