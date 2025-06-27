Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15582A8D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 06:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004608; cv=none; b=nUCtWOYwEF81gd6IaMzA7NJxXqegNYPyN02BrZNMjh5mZ+3AkpBx3E2Wa34mzXG3qag6nKnowDE7EHlk6fTMVrKCBEulAJ4bxm1fggIb/+tkEGbn3Z0Kgwd8wDyPJbXWd5b9PNqN5pz4bYX/pSA40nkZTYbvbAtvVzUaX3sSk6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004608; c=relaxed/simple;
	bh=z96qUBO/3BjnKPtK2EOaHLyeo1YIc2yYvsD8u4nOVmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onAB/ikOOcdpLRwUa6i4ZSZ7hqT1dOH4xIP6Z54CkFwG1krLwTIftW+NdBGYxCYv3UmknkBl8vcD+Rttha8qts3shbwliyTw7K68Uo8DpAOtV4q7OnzBzI7PD7E6felxpJOq8YxcCM4mXVgwMUXI0Z+hbkR1ZWZVwgo/Z/9QXt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6Z66Kff; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6Z66Kff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751004607; x=1782540607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z96qUBO/3BjnKPtK2EOaHLyeo1YIc2yYvsD8u4nOVmM=;
  b=V6Z66KffP+KBTOp1+fZhGUwAzWGh57GS1E0Jtz+iHD3jMIkU7j/ISA0h
   Tuw/M6t+Hd+bdvDasEAHfRjdXt44KlKC0tBHC9deymZF3tksDmfu+SeKO
   S9ozTH/c7ncwmRtwy9nxUpbjPzBXFHf6k8BYqPlcQiYedDxvdshyiLhqd
   m16ii3x0LXfBC6mJftr6LWSsOmNRtP0Wbiv7SuQiyX6QRgFiEZJiHudPB
   PmJ+4nH4hi3EDaqKpR+K07M9h7GUnJOYRFWMcswwYulBjfDFo6ro/q9X+
   6LjzOaGvtEUrCLjlpsAu0oOWDbOal3KaNBFDjNYSptQhtJqioNto5LtTu
   g==;
X-CSE-ConnectionGUID: ZFxxtMRRSnOieG6oXvRbmg==
X-CSE-MsgGUID: mwWWtd+7THCYsNhj2yATyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="55935008"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="55935008"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 23:10:06 -0700
X-CSE-ConnectionGUID: Z8NsoayxSFuTBJU5kTM1Jg==
X-CSE-MsgGUID: GuNAbddaRZS0v0Oo8iHIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="189919296"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jun 2025 23:10:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV2Hi-000Vqs-1Q;
	Fri, 27 Jun 2025 06:10:02 +0000
Date: Fri, 27 Jun 2025 14:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Mina Almasry <almasrymina@google.com>
Subject: [linux-next:master 4261/5590] versioncheck:
 ./tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c: 11
 linux/version.h not needed.
Message-ID: <202506271434.Gk0epC9H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecb259c4f70dd5c83907809f45bf4dc6869961d7
commit: cccfe0982208c72e116462e5431919c88505e890 [4261/5590] page_pool: import Jesper's page_pool benchmark
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271434.Gk0epC9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271434.Gk0epC9H-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 432: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
>> ./tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c: 11 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
