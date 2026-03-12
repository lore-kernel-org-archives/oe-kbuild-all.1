Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9EC35F16A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 03:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284789; cv=none; b=DNgmpTWAe2C3OO9jprN2CTaVUOXXXwh2HiUyUJAQGW4/zQHzhsfSsTLSIlU3FI4krbgg+KKx6kFRRbUznMnHIf/OaX4MGzHrUcNObMBmQZa6h2vsnCISF+gjGG5+BJv8dqycl/sCNQXEXdeoVLNyCsg/jbuMM4hWxC7/T0pa8+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284789; c=relaxed/simple;
	bh=JeY3RUmKVBXiwzTCpyrzH9NR24wdSvpXmT4En3OMeGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WkO/aPh8IOaJG3ZQMQ06qkhehbidLgRsCxgEpCixBthXiaV0ElK5KE1DUW1D3Er5amObScNjkoiq2L+ZnGOiSccj+U9Tk6BCg+jtFTLrdTbrQKpdybQPbHd5Rl0/3qc5iZXH1CnKwkZ5/9qmh5+HZEdnVop17zmr98LjnwqRdic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpSRVWyE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpSRVWyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773284788; x=1804820788;
  h=date:from:to:cc:subject:message-id;
  bh=JeY3RUmKVBXiwzTCpyrzH9NR24wdSvpXmT4En3OMeGk=;
  b=DpSRVWyEV6/NTGIuUO2Tabu6O9vb9ybFadmVgEkVM+evJK/VIKazL8Tp
   WFEhnHl4ReMro7oUmHSQBJGV/sBNmikzGY8obzHmNhANYKtdMDUhw3VpX
   Qk+Bn70HJjvq3GgihF9ZWutNbQtrxrNzOlaTtIGPpnY1j6Dd5AMgEpcWz
   FDlDJ+Gbbq59bvvQrHcoK4YbZvdH6d/HavUgWAALEur8+REdetH/WnB0M
   ZYhVvJ5Uw4J3OGaTn6Jzmvhjp2JBWa1PfaS3/VyKwgrg0c0/mrGdLeS1Z
   uUa+68mCRBohJEb/+dhZboepsX28q/K0XiEZ92I8Gwt7cdsuDQXZobb3t
   g==;
X-CSE-ConnectionGUID: COoHx7yBS8epOnUL5qjZTQ==
X-CSE-MsgGUID: /5tFkJJWTFq1XynEhk2T3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77973170"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="77973170"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 20:06:27 -0700
X-CSE-ConnectionGUID: xcbOhTZHTFKTR68R4xDsMA==
X-CSE-MsgGUID: JY3Iavg8RyClUMDt4mB/qA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2026 20:06:24 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0WNR-000000001zP-24Ji;
	Thu, 12 Mar 2026 03:06:21 +0000
Date: Thu, 12 Mar 2026 11:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 17/17]
 drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type
 'struct pkvm_sm_context_param'
Message-ID: <202603121115.LsaiKo7O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Aashish,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6e8e96179140c3b15e8cec8ee8510e05991fc932
commit: 4c2bcf42320837fc0b98fbce77c764de4d905644 [17/17] ANDROID: iommu/vt-d: Paravirtualize scalable mode context updates
config: x86_64-randconfig-073-20260311 (https://download.01.org/0day-ci/archive/20260312/202603121115.LsaiKo7O-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121115.LsaiKo7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121115.LsaiKo7O-lkp@intel.com/

All errors (new ones prefixed by >>):

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
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/sched/task_stack.h:9,
                    from include/linux/elfcore.h:7,
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +16 drivers/iommu/intel/iommu_pkvm.h

14d98d9e420328 Aashish Sharma 2025-11-06  10  
157ba06fef4bdb Vineeth Pillai 2025-10-12  11  #define pkvm_iommu_hypercall(hc, param_name, param)			\
157ba06fef4bdb Vineeth Pillai 2025-10-12  12  	({									\
157ba06fef4bdb Vineeth Pillai 2025-10-12  13  		unsigned long f;						\
157ba06fef4bdb Vineeth Pillai 2025-10-12  14  		struct pkvm_##param_name *p = get_this_pv_param(param_name, f);	\
157ba06fef4bdb Vineeth Pillai 2025-10-12  15  		int ret;							\
157ba06fef4bdb Vineeth Pillai 2025-10-12 @16  		*p = *(param);							\
157ba06fef4bdb Vineeth Pillai 2025-10-12  17  		ret = pkvm_hypercall(hc, (unsigned long)p);		\
157ba06fef4bdb Vineeth Pillai 2025-10-12  18  		*(param) = *p;							\
157ba06fef4bdb Vineeth Pillai 2025-10-12 @19  		put_this_pv_param(p, f);					\
157ba06fef4bdb Vineeth Pillai 2025-10-12  20  		ret;								\
157ba06fef4bdb Vineeth Pillai 2025-10-12  21  	})
157ba06fef4bdb Vineeth Pillai 2025-10-12  22  

:::::: The code at line 16 was first introduced by commit
:::::: 157ba06fef4bdb68af268f6a0e53695c0e4ad373 ANDROID: iommu/vt-d: Paravirtualize legacy context entry updates

:::::: TO: Vineeth Pillai <vineethrp@google.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
