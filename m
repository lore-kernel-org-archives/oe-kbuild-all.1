Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CFB226188
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631883; cv=none; b=fk+q2S6mmyz3vky2f1IKnYEXOyRSqopMSERbi0M5foeGQvv9Mrc9FW3oGVMELtaBKnsjo6sh2cxvVD6z6x8sOrW65xMnWs8ib9frxrI1d5oeYNMdURGQ9rgFz9s1i2GjZu7+f4f5bwiiX1hx6kg/Jz1p/Pe8LKHw4vDCdqJqxss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631883; c=relaxed/simple;
	bh=M0mDJSbMbTXLTvnfPY/vdFdwqtPC8QfmD1dIW21IEtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CsvCMkQHJa9k54dpnEj6cMimB3mpRPlcg8ltjHRgVGA6PlrWgKcXoGWX7dpZxKA8O1sA0InjPWVkpnTlKRWTD4B9pC2L2pgdDWViLjgNJwmqApa8hF82ILRvI93WjXmLQwkFKf2LgyZF+7CHsh41vJiAiJJnznwoPnUK2J5nBxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPb5Vc58; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPb5Vc58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749631881; x=1781167881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M0mDJSbMbTXLTvnfPY/vdFdwqtPC8QfmD1dIW21IEtM=;
  b=QPb5Vc58DV0U7M/EXHV15LGcHLEN2YWmbeMb9sXQw7NRVijTZo+YY9/S
   yO13yJ196fQQKevYqfp90QQo/Mte93AZe0QjvIT9kSlfyfAVseUzDUI9H
   VRKpVhjOrMla6aUWUqtgrY51j8fPrSo5e/b4Kb099JfShfzhNM4UtkAqY
   fY73LDB7Tafs16nxjBHOp7U/aEwqW88JcG1nqz7WQppsQZ5S6rYhBgNCb
   30eFh81GMW+mD6oMpXBnTKsuRTaCjrh185Hpv2yA+P986AZmSzFHlIUcq
   DpScofCn9ZhwDXij2WGHiPVi8jSmIqi1MDzNoRXfnr2QNItIl2Is8QfZk
   w==;
X-CSE-ConnectionGUID: LBQNNzf1SwqkGJ1saYGzQQ==
X-CSE-MsgGUID: noNtH74XTpOgaU1RQnrXIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="54396014"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="54396014"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:51:20 -0700
X-CSE-ConnectionGUID: twOerqLkRgStNV2oYJrOpw==
X-CSE-MsgGUID: SEIFL33FSIyItsD/N4w6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="178084891"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jun 2025 01:51:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPHAz-000ABs-0e;
	Wed, 11 Jun 2025 08:51:17 +0000
Date: Wed, 11 Jun 2025 16:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Kosina <jkosina@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1781/1841]
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.c: warning:
 EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202506111627.LFaLn8gQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   19a60293b9925080d97f22f122aca3fc46dadaf9
