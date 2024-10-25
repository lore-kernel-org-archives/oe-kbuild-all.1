Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64F18B484
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849558; cv=none; b=afRQhQV35YuXMKxKkRxfW30fMGe3hC1W3wswPTdxBh4HnOWKTD/DWflsuVD500tzXCazy0qN1GMiQTiRL/5FLQxwTN6t8SF1y7X3b13Ra5gOcqdGJMTDp2FSsHEGmUs/MFRk7UVGdBJBRLDQOWgNsRg/chYHFqajMPf/mkPY6Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849558; c=relaxed/simple;
	bh=ai5LQa+6X2l7nOlXZrJMViRFVM3l/RHYhoMTp1MM08U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTHEnGT7a8iJRKRD9gsa0OI2Ae4h9HrDMB2D9j0Ym7Vp7Ly3pS5XhAhrj/ROgFO8tGS6oIkBZgbD3V2HvTLcS+cdK9XwNtUA0sRN9fVGRpk36XiS871De2/Cvsl5gk35oBD4ckZ23njF6akXPX5E3ulFNCN4bV5K0KKSXqZr45o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1GKQ7gQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1GKQ7gQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729849557; x=1761385557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ai5LQa+6X2l7nOlXZrJMViRFVM3l/RHYhoMTp1MM08U=;
  b=j1GKQ7gQ9R0LQdtGG0I/aDF3qveZfcHVDCXKgsAK+nLCT98mvQ6zHNsj
   m92IGUEeL8tgd48Ea4YCKwkrdI54snbgFqwTxamintW+KcWMZBqSTj2hD
   TQx2X8fjkYXjhsN5tq6CGNtt5dYmqhBHjgHKPyNDmSGqsGXWeA+i45dlg
   xgc1UJyDDAkxcmDNSMYMAxwlxp9PPo5jnvLw4o0LsAvmofEEzvvg7IPBD
   KVBKbxqPDXSkytzu9CtnyvetqybmvNu8ldlVSYU6ELEAP6GJxEIRqGSmI
   kfFaFMxHm3v5ajz6clsNhu/ZxHQoSo5MiN7hL9aJB+FiV9P1+r6ayIneA
   w==;
X-CSE-ConnectionGUID: Sv+sGP2iT1ealCZE98jvIg==
X-CSE-MsgGUID: voqxOVxpQsqgKU+PWDsdrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33318447"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="33318447"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:45:56 -0700
X-CSE-ConnectionGUID: 50xFiOy8Tdmw3lT+btcEoQ==
X-CSE-MsgGUID: s+mNQwd/S1mZX0ZTOM2kUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80528226"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2024 02:45:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4GtE-000Y0O-1i;
	Fri, 25 Oct 2024 09:45:52 +0000
Date: Fri, 25 Oct 2024 17:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 4/5] perf test: Add hwmon "PMU" test
Message-ID: <202410251740.FfhPvQCo-lkp@intel.com>
References: <20241022180623.463131-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022180623.463131-5-irogers@google.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on next-20241025]
[cannot apply to tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/tools-api-io-Ensure-line_len_out-is-always-initialized/20241023-020925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20241022180623.463131-5-irogers%40google.com
patch subject: [PATCH v6 4/5] perf test: Add hwmon "PMU" test
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251740.FfhPvQCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251740.FfhPvQCo-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:648: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.12.rc3.g57afdf292ab4
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
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/util/hwmon_pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[5]: *** [Makefile.perf:777: tools/perf/perf-test-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
