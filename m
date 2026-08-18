Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19899367F26
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054571; cv=none; b=DQ4Ygu/Wngb154P9Q17mTi64DdHwX7bENyJnroI6cLISrLzVYckRkdItqBNKSycGvGqidO24oXebkTDCHbwBXaFUzOLYW519BSLPCWK6fBg9O6lVA2FMiH5LdnwWlGRCU8YJO8HAcw0u/XoYMdHWBrNByirZPUnJOlvr8HhZmn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054571; c=relaxed/simple;
	bh=abTBgXvXgcxTAVPP0yFn4TUHwvwjRWJiI4HXjVxQTg8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VSWKQo7G9hngqzjSEPRsfJqO2vtN4CPMy/5MTlSeAJN85iAGJ9Y4he/dTseSl6QvY8+1zIMBtqGsYOh2JidTRCQOi14qet7X/ZvudscYr4uZJjIgV2lexw1HtWOP2xppSNN3qK58ndwCrj55EGQqnEHAeWAQpTxXVofMG9fP5rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdQq10v0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdQq10v0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787054570; x=1818590570;
  h=date:from:to:cc:subject:message-id;
  bh=abTBgXvXgcxTAVPP0yFn4TUHwvwjRWJiI4HXjVxQTg8=;
  b=FdQq10v0M9a7E3ASuTQlZkns88Q+8yv5uWBAGt0veVR+fDuoI3DsxjXW
   VQBqMnUPEifqqa7myGQNC90iPFiCDBx7XUCleSsFXPZtj/P1MbpwtNBDn
   Jk7NSsa3c4orO2xCPI4B0h1A5gIq2T63rU+IiI1wY5l4x5hRpZUYCnbpD
   Lanza/8mpedDSuYaUZQNb2n1lR28A5bIHtJ+aUfZkxqkJqqVXQxUMPoFO
   LlQGkQhvF7uFbzZlwGSiXCkw218Kfv34/2UwJ6gkesasGC//TvSDUafpv
   9XzqkVawsMWQnppfxrFJu1AmiGEkQGicK+pUIBSTYkZ8eqtpgQC2CAQdt
   w==;
X-CSE-ConnectionGUID: AQRG7xtdTEO/+Qqcalid/Q==
X-CSE-MsgGUID: 8/0JIsHDRJCoUP39XGHdag==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99065060"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="99065060"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 05:02:49 -0700
X-CSE-ConnectionGUID: dNLLnVxYQduahP9NSaiyCg==
X-CSE-MsgGUID: K+d5LcfmThWUr3R1I1E0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="264759440"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Aug 2026 05:02:49 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwIWk-0000000075N-1WAy;
	Tue, 18 Aug 2026 12:02:46 +0000
Date: Tue, 18 Aug 2026 14:01:56 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 467/799]
 versioncheck: ./fs/bcachefs/vfs/buffered.c: 1175: need linux/version.h
Message-ID: <202608181436.3iSy7B13-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 221177ea260493d2314aa23273a9bc7fe93529c5 [467/799] bcachefs: move vfs-specific code to vfs/
reproduce: (https://download.01.org/0day-ci/archive/20260818/202608181436.3iSy7B13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181436.3iSy7B13-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
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