commit: 84c338d7bcf169dd0872756a615d24b14232f133 [1781/1841] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250611/202506111627.LFaLn8gQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111627.LFaLn8gQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111627.LFaLn8gQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_gpuvm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_managed.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_mipi_dbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_mipi_dsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_mode_config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_modeset_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_modeset_lock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_panel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_panel_backlight_quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_panel_orientation_quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_panic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_plane.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_plane_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_print.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_privacy_screen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_self_refresh_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_simple_kms_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_suballoc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_syncobj.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_vblank_work.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_vma_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_writeback.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/i915/gt/intel_rps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/i915/intel_gvt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/i915/intel_gvt_mmio_table.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/lib/drm_random.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/mcde/mcde_display.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/mediatek/mtk_cec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/panel/panel-samsung-s6e63m0.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/pl111/pl111_nomadik.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/pl111/pl111_versatile.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/rockchip/rockchip_drm_vop.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/rockchip/rockchip_rgb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/scheduler/sched_entity.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/scheduler/sched_fence.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/scheduler/sched_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/solomon/ssd130x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/sun4i/sun4i_frontend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/sun4i/sun4i_lvds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/sun4i/sun4i_rgb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/sun4i/sun4i_tcon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/sun4i/sun8i_tcon_top.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/tests/drm_kunit_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_agp_backend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_backup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_bo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_bo_util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_bo_vm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_execbuf_util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_pool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_range_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/ttm/ttm_tt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/channel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/context.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/context_bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/fence.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/job.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/mipi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/host1x/syncpt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/ipu-v3/ipu-cpmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/ipu-v3/ipu-ic-csc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/ipu-v3/ipu-ic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/ipu-v3/ipu-image-convert.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/ipu-v3/ipu-prg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/ipu-v3/ipu-vdi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/vga/vga_switcheroo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/greybus/connection.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/greybus/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/greybus/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/greybus/hd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/greybus/interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/greybus/operation.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/greybus/svc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/bpf/hid_bpf_dispatch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/hid-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/hid-input.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/hid-roccat-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/hid-roccat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/hid-sensor-hub.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/hidraw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/i2c-hid/i2c-hid-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/intel-ish-hid/ishtp/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/intel-ish-hid/ishtp/client-buffers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/intel-ish-hid/ishtp/client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/surface-hid/surface_hid_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/usbhid/hid-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/usbhid/hid-pidff.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hid/usbhid/hiddev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hsi/clients/ssi_protocol.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hsi/controllers/omap_ssi_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hsi/hsi_boardinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hsi/hsi_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hte/hte.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hv/channel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hv/channel_mgmt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hv/hv_proc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hv/mshv_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hv/mshv_root_hv_call.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hv/ring_buffer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hv/vmbus_drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwmon/adt7x10.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwmon/hwmon-vid.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwmon/hwmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwmon/ltc2947-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwmon/max1111.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwmon/nct6775-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwmon/pmbus/pmbus_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwmon/sch56xx-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwspinlock/hwspinlock_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/coresight/coresight-etm-perf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/coresight/coresight-platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/coresight/coresight-syscfg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/coresight/coresight-sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/coresight/coresight-tmc-etr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/coresight/coresight-trace-id.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/intel_th/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/intel_th/msu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/stm/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/hwtracing/stm/policy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/algos/i2c-algo-bit.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/algos/i2c-algo-pca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/algos/i2c-algo-pcf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/busses/i2c-amd-mp2-pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/busses/i2c-designware-slave.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/busses/i2c-pasemi-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/busses/i2c-piix4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/busses/i2c-viai2c-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-atr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-core-acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-core-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-core-of-prober.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-core-of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-core-slave.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-core-smbus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i2c/i2c-smbus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i3c/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/i3c/master/dw-i3c-master.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/adxl313_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/adxl345_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/adxl355_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/adxl367.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/adxl372.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/adxl380.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/bma400_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/bmc150-accel-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/bmi088-accel-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/fxls8962af-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/kionix-kx022a.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/kxsd9.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/mma7455_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/mma9551_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/accel/st_accel_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/adc/ad7091r-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/adc/ad7606.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/adc/ad_sigma_delta.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/adc/ltc2497-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/adc/qcom-vadc-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/adc/stm32-dfsdm-adc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/adc/stm32-dfsdm-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/afe/iio-rescale.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/buffer/industrialio-buffer-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/buffer/industrialio-buffer-dmaengine.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/buffer/kfifo_buf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/chemical/bme680_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/chemical/ens160_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/chemical/sps30.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/hid-sensors/hid-sensor-attributes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/hid-sensors/hid-sensor-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/inv_sensors/inv_sensors_timestamp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/ms_sensors/ms_sensors_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/ssp_sensors/ssp_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/ssp_sensors/ssp_iio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_buffer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/common/st_sensors/st_sensors_trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/dac/ad3552r-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/dac/ad5592r-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/dac/ad5686.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/dummy/iio_dummy_evgen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/iio/gyro/bmg160_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
