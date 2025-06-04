Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F0143895
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749059423; cv=none; b=GoOqkXAnX44vz8G2OcT7n+QJwh6TRBAbXTGNxTml64lovVpSG/Xn62O3v4xPe64HpZU/f1fVUgG4US0HxAFj7+qVLV3ySwbXyevhcxtnNroK0zajvlG7+fMiDuuGX6l48k8V1JyeSpJWzZ1H/+8zT6Hsw/KO+ZVFj0NCRBhLKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749059423; c=relaxed/simple;
	bh=n1UQngMGaFNTO2e5b49LY3NWRU7yy3/7WnmIVMz1Fu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jll8vsX+MTgzYDM4Rj0TJr4xtyNRDTycKB5mJZYY5s9yxSEQLOD69bE7dNIAuFaJKvqtGhWkD2DDe6yFBEexBc8CmltHja59tR9hcTc9KvBEjSwyctrpnaunGem1yosaHP4pZf70SEgI8KKGBadvbrhUDQWbTLEzfWh6/lLv/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6lPFw5D; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6lPFw5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749059420; x=1780595420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n1UQngMGaFNTO2e5b49LY3NWRU7yy3/7WnmIVMz1Fu8=;
  b=n6lPFw5DPZwqoca/EuUUk85lEoXJXDwRFkmeGsOQ9BHuFbVnQ18a8Rq1
   sddt07i+8un0/YupH/Sc/C6UBlCax0Xa6aLBsaQWIvXXXI06uvGBCEUND
   8n2QmJvm6cObFJeoz0Ks0C6ByaM/TyS85jsFXZi3ailoxKOI4O40KSKpi
   YD9MQRbfbkTNSYtUy8nx/UnWKfj3KuI+b7EyiY7zvCP866RvZqAv/vfjn
   omgMh8bjh+GF6s9cHby5i/qMssZzGmEWgigcqXIGfS/5itjGtyYT9UauY
   3DyGXejwdPdxEJnwNUhpAq1qD1AWjYsWGCR7KHeL/Rq76UsijZiKIWwlJ
   g==;
X-CSE-ConnectionGUID: ZSwpRimGTIqI2O5WRjiv1g==
X-CSE-MsgGUID: g04ilg20Rjy42h+m17vPkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51158204"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51158204"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 10:50:19 -0700
X-CSE-ConnectionGUID: ye/RWHURSFahtdmaQ8C6wQ==
X-CSE-MsgGUID: XvOICZb7SMi0fcwAlPBprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145213559"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jun 2025 10:50:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMsFk-0003Mr-1w;
	Wed, 04 Jun 2025 17:50:16 +0000
Date: Thu, 5 Jun 2025 01:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 150/150] versioncheck:
 ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_base.c: 9 linux/version.h
 not needed.
Message-ID: <202506050127.IuUShGUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   8df8cc2d3cc80f60a56cd1ad44ed404f4c7ac449
commit: 8df8cc2d3cc80f60a56cd1ad44ed404f4c7ac449 [150/150] CHROMIUM: gpu/mediatek: move mtk_proprietary out of mali
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506050127.IuUShGUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050127.IuUShGUd-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3493: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 440: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_time.c: 362: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware.c: 3256: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1691: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.c: 2986: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.h: 423: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 640: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_sync_debugfs.c: 878: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 371: need linux/version.h
   ./drivers/gpu/arm/mali/include/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/arm/mali/ipa/mali_kbase_ipa.c: 778: need linux/version.h
   ./drivers/gpu/arm/mali/jm/mali_kbase_jm_defs.h: 875: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase.h: 869: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_defs.h: 2255: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_dummy_job_wa.c: 459: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.h: 252: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence_ops.c: 111: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gpuprops.c: 889: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gwt.c: 275: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_prfcnt.c: 2024: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem.h: 2603: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.c: 712: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.h: 118: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_vinstr.c: 1136: need linux/version.h
   ./drivers/gpu/arm/mali/mali_malisw.h: 29 linux/version.h not needed.
   ./drivers/gpu/arm/mali/platform/mediatek/mt8183_mali_kbase_runtime_pm.c: 84: need linux/version.h
   ./drivers/gpu/arm/mali/tl/mali_kbase_timeline_io.c: 465: need linux/version.h
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
>> ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_base.c: 9 linux/version.h not needed.
>> ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_eb.c: 12 linux/version.h not needed.
>> ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_hal.c: 6 linux/version.h not needed.
>> ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_kpi.c: 11 linux/version.h not needed.
>> ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_log.c: 6 linux/version.h not needed.
>> ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_monitor_3D_fence.c: 6 linux/version.h not needed.
>> ./drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_notify_sw_vsync.c: 7 linux/version.h not needed.
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
