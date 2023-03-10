Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84D23AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678440613; x=1709976613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CKi/vWzNNzEeKKtM5pKqe9aiIEmdPD6R1wrw/cxzbOE=;
  b=C14S+3IdlG5A27IFlITVm35YuFQ1l0LP4Y3dQCkCRuplCUuYBMEb30jC
   B/UzzfiWgpRx4YnThpgcyCG8AWnO+9MLTFD4mpwT3aeEy0Kpk2rs1zFEH
   AG+OqHhUJYwlEE5VkdcYiQ7Tu1Y9VmQOGno7oYKXsC0CS6bkZBvXA3Xjg
   lympCBjABpYzzOjpG1iTu/nozmR9wSyhDZH5IHB1V+X9FAYDih4sH1UEU
   V81yTiSs4wutWZRaNxiFW3UdMxXUY4B6fFZVk/UCg0inUe8amH0JsCJu3
   f3gJBfcmjzip4Vwd70zdApflVa6qicoEFMK2vnzXl8Oq9jENXrXKh6RAU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334166640"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="334166640"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851844946"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="851844946"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 01:30:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paZ4l-0003hf-16;
	Fri, 10 Mar 2023 09:30:11 +0000
Date: Fri, 10 Mar 2023 17:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_0 1/1] versioncheck:
 ./drivers/platform/x86/sepdk/sep/pci.c: 1027: need linux/version.h
Message-ID: <202303101737.cPedC2Aw-lkp@intel.com>
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303101737.cPedC2Aw-lkp@intel.com/

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
