Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779CB1946F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 02:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726799271; cv=none; b=CScGll5eRIh4APLahHiQIanzlniTzV/SmbQezZLf4yMKq1rLPcM9TmipQUV6lFOePBr+zX8evZMRVL53lQ/kS2PwmB3SBtITdoE0feA6UiQWmC0z7sRkmbQYs+4/XoULKuidifcit+bszXhwDgD/VB9UCSacr8DQWVntdSVhZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726799271; c=relaxed/simple;
	bh=8oMENOJdO+lRToZ/RF6hTNT4RLyBP+fTtzIwR1MxPEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dn++xvA9Ho5klzgqslTCb+tO+MaeyJktgj+TzUuZF4h32jQFjNgUzlMDJCL744/wKq7UmKZEZ8kH7RVe5yxuFzgSSyM0Yh0nZq8m3M7F5J/JHkGrTtzNEHPaVEzqXJ48OUf78/ihBf5+yvoo2vVDIJps3PFGxlrNkAk4Ovv3KMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQV2mIP5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQV2mIP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726799270; x=1758335270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oMENOJdO+lRToZ/RF6hTNT4RLyBP+fTtzIwR1MxPEk=;
  b=fQV2mIP5NR4q/vYUUz43lQGU2D0bsO/JqNojxZkJqnNccMm3iV8sIKs1
   7gHgkREXLJsuM7V8dweqbCP+zFi/IkoI1/EUDL9iaHf+4N89rlghQ1KsW
   7WU81B0KZ0WG6ZqMWOa09lAhHXb8175FCGWdnMpThNDCvB7TyjaCWoVcZ
   bYuLmU30MYyHOx4vfcxrte/jkdRI1xrkKTwylMucbczHJjBYarAYSneuy
   MEV6o+6LQQslu/Leix6IiXLVCKCjDiMYDwoQaa4cKBwDapJM/O4zOy8H0
   3TDZn65n7MSO9kn+rM+dyYetPjTn0JrOR8924j/kEIfuy9UMEB/F9kpQA
   Q==;
X-CSE-ConnectionGUID: oGQJobwMQRKx5F/YISIoNQ==
X-CSE-MsgGUID: QAR/TeFKSSyvVcEYALgV9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36460495"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="36460495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 19:27:49 -0700
X-CSE-ConnectionGUID: ZZ7pCq52Q0WIj0NHQ8AFtw==
X-CSE-MsgGUID: ZRnuT+PBQ2u7A0/WguK7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="93411651"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Sep 2024 19:27:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srTN3-000DtE-2v;
	Fri, 20 Sep 2024 02:27:45 +0000
Date: Fri, 20 Sep 2024 10:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3078/16779] versioncheck:
 ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_tiler_heap_reclaim.c: 367: need
 linux/version.h
Message-ID: <202409201045.hPnUmkoy-lkp@intel.com>
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
commit: a745cb7145f307f958ec27ee2222e8b92ad5a10b [3078/16779] MGS-7263 VX504X08X-SW-99002-r40p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240920/202409201045.hPnUmkoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201045.hPnUmkoy-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_driver.c: 3342: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_policy.c: 426: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_time.c: 206: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf.c: 3330: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_defs.h: 1548: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware.c: 2912: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware_no_mali.c: 1597: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.c: 2362: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.h: 362: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_reset_gpu.c: 637: need linux/version.h
>> ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_tiler_heap_reclaim.c: 367: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 772: need linux/version.h
   ./drivers/gpu/arm/midgard/jm/mali_kbase_jm_defs.h: 866: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 771: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 1997: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.h: 179: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence_ops.c: 85: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_gpuprops.c: 915: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_pool.c: 30 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_sync_android.c: 35 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_utility.h: 52: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_malisw.h: 29 linux/version.h not needed.
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
