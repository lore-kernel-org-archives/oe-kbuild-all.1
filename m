Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487D67B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674060686; x=1705596686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yCLrkRETWWlp6DYHVhq4cPV5+R7qLbnDa3wKhQKyXYA=;
  b=aZc7DcnauAIK61D5JPGw2DhJxthwv8n/8De27LgOJBjl+sDT+yPvZRIS
   Swj/zcyLCVZDK/j1BMxBN8QXjBcVMpUxhIc7I/bvHSFma2tEGTR4c5xFt
   tYGQ52FL0KS7LXbVqAFfJnin2aJsqTbLmi2DkQP/3+JEXb1gPcQBhtbTP
   JChDmYZMLVz7JyKlckOrssyeVHqJqTsuau+X4tjaHIUHmrIfb8aqkSqeO
   KZxaFtY5pHWgqRV4n9UtcWLrlKkC0WG2KsMUbwbNXGmjKrALTQkbPM+CL
   IrO63/CMzJp/MYDkiSAKVi8WYDkxdTC0HJr3F4zL7oS7kfLn1+mx9dUAh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327104637"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="327104637"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692066201"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="692066201"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2023 08:50:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIBeK-0000X2-24;
	Wed, 18 Jan 2023 16:50:56 +0000
Date: Thu, 19 Jan 2023 00:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 9/9] versioncheck:
 ./drivers/gpu/arm/mali/csf/mali_kbase_csf_defs.h: 1548: need linux/version.h
Message-ID: <202301190052.UKvFcssK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   ef5094072eea64e551e2dc093bb05b58072b9fba
commit: ef5094072eea64e551e2dc093bb05b58072b9fba [9/9] CHROMIUM: mali: Uprev to r40p0 EAC release
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j16 ARCH=x86_64 versioncheck
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
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3339: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 426: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_time.c: 206: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf.c: 3331: need linux/version.h
>> ./drivers/gpu/arm/mali/csf/mali_kbase_csf_defs.h: 1548: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware.c: 2912: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1597: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.c: 2361: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.h: 362: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 637: need linux/version.h
>> ./drivers/gpu/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 367: need linux/version.h
>> ./drivers/gpu/arm/mali/include/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/arm/mali/ipa/mali_kbase_ipa.c: 772: need linux/version.h
   ./drivers/gpu/arm/mali/jm/mali_kbase_jm_defs.h: 866: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase.h: 771: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_defs.h: 2017: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.h: 179: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence_ops.c: 85: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gpuprops.c: 916: need linux/version.h
>> ./drivers/gpu/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/mali/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_pool.c: 30 linux/version.h not needed.
   ./drivers/gpu/arm/mali/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_utility.h: 52: need linux/version.h
   ./drivers/gpu/arm/mali/mali_malisw.h: 29 linux/version.h not needed.
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
   ./drivers/gpu/drm/evdi/evdi_platform_drv.c: 11 linux/version.h not needed.
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
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 68: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/linux/verification.h: 7 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2366: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 172: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 1182: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/fw/file.h: 989: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2309: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1225: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3173: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 298: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6541: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2733: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2228: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/phy-ctxt.c: 397: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2773: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3317: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2312: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 490: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 118: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5365: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/chan.c: 2048: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 723: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2564: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2427: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/link.c: 306: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1593: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 7711: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5342: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1505: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 2958: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1315: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6052: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 4974: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/vht.c: 768: need linux/version.h
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
