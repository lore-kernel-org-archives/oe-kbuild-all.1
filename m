Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A3028E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 00:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758154829; cv=none; b=bMm+EN0irJldxPILLpWMu0yALb8i1L3l9hpUmFywwSfNhiyWnNMCKtsF+kbGRA8sWsQW91XsmWPlygF75/++NtAP1OpJeqoWC+r/nyMg7yvDBODZMEokXfC3hxS8NJCHBCxdk/f3xFPyYgLqFxTIQ2GLxoupQ36J+llTBmhB5oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758154829; c=relaxed/simple;
	bh=I+e++nAhKEB8UpV0KTbs/E354HrN76I3h5au2KisFqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GO388A1Z42qnU4W03yp2ZmDvSU2VsOm/JD4qBE+u2RJQY8WlBrsLFfWdWhRWrjlbddooe6LK4LXyRzbPUEqLsv+szTEQ9hSmqenZDN1dUajy43TJ0sR5ZB8M5QKsbukipIWDiYqzj8/KZipbCLEicOXENi3fQ+pZ5YGJ7VeMSz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVpOXCda; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVpOXCda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758154828; x=1789690828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+e++nAhKEB8UpV0KTbs/E354HrN76I3h5au2KisFqA=;
  b=QVpOXCda2kqmCCek+CcnvYkRpWvouyv+XhYug7NqUvCwALUUzQowUZ3r
   QwSnVMWm/OOmg3+GI2XEs4uW+wFTwTtqmCVvCKw/WCZNKKaILwMOdMP8H
   8IvMWnxAxUdpUyXzKKnktIssHqodlYuTc67liUyQWrx9RptwN1/Ke2RNn
   +vZxQ+ocOxDUFa/PgK0RYfjFumdcW3QEbnfmXaXDHN06t96zMK4Gca4VB
   7cHWk2oCe+eIoEgGsuppe2rNwera2RyOAnxYLcBIF6XgnTtilhMhkQXi0
   CJ5goue2JtJOJ9jiCvXKrb2o/i0fgbkO56l/8j25bSy4/alZnBSiiBPVD
   A==;
X-CSE-ConnectionGUID: HJU0t1diRk28iZHPley6RA==
X-CSE-MsgGUID: yIiyaHDWS7SS82LWLGRpSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="77913577"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="77913577"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 17:20:26 -0700
X-CSE-ConnectionGUID: TF8sFwbQRgeb7+2yvt5kZg==
X-CSE-MsgGUID: yBp0QJXKSzODLIxdmQ7IcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="174956656"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 17 Sep 2025 17:20:25 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uz2Nr-0000000035m-2w5z;
	Thu, 18 Sep 2025 00:20:23 +0000
Date: Thu, 18 Sep 2025 02:20:08 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 407/416] versioncheck:
 ./fs/bcachefs/fs-io-buffered.c: 1173: need linux/version.h
Message-ID: <202509180255.BhUaCZp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   fc7a301b79b2c25c715d63494e83e1795da69b1d
commit: ff14f7886ed9adc133777d5cdba1e3101856f29a [407/416] bcachefs: compat code for pre 6.17
reproduce: (https://download.01.org/0day-ci/archive/20250918/202509180255.BhUaCZp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180255.BhUaCZp9-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
>> ./fs/bcachefs/fs-io-buffered.c: 1173: need linux/version.h
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
