Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075551822F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719151200; cv=none; b=fO2IaA6ztxF0YzUnO8KfrMDKLsJHddU/V4vzTBUkmTm2beMoMUTCfQAaqY7bkZb9JY+mS7xfHf4bq2VNHI387zFgYO/NtZC5h289xInWpgq0SQYLYMsjAgjGZNNImszzvFZm60FoIlCx34hScjlw0vMhT7vU3AOV+uTK1i2ybew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719151200; c=relaxed/simple;
	bh=HJW6WHSRWx+/u4B68GTXJw9sG8Y0ApA1Kybx7bqDIQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RwBTJB5Fnv/bmab9ezP8j6gVSR0pFcJ4THW3iZdg18smqH7RNIcIrpvghzOxJ5Ue8QDCee6WWaKFbDQKnIfy3n4dshqxpW4nXKNbY4Ct1NRAwixjQ/if+cxYB8VsGR+DPtcsPN/Nwy7qMDCpPzLIEs40eBsAv+gRg4NEC6A3/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAYAhvha; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAYAhvha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719151198; x=1750687198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJW6WHSRWx+/u4B68GTXJw9sG8Y0ApA1Kybx7bqDIQY=;
  b=TAYAhvhaN2uXhiD285lm8eAGDh4uL8f2iX2AqHx/zN0OW+46cd6qRvll
   yA/pn7wl787Yo0YKITVK5fytV30iUwN+RJ7qzzIoVx18AHNrQEcJs/xcR
   eo3T5T6AFiiDNqO5MuNk/+/dGWD1BnAiOFbcac5Wz0EJbp49OgP+yYofi
   0DBS3NGu8mT7DRv7AgR965sLpdTVD3EncmwJQyIAsdlAovsWGPe+Y6vhh
   CoHqjCh3qP2nGLmhkyfrDhxZpOqbyCB3iyZNqdahKOJ2aN+zeH3zI3noP
   g8qJgOx0h3OcE0Ns5HE0eA5Fi5R8RvxaF23ZSsFgCaO9DWi8gSWHjU/uW
   w==;
X-CSE-ConnectionGUID: l3gzGdnVRLGOvMulUrx5mA==
X-CSE-MsgGUID: INrsI8ndQk6XCUhUhNIbMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26810113"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="26810113"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 06:59:57 -0700
X-CSE-ConnectionGUID: 9vZv2KMzT8yA4FWj2yMRNQ==
X-CSE-MsgGUID: hFClz7dKRTC7TfOPbvhybA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="43029382"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2024 06:59:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLNl4-000AXC-0Q;
	Sun, 23 Jun 2024 13:59:54 +0000
Date: Sun, 23 Jun 2024 21:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 438/6555]
 drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c:297:35: error: 'struct
 mm_struct' has no member named 'get_unmapped_area'
