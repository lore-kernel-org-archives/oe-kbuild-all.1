Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D1D32B998
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768743817; cv=none; b=WraMnB3ts7yNheFssrCbcKCU1pwJXD4u1BJUYwlUvrfUb9Ol5+2OdUK9LVbUbHkdLt68CetKcihXIBPrSaV2Ds98OZve5NOby4z/pcr/sZZ8XjD55dZgWUY5qkgq3h1kLdd3n88LOL/pXyOOL4ABk9oYBYYMC4r649V2gy4iA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768743817; c=relaxed/simple;
	bh=eQ/72JS+y4KAOwTRnQSg+0A1Plj1d3asc9ymdaxqlbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s04xHCRqffH2PmMgrEaSr+N2je5yptq5w8XJ+Ur7wjnBsua//AHWFmdUNbJ7R+VCyavU2JzCX3iOXKRh5gJP4zYw3FPdSn53UWUHYEnyumtyVuWLJcdF9IqzTs796/tczJyhkxsfPsysMRPBa7uozzyWqdWDzIiFRCQFykqR8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1uNapZn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1uNapZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768743815; x=1800279815;
  h=date:from:to:cc:subject:message-id;
  bh=eQ/72JS+y4KAOwTRnQSg+0A1Plj1d3asc9ymdaxqlbM=;
  b=M1uNapZnJO22Ua8q1y25vENxdM0zyZVeCkGNe6d4z329LUKoMg98UDq8
   5ZbDQzJc2zQQU4t5YTDGLx30euzZPBRQDvhojBunODU4+eCgIBzrSvFhH
   xHXiJ7ZEjY5PysZexa48KQ9nDe+0OSh/MzT350zAPGP+BndjuK87fajge
   PTxcCjdeN8jLyI9WLQ/K/VlfQtUWCHlC6MF8nk5N4kcSprKuq7pGQ32Nt
   1unyPAwrELkGXpPOxRZFCCEBIB9XTX2UE8GGfRFQGmgnqgWTJYzwyJCbk
   TqRUA5BheOl9n151sE0Gn3fsTO+Iy2DAI8jMbc4GTcojjcKHGByXef7GY
   Q==;
X-CSE-ConnectionGUID: zcXOtNbGT5GL2hOmjxa8Yw==
X-CSE-MsgGUID: nSsRM2fKTNyPH321IW+Wug==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69180459"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="69180459"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 05:43:34 -0800
X-CSE-ConnectionGUID: EfvpvIYuTb+suUgDhxzynw==
X-CSE-MsgGUID: kjUppqiNRQqtSERiQq/NtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="204794357"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 05:43:34 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhT3y-000000002Cb-2MuK;
	Sun, 18 Jan 2026 13:43:30 +0000
Date: Sun, 18 Jan 2026 14:42:52 +0100
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 467/799]
 versioncheck: ./fs/bcachefs/vfs/buffered.c: 1175: need linux/version.h
Message-ID: <202601181423.9Q0ppU4I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 221177ea260493d2314aa23273a9bc7fe93529c5 [467/799] bcachefs: move vfs-specific code to vfs/
reproduce: (https://download.01.org/0day-ci/archive/20260118/202601181423.9Q0ppU4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181423.9Q0ppU4I-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
>> ./fs/bcachefs/vfs/buffered.c: 1175: need linux/version.h
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
