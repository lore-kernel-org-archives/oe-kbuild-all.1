Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490EA13D2A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726826324; cv=none; b=fzGjrb/OK2m5AghCGC1HJrzeDGRiB4cyq0lIb92ofE7MfZLxuu3LUqunz26tn3kI3GDdnIO1y3TXCU6g3kGTFUZ9SL8Qz4WgUeTMHhFw4FNLPhO60cPM3Q7Bxp4ZaofObJcISKP3fvxZu7sZIjHFcPsSJj51mQ0+/QualIBHJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726826324; c=relaxed/simple;
	bh=ulXohrS0mueRTpDdk+vwbQ6+DLJLer77QcrJKulAvPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xb57MS7kxkC1bjVCzUka4pK1pvnAfo3ZIZR8QF4q++BgYtlNHtRQirqqKMz9OcXuTqW+E2b1BJPBTB+LQ+827v/l0wGQksX9oqe49sR21/ZQOS0LKFekZIL8pl7y45sVamUeqG16N2ByDBHPjOO8KVP52w1D8AKHopfWVzI5TgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO+YiFL0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO+YiFL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726826322; x=1758362322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulXohrS0mueRTpDdk+vwbQ6+DLJLer77QcrJKulAvPE=;
  b=hO+YiFL0KxOtmTuzBT3qw+yHv31YE3gxDzmTJoS3F01nEhH8D7QsAn8y
   G7GpBIYIBJIFB1F9gxNE0J9ksstfX8AUhctaexciEAZIV8LWBbNvfCGFF
   xXILjV/z0YCLtyXvdZFFJwibVAXhUqlUZsiRHwtSP0ElAghziLktH8A8l
   KzuQd7RnGbWtRninOonaQO1hF6oy3uVuIWue3kWpmqY9UuCfLKCMBvcpQ
   EvQO//O1BfGvZmpnl+6y8pbsnoqxdxGvM8S14mXya/qotpxrj+VcB4k3x
   HgCwqF8pxKcPWZ1yNIgaNNBVgCMS/4bVCESNJhWx1ZjV1/kB5910ddm8t
   A==;
X-CSE-ConnectionGUID: L6tGLNl9RmGmqaCwwUDMDg==
X-CSE-MsgGUID: yVRzaNy7Tme8xl3aC4Pn8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36394612"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="36394612"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 02:58:42 -0700
X-CSE-ConnectionGUID: /axp4PxFQAuiF+o2SzpP8A==
X-CSE-MsgGUID: DqsPZQ0+Sx+IhgCh5CwzRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70257965"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Sep 2024 02:58:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sraPN-000EFz-0M;
	Fri, 20 Sep 2024 09:58:37 +0000
Date: Fri, 20 Sep 2024 17:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3082/16779] versioncheck:
 ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22
 linux/version.h not needed.
Message-ID: <202409201703.KA1oBoQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   60c5d539014532e8a81ac01467dc47b2c67b77c7
commit: 46a597e7387fabf796a7fcdb4b930fb936abd8c4 [3082/16779] MGS-7263 VX504X08X-SW-99002-r44p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240920/202409201703.KA1oBoQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201703.KA1oBoQP-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_model_error_generator.c: 183: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_driver.c: 3454: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_policy.c: 426: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_time.c: 362: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware.c: 3196: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware_no_mali.c: 1672: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.c: 2838: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.h: 420: need linux/version.h
>> ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_reset_gpu.c: 640: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_sync_debugfs.c: 876: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_tiler_heap_reclaim.c: 371: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 778: need linux/version.h
   ./drivers/gpu/arm/midgard/jm/mali_kbase_jm_defs.h: 880: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 869: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 2161: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.h: 259: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence_ops.c: 111: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_gpuprops.c: 888: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_gwt.c: 275: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_prfcnt.c: 2024: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem.h: 2601: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_migrate.c: 712: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_migrate.h: 118: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_sync_android.c: 35 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_utility.h: 52: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_vinstr.c: 1136: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_malisw.h: 29 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c: 419: need linux/version.h
   ./drivers/gpu/arm/midgard/tl/mali_kbase_timeline_io.c: 465: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware_func.c: 7136: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c: 5738: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c: 4957: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h: 209: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c: 618: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dmabuf.c: 495: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_gfp.c: 1187: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_reserved_mem.c: 544: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.c: 984: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/freescale/gc_hal_kernel_allocator_cma.c: 669: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.c: 253: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.h: 175: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debugfs.h: 104: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: 3177: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c: 1375: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c: 153: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c: 7407: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_parameter.h: 480: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.c: 374: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.h: 145: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/default/gc_hal_kernel_platform_default.c: 1058: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: 2118: need linux/version.h
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./include/linux/priority_control_manager.h: 27 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
