Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0BB7E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683032371; x=1714568371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HtdjUm25dyepAznYCx8D+WRzRNxNjlF+Kwns3g1nTzU=;
  b=Eu4U30RA9WyOf9mdkgFFdB5LY8e/hWQkim0gxvhIlB41C7nFVvMT2z/E
   MKnZV/TFk3Tf6tss5RzB6NEtHh/xXbn60y4yudEmy9CZnU+8aLBc8rgYv
   d+hT/QULNDn7Np39FVDTC7IPduepgYx5NbQ3GEZV1aAK5o9xXuFAhGbcu
   WVJ+TOFcdwY1Z49C1R1X2e5ZNjC3vhFUWi6U4b73zNMXu3cPTYswKCJ0h
   KGm4EvXajyKKptD4dJ043XJQGRtL4m1DOZoxpCz+SsxerDgyHgoZkx50A
   KaWLb9KAMuZ0HyY6QnOTVfe3/4/I2/nKB9PL23JIsfNxCSecrEBPXAXpM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="328763684"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="328763684"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 05:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="726727598"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="726727598"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 May 2023 05:59:29 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptpbI-00013W-0U;
	Tue, 02 May 2023 12:59:24 +0000
Date: Tue, 2 May 2023 20:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 21/45] versioncheck:
 ./drivers/gpu/arm/mali/platform/mediatek/mt8192_mali_kbase_runtime_pm.c:
 123: need linux/version.h
Message-ID: <202305022050.Na8D3pYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d876567ca74814624bf8433822b7ff861b5a038c
commit: ec876dea3192dcc324fe18ece0f67c93244b82fa [21/45] CHROMIUM: gpu: mali: Switch to MT8192 upstream binding
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022050.Na8D3pYM-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3339: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 426: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_time.c: 206: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf.c: 3335: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_defs.h: 1548: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware.c: 2913: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1598: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.c: 2368: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.h: 362: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 637: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 371: need linux/version.h
   ./drivers/gpu/arm/mali/include/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/arm/mali/ipa/mali_kbase_ipa.c: 772: need linux/version.h
   ./drivers/gpu/arm/mali/jm/mali_kbase_jm_defs.h: 866: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase.h: 758: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_defs.h: 1986: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.h: 179: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence_ops.c: 85: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gpuprops.c: 916: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/mali/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_utility.h: 52: need linux/version.h
   ./drivers/gpu/arm/mali/mali_malisw.h: 29 linux/version.h not needed.
>> ./drivers/gpu/arm/mali/platform/mediatek/mt8192_mali_kbase_runtime_pm.c: 123: need linux/version.h
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
   ./drivers/media/virtio/virtio_video_driver.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 69: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/linux/verification.h: 7 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2419: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 158: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 1439: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/fw/file.h: 997: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2383: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1228: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3173: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 288: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6609: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2789: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2262: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/phy-ctxt.c: 399: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2791: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3347: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2313: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 490: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 180: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5387: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/chan.c: 2072: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 721: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2612: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2468: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/link.c: 508: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1602: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 7804: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5301: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1508: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 3016: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1315: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2124: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6137: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 5164: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/vht.c: 768: need linux/version.h
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
   ./tools/lib/bpf/bpf_helpers.h: 289: need linux/version.h
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
https://github.com/intel/lkp-tests
