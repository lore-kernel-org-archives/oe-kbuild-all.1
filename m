Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233F8295DBD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295531; cv=none; b=CsPJLwUdDnvkxeGouSA6LlRJvcGKe8BPEVj7wtDQz/Gf7CuEeLuHFzGHLdL9DIwdZjpNUjlNXytPQYB+FUxgD2zA37w64BITlnEp7KxBWW+E35OLA4q5IJyGge4MYHf/7PeIVw7NBC/3ftIc4y/oKDiw4OQeDJ/96pdqWoWvFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295531; c=relaxed/simple;
	bh=lui2Nv/pC7EFY7FVaOYMPcdBazDSEkZ+hETDrBhdemE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPscNX/BFlMYwcC915Bdpvm8hDum/sjcvX62OvU//L8ouOzHTfsNq5L/e+pWysP7RdJXLzdJ4D+PzAvhqmxUbedPKUHKk2mqniSR0R29zPzI0QIwawr8jE8gemzxpJI48MFb3yEnZiNHoV+oBQX0AG4SbHOIv/xEWyBf2Xtn6lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lF4/x5gK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lF4/x5gK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765295530; x=1796831530;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lui2Nv/pC7EFY7FVaOYMPcdBazDSEkZ+hETDrBhdemE=;
  b=lF4/x5gK6m79BFAE94yAS2/4FksOoW9QGydgjpPsaQ/st/Gbk757m9Pt
   Qny1u1c4/UgvQPO/q/Jwk08GaMvyjffxhGXK1/G8Bq9N4EtBPSBMfnAY+
   80SrAqxSjZTR/ewwXVsEpe9HLptsIfxSmcKHFSABmR/Yp1yMOCWr6BXnS
   K+VvMwGejN5sTfwunP+bV12cmmGGUU5wWn70roPNZv8nAw2oN/w4n5nV3
   tbGE32U1faVjbWIJYa8+iv90NnlH3OK3wclIaEl6H3GlHANQLHio5MZ/7
   aDf9790cKc9YBSivwMr6m+f3R4OfpQAC06mauAUoh4iGcl5AVnHYrIA2o
   w==;
X-CSE-ConnectionGUID: 3+Xlu6a4QE2c1M/RCWqhBg==
X-CSE-MsgGUID: xytUYUHPR9iTYQjQZ0T/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67139910"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67139910"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 07:52:10 -0800
X-CSE-ConnectionGUID: Ot+iSgYZRmWOANL9RGqjSw==
X-CSE-MsgGUID: r9hmk5suRLaLo8UREDy6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="201361800"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Dec 2025 07:52:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT00U-000000000J3-1DH5;
	Tue, 09 Dec 2025 15:52:06 +0000
Date: Tue, 9 Dec 2025 16:51:57 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Shahidan, Muhammad Shahmil" <muhammad.shahmil.shahidan@intel.com>
Subject: [intel-lts:6.12/linux 15/17] versioncheck:
 ./drivers/media/i2c/max9x/serdes.h: 36 linux/version.h not needed.
Message-ID: <202512091627.N3EXhTRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   8d6e2982505df9271bf3788bba96cc37ae1e5aeb
commit: f076768f1cab44b9a93f1e81c1c6aef715d335ce [15/17] media: i2c: add support for isx031 + max9296
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091627.N3EXhTRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091627.N3EXhTRP-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/i2c/max9x/serdes.h: 36 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/ipu6-trace.c: 4 linux/version.h not needed.
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
