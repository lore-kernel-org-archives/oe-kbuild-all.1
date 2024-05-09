Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA91A2C37
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715238848; cv=none; b=gfA+l8co1oPNZq89f2AVvufI/X8Q1SUsguDJnj7kJycl0LuisR4+gZwhNh9Y+ivKmGYd7OrWn5scdD4tcSXGe/R0sOykMh6HUDogOlyHGU/Uo5uXtZeZuF82RO5SN36zUeO/9rn0TdZ/e0t1vQKrzt2A4kPYHzNFE8yxYWikzlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715238848; c=relaxed/simple;
	bh=ahzFSBUH3pc1aYTPxqSWo2VXbeNUpbAobPS76j4dL2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rv1ZD9s/XZTYtOgjhMgHCVemn8gM2qFtm1Sj7hZhdKiu9mcQIEMlLCPuXZklNB1e/ZfcLepowCaFwB3k0D72afQMudD4hoME7ckgbEHpF1nyHDej+Lq5HCqNqBNq9mbmwTtxLS+EBVDrGvbFbZvVDKOCL/Xn74IX5XfmSHkdHik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3rA5Siv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3rA5Siv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715238847; x=1746774847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahzFSBUH3pc1aYTPxqSWo2VXbeNUpbAobPS76j4dL2c=;
  b=R3rA5SivIYbhwLDzXQOqFWQ4aNBA1/CoNZ9PiWRPiVagk8nlwQiIOKBJ
   7QYVlECXR0drh9F7G5xxUMp5oo7pxhSKwKcbrXZCkQ12R4L33PkACRDAv
   WNP/N549Nkfogzl9Y0TkiEqoBMBv+69iagLqnR1EsYnbanVMSXHuFDiPG
   c9w4tR8DPlCFOI/PcvpmvHQXMvDYknpQ2FhRWyO1gdpmi9Ub0o/G/iCTI
   2MYIA/DZsT6aLA4XW1xoF8at1sUUp0rhZ2WZJkepFfGc0q2a9CFlgg/dl
   E4sgka1JWsooZ5flZL+4HXHlt0o2uBE4DKfOGJ0XW1IjybEGKTgAOjRo3
   Q==;
X-CSE-ConnectionGUID: /du95lQDTsy7sMnhX5XVig==
X-CSE-MsgGUID: bl0W+Di2SSW22ACSMcGS4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11265837"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11265837"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 00:14:06 -0700
X-CSE-ConnectionGUID: 3dMzZK2iTMuCP1OKs1/Amw==
X-CSE-MsgGUID: Kn7AOfI+TyKLSrOKiVOycQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="33712602"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 May 2024 00:14:04 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4xyc-0004YF-0e;
	Thu, 09 May 2024 07:14:02 +0000
Date: Thu, 9 May 2024 15:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 94/96] versioncheck:
 ./drivers/media/platform/mediatek/aie/mtk_aie_53.c: 23 linux/version.h not
 needed.
Message-ID: <202405091549.oQfAwPoR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   7fbbce28f0c5c49f9a47f931e397de8b9fd8c3f8
commit: d2e4e2025dedbc41046b5d9f4a8a209280f328f6 [94/96] CHROMIUM: media: platform: mediatek: aie: Porting Kernel 6.1
reproduce: (https://download.01.org/0day-ci/archive/20240509/202405091549.oQfAwPoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091549.oQfAwPoR-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.62.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
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
   ./drivers/gpu/arm/mali/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.h: 252: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence_ops.c: 111: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gpuprops.c: 889: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gwt.c: 275: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_prfcnt.c: 2024: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem.h: 2602: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.c: 712: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.h: 118: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_vinstr.c: 1136: need linux/version.h
   ./drivers/gpu/arm/mali/mali_malisw.h: 29 linux/version.h not needed.
   ./drivers/gpu/arm/mali/tl/mali_kbase_timeline_io.c: 465: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/cache_km.c: 47 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/mt8173/mt8173_sysconfig.c: 552: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/osfunc_arm64.c: 43 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/osfunc_x86.c: 134: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/pvr_buffer_sync.c: 739: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/pvr_debugfs.c: 624: need linux/version.h
   ./drivers/media/pci/intel/ipu-dma.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 6 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-video.c: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/ipu6-psys.c: 12 linux/version.h not needed.
>> ./drivers/media/platform/mediatek/aie/mtk_aie_53.c: 23 linux/version.h not needed.
   ./drivers/media/virtio/virtio_video_driver.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 69: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/kunit/visibility.h: 3 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/acpi_amd_wbrf.h: 3 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/math.h: 4 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2351: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 180: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 433: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2536: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.h: 103: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1244: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3693: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 1142: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6815: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2973: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2357: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2608: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3572: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2419: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 559: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 403: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5483: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 737: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/driver-ops.h: 1733: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ethtool.c: 284: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2728: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2490: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/link.c: 531: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1854: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 9171: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/parse.c: 959: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5544: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1472: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 3038: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1302: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2080: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6309: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 4392: need linux/version.h
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra-cbb.c: 19 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra194-cbb.c: 26 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version-timestamp.c: 5 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 294: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 60: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
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
