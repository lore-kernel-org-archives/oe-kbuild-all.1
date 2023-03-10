Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596552F2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678437432; x=1709973432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jp0DvwJsCy3KPvIhCVYqnNqsEm6LJGErMTXcM/B5ImE=;
  b=f5m1uVTUsNVBff1cNQn4eGR8oAu2PXnaLxbEtfjiMcc3l08WAdizg5Za
   naQR8XP8+J6PU+iyf4TPU/BQ22V6aZysndGVJCrLMjcQQU7ifQ46hj0qS
   jsV28kaKyG32/4gSkIpx1Xe7n0CfxwKKBk3m4X+U38tv91JpbfhLDQCvC
   jFW4cMhqXYIkHsFVzC3w43Bu8PrfWEmeFxQI5TI5Xo30qFuD/1jCGX5s5
   rFRFycXGU7FWKhhIIlBfLHtof/g05qEYpA6FA5QrLZFcBuMatTLUkKFce
   KlWTCrFy/4PEOvMIVyvwdeGUBzKg8v9/4Hj5zirh1bS2A2W0Ahef2tB55
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422946934"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="422946934"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 00:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923579355"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="923579355"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 00:37:10 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paYFS-0003fb-0O;
	Fri, 10 Mar 2023 08:37:10 +0000
Date: Fri, 10 Mar 2023 16:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 48/89] versioncheck:
 ./drivers/platform/x86/sepdk/inc/control.h: 514: need linux/version.h
Message-ID: <202303101602.AhpXkmzk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux socwatch_linux_6_3
head:   2bbe949bea3cbc139c5dd26decd5023b84779d86
commit: c859e634bf058e7963fccc4c1219c1365e925ad4 [48/89] platform/x86: Update SEP driver for 5.9 pull
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101602.AhpXkmzk-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/arm64/kernel/hibernate.c: 24 linux/version.h not needed.
   ./arch/csky/include/asm/atomic.h: 6 linux/version.h not needed.
   ./arch/csky/include/asm/io.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/thread_info.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/uaccess.h: 15 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 14 linux/version.h not needed.
   ./arch/csky/mm/fault.c: 16 linux/version.h not needed.
   ./arch/s390/include/asm/setup.h: 182: need linux/version.h
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 14 linux/version.h not needed.
   ./drivers/block/skd_main.c: 28 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 13 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 25 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 62 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 57 linux/version.h not needed.
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
   ./drivers/mfd/mt6360-core.c: 16 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 10 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
>> ./drivers/platform/x86/sepdk/inc/control.h: 514: need linux/version.h
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
   ./drivers/platform/x86/socperf/control.c: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/haswellunc_sa.c: 53 linux/version.h not needed.
>> ./drivers/platform/x86/socperf/inc/control.h: 468: need linux/version.h
   ./drivers/platform/x86/socperf/inc/socperfdrv.h: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/npk_uncore.c: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/soc_uncore.c: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/socperfdrv.c: 54 linux/version.h not needed.
   ./drivers/platform/x86/socperf/utility.c: 53 linux/version.h not needed.
   ./drivers/platform/x86/socwatch/sw_telem.c: 59 linux/version.h not needed.
   ./drivers/platform/x86/socwatch/sw_tracepoint_handlers.c: 406: need linux/version.h
   ./drivers/platform/x86/socwatchhv/inc/swhv_acrn.h: 70 linux/version.h not needed.
   ./drivers/platform/x86/socwatchhv/inc/swhv_mobilevisor.h: 70 linux/version.h not needed.
   ./drivers/platform/x86/socwatchhv/swhv_acrn.c: 66 linux/version.h not needed.
   ./drivers/platform/x86/socwatchhv/swhv_driver.c: 69 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 15 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 13 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 10 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 21 linux/version.h not needed.
   ./fs/ext4/ext4.h: 30 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 15 linux/version.h not needed.
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
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
