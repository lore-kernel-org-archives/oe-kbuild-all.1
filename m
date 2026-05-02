Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD3304BA3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777738988; cv=none; b=TkLYc0EDeSj+P+dErjwV//9Aak3shJh5xVgRwL/pTOsEVHSoTxcH0W+SwF/JQf+X7tmRAScxg3Hy0jlZek+mv4f0uldZatYDkW9FjtSp6G40K598NZZ60A3fHwTkf0RBitoCVQNe81TkSVhHYkZe8o5tTLUDRlnR7tEod9DSkrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777738988; c=relaxed/simple;
	bh=ZI4yzm+5sxrZ8GMosuUAV8wK2IDr77Ep3ceOGM56wRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RNLwgPtGQrtCgeYqP86npoZPD8gHyrvBCWaYNmfWx5VJr1K3D+P0ubcRxVQG4hrBCGe8QDAL0Rr/uuDzIUojU2i0wFfm45bGDY/Ql903i6+Ep82UITTjQylkFk6bIM1qChdX7N9FlUhMA4CjzUrRe5V1WpzGAV1CNTeOO2shYi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbc58yNz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbc58yNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777738986; x=1809274986;
  h=date:from:to:cc:subject:message-id;
  bh=ZI4yzm+5sxrZ8GMosuUAV8wK2IDr77Ep3ceOGM56wRQ=;
  b=Gbc58yNzsUgbi5qRAGOVxhL3S/BMoGTMSsxDtITtTxuZitJ32A7aig1d
   SBL8WH3oey5PSCnd8b0Gln9rpffA4KxVpmG/lhG1gFiCiz2ibVCQAtl9c
   qGUowQnehYQVtMCKBa8hcolVV3Z21uJxLMYjmis1Y4z9g6JYnycID9/iB
   ntCx22yHgk7Ege01P+B3F54MEsYsSEnovq1JELiNXox3woh0yvS8mEiUI
   MOVGQbIXTxNX2yrMlsT0r0LiqmLSdi5Hj/Puje2UIy77m2j8nOlA8lgGn
   DXnialK0luNHbipwJx7O169dET/oNcboZx+eH4DYYsLq+W9dZ+/i5DrON
   Q==;
X-CSE-ConnectionGUID: A53XGQ+hS26Nwlx/SHfawQ==
X-CSE-MsgGUID: D/oUi0vqSGKOHr+qYyro9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82275377"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="82275377"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 09:23:05 -0700
X-CSE-ConnectionGUID: gSr/1JdWRoCgNLDNBGyOZg==
X-CSE-MsgGUID: 5bPVhZ52RSilBwA1xh4UYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="240104272"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 May 2026 09:23:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJD7O-000000005Ir-1jgI;
	Sat, 02 May 2026 16:23:02 +0000
Date: Sat, 02 May 2026 18:22:49 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 23/23] versioncheck:
 ./fs/bcachefs/data/ec/io.c: 594: need linux/version.h
Message-ID: <202605021811.dYpBnU86-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   28c1a456c029fb2053818271a8810e557f02eaa0
commit: 28c1a456c029fb2053818271a8810e557f02eaa0 [23/23] bcachefs: Update for Linux 7.1
reproduce: (https://download.01.org/0day-ci/archive/20260502/202605021811.dYpBnU86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021811.dYpBnU86-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
>> ./fs/bcachefs/data/ec/io.c: 594: need linux/version.h
   ./fs/bcachefs/util/util.c: 1210: need linux/version.h
   ./fs/bcachefs/vfs/buffered.c: 1169: need linux/version.h
>> ./fs/bcachefs/vfs/io.c: 1087: need linux/version.h
>> ./fs/bcachefs/vfs/pagecache.c: 916: need linux/version.h
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
