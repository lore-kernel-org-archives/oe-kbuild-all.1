Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37541DDA1B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126770; cv=none; b=Mke4uCiyLW1TB3ZtNVAWR4HEghbGEIrubHGXhA1Z28scC2Urw9YnSRm6aVvP+sz2FxE1xeh2CVfjhI229midOOSUIUt7jaxc188LlrVCzm+Cfb8CWvsoxiQvEgKC5G9ov9xmyesw5bzR9BRbc5YW8ydam+HbiA59sO/VreAmpxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126770; c=relaxed/simple;
	bh=oiWbTxbr607JEEL/haoo0eVwgDlrCty9VSeNUAhQ4KA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCg3Z2vfmtJJ4Ws41vJlFxvsEjUR/hsItYCSx+cUPkVvzS7vPvQqyz05Ynp96VCCgds3Ji4AjKGninLmHeq0IkK8y5hFYt2a6ThXijrPlHcZ5+h95I9rRxXds9B/PLN1htnxISwCdSq9JrqQ0YLe6w/oa0N/rvrZF7krdi9/EcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJVdfHrj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJVdfHrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730126769; x=1761662769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oiWbTxbr607JEEL/haoo0eVwgDlrCty9VSeNUAhQ4KA=;
  b=PJVdfHrjY0q1DSSzsGBtm2/onwMo3tw0o8A+cp1qoJOMYluRRwAnzv10
   gUJDDD8s0RO6EkML4Du1cSw/vqFJJAKAqQTIoj0lEjz9aglGyg04/6TpR
   d/mSmpfY0Q6mbZSTEy3YRPwFzOrMkYTl3CrnR9BgAbLiRNyLJ/YlUB5sn
   tGBx8CTeY11fSuu1a1aXn6ZLoFhY8MkwdoVHAfSMfCkOe5DkzNDR23GnS
   4BE3GAdpSz4jRO62Bmxik7LMqA5vVpCt8n1NinazQjjz+N+Wm76mDPXp1
   /p8RvSEY51VxVBjblVvTNiNv09AghWIctrqKmqfdxbxf4W7nwLLrWH71f
   g==;
X-CSE-ConnectionGUID: Ng4Rjn4XQTKnBG7No7U5dw==
X-CSE-MsgGUID: HC25KveWQpyUCQBCFGA2dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29836319"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29836319"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:46:08 -0700
X-CSE-ConnectionGUID: lwki+7aaQ0KpELHWAk/0iA==
X-CSE-MsgGUID: XFlaTFaBSCuUk+dWnWIz+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="86248964"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Oct 2024 07:46:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5R0P-000cXu-1Q;
	Mon, 28 Oct 2024 14:46:05 +0000
Date: Mon, 28 Oct 2024 22:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>
Subject: [namhyung-perf:perf/hwmon-pmu 71/74] util/hwmon_pmu.c:176:9: error:
 implicit declaration of function 'strlcpy'; did you mean 'strncpy'?
Message-ID: <202410282254.yn5h8E0R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git perf/hwmon-pmu
head:   328b8ac129562cf42d1a7fc5379b78c345229052
commit: 0a73106db83ac037945cb038c393ccdaa5225703 [71/74] perf hwmon_pmu: Add event aliases and descriptions
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282254.yn5h8E0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282254.yn5h8E0R-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:648: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.12.rc3.g0a73106db83a
   util/hwmon_pmu.c: In function 'parse_hwmon_filename':
>> util/hwmon_pmu.c:176:9: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Werror=implicit-function-declaration]
     176 |         strlcpy(fn_type, filename, sizeof(fn_type));
         |         ^~~~~~~
         |         strncpy
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/util/hwmon_pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
