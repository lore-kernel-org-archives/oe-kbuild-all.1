Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2423659FD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 22:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770244153; cv=none; b=pfZrYMqSySPyU+KW+vtfkrK0UCKd9/+eN9b5WWU60IRWBZ+oPFCMXg3o5/YZGwIbCq8wB2pP3X1fYJUAKDIu9vbV3t+nIDsuAFn1HrPjkyW92wXfT1X5qJA/4XKoN0v3/y13zkwhIZGEEJma3V6LaWjyWvAibEjs8yHK+JNvQSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770244153; c=relaxed/simple;
	bh=ChMe5WLKEK7hGwqthixa0sX9EY8tGCah+CaiZMs8CLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AbLMYkb9mKvg61kjJHOmsWjIiKN+gj6ht4En5iSLWWix4gtCr1mlav/8PM5J6/ov0Hhqam9fcW5WgnHYy2owKpHNYY9xBVPILPK0mhi1pEZhPeqXOCDOHzvB6XVdAPufiCda/rJvMqJgoAhi0MAXt8xxTu1+yCAywodZ+C96BQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCo7hFfv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCo7hFfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770244153; x=1801780153;
  h=date:from:to:cc:subject:message-id;
  bh=ChMe5WLKEK7hGwqthixa0sX9EY8tGCah+CaiZMs8CLg=;
  b=SCo7hFfv1uZUP2Cf1cs2Z64XSvoo+Z1lqHf/Eu24H6agRsfe2tHEN+Dh
   e2nnL/kNiH+yu2q3kLrEaWa60rwNmPdxcSTe1DGhj0o2c7e1S+3Od6Kyf
   Ha3HYNBojhC6ZWgfnbfW2IlSYnj9eVthc3spJmOPO9HwnqOKiKOO89deW
   UIQpU0hpTK/qN0E77L5CSKuYN3EinerIlAnsYKtEq62HaP9etUCgcjwmU
   rMFVtTfBLaW6mqtNB8Nf8/fTnjQKs3o9M5Rnm6GxL38pywbxRBasntE3/
   +jFD6l57N3fEe4Ap1jayhaZeKOXZ/WRx5ZyjljpUAAqKHnW4qbaokchxG
   w==;
X-CSE-ConnectionGUID: f8Y3YJ2HQg6+D/nWxSjbwg==
X-CSE-MsgGUID: JxVCAKxoS3CDcXtQTbv0Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75293617"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="75293617"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 14:29:12 -0800
X-CSE-ConnectionGUID: 4ZmMQl+UQICCh8sn+IO3Sg==
X-CSE-MsgGUID: uyfH9tAVRIy8Mc45zuThwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209663911"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2026 14:29:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnlMy-000000003q1-0DBl;
	Wed, 04 Feb 2026 22:29:08 +0000
Date: Wed, 04 Feb 2026 23:28:33 +0100
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 Qiang Yu <Qiang.Yu@amd.com>, Flora Cui <flora.cui@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>,
 Slava Grigorev <slava.grigorev@amd.com>
Subject: [agd5f:baseline0 1715/3826] versioncheck:
 ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
Message-ID: <202602042303.k2jIHxed-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: 3945b6bb9c71cda95b436c13df836b7223610b9e [1715/3826] drm/amdkcl/dkms: add backport support for ttm
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602042303.k2jIHxed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042303.k2jIHxed-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
>> ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
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
