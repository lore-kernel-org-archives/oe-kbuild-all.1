Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3EA383C7F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206086; cv=none; b=LCjTeWAojandmql5lvMWmVNr7bpUdQHweVt4V6Hb7YpJrvI+O2mHbTO+2+4hHXsyqo6PunX20vh2CcroD93qm8vTnhNjLRB/aRe+3hsQxSrjHaOzWneSMPymqmi1aIa1EWUPGXXqtLrHWkbwwrbB7XC03UNNlab790WwKJcT5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206086; c=relaxed/simple;
	bh=leYePLzj63/WKxDT55eJY6xp5Tpn34zYJFxGOSEBqvg=;
	h=Date:From:Cc:Subject:Message-ID; b=UZfkanJaY6R8PDYY1OYkHXaO9CeHSM58R/Hex9kxJ8FWe9Gh6cvtkkJ5l4usldqqTUdLSxzjfGG6wuCZLNwIs1Hm1HzDJwWsuY3N5DjYJCzojXAj7+rRfTHFefCq1W2jlmzdwj5xFfSzdggHh6jgD5TJgX2ago3x+RCD292/XYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu76hRbN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu76hRbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206085; x=1806742085;
  h=date:from:cc:subject:message-id;
  bh=leYePLzj63/WKxDT55eJY6xp5Tpn34zYJFxGOSEBqvg=;
  b=Tu76hRbN8aldzfiSpUIDARMfmZw4sL06d7oI5+BHHrMtynJgWxdSFIAb
   RRGVznVPgMNjgP+0ZKgHYHKC0kmGpKy5i5R4cr+nzZMH+8uuNeNKZ4qf6
   Y9mraVn0OFVGymnmIXqHcSpHxLzbjIWEJVb0m+XFPzygpnMp6otbxL0H4
   u+8MPk9Ld4fL1/48eC6dxvjnZrUE9yfkqng0w1FpqStaO+xhGnasaT5go
   rhNuXRmjOrJ8vTDgaS7eG4DKT2LQVGh3FRGnjC3/35JhLQMBj68r3KxNq
   WkP9yUF8GrNCWoO5Df+sKV3242sH+zKyLdTdANax9jmO8tv4RrbcwlxI5
   w==;
X-CSE-ConnectionGUID: 7C1xIzMeTjeuOmKgiHQXfQ==
X-CSE-MsgGUID: NSBbGV/OScOclYrkKUamYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87658612"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="87658612"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:48:01 -0700
X-CSE-ConnectionGUID: AX7Ul0NLQxS9D8QYYyO4kQ==
X-CSE-MsgGUID: O9TrcfdBQqiA5Q1xd8T+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232014710"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2026 01:48:00 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aC5-0000000017b-19A5;
	Fri, 03 Apr 2026 08:47:57 +0000
Date: Fri, 03 Apr 2026 16:47:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: drivers/gpu/drm/xe/xe_pci.c:820:undefined reference to
 `xe_configfs_check_device'
Message-ID: <202604031646.JxCrIBov-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d8a9a4b11a137909e306e50346148fc5c3b63f9d
commit: 13dda74a164b570d93d412e812dc80549506410f drm/xe/configfs: Dump custom settings when binding
date:   7 months ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260403/202604031646.JxCrIBov-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031646.JxCrIBov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 13dda74a164b ("drm/xe/configfs: Dump custom settings when binding")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031646.JxCrIBov-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   drivers/gpu/drm/xe/xe_guc.c:91:(.text+0xb0a): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.c:91:(.text+0xb0a): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x97a): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x97a): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
>> drivers/gpu/drm/xe/xe_pci.c:820:(.text+0x602): undefined reference to `xe_configfs_check_device'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:820:(.text+0x602): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x30e): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x30e): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x380): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x380): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x6fe): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   drivers/gpu/drm/xe/xe_survivability_mode.c:150:(.text+0x14e): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:150:(.text+0x14e): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:227:(.text+0x1b0): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:227:(.text+0x1b0): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:232:(.text+0x1ca): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:232:(.text+0x1ca): undefined reference to `xe_configfs_clear_survivability_mode'


