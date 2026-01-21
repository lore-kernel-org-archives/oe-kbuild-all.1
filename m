Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E00520E025
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011111; cv=none; b=N6E9Kom5UV6D2fkanySZY+1ZNYsB8P7TWIvGe0Xk3VTe2iynpOyJUAXMfUNpsUCwWpP+iOta2pLCciyjzPyH2N2fXTmBYuIszIRIfXbu/nUvx6GBhzlWuxq+yqAIl3nn4/VvwEMOO8JUYTywyH2gFcsaPJDE88e3wVReuoSrKVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011111; c=relaxed/simple;
	bh=cWs3c8l3iqmsUP88qW2RRdmlvmaGTwI0s+78r7tGfT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g+Mt4rvgnpcJcZPTfwRM27JQCYg6Xs5VtJBOfpBsJWRmm26932joFMHXarICJq2e/TRUkJI7rCOGdv+x4cfiEqOeTwUD1LYZh96J/gyNTDW9gxGyOfPgo1qI2Ervz++QglhRTwjAUe/Vo33xgUWo/SnsgxNMJ0DsmbnhaO7HfFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1utTs0n; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1utTs0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769011109; x=1800547109;
  h=date:from:to:cc:subject:message-id;
  bh=cWs3c8l3iqmsUP88qW2RRdmlvmaGTwI0s+78r7tGfT0=;
  b=H1utTs0nCb6BjlHPpiBILnf/zN8dFX/TPY3w9XV8kiHXzaqGK4LH7HIN
   FxVKZiLHq/qtrZkE/oCw942qbpddFWTtfzEcWnkruvrb5JdZp641HzF29
   9fGWM3+QX/CjyhVYm9ogWmbf67rZ240pBMrGNhERZ8yOP0mecQPqCV8zW
   r9+LxcfvATcKrUk+KxDMFUsAWFtpoNJgG7nSiDroqT4T7a9K6+4OF/KNv
   yfB9GyR53IaZASngcePyOPSI+0nSh/1bYQ4YwYHGR6iPMIeJ5pHqyXO2c
   Ov5DfIi9m/C0cuH1lg0D+9fw93TiOd62mlQX5BaccywC8IurPJVUaWtLw
   g==;
X-CSE-ConnectionGUID: ysUioUfmTIyEH/7iC+boAg==
X-CSE-MsgGUID: ecwjdhT4QsiGO/PT2FudYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70292122"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70292122"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 07:58:28 -0800
X-CSE-ConnectionGUID: 6YCElHjgRFKMYEy2kka1PA==
X-CSE-MsgGUID: v/9cxsImTFyvBU5KYYS+fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206086270"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2026 07:58:27 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viabB-000000000KP-1McD;
	Wed, 21 Jan 2026 15:58:25 +0000
Date: Wed, 21 Jan 2026 16:58:15 +0100
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 224/235] versioncheck:
 ./fs/bcachefs/util/util.c: 1030: need linux/version.h
Message-ID: <202601211646.ZEUTfvoe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3932211175372ebff36de9443ed7c7f1e913b80c
commit: e9546cca4f20b493a0f5131d5b50121f9a28dd8f [224/235] bcachefs: Update for v6.19
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601211646.ZEUTfvoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211646.ZEUTfvoe-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
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
