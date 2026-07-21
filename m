Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50865418A48
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 21:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670415; cv=none; b=giYFQ7orKSYczyjzTwSStFyuKkB06+Fhzjb0u0w93+5kfLEwviqCPgSOe/ADmkaf19gJAemQTrv7gHnY73KUefaQIBtGvnftaryadw8larIjYsZtvE5PWznk0/KidPENq9tuGQ6OKFb83ybiV//HwqMHoa1SfxLl5UcoOVDUOno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670415; c=relaxed/simple;
	bh=8oAuL0d4Woj5V6DZ7T+wfhcKeU7nTbBDdVnsIpETXu0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DaOnXlRzmMLnGQOZW8+wZ4OwUOgvLV6hJy3UfqyOSZqS+ZyNsSFRhnrXTYWl80K2/413AhRkj7KQkrByLGkOMl7BAh3dY9r/oUfwepcrqW2rGmpQZ8G2kIYtH03WX9jwZnDT6PEEGSiDBUBovq5ighotqkJNkKUN6+EuWw7qaNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcOJIpd9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcOJIpd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784670414; x=1816206414;
  h=date:from:to:cc:subject:message-id;
  bh=8oAuL0d4Woj5V6DZ7T+wfhcKeU7nTbBDdVnsIpETXu0=;
  b=PcOJIpd9lDFddu8Wtg80tIgLRlSoldgVUfWr3hxjhdwajkj6r2RYU0KJ
   OBYks2P57Jm9B9JDqJ5EaVZRUFgHIz1E0LFLTsuSvGkxFmcC7MC90Lj3j
   U8g5tTpQtsZmN+BgwItk71NGyDHVTDyIfchVsQsqi/oLBqGklZegU2aOV
   7PjJqzTqZbKv7SBibiOKwD5qNgdqPcy25WxEM8112o0z0z3A+wi1lmruJ
   jVupdBveR18Pf7jRqDim8cTCq+WUS4JGlhVskxuDVJ440zcNk0hE1Q9b3
   rFxeYZsyBM6J5JFg6FwQA+e5IuKu6XME0qs3qhvluhD0qKUgwMwhMXmNs
   g==;
X-CSE-ConnectionGUID: umGs+5a+QeSje3mtaGdOCw==
X-CSE-MsgGUID: 1X55MiOeTbeHXCi9DGAmBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95656492"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="95656492"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 14:46:53 -0700
X-CSE-ConnectionGUID: V0+X5mC8TKK7bDMGcNcsRQ==
X-CSE-MsgGUID: EBLo6yqERW+z6YzdUsz2Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="256100589"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2026 14:46:52 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmIIb-00000000062-1TOw;
	Tue, 21 Jul 2026 21:46:49 +0000
Date: Tue, 21 Jul 2026 23:46:14 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-wireless-next-main 17/17]
 versioncheck: ./drivers/net/wireless/morsemicro/mm81x/core.h: 14
 linux/version.h not needed.
Message-ID: <202607212343.NLsGY4Bx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   19e99acc9f1b220d7b3e0e67278869c37849c68b
commit: b1906cea00b021acea22460225401d5b27bc7c36 [17/17] wifi: mm81x: add mm81x Wi-Fi HaLow driver
reproduce: (https://download.01.org/0day-ci/archive/20260721/202607212343.NLsGY4Bx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607212343.NLsGY4Bx-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/net/wireless/morsemicro/mm81x/core.h: 14 linux/version.h not needed.
>> ./drivers/net/wireless/morsemicro/mm81x/mmrc.h: 9 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
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
