Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC0239FC1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728106322; cv=none; b=lBVVmZCO9mlQYejQkijMvRMXujN84ea1n492ajQCfBc17oVqFZ6Wu6LHr0Rl3OVJCnirL0e3x3STLyky4vyTxA5Rcfdy2HQXUeD7PT8+0XHYonejD3lrfvTuXi2gObqtiBSgD3Qf9DqLUywAz9Ynzc5Dg3zt3rDJVwsq/2k99Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728106322; c=relaxed/simple;
	bh=TdQ1it/IPVH6hz71DiiAzxrWL7z2Bzsms1emNIckEl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sGJufT3a9emNwcD83HDGo0876Y5fgB1KP5wHQKlDloYUbdFwrReebsbxgl5G0DeryCEGo20jkDvj0vJMQ27DcLB6TDHTtoEjy4kzzjXrycRqzBKGmA4k0OJ1mRTaAlokCk7VWBe5pirkWo8sDSlheWzpRkWN8+imxqZpl0xrN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvnhWKIv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvnhWKIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728106321; x=1759642321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TdQ1it/IPVH6hz71DiiAzxrWL7z2Bzsms1emNIckEl4=;
  b=kvnhWKIvwEF8csTgcvoiXtyezg1qDEokfI7M0nvfBpxniHDXPXEYuh/j
   uy3NIHDNing+AKw4sicta492e8LbYHaKvcdxjNwT39/Gr5EGDn8VZSzqZ
   fNtnIbMjioTKymPF31PpzifUvMzGp53ot+2dFUpTxskmbhrEcwbNowpfh
   TO2MSbTZNBWEhjd8HBIIL7GKIeSIGzaMGz/k5uhwC+0xgFqKuxqh2UhoD
   U8HUbKby/uIuOS9X1tEfUQxb/l5snMbaYOkEN/UFvelcZRWX3fh4Oi2MA
   rySygZK5BIenlME3lmr9xvCDtgvZn5xBOKiSEsFV2qt+Cj35eHaorK/20
   Q==;
X-CSE-ConnectionGUID: EUSHjw31Q1iS8isVuFsIfQ==
X-CSE-MsgGUID: u2RNPo/iQjOilZxI9ggNng==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27275069"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27275069"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 22:31:58 -0700
X-CSE-ConnectionGUID: YVSqvyknQkmgQSDVa8bMmg==
X-CSE-MsgGUID: U7qfxAaUT5SlWu/RPXEweA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79486524"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 22:31:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swxOU-0002bK-0b;
	Sat, 05 Oct 2024 05:31:54 +0000
Date: Sat, 5 Oct 2024 13:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Qiang Yu <Qiang.Yu@amd.com>, Jack Gui <Jack.Gui@amd.com>,
	Flora Cui <flora.cui@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [agd5f:amd-6.2 661/3034] versioncheck:
 ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
Message-ID: <202410051332.OYv57YLn-lkp@intel.com>
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
commit: 9110a0a86f98a98bc2ea8ba32418a3866cae3467 [661/3034] drm/amdkcl: Test whether kthread_{park/unpark/parkme/should_park}() is available
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051332.OYv57YLn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051332.OYv57YLn-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.74.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
>> ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
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
