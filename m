Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201C19CC28
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 22:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041005; cv=none; b=juAKmT9kuNQ/ONA6hOnGLjZLMmiMYZASF91mOI8v4TYwJem2yHmH0NQrfTeR73E86aQKylGiWXr1tTOj9/JQxytlGUsS/MtonExl0gNkshBKQvx1tVax9Ilm+x8wVo/ug7kd92r14aZx90GSfcKV6YZ3qaLJ/zb3UgEgrsGzBd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041005; c=relaxed/simple;
	bh=TCBqiEY5hTJyZA/lfrU8nTSYyXNjAnrk7iVc2868Y44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJ29rW0UxE9lIZKVLw8YuknSfYPD4U0R7YkCUHXR/3a1ZNPgsZTW7xEiam8BkxHkzMoSc3lvhEkEIUMdSDsBi0KKfi3ZKCAIKUUpmpm8o4SL/naG/lZi06eSYcelj52x5PTn5RQZf6Y79714jXC3WX6z2TSaIxxOzZMyp4UTCUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQ2lgMe2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQ2lgMe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748041003; x=1779577003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCBqiEY5hTJyZA/lfrU8nTSYyXNjAnrk7iVc2868Y44=;
  b=EQ2lgMe2L+/yUFBSGuEBNe8R89mV2HQVCtffnyH9DMEVAfEoHLJvgnqs
   Eo9vdCUCFAFnrQTAsITEenhAmYjj6Qn/ruG/O+otSpGGv9d/uVqKIBT3w
   1pHj9GV9Lh9HwSgAA/BUXjfuNxEXlrvutu8Sa5djXNMLVnGwPM24rVOAt
   Bra9swOVoDiyin8TxAzmuQOqrmQiXpaHb7DP3nB640bAiDipxuqTKP3yM
   AB6AlYIpZUL0HwTj9fiGYBsNkdUJxqGlTxQvoa4vGVe4rvVvEPPCE3A/B
   TlHX3QWLLOGs8QWLLjUspH/ZTlXZz11qL3cSZ3ma31Ho3ZNx9+z9B08Gg
   g==;
X-CSE-ConnectionGUID: Fzn9YxSmSP+OsgDTjJVagg==
X-CSE-MsgGUID: 8xKJWJIYR4yrlu4udyJ4yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67665000"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="67665000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 15:56:42 -0700
X-CSE-ConnectionGUID: horwYNjBQeuAZ7Pbw5sVKA==
X-CSE-MsgGUID: V7yeRqvnR6y3UkVLfMXxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="146496637"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 May 2025 15:56:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIbJe-000Qmq-2t;
	Fri, 23 May 2025 22:56:38 +0000
Date: Sat, 24 May 2025 06:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ajaykumar Hotchandani <ajaykumar.hotchandani@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Gerd Rausch <gerd.rausch@oracle.com>,
	Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>,
	William Kucharski <william.kucharski@oracle.com>
Subject: [jlayton:uek-localio 1131/2262] versioncheck:
 ./net/rds/rdma_transport.c: 42 linux/version.h not needed.
Message-ID: <202505240637.tcvedAYr-lkp@intel.com>
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
commit: b0128f3d2952cc4e4834681fe1d3129b73ee1924 [1131/2262] rds: disable APM support
reproduce: (https://download.01.org/0day-ci/archive/20250524/202505240637.tcvedAYr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240637.tcvedAYr-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./net/rds/af_rds.c: 39 linux/version.h not needed.
>> ./net/rds/rdma_transport.c: 42 linux/version.h not needed.
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
