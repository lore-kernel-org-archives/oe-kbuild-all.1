Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB552D3EF6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 03:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706932; cv=none; b=ApgfvsTBIkbGRr/HDSdlkLTaomZuhR2RP9SDGa8uSI7AxwYjjNt1+kxjLu4sJ2DNDF2TKBsBQeMlZzMzpnk+wQkvUwjtN8syWZJklnlJdLMQpb/VROYMaFV/FEF6k5zpkYV3j1bs0T7O+Hya1UAMmTD9lqVJzb4SlXJma/WecTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706932; c=relaxed/simple;
	bh=nqiG7KicIBh0jRe3UdJC2hEExaFQgqk3bsht2hDYOAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+IH6lM2Pf0pTFfPpsqdImYONC+yAqwzPNns4fZBqn3bnx0zMduQlBfFsrBHuxC+Cq544WR1b+6a16hp+3qLvYR+ehkm1ePr1p/7Mp+oxjr45S74OhHDUNzX+2LmO9bNBP96+8BzzoCTyB6ZvVD5wRbcuaIu6bAZLscF22cNTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkGuWwRB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkGuWwRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761706931; x=1793242931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nqiG7KicIBh0jRe3UdJC2hEExaFQgqk3bsht2hDYOAM=;
  b=OkGuWwRBY11cfQNHVJUCpBNdQSLkYAGMPpJKpudduTXy7Il8NDUi0EM9
   m8E+HPhJSQL0RTH2bP+PmEHyPPWmYwZXm5uBCKug+6dOMAEztUgsviUFq
   OHIdeFAJfcFx65cyxq+tXgCXBBAb/2lkdHv5thBWcHGmP8l9yU9lSFXkw
   /uL5WAnLMI41dJVosjFNmKK4Vdi8EOgYbiKfe8nLT/qehhVEUNG9BdRs+
   9iR5mHPmDQGl1WtMV0AyFxjEjSb8z5lhHCPv9BZyCuFu02JbOX+gCHuZ4
   e14egXPiJdBN1GFWXFZ8Vi1H3ZEDYTjAD/F6+DLpzbFlGnHTmQiw3j0UH
   Q==;
X-CSE-ConnectionGUID: tq+gtjUISnaf4FF0Jk3pSg==
X-CSE-MsgGUID: FY2afx+XTcSr/WnH+XIGDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75267114"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="75267114"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 20:02:10 -0700
X-CSE-ConnectionGUID: yjWwtAhiQVG1v/ixDY/Ynw==
X-CSE-MsgGUID: tBSa+YCWTxaYL04bGCRyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185991278"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2025 20:02:08 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDwRq-000000000rQ-3H5u;
	Wed, 29 Oct 2025 03:02:06 +0000
Date: Wed, 29 Oct 2025 04:01:31 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2972/2972] versioncheck:
 ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
Message-ID: <202510290415.MIZDNB9I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab8573e771fc00691b546bfb1b7432ed6b19f9bc
commit: b80df10f845813bb4fc2002b5386ecdfa8be5f6c [2972/2972] DRM: Phytium display DRM driver
reproduce: (https://download.01.org/0day-ci/archive/20251029/202510290415.MIZDNB9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290415.MIZDNB9I-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
>> ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 15 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./fs/proc/etmem_scan.c: 13 linux/version.h not needed.
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
