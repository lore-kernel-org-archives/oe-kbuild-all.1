Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CB020C473
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650912; cv=none; b=D2OuFdpuiAmhorbsdwQvJeuC0OkImqyMwywrLNLUXYx/+VAKk+QMsbnhuflDSk0SqXaL/iBW6Os01FPprOOl48TF4gJOIAgGl49EsAJRzjJqRBVmLRi9h/+Ps0t902Pe08dK/z8ARE1cUkvp7jDQlBhiP5DG8/VCVD1Jp3gX9Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650912; c=relaxed/simple;
	bh=gCD1vd6PLNw9t2BezbOcnTtAOW1N7ANKt6Ozy10GZBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s35C0Nt6+Xk7XXbDpcL1L6KWelN8k+BcFg2AUyIi11+zJSayt4Hyx41aoJfzuNKJ6yij+OdCGJJ3Uhoff+iOE4QiJia2C2umcIBIITBcINQ1ONXWK1sGzXiK2mENDH1lz0j/a7U4waZDVHhylW806AuZ4l2zP8tq7rEN77KqGnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjfZnzyG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjfZnzyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728650909; x=1760186909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gCD1vd6PLNw9t2BezbOcnTtAOW1N7ANKt6Ozy10GZBI=;
  b=AjfZnzyGaLpEZmkYlx9sVvni9NIi63iwGYW3dTQ+JziIvFvTAZmJo/CF
   yYMuQlg3OlQLFVTrXPtgnEyuKB7pUYylrGwcYOqa7oouo5JQlc4eMsbOM
   GZYwoJ+I+wlBVk3A7YU1o26XhMNgdNZbR4uxFvoL2XolggT8s14TSFezu
   mlYs5c4h1xd+8oEx3N71pK7qu20/q11hBFSIQxJ5SFLOEEMJx4M6wKZr3
   5KwkQMMdLmQ6xyi41+sEkHweRvOJrYNZ8dlpKO45FUCGFV6haIMW99WK8
   afG1JSOpeR8OaKq04HZcucK3r80yXGJYMl8AwHiQxF8WuedL94XtRQ32y
   w==;
X-CSE-ConnectionGUID: owip1LffTkKSEjOLwI8msQ==
X-CSE-MsgGUID: FvYSa3YpQd2zQgo7mRd5Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="53454855"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="53454855"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:48:23 -0700
X-CSE-ConnectionGUID: onserDuwSbSacHdu20ckaw==
X-CSE-MsgGUID: FvMR66BCQwu8K4AqwEyjlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81517070"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2024 05:48:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szF41-000CJJ-1P;
	Fri, 11 Oct 2024 12:48:13 +0000
Date: Fri, 11 Oct 2024 20:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 14384/17816] versioncheck:
 ./drivers/gpu/arm/midgard/mali_kbase_debug_mem_view.c: 391: need
 linux/version.h
Message-ID: <202410112024.CxAiwmZZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   d45fcfc7eac49282ddaa08a771318a9b0f4a01bc
commit: ab98d02acf3d02798c1ec4aea0e0270806bf99c8 [14384/17816] MGS-7702 gpu: Integrate Mali DDK r49p0
reproduce: (https://download.01.org/0day-ci/archive/20241011/202410112024.CxAiwmZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410112024.CxAiwmZZ-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_driver.c: 3629: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_policy.c: 440: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_time.c: 406: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware.c: 3189: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware_no_mali.c: 1664: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.c: 2884: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_reset_gpu.c: 641: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_tiler_heap_reclaim.c: 395: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 731: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 814: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_debug_job_fault.c: 544: need linux/version.h
>> ./drivers/gpu/arm/midgard/mali_kbase_debug_mem_view.c: 391: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 2119: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence_ops.c: 95: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_gwt.c: 259: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_prfcnt.c: 2139: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem.h: 2628: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_linux.h: 513: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_migrate.c: 714: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_migrate.h: 127: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_malisw.h: 29 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/thirdparty/mali_kbase_mmap.c: 548: need linux/version.h
   ./drivers/gpu/arm/midgard/tl/mali_kbase_timeline_io.c: 456: need linux/version.h
   ./drivers/gpu/arm/valhall-inc/linux/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/input/touchscreen/focaltech_core.h: 49 linux/version.h not needed.
   ./drivers/media/i2c/os08a20/os08a20_mipi.c: 34 linux/version.h not needed.
   ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware_func.c: 7134: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c: 5743: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c: 4950: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h: 208: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c: 617: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dmabuf.c: 494: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_gfp.c: 1191: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_reserved_mem.c: 544: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.c: 984: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/freescale/gc_hal_kernel_allocator_cma.c: 628: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.c: 252: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.h: 174: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debugfs.h: 103: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: 3173: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c: 1370: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c: 152: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c: 7416: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_parameter.h: 479: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.c: 373: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.h: 144: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/default/gc_hal_kernel_platform_default.c: 1057: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: 2069: need linux/version.h
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
