Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172838F5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676301625; x=1707837625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OxsVQnGVTeoeLA1wHGG8+B61QiFRh1gGUghCC0swRJg=;
  b=lJ/qDoaT0w4fJEJblScUVyCstYbzEa2nrrQ6GE5XqXS5rJ/7Ka4bOHk2
   QYdTwbOrXyOtR1BWs2Zt3l0x1+9NzgnyekWDvFGyD9+F5jZkCD/co18Fs
   Y9szsVsEyxSs8VCF2MnEF6hLna6xWucg9ZYGPXQFfgWBLVbanTWHdanMx
   c6zFcpNou1yfE+UM7TsoZoK6eXIWsQBGSsFfijDF7awd+VWDqFdU8RILu
   X4HEFYxRRxH6H34YZbNRFfcSbasvvXg2C2au6IuTQxxAeofvIOwpwnbXQ
   3PHV8GI3tph3GivIkHY3QUP60xoY/aaTYWg/Ubzs5smkcT4PnviBsZGp0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333047968"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="333047968"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 07:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699196718"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="699196718"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Feb 2023 07:20:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRacw-0007oj-1N;
	Mon, 13 Feb 2023 15:20:22 +0000
Date: Mon, 13 Feb 2023 23:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 2/2] versioncheck:
 ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_model_error_generator.c: 185:
 need linux/version.h
Message-ID: <202302132305.sLvmwVrb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   4e899792da6ad557ece992a9fa910378fab1332a
commit: 4e899792da6ad557ece992a9fa910378fab1332a [2/2] CHROMIUM: gpu: mali: Apply r40p0 EAC release
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302132305.sLvmwVrb-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_model_error_generator.c: 185: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3339: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 426: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_time.c: 206: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf.c: 3335: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_defs.h: 1548: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware.c: 2913: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1598: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.c: 2368: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.h: 362: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 637: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 371: need linux/version.h
   ./drivers/gpu/arm/mali/include/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/arm/mali/ipa/mali_kbase_ipa.c: 772: need linux/version.h
   ./drivers/gpu/arm/mali/jm/mali_kbase_jm_defs.h: 866: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase.h: 758: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_defs.h: 1986: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.h: 179: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence_ops.c: 85: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gpuprops.c: 916: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/mali/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_utility.h: 52: need linux/version.h
   ./drivers/gpu/arm/mali/mali_malisw.h: 29 linux/version.h not needed.
>> ./drivers/gpu/arm/mali/thirdparty/mali_kbase_mmap.c: 420: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/cache_km.c: 47 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/mt8173/mt8173_sysconfig.c: 552: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/osfunc_arm64.c: 43 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/osfunc_x86.c: 134: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/pvr_buffer_sync.c: 739: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/pvr_debugfs.c: 624: need linux/version.h
   ./drivers/media/pci/intel/ipu-dma.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 6 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-video.c: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/ipu6-psys.c: 12 linux/version.h not needed.
   ./drivers/media/virtio/virtio_video_driver.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra-cbb.c: 19 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra194-cbb.c: 26 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version-timestamp.c: 5 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 289: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 60: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