Message-ID: <202406232131.5nHCZdXh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: b303c6455c178a647340cd5e75fddbdf57cc697a [438/6555] CHROMIUM: MALI: Bifrost r13p0 EAC release
config: arm-randconfig-r054-20240623 (https://download.01.org/0day-ci/archive/20240623/202406232131.5nHCZdXh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406232131.5nHCZdXh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406232131.5nHCZdXh-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: -Idrivers/gpu/arm/midgard/../../../base: No such file or directory [-Wmissing-include-dirs]
   drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c: In function 'kbase_get_unmapped_area':
>> drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c:297:35: error: 'struct mm_struct' has no member named 'get_unmapped_area'
     297 |                 return current->mm->get_unmapped_area(filp, addr, len, pgoff,
         |                                   ^~
   In file included from drivers/gpu/arm/midgard/thirdparty/../mali_kbase_defs.h:37,
                    from drivers/gpu/arm/midgard/thirdparty/../mali_kbase.h:57,
                    from drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c:33:
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h: At top level:
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1216:33: warning: 'base_hw_issues_model_tEGx' defined but not used [-Wunused-const-variable=]
    1216 | static const enum base_hw_issue base_hw_issues_model_tEGx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1209:33: warning: 'base_hw_issues_tEGx_r0p0' defined but not used [-Wunused-const-variable=]
    1209 | static const enum base_hw_issue base_hw_issues_tEGx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1201:33: warning: 'base_hw_issues_model_tBOx' defined but not used [-Wunused-const-variable=]
    1201 | static const enum base_hw_issue base_hw_issues_model_tBOx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1194:33: warning: 'base_hw_issues_tBOx_r0p0' defined but not used [-Wunused-const-variable=]
    1194 | static const enum base_hw_issue base_hw_issues_tBOx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1186:33: warning: 'base_hw_issues_model_tTRx' defined but not used [-Wunused-const-variable=]
    1186 | static const enum base_hw_issue base_hw_issues_model_tTRx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1179:33: warning: 'base_hw_issues_tTRx_r0p0' defined but not used [-Wunused-const-variable=]
    1179 | static const enum base_hw_issue base_hw_issues_tTRx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1171:33: warning: 'base_hw_issues_model_tKAx' defined but not used [-Wunused-const-variable=]
    1171 | static const enum base_hw_issue base_hw_issues_model_tKAx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1164:33: warning: 'base_hw_issues_tKAx_r0p0' defined but not used [-Wunused-const-variable=]
    1164 | static const enum base_hw_issue base_hw_issues_tKAx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1156:33: warning: 'base_hw_issues_model_tGOx' defined but not used [-Wunused-const-variable=]
    1156 | static const enum base_hw_issue base_hw_issues_model_tGOx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1148:33: warning: 'base_hw_issues_tGOx_r1p0' defined but not used [-Wunused-const-variable=]
    1148 | static const enum base_hw_issue base_hw_issues_tGOx_r1p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1140:33: warning: 'base_hw_issues_tGOx_r0p0' defined but not used [-Wunused-const-variable=]
    1140 | static const enum base_hw_issue base_hw_issues_tGOx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1132:33: warning: 'base_hw_issues_model_tNOx' defined but not used [-Wunused-const-variable=]
    1132 | static const enum base_hw_issue base_hw_issues_model_tNOx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1124:33: warning: 'base_hw_issues_tNOx_r0p0' defined but not used [-Wunused-const-variable=]
    1124 | static const enum base_hw_issue base_hw_issues_tNOx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1116:33: warning: 'base_hw_issues_model_tDVx' defined but not used [-Wunused-const-variable=]
    1116 | static const enum base_hw_issue base_hw_issues_model_tDVx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1109:33: warning: 'base_hw_issues_tDVx_r0p0' defined but not used [-Wunused-const-variable=]
    1109 | static const enum base_hw_issue base_hw_issues_tDVx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1101:33: warning: 'base_hw_issues_model_tSIx' defined but not used [-Wunused-const-variable=]
    1101 | static const enum base_hw_issue base_hw_issues_model_tSIx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1094:33: warning: 'base_hw_issues_tSIx_r1p1' defined but not used [-Wunused-const-variable=]
    1094 | static const enum base_hw_issue base_hw_issues_tSIx_r1p1[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1086:33: warning: 'base_hw_issues_tSIx_r1p0' defined but not used [-Wunused-const-variable=]
    1086 | static const enum base_hw_issue base_hw_issues_tSIx_r1p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1078:33: warning: 'base_hw_issues_tSIx_r0p1' defined but not used [-Wunused-const-variable=]
    1078 | static const enum base_hw_issue base_hw_issues_tSIx_r0p1[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1070:33: warning: 'base_hw_issues_tSIx_r0p0' defined but not used [-Wunused-const-variable=]
    1070 | static const enum base_hw_issue base_hw_issues_tSIx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1061:33: warning: 'base_hw_issues_model_tHEx' defined but not used [-Wunused-const-variable=]
    1061 | static const enum base_hw_issue base_hw_issues_model_tHEx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1052:33: warning: 'base_hw_issues_tHEx_r0p3' defined but not used [-Wunused-const-variable=]
    1052 | static const enum base_hw_issue base_hw_issues_tHEx_r0p3[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1042:33: warning: 'base_hw_issues_tHEx_r0p2' defined but not used [-Wunused-const-variable=]
    1042 | static const enum base_hw_issue base_hw_issues_tHEx_r0p2[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1032:33: warning: 'base_hw_issues_tHEx_r0p1' defined but not used [-Wunused-const-variable=]
    1032 | static const enum base_hw_issue base_hw_issues_tHEx_r0p1[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1022:33: warning: 'base_hw_issues_tHEx_r0p0' defined but not used [-Wunused-const-variable=]
    1022 | static const enum base_hw_issue base_hw_issues_tHEx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1008:33: warning: 'base_hw_issues_model_tMIx' defined but not used [-Wunused-const-variable=]
    1008 | static const enum base_hw_issue base_hw_issues_model_tMIx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:991:33: warning: 'base_hw_issues_tMIx_r0p1' defined but not used [-Wunused-const-variable=]
     991 | static const enum base_hw_issue base_hw_issues_tMIx_r0p1[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:974:33: warning: 'base_hw_issues_tMIx_r0p0' defined but not used [-Wunused-const-variable=]
     974 | static const enum base_hw_issue base_hw_issues_tMIx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:957:33: warning: 'base_hw_issues_tMIx_r0p0_05dev0' defined but not used [-Wunused-const-variable=]
     957 | static const enum base_hw_issue base_hw_issues_tMIx_r0p0_05dev0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:943:33: warning: 'base_hw_issues_model_t82x' defined but not used [-Wunused-const-variable=]
     943 | static const enum base_hw_issue base_hw_issues_model_t82x[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:923:33: warning: 'base_hw_issues_t82x_r1p0' defined but not used [-Wunused-const-variable=]
     923 | static const enum base_hw_issue base_hw_issues_t82x_r1p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:902:33: warning: 'base_hw_issues_t82x_r0p1' defined but not used [-Wunused-const-variable=]


vim +297 drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c

   214	
   215	
   216	/* This function is based on Linux kernel's arch_get_unmapped_area, but
   217	 * simplified slightly. Modifications come from the fact that some values
   218	 * about the memory area are known in advance.
   219	 */
   220	unsigned long kbase_get_unmapped_area(struct file *filp,
   221			const unsigned long addr, const unsigned long len,
   222			const unsigned long pgoff, const unsigned long flags)
   223	{
   224		struct kbase_context *kctx = filp->private_data;
   225		struct mm_struct *mm = current->mm;
   226		struct vm_unmapped_area_info info;
   227		unsigned long align_offset = 0;
   228		unsigned long align_mask = 0;
   229		unsigned long high_limit = mm->mmap_base;
   230		unsigned long low_limit = PAGE_SIZE;
   231		int cpu_va_bits = BITS_PER_LONG;
   232		int gpu_pc_bits =
   233		      kctx->kbdev->gpu_props.props.core_props.log2_program_counter_size;
   234		bool is_shader_code = false;
   235		unsigned long ret;
   236	
   237		/* err on fixed address */
   238		if ((flags & MAP_FIXED) || addr)
   239			return -EINVAL;
   240	
   241	#ifdef CONFIG_64BIT
   242		/* too big? */
   243		if (len > TASK_SIZE - SZ_2M)
   244			return -ENOMEM;
   245	
   246		if (!kbase_ctx_flag(kctx, KCTX_COMPAT)) {
   247	
   248			high_limit = min_t(unsigned long, mm->mmap_base,
   249					(kctx->same_va_end << PAGE_SHIFT));
   250	
   251			/* If there's enough (> 33 bits) of GPU VA space, align
   252			 * to 2MB boundaries.
   253			 */
   254			if (kctx->kbdev->gpu_props.mmu.va_bits > 33) {
   255				if (len >= SZ_2M) {
   256					align_offset = SZ_2M;
   257					align_mask = SZ_2M - 1;
   258				}
   259			}
   260	
   261			low_limit = SZ_2M;
   262		} else {
   263			cpu_va_bits = 32;
   264		}
   265	#endif /* CONFIG_64BIT */
   266		if ((PFN_DOWN(BASE_MEM_COOKIE_BASE) <= pgoff) &&
   267			(PFN_DOWN(BASE_MEM_FIRST_FREE_ADDRESS) > pgoff)) {
   268				int cookie = pgoff - PFN_DOWN(BASE_MEM_COOKIE_BASE);
   269				struct kbase_va_region *reg =
   270						kctx->pending_regions[cookie];
   271	
   272				if (!reg)
   273					return -EINVAL;
   274	
   275				if (!(reg->flags & KBASE_REG_GPU_NX)) {
   276					if (cpu_va_bits > gpu_pc_bits) {
   277						align_offset = 1ULL << gpu_pc_bits;
   278						align_mask = align_offset - 1;
   279						is_shader_code = true;
   280					}
   281				} else if (reg->flags & KBASE_REG_TILER_ALIGN_TOP) {
   282					unsigned long extent_bytes =
   283					     (unsigned long)(reg->extent << PAGE_SHIFT);
   284					/* kbase_check_alloc_sizes() already satisfies
   285					 * these checks, but they're here to avoid
   286					 * maintenance hazards due to the assumptions
   287					 * involved */
   288					WARN_ON(reg->extent > (ULONG_MAX >> PAGE_SHIFT));
   289					WARN_ON(reg->initial_commit > (ULONG_MAX >> PAGE_SHIFT));
   290					WARN_ON(!is_power_of_2(extent_bytes));
   291					align_mask = extent_bytes - 1;
   292					align_offset =
   293					      extent_bytes - (reg->initial_commit << PAGE_SHIFT);
   294				}
   295	#ifndef CONFIG_64BIT
   296		} else {
 > 297			return current->mm->get_unmapped_area(filp, addr, len, pgoff,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
