Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2781A2EA173
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781262968; cv=none; b=q9OueuzshT0dP13PV7Ay/k4KzAieA1cO3WJhA637I7obgNuZrDSZoGM1rK47sC+V+Ii4vXZw/CKIUUHELH2J8ooYpS7x0i/CHcBPQN/n7zsfU42Vx5bRrjXdBWD1kpcB/EHac/sg6NL1ds8ks//TC2kqwZkl4g3oAN5hEpVCQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781262968; c=relaxed/simple;
	bh=GBQKwi2xtXjUcCx1f4thQ5/b+xhHTuHZxD0l5UursQI=;
	h=Date:From:Cc:Subject:Message-ID; b=HSxzNuHHPPMhKjPLinQmcWMRuBcILTfn8RDDrkMhumbcaUecJIWnjsLYI2XrIwf8rGHnCVC2nFdHLmLFNeiLA37618J5KV6fecZPzf1C7poEWqGLiulSRXAPga9Vw2pGTBkEoGxFM3dbXS02CvRQPTue7b6/CzwoS2Fwkm50/z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwTN/lp/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwTN/lp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781262967; x=1812798967;
  h=date:from:cc:subject:message-id;
  bh=GBQKwi2xtXjUcCx1f4thQ5/b+xhHTuHZxD0l5UursQI=;
  b=dwTN/lp/zU/0uHjVh7/PNV03YLB6e63IeKrwKMw2oUGfitC6nAD31v9L
   1ATyv9ueMArx3rqgsjGUDo6aEdV4eP5Uu6pe3Ovt/E9c5CATOG4ULEQja
   5irfIvetPIJZYr7iWyaQ9XaEuCnLFw1NqvvSwTU8stnpDGi/o45V6VITn
   QwCKdOA5IL8Cof7CHDCE2YKRwQ/H3nHltGR9KHZzjpQNzs8VfhgJXkZBj
   Pbhy0FudBe6RxAmNFam5olEQK3ic18LJXkULZE1zcrYrOk/AfRNeo1WQW
   n5x1qkT9d1stMBnZO4Y4hdGv3zVepNF5XhOJiwOhWIJZ37rly18IGETjL
   A==;
X-CSE-ConnectionGUID: WptgR1IuTvmxqBeHXPd9Jw==
X-CSE-MsgGUID: 2u5QOlPGSTyE69uJ5e8HNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69637980"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="69637980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:16:06 -0700
X-CSE-ConnectionGUID: B77gWSz7QeK/wET81vF4GQ==
X-CSE-MsgGUID: G3FomZj9T4CEirVvuWocuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="284905441"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2026 04:16:05 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXzrn-000000004FB-0VK2;
	Fri, 12 Jun 2026 11:16:03 +0000
Date: Fri, 12 Jun 2026 13:15:19 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:6.12/android_v 1/1] versioncheck:
 ./drivers/media/pci/intel/ipu6/psys/ipu-fw-psys.c: 8 linux/version.h not
 needed.
Message-ID: <202606121331.paEPRWvw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/android_v
head:   68a638ff668a1d42dda25aab102975b86d6fc10b
commit: efdb7377003074aebc2770e595f5711ce41260b6 [1/1] media: pci: intel: psys driver
reproduce: (https://download.01.org/0day-ci/archive/20260612/202606121331.paEPRWvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121331.paEPRWvw-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/pci/intel/ipu6/psys/ipu-fw-psys.c: 8 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu-psys.c: 16 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu6/psys/ipu-psys.h: 10 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c: 4 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu6-psys.c: 12 linux/version.h not needed.
   ./fs/incfs/integrity.c: 8 linux/version.h not needed.
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
