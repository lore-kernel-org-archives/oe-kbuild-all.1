Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51FC10A0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 01:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729821397; cv=none; b=QOgsYyoAsoa7diePjskTt3m3NPZfolUV8nsXfnBJj9Cuj/kB/PhPmoHGxlMMGvX3ukUbRNGwTTxwpCkOulq8eq4A2t5NmUkdrfEvnypwaYABl3mEMtkWRlcldMqp185jtyNK2FPO3VXkZUJF3xj94VuGLN+BUlt1ceBVGQdrpKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729821397; c=relaxed/simple;
	bh=dPyGgn1vmElDrmpSChS4w1C4ZQ5ss/OJQYqb7l8ZkV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhG1U0BS0AHK6BDejSgQyc6hxZvdM0WYNpFVPVoRkPmnQIjZ1/AKkj2Yol/WfwaaYPUmjseesxj8dPQ9RSE0r07qzZpxyNTG9Tifa4j3b8mgtKNWanDMlnbn5ApBGGbYP/KLx3zcXR6j0STb7+cgPixxBIar1VD1uJxImQevZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOYLk/Ct; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOYLk/Ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729821395; x=1761357395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dPyGgn1vmElDrmpSChS4w1C4ZQ5ss/OJQYqb7l8ZkV8=;
  b=DOYLk/CtIQ8R9Kf4uZN75Cz885y+sXdzmuL61GHigR4ivqHojq6eE/zQ
   ziTuMbU1pxO6uBlTGFK12wu/I6Ja+uAHJCO461dWbmEaGJBnJgFjpPPV/
   2Ybczzm3I/xvayUnSvDKBMj2YavQ5x3pqn7Ira5xobgHwyvkvO+BVLhTg
   t+vaJPGbIZ5gix3rH6k0YLtpXS76AP0/kMtNCjDwSYlRXPjnqiuQfqE5z
   SrS2MajKfykQXt/qQHGJhGO75q9tBHtJly6fRAJ8kilDn+6cWhihvLNU3
   7MMIJmnQohkNKtKoGsMaA4CbmQLTE5Ti6FpcquguH9n9rKIsZxXR3Phf9
   w==;
X-CSE-ConnectionGUID: qe9I7VPYTGK+igWdJ1YJFQ==
X-CSE-MsgGUID: xNtc55SiSvOQ+WxyXy3bxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17110047"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="17110047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 18:56:34 -0700
X-CSE-ConnectionGUID: qIdssax3TkepKlFYLHyEzw==
X-CSE-MsgGUID: lKo75HSmTrGkUHP5aF03tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="81606312"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2024 18:56:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t49Z1-000XOo-0h;
	Fri, 25 Oct 2024 01:56:31 +0000
Date: Fri, 25 Oct 2024 09:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/5] perf hwmon_pmu: Add a tool PMU exposing events
 from hwmon in sysfs
Message-ID: <202410250932.K22jItJC-lkp@intel.com>
References: <20241022180623.463131-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022180623.463131-3-irogers@google.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on next-20241024]
[cannot apply to tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/tools-api-io-Ensure-line_len_out-is-always-initialized/20241023-020925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20241022180623.463131-3-irogers%40google.com
patch subject: [PATCH v6 2/5] perf hwmon_pmu: Add a tool PMU exposing events from hwmon in sysfs
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250932.K22jItJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250932.K22jItJC-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:648: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.12.rc3.g05bfa0ab5537
   util/hwmon_pmu.c: In function 'parse_hwmon_filename':
>> util/hwmon_pmu.c:176:9: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Werror=implicit-function-declaration]
     176 |         strlcpy(fn_type, filename, sizeof(fn_type));
         |         ^~~~~~~
         |         strncpy
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/hwmon_pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
