Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A4039E171
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 23:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770247753; cv=none; b=FtRBAUHNnXdR025fp+d9NlSDYgP+LH/pdvStSI26TiQAZIS43KBhnUTzBUYPu1ZQZmi0oTxkfFMyR3H9TgQkiG4CuTZb9d8Bb1rx9WRwAs1EBM6XqR3JBPMeSo1T1j7806l7F3SIv/kMi5vGGjdWSk4gN/jP2TCXs111jGUxrE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770247753; c=relaxed/simple;
	bh=qLNOmpSiSTucBQwJVEKZYv+eMMBop1Ac0W9+Q2RmAp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MdTrtVdJWdlzz0qvk/H4fq0hhiQO76is8tn64y1uM/hdmWElBFZp2Xl6h75f2TwbC72zXIsQ5qmYzxHAsS1pKpo+XcUV82Y5H+SCcQZc/BKYzhxJtVcPTaHFEGIMaUrpb0we+N28gysYJ72SUwTQAzYPWsQgv39S1EOCQxRv+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdpySZid; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdpySZid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770247753; x=1801783753;
  h=date:from:to:cc:subject:message-id;
  bh=qLNOmpSiSTucBQwJVEKZYv+eMMBop1Ac0W9+Q2RmAp4=;
  b=IdpySZidBiYrtxFMU++iPPNccXska4+Q5t6nnFdNYyvK74ELO9s7afHu
   uD4iLrrxA9lyi34Pz7ob7UOd/NtRPr7VZiG5SjwTE4wnMpPmlLU6YTG1t
   WBOlK0J/8agroIMRnGEsriaLLb8qEfYgNe+h3cZhxA+1nkNmJXzp2BsP0
   qaxaHq8DnGsnmyXWR4Ru76DuD+wV1D2gfTbkgbEIo27rIzLuTEEsMXGnw
   KOA68yjEEfqJxt6poatXnB8noBjZZARZga+9CwSOGdPFbAw/PSuGK194a
   2U5MRdbmQfMgJHXqdd3QtfjWMslVZUN2vbNu5wDYcKjt8SouuyeJw2sg0
   Q==;
X-CSE-ConnectionGUID: CPGkQYKNSLqQmTGay39Djw==
X-CSE-MsgGUID: dnk8WGiDSgm80FMQvre6GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89023504"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="89023504"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 15:29:12 -0800
X-CSE-ConnectionGUID: PxrEf8YPTHSPgDgMkm7aog==
X-CSE-MsgGUID: h7f5dsTDTxOhGWsEaN2LoA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2026 15:29:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnmJ3-000000003r7-08IK;
	Wed, 04 Feb 2026 23:29:09 +0000
Date: Thu, 05 Feb 2026 00:28:53 +0100
From: kernel test robot <lkp@intel.com>
To: Yifan Zhang <yifan1.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 Flora Cui <flora.cui@amd.com>
Subject: [agd5f:baseline0 1792/3826] versioncheck:
 ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
Message-ID: <202602050025.UWXmHaF9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: 356bec656eaedc2424af63ecf4fa08d8aaf7a757 [1792/3826] drm/amdkcl: add AC_AMDGPU_DMA_FENCE_HEADERS
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050025.UWXmHaF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050025.UWXmHaF9-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./include/kcl/backport/kcl_pci_backport.h: 6 linux/version.h not needed.
>> ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
   ./include/kcl/kcl_pci.h: 27 linux/version.h not needed.
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
