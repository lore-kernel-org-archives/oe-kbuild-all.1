Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA222746A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676645899; x=1708181899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OmsIWfyzxQieebc7wXo2xsKcb8ajES8WQM7C9P2Ha14=;
  b=hPHDSyJDijqlLfLMgG0xxC2fwjJ2w5a/pJzrSzAqFhr0128OTEycPQqa
   8dmfIvg/EMcQ9zXnwM/VxWCZrKyaAd8pBThf68Z2ejeOm663wCg+/0QTX
   2pXG6lyqeebCg4Z2Y96PGwatv4nrHcnDUTAsTO2l+RmEyRb+fs86mTzpd
   MZn6ED0meASh0wec0g+bX5bRIK5egKEXfUZyarGY39KvmPs2kQc6CpKEN
   iDHVhKkAV3rblZ1fbrK11M31rnaal4JKYWcsyWAHsGzYH8laXQ57c1tx+
   tXvMli6IfO04d60GuMPVNvKAd9zLb4nQlzo/pL+yozql71xKLjJXw1b13
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332003471"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="332003471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="702990799"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="702990799"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Feb 2023 06:58:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT2Bk-000BZ3-2r;
	Fri, 17 Feb 2023 14:58:16 +0000
Date: Fri, 17 Feb 2023 22:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Moeller <jon.moeller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 18502/30000] versioncheck:
 ./drivers/platform/x86/socwatchhv/inc/swhv_acrn.h: 15 linux/version.h not
 needed.
Message-ID: <202302172254.hZIw9CY1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   c0723df4b24e91377beaa8dd8794843a4c8afa61
commit: a54bab2d508123c7f6ff3e02c4f6aaada581df10 [18502/30000] platform/x86: sep, socwatchhv driver and code-formatting fixes
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172254.hZIw9CY1-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/arm64/kernel/hibernate.c: 25 linux/version.h not needed.
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./arch/x86/hyperv/hv_apic.c: 23 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 28 linux/version.h not needed.
   ./drivers/block/skd_main.c: 30 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 16 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 25 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 50 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 19 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 56 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_display.c: 17 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_drv.c: 42 linux/version.h not needed.
   ./drivers/hv/hv.c: 29 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 35 linux/version.h not needed.
   ./drivers/media/dvb-frontends/mxl5xx.c: 30 linux/version.h not needed.
   ./drivers/media/pci/cx25821/cx25821.h: 41 linux/version.h not needed.
   ./drivers/media/pci/intel/ici/ici-dma.c: 463: need linux/version.h
   ./drivers/media/pci/intel/ici/ici-isys-frame-buf.c: 1157: need linux/version.h
   ./drivers/media/pci/intel/ipu-bus.c: 471: need linux/version.h
   ./drivers/media/pci/intel/ipu-cpd.c: 478: need linux/version.h
   ./drivers/media/pci/intel/ipu-dma.c: 448: need linux/version.h
   ./drivers/media/pci/intel/ipu-fw-com.c: 480: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-csi2-be-soc.c: 364: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-csi2-be.c: 306: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 945: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-media.h: 91: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-queue.c: 1534: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-queue.h: 174: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-subdev.c: 1050: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-subdev.h: 210: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-tpg.c: 355: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-video.h: 169: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys.h: 178: need linux/version.h
   ./drivers/media/pci/intel/ipu-mmu.c: 879: need linux/version.h
   ./drivers/media/pci/intel/ipu-mmu.h: 62: need linux/version.h
   ./drivers/media/pci/intel/ipu-wrapper.c: 552: need linux/version.h
   ./drivers/media/pci/intel/ipu.c: 768: need linux/version.h
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu4/ipu4-isys-isa.c: 1074: need linux/version.h
   ./drivers/media/pci/intel/virtio/intel-ipu4-para-virt-drv.c: 1372: need linux/version.h
   ./drivers/media/pci/intel/virtio/intel-ipu4-para-virt-drv.h: 9 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 30 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 23 linux/version.h not needed.
   ./drivers/mtd/nand/raw/brcmnand/brcmnand.c: 15 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 24 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 35 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 32 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 34 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 17 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/inc/cpumon.h: 29 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/inc/linuxos.h: 79: need linux/version.h
   ./drivers/platform/x86/sepdk/inc/utility.h: 637: need linux/version.h
   ./drivers/platform/x86/sepdk/sep/chap.c: 26 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/core2.c: 27 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/gmch.c: 26 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/output.c: 27 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/perfver4.c: 27 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/pmi.c: 27 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/silvermont.c: 27 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/sys_info.c: 27 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/unc_mmio.c: 29 linux/version.h not needed.
   ./drivers/platform/x86/socwatch/sw_telem.c: 60 linux/version.h not needed.
   ./drivers/platform/x86/socwatch/sw_tracepoint_handlers.c: 399: need linux/version.h
>> ./drivers/platform/x86/socwatchhv/inc/swhv_acrn.h: 15 linux/version.h not needed.
   ./drivers/platform/x86/socwatchhv/swhv_acrn.c: 11 linux/version.h not needed.
   ./drivers/platform/x86/socwatchhv/swhv_driver.c: 70 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 18 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 16 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 17 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 18 linux/version.h not needed.
   ./drivers/staging/gasket/gasket_interrupt.c: 12 linux/version.h not needed.
   ./drivers/staging/igb_avb/igb_main.c: 10881: need linux/version.h
   ./drivers/staging/igb_avb/kcompat.c: 1977: need linux/version.h
   ./drivers/staging/igb_avb/kcompat_ethtool.c: 1169: need linux/version.h
   ./drivers/staging/media/bcm2048/radio-bcm2048.c: 35 linux/version.h not needed.
   ./drivers/staging/mt7621-eth/mtk_eth_soc.h: 24 linux/version.h not needed.
   ./drivers/staging/mt7621-mmc/dbg.c: 36 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
   ./drivers/staging/vboxvideo/vbox_drv.h: 36 linux/version.h not needed.
   ./drivers/usb/early/xhci-dbc.c: 21 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 30 linux/version.h not needed.
   ./fs/ext4/ext4.h: 30 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 41 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./samples/mic/mpssd/mpssd.c: 40 linux/version.h not needed.
   ./sound/soc/codecs/cs35l35.c: 16 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 18 linux/version.h not needed.
   ./sound/soc/codecs/rt700.c: 18 linux/version.h not needed.
   ./sound/soc/codecs/svfpga-i2c.c: 16 linux/version.h not needed.
   ./sound/soc/codecs/svfpga.c: 18 linux/version.h not needed.
   ./tools/perf/include/bpf/bpf.h: 36: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 48: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 20: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 46: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 50: need linux/version.h
   ./tools/testing/selftests/bpf/test_tcp_estats.c: 37 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
