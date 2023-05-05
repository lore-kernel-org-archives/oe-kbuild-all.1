Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB883FC7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683279672; x=1714815672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hc7I/B7YDxxFAzUT+JlqiqFTN29zvt/33rlNh/Lha/0=;
  b=Zvtqq1e2ieSSowh3Q1Iv71/mjJ5ZG9P3E/njDmR6V46iOQGqg0+SqlRG
   dPqrXR736YSa0ejmyRBdasvEC6KeQlPVhLLuf3xxdny4VRPjML67DGmuC
   eYUeX7OG13GI2OohNEvXYJ1xMWh71b/X3HXuuEb2/lkrvGkTpsMYJL7Cf
   viZykt+rPah73YEffdwhbD5wyENbn+3y2XJ7/1cSBy9N7GJ8rAdiW+FL9
   S1V2Ex2Ti4qwvE4ZL+zN+0LLzWj6PpxhU7N+DL3bM66FsWhU1a8rUY3Dk
   +awWjF3NKIK7EvZC4pFEkuy7phDBVYqQlcOL13T//ltvxDmosA1UqBC0q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412399403"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="412399403"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 02:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="841652871"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="841652871"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 May 2023 02:41:11 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1purw6-0000TD-1q;
	Fri, 05 May 2023 09:41:10 +0000
Date: Fri, 5 May 2023 17:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 40/91] versioncheck:
 ./drivers/platform/x86/socwatchhv/inc/swhv_mobilevisor.h: 70 linux/version.h
 not needed.
Message-ID: <202305051701.NBonM9ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux socwatch_linux_6_3
head:   db51827dc3d8fd27fd6312b14811fa2e0c4abe87
commit: 80c46c8183c607e70bcb88e9b04febae6c7775a2 [40/91] SEP/SOCWATCH Update SoCWatch driver after rebasing to linux v5.6
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051701.NBonM9ua-lkp@intel.com/

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
   ./drivers/platform/x86/socperf/inc/socperfdrv.h: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/npk_uncore.c: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/soc_uncore.c: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/socperfdrv.c: 54 linux/version.h not needed.
   ./drivers/platform/x86/socperf/utility.c: 54 linux/version.h not needed.
   ./drivers/platform/x86/socwatch/sw_telem.c: 59 linux/version.h not needed.
   ./drivers/platform/x86/socwatch/sw_tracepoint_handlers.c: 406: need linux/version.h
   ./drivers/platform/x86/socwatchhv/inc/swhv_acrn.h: 70 linux/version.h not needed.
>> ./drivers/platform/x86/socwatchhv/inc/swhv_mobilevisor.h: 70 linux/version.h not needed.
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
