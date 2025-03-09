Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B88C2C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741516477; cv=none; b=afyf3QWbGtKrpZQcYulWdDx4MfYx8/b5pnkXGq47tChsCDTzAM8rHf5jnCZMSH3Mw6jQwWqrLMn5/Hj++WDiZRtNC8gbfS3tYaEbwtO6ODeRVL2J0ch0YunkdJvDVBCKOqb6bwr1PQ0Q3XX/iE3X+Xj3EVcfJtuimluInCi2tEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741516477; c=relaxed/simple;
	bh=8yrUvidzJiVvdbLlrZCTJsvjsLvsL+OnvSe7R8jRiUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8P6+tLzXXtm3TFRyXifRLvgSmqxFhwC5cQHyo2EGEaIKQXu1u+BCL3Thz+evjPSs0OpaFDGHv/l2mL4O7+uao4OBf8K1w6obdlu0aBDqolUknwy9d2LjEqaoQXyLCYQYBaN7iy+vyYEEFcz6DXBGCIfHyr1iX6uI65DMpxZ71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh2rz7Gw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh2rz7Gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741516476; x=1773052476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8yrUvidzJiVvdbLlrZCTJsvjsLvsL+OnvSe7R8jRiUk=;
  b=bh2rz7Gwhph68e70UWUUqWrJAot3n+9ekk9UInTMQfDYXqlY3pLFR6ak
   Dc6OnXHcZTnRfOtbFaYx8EX2QXumby2HH/stVCNGKCXsB6iCl3McuFw6P
   lT2eUHqwYJ4YIWMBbL7uRxRqX/C3Gv+T94DNzRi+fLoTsK/0QbHS5LfHY
   iW/Tn8ZFYMA9+lLVVUV7HZPyoQuRf8n7GcJfhjbZwjprv1pv/0XNOXJ3t
   6zmalSqfopgqrLnmusZ3cnQAFBqfhBp0/Jl31vmlsna1gueIZYPCO9Jx2
   AgbFzGl1+K1nTSIwfU4Q1+ykscX215FJ/RE1foLMjhok+Nyjrd9DitP8u
   A==;
X-CSE-ConnectionGUID: K0NHhdwyTzmWl2Bk2tv/Dw==
X-CSE-MsgGUID: F/oZ4BWOT7WdjH+1WFPGJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46299963"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="46299963"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 03:34:35 -0700
X-CSE-ConnectionGUID: jL8REe5ySRyFjyTuaL7BvA==
X-CSE-MsgGUID: K4XTgnZuT6ugWNlqsjQzmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="124741344"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2025 03:34:34 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trDzM-0002zs-00;
	Sun, 09 Mar 2025 10:34:32 +0000
Date: Sun, 9 Mar 2025 18:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v1] page_pool: import Jesper's page_pool
 benchmark
Message-ID: <202503091812.s4r3ZQjL-lkp@intel.com>
References: <20250309084118.3080950-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084118.3080950-1-almasrymina@google.com>

Hi Mina,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 8ef890df4031121a94407c84659125cbccd3fdbe]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/page_pool-import-Jesper-s-page_pool-benchmark/20250309-164215
base:   8ef890df4031121a94407c84659125cbccd3fdbe
patch link:    https://lore.kernel.org/r/20250309084118.3080950-1-almasrymina%40google.com
patch subject: [PATCH RFC net-next v1] page_pool: import Jesper's page_pool benchmark
reproduce: (https://download.01.org/0day-ci/archive/20250309/202503091812.s4r3ZQjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091812.s4r3ZQjL-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./lib/bench/bench_page_pool_simple.c: 13 linux/version.h not needed.
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
