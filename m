Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3164013E02D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726784249; cv=none; b=U3UR9GxxnjTxtzDbO/AYhUVEdBvPXO0+Z2wwlHpCWaYEy1+pkCNObjvutfyGdm0CCwbiU7uvFbR7e6P0qji3htpptXJkS2YxHS5dpm30uA/5Iorgb6A4jEZtVELbNKSeHYnyHY+mjMqz8kMAj4LYbVmsgIPA8v1ZpaSZKJYtfww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726784249; c=relaxed/simple;
	bh=TOk9WCGi961w2AyfoeiRtCnid2OdtOWt1xL+8Z31S+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fT4dIoWjZ7qIk95j8+247l2yjkyeB060rxvhzgMK28RBmHeTUi5PILKoqK+qTlbXMgLHTxbdYX+vDu4jMyPbht34x0vLI8D78DM0b5r24HY61YxTBPzWP7Jga44IfV5Tgrv+Vm9dEqUCHL36t/PzEEAq6lYeEh5k7Apyqg6POe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nes79Vox; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nes79Vox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726784247; x=1758320247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TOk9WCGi961w2AyfoeiRtCnid2OdtOWt1xL+8Z31S+U=;
  b=nes79VoxwiF5vgS+gS7E4OW54waiQALpieWGwwxxtZEsO100Pp/ZOKi/
   xytSYV+iouIwcTwgTR1VDZ1wGFNRMCTS8XrCE8QQSAaT7p38PxMbBqgBP
   ZQhjIaPkVCpQumOerV6vNPh6R8LlQGJXU+anIE5Tzhvrx82BktrBjIzfL
   /ewpiUM3fVeKey0R6fKqAw+QXw8M6hAAjf1x63Vnba+SrBvlLy0hCYMmq
   AMhF8JXvv23SRDm6Vr5iRe6BG0CVHs4S64jGoJFNuXNN9VyGHZX+ZYDId
   jxcD5H8JxsYLVxza73WdRVLJ2Keb75i3YMMIFXvJj6cElbA3CvDo/DdKh
   Q==;
X-CSE-ConnectionGUID: yJKd7y/xS26Gxa1O/FN3mw==
X-CSE-MsgGUID: oZh6OhYpRjCLSDKQry67tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="48307847"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="48307847"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 15:17:27 -0700
X-CSE-ConnectionGUID: EWUUJ0gcTPqbYEE6cxhwYg==
X-CSE-MsgGUID: Ur05kUpITHeRAe0M1jyjVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70328189"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2024 15:17:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srPSl-000DkO-1s;
	Thu, 19 Sep 2024 22:17:23 +0000
Date: Fri, 20 Sep 2024 06:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3074/16779] versioncheck:
 ./drivers/gpu/arm/midgard/mali_kbase_kinstr_jm.h: 69 linux/version.h not
 needed.
Message-ID: <202409200606.PwxkICVp-lkp@intel.com>
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
commit: 1e42ada4935d69861999ca692cdaedc5e1dbcd0b [3074/16779] MGS-7263 VX504X08X-SW-99002-r38p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240920/202409200606.PwxkICVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409200606.PwxkICVp-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_driver.c: 3216: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_policy.c: 426: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_time.c: 206: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware.c: 2745: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware_no_mali.c: 1577: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.c: 2334: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.h: 358: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_reset_gpu.c: 694: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 772: need linux/version.h
   ./drivers/gpu/arm/midgard/jm/mali_kbase_jm_defs.h: 894: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 769: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 1986: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.c: 153: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.h: 293: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence_ops.c: 85: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_gpuprops.c: 913: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_jd_debugfs.c: 244: need linux/version.h
>> ./drivers/gpu/arm/midgard/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_mem_linux.h: 467: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_pool.c: 29 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_sync.h: 219: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_sync_android.c: 35 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_utility.h: 52: need linux/version.h
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
