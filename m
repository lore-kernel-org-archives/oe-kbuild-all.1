Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DAF3358C4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 23:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770249495; cv=none; b=P+doGvq7VSj7B5GR8PgwLZFUetZzIMOqansj4jIr7HWs71N3QSUFV4FWQqwx1k1ZaePiIyM2WEEt8hy3uF0V28tdVTTqwpM48DixorlzE2Z/MUurdHFNZKFa+zJSVhhX+LDkQejNkd2YwCnVNg7YiAy2ngqytUQruDzcqjTvojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770249495; c=relaxed/simple;
	bh=4rV6sl3uvMPz+jG7cx2XA+/qM03d8EpOOyojN0Za99Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oTiT4gPd+3cp6hA59SdE5lu8iygkhzWiJCiAb3x5Y5mQvOm2mJ+arztqwOcpNGUw2fUlqdEFBkkGvDLwpWAon+JDb9/Wz/I07GvzFUD92mRaTXnkmGXMwirXVJYHW8NLsd7sJuuG4qrnlM6qOsMzdXhst8W+V4eFlJCHXT7qUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQJt6703; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQJt6703"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770249495; x=1801785495;
  h=date:from:to:cc:subject:message-id;
  bh=4rV6sl3uvMPz+jG7cx2XA+/qM03d8EpOOyojN0Za99Y=;
  b=DQJt6703sYys0ug65VqcHuC6N7BV0DdXlqbh5fQsez1XEyH/XK5OSyhx
   enxZuL45fqwswewOonUpYi2mfgRcqxVcnzLvFiN69W1c2nTHrr3ZWolBF
   gSkLosloqHVaKAUBwYajjTj8eXAUZXI8C9e+1iAffQXLKD2AkMlWo2yt/
   VrDwIHsIUH0re3swerUBbGrp7YnSdZTzIQHUjoXTqAYkbroWxs/yLB4gt
   eQsbXRTWHAHGZvB2mqhT+EuCICf4h11g+7rraN286fKJnnAZ/hGMoF8Pg
   kjpcCXDpcCkaHggK14v9PAkidxu4oXJS7vk19snYk5dJKn3Mjj6mwjB6E
   Q==;
X-CSE-ConnectionGUID: dAiOt9zJTVyTM1MRcGCmxw==
X-CSE-MsgGUID: wFttisRpSAm/hCZCJFJfmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71503679"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71503679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 15:58:14 -0800
X-CSE-ConnectionGUID: eevDzAzdR6GhOe5rBHmocA==
X-CSE-MsgGUID: MvVh0XCUTxuD+OE10xL8fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="247912588"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Feb 2026 15:58:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnml7-000000003rN-0w1P;
	Wed, 04 Feb 2026 23:58:09 +0000
Date: Thu, 05 Feb 2026 00:57:56 +0100
From: kernel test robot <lkp@intel.com>
To: "Le.Ma" <Le.Ma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 Junwei Zhang <Jerry.Zhang@amd.com>, Jack Gui <Jack.Gui@amd.com>,
 Flora Cui <flora.cui@amd.com>
Subject: [agd5f:baseline0 1859/3826] versioncheck:
 ./include/kcl/kcl_rcupdate.h: 6 linux/version.h not needed.
Message-ID: <202602050032.E8Eck6df-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: 4259e18325ef746c010bc70fd9d4e5289f24fc4e [1859/3826] drm/amdkcl: check whether rcu_pointer_handoff is available
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050032.E8Eck6df-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050032.E8Eck6df-lkp@intel.com/

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
   ./include/kcl/backport/kcl_pci_backport.h: 6 linux/version.h not needed.
   ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
   ./include/kcl/kcl_pci.h: 27 linux/version.h not needed.
>> ./include/kcl/kcl_rcupdate.h: 6 linux/version.h not needed.
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
