Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135B36495F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 23:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781307557; cv=none; b=almkW0jBA34wVghoWpGY5MU0zYzJuHMGuRp/1Ucqfi99tv2+K5aCrSxz6PwG6uOlYXYfZI9wLiiH24j2MYR73sgiYBunTsg6aeOCfP+QbgDQWdfq5Fr9oVCWx1DALGdDBpiLOaPWHcKuYnJQOt3tSz5lioQ726yUujdQUYSkUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781307557; c=relaxed/simple;
	bh=V0oTTHWBi7FaVnHYzlDTbAfwu2XL0uZGVuLvRPqe3Sg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jjuL25LEjSfeV7QtaZp0e74eM1q2U4timokhoQ0SfpVeZQF29vEyNzSkGjU7wlN9muPbywd5/I7PgapQ+SHh+cze1B7X8rqcT3T93ld/wg6ApD6OlJqMRDX1SG/gMHZg+Ih3jL7MGgu9qHBD9SbFWkBfTYa9laV/ABfCnuHYokw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHcaBOAp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHcaBOAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781307555; x=1812843555;
  h=date:from:to:cc:subject:message-id;
  bh=V0oTTHWBi7FaVnHYzlDTbAfwu2XL0uZGVuLvRPqe3Sg=;
  b=PHcaBOApE9cOe6wtJqEoQThvcT/+HJjiAeOm4b+IkiYPpT2yfUrQG/hV
   WBO00KbzzTOsIKYatbV+hl8nGyolbfG1FjZFCLmXXewzEi3ZnztjHNlUz
   RRlVnR6tdVIQKypF5DgAtOry427J/KNRcklKzkhdIMGLopedEBl7ajR58
   FDgapFcxtzf9KKRnU2ij5dtm+vYWo5IFhSREGcz0fc10Ka3NZZsnn1XNj
   Pr64uNAhkhBbX6I5VQMhYIoBr705v4LPdP0PIzbB/FGNjDGFoxQ1G8hLZ
   8QZUoj/emi72UFJFjWgfsN7c07URociqA8yN18AXpTj4sjowNBIS4TPs/
   w==;
X-CSE-ConnectionGUID: 5N1UmIRHRayj0G2uXapi7Q==
X-CSE-MsgGUID: XNiPg7CFRu6z6o4HiD2N5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82151435"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82151435"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 16:39:15 -0700
X-CSE-ConnectionGUID: M948eo9YQ2Opl1d6iUlHWg==
X-CSE-MsgGUID: 2njp8Yk2SBCfLXyveRqFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="246041980"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 Jun 2026 16:39:13 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYBSx-000000004Mj-0Trw;
	Fri, 12 Jun 2026 23:39:11 +0000
Date: Sat, 13 Jun 2026 01:38:45 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 2/2] versioncheck:
 ./drivers/android/wonder/band_config.c: 5 linux/version.h not needed.
Message-ID: <202606130113.myA9SmBk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   a5b3e04521b3072f32c16d4814bfa653ed4d9ac5
commit: 8a7c7d3954c2839bb2f6ebe475648ec14b8a2c9f [2/2] ANDROID: Add Wonder driver to GKI
reproduce: (https://download.01.org/0day-ci/archive/20260613/202606130113.myA9SmBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130113.myA9SmBk-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/android/wonder/band_config.c: 5 linux/version.h not needed.
>> ./drivers/android/wonder/mac80211.c: 19 linux/version.h not needed.
>> ./drivers/android/wonder/main.c: 13 linux/version.h not needed.
   ./fs/incfs/integrity.c: 7 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
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
