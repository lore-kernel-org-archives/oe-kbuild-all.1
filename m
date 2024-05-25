Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E610631
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 01:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716601584; cv=none; b=ctBvBI0Jjr5C5jmCTxxpYNgAOeZI9qUMGxL2ygkKj0i20NQFEnCnS8d96u2PdP/J0iK/nI7MlsR0ns2tW5uy+dBprl2aqyPdAuNBQkpbz2dCovNA+5YsCtKHu/t8e562BM1IMa5jWOnsjx8D3i4VqvTlxvbB8IPG9SlzNgRhSkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716601584; c=relaxed/simple;
	bh=VUwC4hmFRWP8+UsWLqNH+uqwtk8xi4PKtgDUou+vYNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NP13cqGQvJlAu/sa9A4NlM+1hdCPUrgV5xyYrQZfpo/RA1DX0sZe59h0UhzZSWpbfoz/dB9DkrVBAojuvg5qt+dpgA8rjFqWcG2zVQ0SGtlSiR/soVXUAMCO8yWqCFMKZH/Ri/V5sZj6mucsVVcOAW5LbSsdRcpsPnNltqWhFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjUA684G; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjUA684G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716601582; x=1748137582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VUwC4hmFRWP8+UsWLqNH+uqwtk8xi4PKtgDUou+vYNw=;
  b=IjUA684GK3w0pAlt1J9Sd48VXJQwpRri49bQbvB3MTX4FjqncXF9eSKp
   Dgi+AlIYvNfubYhHISZgIUN+iCAyW6P81jS9+T6za0riq8X7MX7QPjJd/
   0Z4EAXG7Hc81kMRrsZfHuh5Jnb0CTZ/+9HQWMF4PxFirLc8ufOn7HshCJ
   r6WLY35lTQwNQK9xjSllWm40jhtRbdNdU82DSWl7U3uBrdRZMxdR84UC9
   azmMSx/+XmPOBGcX1i0LQb4t9b9JxoK9VrLyrVJVsfEVL6T+FPWI9zipe
   LjT5NxH09GpM77SiD/NYkCOQvRQKk5DJa8tX5iEHfARWtmesBVDa5Vx7Z
   g==;
X-CSE-ConnectionGUID: WVVKpiEQRQ2E8n0laAlQvQ==
X-CSE-MsgGUID: HCQ5I/pGS4OH1SnIJ4cMqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30509865"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="30509865"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 18:46:18 -0700
X-CSE-ConnectionGUID: RTYT4I2lQwG4LJ4/No8Wpw==
X-CSE-MsgGUID: w3RwosvtR42l7WDCEBA1BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="39175033"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 May 2024 18:46:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAgUB-0006K5-0j;
	Sat, 25 May 2024 01:46:15 +0000
Date: Sat, 25 May 2024 09:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 1/2] versioncheck: ./fs/kpatch-syscall.h:
 252: need linux/version.h
Message-ID: <202405250907.sbbbMYOy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   745009dc796e56fc87e911138d801679ecd3576e
commit: 8603978b6c309a0184ea26eb1cc822f889ec4654 [1/2] todo
reproduce: (https://download.01.org/0day-ci/archive/20240525/202405250907.sbbbMYOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250907.sbbbMYOy-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.76.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./fs/kpatch-syscall.h: 252: need linux/version.h
>> ./kernel/kpatch-syscall.h: 256: need linux/version.h
>> ./net/ipv6/kpatch-syscall.h: 252: need linux/version.h
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 410: need linux/version.h
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
