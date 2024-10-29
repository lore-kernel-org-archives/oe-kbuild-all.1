Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972B6193436
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203023; cv=none; b=TulV6tZmIgzg80RP2JFowLgr9j04dxuT247seIuoqGO92fo9tfbUpmBfgs5G+YRN5TACT/0vkqyWaptNJO1zfnER0aO0AbXnaVyUJa50fboy6HsiNbJZuFx5f2POdO+3AJOOz1wapxUtozH8SMxE/AuIor77oDnuEiDFwy3nn6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203023; c=relaxed/simple;
	bh=hHkGLJiE+csBnwZ35UrtJNiCudZDUy8wY8R2A8LBPgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2ZNt+PRlbmcP+BweESbC/QmEuecv3SWd7c0owlugM4YbnwrFLhLKysnTFNPC9Lp4L8mClqiB83nRHZVTbpVjcopetDJKY118PMpbRBPhoDwzqNRgcFGHfI9sIfCGc6MWLpict6IrfljvXQV8DQJGYvFOXaEereJHqSKdQMB2NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/fAOBqF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/fAOBqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730203022; x=1761739022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHkGLJiE+csBnwZ35UrtJNiCudZDUy8wY8R2A8LBPgI=;
  b=Z/fAOBqFIG5KqVkA5873MVZhJq5YmnDWX7+eQ+6WMJHkdPGXUAEsQViZ
   RMbYwkqwcmc9MbavbCCSEqNFUQn0C3dLdYJSiJNNcjTRIMVpPJM1fBlHe
   rDz1+rfWdB/jSj06P0oyCc+3enblJe8cgXIqZZZVA83Ef6T9fGjwXrBnH
   cKp5jpu66O8etjEF6/dewtRFjbHLEw4mqwJ7xL2aah08Ow8SmBl/x9l5u
   zjsEplsnrKRRORxzHyJyBo0fKJt/rFPpmvI5mvVPADYQZe178KFqFKXZG
   g4o0HvwWJXM5UYlE3xrVpKuxEPtPcg6ScwWCp75vRNHnENKygum7yRvmm
   g==;
X-CSE-ConnectionGUID: q49GncG7TEeHeeOiHw7w2A==
X-CSE-MsgGUID: UuB4r9HkTf2P2p2UyuVEIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29944718"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="29944718"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 04:56:59 -0700
X-CSE-ConnectionGUID: IHe0cEgvRMiLDHtEjpau9A==
X-CSE-MsgGUID: /aY22KaxQw+vV69EcnaWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="87072014"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Oct 2024 04:56:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5kqF-000dbs-0Y;
	Tue, 29 Oct 2024 11:56:55 +0000
Date: Tue, 29 Oct 2024 19:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>
Subject: [namhyung-perf:perf/hwmon-pmu 73/74] tests/hwmon_pmu.c:149:3: error:
 call to undeclared library function 'strlcpy' with type 'unsigned long (char
 *, const char *, unsigned long)'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202410291911.JgZ6x0mv-lkp@intel.com>
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
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291911.JgZ6x0mv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291911.JgZ6x0mv-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:648: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.12.rc3.gca8adafcfc24
>> tests/hwmon_pmu.c:149:3: error: call to undeclared library function 'strlcpy' with type 'unsigned long (char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     149 |                 strlcpy(str, test_event, sizeof(str));
         |                 ^
   tests/hwmon_pmu.c:149:3: note: include the header <string.h> or explicitly provide a declaration for 'strlcpy'
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/tests/hwmon_pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[5]: *** [Makefile.perf:777: tools/perf/perf-test-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   util/hwmon_pmu.c:176:2: error: call to undeclared library function 'strlcpy' with type 'unsigned long (char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |         strlcpy(fn_type, filename, sizeof(fn_type));
         |         ^
   util/hwmon_pmu.c:176:2: note: include the header <string.h> or explicitly provide a declaration for 'strlcpy'
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/hwmon_pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
