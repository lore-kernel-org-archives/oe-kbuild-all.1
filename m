Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48821242D66
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765405535; cv=none; b=k6lirtmPOj95IJXdY5BP/iEwfq2gUcesGf3q4KyRztWLuTAIZt619TOscpwQwkL75cSmE0VnoiyHECQ9T2xUz9fymssKyzvObVQqJMomJL8pev1QHO9HkuMBxcAP8SxNKdy8xisO4agJ4GAAmt1r86PIzWzhEXMoWpKCzpvyEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765405535; c=relaxed/simple;
	bh=6007lFz3M3V3Mv8PKDGd6M92AMBySuymrsfGz+EMH/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bnAQbNwCFvoht5CXP++Gi5dwNxxn1aTuS+JiCJWa4TxoGGtDoxH+YKSU810gudDQvUvfUUOB+w8zhb7+C+iy4aaugCHNvGYrqEaWuojpDO7uS7UP5zxaqZRn177M0Z/AX+XG4AnmBUnN7jTwzcckK4015/oBmU8GXpWmHHFtFKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iC8ZPlFR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iC8ZPlFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765405533; x=1796941533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6007lFz3M3V3Mv8PKDGd6M92AMBySuymrsfGz+EMH/M=;
  b=iC8ZPlFR2iRDMGWpwlqiT2lsFUUlVHMCzEiZBMYJOUiTg1klc0AktXIF
   +Roui+XXg9ua4b/MUfaokt4yh7KWbAMm3ugXZ+69q2rHabdYsJBCkoJm/
   PfCnfLJmJWJIlotvDCOemNgwA0ECtQlUzgK9UBEV6XKr/omn+m5BFbpwR
   vLkX/uuoJL9tLL4fGYZ2vskT0VY6Is7roGfTH4mcEYh/fUje3SiVI2MmQ
   ByYWh+dzSuP0HVJoZ+fwLq8NCh9KA18EEgyaYFUJ2PkDlL8iBAvUCruMB
   142yFOlAJz4+nWZFMlr/lE7SdAH7Ee0XjaRXdQETma4u9L/iDzGZeIb97
   g==;
X-CSE-ConnectionGUID: BLPpiJ7HQCancqofY1WzGw==
X-CSE-MsgGUID: 2kj5VJgySJGfKRnwq34xEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67272024"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67272024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:25:33 -0800
X-CSE-ConnectionGUID: VBZCI4ZPRaajsUPmnv1ZbA==
X-CSE-MsgGUID: vrC8dcapRPiO66oPVZUmtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196915598"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Dec 2025 14:25:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTScj-000000000mu-3ieF;
	Wed, 10 Dec 2025 22:25:29 +0000
Date: Wed, 10 Dec 2025 23:25:19 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] versioncheck:
 ./drivers/ub/urma/ubcore/ubcore_cdev_file.c: 23 linux/version.h not needed.
Message-ID: <202512102352.SjsR2Igk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   41baca24098d5757f3aea4d98e63eb9d9f7d43a3
commit: f1753f8b17480bdb750cbd33fbaa358aef5dbb23 [3406/3406] urma: upload kernel patch for 20240219_Spring
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512102352.SjsR2Igk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102352.SjsR2Igk-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
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
   ./arch/s390/include/asm/setup.h: 183: need linux/version.h
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 14 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 13 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 26 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 62 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/inspur/inspur_drm_de.c: 513: need linux/version.h
   ./drivers/gpu/drm/inspur/inspur_drm_drv.c: 456: need linux/version.h
   ./drivers/gpu/drm/pl111/pl111_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 47 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_drv.c: 38 linux/version.h not needed.
   ./drivers/hv/hv.c: 16 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 22 linux/version.h not needed.
   ./drivers/infiniband/hw/hiroce3/host/hmm/hmm_umem.c: 11 linux/version.h not needed.
   ./drivers/infiniband/hw/hiroce3/roce.h: 11 linux/version.h not needed.
   ./drivers/media/pci/cx25821/cx25821.h: 31 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h: 12 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/edma_drv/bma_include.h: 32 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c: 17 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_include.h: 20 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_main.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_mce.c: 16 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c: 16 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic/ossl_knl.h: 22 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic3/bond/hinic3_bond.c: 12 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic3/ossl_knl_linux.h: 12 linux/version.h not needed.
   ./drivers/net/ethernet/mucse/rnpm/rnpm_common.h: 7 linux/version.h not needed.
   ./drivers/net/ethernet/nebula-matrix/m1600/common.h: 12 linux/version.h not needed.
   ./drivers/net/ethernet/nebula-matrix/m1600/txrx.c: 9 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 10 linux/version.h not needed.
   ./drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h: 26 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/hisi_raid/hiraid_main.c: 9 linux/version.h not needed.
   ./drivers/scsi/huawei/hifc/hifc_knl_adp.h: 23 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 15 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 13 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_fw.c: 6 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_os.c: 6 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 10 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
>> ./drivers/ub/urma/ubcore/ubcore_cdev_file.c: 23 linux/version.h not needed.
>> ./drivers/ub/urma/ubcore/ubcore_device.c: 33 linux/version.h not needed.
>> ./drivers/ub/urma/ubcore/ubcore_genl.c: 26 linux/version.h not needed.
>> ./drivers/ub/urma/ubcore/ubcore_genl_admin.c: 20 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_main.c: 28 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_tp.c: 26 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_umem.c: 26 linux/version.h not needed.
   ./drivers/ub/urma/uburma/uburma_main.c: 29 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 21 linux/version.h not needed.
   ./fs/eulerfs/euler.h: 20 linux/version.h not needed.
   ./fs/eulerfs/euler_common.h: 25 linux/version.h not needed.
   ./fs/proc/etmem_scan.c: 13 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 15 linux/version.h not needed.
   ./kernel/bpf/syscall.c: 20 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./sound/soc/codecs/cs35l35.c: 12 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/libbpf_sched.h: 19 linux/version.h not needed.
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
