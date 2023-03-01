Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0650B2F3E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 23:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677712480; x=1709248480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFDgRbylVO/mHtTBPODNI+tfwQwwqVzCznwRS3CmTb8=;
  b=OBMsl+RKo9JdC7lX0NhA3W7Ps6HIlseFWFDLJe2Dd/lfvGDjn8YB2nUr
   Uiky85ufOGc5kqwlsmXwp3jv4y6DJXnHHOPOoF3EZJoNypi2z68wDgRyE
   gsd11ksUuZ1P2vv+PZsfqHQiStaoMM+wbclmEDUNac+U6d5pW6+0fXClL
   86E3CqI1jmEQ2X7Fi8HjYwN6wJzJv0a5qPWLkd8MvygPMWcyrRhXFu2C0
   fpiHZtySdNa9xwoqGiupEc18TFks/SmsbWsa7b2mLyVpR0Zh0DhXoOxYl
   /XZ2RMsH+YxCrAQuCTb5QxG/7/9jYEJ1D1pmlTatWZgeuMIiOCCZW5sdC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399337158"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="399337158"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798593437"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="798593437"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Mar 2023 15:14:38 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXVef-0006Ud-2y;
	Wed, 01 Mar 2023 23:14:37 +0000
Date: Thu, 2 Mar 2023 07:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Wengang Wu <wgw@motorola.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-omap:android-beagle-x15-4.14 15901/30000] versioncheck:
 ./drivers/gpu/pvr/services4/srvkm/env/linux/dma_fence_sync_native_server.c:
 13 linux/version.h not needed.
Message-ID: <202303020752.b3tiGSp4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/omap android-beagle-x15-4.14
head:   bb5a46d9a30e6126b85ef4cf108499488c438462
commit: be012e8e9e27e2759c3869ef1c97352889bbb906 [15901/30000] drivers: gpu: pvr: Move SGX driver to proper place
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020752.b3tiGSp4-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=-Wno-missing-prototypes W=1 --keep-going HOSTCC=gcc-7 CC=gcc-7 -j32 ARCH=x86_64 versioncheck
   scripts/kconfig/conf  --silentoldconfig Kconfig
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/arm64/kernel/hibernate.c: 25 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 28 linux/version.h not needed.
   ./drivers/block/skd_main.c: 30 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 16 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_connector.c: 22 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 19 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 59 linux/version.h not needed.
>> ./drivers/gpu/pvr/services4/srvkm/env/linux/dma_fence_sync_native_server.c: 13 linux/version.h not needed.
>> ./drivers/gpu/pvr/services4/srvkm/env/linux/dmabuf.c: 328: need linux/version.h
>> ./drivers/gpu/pvr/services4/srvkm/env/linux/proc.h: 95: need linux/version.h
>> ./drivers/gpu/pvr/services4/srvkm/env/linux/pvr_fence.c: 1688: need linux/version.h
>> ./drivers/gpu/pvr/services4/srvkm/env/linux/pvr_sync.c: 1492: need linux/version.h
>> ./drivers/gpu/pvr/services4/srvkm/env/linux/pvr_sync_dma_fence.c: 812: need linux/version.h
>> ./drivers/gpu/pvr/services4/system/omap/sgxfreq.c: 846: need linux/version.h
>> ./drivers/gpu/pvr/services4/system/omap/sgxfreq_cool.c: 216: need linux/version.h
   ./drivers/hv/hv.c: 29 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 35 linux/version.h not needed.
   ./drivers/media/dvb-frontends/mxl5xx.c: 30 linux/version.h not needed.
   ./drivers/media/media-device.c: 871: need linux/version.h
   ./drivers/media/pci/cx25821/cx25821.h: 41 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 30 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 19 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 34 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 23 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 23 linux/version.h not needed.
   ./drivers/mtd/nand/brcmnand/brcmnand.c: 15 linux/version.h not needed.
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
   ./drivers/staging/ccree/ssi_aead.c: 30 linux/version.h not needed.
   ./drivers/staging/ccree/ssi_buffer_mgr.c: 18 linux/version.h not needed.
   ./drivers/staging/ccree/ssi_config.h: 24 linux/version.h not needed.
   ./drivers/staging/ccree/ssi_driver.h: 38 linux/version.h not needed.
   ./drivers/staging/lustre/include/uapi/linux/lustre/lustre_user.h: 50 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 29 linux/version.h not needed.
   ./drivers/staging/media/bcm2048/radio-bcm2048.c: 35 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 25 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 18 linux/version.h not needed.
   ./drivers/staging/vboxvideo/vbox_drv.h: 36 linux/version.h not needed.
   ./drivers/usb/early/xhci-dbc.c: 24 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 30 linux/version.h not needed.
   ./fs/ext4/ext4.h: 30 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 41 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./samples/mic/mpssd/mpssd.c: 40 linux/version.h not needed.
   ./sound/soc/codecs/cs35l35.c: 16 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 18 linux/version.h not needed.
   ./tools/perf/tests/bpf-script-example.c: 48: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 46: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 50: need linux/version.h
   ./tools/testing/selftests/bpf/test_tcp_estats.c: 37 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
