Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7B8472
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 04:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791001519; cv=none; b=gTAVkrjNdTqn+3Bk9e0wW4G6EW6JmgFy9qXxQ5LejF4B/8umh7CdXMYKGpN20zmwKtPk3o1ajkf/ho+8W642afE3CReTFfat8c+1ZpyOfrs/hMUifV3ocJ7V0vZL5RDVP6PVSfJS4XM+ucDiKha7aVO8gkxgTLhbVCltB5YMmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791001519; c=relaxed/simple;
	bh=+gLNNjsQojQQGaZUpGj8mJ9GloFG2Mk7Sve7yrVidPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=erWkfAuzUiME9vyYh9xUiCbhbYJpO5Wiv8E/bAh1iRr2P4FK6puzT4CrBQSub7JxV1gHa3lcEdacrnSXb8rDhQrPxbeuGA3O2pIUF+P7mJX8fLYLB4ClO1NXm+Bs8YbiQ2ca42gBerfewSIahy3GsX8ByhSThjkoiKYuQHIcOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiNydYOB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiNydYOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791001518; x=1822537518;
  h=date:from:to:cc:subject:message-id;
  bh=+gLNNjsQojQQGaZUpGj8mJ9GloFG2Mk7Sve7yrVidPM=;
  b=QiNydYOBcYB/2uecxlbb1lmOa95Cr23wjxJqQrF20qO80AtlV7IV8gJz
   pgZN4x0G7aP7e8pcKym8KL46PDyKS0BJ6e4T7we31yI5GGQVzpvoJ4ioM
   SepwzS6uCsQJj8hL/HhmbcBcWcIwHGwxH4gq95sr1RfIAVpzP/V2dAXrT
   Q/9iqL8ePdEf01YmjYfocxpYs0n75UkLOWOkasSSj5VjefLDi7WZW5+D+
   4EiR+1VJFUVcZejUW9zgIBB0KgnmdnoAk5PXr7N+bgoWIwvtlEsz6jl5t
   PPpPZWrY0t/iiQSW24tT2Lv3fi1KMzth/XI27/P6YaIrJWcHvJD5Gi8qu
   A==;
X-CSE-ConnectionGUID: qsIABKpJSEi2PShvuzkIWw==
X-CSE-MsgGUID: vusVs5TtTQmlkWFITQP3xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102436690"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="102436690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 21:25:17 -0700
X-CSE-ConnectionGUID: /XQyLDPKQc+X2Olu5OtS4Q==
X-CSE-MsgGUID: hwoU4J3hRmC/WSSn3WRFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275504476"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 02 Oct 2026 21:25:16 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCrJA-000000000wJ-3N9Q;
	Sat, 03 Oct 2026 04:25:12 +0000
Date: Sat, 03 Oct 2026 06:24:28 +0200
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: versioncheck: ./drivers/clk/berlin/sl-sysmgr-clk.c: 15
 linux/version.h not needed.
Message-ID: <202610030614.sI8ieLQK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dt-bindings-serial-snps-dw-apb-uart-Add-Synaptics-sl261x-uart/20260929-141358
head:   66f26b6f0baa133e1c8c3a8afb0ef81b5001f027
commit: 03cf77522edc07004a0c25816d9f56083b2049e7 clk: berlin: add Synaptics SL261X SoC clocks and plls
date:   4 days ago
reproduce: (https://download.01.org/0day-ci/archive/20261003/202610030614.sI8ieLQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610030614.sI8ieLQK-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/clk/berlin/sl-sysmgr-clk.c: 15 linux/version.h not needed.
   ./drivers/net/wireless/morsemicro/mm81x/core.h: 14 linux/version.h not needed.
   ./drivers/net/wireless/morsemicro/mm81x/mmrc.h: 9 linux/version.h not needed.
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
