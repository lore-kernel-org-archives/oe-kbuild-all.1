Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC1442AAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732118833; cv=none; b=oxddRB9DmfUjnajgGXJYlz2TAnNL1tZLwrD0KAMxjBBWd2Ls41WI5Jm0CrrneWQFFV0YRw7fNSkB3F0YE2LLloDDApGRLneW85e2AmbxGr0oY39q3ajhTTo9KqZD0wZ4MSkY91ffmnmOa956L2OA7E114oANoxYt3r3jTBmAv/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732118833; c=relaxed/simple;
	bh=ob2Q8J2BlfEIzaKcJxCZ0xLBIunfOoJ1/V7udJe6QIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZ5MpaFlLmwI+v2XFSMnF7HmreZZDhsVFp3WM6LT4jVUA8u9hdnNKphy/NTCJSmYTFnoYBORQSqpGnTtYJ6qttsd0B1x5hu4AsjxRK1U/vWwXTHFnWpwfyQHuYrqqOGtPMBunNL8yyJjgR/FcjTJ/u7Q4FAtCyG4fmW8u03taW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bA6ij5nM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bA6ij5nM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732118831; x=1763654831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ob2Q8J2BlfEIzaKcJxCZ0xLBIunfOoJ1/V7udJe6QIk=;
  b=bA6ij5nMw9T5gCHe21p0v0wnHBpexAfK+Wd48E+rzDLJjAz2QDSyqSVy
   5dwhP6X0XN4VXzlnJmIruBIxc9cxFNQkgAT2sKFwB7aDBn/88o+uNRNvM
   yfJuLrJs5fBFa3IXaEH5wRTmyzs1TMQgtcf68esNG/XoT5CJjreqEo1DU
   fKMzHwUcaU9wLBgGeMo1CA+Pnw7/QkYuh/CiXsi02ZaLJJfAQPQh4oQp6
   +N4teZO/B45x1/Krm91KMXjqTrQsaMQYALW+a+zXVtjpIL7w5gmCYqmkB
   PlCTNDLWpbjG6xhErx8YuEYOWVXgEKBTAyb6DHvKaZGTCGq/Tacl6jbvN
   A==;
X-CSE-ConnectionGUID: VbMIhR1+SKu4b8H7nUY2EA==
X-CSE-MsgGUID: f+Lv5td8SESgIxEMX6d1zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42698200"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="42698200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 08:07:10 -0800
X-CSE-ConnectionGUID: w+XoWaxVS22ZWpovHdD1NQ==
X-CSE-MsgGUID: btd/qwayRGuxt21b+RtEHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="120824256"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2024 08:07:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDnEQ-0000zP-1b;
	Wed, 20 Nov 2024 16:07:06 +0000
Date: Thu, 21 Nov 2024 00:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hardik T Shah <hardik.t.shah@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 75/30000] versioncheck:
 ./sound/soc/codecs/svfpga-i2c.c: 16 linux/version.h not needed.
Message-ID: <202411210007.jnDwslti-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7d5e03d31c4509fef1c0f7691a23f11d3d56a2e6
commit: d7a49dd5fcce1d2295e1c63f2fbe3802663e4292 [75/30000] ASoC:Codecs: Add support for SV FPGA SoundWire PDM Codec.
reproduce: (https://download.01.org/0day-ci/archive/20241121/202411210007.jnDwslti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210007.jnDwslti-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going CROSS_COMPILE=/opt/cross/gcc-14.2.0-nolibc/x86_64-linux/bin/x86_64-linux- CC=clang AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar LD=ld.lld HOSTLD=ld.lld OBJCOPY=llvm-objcopy -j32 ARCH=x86_64 versioncheck
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
   ./drivers/media/pci/intel/ici/ici-isys-frame-buf.c: 954: need linux/version.h
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
   ./drivers/media/pci/intel/virtio/intel-ipu4-para-virt-drv.c: 1236: need linux/version.h
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
>> ./sound/soc/codecs/svfpga-i2c.c: 16 linux/version.h not needed.
>> ./sound/soc/codecs/svfpga.c: 18 linux/version.h not needed.
   ./tools/perf/include/bpf/bpf.h: 36: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 48: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 20: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 46: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 50: need linux/version.h
   ./tools/testing/selftests/bpf/test_tcp_estats.c: 37 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
