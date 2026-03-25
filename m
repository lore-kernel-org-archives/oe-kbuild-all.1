Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC230F540
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427800; cv=none; b=HQjqj8Hn54Sj6kfzXh8iThzFyx2WAvFToqCMNYvIBB66vw3tmWI4IdWpLaQN+j4WcsnlwK3TcLphCOgHXVeULKsH4/Bo/VFgdjLBIbU9vJHwJI5gGd88yHVD9THCtEi3CV0C8QJVhnXduFGXsD3IbBeKb/Lh5TCBhKPOQv5ZMIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427800; c=relaxed/simple;
	bh=3no8FtOxwxa+7PK8/PoOHOZuuO4YgIVplYU94K69PWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SGL1y3IwLPSyEQG9U+d+bujoTtUaGdIJKkD4Xrk9QaoLKeDTSwvYRj0aDNy998RvaKSu5kI+KU7lAIyl3rcq9rOFuc3PuYyQkrqRF42ug8/QlhAmRf7dgk/h+fO5Tl7fQg7Dz/JVkyUxaxTWpL+p8q9ODCC26AHUra9YlWQOI5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHFroMGk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHFroMGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774427798; x=1805963798;
  h=date:from:to:cc:subject:message-id;
  bh=3no8FtOxwxa+7PK8/PoOHOZuuO4YgIVplYU94K69PWQ=;
  b=OHFroMGkavb2wb7dZeh1VkXj1ZZjx5PwkelrGrlq8Ay3AuF3TwsB2MSM
   f3o0ZtV7ZlU/Wv2IkeeL0xFEPzbBYtgDdzXu8Y9J0vpk6adQUALq775FH
   NyMUDjrW737R6cuDrZZ0YpTof0wkfcFB7FmPqnGUiWF1zuh4nO/iSHNS2
   TAlcU3vIBVPJT5UESeKpKd0Sva2bvpoQugkkZ1AfGxu8MHiCpAzM0la3Q
   mywOAxYew6FYR1W2oyV8M3RUaA5iZaLDO0kyBvYTIrsYqW/PIaGz9yPp+
   kvY42VIsjpMWKbgkwrfu7G3TNqQ1SthLL7vPnNp3o5DKc551UgC8LLhnc
   w==;
X-CSE-ConnectionGUID: E7Zhj3xkR5iaDSE8Tq8Z8w==
X-CSE-MsgGUID: eRX1MoMSTs6kEkRuiJfvPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75427451"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75427451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:36:37 -0700
X-CSE-ConnectionGUID: AO+Xfyd9QS+BOWH/hcsElw==
X-CSE-MsgGUID: 7GJ9tENOQCOFlTFaqVvmCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229388687"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 01:36:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Jj7-000000006Uv-2Eh9;
	Wed, 25 Mar 2026 08:36:33 +0000
Date: Wed, 25 Mar 2026 16:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 drivers/md/dm-bow.c:793:6: warning: no previous prototype for 'dm_bow_resume'
Message-ID: <202603251649.OUnETP9R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: d242fc9bf14a655afe36d65223e9e0d44d8ce636 [36/36] ANDROID: dm-bow: Fix 5.15 compatibility issue
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260325/202603251649.OUnETP9R-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251649.OUnETP9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251649.OUnETP9R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-bow.c:97:10: warning: no previous prototype for 'range_top' [-Wmissing-prototypes]
      97 | sector_t range_top(struct bow_range *br)
         |          ^~~~~~~~~
   drivers/md/dm-bow.c:103:5: warning: no previous prototype for 'range_size' [-Wmissing-prototypes]
     103 | u64 range_size(struct bow_range *br)
         |     ^~~~~~~~~~
   drivers/md/dm-bow.c:148:6: warning: no previous prototype for 'add_before' [-Wmissing-prototypes]
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         |      ^~~~~~~~~~
>> drivers/md/dm-bow.c:793:6: warning: no previous prototype for 'dm_bow_resume' [-Wmissing-prototypes]
     793 | void dm_bow_resume(struct dm_target *ti)
         |      ^~~~~~~~~~~~~
   drivers/md/dm-bow.c:1103:5: warning: no previous prototype for 'remap_unless_illegal_trim' [-Wmissing-prototypes]
    1103 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c: In function 'dm_bow_map':
   drivers/md/dm-bow.c:1139:51: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1139 |                                 /* pass-through */;
         |                                                   ^
   drivers/md/dm-bow.c:1146:51: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1146 |                                 /* pass-through */;
         |                                                   ^
   drivers/md/dm-bow.c: At top level:
   drivers/md/dm-bow.c:1259:5: warning: no previous prototype for 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1259 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:1292:12: warning: no previous prototype for 'dm_bow_init' [-Wmissing-prototypes]
    1292 | int __init dm_bow_init(void)
         |            ^~~~~~~~~~~
   drivers/md/dm-bow.c:1301:6: warning: no previous prototype for 'dm_bow_exit' [-Wmissing-prototypes]
    1301 | void dm_bow_exit(void)
         |      ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]


vim +/dm_bow_resume +793 drivers/md/dm-bow.c

   792	
 > 793	void dm_bow_resume(struct dm_target *ti)
   794	{
   795		struct mapped_device *md = dm_table_get_md(ti->table);
   796		struct bow_context *bc = ti->private;
   797		int ret;
   798	
   799		if (bc->kobj_holder.kobj.state_initialized)
   800			return;
   801	
   802		ret = kobject_init_and_add(&bc->kobj_holder.kobj, &bow_ktype,
   803					   &disk_to_dev(dm_disk(md))->kobj, "%s",
   804					   "bow");
   805		if (ret)
   806			ti->error = "Cannot create sysfs node";
   807	}
   808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
