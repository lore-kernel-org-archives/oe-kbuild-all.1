Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199B1FECCD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 01:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778118691; cv=none; b=BzvwXYe0hziRi5QWIKm7a+KFOzqR5NyCBYRvcEscKVBoBlq8ealmiulSgwihNQuQOiQKOBBw6VVW90P7gjkeKYF22HV/roKLSvp1Zv3nwsHLBJmIpLKtKfd9fDL7YPIe3UTi2hvXFcCCWa6foRqVTJkQ1T0evp0LfIsNN9P5IZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778118691; c=relaxed/simple;
	bh=jPMfcedM5VAlkpjmnVdscXd7Thmm5KFvBtq8pdG2Ptc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XDbDNzaaCURY8Bh5pMacUXle6O6CHItf3vHF6NhHg5+e+RPZaBIdA6eQ6OzMQ4RI2/rZnRv1p7bDFn1wRxQixKWVUjpOX2NQqXunJ5G9uWHTZJpLMOLTbHxiiAq9rJhE+ScVL8rWh7fe0hvnfpjX0p7IR92rETNmAmCo13vlVeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8kjojZ1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8kjojZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778118690; x=1809654690;
  h=date:from:to:cc:subject:message-id;
  bh=jPMfcedM5VAlkpjmnVdscXd7Thmm5KFvBtq8pdG2Ptc=;
  b=n8kjojZ1svnABojP6Upb2dZV2psPIMhEvtjToLvNxQSmwlP4ZlGX23n2
   HNCx48Ly5lCEMpj0KzcTkyMZwhoqPtnE9aUtyR5I1DMmRGwsGPPUGZCYh
   D8b7Vno9q2o85sWenpwtpusd5+WPd0roVb4kvyCtGadp1hy8NGl/DlHRz
   FY1FXArz2ZcJw3fCvav+raOS4v/lgJMaiRVqNwnr8EZ7Ge80k4Fkq/21Y
   arbgNb6YYFJGh7J163CXzlVArIYNLVtr1w37eamrxsY6mjFLH55e1ZiH/
   9Q1nyqM7rSs8kA9pOhcnKukL9mXrVy9PIguOGUsmwGEEiVS9piZuF0K8z
   Q==;
X-CSE-ConnectionGUID: DPio0b1rQsqPnuu9l8ciuQ==
X-CSE-MsgGUID: LKwYgiNXTDetGAgF89yPrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78779698"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="78779698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 18:51:30 -0700
X-CSE-ConnectionGUID: kDPP5t1NSEeGv9ZDyMVPSw==
X-CSE-MsgGUID: G9eQfDphT/2fvCk5s5cMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="233228985"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2026 18:51:28 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKntd-000000006if-43jp;
	Thu, 07 May 2026 01:51:25 +0000
Date: Thu, 07 May 2026 03:51:00 +0200
From: kernel test robot <lkp@intel.com>
To: Fred Treven <fred.treven@cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cirruslogic-drivers:v6.6-cs40l26 1/692] versioncheck:
 ./include/linux/mfd/cs40l26.h: 20 linux/version.h not needed.
Message-ID: <202605070356.I2kuPFLj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/CirrusLogic/linux-drivers v6.6-cs40l26
head:   84ca316a865bab2c19979e99946fb1cd99ddfb71
commit: 976c83d52ac8d2b9677efaee3d38a752529de382 [1/692] input: cs40l26: Initial Commit for CS40L26
reproduce: (https://download.01.org/0day-ci/archive/20260507/202605070356.I2kuPFLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070356.I2kuPFLj-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./include/linux/mfd/cs40l26.h: 20 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
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
