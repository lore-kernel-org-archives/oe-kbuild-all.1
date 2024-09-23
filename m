Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44631A0B0D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727118227; cv=none; b=MRowVN3KPtBn5eaN0bjVawIHTSomPed79gECdVWcruZsl2U98a213v3lrxf+gFkJkByYfvAlpTkhHN/dZnEdtoI6uFgT04y3rJXEERHhKYzv7j9CJVV8y1Z9Fny5GHK+m/YKSl5oF1RucWYHQWx3ecGG5Fct58zn/qS2OTOaxRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727118227; c=relaxed/simple;
	bh=fNFfq9FDmY6J/MWbXriLHaXffNcFbBTPihxHUC14IJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r2E8JSG+ecPFETEBPVyPcgE2jytpl9d1R8macYXepQF+7CcmHiuG+FiEo9MIfWZ0mQ9euPYLa0eY5Uhsf8KqbM+Mxo3G1cYBEHPCfJsMk4geuV5AH+vRnN4CsEkH4tHQAoZBUMtjG2dujJDNr6rEnKiQ7GjHEl8q5TrmdsFSbd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJchsBW0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJchsBW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727118226; x=1758654226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNFfq9FDmY6J/MWbXriLHaXffNcFbBTPihxHUC14IJQ=;
  b=lJchsBW0y3HvOZsGszOjUp0U5KgPEk7AJ+3ygCJsleycAgLBApLU5nAA
   uoK/qJ4jCgFaG13ESeL5wAbjbA1X7eFhXog5qTYgaccNZ+wNGnGWYaJNR
   rfffOYAowBJ/ymodITw9LIOcYHtLDwtSKJ58lrKajB07KgaHShPrjdhay
   M5JTD1VXJNjnXZ85A1Lbitjs5MA0SkP5mGU4fPL5q7F4Y4VGkHDhMtEAZ
   jfiwXzpvGpu4ORtAUZ8ADV0Z7pmOmgtlmja0fBVoECu9i6Psq6hBoR/Ar
   0+fckRgRQs0l/EgIWVY8aHbVPmeYbCiFyU6dVuI+T/XFyO6TAEeUPGaMU
   w==;
X-CSE-ConnectionGUID: eOJIOyFuTtyXByr14F00oA==
X-CSE-MsgGUID: B98YqM5qTvCDw2wbb8Jevw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26038175"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="26038175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 12:03:45 -0700
X-CSE-ConnectionGUID: neY7uUELRsm+Fbu9cWuYEA==
X-CSE-MsgGUID: nJcuKPvCQu6yTj9NNLWPRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="71607804"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Sep 2024 12:03:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssoLT-000HWi-0U;
	Mon, 23 Sep 2024 19:03:39 +0000
Date: Tue, 24 Sep 2024 03:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2167/2441]
 versioncheck: ./kernel/tkernel/irqlatency/irqlatency.c: 25 linux/version.h
 not needed.
Message-ID: <202409240334.QvVhjh76-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 22599f9f53faee0e993fc4ae321de5ee3e95299a [2167/2441] irqlatency: add irq latency monitor support
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409240334.QvVhjh76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240334.QvVhjh76-lkp@intel.com/

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
   ./drivers/mtd/nand/raw/brcmnand/brcmnand.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c: 4719: need linux/version.h
   ./drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c: 10 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.h: 13 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic/hinic_ethtool.c: 2728: need linux/version.h
   ./drivers/net/ethernet/huawei/hinic/hinic_main.c: 3394: need linux/version.h
   ./drivers/net/ethernet/huawei/hinic/hinic_tx.c: 1368: need linux/version.h
   ./drivers/net/ethernet/huawei/hinic/ossl_knl_linux.c: 497: need linux/version.h
   ./drivers/net/ethernet/intel/i40e/kcompat.c: 2759: need linux/version.h
   ./drivers/net/ethernet/intel/iavf/kcompat.c: 2495: need linux/version.h
   ./drivers/net/ethernet/intel/ice/kcompat.c: 1360: need linux/version.h
   ./drivers/net/ethernet/intel/ice/kcompat_sles_defs.h: 152: need linux/version.h
   ./drivers/net/ethernet/intel/ice/kcompat_std_defs.h: 127: need linux/version.h
   ./drivers/net/ethernet/intel/ixgbe/kcompat.c: 2964: need linux/version.h
   ./drivers/net/ethernet/intel/ixgbe/kcompat_ethtool.c: 1148: need linux/version.h
   ./drivers/net/ethernet/intel/ixgbevf/kcompat.c: 2719: need linux/version.h
   ./drivers/net/ethernet/intel/ixgbevf/kcompat_ethtool.c: 1148: need linux/version.h
   ./drivers/net/ethernet/qlogic/qede/qede.h: 35 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 32 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 35 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c: 15 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/lpfc/lpfc.h: 25 linux/version.h not needed.
   ./drivers/scsi/lpfc/lpfc_attr.c: 8282: need linux/version.h
   ./drivers/scsi/lpfc/lpfc_auth.c: 2296: need linux/version.h
   ./drivers/scsi/lpfc/lpfc_crtn.h: 719: need linux/version.h
   ./drivers/scsi/lpfc/lpfc_ct.c: 3782: need linux/version.h
   ./drivers/scsi/lpfc/lpfc_els.c: 11238: need linux/version.h
   ./drivers/scsi/lpfc/lpfc_hbadisc.c: 7236: need linux/version.h
   ./drivers/scsi/lpfc/lpfc_init.c: 16102: need linux/version.h
   ./drivers/scsi/lpfc/lpfc_scsi.c: 7667: need linux/version.h
   ./drivers/scsi/lpfc/lpfc_sli.c: 22519: need linux/version.h
   ./drivers/scsi/mpt3sas/mpt3sas_base.h: 2490: need linux/version.h
   ./drivers/scsi/mpt3sas/mpt3sas_config.c: 46 linux/version.h not needed.
   ./drivers/scsi/mpt3sas/mpt3sas_debugfs.c: 43 linux/version.h not needed.
   ./drivers/scsi/mpt3sas/mpt3sas_transport.c: 2654: need linux/version.h
   ./drivers/scsi/mpt3sas/mpt3sas_trigger_diag.c: 47 linux/version.h not needed.
   ./drivers/scsi/mpt3sas/mpt3sas_warpdrive.c: 615: need linux/version.h
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
>> ./kernel/tkernel/irqlatency/irqlatency.c: 25 linux/version.h not needed.
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
