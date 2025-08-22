Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E76E2550BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 16:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755880811; cv=none; b=X9oSfzc9UNN2I4L0DJYjBKtHyWDHchXWolGZndfAsysH1U9dNHWjPkMEOA59Bpv+QfltdAlsxCx52rOJG7ASEB9Xk+06djyus0oHi8GYWArArJShZ+67Jvkx+jqDMLrqO4oVikdVA0B+HgJ7eQSgvp9/bwM8ft4V7YQHLL9nqoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755880811; c=relaxed/simple;
	bh=1zY9mOsHwUP2iRNuA/njoyc7yI7XMTjl7nWniPYK4SE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ih+HeZY5nw0cTi7TQA7/9jjKN/Ea4RUVbexgJfSqHCH/WzXnquUzG4WddqAdr8dbEv56Zt3G0wO6czVRFfZJflo8274UcXJ0NaxD3Db7CfV7XudQDgJAyk11yt6utxeFSE6kfbvx9eD16ye685bVq8rzXCRV7QmNKwllZHrDzk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yll8Q3dd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yll8Q3dd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755880810; x=1787416810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1zY9mOsHwUP2iRNuA/njoyc7yI7XMTjl7nWniPYK4SE=;
  b=Yll8Q3ddSs9XAvLyQA4SLG8tw6irq26VevRsR9hLXbHABWVDl8pr4UhO
   alplLBq095ejNkmjKm9aXNWCT1Ssc8e5dMCnJdM7/YTnHQNvcrRL2osqy
   kH9RXs5JElQXVd68b13BRzn9aiHTvRIUvCE8jOce38BYNCYJJ+147gfEB
   qvJjMxfiYAIfGBSEGPpAKxzzDfQT/I8PR4RcYuNFdZj2QX08QiV4vb1+V
   jR6qE1LI1yS6qV7XbhIujl//fFA1goCQuL5JoT1NBr5hAzJy6WSZenJ6A
   mZDro2IpDax0VSh1xtkAitRbz59Ha3fZbJmPZDXG+6W5dL8g/3YpkIcnJ
   g==;
X-CSE-ConnectionGUID: 8pOAjQY2QGqU1WPGBCsaaw==
X-CSE-MsgGUID: V1Prqf56T1KfJ8Mx2emwkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75648984"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75648984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 09:40:09 -0700
X-CSE-ConnectionGUID: bez3avMPRaCj52+AnBoSHg==
X-CSE-MsgGUID: S3NAgdu5Sp2NQArjck4DOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="205920462"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2025 09:40:07 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upUo9-0001xj-26;
	Fri, 22 Aug 2025 16:40:05 +0000
Date: Fri, 22 Aug 2025 18:39:52 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 drivers/iommu/intel/iommu.c:3277:7: error: call to undeclared function
 'pkvm_enabled'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202508221834.0zoFAMYw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   3f8a5612f90e91c6acf0f22bb5fa67ad1ce1c1e4
commit: 3f8a5612f90e91c6acf0f22bb5fa67ad1ce1c1e4 [7/7] ANDROID: iommu/vt-d: force enable all iommu when pkvm is enabled.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250822/202508221834.0zoFAMYw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221834.0zoFAMYw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221834.0zoFAMYw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/iommu.c:3277:7: error: call to undeclared function 'pkvm_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3277 |         if (!pkvm_enabled())
         |              ^
   drivers/iommu/intel/iommu.c:3277:7: note: did you mean 'pat_enabled'?
   arch/x86/include/asm/memtype.h:8:13: note: 'pat_enabled' declared here
       8 | extern bool pat_enabled(void);
         |             ^
   1 error generated.


