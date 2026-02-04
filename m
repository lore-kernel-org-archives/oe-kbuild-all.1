Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E3396B67
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770245113; cv=none; b=Vi9lWgQ4ar9u5wJWP0gcD9fWfmvu1k4CJWcAdMEx6+vQwmgZ/GYOzGjDqlKYD8egz9K87kleiH06OEOEC2Qaoj6pt8Ntw6v+vJEa3F6QbAuXQAnio2umBxho4Wga9Q65TVQ2Ef36ZYH7MWJzx4BGT/2uzk6hnX6xisR7HfMlZ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770245113; c=relaxed/simple;
	bh=r7e9i5210XdwBg56Pgo8n3kjas4gFz6YTiKHT+bKsXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HTiGiEhHpvUQLBW8VuPWa5tTm26YnQtJLGdHOXfazX3EBYNt/+f5Fe3uglqYQhUU6J9ahV1d1fezkbGA/92EsEl8YEi97Ala3vJtdNnt6NZACuGmdBSyB7mXd/SF6RqdVxV/6v08N2E5ZU9RM+Dw2wsZz7p/xq/32re6j113xKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fE5zGJTp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fE5zGJTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770245113; x=1801781113;
  h=date:from:to:cc:subject:message-id;
  bh=r7e9i5210XdwBg56Pgo8n3kjas4gFz6YTiKHT+bKsXE=;
  b=fE5zGJTpmV2/G5jOONTcQ5C35ab4NLfS8i7lyiSWH8bxM/xCyUhMIXTT
   h+a7AMlKVnUr80CRXXljGv4TbIlSPNilvnu7Twho1sgxmEHLQC4hjFAxG
   VRi5gaVB+Z4F/GNtLLSCIj1KoQN6BJ3vtr/9Kc10nPfxjWLpSmGCkYdje
   r7ZSdzRNek8044XoUgVDi2ejoWSTZlvhQQ6H4lMJ7nSozU1s3r94dUYZ5
   r1s6Ac1hkWz5ddA4arEWsfpGQkMzTYt+rDeR+LTHcTnOAG8oMRH3x9kSE
   Hm2q/MAC8SMC69MOFrJ0vo9MauYQGHFUaFk1R7cfe6ICaoSiw0jj+f7Z1
   w==;
X-CSE-ConnectionGUID: TTYXbNWVQPm3NNM69E9MxA==
X-CSE-MsgGUID: Ld40nT1VRayJH5U4OW3xYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82073382"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="82073382"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 14:45:12 -0800
X-CSE-ConnectionGUID: DXJ0Y6OATwWKBS4i2QWrIA==
X-CSE-MsgGUID: TSD+PkcjRmmP/N4gQ7FqrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209835165"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2026 14:45:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnlcS-000000003q5-0dnr;
	Wed, 04 Feb 2026 22:45:08 +0000
Date: Wed, 04 Feb 2026 23:44:21 +0100
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 Qiang Yu <Qiang.Yu@amd.com>, Flora Cui <flora.cui@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>
Subject: [agd5f:baseline0 1761/3826] versioncheck:
 ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
Message-ID: <202602042351.qMSfKA2t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: 743c9144ab99de90d255727834add2bd777dbb4e [1761/3826] drm/amdkcl/dkms: add lookpup unexported symbol support
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602042351.qMSfKA2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042351.qMSfKA2t-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
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
