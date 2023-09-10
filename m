Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF2399
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 04:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694320344; x=1725856344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmQI+ost50lsYh0COweRBiWWM2x5+1kRTfLSbil0K4U=;
  b=Gzw8mZhRmjdMQqND0ocVZs73IBTS5shZWE0CRlTc7rjVaaqQTkIr26Ug
   HNI2atXFvhg3NQHjzUgHA7GEITKYSLlE7QAnVq00AvIzyna1SELeH+Kx0
   WsSVkp4YDJC/B2m1TrtnFRwEbEkRucecx52qgUcTFjD+ZYrtP09zOtjIP
   YGEMbZdVjK9/bv+cZ2hN+QDbyjR9NR8dRwrq1dGIlqhJ7JiDc0xEZwfG2
   FmH86Aeu9Z71FXSdziRU1TWxE0RoaZhmVup+4DABQpeM8+qpY3MatvKL4
   7Cfl2am+M7YbObGWb/Y9W6Dp2rWxcZXudV18Y47SEngrNI1a5yIV98fkT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376776208"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="376776208"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 21:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="886086483"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="886086483"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 21:32:01 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfC7P-0004Nk-2D;
	Sun, 10 Sep 2023 04:32:19 +0000
Date: Sun, 10 Sep 2023 12:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 3449/25020] versioncheck:
 ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: 17717: need
 linux/version.h
Message-ID: <202309101218.XmGabeC2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 88336f0347d2eed2f74164b816d1714a456b677f [3449/25020] LF-1762-8 mxc: gpu: replace '---help---' in Kconfig files with 'help'
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309101218.XmGabeC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101218.XmGabeC2-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.
>> ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: 17717: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c: 4805: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h: 200: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c: 605: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dmabuf.c: 552: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_gfp.c: 1389: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_reserved_mem.c: 546: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.c: 881: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/freescale/gc_hal_kernel_allocator_cma.c: 611: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.c: 260: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.h: 608: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.h: 176: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: 2677: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c: 1542: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c: 869: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c: 236: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c: 7517: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.c: 378: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.h: 151: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/default/gc_hal_kernel_platform_default.c: 450: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: 1856: need linux/version.h
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version.c: 17 linux/version.h not needed.
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
