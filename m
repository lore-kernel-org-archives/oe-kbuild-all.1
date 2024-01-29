Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFDA154BEE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706543567; cv=none; b=u1TuLCloNrVfOEDLWD43nlmtTTytX2DsE3cbHFUicRPRCsr/POWf7hrXrJaBJzqVbz2lXCLqnMzOgODBsdW+1tlsVPY+9DVg5v0pS4Ap2c5WBboGwua5gpk+3lxxhAVrtz/K1+wtmUzHjYpAmW+qiJfWGCjo2UaTQGxuQr4h0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706543567; c=relaxed/simple;
	bh=pJnaQH8JBIs9SY08twStZ2Y6XDyEGZfsk1yaNL5TXDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BEl8H4BZejEoY/4rmtfKCOCwLoxiNkwRqIHhmgXei+X23tep19zGwBgAciPTNGlDNXr5AyAZ1n8koahSwVKqgK3hxlTTie61WQsjxTygxsei8QQakjd0sXdKkl3uqwhwWGfXmZqevXDmsE8ULKRiYqIbZl0Ua7hG8A2a9F/wMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGKpAkWo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGKpAkWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706543566; x=1738079566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJnaQH8JBIs9SY08twStZ2Y6XDyEGZfsk1yaNL5TXDc=;
  b=fGKpAkWo/okGdEEKdP9zVAgYbTvEY88QQqCowVRYqXeOHZ+L73KssXje
   3IgEXGT6xL0QSsdYUG+RMIktsBG0Mg7O9txZZ9o9htqgICJ0TLvZv3T2Z
   i1aw0ZY288WHNWlyfL8guLhaE+IAlHKjaeA1PEBH85uKRalYG2ORTloD5
   2ShaeckW4ix7FVEfAtkVa4CfI6iOGb1X0qcnPisrU95kMHEkrC9yeyFm8
   DhBS6Tw+23kGJo1Hg7evwrrcXr9SyH8xu7VxgbV8fsFY1T7XHvwiONLmm
   I9GPcp3KCtLRBEL9tP4j9Bgl9JV4XQ8QGjoNDOZC4oyOllztcyPKhK6E6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2874439"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2874439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 07:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3495734"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jan 2024 07:52:45 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUTw9-0004O7-2J;
	Mon, 29 Jan 2024 15:52:41 +0000
Date: Mon, 29 Jan 2024 23:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-spi 10/41] versioncheck:
 ./net/wireguard/compat/ptr_ring/include/linux/ptr_ring.h: 674: need
 linux/version.h
Message-ID: <202401292354.OGVwbUqP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-spi
head:   f18d6b8720893df4172d217fd074ba23ac53a7a7
commit: eb31f9fb1fa2612c9024fcd18b95e511df50a1e5 [10/41] net: wireguard: update wireguard compat
reproduce: (https://download.01.org/0day-ci/archive/20240129/202401292354.OGVwbUqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292354.OGVwbUqP-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wstringop-overflow -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 KBUILD_MODPOST_WARN=1 ARCH=x86_64 versioncheck
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
   ./arch/s390/include/asm/setup.h: 177: need linux/version.h
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
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 35 linux/version.h not needed.
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
   ./net/wireguard/compat/dst_cache/dst_cache.c: 175: need linux/version.h
>> ./net/wireguard/compat/ptr_ring/include/linux/ptr_ring.h: 674: need linux/version.h
   ./net/wireguard/compat/siphash/siphash.c: 539: need linux/version.h
   ./net/wireguard/compat/udp_tunnel/udp_tunnel.c: 394: need linux/version.h
   ./net/wireguard/compat/udp_tunnel/udp_tunnel_partial_compat.h: 226: need linux/version.h
>> ./net/wireguard/compat/version/linux/version.h: 10: need linux/version.h
   ./net/wireguard/tests/qemu/init.c: 27 linux/version.h not needed.
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
   ./utils/cryptodev/cryptodev-linux/authenc.c: 849: need linux/version.h
   ./utils/cryptodev/cryptodev-linux/cryptlib.c: 489: need linux/version.h
   ./utils/cryptodev/cryptodev-linux/ioctl.c: 1217: need linux/version.h
   ./utils/cryptodev/cryptodev-linux/zc.c: 220: need linux/version.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
