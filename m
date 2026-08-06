Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89FA175A5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 06:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996040; cv=none; b=oOnFLbKITiD+jqlGJGIYYjVB1okIQPAUQtDYx+ubsvsUV8URq9X8aphYN6WYBW1XPflAgMNITvQ9Q+XEZEXgB3LZ3Z9Hlgp1v6MerZG5j63lS/BOwyaJYNnwSSF1r/uEsm1ghCGm88wSOuuN8nGkMh4MEH6HkCNC2Ybft2Irz1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996040; c=relaxed/simple;
	bh=KqRTvIJSlbE9GNwZebVU4PfWIaf2cH8Hu+4y6yBSwO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kR/NMH6jXH1Ep6cTWDMrBsCw0LU/TCxJpNh39DrkGaLdDSG9I/TdaCXpB8KDp0qCEn4AHa3Blhz5IVZLBDlDdKlMwOXyOIWjHJhWt6gyJQG9NMrsMRmbkue1hAGhRxvgRuYvO9Xr8eHEYDPw+uR5U3YRJsuSiKIAxfoQCw3TQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqT8JJuR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqT8JJuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785996038; x=1817532038;
  h=date:from:to:cc:subject:message-id;
  bh=KqRTvIJSlbE9GNwZebVU4PfWIaf2cH8Hu+4y6yBSwO8=;
  b=JqT8JJuR1dOZnZsff4VYEO7yDtRmP9OzNSJShIjnmgjlVDKvIr0gJMWx
   MUI5XULm8zEARLujTVN+QngTD0TWz2NkEk5L+nJcalw+4iWBELfqwbZM4
   5nEelV+6t+08hdad9EuZV9ChH8pFbsV2dOj7axj1d+DM09CzES3TjBh53
   ps09e0Y7H48BBKeA9V+rbhCCgvkMxCpBnU9Jmj58F6wOKZeDsXqtps83h
   VxNYJwmoUIvw96Q1+DAeZQ00iqNyQPvt6MMC+elFVjfQ7cUFr7V5hO4AI
   gSbE6arjAPS9fYQ60PB648QfbqJpLwI8aXx0F+Q9gLbfbNkMINHZHBPfR
   A==;
X-CSE-ConnectionGUID: GVfEOsMAQOqXN4ka1w0anQ==
X-CSE-MsgGUID: ljEtt+IMTP2+rEH/wJSaPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="85705237"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="85705237"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 23:00:38 -0700
X-CSE-ConnectionGUID: +2O6x3crRX+mrYzzGKsB8w==
X-CSE-MsgGUID: 4EUE9WQCR6iPXLnhEkhFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="300222859"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2026 23:00:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrr9d-000000004Z8-37iG;
	Thu, 06 Aug 2026 06:00:33 +0000
Date: Thu, 06 Aug 2026 08:00:11 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 208/208] versioncheck:
 ./drivers/gpu/drm/yhgch/yhgch_drm_drv.h: 6 linux/version.h not needed.
Message-ID: <202608060719.mcxfUQYM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   eef517a59e0f759d2ff232d587de6df2eabd115a
commit: 59bf69909663163b6aa30bec72c151c7c467a4c2 [208/208] drm/yhgch: rename inspur_drm to yhgch_drm
reproduce: (https://download.01.org/0day-ci/archive/20260806/202608060719.mcxfUQYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060719.mcxfUQYM-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/atomic.h: 6 linux/version.h not needed.
   ./arch/csky/include/asm/io.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/thread_info.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/uaccess.h: 15 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./arch/csky/mm/fault.c: 16 linux/version.h not needed.
   ./arch/loongarch/kvm/kvm_compat.c: 5 linux/version.h not needed.
   ./arch/loongarch/kvm/kvm_compat.h: 8 linux/version.h not needed.
   ./arch/riscv/mm/dma-mapping.c: 11 linux/version.h not needed.
   ./arch/s390/include/asm/setup.h: 183: need linux/version.h
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 14 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/alibaba/alicc/alicc_uio.c: 14 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 13 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccp/hct.c: 7 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/ccp-mdev.c: 12 linux/version.h not needed.
   ./drivers/crypto/ccp/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 25 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 62 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 47 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_drv.c: 38 linux/version.h not needed.
   ./drivers/gpu/drm/verisilicon/vs_crtc.c: 461: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_dc.c: 1304: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_gem.c: 552: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_gem.h: 74: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_plane.c: 403: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_virtual.c: 363: need linux/version.h
>> ./drivers/gpu/drm/yhgch/yhgch_drm_drv.h: 6 linux/version.h not needed.
   ./drivers/hv/hv.c: 16 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 22 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/media/pci/cx25821/cx25821.h: 31 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h: 12 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxevf/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 10 linux/version.h not needed.
   ./drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h: 26 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/pci/iohub-sriov/iohub-sriov.c: 16 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: 11 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_cli.c: 14 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_driver_log.c: 3 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_device_manager.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_device_manager_sas.h: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_qos.c: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_rb_tree.h: 7 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_sas_transport.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c: 9 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 15 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 13 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_fw.c: 6 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_os.c: 6 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 10 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 21 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 15 linux/version.h not needed.
   ./kernel/bpf/syscall.c: 20 linux/version.h not needed.
   ./net/ipv4/tcp_rt/tcp_rt.h: 15 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./sound/soc/codecs/cs35l35.c: 12 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 145: need linux/version.h
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
https://github.com/intel/lkp-tests/wiki
