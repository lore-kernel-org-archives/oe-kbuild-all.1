Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37745132103
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736175372; cv=none; b=kPUwZKIM0DLFRz9epoDPJBByJr9QK7Zkm2A3xiYBBeJulQnUR5y81L4iPdRmZVM6+a+rNNrRZ3nWODqXcmdMj+wzQXkGFVXqVr4SCNXLcDYMb3bPzNpLt3WPJZan0xZ+xBjrjKyde57LCnTY4BBa2aPD7N3uzEfvLs3zRl0eds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736175372; c=relaxed/simple;
	bh=VNuR3HQYIbJCC6OCvL+Z60dCuxOINNandwMh4ql2g2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQtdsSSrw1x3tynIGtQ5g4Pbz7zUdB14wlOXb8LK5fGPlNYtNqnso9PGZuKZkTGjrWPGruUHgE3k+7LvY0qwvzJlb9E+rMH+XTOB3MOt4g4IwDGnmpbOZj4S9DoWhA3541+F/xgFF3YGH7aLOOvPZ7yqPjYOwPqIcyDhKJGWjL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZXBeKs6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZXBeKs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736175370; x=1767711370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNuR3HQYIbJCC6OCvL+Z60dCuxOINNandwMh4ql2g2A=;
  b=NZXBeKs6OC4jACp+GHTzhbZev9BS807Fq0qC8Q7XDWocUOXbRykow4pt
   eFuFFYKabUesxsrGjN/wK98VRboND9WjpZQcWGAgC2x66Xr7uVC9/bMpU
   k4oSefKHcW20QLo7/LyVsTbVXHmBtJG/r00v/oHFYaJRv7aCx13MIwHDZ
   GU1Y8JBR/dMMWLqc9Fa6KzNDFixAtaxxrSbbeZ96TIlx4dpkAUBHPTV5j
   oIkEz1F/z1uHG3gc0Sk4R3BXLnlljaR2G6ZudwG//AFldm+dIV0hpIXyb
   igb4Fsm2DSG+KECCXO6LG50Yx0qpMlv2AVGoq78wX3tVtCCBqaYMXFits
   w==;
X-CSE-ConnectionGUID: lFb6ssaoRDyvmGvQ1DBjiA==
X-CSE-MsgGUID: s8KrnIuqTJ+9/7JebD6B0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61699506"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="61699506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 06:56:10 -0800
X-CSE-ConnectionGUID: PyEWqOS6T3a+kW5gvqv2cg==
X-CSE-MsgGUID: XuvOBV9qQLu2Yq97MLsFsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="102979566"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2025 06:56:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUoWU-000CiT-1s;
	Mon, 06 Jan 2025 14:56:06 +0000
Date: Mon, 6 Jan 2025 22:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 5523/25291] versioncheck:
 ./drivers/bytedance/hot_inspector.c: 15 linux/version.h not needed.
Message-ID: <202501062213.rElzLU3p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 772ec35e2f3b33daec69bd3f5f6fdd8b7d9b365b [5523/25291] bytedance: driver: hot_inspector: Add IDC workload hot component inspector driver
reproduce: (https://download.01.org/0day-ci/archive/20250106/202501062213.rElzLU3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062213.rElzLU3p-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./drivers/bytedance/hookbind/hookbind_char.c: 1 linux/version.h not needed.
   ./drivers/bytedance/hookbind/hookbind_sys.c: 1 linux/version.h not needed.
>> ./drivers/bytedance/hot_inspector.c: 15 linux/version.h not needed.
   ./drivers/bytedance/trace_irqoff.c: 26 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version.c: 17 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 227: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
