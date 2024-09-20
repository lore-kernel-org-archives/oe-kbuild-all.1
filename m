Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B751154907
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726816409; cv=none; b=qR5v9n17icSdMImjd3R3Ob78hZqsNDIXUAjqq9m8seJiQ7yOO0+s52JpZDu0/60Oj6VPTvz0MSoBLofQqjguH0WAWCFLl9jbPwfmioHJYeulSr1a8my3632+yR7Htx3a83bfSMFAfJ4PTUFNyY7QsxOsXr858ds4ZCd3RNe3m64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726816409; c=relaxed/simple;
	bh=1qEDgOiXuVLaQgcEHfzCPV9CTT6MEhKDT90bqWht5fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BXD+4cRWWfNNP/KA2eXH0p4lEV0+bnOSAgeuh7yihVs5oqMVg7mHi9WvBy2UIrCT2uEisBaW8PEcJXllvUjG33BypykGcUX7dedSWAGdkh+IaL4O0VnkJknb7+I8louo07q8Me9ehrn9o5XFGBUvC8s1eK0jbmW2wlyZdfiY1Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifEtfzj6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifEtfzj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726816407; x=1758352407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qEDgOiXuVLaQgcEHfzCPV9CTT6MEhKDT90bqWht5fs=;
  b=ifEtfzj6wWbGmxK4m1fNCQ+/Nf++Mcx+qDEEm9Z6gxL+zH8ywi/7kEXm
   hlgd6aQMwEJ2v6oJP/38wFiKdCMBW8/vM71e/ygc0Ce2RjltriDfftp7W
   ZLSGaql7mg71vut+qd4uh/GhCpwudjvsasvgBnd/wkIEzZk+PzW7NbHLS
   eEptsR6vvOXQ1BZO8dJTSZUgjgSNUR3d2gD77XwFM1Acw0Kmo7rQmM5wK
   0uda8jiwciLzpw9MUke+/zV0xU32RbzdttH5qVIHwIpO2yRn2SmSJUBV4
   bBsTzNuHefA69wc59LHeDXAPkPx6fj9BGVReB12LZ7xslsNHbDIuKA+a8
   Q==;
X-CSE-ConnectionGUID: DM9yX8XXT+a6Y8lDWAvUXw==
X-CSE-MsgGUID: /QfB82HHTsyWTIHcuSuSEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25756931"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25756931"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 00:13:27 -0700
X-CSE-ConnectionGUID: //twBcE7QM66tVQxsHl1zA==
X-CSE-MsgGUID: eIW75RNRT9uO85KuoR1bJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70071717"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Sep 2024 00:13:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srXpS-000E4K-2y;
	Fri, 20 Sep 2024 07:13:22 +0000
Date: Fri, 20 Sep 2024 15:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3081/16779] versioncheck:
 ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_model_error_generator.c:
 183: need linux/version.h
Message-ID: <202409201543.Y0jyivaI-lkp@intel.com>
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
commit: cb0ed2c5d0052120242801b7f8bbf6f6995e17d2 [3081/16779] MGS-7263 VX504X08X-SW-99002-r43p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240920/202409201543.Y0jyivaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201543.Y0jyivaI-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_model_error_generator.c: 183: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_driver.c: 3417: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_policy.c: 426: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_time.c: 279: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware.c: 3144: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware_no_mali.c: 1661: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.c: 2595: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.h: 384: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_reset_gpu.c: 637: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_sync_debugfs.c: 788: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_tiler_heap_reclaim.c: 371: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 778: need linux/version.h
   ./drivers/gpu/arm/midgard/jm/mali_kbase_jm_defs.h: 878: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 745: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 2080: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.h: 259: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence_ops.c: 111: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_gpuprops.c: 888: need linux/version.h
>> ./drivers/gpu/arm/midgard/mali_kbase_gwt.c: 275: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_prfcnt.c: 2021: need linux/version.h
>> ./drivers/gpu/arm/midgard/mali_kbase_mem.h: 2570: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_migrate.c: 635: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_migrate.h: 108: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_sync_android.c: 35 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_utility.h: 52: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_vinstr.c: 1132: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_malisw.h: 29 linux/version.h not needed.
>> ./drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c: 420: need linux/version.h
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
