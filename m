Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72019D51B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 23:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675467863; x=1707003863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zLlUY3czAjfFK6NkFV2LcPWdS2+42SmdI3xHnU5oTJk=;
  b=CM/vrHSbkI0jXQVJXvdX7ovD9LhoHSJRnops0doxO5EZhZEeD967gfUu
   GUPH1I+Y06oXa3+G2PlNf5/UJ0mwsypaQ/gr3T8O1sxWlQTiX5ktgN9hJ
   Mwzp9lPUYpTs0ggqADJRvzVWuTt0CI/UXVFi8cEpcii1wl3vMLCWnSlDM
   0I2NSAB8b+q2dxNcY7pSS911VPA5ME/au41f9GzowVwa+08FDUyDnn8hi
   mMk7T9T0VL1wErKVfzvEltmadT/iq+ImMG3YG99BT8H3qTMHO0950eLx9
   Iiheaz/oqGbUHYe3tt4ixV5QTIMwtn8cis0QQI86osL+YJ8NO+9/KQPZa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="331016948"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="331016948"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 15:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="698243345"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="698243345"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2023 15:44:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO5jA-0000qn-2t;
	Fri, 03 Feb 2023 23:44:20 +0000
Date: Sat, 4 Feb 2023 07:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3386/20208] versioncheck:
 ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: 18549: need
 linux/version.h
Message-ID: <202302040702.5Z7aWDOD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 3dcab85234f3a4768e11d0fa9b18cfc9145c1131 [3386/20208] MGS-4530-1 add 6.2.4.p4 gpu driver for L4.19
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
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
>> ./drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: 18549: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c: 3590: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c: 604: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dmabuf.c: 546: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_gfp.c: 1153: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_reserved_mem.c: 511: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.c: 854: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/freescale/gc_hal_kernel_allocator_cma.c: 603: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.c: 260: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_allocator.h: 572: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.h: 151: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: 2331: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c: 1331: need linux/version.h
   ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c: 856: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c: 250: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c: 7821: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.c: 378: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_sync.h: 151: need linux/version.h
>> ./drivers/mxc/gpu-viv/hal/os/linux/kernel/platform/freescale/gc_hal_kernel_platform_imx.c: 1642: need linux/version.h
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
https://github.com/intel/lkp-tests
