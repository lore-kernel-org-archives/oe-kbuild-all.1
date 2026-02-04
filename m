Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397CD2E3AEA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770242172; cv=none; b=abKtYws8dhPA3C7QMC+fCtb8sThFn2UZzBJf4Hose2+nxFGwB8UuT+dnTfLwWuBAE3J+IExUdJMgApkDFQUZ1fojmcxdFGfhMnoiQfzL71D1y9/RodYlqhenHHImi7CCZ1EDL+bBHRQmrO1WcbSdGWq8mA6Jn4WyD/nsmqMBdkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770242172; c=relaxed/simple;
	bh=z1++nbv0fPHDYT5cJ2r3iMwfpzbR3Y7qCHL3PWRv9qY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iuzfh+5WECGJoiVIFi0qsZZCM8UmrOGwib2mYo9Eq0TXiSPmFFgc8xuRmkiHuuiDHeI8wEmUNTrAu+Pc0Sk/gY0DPeSagX3JK0YEaOwlbr7ukhB0TPZWhZ/77hd9G1gR7g+AFx3g9p4Dk51t4OJfcY8c1c698M/NqS5W5SCCuo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MV3CjUDV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MV3CjUDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770242172; x=1801778172;
  h=date:from:to:cc:subject:message-id;
  bh=z1++nbv0fPHDYT5cJ2r3iMwfpzbR3Y7qCHL3PWRv9qY=;
  b=MV3CjUDVyP9TEy6MWVi5NEW7gBKAOLiI32a4AZ6BJCet6jGMtO6AUAfY
   PAufQIGEzPVx7RL+DxgWaqHkfFc3aa7Cqq68RS0kISuY7x8AAyXukvPfI
   s16LCf+ZjrtXBVMcmo21JHAK9/l/2Fdd7uqiA+MUr+Ll/HzIBbuEChGq7
   xvyZVYLNsiKc8Mt/uZ/T2ecNl+nPoR5IDreIkG5EGvjcwRqPMfUSfYJBR
   kXKO1kD5w+bviKSrVhslPUyfzcrvLzs+KN0a9/VdIR729Lw1XrRiMRHtm
   sL+AHdPtVBCU582q/nlngUKDgFRh/lIpX5MJf/8EKpd5Zb/SPhhxdTdjg
   g==;
X-CSE-ConnectionGUID: 3Hse5KiOS2+AJsAAsR9eoQ==
X-CSE-MsgGUID: ieDxWWT0SHqwKJ0vH/InwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82177368"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="82177368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:56:12 -0800
X-CSE-ConnectionGUID: xxLn++d4TyewK5pQgtMaSA==
X-CSE-MsgGUID: tVLr8xwWTieguA6opYo6oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="233222328"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2026 13:56:09 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnkr1-000000003pl-3LzB;
	Wed, 04 Feb 2026 21:56:07 +0000
Date: Wed, 04 Feb 2026 22:56:06 +0100
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 Flora Cui <flora.cui@amd.com>, Qiang Yu <Qiang.Yu@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>,
 Slava Grigorev <slava.grigorev@amd.com>
Subject: [agd5f:baseline0 1713/3826] versioncheck:
 ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
Message-ID: <202602042249.8eEPvf7X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: f88e839c5e3feac66406e9df054921cd63e8ceae [1713/3826] drm/amdkcl/dkms: add backport support for amdgpu
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602042249.8eEPvf7X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042249.8eEPvf7X-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
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
