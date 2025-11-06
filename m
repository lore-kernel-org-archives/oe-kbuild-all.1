Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66432E719B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762465694; cv=none; b=NpJdIoIT/LSTgIS1WSV0P4Gv1xFdOW+w0Uh4yeai6VQT4ysZnPSr3SKMQB4rJ9UdefsMlWbJzbT5/qRreXBbeeFi4N4/zdx9AnjO5UvSGx0mQkT5QEWnsKO9zwRxRuYn8XTJiqtp/Z856A4j0iE0XM3g7GyFmeMdQz/4SrWn5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762465694; c=relaxed/simple;
	bh=ie0le779OzN7eGLFHsDbVCBCdNyLp542Wt/pnd6UZaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KA+7rbvrRY2qfqRIKjw2+HK9Ory9MxRWwHOBvE45b3w19/noYobn2PEGbpyEVDMnXaUaydIUWx+uhcA3oGdXSM8/px9dLAHcvNlGmVbM5Xx4cvUFqJn9Bs77l/xnH9mxGT/QaJ5H+S5L9oJAZwlJO/hJeVR0PDenBmGVMC7RRp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sfvct5SA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sfvct5SA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762465692; x=1794001692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ie0le779OzN7eGLFHsDbVCBCdNyLp542Wt/pnd6UZaM=;
  b=Sfvct5SARMFXLf7F7FUte9AW683sO9wUKaBeqehJb86OuH3b7XNPUG8C
   8ghjafZeDNKx4d7fgw76P/XT5x+tP0fOw6iYL4qh0l5S9gqGRYT7mN4Gw
   XSkEyEa4Hw3eUXSd04IAo6Pywq9D2no6QZ9sFibyFGNBGXqmXi4Bkxod4
   WeVuszcJJtyJWsDSvX3hkj4IOjQwu33Rc5kW4QxvvBpfMvE+ZBozdF7UZ
   QeCKnsU/d2cOpCJftEAPA+23lO0XF3+2uG3/SXNfO4T3UNvA3+ApfZc5g
   IU0kz6cLJjatLk9cCX2NVE/G3qYmhArKBrhwRsHy/zYgOW++3Tzgwaow7
   Q==;
X-CSE-ConnectionGUID: bRhf72D7RkaPa5OLvtLqCg==
X-CSE-MsgGUID: jvV92wmJR8KhcBslD6c2lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75225696"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="75225696"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 13:48:11 -0800
X-CSE-ConnectionGUID: mHQlXl7/TsmHeTUcTjtsPQ==
X-CSE-MsgGUID: eLyxqRQpToKPkTx2GoSoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="193043817"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2025 13:48:11 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vH7pw-0000000037Q-2nhz;
	Thu, 06 Nov 2025 21:48:08 +0000
Date: Thu, 6 Nov 2025 22:47:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 30/30] versioncheck:
 ./drivers/gpu/arm/mali/platform/mediatek/mt8188_mali_kbase_runtime_pm.c: 82:
 need linux/version.h
Message-ID: <202511062218.zmVfVTvm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   c4367217408a8d46a554ac8cdc5019dcccd5f3d8
commit: c4367217408a8d46a554ac8cdc5019dcccd5f3d8 [30/30] CHROMIUM: uprev kbase to Mali DDK r54p1
reproduce: (https://download.01.org/0day-ci/archive/20251106/202511062218.zmVfVTvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511062218.zmVfVTvm-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/atomic.h: 6 linux/version.h not needed.
   ./arch/csky/include/asm/io.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/thread_info.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/uaccess.h: 15 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./arch/csky/mm/fault.c: 16 linux/version.h not needed.
   ./arch/s390/include/asm/setup.h: 183: need linux/version.h
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 14 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 13 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 25 linux/version.h not needed.
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3699: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 456: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_time.c: 418: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware.c: 3422: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1679: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.c: 2960: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 645: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 395: need linux/version.h
   ./drivers/gpu/arm/mali/device/mali_kbase_device.c: 636: need linux/version.h
   ./drivers/gpu/arm/mali/include/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/arm/mali/ipa/mali_kbase_ipa.c: 731: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase.h: 799: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_debug_job_fault.c: 544: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_debug_mem_view.c: 391: need linux/version.h
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
>> ./drivers/gpu/arm/mali/platform/mediatek/mt8188_mali_kbase_runtime_pm.c: 82: need linux/version.h
   ./drivers/gpu/arm/mali/thirdparty/mali_kbase_mmap.c: 538: need linux/version.h
   ./drivers/gpu/arm/mali/tl/mali_kbase_timeline_io.c: 462: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 649: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.h: 229: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa_debugfs.c: 288: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa_simple.c: 354: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 694: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_context.h: 123: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 2249: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_device.c: 594: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_dma_fence.c: 454: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.c: 206: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.h: 280: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_jd_debugfs.c: 241: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mmu_mode_aarch64.c: 223: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mmu_mode_lpae.c: 214: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_utility.h: 66: need linux/version.h
   ./drivers/hv/hv.c: 16 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 22 linux/version.h not needed.
   ./drivers/media/pci/cx25821/cx25821.h: 31 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 10 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/kernel.h: 4 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 15 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 13 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 10 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 21 linux/version.h not needed.
   ./fs/incfs/integrity.c: 8 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 15 linux/version.h not needed.
   ./kernel/bpf/syscall.c: 20 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./sound/soc/codecs/cs35l35.c: 12 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
