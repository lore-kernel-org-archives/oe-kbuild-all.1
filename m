Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF19157A48
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 04:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749875583; cv=none; b=RvWqtAm/9at3XDk33+AuEKb/a80l2yrayoCvw2lJ7twW1UnM0O0VGNjUXPWBqVTF2K9uPqKJh34TpyY1+vmPpVL+T/ZksYDNz+qspnoNLbZuGTiMRLxANqivHY9qIS36rWP1/jK7i/i+1Wi0Jfw/jaJG2pYgRogPMlT2WmdSpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749875583; c=relaxed/simple;
	bh=vwsq3/3attHCXbv6niOEGkermlxYFaF0BGBDecu2QEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ytu3CbbkdohSZ/G6xElL66asaomPT7lKSOs7pFJJ3p4iO+dziuxIeDsdOaVmQGyIxlQuOCVPsvpeKlOF7BCV3wSs/RIQ2MSjAm9MABtEb+8dTLelFaN07jP6SoUz8FtkuX/CZkVJkb1PR7rW0XWLb/+H3WbVabvHgzvQG1kR0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcTl2W5c; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcTl2W5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749875582; x=1781411582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vwsq3/3attHCXbv6niOEGkermlxYFaF0BGBDecu2QEU=;
  b=WcTl2W5cmqToN6tNkcrgEFsNrUAkKpoRfbbN1VggmeuViW5k+G4NO6XX
   MhGomONjl2+tWVtUhBKTsaVxvgJJpukU16z9DpF0vBJWs/KxfDwxdcmkr
   BMd0Tz1/VI0QFFPmH89GMPK+hCSWYJQTG+WQ/qvWYwzS7nTdNe1f7CBii
   8looHRULZkoNq6Eoam2crAuvosEEvmApH/Esj/b+nXLHQE75uc6bJGqew
   dlCVtOuS3zoZsWan/E3XolkO+j6HJpmx/JtY/RbXYIwm4zoGb0HhkH4p1
   oVXCgrBCMDLXjhWgnFj70x9zLfYh1VsmAbSxjOqNfyuGvFpijF/sgHzST
   w==;
X-CSE-ConnectionGUID: uxg+vuBGQOiM1bcj39dGEw==
X-CSE-MsgGUID: ZgKAkH1TSaqoWQjmoRB0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51971366"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="51971366"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 21:33:00 -0700
X-CSE-ConnectionGUID: +J4LUyo2RZWaPQIxjYSSAA==
X-CSE-MsgGUID: ws2uig6iQXC6Mvzt9G3Ivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="147984438"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jun 2025 21:32:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQIZc-000DIS-2d;
	Sat, 14 Jun 2025 04:32:56 +0000
Date: Sat, 14 Jun 2025 12:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: hepengpx <pengpengx.he@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>
Subject: [intel-lts:6.12/linux 7/7] versioncheck:
 ./drivers/media/pci/intel/ipu6/ipu6-trace.c: 4 linux/version.h not needed.
Message-ID: <202506141202.zGtJ1Lsq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   9cb5af739bf84341d10fe810e745d9bb89bf98ff
commit: 5fb63a29ee76aefaaa3fd84f4a2ab9cd7813a53f [7/7] Support IPU6 ISYS FW trace dump for upstream driver
reproduce: (https://download.01.org/0day-ci/archive/20250614/202506141202.zGtJ1Lsq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141202.zGtJ1Lsq-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/pci/intel/ipu6/ipu6-trace.c: 4 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu-fw-psys.c: 8 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu-psys.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c: 4 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu6-psys.c: 12 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 423: need linux/version.h
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
