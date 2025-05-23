Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034C20E313
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 23:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748042928; cv=none; b=KOg2KdK/Q1atAy8rBSm4fzcepm8S6emXQqkqLZksivCj5/cDHcsX2ysyLO6CSLQdrfIdIaFwXiUNDdLmm0yT8hFvfSnXXnhPo+aXZD5kW/7sVIZjQwIxoBqvcmXE5VAPyx8LCaHHYWWjcJsZwAX4Io6/liMdI121VW4X2nRda6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748042928; c=relaxed/simple;
	bh=M/3WcdxY9teh7A42yuyVKor/jLeiGGj38PlHMOzJxx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JMKN/KeJvGDpU//vtTBLbj6bBr9Ir6zmtHnewELfPmFtJLYUNssFFMeBZSZVFD98yceuiHlrBIBbNv4bLaoNSxx1mkgz2+FDsknBEmmJZ+bqgiplytjpyGVO2FWAPQIp6atrO5i0WQPqEVKT0uomeTtzI22AKOQZFn87txmVRuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MN95rESg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MN95rESg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748042926; x=1779578926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M/3WcdxY9teh7A42yuyVKor/jLeiGGj38PlHMOzJxx8=;
  b=MN95rESgFH7OM/7P4pKs9urGdrIBb2ELL07gIMBBLAM4A+yuZIRYdj5W
   TRe8QgLcmZlytRj+obBnypzMnorqHeTG0WP6x3Zrq0B8EMMqbQCigUT2e
   JbBC6fn1/K5xZ/8AQbqSo6ECg8/0wW7YS4byh2R13nowMgXDDVIzJgJlL
   9xGxj9fVI1KzqjT8xZlSCBqpezKC+wzVYgrNxJP4PZKlQ45LnuKpTZddC
   uo9CUjrCxpYkyle/AXz8Ssf0F6Xt66vi1Vy6xTgag01ODBRuIQ5MtiImy
   v1madisRYguKyVx0gCLvpfF8lz/zsDnI4bxujwX9NFFWAGK7Dc+uzlG3X
   g==;
X-CSE-ConnectionGUID: NTmvM/VdS7K7WY0ZfMtc/Q==
X-CSE-MsgGUID: D+7QlY1ZSlyRfyF6r03VtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49361628"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="49361628"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 16:28:45 -0700
X-CSE-ConnectionGUID: No78xEoURByiWD0EiP48FQ==
X-CSE-MsgGUID: EW5qkGmPRXGCsVG16pOO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="172298369"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 May 2025 16:28:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIbof-000Qnr-13;
	Fri, 23 May 2025 23:28:41 +0000
Date: Sat, 24 May 2025 07:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Gerd Rausch <gerd.rausch@oracle.com>,
	Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>,
	William Kucharski <william.kucharski@oracle.com>
Subject: [jlayton:uek-localio 1291/2262] versioncheck: ./net/rds/ib_cm.c: 36
 linux/version.h not needed.
Message-ID: <202505240740.13xM6WwP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 309f0f7d11406fdca3de1cfb3641cac12e830360 [1291/2262] RDS: IB: Drop unused and broken APM support
reproduce: (https://download.01.org/0day-ci/archive/20250524/202505240740.13xM6WwP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240740.13xM6WwP-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./net/rds/af_rds.c: 39 linux/version.h not needed.
>> ./net/rds/ib_cm.c: 36 linux/version.h not needed.
   ./net/rds/rdma_transport.c: 43 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 424: need linux/version.h
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