vim +820 drivers/gpu/drm/xe/xe_pci.c

   793	
   794	/*
   795	 * Probe the PCI device, initialize various parts of the driver.
   796	 *
   797	 * Fault injection is used to test the error paths of some initialization
   798	 * functions called either directly from xe_pci_probe() or indirectly for
   799	 * example through xe_device_probe(). Those functions use the kernel fault
   800	 * injection capabilities infrastructure, see
   801	 * Documentation/fault-injection/fault-injection.rst for details. The macro
   802	 * ALLOW_ERROR_INJECTION() is used to conditionally skip function execution
   803	 * at runtime and use a provided return value. The first requirement for
   804	 * error injectable functions is proper handling of the error code by the
   805	 * caller for recovery, which is always the case here. The second
   806	 * requirement is that no state is changed before the first error return.
   807	 * It is not strictly fulfilled for all initialization functions using the
   808	 * ALLOW_ERROR_INJECTION() macro but this is acceptable because for those
   809	 * error cases at probe time, the error code is simply propagated up by the
   810	 * caller. Therefore there is no consequence on those specific callers when
   811	 * function error injection skips the whole function.
   812	 */
   813	static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
   814	{
   815		const struct xe_device_desc *desc = (const void *)ent->driver_data;
   816		const struct xe_subplatform_desc *subplatform_desc;
   817		struct xe_device *xe;
   818		int err;
   819	
 > 820		xe_configfs_check_device(pdev);
   821	
   822		if (desc->require_force_probe && !id_forced(pdev->device)) {
   823			dev_info(&pdev->dev,
   824				 "Your graphics device %04x is not officially supported\n"
   825				 "by xe driver in this kernel version. To force Xe probe,\n"
   826				 "use xe.force_probe='%04x' and i915.force_probe='!%04x'\n"
   827				 "module parameters or CONFIG_DRM_XE_FORCE_PROBE='%04x' and\n"
   828				 "CONFIG_DRM_I915_FORCE_PROBE='!%04x' configuration options.\n",
   829				 pdev->device, pdev->device, pdev->device,
   830				 pdev->device, pdev->device);
   831			return -ENODEV;
   832		}
   833	
   834		if (id_blocked(pdev->device)) {
   835			dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
   836				 pdev->vendor, pdev->device);
   837			return -ENODEV;
   838		}
   839	
   840		if (xe_display_driver_probe_defer(pdev))
   841			return -EPROBE_DEFER;
   842	
   843		err = pcim_enable_device(pdev);
   844		if (err)
   845			return err;
   846	
   847		xe = xe_device_create(pdev, ent);
   848		if (IS_ERR(xe))
   849			return PTR_ERR(xe);
   850	
   851		pci_set_drvdata(pdev, &xe->drm);
   852	
   853		xe_pm_assert_unbounded_bridge(xe);
   854		subplatform_desc = find_subplatform(xe, desc);
   855	
   856		pci_set_master(pdev);
   857	
   858		err = xe_info_init_early(xe, desc, subplatform_desc);
   859		if (err)
   860			return err;
   861	
   862		err = xe_device_probe_early(xe);
   863		/*
   864		 * In Boot Survivability mode, no drm card is exposed and driver
   865		 * is loaded with bare minimum to allow for firmware to be
   866		 * flashed through mei. Return success, if survivability mode
   867		 * is enabled due to pcode failure or configfs being set
   868		 */
   869		if (xe_survivability_mode_is_enabled(xe))
   870			return 0;
   871	
   872		if (err)
   873			return err;
   874	
   875		err = xe_info_init(xe, desc);
   876		if (err)
   877			return err;
   878	
   879		err = xe_display_probe(xe);
   880		if (err)
   881			return err;
   882	
   883		drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d cscfi:%d",
   884			desc->platform_name,
   885			subplatform_desc ? subplatform_desc->name : "",
   886			xe->info.devid, xe->info.revid,
   887			xe->info.is_dgfx,
   888			xe->info.graphics_name,
   889			xe->info.graphics_verx100 / 100,
   890			xe->info.graphics_verx100 % 100,
   891			xe->info.media_name,
   892			xe->info.media_verx100 / 100,
   893			xe->info.media_verx100 % 100,
   894			str_yes_no(xe->info.probe_display),
   895			xe->info.dma_mask_size, xe->info.tile_count,
   896			xe->info.has_heci_gscfi, xe->info.has_heci_cscfi);
   897	
   898		drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, B:%s)\n",
   899			xe_step_name(xe->info.step.graphics),
   900			xe_step_name(xe->info.step.media),
   901			xe_step_name(xe->info.step.basedie));
   902	
   903		drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s)\n",
   904			str_yes_no(xe_device_has_sriov(xe)),
   905			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
   906	
   907		err = xe_pm_init_early(xe);
   908		if (err)
   909			return err;
   910	
   911		err = xe_device_probe(xe);
   912		if (err)
   913			return err;
   914	
   915		err = xe_pm_init(xe);
   916		if (err)
   917			goto err_driver_cleanup;
   918	
   919		drm_dbg(&xe->drm, "d3cold: capable=%s\n",
   920			str_yes_no(xe->d3cold.capable));
   921	
   922		return 0;
   923	
   924	err_driver_cleanup:
   925		xe_pci_remove(pdev);
   926		return err;
   927	}
   928	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
