Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC2C969
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 09:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678439353; x=1709975353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=il0WR4s3oqgzkYphcAmxxCMFFXcoGya63EuIMrhtvic=;
  b=dUdgmF5HUgSYEmNJ7v3+2TG685sk0L6Sy6gkZTUw+aQ3VAJwe024kLZM
   t15Euo1abkfvnQcq1Ns9Kwar0fC70BXgPLd3VIkqP5/SdnouTVC6k3I+i
   J99CBvPsXFa5wKnDVE8z/kWo6fs0J1icitB/VWijQYE2XB+85vDU7QRUJ
   5Fm6SLKYNDBIUEBoUb+vfatG9NjAALPTxLAjqLn790w8bQe2X65+ETrjZ
   QVQvnKwN/32OySf35yY5Lmk4DoMaB8OV9Ss7iBAGmGq7zHKbo2OUy8ASR
   j/u66qQCw30pnaqJiE21QGLEiVnHEzCLdVlPI+zw9/IzqlHwlnL6ln9QF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422952521"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="422952521"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746636712"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="746636712"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2023 01:09:11 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paYkQ-0003gd-2q;
	Fri, 10 Mar 2023 09:09:10 +0000
Date: Fri, 10 Mar 2023 17:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:sep_socwatch_linux_5_16 1/1] versioncheck:
 ./drivers/platform/x86/sepdk/inc/master.h: 28 linux/version.h not needed.
Message-ID: <202303101626.FwOYtBJr-lkp@intel.com>
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303101626.FwOYtBJr-lkp@intel.com/

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
