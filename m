Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E38192B63
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218227; cv=none; b=ZQMTdGBEPK6SXDN5aYeUGTtuFC5xNtWduRRcQweUBGnWFX5T7R5I4G88NUz3Hgeiau9aD3nJuwG8C8dkoFAU5GO/PzMzeRTWBCGcQUIcwOX8YF8wee/ywRJHWCagfhchwHh5PgUo2HXDdiBk8JSlEz02SmJP/zqiirw+FsamcMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218227; c=relaxed/simple;
	bh=TmaX4oAJsOITXHM94mSiCIoGGoBFiQdryHUmprL73pA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZVGh3F/N5D5kz+7fau/1BBS9cfnY7UiCJZhMWqb8tP1tnwSCZr1WlzORLkmofj8kPYVnL8bGdLnwnVQN2Oe1FCWKIgtf6yfOaJCm1sgDJ16PxsmlKlkjBR7MEa4K8rc+R967yruHr/RrL2s9GJkfbebDXarC+Xc3DxizQpfrp8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8gQ1OEE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8gQ1OEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738218226; x=1769754226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TmaX4oAJsOITXHM94mSiCIoGGoBFiQdryHUmprL73pA=;
  b=E8gQ1OEE23Xi2rpBkLfrcRlafXnrkANErub2R++EuBF9zWzp3vYcJwGz
   qjqdSKPia2L3/xcvcoPZPvO3nzRtgGOg8KrTmm5cLCqqL7SkZUfO5L/RK
   BTVxx5utR8gAKLkNid5xMD51M/Lpg7rQdICrUwK0g5jzg12v3UgxmP+F4
   PwR7hQ+s1TvF7pwQSptnt1/739gRzxA0LwHb9o5T7B+DtMr8T8k4kJdff
   g1I3YtFzd6ZBtkoFPaU6+N31a5ptDJp/esv1xhfiXOv0yf+shUHN+0WIc
   8FumyFCTRelohjXVZOHi3lYq88NUGwZkadPI+w7OEVNqrQciWIi/UvjJm
   g==;
X-CSE-ConnectionGUID: iunQ6oZPTHGq5HbYaklW1g==
X-CSE-MsgGUID: fVGGXHIrQxO0LURIZGA9JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="61225399"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="61225399"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 22:23:43 -0800
X-CSE-ConnectionGUID: e751N5KZTsK23Vpbij/Rtg==
X-CSE-MsgGUID: kKCm2wFHRguLbyrxiDnX7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113853399"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2025 22:23:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNxj-000jkG-07;
	Thu, 30 Jan 2025 06:23:39 +0000
Date: Thu, 30 Jan 2025 14:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 9/9] versioncheck:
 ./drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3668:
 need linux/version.h
Message-ID: <202501301429.dXIUYUhT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   20c6549501f674937409aba5411ee8c5c0ab133a
commit: 3347e43f1763e946c8db116bb3241731d1417cab [9/9] CHROMIUM: gpu/mediatek: Rename midgard to mali
reproduce: (https://download.01.org/0day-ci/archive/20250130/202501301429.dXIUYUhT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301429.dXIUYUhT-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
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
>> ./drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3668: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 459: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_time.c: 418: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_firmware.c: 3437: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1563: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_kcpu.c: 2960: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 730: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 399: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/include/linux/priority_control_manager.h: 27 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/ipa/mali_kbase_ipa.c: 731: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase.h: 795: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_debug_job_fault.c: 544: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_debug_mem_view.c: 391: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_defs.h: 2145: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_fence_ops.c: 95: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_gwt.c: 262: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_kinstr_prfcnt.c: 2139: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_mem.h: 2649: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_mem_linux.h: 514: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_mem_migrate.c: 720: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/mali_kbase_mem_migrate.h: 127: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_platform_common/mtk_platform_devfreq_thermal.c: 6 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_base.c: 9 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_eb.c: 12 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c: 6 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_kpi.c: 11 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_log.c: 6 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_monitor_3D_fence.c: 6 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_notify_sw_vsync.c: 7 linux/version.h not needed.
>> ./drivers/gpu/mediatek/arm/mali/thirdparty/mali_kbase_mmap.c: 495: need linux/version.h
>> ./drivers/gpu/mediatek/arm/mali/tl/mali_kbase_timeline_io.c: 462: need linux/version.h
   ./drivers/media/virtio/virtio_video_driver.c: 21 linux/version.h not needed.
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
