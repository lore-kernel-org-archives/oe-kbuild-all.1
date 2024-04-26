Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95F436126
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 21:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167614; cv=none; b=NsF6b/LLwIYJwTh98tMvE507qY5+HY7Z5cfKqUUoBK1wYOcGMEtCvWbP4Ns+GkbIQ5yLCcmRy2hSztdOCpOwZEOG+WygnQVNjMt5BHL4/yk6I4GvBZZHPujiuQRziNEMvxLtNKANcymHwgh7CQ5SsTSdgMuz5b0KEv7uzaTMy7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167614; c=relaxed/simple;
	bh=7JgnVu+D3POTmO6vrd1f35SREQ4bI1aRDxJoTTNqHhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiKMdoV1JkNLFkuQEFQXlQf6d8/C177dGrlQODYiKRtGYxZUum5YrClnJQmbKlMfCELk4WbCtrI5ktbZaLGR+k8SoKRVA/ei2tWMriDZPhK6jbaAypIJYft2jsDgS/wl8INfp60CnHe/bxTjYUao9ko5hLcIyWnetBXa8jjBiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zy4elLla; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy4elLla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714167613; x=1745703613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7JgnVu+D3POTmO6vrd1f35SREQ4bI1aRDxJoTTNqHhc=;
  b=Zy4elLlausnl9za0G2Vy13+jOela8Lda+veLfcWyMjOWIwP4MsBIfQGp
   OcA+52Bti/xxGbvwGUfGSQfG0sJ9IjtD0dC/hToou34oIlGT/84QqkBKA
   UGknl8+UVrD6kvRAILQ6bIp7+aJMf61JqftiUrZpEh3L19EbfCH9ekpGc
   eI6cgkw8LAM6y2mpwhXOwKwvWIn/oVyowBSNvJTfblHGumColqAFQKO9X
   lC3KMDlGDlBv61qLNSU2WQxgPIbjL19i7w+bslnC+f6OSeCqTJR/5rETW
   zaWHLDns0E5IRQVVyLKDWWsNExJwqKA72Td/G6r9WZcQYmN1CTqO5q9Sf
   g==;
X-CSE-ConnectionGUID: TBJTfY+3RwCwN1+XTs8UVA==
X-CSE-MsgGUID: VVswC/hfRKKgCrTQdu+sZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="32416779"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="32416779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 14:40:12 -0700
X-CSE-ConnectionGUID: UXRevgJxRaCeRRqL4PWEhQ==
X-CSE-MsgGUID: XpVgDwlLS6a7wrJlf18Onw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25943463"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Apr 2024 14:40:12 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0TIf-0004Ji-0W;
	Fri, 26 Apr 2024 21:40:09 +0000
Date: Sat, 27 Apr 2024 05:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3071/11728] versioncheck:
 ./drivers/gpu/arm/midgard/mali_kbase_kinstr_prfcnt.c: 2120: need
 linux/version.h
Message-ID: <202404270514.Ber4yRLB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: c26fa0d74e998d4e32fa3485dce72b37e121298c [3071/11728] MGS-7263 VX504X08X-SW-99002-r35p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240427/202404270514.Ber4yRLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270514.Ber4yRLB-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_clk_rate_trace_mgr.c: 369: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_driver.c: 3108: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_pm_policy.c: 408: need linux/version.h
   ./drivers/gpu/arm/midgard/backend/gpu/mali_kbase_time.c: 167: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf.c: 2992: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_csg_debugfs.c: 685: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware.c: 2440: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_firmware_no_mali.c: 1437: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.c: 2222: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu.h: 354: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_kcpu_debugfs.c: 197: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_reset_gpu.c: 651: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_tl_reader.c: 532: need linux/version.h
   ./drivers/gpu/arm/midgard/csf/mali_kbase_csf_trace_buffer.c: 687: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 772: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa_debugfs.c: 322: need linux/version.h
   ./drivers/gpu/arm/midgard/jm/mali_kbase_jm_defs.h: 894: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 680: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_debug_job_fault.c: 574: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 1945: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_dvfs_debugfs.c: 98: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.c: 153: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.h: 283: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence_ops.c: 83: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_gpuprops.c: 887: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_jd_debugfs.c: 252: need linux/version.h
>> ./drivers/gpu/arm/midgard/mali_kbase_kinstr_prfcnt.c: 2120: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_linux.h: 478: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_pool.c: 29 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/mali_kbase_mem_pool_debugfs.c: 190: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mem_profile_debugfs.c: 135: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_pbha_debugfs.c: 140: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_sync.h: 216: need linux/version.h
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
