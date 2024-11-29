Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901D2198E6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732877993; cv=none; b=MIVgWiQENpU4rKGNuCEWrIIepPaZIwPjCVCBIQVhPwpp9Kvy3ubM/GHMEL12+pkaWGsIZxwwk21k//YxdtJZfIoxq8vuA4d0W4BLMLijdx62TDnuSSVn32speZavGyhJj4FQ1Ht7vjOzHCQKLj7gbd3rKa+lOE5AM+ZidBZVIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732877993; c=relaxed/simple;
	bh=xU7D44+2eX+JYYMBOn6Em4iyg0xmOhGeA6yDvxQFHks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pv2ojLHV/XdbSr8TiI8xZvULcbp2Ce4LNkU9DLj1ocxIif9wAjLcIv+jFijs2iqlGUZq634NT15XQFN9AhKssDcmNIWXUBi5BinAnCcQZ8ilOpbCpgxFABZmWLwT87TMX1hlYJ98rFxSaXANTrJ3lndWxwgS2vgK3hFVOcYs35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I56+Tg35; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I56+Tg35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732877991; x=1764413991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xU7D44+2eX+JYYMBOn6Em4iyg0xmOhGeA6yDvxQFHks=;
  b=I56+Tg356YgX4OrfxeVAhxQ1o8CikDaV6bMd2dya7XcUKr0tNn5iMi1O
   NOTbMUhgn+eyL/OGPlvgouUgg19Ne1+9zP2Q7VzWKEY34eru7K+XuHKe2
   7Z5Ih5eVDmC7mXyCs8tyDIjltHPaQDgPKTQ7t30oY478dN4wgcjwd6M4C
   7IKVX9udz1Z1t4a9CsL5BBPrl96xu7FH64SEDfJLmfgOJjGlDbxHqAmc8
   PKUvX472pls1llVUvgtkzwuuohlO95bvV4oDSjWzYAj3gn+N9A5HAIyjA
   dAQ2bCFcCOxHwT8lsMGsWcrsRo7fAbZIT+6Leavxdv6U+Pxfo6O3zNSHm
   A==;
X-CSE-ConnectionGUID: fYZQQHPoRhq52R0MSapX3Q==
X-CSE-MsgGUID: xxEFehSLQ5W9amaFdvtpvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32474383"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="32474383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 02:59:51 -0800
X-CSE-ConnectionGUID: NmvrtmPdR6e9SX2jhvzV5w==
X-CSE-MsgGUID: iEGpMvIQTWGZvQuBsnBsyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="97564111"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Nov 2024 02:59:50 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGyix-0000Fr-0Y;
	Fri, 29 Nov 2024 10:59:47 +0000
Date: Fri, 29 Nov 2024 18:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chang Ying <ying.chang@intel.com>
Subject: versioncheck: ./drivers/media/pci/intel/ipu-bus.c: 471: need
 linux/version.h
Message-ID: <202411291852.PIvYa9bC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_q
head:   aff8de868d4e17e98fa8ce0b1b124e54153b574b
commit: 123826108e51794c3922a0f8eba95e0375ffa36b media: pci: add IPU driver for BXT platform
date:   6 years ago
reproduce: (https://download.01.org/0day-ci/archive/20241129/202411291852.PIvYa9bC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291852.PIvYa9bC-lkp@intel.com/

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
>> ./drivers/media/pci/intel/ipu-bus.c: 471: need linux/version.h
>> ./drivers/media/pci/intel/ipu-cpd.c: 478: need linux/version.h
>> ./drivers/media/pci/intel/ipu-dma.c: 448: need linux/version.h
>> ./drivers/media/pci/intel/ipu-fw-com.c: 480: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-csi2-be-soc.c: 364: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-csi2-be.c: 307: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-csi2.c: 939: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-media.h: 91: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-queue.c: 1530: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-queue.h: 174: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-subdev.c: 1017: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-subdev.h: 210: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-tpg.c: 355: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-video.h: 169: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys.h: 174: need linux/version.h
>> ./drivers/media/pci/intel/ipu-mmu.c: 876: need linux/version.h
>> ./drivers/media/pci/intel/ipu-mmu.h: 62: need linux/version.h
>> ./drivers/media/pci/intel/ipu-wrapper.c: 514: need linux/version.h
>> ./drivers/media/pci/intel/ipu.c: 763: need linux/version.h
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu4/ipu4-css/ipu-wrapper.c: 514: need linux/version.h
>> ./drivers/media/pci/intel/ipu4/ipu4-isys-isa.c: 1074: need linux/version.h
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