vim +/pkvm_enabled +3277 drivers/iommu/intel/iommu.c

  3201	
  3202	int __init intel_iommu_init(void)
  3203	{
  3204		int ret = -ENODEV;
  3205		struct dmar_drhd_unit *drhd;
  3206		struct intel_iommu *iommu;
  3207	
  3208		/*
  3209		 * Intel IOMMU is required for a TXT/tboot launch or platform
  3210		 * opt in, so enforce that.
  3211		 */
  3212		force_on = (!intel_iommu_tboot_noforce && tboot_force_iommu()) ||
  3213			    platform_optin_force_iommu();
  3214	
  3215		down_write(&dmar_global_lock);
  3216		if (dmar_table_init()) {
  3217			if (force_on)
  3218				panic("tboot: Failed to initialize DMAR table\n");
  3219			goto out_free_dmar;
  3220		}
  3221	
  3222		if (dmar_dev_scope_init() < 0) {
  3223			if (force_on)
  3224				panic("tboot: Failed to initialize DMAR device scope\n");
  3225			goto out_free_dmar;
  3226		}
  3227	
  3228		up_write(&dmar_global_lock);
  3229	
  3230		/*
  3231		 * The bus notifier takes the dmar_global_lock, so lockdep will
  3232		 * complain later when we register it under the lock.
  3233		 */
  3234		dmar_register_bus_notifier();
  3235	
  3236		down_write(&dmar_global_lock);
  3237	
  3238		if (!no_iommu)
  3239			intel_iommu_debugfs_init();
  3240	
  3241		if (no_iommu || dmar_disabled) {
  3242			/*
  3243			 * We exit the function here to ensure IOMMU's remapping and
  3244			 * mempool aren't setup, which means that the IOMMU's PMRs
  3245			 * won't be disabled via the call to init_dmars(). So disable
  3246			 * it explicitly here. The PMRs were setup by tboot prior to
  3247			 * calling SENTER, but the kernel is expected to reset/tear
  3248			 * down the PMRs.
  3249			 */
  3250			if (intel_iommu_tboot_noforce) {
  3251				for_each_iommu(iommu, drhd)
  3252					iommu_disable_protect_mem_regions(iommu);
  3253			}
  3254	
  3255			/*
  3256			 * Make sure the IOMMUs are switched off, even when we
  3257			 * boot into a kexec kernel and the previous kernel left
  3258			 * them enabled
  3259			 */
  3260			intel_disable_iommus();
  3261			goto out_free_dmar;
  3262		}
  3263	
  3264		if (list_empty(&dmar_rmrr_units))
  3265			pr_info("No RMRR found\n");
  3266	
  3267		if (list_empty(&dmar_atsr_units))
  3268			pr_info("No ATSR found\n");
  3269	
  3270		if (list_empty(&dmar_satc_units))
  3271			pr_info("No SATC found\n");
  3272	
  3273		/*
  3274		 * Do not ignore any dmars if pkvm is enabled so as to
  3275		 * guarantee memory protection from devices.
  3276		 */
> 3277		if (!pkvm_enabled())
  3278			init_no_remapping_devices();
  3279	
  3280		ret = init_dmars();
  3281		if (ret) {
  3282			if (force_on)
  3283				panic("tboot: Failed to initialize DMARs\n");
  3284			pr_err("Initialization failed\n");
  3285			goto out_free_dmar;
  3286		}
  3287		up_write(&dmar_global_lock);
  3288	
  3289		init_iommu_pm_ops();
  3290	
  3291		down_read(&dmar_global_lock);
  3292		for_each_active_iommu(iommu, drhd) {
  3293			/*
  3294			 * The flush queue implementation does not perform
  3295			 * page-selective invalidations that are required for efficient
  3296			 * TLB flushes in virtual environments.  The benefit of batching
  3297			 * is likely to be much lower than the overhead of synchronizing
  3298			 * the virtual and physical IOMMU page-tables.
  3299			 */
  3300			if (cap_caching_mode(iommu->cap) &&
  3301			    !first_level_by_default(IOMMU_DOMAIN_DMA)) {
  3302				pr_info_once("IOMMU batching disallowed due to virtualization\n");
  3303				iommu_set_dma_strict();
  3304			}
  3305			iommu_device_sysfs_add(&iommu->iommu, NULL,
  3306					       intel_iommu_groups,
  3307					       "%s", iommu->name);
  3308			/*
  3309			 * The iommu device probe is protected by the iommu_probe_device_lock.
  3310			 * Release the dmar_global_lock before entering the device probe path
  3311			 * to avoid unnecessary lock order splat.
  3312			 */
  3313			up_read(&dmar_global_lock);
  3314			iommu_device_register(&iommu->iommu, &intel_iommu_ops, NULL);
  3315			down_read(&dmar_global_lock);
  3316	
  3317			iommu_pmu_register(iommu);
  3318		}
  3319	
  3320		if (probe_acpi_namespace_devices())
  3321			pr_warn("ACPI name space devices didn't probe correctly\n");
  3322	
  3323		/* Finally, we enable the DMA remapping hardware. */
  3324		for_each_iommu(iommu, drhd) {
  3325			if (!drhd->ignored && !translation_pre_enabled(iommu))
  3326				iommu_enable_translation(iommu);
  3327	
  3328			iommu_disable_protect_mem_regions(iommu);
  3329		}
  3330		up_read(&dmar_global_lock);
  3331	
  3332		pr_info("Intel(R) Virtualization Technology for Directed I/O\n");
  3333	
  3334		intel_iommu_enabled = 1;
  3335	
  3336		return 0;
  3337	
  3338	out_free_dmar:
  3339		intel_iommu_free_dmars();
  3340		up_write(&dmar_global_lock);
  3341		return ret;
  3342	}
  3343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
