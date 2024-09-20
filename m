Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB95168BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726868776; cv=none; b=qdEbl5vITvRiVf3PM92Eg3/nagAMOlkOWqm2wykM0mu1TtQmQyZ+WgRW5xnrACxLlnmblbXpefask6tYlPWw4icxukEb+JRLZ9rVK5baOWzBGsk4kCiacrfqv8427W59Fv/s86ZtiEwg2cmL+TL9ovL/VqcO9Ol4I7mftz91KEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726868776; c=relaxed/simple;
	bh=H5kqfFSmyVg+MCGje3QdkzgtRZDqoI6Bgz2l9AJ2ato=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RolZhr4bvxPnFGdVhFP8w3zyi6vjdAX32xvSgow0AREbohfi92mocvEJ8idSIjXW+VcUQm2id/IoYjNvjkx218ZpcqCrGr0MUINAZu7diRuJ712FfJw6t/ALTFFmIwL75w3zAzIpP6jH3jQfaWAm+kLYA3Vk0mRjkYzESyblvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQA30pgi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQA30pgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726868774; x=1758404774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H5kqfFSmyVg+MCGje3QdkzgtRZDqoI6Bgz2l9AJ2ato=;
  b=RQA30pgi/829Fv3k0U82Ehr+fx71bM+6GXuiNjVCq2aQiP7Q3zldQy7/
   XUYnFxbDez69JFrnSCoqqJ8gRNPfGEhri8aTJOzxSbTB/BJUBwkd2St95
   F89tLzT/KGNQTz5m8G+vbxruYcdg0AH0O0x81+gHksnv7jQ4mLf1xo+WI
   qa4uPee2Ix2UXHMIBtOM0RMonVWo42uV2B0hNWJT9Eh3WSkMZftwVyc1+
   EOkdECQdhHM7fmI+BOwu/fqL8Ste6EGuooYuiFFaRPPiFAdQIVZEt0pQW
   TyrAe25suCRTSTkVdFBcs6RFHX7Kj64WBOzZZAuu1TDQBbYBT3C/iKk76
   g==;
X-CSE-ConnectionGUID: bxy91JoYQZ23SNnoRT4hcQ==
X-CSE-MsgGUID: 2zZEVCiaTTKKy+z7wpuhTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25839614"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="25839614"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 14:46:14 -0700
X-CSE-ConnectionGUID: 8P/DXqSsR9KMXuFLt89WLg==
X-CSE-MsgGUID: xBYQw04EQzqgJMQONCRDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="75194749"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2024 14:46:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srlS6-000EsX-1P;
	Fri, 20 Sep 2024 21:46:10 +0000
Date: Sat, 21 Sep 2024 05:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 7416/16782] versioncheck:
 ./drivers/gpu/arm/valhall-inc/linux/priority_control_manager.h: 27
 linux/version.h not needed.
Message-ID: <202409210517.2mR8bVbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   d023c381fa6161a7af966abaad8e7d9a997f07e7
commit: 20bdfc9c36257111c39bcdd4fa6daec38aed6452 [7416/16782] MGS-7531 [#nxp] mali gpu: default plat is imx
reproduce: (https://download.01.org/0day-ci/archive/20240921/202409210517.2mR8bVbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210517.2mR8bVbn-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/hwtracing/sources/ela/coresight_mali_source_ela_core.c: 438: need linux/version.h
   ./drivers/gpu/arm/hwtracing/sources/etm/coresight_mali_source_etm_core.c: 280: need linux/version.h
   ./drivers/gpu/arm/hwtracing/sources/itm/coresight_mali_source_itm_core.c: 265: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_model_error_generator.c: 172: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_driver.c: 3592: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_policy.c: 440: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_time.c: 367: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware.c: 3165: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware_no_mali.c: 1639: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.c: 2882: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_reset_gpu.c: 628: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_tiler_heap_reclaim.c: 393: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 731: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 912: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_debug_job_fault.c: 544: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 2168: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence_ops.c: 95: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_gwt.c: 260: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_prfcnt.c: 2139: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem.h: 2598: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_linux.h: 513: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_migrate.c: 710: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_migrate.h: 127: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_sync_android.c: 35 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_utility.h: 52: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_malisw.h: 29 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c: 399: need linux/version.h
   ./drivers/gpu/arm/midgard/tl/mali_kbase_timeline_io.c: 456: need linux/version.h
>> ./drivers/gpu/arm/valhall-inc/linux/priority_control_manager.h: 27 linux/version.h not needed.
>> ./drivers/media/i2c/os08a20/os08a20_mipi.c: 33 linux/version.h not needed.
   ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware_func.c: 7135: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c: 5744: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c: 4951: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h: 209: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c: 618: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dmabuf.c: 495: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_gfp.c: 1192: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_reserved_mem.c: 545: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.c: 985: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/freescale/gc_hal_kernel_allocator_cma.c: 629: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.c: 253: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.h: 175: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debugfs.h: 104: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: 3177: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c: 1376: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c: 153: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c: 7408: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_parameter.h: 480: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.c: 374: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.h: 145: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/default/gc_hal_kernel_platform_default.c: 1058: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: 2070: need linux/version.h
   ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_845/hantrodec_845s.c: 40 linux/version.h not needed.
   ./drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_v4l2/vsi-v4l2.c: 41 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/system/sys_io.c: 33 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: 40 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm_port.c: 40 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c: 41 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_sysfs.h: 37 linux/version.h not needed.
   ./drivers/staging/fsl_ppfe/pfe_eth.c: 13 linux/version.h not needed.
   ./drivers/staging/fsl_ppfe/pfe_hif_lib.c: 7 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/staging/media/imx/imx8-mipi-csi2-sam.c: 42 linux/version.h not needed.
   ./net/tsn/genl_tsn.c: 12 linux/version.h not needed.
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
