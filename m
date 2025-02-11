Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F141D5CD6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 05:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739252717; cv=none; b=L5kiqHyWtRzk9STV65GHahLv6xWAat7O7LY0aL1WRlBy3g3FZcRlkHlhgF8j+Dad9WbwHW8mu+roodpg3B4RdchcFklYJT7B0Eu3L2mgyavYXQnTYwgi8FYFlQXrP2XUehHC+TclV+BFT0tXYAiY82VDcBLis1j2A+kCRw+Yuzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739252717; c=relaxed/simple;
	bh=YxZw56ZMwplb2VWobp4dXJt2C3o5LUOxJm8jcmnsji0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mczxxDNT8fQxLt/NWaehSSp88QFY2jpmcTBP3IYxkosLHRfWP4PdXM01LWRNk46grWqYIJomkkiXobM2ywWuFoXmeLyqQ/umMRL/bHk2v74OkipQRyIbrbk4qLE5wcrSZURO15rTnHruK6WBMfWd51IEIBugoa9qfLGjLMGYt7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYmzE0oC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYmzE0oC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739252715; x=1770788715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxZw56ZMwplb2VWobp4dXJt2C3o5LUOxJm8jcmnsji0=;
  b=IYmzE0oCODenS+zTm38M3EoFlZLqQmYj2KOxBYtfh1S/lng7YxY6iCMR
   yEgworb09rDNFvHh+8hwSKtK8HCE9+Fi+cafPd7QptKfDHFWKyS70Tz0z
   ZTbN4tfCLbSGUHn29eM0pZPSkA95AXj5joWspMtC17GnYXsa93FXmBwqs
   bJH0h7zAhnuoqYHXAHmmFI/xbEg2FpGRttkDCVPfyP+pYhevbhBjuoO7C
   x37GTKYgYvABX8d1faKEX/uT+BZusfH6tEmRA8RuwDjs7mxedfHz74Yfh
   Y0hU+R5UMFfvI9Vpl5DyeF8w4/ZXRlaMu0NqoamP8Okt+k3orJdvEGQhc
   Q==;
X-CSE-ConnectionGUID: +25/Lkn1T1WCj7ZV93J5jA==
X-CSE-MsgGUID: Ff0Jr5ZGQ4Cse+Bkmficng==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39551351"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="39551351"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 21:45:15 -0800
X-CSE-ConnectionGUID: i1bYHaIdRaGLOF8V7jw84w==
X-CSE-MsgGUID: Hym3u7BrSSaI93hVcl4cew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149585944"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2025 21:45:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thj55-0013oF-24;
	Tue, 11 Feb 2025 05:45:11 +0000
Date: Tue, 11 Feb 2025 13:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2737/2737] versioncheck:
 ./drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: 12 linux/version.h not
 needed.
Message-ID: <202502111345.dqESsrdW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7152a244f5f9fb024d93d293168ce0b62309680a
commit: 13f748eddc9dfdec8a18922ed601e1906dcb183a [2737/2737] [PATCH] SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers
reproduce: (https://download.01.org/0day-ci/archive/20250211/202502111345.dqESsrdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111345.dqESsrdW-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
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
>> ./drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: 12 linux/version.h not needed.
>> ./drivers/scsi/linkdata/ps3stor/linux/ps3_cli.c: 15 linux/version.h not needed.
>> ./drivers/scsi/linkdata/ps3stor/linux/ps3_driver_log.c: 4 linux/version.h not needed.
>> ./drivers/scsi/linkdata/ps3stor/ps3_device_manager.h: 10 linux/version.h not needed.
>> ./drivers/scsi/linkdata/ps3stor/ps3_device_manager_sas.h: 7 linux/version.h not needed.
>> ./drivers/scsi/linkdata/ps3stor/ps3_qos.c: 7 linux/version.h not needed.
>> ./drivers/scsi/linkdata/ps3stor/ps3_rb_tree.h: 8 linux/version.h not needed.
>> ./drivers/scsi/linkdata/ps3stor/ps3_sas_transport.h: 10 linux/version.h not needed.
>> ./drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c: 10 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 15 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 13 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_fw.c: 6 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_os.c: 6 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 10 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_cdev_file.c: 23 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_device.c: 33 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_genl.c: 26 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_genl_admin.c: 20 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_main.c: 28 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_tp.c: 26 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_umem.c: 26 linux/version.h not needed.
   ./drivers/ub/urma/uburma/uburma_main.c: 29 linux/version.h not needed.
   ./drivers/ub/urma/uburma/uburma_mmap.c: 21 linux/version.h not needed.
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
   ./tools/lib/bpf/libbpf_sched.h: 21 linux/version.h not needed.
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
