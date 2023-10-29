Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC325191
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 00:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fi6MplPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698538426; x=1730074426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dG/nKG1zydou0KNC4FknssTnCgZnx0xKY1QrcYb5tbg=;
  b=fi6MplPXRMk/IHs1U6xmiVmvu8T0KjdDTsPpVtv+sUI4CaO1vcGaNRDl
   pSwguPvhKRzGN7iJna5iXlzW27B8Y2ilgwPZ1PYD/z2/FbYn+AJnUXG37
   2f1gUUULi5CjQdmOdeRebccwkw44n+7/gCfUwNmxzSBEgAgP9w9eIgfwo
   sJ3ceCpJkTdgpDgv3ULG+bbPsaTh+08VjMq9RdCqX43RtchCpLoBkGXPj
   oggwGL6XqXND6U87Vll278X08HRTaNhfDm+iPIIJ7kMnRktdwBC9UOLfG
   v28Z608XITq6Kgom8uFG3hohi8TvJkw3FoL6LXaME2wIH01B6TdEOAf+E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="368139988"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="368139988"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 17:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="850585982"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="850585982"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2023 17:13:44 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwtR0-000CCA-09;
	Sun, 29 Oct 2023 00:13:42 +0000
Date: Sun, 29 Oct 2023 08:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 18/49] versioncheck:
 ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22
 linux/version.h not needed.
Message-ID: <202310290842.e8K595Ba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   091ae8112d39669ce5cb451a962930a276209a8f
commit: b694a506610885948ce63b38ff31f605644f2637 [18/49] CHROMIUM: mali: Uprev to r44p1 EAC release
reproduce: (https://download.01.org/0day-ci/archive/20231029/202310290842.e8K595Ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290842.e8K595Ba-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wrestrict -Wformat-overflow -Wformat-truncation -Wstringop-overflow -Wundef -funsigned-char -Wenum-conversion -Werror=return-type W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 KBUILD_MODPOST_WARN=1 ARCH=x86_64 versioncheck
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
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3493: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 440: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_time.c: 362: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware.c: 3256: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1691: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.c: 2986: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.h: 423: need linux/version.h
>> ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 640: need linux/version.h
>> ./drivers/gpu/arm/mali/csf/mali_kbase_csf_sync_debugfs.c: 878: need linux/version.h
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
>> ./drivers/gpu/arm/mali/mali_kbase_gwt.c: 275: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
>> ./drivers/gpu/arm/mali/mali_kbase_kinstr_prfcnt.c: 2024: need linux/version.h
>> ./drivers/gpu/arm/mali/mali_kbase_mem.h: 2602: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_linux.h: 533: need linux/version.h
>> ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.c: 712: need linux/version.h
>> ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.h: 118: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_sync.h: 216: need linux/version.h
>> ./drivers/gpu/arm/mali/mali_kbase_vinstr.c: 1136: need linux/version.h
   ./drivers/gpu/arm/mali/mali_malisw.h: 29 linux/version.h not needed.
>> ./drivers/gpu/arm/mali/tl/mali_kbase_timeline_io.c: 465: need linux/version.h
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
   ./drivers/media/pci/intel/ipu-dma.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 6 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-video.c: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/ipu6-psys.c: 12 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/virtio/virtio_video_driver.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 10 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 70: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/kunit/visibility.h: 3 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/verification.h: 7 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2406: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 159: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 433: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/bz.c: 234: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/fw/file.h: 1005: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2385: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1228: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3329: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 288: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6622: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2826: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2269: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/phy-ctxt.c: 402: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2836: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3400: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2327: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 490: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 209: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5394: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/chan.c: 2072: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 721: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2628: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2475: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/link.c: 508: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1602: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 8107: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5312: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1508: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 3025: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1315: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2124: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6139: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 5135: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/vht.c: 780: need linux/version.h
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
