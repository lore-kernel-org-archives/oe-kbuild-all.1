Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E8E18E1C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hg1sLpjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699713045; x=1731249045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BF7addpjRRE1CtJd0tLfwro15+ZH6l1NOlyIBW4XVis=;
  b=Hg1sLpjUWD9vG6LiaMCeNa3L15LpuHl7/ERc3tDxCQrHqWhh9M7MnHbJ
   zStp5NuixrBotx8gXTn8w3QoTW7ltEK8DgMohVuWHlNGhAYcpbHwnLbtO
   z8K6MOqfOGzIN4/nTWV+9O2PrHzwtDPXuFetdgyUhGkY+3cFTnpfd++eC
   w0kp1Cck4a5y1x1ukS6LvorLjtGcZW58Eq9QzBjLSlEbAmNQpQyge9DY+
   /eFDrXrK/kXFya9rRlNjbGnQ0qc8yITk2auJ8Am4UXGTXIHtY9tdqDAt0
   7zwAYc+i0RXbaIkj8q5o3iO79TW2+scOciOJa0FfYOYlEQlMNeTQABg6N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="11828601"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="11828601"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 06:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="1095383472"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="1095383472"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2023 06:30:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1p0S-000AVe-2D;
	Sat, 11 Nov 2023 14:30:40 +0000
Date: Sat, 11 Nov 2023 22:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Yew, Chang Ching" <chang.ching.yew@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 2652/30000] versioncheck:
 ./drivers/media/pci/intel/virtio/intel-ipu4-para-virt-drv.c: 1330: need
 linux/version.h
Message-ID: <202311112252.9OA6JEXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   b0d2cfb03adf70bb24abac09facf2edc99111de4
commit: e8a0febb1fb5b45f60a2010a90050806aeea9173 [2652/30000] media: intel-ipu4: virtio: IPU virtio backend and frontend drivers base-code
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311112252.9OA6JEXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112252.9OA6JEXr-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wrestrict -Wformat-overflow -Wformat-truncation -Wstringop-overflow -Wundef -funsigned-char -Wenum-conversion -Wno-error=return-type -Wreturn-type -Wno-error=missing-prototypes W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 KBUILD_MODPOST_WARN=1 ARCH=x86_64 versioncheck
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
   ./drivers/media/pci/intel/ici/ici-dma.c: 417: need linux/version.h
   ./drivers/media/pci/intel/ici/ici-isys-frame-buf.c: 950: need linux/version.h
   ./drivers/media/pci/intel/ipu-bus.c: 471: need linux/version.h
   ./drivers/media/pci/intel/ipu-cpd.c: 478: need linux/version.h
   ./drivers/media/pci/intel/ipu-dma.c: 448: need linux/version.h
   ./drivers/media/pci/intel/ipu-fw-com.c: 480: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-csi2-be-soc.c: 364: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-csi2-be.c: 307: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 939: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-media.h: 91: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-queue.c: 1530: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-queue.h: 174: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-subdev.c: 1017: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-subdev.h: 210: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-tpg.c: 355: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys-video.h: 169: need linux/version.h
   ./drivers/media/pci/intel/ipu-isys.h: 174: need linux/version.h
   ./drivers/media/pci/intel/ipu-mmu.c: 876: need linux/version.h
   ./drivers/media/pci/intel/ipu-mmu.h: 62: need linux/version.h
   ./drivers/media/pci/intel/ipu-wrapper.c: 514: need linux/version.h
   ./drivers/media/pci/intel/ipu.c: 763: need linux/version.h
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu4/ipu4-css/ipu-wrapper.c: 514: need linux/version.h
   ./drivers/media/pci/intel/ipu4/ipu4-isys-isa.c: 1074: need linux/version.h
>> ./drivers/media/pci/intel/virtio/intel-ipu4-para-virt-drv.c: 1330: need linux/version.h
>> ./drivers/media/pci/intel/virtio/intel-ipu4-para-virt-drv.h: 9 linux/version.h not needed.
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
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 18 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 16 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 17 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 18 linux/version.h not needed.
   ./drivers/staging/gasket/gasket_interrupt.c: 12 linux/version.h not needed.
   ./drivers/staging/igb_avb/igb_main.c: 10875: need linux/version.h
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
   ./tools/perf/include/bpf/bpf.h: 36: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 48: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 20: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 46: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 50: need linux/version.h
   ./tools/testing/selftests/bpf/test_tcp_estats.c: 37 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
