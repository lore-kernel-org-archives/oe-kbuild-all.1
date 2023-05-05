Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16F156C6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683284717; x=1714820717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1hD0B+KdPwqIhPz8WPVDqPyrym/8MjVCEvcOXlbjlF0=;
  b=laJw5gi8LNLpznuC4EiNV6z0PAerJ7Su4Fv/u3tkNXfc/1URSanWZKKY
   8UWHcasSLmH2PnSAl+OwelHWCIG5mYMbyhidEsCGW9ck3KR5pmJzB4jh+
   GDYJ9oYMkfx+qUwwyyjmBhjPuMTc4eJiiydeu+R9hETpg7TpGBoBLeb3V
   izanDoQ1iPaEzGBgMQnBJ9/FsxDC2elM5X5MmoQnjiDOZZC0WmgSY7+0P
   qsLvKid+uXzrYu3T7kdpW4Tuo9aqF6FekOl8shmbdY46hP2LCi+d/Qlr+
   h8xub6LDCFdl9bJ+FbQ14UV0M2KU7lXZ8qGSsr7iHkq62NI/DwGVJt92j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="338370730"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="338370730"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 04:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="647804142"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="647804142"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 May 2023 04:05:14 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1putFS-0000XV-0T;
	Fri, 05 May 2023 11:05:14 +0000
Date: Fri, 5 May 2023 19:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_0 1/1] versioncheck:
 ./drivers/platform/x86/sepdk/sep/pci.c: 1027: need linux/version.h
Message-ID: <202305051821.RLry88R7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux socwatch_linux_6_0
head:   32b2f1b19c12122a110fa6b673c000ef6bd5ee8b
commit: 32b2f1b19c12122a110fa6b673c000ef6bd5ee8b [1/1] SEP/SOCPERF drivers updated to 5.36
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051821.RLry88R7-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/inc/control.h: 543: need linux/version.h
   ./drivers/platform/x86/sepdk/inc/cpumon.h: 36 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/inc/linuxos.h: 95: need linux/version.h
   ./drivers/platform/x86/sepdk/inc/master.h: 36 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/inc/utility.h: 648: need linux/version.h
   ./drivers/platform/x86/sepdk/sep/core2.c: 34 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/output.c: 34 linux/version.h not needed.
>> ./drivers/platform/x86/sepdk/sep/pci.c: 1027: need linux/version.h
   ./drivers/platform/x86/sepdk/sep/perfver4.c: 34 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/pmi.c: 34 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/silvermont.c: 34 linux/version.h not needed.
   ./drivers/platform/x86/sepdk/sep/sys64.S: 147: need linux/version.h
   ./drivers/platform/x86/sepdk/sep/sys_info.c: 34 linux/version.h not needed.
   ./drivers/platform/x86/socperf/haswellunc_sa.c: 59 linux/version.h not needed.
   ./drivers/platform/x86/socperf/inc/control.h: 473: need linux/version.h
   ./drivers/platform/x86/socperf/npk_uncore.c: 59 linux/version.h not needed.
   ./drivers/platform/x86/socperf/socperfdrv.c: 60 linux/version.h not needed.
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
   ./init/version.c: 19 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 301: need linux/version.h
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
