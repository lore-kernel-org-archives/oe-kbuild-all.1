Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCCF1CFEC1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726334236; cv=none; b=UzvsTVV2cg+ARp+2F4+fLGbW/KW5TqIjuXg5VMcPsNwsjSe0rcoDq85Tqj5iHDkX2g6/W+p/RSZv3n3j9wQjlRzfk1ECrRC+dQS2Bp7VgaoGftblMaLqI5/kaw+dg5Zyi8x60uG146tMsm/0fl7AVlgYNtoSeSOnQCfdWZte8cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726334236; c=relaxed/simple;
	bh=cEtoVqY0czMVI55LxVcEdJyi710WPejxsAOG6Llb1ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=izfle6L86a9VzMwaNYdhXFUZ1r1pAgNhVkfxwk7fM+f1s3/Q6X773mGJxbC959uIdIEqSp/IMKTAPdMiiXufLgFChD9+pBJ/X3bKWuRe8HMkWFdKxxoBX8nL5MMm2hDDead4fNmD+nhMf9PAD4LJENY7eup+AUhw2DDxJBqZrK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDWzDdsx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDWzDdsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726334234; x=1757870234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEtoVqY0czMVI55LxVcEdJyi710WPejxsAOG6Llb1ws=;
  b=VDWzDdsxLlY1fkhbXMe8kwqJgOZ9zcVVfMcCKYsE/2SOPs7Xqn74ahCu
   EVLRrY7AVBC579zxZLkgQlsL4ODIWtAICWMrdSiVMtfwnRrgkLc6CfGkF
   /7MiWgtxTnfI9k2pqfdmytI9zd2rf4uG1VWjTrQSKVxcK3/fEIGzrjZvr
   SeLe6v5agLe4PEHdT3bgT0086gi2pq/OzcuY6i6d/7/o2Sl36IAyRtQnc
   DSAy2FSln8Mjv9W/s5xRo+zI5wY1QRrS0qnDFb/Zl9dwzSFiIC2OU0sqd
   ODVjNvK5Rk58gNfc4Y0rc3JzLuzeprS5zBPDifE30lOjQ0qWVI5oZ7CZA
   Q==;
X-CSE-ConnectionGUID: TYcmU95nSxydv4nrEB4SfQ==
X-CSE-MsgGUID: SH8sqhB2RWO7hKYL9PGOjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="47733947"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="47733947"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 10:17:13 -0700
X-CSE-ConnectionGUID: RAn+hPK5QlGhloIFHJyovA==
X-CSE-MsgGUID: m/3c9Mr9TiOmPT2wUHGVww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68131348"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Sep 2024 10:17:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spWOU-000806-07;
	Sat, 14 Sep 2024 17:17:10 +0000
Date: Sun, 15 Sep 2024 01:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 2083/28533] versioncheck:
 ./utils/cryptodev/cryptodev-linux/authenc.c: 849: need linux/version.h
Message-ID: <202409150103.z2Dvrv3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   92b88e0e59c946d552fb3d375d60e775a4151ea2
commit: c3b89e4625bb76475e992292ee89d37d48a0e748 [2083/28533] utils: add cryptodev 1.10
reproduce: (https://download.01.org/0day-ci/archive/20240915/202409150103.z2Dvrv3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150103.z2Dvrv3K-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going CROSS_COMPILE=/opt/cross/gcc-14.1.0-nolibc/x86_64-linux/bin/x86_64-linux- CC=clang AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar LD=ld.lld HOSTLD=ld.lld OBJCOPY=llvm-objcopy -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/arm64/kernel/hibernate.c: 24 linux/version.h not needed.
   ./arch/csky/include/asm/atomic.h: 6 linux/version.h not needed.
   ./arch/csky/include/asm/io.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/thread_info.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/uaccess.h: 16 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 14 linux/version.h not needed.
   ./arch/csky/mm/fault.c: 16 linux/version.h not needed.
   ./arch/s390/include/asm/setup.h: 170: need linux/version.h
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 14 linux/version.h not needed.
   ./drivers/block/skd_main.c: 28 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 13 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 25 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 54 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 15 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 58 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_drv.c: 38 linux/version.h not needed.
   ./drivers/hv/hv.c: 16 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 22 linux/version.h not needed.
   ./drivers/media/dvb-frontends/mxl5xx.c: 30 linux/version.h not needed.
   ./drivers/media/pci/cx25821/cx25821.h: 31 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 18 linux/version.h not needed.
   ./drivers/misc/mediatek/btif/common/inc/mtk_btif.h: 17 linux/version.h not needed.
   ./drivers/misc/mediatek/btif/common/plat_inc/plat_common.h: 18 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.h: 18 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/common/conn_soc/include/wmt_stp_exp.h: 17 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/common/conn_soc/linux/include/osal_typedef.h: 24 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/bgw_desense.c: 15 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb_pdma.c: 33 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_os.h: 527 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/platform.c: 104 linux/version.h not needed.
   ./drivers/mtd/nand/raw/brcmnand/brcmnand.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 35 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 32 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 34 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c: 15 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 15 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 13 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 10 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
   ./drivers/usb/early/xhci-dbc.c: 21 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 21 linux/version.h not needed.
   ./fs/ext4/ext4.h: 30 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 41 linux/version.h not needed.
   ./kernel/bpf/syscall.c: 19 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./samples/mic/mpssd/mpssd.c: 29 linux/version.h not needed.
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
>> ./utils/cryptodev/cryptodev-linux/authenc.c: 849: need linux/version.h
>> ./utils/cryptodev/cryptodev-linux/cryptlib.c: 484: need linux/version.h
>> ./utils/cryptodev/cryptodev-linux/ioctl.c: 1217: need linux/version.h
>> ./utils/cryptodev/cryptodev-linux/zc.c: 220: need linux/version.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
