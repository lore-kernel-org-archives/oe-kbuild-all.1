Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CBB16426
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726320423; cv=none; b=RnR35n08mloRcbXG1+mtj2gPN5HUl7knw6/iFmTdshP9TAW31hGskpCNrgxNGz7nObDuEZ8rBrfte/87bK4PcqI0+bYng2RbnCbOXDRV2w76ckQiUv0e8FH7/LjQSIeerA42cZFO3uV16mtEP5InLAV7jjRYA6LlKUb6WLsnoZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726320423; c=relaxed/simple;
	bh=fLUwqkZf1wHEylNN/DtYX4JvY7If7n9TrUcdBcITJ00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OTDzwDiQtJwgQVf5r/zXMblje819cbirbym0eh69/QLjT16lObt69ELMDjuasb9L4tam93Qy3AsQEInazvOCF4O8KCHiwSYCK8Bp6luS82Keu0Tb5E0HngRAEfr+W0YFgYtWgQuyz8RijkUB4x6QnJh8xP2QlldT28hCIHGurQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdpVMXEU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdpVMXEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726320421; x=1757856421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fLUwqkZf1wHEylNN/DtYX4JvY7If7n9TrUcdBcITJ00=;
  b=LdpVMXEUogDHnFfKzbJgDnUD3RKhPhErnS8g0T596l13AQgnEFqTirG8
   jnO2/NxOvdJfo/lF07wU8QmJt/JaB2BPsO8p/4t+DpRhjV5Mt3lcoFtEl
   K4cJsBeiu0EyzkihLj/Y6sD1XQn5w7tHrLVSETXhH5VJFQ0XoxuU27Gil
   Nw/0yS5yusuZhAGztJOE7pYu330kOklFbGyL7ueZWJdYyEQxGugGma89E
   jeMy8h0p193Z7aWBJyCae4p6M1pPsnZB7IC4QN2JF4caGpY5Bo3iLlC+i
   fYemvPyHyqV9+8RJ0Hve0lNU838A7XqudG/ciTiu5pr2z1OD9dCd4n1wT
   A==;
X-CSE-ConnectionGUID: xb344d+aRTKmPKKOIe4Yqg==
X-CSE-MsgGUID: wCJNpxaaRTWmg6WtT3a3uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="24698581"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="24698581"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 06:27:01 -0700
X-CSE-ConnectionGUID: o+vRPoY7SjKrL8hNlKvttw==
X-CSE-MsgGUID: Igsnt6kjTNyTyNJvj3QMbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68268762"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Sep 2024 06:27:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spSnh-0007mM-2c;
	Sat, 14 Sep 2024 13:26:57 +0000
Date: Sat, 14 Sep 2024 21:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/50 6/9] versioncheck:
 ./drivers/misc/mediatek/connectivity/common/common_detect/wmt_stp_exp.h: 17
 linux/version.h not needed.
Message-ID: <202409142144.q7h5Aawf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/50
head:   b3bf5911a5d9f6eb8112d294ffaf5f474dccc686
commit: ce8c582c6121469db64197b1b4aa4e4c377c660f [6/9] [wifi] adding driver-folder
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409142144.q7h5Aawf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142144.q7h5Aawf-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going CROSS_COMPILE=/opt/cross/gcc-14.1.0-nolibc/x86_64-linux/bin/x86_64-linux- CC=clang AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar LD=ld.lld HOSTLD=ld.lld OBJCOPY=llvm-objcopy -j32 ARCH=x86_64 versioncheck
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
   ./drivers/media/platform/s3c-camif/camif-core.c: 30 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 23 linux/version.h not needed.
   ./drivers/misc/mediatek/btif/common/inc/mtk_btif.h: 17 linux/version.h not needed.
   ./drivers/misc/mediatek/btif/common/plat_inc/plat_common.h: 18 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.h: 18 linux/version.h not needed.
>> ./drivers/misc/mediatek/connectivity/common/common_detect/wmt_stp_exp.h: 17 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/common/conn_soc/linux/include/osal_typedef.h: 24 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/common/conn_soc/linux/pub/bgw_desense.c: 15 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb_pdma.c: 33 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_os.h: 532 linux/version.h not needed.
   ./drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/platform.c: 104 linux/version.h not needed.
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
