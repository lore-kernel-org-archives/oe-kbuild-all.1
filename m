Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32F70809
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770250394; cv=none; b=mYPKRY0Dva5VcWZsy8epbnuI36pE/Lfv7uPWudCpsgik5hCZLbnTtvoOnLIAgNYK4NxeyKh5FqVeFdnrAaItdoj6B8JpxUERoVS9o3x6Yc0x3D+dJjJ+iF//F+FD1D0yd9mQ5typFjRtR1lVprj4KeQL7AhSb4eMzv5rbZp/bNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770250394; c=relaxed/simple;
	bh=/ZFgMsq26W9UZTKb4RaEXlsXaft8r1ZURaisjCatIiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q1FXzc/i3mFiRm2ZtbibuwJhgr0I9b0ehT/uXZYQ/p2nIB6S84TKdO/ytoQUcFKgdvzYFyd3cW4hyG5vmZWpzMm/f2JAo9kiqqEP91ABCo7ujChGYtkZzZRH3x1Z7V5ZtCwhZdoOCxRZfX8aMEkhvIDaiXMkgIw6zak7hZdVJlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSII0x+C; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSII0x+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770250394; x=1801786394;
  h=date:from:to:cc:subject:message-id;
  bh=/ZFgMsq26W9UZTKb4RaEXlsXaft8r1ZURaisjCatIiU=;
  b=JSII0x+CAyqWhP7PoEwyg412CfzZX6ZsA7Pfo9y5glflLNdWg1qLZumc
   oOJlp4h7LauQcMLoeJ2bV5FOwTE/ZmrRCm4EE6Nb5QS0ofJHZ6IMjztk3
   yhJuYSH7MTO3Eb/q4nf3c20dJbKlsbu1BvY92uotmZdXQ0Do9N5Iklof2
   z6VRMsHY6Q93f4ksyH9RRPrml2uhqHnblRyl/24WSV+ZvXgHFVkNDdf8k
   3tEGJNUMOQ4BMhgvvOcoxkMNRN+Kij95mp4I7e3VW2cYJUepseGeRSKgG
   +U404U/gA3VnJDveWymqHLT6o+oh8L3cUdcVm+2yFqLKcbzIyJ0Djs1QO
   w==;
X-CSE-ConnectionGUID: XxlpkGnLTySJsRChsxvwjA==
X-CSE-MsgGUID: oeD4BEQkTQO8IBwgVCaYcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96902135"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="96902135"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 16:13:13 -0800
X-CSE-ConnectionGUID: xI8kVdU+QKKs9GKPXJ9KZg==
X-CSE-MsgGUID: ol4wyp3AS5mAUGUOwZYZng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214842609"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2026 16:13:12 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnmzd-000000003rh-1sy7;
	Thu, 05 Feb 2026 00:13:09 +0000
Date: Thu, 05 Feb 2026 01:12:34 +0100
From: kernel test robot <lkp@intel.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 Flora Cui <flora.cui@amd.com>
Subject: [agd5f:baseline0 2050/3826] versioncheck:
 ./include/kcl/kcl_mn.h: 22: need linux/version.h
Message-ID: <202602050105.CxFG61YW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: 5475f4f011e27a7ff2398d240d941fac2368ed0d [2050/3826] drm/amdkcl: Work around mmu_notifier_put issue on RHEL 8.3
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050105.CxFG61YW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050105.CxFG61YW-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_mn.c: 2 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
>> ./include/kcl/kcl_mn.h: 22: need linux/version.h
   ./include/kcl/kcl_pci.h: 27 linux/version.h not needed.
   ./include/kcl/kcl_rcupdate.h: 6 linux/version.h not needed.
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
