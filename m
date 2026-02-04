Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716F2772D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 23:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770246920; cv=none; b=pd0j69lLz/L0i5YtVTaS3Px82iL2CDGLxkm1TAQ9aPpo/xXaJxD1clKK9IBDx62BmVjVP/GJMtSjqgoDbkkRcZ/TvAA3ZkRbr384n1fUkI3Qbtbm9OEl3prFcx8cBvZhrtN18O/6pvongERejYiKcHWiUjqukJVGTR7AGNNoyiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770246920; c=relaxed/simple;
	bh=j8BgoxPgsROjmMWoLnl1NFM2Afyr+Io119eLM+/vyaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnBSZvyixPHhqW4s+RTDXrscyKUGlfxPhXClWVma/0u2fic1ltR6Mel7Co/8f7vgknSTJijQH9k5Jo/i9JS7KpFrI+fZZ+r5AZifeJ6RurRL6Oa6ZWxVfNN4buoycTzJeFPz0Ea/Khdx2q5g+S3f91dCZyqp8dRXyY4qtlGYRYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7qfhp37; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7qfhp37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770246919; x=1801782919;
  h=date:from:to:cc:subject:message-id;
  bh=j8BgoxPgsROjmMWoLnl1NFM2Afyr+Io119eLM+/vyaU=;
  b=A7qfhp37j78yVsW8q5NvaNCfuSDkqOxcbysSNqIVnZ3kohfMiIn4IQA1
   JNJLjRnUM8FwXwaUUgXr/O/Z+s3bOI2hsv09JNH3C1KGtOQgXXdwepyPv
   xLIBATBwac8vO58Izu5+XOeKrEX8vCKXqRPimTEIf0Itr46nML8X50h04
   wE9VmSW1ZHCjOAIVs8DeTkIiCdf9TN48gl1jWbbCSrH2WeBzyx55cDLx6
   kEMFUkdq0RV4zgcFK8xbrDw8NNj18sropPaZr6zGu9fdgNZNfZVwuV/sr
   A22CjJnVQGW/+O6+EWnQrRpYFblY3jPEKNM6KAmq3CBmGn1puU9I9RGOy
   w==;
X-CSE-ConnectionGUID: wTrSMRbbT6ul8RbB7DBYmw==
X-CSE-MsgGUID: mWyE5M76RnSq+7NS70LSsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82181740"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="82181740"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 15:15:13 -0800
X-CSE-ConnectionGUID: 0b907HlPR5Odz1EJirK9xQ==
X-CSE-MsgGUID: hlHs2vwzTzK866No0mMtlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214799755"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2026 15:15:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnm5U-000000003qr-3MEa;
	Wed, 04 Feb 2026 23:15:08 +0000
Date: Thu, 05 Feb 2026 00:15:02 +0100
From: kernel test robot <lkp@intel.com>
To: tianci yin <tianci.yin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 Slava Grigorev <slava.grigorev@amd.com>,
 Kevin Wang <Kevin1.Wang@amd.com>, Jack Gui <Jack.Gui@amd.com>,
 changzhu <Changfeng.Zhu@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>,
 Flora Cui <flora.cui@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [agd5f:baseline0 1785/3826] versioncheck:
 ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
Message-ID: <202602050032.6IKBya2T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: bb65300bcc409aeb6c4b0f5a53c378bd7cb5854d [1785/3826] drm/amdkcl: Test whether pcie_get_{speed/width}_cap() are available
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050032.6IKBya2T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050032.6IKBya2T-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
>> ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./include/kcl/backport/kcl_pci_backport.h: 6 linux/version.h not needed.
>> ./include/kcl/kcl_pci.h: 27 linux/version.h not needed.
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
