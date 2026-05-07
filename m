Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8598C1A3172
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 01:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116831; cv=none; b=S9dzjoLrfIfbKLIy4JuFSH/hCJrkeYlOISDZRdd6G9NO+bIf25rJYHechQxtVBwlBB1vyRLhMaVjWOnd8FrW7qegHeiCpakExOp7fhIrY2Qk6s52zgd9RTsmufbU7lYnT8pyB6h1/3+smsMf0So9hBd2kRum3tb/jSlybsvtcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116831; c=relaxed/simple;
	bh=5bi+Bb21sDpJ79egcmAes4iymmRztWKoglrKxH5hd4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OYgZYmYMRVNRNTOpJmABUJLfxWJWYp6kREO4UdxuThEUGdtOo2rgNTVlRo2k2HRJL2D5U7raaIiwBdKQttTU+SRZk4qXmZZK8pFVcCPJaF9aVBDurgZWztDhBfS/JcXqN1wLOyLWXM9oKiVkY3wYUf7xiREVSvAOBz3X0D42Drk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGB88Z38; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGB88Z38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778116829; x=1809652829;
  h=date:from:to:cc:subject:message-id;
  bh=5bi+Bb21sDpJ79egcmAes4iymmRztWKoglrKxH5hd4s=;
  b=iGB88Z38HjtDCzhyeVnPn2gJY9Y5yza75Kiox4h39RRuMzwIwwOt8yOQ
   J6+Ux+2VWA77ED2ALrCzCedMOKxanWKVgdRyTxvsVzApzZd1eIe/KQxLn
   yqa5p+39JZoI2PLGUJHuXgtWAKPr6LhpThu6/M1J/Xd0vlRhrQ2ajIfvP
   Ppu80XnT17kaIaxy1RtwEkgD5/ADZtUvyllVTXrvwOYGe/UIXPMDH0uiP
   xyqCCDwAO6CFeJbQ4BlDLm+hrcrZrbF0UGcV4ccwktrTEwi4xDZdiyX4f
   RSY0T/2yQ27EWpBCZD1Jl3/JZuhq25wBqlJLgN6E5CPUaSoGB5c/6QSQ8
   w==;
X-CSE-ConnectionGUID: 1qEpRcwGQ0qX427O/yo2lA==
X-CSE-MsgGUID: SeVXv/lZSRGqlNRx9rg/AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90517600"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="90517600"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 18:20:29 -0700
X-CSE-ConnectionGUID: kbMOtyVxTo2OiWfwfZwC6A==
X-CSE-MsgGUID: nQ7R8l7JTZa7Y3jjkq4NiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="241313740"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2026 18:20:28 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKnPd-000000006iP-36sV;
	Thu, 07 May 2026 01:20:25 +0000
Date: Thu, 07 May 2026 03:19:55 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 224/332]
 versioncheck: ./fs/bcachefs/util/util.c: 1030: need linux/version.h
Message-ID: <202605070326.1CykZ1Ry-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: e9546cca4f20b493a0f5131d5b50121f9a28dd8f [224/332] bcachefs: Update for v6.19
reproduce: (https://download.01.org/0day-ci/archive/20260507/202605070326.1CykZ1Ry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070326.1CykZ1Ry-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
>> ./fs/bcachefs/util/util.c: 1030: need linux/version.h
   ./fs/bcachefs/vfs/buffered.c: 1169: need linux/version.h
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 449: need linux/version.h
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
