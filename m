Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F46B156D4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683282794; x=1714818794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5p/fSrlZwd7VcwT3BdhdXNbp6EobBUVuRHlreFLBAIc=;
  b=RGLYgLemrEPyn/NiENj5KROJk6vQqZyWW10pNlGBhn9Nxa+J80zn957d
   zMVTVpkKEPBZ5XlNGt7/jS+Y+Yf0zJepgI8yWrJKFHEGqViAPTgGpjybE
   cEG23MjwPUuNumMkGAIDXEh33FafacTEVDEXv/ReWWBqodFymfBOh4R/X
   vXxT701e6ITXtkV9sVx3s/0lHtlTfZnqpiI7osqB6ShLMAPveVcY1Wou+
   qWpaZNsYQemnkMcyfG7LXcIEm7bzd4rP5OYCKe7YY7Z7sr2V2oc5OSyBY
   PmBs154bNVh1hlqvXglq5x/f6nXqsND/EsCU6WiMzRS9c+6kuB27XB+bB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377256042"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="377256042"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 03:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="809180676"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="809180676"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 May 2023 03:33:13 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puskS-0000Vv-1P;
	Fri, 05 May 2023 10:33:12 +0000
Date: Fri, 5 May 2023 18:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:sep_socwatch_linux_5_16 1/1] versioncheck:
 ./drivers/platform/x86/sepdk/inc/master.h: 28 linux/version.h not needed.
Message-ID: <202305051852.YSGYJWN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_16
head:   4cbfca15a262729ae8557758b49226fe4769f582
commit: 4cbfca15a262729ae8557758b49226fe4769f582 [1/1] Platform/x86 Updated SEP/SOCPERF drivers to latest version
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051852.YSGYJWN8-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/inc/control.h: 515: need linux/version.h
   ./drivers/platform/x86/sepdk/inc/cpumon.h: 28 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/inc/linuxos.h: 81: need linux/version.h
>> ./drivers/platform/x86/sepdk/inc/master.h: 28 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/inc/utility.h: 623: need linux/version.h
   ./drivers/platform/x86/sepdk/sep/core2.c: 26 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/output.c: 26 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/perfver4.c: 26 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/pmi.c: 26 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/silvermont.c: 26 linux/version.h not needed.
>> ./drivers/platform/x86/sepdk/sep/sys64.S: 143: need linux/version.h
   ./drivers/platform/x86/sepdk/sep/sys_info.c: 26 linux/version.h not needed.
   ./drivers/platform/x86/socperf/haswellunc_sa.c: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/inc/control.h: 461: need linux/version.h
   ./drivers/platform/x86/socperf/npk_uncore.c: 53 linux/version.h not needed.
   ./drivers/platform/x86/socperf/socperfdrv.c: 54 linux/version.h not needed.
   ./drivers/platform/x86/socwatch/sw_telem.c: 59 linux/version.h not needed.
   ./drivers/platform/x86/socwatch/sw_tracepoint_handlers.c: 406: need linux/version.h
   ./drivers/platform/x86/socwatchhv/inc/swhv_acrn.h: 70 linux/version.h not needed.
   ./drivers/platform/x86/socwatchhv/inc/swhv_mobilevisor.h: 70 linux/version.h not needed.
   ./drivers/platform/x86/socwatchhv/swhv_acrn.c: 66 linux/version.h not needed.
   ./drivers/platform/x86/socwatchhv/swhv_driver.c: 69 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version.c: 17 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 262: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
