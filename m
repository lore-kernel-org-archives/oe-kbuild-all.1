Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0B137750
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 16:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729526620; cv=none; b=gG5u3KFo+vRFa2+1BfzAcXSo18LlgCnanPUbL7EIKHEBV1T2qqHOoso07h32zbGzbgUl3G6y5fjpQjTtTLbB2IzNBrmnl0DfvhoQleYPhuZCJwXSp99jxbN3tcIdzJcvVs6JHACApkII1gVQtYq2oOUuP0qiXs5vfPqOymVmRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729526620; c=relaxed/simple;
	bh=xgzkJ9WdghQNxG+kEe27u+1Ruq/wmmE9F7pxRkDB9Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IeCcq9QEHm+3JYnkAnoieX4AttqK71nHIchx5sdH5Gro4z32NkjfjP4cKh2IyRLQa9jjzUzNE7OxGGMoLQDPX5LS6l3mla4VeVFZobAZbCBNUXm1X8n5zm8l8pJg42S4Vn/ajisHSbjPaEfjeAl7zU+0dXRZMTX5+x0cJaJU6cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6uCIhsU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6uCIhsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729526618; x=1761062618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgzkJ9WdghQNxG+kEe27u+1Ruq/wmmE9F7pxRkDB9Wg=;
  b=j6uCIhsUN+NkPYl97R3yoP8p9y6ZrPOiXmUsQ96hmITfsqYeapm1hXfM
   bEhAk5GoFTC540IdTO4jubCfzPqEG543uuWr+sIjghQeO4Lm6TJYtnH6n
   NbFR2sYqfSHeyDtE1sVjaY6jSYz3eIDzbpff/6/ieq3s5gk3uMtW358Kj
   si3sbLE6TP4yOkjetmWGXSi1fxszB1lzA2CanNy13OSykePlsjU5fgObT
   ZInUsJOCMD1NACJ5U5cWZDsmqiw+DWwZTV+bnaZvcq1TA2vn/y8A3xRmo
   XtIJezkHp3CgKQWEINZ6zGbLEVl346nURNgXQSyS4KVXhKrQxtnqXSvFG
   A==;
X-CSE-ConnectionGUID: OgQUFoFbSNe+oWFoBT2OVA==
X-CSE-MsgGUID: 6oyZBv+ERpeRhXgpZsDjcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28897577"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="28897577"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 09:03:38 -0700
X-CSE-ConnectionGUID: WODpYK78RJ+y3gMU8UBXKw==
X-CSE-MsgGUID: HAUZE7/DT++QgeUNW2OhYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79507087"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Oct 2024 09:03:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2usV-000SMv-37;
	Mon, 21 Oct 2024 16:03:31 +0000
Date: Tue, 22 Oct 2024 00:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 3/2444] versioncheck:
 ./drivers/net/ethernet/intel/ice/kcompat.c: 1360: need linux/version.h
Message-ID: <202410220024.4rAGjv6P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 7d0110e49bdc1f56083058dc9f4ea82ce9ca39f9 [3/2444] ice: update E810 100g nic driver
reproduce: (https://download.01.org/0day-ci/archive/20241022/202410220024.4rAGjv6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220024.4rAGjv6P-lkp@intel.com/

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
>> ./drivers/net/ethernet/intel/ice/kcompat.c: 1360: need linux/version.h
>> ./drivers/net/ethernet/intel/ice/kcompat_sles_defs.h: 152: need linux/version.h
>> ./drivers/net/ethernet/intel/ice/kcompat_std_defs.h: 127: need linux/version.h
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
   ./drivers/scsi/lpfc/lpfc_attr.c: 8286: need linux/version.h
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
