Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9E3793D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 20:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787084019; cv=none; b=i0wbBorTscGem5UrqZsNHVnCjMiLs6NskP+Jet0G6HpjTktkP4qwYFbdl8DZOIFr/5V7N6fGjr604jfwxOZzvd4hJaH2CYqXwYDX0YfK53q6UmD+9vDM8kStWNu8GWUqGvZOTiz+e03z/071sH3oochBZ3GpChE/NhuaQLPQAwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787084019; c=relaxed/simple;
	bh=oBZdPCkVsvEP04eFMGf/IBltRyCLdP7MPLAWv/U80sc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OLQSG72cpTEVUEbdH/x53LA3KAsjLNYi0mCPZj2zt9Zriur7pRbNSU3ZcDouiBpZiGiOZXyjkfAn/sihmHcoeyDtI1/xWh2KFXpjt6/CRYKYvyfKJcBle2ncRT/KHnQ3LiRjxuAXwhNwWdr14oeAdmax7gxmzT7F2cgudYOpCNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6P9rD6v; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6P9rD6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787084015; x=1818620015;
  h=date:from:to:cc:subject:message-id;
  bh=oBZdPCkVsvEP04eFMGf/IBltRyCLdP7MPLAWv/U80sc=;
  b=i6P9rD6vI6PNBD+K5KSwtT8jWk1330D/bQKvJkcBMFQFYkuKfX4D/+iw
   +USwAGFickau5doqu8vf0d31JjQb85BwiyvSlHqXNzZSBNNssLSbNyakr
   8ORKtgKWp+kKh/Ti3AXpxHk65dyWmY4mm5VUtfBGFcdXRW+0US3GDnM72
   +qVKVAIhMZe/UfQ4IfEqvCbdmIrEPplQ3mm9gW7o7wysnGkU3TqY+BPQJ
   V7USsetFQCy0B2gcjyouk6+g7QUac8DmQBdtyW5gVXhH/04Nf9h1QJs5o
   pXwzM6T82OteXLbXhbhx8w79dlD2SQdH2i/+9XFyglVCZ802pRkvLata3
   A==;
X-CSE-ConnectionGUID: e/fFstgsQTSui+Fd8WAF4Q==
X-CSE-MsgGUID: XCi63YmdQG+6EHLMJffZ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87608531"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87608531"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 13:13:35 -0700
X-CSE-ConnectionGUID: VTrQfSAgQ56GHQpXO3aoBQ==
X-CSE-MsgGUID: 385vd5KaQDOaqq8NYDrTHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269618459"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Aug 2026 13:13:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwQBf-00000000eY6-0gMD;
	Tue, 18 Aug 2026 20:13:31 +0000
Date: Wed, 19 Aug 2026 04:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type
 'struct pkvm_sm_context_param'
Message-ID: <202608190323.L5CJC1lK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Aashish,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 4c2bcf42320837fc0b98fbce77c764de4d905644 [1/1] ANDROID: iommu/vt-d: Paravirtualize scalable mode context updates
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260819/202608190323.L5CJC1lK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190323.L5CJC1lK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190323.L5CJC1lK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/intel/iommu_pkvm.h:9,
                    from drivers/iommu/intel/dmar.c:34:
   arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_clear_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:390,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/iommu/intel/dmar.c:19:
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:314:17: note: in expansion of macro 'memset'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_lm_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_lm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:314:17: note: in expansion of macro 'memset'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_sm_ce':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:314:17: note: in expansion of macro 'memset'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
--
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_clear_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:390,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/user_32.h:5,
                    from arch/x86/include/asm/user.h:6,
                    from include/linux/user.h:1,
                    from include/linux/elfcore.h:5,
                    from include/linux/vmcore_info.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from drivers/iommu/intel/iommu.c:16:
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:314:17: note: in expansion of macro 'memset'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_lm_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_lm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:314:17: note: in expansion of macro 'memset'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_sm_ce':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:314:17: note: in expansion of macro 'memset'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'pv_context_mapping':
   drivers/iommu/intel/iommu.c:1459:16: error: variable 'param' has initializer but incomplete type
    1459 |         struct pkvm_lm_context_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1460:18: error: 'struct pkvm_lm_context_param' has no member named 'phys'
    1460 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1460:25: warning: excess elements in struct initializer
    1460 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/iommu.c:1460:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1461:18: error: 'struct pkvm_lm_context_param' has no member named 'bdf'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   In file included from drivers/iommu/intel/iommu.c:20:
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1461:24: note: in expansion of macro 'PCI_DEVID'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1461:24: note: in expansion of macro 'PCI_DEVID'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:18: error: 'struct pkvm_lm_context_param' has no member named 'domain_pgd_gpa'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~~~~~~~~
   In file included from include/linux/kexec.h:20:
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:35: note: in expansion of macro 'virt_to_phys'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:35: note: in expansion of macro 'virt_to_phys'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1463:18: error: 'struct pkvm_lm_context_param' has no member named 'did'
    1463 |                 .did = domain_id_iommu(domain, iommu),
         |                  ^~~
   drivers/iommu/intel/iommu.c:1463:24: warning: excess elements in struct initializer
    1463 |                 .did = domain_id_iommu(domain, iommu),
         |                        ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1463:24: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1464:18: error: 'struct pkvm_lm_context_param' has no member named 'ats_supported'
    1464 |                 .ats_supported = info ? info->ats_supported : 0,
         |                  ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1464:34: warning: excess elements in struct initializer
    1464 |                 .ats_supported = info ? info->ats_supported : 0,
         |                                  ^~~~
   drivers/iommu/intel/iommu.c:1464:34: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1459:38: error: storage size of 'param' isn't known
    1459 |         struct pkvm_lm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/iommu.c:1459:38: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_context_clear':
   drivers/iommu/intel/iommu.c:1743:16: error: variable 'param' has initializer but incomplete type
    1743 |         struct pkvm_clear_translation_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1744:18: error: 'struct pkvm_clear_translation_param' has no member named 'phys'
    1744 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1744:25: warning: excess elements in struct initializer
    1744 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:1744:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1745:18: error: 'struct pkvm_clear_translation_param' has no member named 'bdf'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1745:24: note: in expansion of macro 'PCI_DEVID'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1745:24: note: in expansion of macro 'PCI_DEVID'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
..


vim +16 drivers/iommu/intel/iommu_pkvm.h

14d98d9e4203286 Aashish Sharma 2025-11-06  10  
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  11  #define pkvm_iommu_hypercall(hc, param_name, param)			\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  12  	({									\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  13  		unsigned long f;						\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  14  		struct pkvm_##param_name *p = get_this_pv_param(param_name, f);	\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  15  		int ret;							\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12 @16  		*p = *(param);							\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  17  		ret = pkvm_hypercall(hc, (unsigned long)p);		\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  18  		*(param) = *p;							\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12 @19  		put_this_pv_param(p, f);					\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  20  		ret;								\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  21  	})
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  22  

:::::: The code at line 16 was first introduced by commit
:::::: 157ba06fef4bdb68af268f6a0e53695c0e4ad373 ANDROID: iommu/vt-d: Paravirtualize legacy context entry updates

:::::: TO: Vineeth Pillai <vineethrp@google.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
