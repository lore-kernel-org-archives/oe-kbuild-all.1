Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68B7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 04:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693715024; x=1725251024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahJauNJpHBInB0g6Gabjcp+r1bp/eCGZFh103X42T1Q=;
  b=kMGYQny4WcwublM+HtfmHPwx9vDOBzmo1WcPaIuCVuxgNlCl9Vjpb35E
   MND+1H7Bid8IqqsT3nMxP7eQJXbtXa671sl3yUPXKgUmcCQ1sRLKdxIOq
   KohI1PmZWA3Kw+031Qb8+i1398MxXzIYkB2uwPmK+M/JxKpMvWz1n9D70
   VtSf7NgpZ2KkbP3JtgDRcV/b6UC/nL/25E1S0uI8RQoWhh/Q9igcI+NKG
   G9tqWLu2KnFElhtbsIeYQNdwHC36yEzYnEB98QIHb8yIxsBq2d998SOye
   BXVLZuKyHB8PgtFMcSc1+TEyuRzbZYZJJz7WK8SJzVIfmtT1w8OVi6zCb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="380209254"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="380209254"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 21:23:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="987128891"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="987128891"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2023 21:23:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qceeC-0002st-1s;
	Sun, 03 Sep 2023 04:23:40 +0000
Date: Sun, 3 Sep 2023 12:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_3 14474/14511] versioncheck:
 ./drivers/mtd/mtdsplit/mtdsplit_uimage.c: 19 linux/version.h not needed.
Message-ID: <202309031244.1c7SrGFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_3
head:   bd334514d2acb4d7ae8675e52ad6faf9cd7e64b6
commit: 5faa51c4316aeefc510197b28bdd6c5a16446f73 [14474/14511] OWRT BUILD: mtd: mtdsplit support
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031244.1c7SrGFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031244.1c7SrGFb-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/mtd/mtdsplit/mtdsplit_uimage.c: 19 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
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
