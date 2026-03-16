Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4BB3382DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773691731; cv=none; b=cTk1SCxY7+EW9nOtMHiswNRg8VWv8CeffCcn4kNh0eChV9OsfkQ4QxQKjvHuhrOrIUNL62ff4kct9KNjz2qS+FqDd3bCufLuZuBFyPGrrZZGOJB5siRq1FbYup87lvrB9DygtQUF1J0ze7nP0yn/az4vEjVOIYpyV64wV0TKOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773691731; c=relaxed/simple;
	bh=FkfM2bTlk++P1iirI3DSQsgmVXubmEa/bNmYvaRZC04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fjCh3b77kvCD+Ctu0n+HZ4F/jpWkSjzDWnbNMug60VqAU/kZz3StS+kT64/3zANccgKuREQkEKbjuKQOKgvYJG12YnEkp/a10vnoepVN/53kGyek7n4dnoHmZE5TajefAgWH1sgQzmnDFfSpVGbnSMxc34LcBsjBdgdDZQAgBJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcU+yXmx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcU+yXmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773691729; x=1805227729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FkfM2bTlk++P1iirI3DSQsgmVXubmEa/bNmYvaRZC04=;
  b=EcU+yXmx+ot6+j2CBEydbIMltGAuplkA67cEW7//wGyvILZfSMFACJ/j
   rWZ/h9DTHREqWsVbjz7CrG2vtAF+yC2NkLBwMf5ep/CHKuu+CiGitS2kq
   45ZeT71xQRo2cdhVHP5ovDkYACGKnZkrDL7liC5UKIRCSPCFxRaGYQ5Ce
   HrG22cB/Pyp0E+7oGF0l+5BmU6ieqRBSnqlXNY8SAad7bmE/QctJJTJNt
   o/SnBi6lJIq7W60QRns3FpNtCzJN0Xdw7NzFB5wBmlE5VCtr4K01lkJvS
   yDVRHuM5TJLf2ct8+E3FIeGDddNBrNUY9cL1+P9TcjHg2EWuyvXX/xj4Z
   Q==;
X-CSE-ConnectionGUID: T3TKbJXwSS2xT4IipI+rUg==
X-CSE-MsgGUID: ykKEH6z/T7eb0GsDmdA9NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78320473"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78320473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 13:08:49 -0700
X-CSE-ConnectionGUID: JBIDssPFSLe9LlXom1qoAA==
X-CSE-MsgGUID: fJdOe8eoR8mJBfGGkror1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222237361"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 13:08:48 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2EF3-000000004Gz-2W9L;
	Mon, 16 Mar 2026 20:08:45 +0000
Date: Mon, 16 Mar 2026 21:08:06 +0100
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5900/6556] versioncheck:
 ./drivers/block/drbd/drbd_int.h: 20 linux/version.h not needed.
Message-ID: <202603162158.gzMpBUvE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95c541ddfb0815a0ea8477af778bb13bb075079a
commit: e3c93848e45ad0248dd8a98bffc59325556b6ecd [5900/6556] drbd: update headers for DRBD 9 multi-peer architecture
reproduce: (https://download.01.org/0day-ci/archive/20260316/202603162158.gzMpBUvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603162158.gzMpBUvE-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/block/drbd/drbd_int.h: 20 linux/version.h not needed.
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
