Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5461ADC7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 20:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692303062; x=1723839062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KfOQwlZEq8e5QwVPVafaWzrAR30XBO7N8sMLa1z8LNU=;
  b=KXO1i5JD+5t00S0adxU3dNiezx6zMXg62uT+KzvHHMVyHc5VPeD3bv9e
   s07b/C6vT4bCxo+83XCSztc6avKq1guIwCflYdpqb2MWr4l8mCBqCXbRy
   1qocW6B3NCn63SUZ5G6GhVJBUAkQqKxadjZmQzL9U2zJ2auj4bpJU0w+I
   0frwKPHm52R3D1Q09BXQ043myGdSniOwtZNPxz1SCwFvY/waC96spoY6j
   ptetMjfQ4ADhV05TixuqJJe7LKF7oBx2trE+Fd9mC73tkp1x/ifzBgRtA
   iUYQbOZ1UuUKkv04+D5jMxV7ji/XrrQnhT+itM8WKcs8GUwEJ+3TkCnuk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363076392"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="363076392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 13:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728289566"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="728289566"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 13:10:56 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWjKa-0001Rm-0c;
	Thu, 17 Aug 2023 20:10:56 +0000
Date: Fri, 18 Aug 2023 04:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 2617/9999] versioncheck:
 ./drivers/gpu/arm/midgard/mali_kbase_sync.h: 212: need linux/version.h
Message-ID: <202308180426.1B63wkIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 71360691b6116220612ef487ba911b87f0c6ed02 [2617/9999] CHROMIUM: MALI: Bifrost r14p0 EAC release
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180426.1B63wkIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180426.1B63wkIi-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=-Wno-missing-prototypes W=1 --keep-going HOSTCC=gcc-7 CC=gcc-7 -j32 ARCH=x86_64 versioncheck
   scripts/kconfig/conf -s --silentoldconfig Kconfig
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/arm64/kernel/hibernate.c: 25 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 28 linux/version.h not needed.
   ./drivers/block/skd_main.c: 30 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 16 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.c: 649: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa.h: 229: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa_debugfs.c: 288: need linux/version.h
   ./drivers/gpu/arm/midgard/ipa/mali_kbase_ipa_simple.c: 350: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase.h: 694: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_context.h: 123: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_defs.h: 2233: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_device.c: 581: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_dma_fence.c: 454: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.c: 206: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_fence.h: 280: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_jd_debugfs.c: 241: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mmu_mode_aarch64.c: 223: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_mmu_mode_lpae.c: 214: need linux/version.h
>> ./drivers/gpu/arm/midgard/mali_kbase_sync.h: 212: need linux/version.h
   ./drivers/gpu/arm/midgard/mali_kbase_utility.h: 66: need linux/version.h
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 50 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_connector.c: 22 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 19 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 59 linux/version.h not needed.
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
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 80: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/linux/verification.h: 7 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2364: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 178: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/fw/file.h: 920: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 2235: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/debugfs-vif.c: 1768: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 4909: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/power.c: 1083: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/quota.c: 408: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 2069: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/tof.c: 1171: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/tt.c: 922: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 1284: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/pcie/trans.c: 3587: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/pcie/tx-gen2.c: 1360: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/pcie/tx.c: 2485: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 778: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 52: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 4086: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/chan.c: 1822: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ibss.c: 1823: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2219: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2128: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1365: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 5466: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/offchannel.c: 1011: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/packet_filtering.h: 127: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/reg.c: 720: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 4532: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1307: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 2362: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2005: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 4783: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 3691: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/wme.c: 283: need linux/version.h
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
https://github.com/intel/lkp-tests/wiki
