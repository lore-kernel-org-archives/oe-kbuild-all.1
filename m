Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8CA227B94
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767016388; cv=none; b=nKtnGzD67gry0ZvgJXG1Kb8rCX7EVdhe8ADVfVgFbyGfkaiACiC4eDLXIyRbM1HOtfQ8aZV2VNeh9wOLGYQOf/QRMkwQF1+pEgMviyeE+bEIzI06vJyWh45+KS2WuRtQqce8FUeD1vg+StXf1CF/nH+h3XUamHd4MKUFvzUcq9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767016388; c=relaxed/simple;
	bh=FDIVHwrFA8b6BHF1XPBn7ZKfbrHu00FNNpGc6vAYFSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PBNO0wc7FB7TnoXSubc1Cf9H/+6RMNZ/YWeKBzIxSVIr+faTyFnDemGvpQlcCXX5/syGz3olSXeVSPB7O78Bb722XpzFvt/rPd8ztQPcZdVxq1ICr+7xJH+mWeSuoc1GF8yt8yOo9M+pQyqsELoiFE69hQtsYMmIJSSEQj0rbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqjJzvz5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqjJzvz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767016387; x=1798552387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FDIVHwrFA8b6BHF1XPBn7ZKfbrHu00FNNpGc6vAYFSs=;
  b=WqjJzvz5U/05ja6i5WtoNIwAkl1fJ/VF+fA7Ndk6l2575d/MtL3wDjBd
   hFtsxJ28C6mRGtHuo26gyd/IhibyjsnAPwBxtxcACQbUWTCdMqpPV+u4y
   /mYhCED2ku1pWAW3pnoOC9RhYlmxUlLrUj6lJe5jHyALQSX7JXj/XUPRK
   AvkCxAnWK1Db3QyxjQNGJbnKs+Sm9ibg5Y55HQE3T8rP3U6mBno6W79gA
   EnH8s338d9fTJkGzH+4q67MPCCeOnIPYIceUgSdKxX3Dasg+VFSB5LwFn
   BaWH7V0U4KjBUtXunrOSYlVSktXqCxfkWmpFazRJyleM+2XIZKr4MTRjI
   g==;
X-CSE-ConnectionGUID: pcF8zcx3TsaaKCLCJ0LZtw==
X-CSE-MsgGUID: 8S4eAVDZRLWWxNVz9GU3pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67625040"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="67625040"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:53:06 -0800
X-CSE-ConnectionGUID: 2WbJb1mRQUeToSmMnL9/Eg==
X-CSE-MsgGUID: 5gPPFRDmTlmq8p7g4ElZFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="238333807"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 29 Dec 2025 05:53:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaDgF-000000007lU-06bQ;
	Mon, 29 Dec 2025 13:53:03 +0000
Date: Mon, 29 Dec 2025 14:52:43 +0100
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 2/14] versioncheck: ./fs/ntfs/malloc.h:
 14 linux/version.h not needed.
Message-ID: <202512291415.tNuDnMIf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   2913105c43c8f2704877c39b1ed5d688daf2f4f3
commit: fecf5abc60bf0ab1836dead5651b44c7f7030f95 [2/14] ntfs: update in-memory, on-disk structures and headers
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512291415.tNuDnMIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512291415.tNuDnMIf-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./fs/ntfs/malloc.h: 14 linux/version.h not needed.
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
