Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C23806DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 20:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086743; cv=none; b=uQ0/Ndbz5Tza/lg/HQCrDmxiyKgUY2yJP5k6r9rDuBJI72fXWQFGdhZxrk30ckcmwmIiSKwmtmnFY7B668973uN7KJsVfG5ysYTbzhw1D1oajyygPXSMA6ZXoTpeCDKrw4IN5hdCzoRA/UiYLv1N4yIufbYBhQMAz5sr2b9cZeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086743; c=relaxed/simple;
	bh=wHAHCzRCozqPLcLhV7bWSiG+fmEkabPRGIHfim/pzbg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yi3yyM6VW3NMa8H1EigCf/5QA8do4iaqwE7hc8CjTZNHNn3M4OIQJRBppOW66YtZ4hCk4aNfIHMRy6Oz1Igzd2fnJA5EoTQvZJfAzIglXcWVTeFUh0MIYLfU++9we/mdaDUgrXndKyxYk3MpxtUjXN3MmZveVwuCJhMftI6SNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhTjjKyC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhTjjKyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787086740; x=1818622740;
  h=date:from:to:cc:subject:message-id;
  bh=wHAHCzRCozqPLcLhV7bWSiG+fmEkabPRGIHfim/pzbg=;
  b=hhTjjKyCjvTdHDTxfrl/YutuBXySHMQAkwd17B9Sd80zpPlGbpdyBjuo
   nU9CDXnxStdj5r5suv2jvmCQwjD3Oourc9KP8f+tRvotIyi1GUGBNn3kv
   2Q4OEYPblu6QQ5sUreM0AlgNKPP72khYg14vPC2f/4hWTgbnkDzqMFHNA
   Ag+6EspEJNOcJ4MbuQkSt4O1jlS2Mkk39s7ElwKufZEcWlyBGOrkwJ17S
   Dkumm+Y3572SkmZwnGTQ5GHdfVTvnmlPxyedxKSIkXPHwVOGczqgLH4cu
   jYI0ZCEPgkYMmgsCq6MYvriDH/kREdAnN9rDkUtmRj+1m156rXzJDUekm
   Q==;
X-CSE-ConnectionGUID: WjWhKaCpRuqzwR8am2oSmQ==
X-CSE-MsgGUID: /6MLtgMzSpuv0D2WOiULGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90106959"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90106959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 13:58:59 -0700
X-CSE-ConnectionGUID: mit8ewOHRT63/fJiiY10pw==
X-CSE-MsgGUID: /PVVyb8qTCK7UG0GwwbjTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269176295"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 13:58:57 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwQtb-000000007E3-1rbS;
	Tue, 18 Aug 2026 20:58:55 +0000
Date: Tue, 18 Aug 2026 22:58:06 +0200
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-tools-header-sync 40/40] versioncheck:
 ./tools/sched_ext/include/scx/common.bpf.h: 1191: need linux/version.h
Message-ID: <202608182245.4DkiEQ79-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-tools-header-sync
head:   9b6c26813834207a665efc20c7e9457f205c7b77
commit: 9b6c26813834207a665efc20c7e9457f205c7b77 [40/40] sched_ext: Sync common and compat headers from the scx repo
reproduce: (https://download.01.org/0day-ci/archive/20260818/202608182245.4DkiEQ79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608182245.4DkiEQ79-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
>> ./tools/sched_ext/include/scx/common.bpf.h: 1191: need linux/version.h
>> ./tools/sched_ext/include/scx/compat.bpf.h: 495: need linux/version.h
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
