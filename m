Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532791367
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714727247; cv=none; b=V2d5XGutL0cI/Gb9LdAZOooHXteCD30Ulcr0yo2acwFatbkUQlDaJz7qs/79+M4LJCtT6Ko9nLqZQIZAurotQFgADkZNuFWsjkyN8+VvYpSEUL956k+fsvi5gY7PHrg4pQ+3G+4xwVr8Qq9xfKNIyZImHO39/NvGjjP+M5CS5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714727247; c=relaxed/simple;
	bh=3/Mz5/aJElR6HIGCz7gJIWPV/v2s3RRUS2yqkKdZ16Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QllBwj/HL7OcT0QOX4t3S92YULTfV0TkJsOLnpMDLdsj0TXEC9mxgNdtPUb1MPjGx4IL2W45odO0MdnhouijjgYO/RzdrcQPBQKu9nNmQ19tHnFsJaKNC0mNj4HR11ihWpwuDypAybemaDBj6t8XgGTdaTz2MM6rj+CIqfbmuI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJqGm1lz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJqGm1lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714727245; x=1746263245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/Mz5/aJElR6HIGCz7gJIWPV/v2s3RRUS2yqkKdZ16Q=;
  b=LJqGm1lzK5RqOImnSbzkq75OibW0Kc2xpg7WUE0qfRQp1951cgT0lR7N
   2O6ceb0Dz9AqMtylrk/nnb5SU5XjUkK74L5BVBJUR4z4b0b7mqzMDP1h2
   1zF1RFUgr2hPusL1cAZMQcUgZuCE5wm0MpZnEwJLPdwENaZjerA7/Zu/B
   bfB9Gk5wfFQRute2m9rxBQZvJ9LfIj8gPQciRvKfWmnj25GuDWrihhHfL
   N0pUywBNZyjHnE9iQI8xgCK7KnI+wSrU6/7Lh8G36Yue6z4ovt2dbx+GI
   fzQqa9decrYMHf2wGvDIZWlC1IGBUY9bAAiObTcec3UPWlWXC1TPsvjm+
   w==;
X-CSE-ConnectionGUID: j92lwwiET82vrnfFmFQ4nw==
X-CSE-MsgGUID: UwKCO2edS8izfKKH2KykHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10749443"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10749443"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 02:07:24 -0700
X-CSE-ConnectionGUID: PHD8bDejQ/OxTy2ELUDVug==
X-CSE-MsgGUID: 3z4V8XoYReq1seKOdv13wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="58299780"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2024 02:07:24 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2osz-000BWm-0W;
	Fri, 03 May 2024 09:07:21 +0000
Date: Fri, 3 May 2024 17:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1024/1143] versioncheck:
 ./drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h: 63
 linux/version.h not needed.
Message-ID: <202405031714.3pYZTld9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: cbd62701a0dc62129ef2fa57a6cd6b736cf54aed [1024/1143] drivers: hw_random: add DWC NIST TRNG driver
reproduce: (https://download.01.org/0day-ci/archive/20240503/202405031714.3pYZTld9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031714.3pYZTld9-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.76.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h: 63 linux/version.h not needed.
   ./drivers/soc/aspeed/aspeed-host-bmc-dev.c: 5 linux/version.h not needed.
   ./drivers/soc/aspeed/rvas/video_main.c: 15 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 410: need linux/version.h
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
