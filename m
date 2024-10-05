Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5A954670
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 06:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110643; cv=none; b=J/8dG83CRkoDVZPbVKXCA4slBMlVGqlHAJ6R+Pd5An2TSCCdWjCgkAb+ip1w30eURT5+nXDar2WrE7Ztxw/NtL80wZ7ZrKQZjEhlEUgEmEk0qk2vzT4SgzC6TdBYzsKDd4e8Ls+/AuUx+SxGttrggTrgwIi8klLv4+/9JsgpVh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110643; c=relaxed/simple;
	bh=7L1e5EVFfjFmJ258nC8tQGvY9ErnBy46V/AXO7o9fzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H01Fsexkyx2NsRAxgGL8ChQlWVZoGLA73+Mt7CDaaeOvvR9RM20DPEZJh6R8BdfDf0+vDEpr+0P0oB7EDpb/xfk+35QZceJ+GhUn3yAUr1BUyo9795RWpc4azF1oeIh3fQXeu2xO//VVO0WMm/BbTK1yQOPZ1h2ieqKbhuw7nvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NA/NUZXt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NA/NUZXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728110642; x=1759646642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7L1e5EVFfjFmJ258nC8tQGvY9ErnBy46V/AXO7o9fzk=;
  b=NA/NUZXtCPD9TqpGgZAY52wxkHm4G6ZP+tV8CwJ1AJCo5ieSOop6vrOq
   0vVWGguS5XCDRhmboNgXgOZb+nacP3zWrEq+I5vZ3foF5rSvaw05h53Wn
   J5UUqAdSOu6VMHiXXp+UW5tIt+lFTOV9gwza4zZPtn2zSa/Vbqoc7NqYC
   ExsYO98MYxDwBtdm/xooch9iyXwADn0j6+ixbn2wd9efaum9S+zLTH/rx
   29bqz/7/C9uvH31CksSMNnAMu9UEZH8l6BuqDuy6vgqrzqHh8FKjv0nZ1
   1w4qT2GM14unvedsxGQS3AqZTIUm495AQuxZPSGGTHBZxZ0It7hdG+W+k
   Q==;
X-CSE-ConnectionGUID: YgL8QhULRmaeUEeSmoLljA==
X-CSE-MsgGUID: hfu6hSWBRfW6DuHb8hsDrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26835668"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="26835668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:44:01 -0700
X-CSE-ConnectionGUID: iBfIPn3ZRxeW0nJmpyk/aQ==
X-CSE-MsgGUID: vKcPugViRwCqvTLJY8APiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74503609"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Oct 2024 23:43:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swyWC-0002fw-2J;
	Sat, 05 Oct 2024 06:43:56 +0000
Date: Sat, 5 Oct 2024 14:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: tianci yin <tianci.yin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Slava Grigorev <slava.grigorev@amd.com>,
	Kevin Wang <Kevin1.Wang@amd.com>, Jack Gui <Jack.Gui@amd.com>,
	changzhu <Changfeng.Zhu@amd.com>,
	Junwei Zhang <Jerry.Zhang@amd.com>, Flora Cui <flora.cui@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [agd5f:amd-6.2 670/3034] versioncheck:
 ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
Message-ID: <202410051426.sPDVJCAy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-6.2
head:   89450c67d99b47b5c1929a5cd2d8467b6ee686a4
commit: 5477fc2c0f01b499b496694fd3b70f195e9e9ff2 [670/3034] drm/amdkcl: Test whether pcie_get_{speed/width}_cap() are available
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051426.sPDVJCAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051426.sPDVJCAy-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.74.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
>> ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./include/kcl/backport/kcl_pci_backport.h: 6 linux/version.h not needed.
>> ./include/kcl/kcl_pci.h: 27 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 406: need linux/version.h
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
