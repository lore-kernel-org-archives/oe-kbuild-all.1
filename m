Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640C118FC75
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730149527; cv=none; b=QOJjkYeExao+ECFgFmeorBkP22OKQh5RDuyWDSRj9eR2BChvgqlkh9ola0P1d1fRcKci0ZUU0l7hmoS92BvUTx9tm/0TX4bC1QrXwcTLgxcTkgnnZcNqQF6lazckSORYZ1hl5Lx3UjA62WMink9lL16VwTmMeXg+afM2UC2ey/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730149527; c=relaxed/simple;
	bh=VsypmxVAL2h8NVxSWhlAil6AZWoK2PL88rKjjLBcFZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OoFXIBvh0tkGkoz1ltSkZBD7pWkMH9OfTU9q/7D0E+e2FLrt50Edsrn95lHZza3Jkd1P2Cn7I2/Fa1nnZc5zhdhn5hvbZQlwAq1tZ/nrkaf3Ylh5p5P1DzwM0UnyXPZKjq3n7F3cYGDbqjJKTBzIDdzdmXPrOvdSjgvTl0wnOuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZFMLRZ6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZFMLRZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730149525; x=1761685525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VsypmxVAL2h8NVxSWhlAil6AZWoK2PL88rKjjLBcFZQ=;
  b=FZFMLRZ6CoHICaO2YhZqJsS9O07Lnkv9m0wOCJhDuTQhMseICs9ogIO3
   htTmMjUAfAT8hWXDS2yLfvRJDYBKP7WN+hV2gs7nYzPga/CuOsaexRh3m
   MmikjCTdCjKzcw88IHYtOPHO7vke54/mRyV9vhrpMHWDzFjDnav8cR7g9
   6OTGG5S/B3uQhsm8c5/bVdaGxldOfA9vc7bC/WD4qBIqHK1biJowocGgO
   Za9vU1dESTX+uhRwlldfVPB+octB1G3nrdvOwVZ8uwofslCC+3g0mDOhv
   NKMeEtLiHASX62REfzveDf+Ew+aw74lCRiqprDFiRXQ76QToF8dV59qcw
   w==;
X-CSE-ConnectionGUID: i0MRUxnUR5qLgCLoFO1dng==
X-CSE-MsgGUID: /A1QIS4zRcSaE3L4A4oiJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29197695"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="29197695"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 14:05:25 -0700
X-CSE-ConnectionGUID: 3/LfZSuARpi5hd4rsOVq5A==
X-CSE-MsgGUID: MrnlnowrTzKs7L0oXlU2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86486102"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Oct 2024 14:05:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5WvR-000csa-0w;
	Mon, 28 Oct 2024 21:05:21 +0000
Date: Tue, 29 Oct 2024 05:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>
Subject: [namhyung-perf:perf/hwmon-pmu 73/74] tests/hwmon_pmu.c:149:17:
 error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'?
Message-ID: <202410290409.OdeoQEfL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git perf/hwmon-pmu
head:   328b8ac129562cf42d1a7fc5379b78c345229052
commit: ca8adafcfc2495705fd11c9503894c6cbd05fc2c [73/74] perf test: Add hwmon "PMU" test
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290409.OdeoQEfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290409.OdeoQEfL-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:648: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.12.rc3.gca8adafcfc24
   tests/hwmon_pmu.c: In function 'do_test':
>> tests/hwmon_pmu.c:149:17: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Werror=implicit-function-declaration]
     149 |                 strlcpy(str, test_event, sizeof(str));
         |                 ^~~~~~~
         |                 strncpy
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/tests/hwmon_pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   util/hwmon_pmu.c: In function 'parse_hwmon_filename':
   util/hwmon_pmu.c:176:9: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Werror=implicit-function-declaration]
     176 |         strlcpy(fn_type, filename, sizeof(fn_type));
         |         ^~~~~~~
         |         strncpy
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[5]: *** [Makefile.perf:777: tools/perf/perf-test-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/util/hwmon_pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
