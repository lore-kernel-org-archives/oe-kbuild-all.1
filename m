Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5848C34EEFA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449792; cv=none; b=OWbUkE74TyrwYfuS7e5+lzDx4SEwr+VSk6gwxRj/j2ozf7e52geIUqEzvXiCNMELvGHvEHTPBF7dyuhiUQmcrbYo0HSpadY0jKaQJWDnNR+wvBOgQ2F4Z9Uq/s45uDTZg2G1lorX1XaUJ8O7dUdNNL7Ip+TsrdmVcegmUpO5S1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449792; c=relaxed/simple;
	bh=TiZNoeFJiyu+qDo5j30RXDoRu4nKlIw4WOS5uerimwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvZnQ+8RbldMSXpMtNwjtqZxOamMoxJWvwGEo4+uEM7QALfb3SLYa+OAg9NS20sWaEZBLpr8LajWP+iJ1QWVFtRBfINNqp5XRq+t0YspEIptSwEDSfa650KmVZgrbEFpxCEsDCYWnpr9zigDvSWVj88nPb6opf/qWyDS6RKt1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVQqWUD7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVQqWUD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762449790; x=1793985790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TiZNoeFJiyu+qDo5j30RXDoRu4nKlIw4WOS5uerimwo=;
  b=aVQqWUD7qj+ofYL7Avuoaay0CsrRULWteTW1ZG8puQPbBjOCWSOSMI8g
   C1t5GBwjwatgEZ9N98Ik2j2G4JYgxUKJ48zNvMm0WsFnbAxBIRAJeNox6
   e79qqhrNBnPLtcPQJzzrCtDZl9J5GC9qRaFU+cTfZNgbryOrbocnVPos6
   AJye4o8Sf2ksh0vVermhcYfr/4vgjjo+/WOY/4M0gnyK1hWR4kIvju62s
   MoPCvGMayr6z4V5MzqwtXx/dDyM/Yf/DInLsFmEh0np61Ld7f7bZqW8K9
   zUeOkVZ4iYlCU8t8AY7xiTqhBw1v1sYQnFqvHKMeaLP2tueH98f9Ziv6O
   Q==;
X-CSE-ConnectionGUID: tSP7zzlsQ7mFylK5z4eBPg==
X-CSE-MsgGUID: rf2DCMNiQlWRPjQVY3GJnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75948712"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="75948712"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 09:23:09 -0800
X-CSE-ConnectionGUID: tXG0pCMCSjO4kQ45Z9Qj2A==
X-CSE-MsgGUID: H0ALhj2ZSh2p1t8tYT0dAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192861697"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2025 09:23:08 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vH3hS-00000000356-3Vxu;
	Thu, 06 Nov 2025 17:23:06 +0000
Date: Thu, 6 Nov 2025 18:22:13 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 270/270] versioncheck:
 ./drivers/gpu/arm/mali/device/mali_kbase_device.c: 636: need linux/version.h
Message-ID: <202511061852.3HoC5IUU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   ed8c1ef868e02dc4375d19c4547cee51e81de3dc
commit: ed8c1ef868e02dc4375d19c4547cee51e81de3dc [270/270] CHROMIUM: uprev kbase to Mali DDK r54p1
reproduce: (https://download.01.org/0day-ci/archive/20251106/202511061852.3HoC5IUU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061852.3HoC5IUU-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3699: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 456: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_time.c: 418: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware.c: 3422: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1679: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.c: 2960: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 645: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 395: need linux/version.h
>> ./drivers/gpu/arm/mali/device/mali_kbase_device.c: 636: need linux/version.h
   ./drivers/gpu/arm/mali/include/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/arm/mali/ipa/mali_kbase_ipa.c: 731: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase.h: 799: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_debug_job_fault.c: 544: need linux/version.h
>> ./drivers/gpu/arm/mali/mali_kbase_debug_mem_view.c: 391: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_defs.h: 2151: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence_ops.c: 95: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gwt.c: 266: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_prfcnt.c: 2139: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem.h: 2607: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_linux.h: 513: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.c: 756: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.h: 131: need linux/version.h
   ./drivers/gpu/arm/mali/platform/mediatek/mt8183_mali_kbase_runtime_pm.c: 84: need linux/version.h
>> ./drivers/gpu/arm/mali/thirdparty/mali_kbase_mmap.c: 538: need linux/version.h
   ./drivers/gpu/arm/mali/tl/mali_kbase_timeline_io.c: 462: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3668: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 459: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_time.c: 418: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_firmware.c: 3437: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1563: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_kcpu.c: 2960: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 730: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 399: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/include/linux/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/mediatek/arm/mali/ipa/mali_kbase_ipa.c: 731: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase.h: 795: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_debug_job_fault.c: 544: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_debug_mem_view.c: 391: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_defs.h: 2145: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_fence_ops.c: 95: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_gwt.c: 262: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_kinstr_prfcnt.c: 2139: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_mem.h: 2649: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_mem_linux.h: 514: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_mem_migrate.c: 720: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/mali_kbase_mem_migrate.h: 127: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_platform_common/mtk_platform_devfreq_thermal.c: 6 linux/version.h not needed.
   ./drivers/gpu/mediatek/arm/mali/thirdparty/mali_kbase_mmap.c: 495: need linux/version.h
   ./drivers/gpu/mediatek/arm/mali/tl/mali_kbase_timeline_io.c: 462: need linux/version.h
   ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_base.c: 9 linux/version.h not needed.
   ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_eb.c: 12 linux/version.h not needed.
   ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_hal.c: 6 linux/version.h not needed.
   ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_kpi.c: 11 linux/version.h not needed.
   ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_log.c: 6 linux/version.h not needed.
   ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_monitor_3D_fence.c: 6 linux/version.h not needed.
   ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_notify_sw_vsync.c: 7 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu6-psys.c: 12 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/kernel.h: 4 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
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
