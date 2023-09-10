Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A72D1FA5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694330736; x=1725866736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BeYc2MHMzuFg0xJJ1WEWD2QjjYxEOR3VeFwmFhxTWc4=;
  b=cuOABC7nyQzsNUNY5g4HHhZ5AG23ieLA/q+J16a8F80TokbKSFEptfWT
   2xNshgQTT1wJfZAC1kq0B+gGDftc4ajX0uIrzvS5niOwXj+oC1f7Mevoy
   j8KDDuzviijvaaX4k1b/z3eqtGc0OyjGclW9iIc/+Sw0LAqMTMgdnIBe1
   GUOd5ZFSgX1hIrKmi5jlnkbHsv2OA7Q+zPe6TPPPh+Rs1d6mStHQKITmq
   RmCMC7JYSSJj+Lu935jXSKoF1Je6ZAqfnhKUXacPhqv5ilmrJ3BuB6XpZ
   HjZyWrpTtNNbfFJxziaG2MMLbwPpCRVvSMEZyMLoTSASj3HsPPiDm1vEI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464241548"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="464241548"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 00:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736412960"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="736412960"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Sep 2023 00:25:33 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfEp1-0004b8-2f;
	Sun, 10 Sep 2023 07:25:31 +0000
Date: Sun, 10 Sep 2023 15:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 9885/25020] versioncheck:
 ./drivers/staging/media/imx/imx8-mipi-csi2-sam.c: 42 linux/version.h not
 needed.
Message-ID: <202309101517.nVpaFtM6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 3c566d782b874da3b5929b2c7a2ac9d29c60de89 [9885/25020] LF-5503 CSI: i.MX8MP use dual 10bit raw sensor images is abnormal
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309101517.nVpaFtM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101517.nVpaFtM6-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./drivers/input/touchscreen/focaltech_touch/focaltech_core.h: 56 linux/version.h not needed.
   ./drivers/input/touchscreen/vtl/vtl_ts.c: 20 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.
   ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: 16472: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c: 6097: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c: 4865: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h: 216: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c: 638: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dmabuf.c: 548: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_gfp.c: 1408: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_reserved_mem.c: 592: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.c: 937: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/freescale/gc_hal_kernel_allocator_cma.c: 641: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.c: 259: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.h: 183: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debugfs.h: 119: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: 3062: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c: 1530: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c: 236: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c: 7647: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.c: 378: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.h: 151: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/default/gc_hal_kernel_platform_default.c: 449: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: 2054: need linux/version.h
   ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_845/hantrodec_845s.c: 40 linux/version.h not needed.
   ./drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_v4l2/vsi-v4l2.c: 41 linux/version.h not needed.
   ./drivers/mxc/vpu_malone/vpu_b0.c: 6923: need linux/version.h
   ./drivers/mxc/vpu_malone/vpu_b0.h: 23 linux/version.h not needed.
   ./drivers/mxc/vpu_malone/vpu_mu.h: 23 linux/version.h not needed.
   ./drivers/mxc/vpu_malone/vpu_pm.h: 23 linux/version.h not needed.
   ./drivers/mxc/vpu_windsor/vpu_encoder_mu.h: 23 linux/version.h not needed.
   ./drivers/mxc/vpu_windsor/vpu_encoder_pm.h: 23 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/system/sys_io.c: 33 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: 40 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm_port.c: 40 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c: 41 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_sysfs.h: 37 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/staging/fsl_ppfe/pfe_eth.c: 13 linux/version.h not needed.
   ./drivers/staging/fsl_ppfe/pfe_hif_lib.c: 7 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./drivers/staging/media/imx/imx8-mipi-csi2-sam.c: 42 linux/version.h not needed.
   ./init/version.c: 17 linux/version.h not needed.
   ./net/tsn/genl_tsn.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 227: need linux/version.h
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
