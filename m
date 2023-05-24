Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9C10EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 May 2023 04:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684903968; x=1716439968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rtirzz9yUks8orLwOusDHlR2asFBzYk5kXqwdyavX9c=;
  b=WkG5KI2HBy4yuw07XcxZYMgAxBJwOSTVL6rHrXZtVxV/sotTEoGqR8yd
   LKmPAWjwwLHnTR70gbCCQFEICyHXwr6zZ4WcUOy7bl7Iv9VAOkhMFkrKX
   qg3ueHaX61C/qId8Iw7lqPopUU6bGWWDYWBgHNa9dcX86uMJvWOrMGYvq
   nNrvdZvnrIR8X5khVA/2+7r92sljQhcQkenuuMUa1ZdKzCjqIdSjtV+0e
   gVpvV14sPiOw3W7GdzM8qzKLbJXjuf5qOOtxoXAknWeBjfELsS8LgQo2m
   0Sk05eFRY+v6wSU9li17IFOTsI0ac5Zyorbt9i9Fzoj2RBwIdEq4he9ZC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416916201"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="416916201"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 21:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="828406405"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="828406405"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 May 2023 21:52:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1gUQ-000EPb-0o;
	Wed, 24 May 2023 04:52:46 +0000
Date: Wed, 24 May 2023 12:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 2939/9879] versioncheck:
 ./drivers/input/touchscreen/focaltech_touch/focaltech_core.h: 56
 linux/version.h not needed.
Message-ID: <202305241235.b0WBuyHx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 01ee5873da75bb22bde2eaae4e963d86d2ec9a49 [2939/9879] MLK-14392-1 input: touch: add focaltech touch screen support
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305241235.b0WBuyHx-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/input/touchscreen/focaltech_touch/focaltech_core.h: 56 linux/version.h not needed.
   ./drivers/input/touchscreen/vtl/vtl_ts.c: 20 linux/version.h not needed.
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
https://github.com/intel/lkp-tests/wiki
