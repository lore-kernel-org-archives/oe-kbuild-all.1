Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662510979
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709600743; cv=none; b=Ln1NpTv3RUIbJKnYPFwxcPZNSSbLUTMAxgFr18t+ZsDrs6dBdCuDcH3eb952fEeMCdkB9R0pzpN96UYK3D9HDjgBo0zbRcCAry8YFzvoMr4bpQfb7ZQdLNfk9Lk6mkrDkNLtljEU3CtHHW2fdURZt38id37LMlQL8LdrdUXLxk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709600743; c=relaxed/simple;
	bh=0zBr5FfQYDOaEhoq/gkiFs563r2ZTI3E4W69Layw7AE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPhv0MfJQtPTv8Rx8DH+JxsPGqE1h+LL45H0TEfF9ryHIvE5uzEArHTwybs4z8sWJCou+txd72Meal2iNBSUq6yGgFj2hwxC4oHU0gnsPiimqIjG7VlOHzRJ39SgGmoN07tJERnK78z4Svyv2EYet5U/V4baBhHI0am18H2fwPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ni3M5LGB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ni3M5LGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709600741; x=1741136741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0zBr5FfQYDOaEhoq/gkiFs563r2ZTI3E4W69Layw7AE=;
  b=ni3M5LGBPLTKUEya2C2u3z78SO3ukAwmkGBdpNp5Rv00+NA3dhkUosmp
   ytH1owIZQ8TFQltbF2B4NIvnSnRBzfDZ7edCRUjf5vI/nO2E1q4ISKSqs
   mqKqtPogrv2yIjZk5Il1pFaBjaE/ulI98eI5e5Zrs9CztfQdY/i9DUwL6
   APz4QkSno8MEhC6Sr2ypuWzSVtyVLhP8i62ieCff3vNokni++1h2Lv9Sk
   HwqbcLJtkh4vTVRJ3L/DTub2GQZitpaMEEj5pwliwjjMZ7/wAepRkCboO
   ObzYYydO67wa26MvYrZEDgWIfBUtNaY9hMSu9aAQljGrSfa5nfS/Qqq8u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14709848"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14709848"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 17:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9360335"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Mar 2024 17:05:27 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhJFD-0002sh-2Y;
	Tue, 05 Mar 2024 01:05:23 +0000
Date: Tue, 5 Mar 2024 09:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25785/27434] versioncheck:
 ./net/ipv4/netfilter/ipt_WH.c: 1 linux/version.h not needed.
Message-ID: <202403050839.QHc2eKG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 09290fb1ad50a24d68b78beb85193a2b20ec73e3 [25785/27434] net: iptables: add iptables target WH and DNATLB
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403050839.QHc2eKG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050839.QHc2eKG9-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
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
   ./arch/s390/include/asm/setup.h: 179: need linux/version.h
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
   ./drivers/thirdparty/bnxt/bnxt_ethtool.c: 5642: need linux/version.h
   ./drivers/thirdparty/bnxt/bnxt_ulp.c: 11 linux/version.h not needed.
   ./drivers/thirdparty/bnxt/bnxt_ulp.h: 14 linux/version.h not needed.
   ./drivers/thirdparty/bnxt/bnxt_xdp.c: 623: need linux/version.h
   ./drivers/thirdparty/hinic/hinic_ethtool.c: 2728: need linux/version.h
   ./drivers/thirdparty/hinic/hinic_main.c: 3394: need linux/version.h
   ./drivers/thirdparty/hinic/hinic_tx.c: 1368: need linux/version.h
   ./drivers/thirdparty/hinic/ossl_knl_linux.c: 497: need linux/version.h
   ./drivers/thirdparty/i40e/kcompat.c: 2759: need linux/version.h
   ./drivers/thirdparty/iavf/kcompat.c: 2684: need linux/version.h
   ./drivers/thirdparty/iavf/kcompat_sles_defs.h: 149: need linux/version.h
   ./drivers/thirdparty/iavf/kcompat_std_defs.h: 114: need linux/version.h
   ./drivers/thirdparty/ice/kcompat.c: 1360: need linux/version.h
   ./drivers/thirdparty/ice/kcompat_sles_defs.h: 152: need linux/version.h
   ./drivers/thirdparty/ice/kcompat_std_defs.h: 127: need linux/version.h
   ./drivers/thirdparty/ixgbe/kcompat.c: 2964: need linux/version.h
   ./drivers/thirdparty/ixgbe/kcompat_ethtool.c: 1148: need linux/version.h
   ./drivers/thirdparty/ixgbevf/kcompat.c: 2719: need linux/version.h
   ./drivers/thirdparty/ixgbevf/kcompat_ethtool.c: 1148: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc.h: 25 linux/version.h not needed.
   ./drivers/thirdparty/lpfc/lpfc_attr.c: 8286: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc_auth.c: 2296: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc_crtn.h: 719: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc_ct.c: 3782: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc_els.c: 11238: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc_hbadisc.c: 7236: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc_init.c: 16102: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc_scsi.c: 7667: need linux/version.h
   ./drivers/thirdparty/lpfc/lpfc_sli.c: 22519: need linux/version.h
   ./drivers/thirdparty/megaraid_sas/megaraid_sas.h: 2802: need linux/version.h
   ./drivers/thirdparty/megaraid_sas/megaraid_sas_debugfs.c: 28 linux/version.h not needed.
   ./drivers/thirdparty/megaraid_sas/megaraid_sas_fp.c: 33 linux/version.h not needed.
   ./drivers/thirdparty/mpt3sas/mpt3sas_base.h: 2539: need linux/version.h
   ./drivers/thirdparty/mpt3sas/mpt3sas_config.c: 46 linux/version.h not needed.
   ./drivers/thirdparty/mpt3sas/mpt3sas_debugfs.c: 43 linux/version.h not needed.
   ./drivers/thirdparty/mpt3sas/mpt3sas_transport.c: 2657: need linux/version.h
   ./drivers/thirdparty/mpt3sas/mpt3sas_trigger_diag.c: 47 linux/version.h not needed.
   ./drivers/thirdparty/mpt3sas/mpt3sas_warpdrive.c: 615: need linux/version.h
   ./drivers/usb/early/xhci-dbc.c: 21 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 21 linux/version.h not needed.
   ./fs/ext4/ext4.h: 30 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 41 linux/version.h not needed.
   ./kernel/bpf/syscall.c: 19 linux/version.h not needed.
   ./kernel/tkernel/irqlatency/irqlatency.c: 25 linux/version.h not needed.
>> ./net/ipv4/netfilter/ipt_WH.c: 1 linux/version.h not needed.
   ./net/toa/toa.h: 7 linux/version.h not needed.
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
