Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7AA5381
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705738657; cv=none; b=NTCyxCiOusVi6KJEmkBvIffAJxJJvCqZXebkHBNZUnesQ5IjTkK1C7ZhbeJX6GpFl5NAJOKG/yv7XpbXDGVOxipe14Aa7bvZOmhlApRJNawTZuMN3oO6yaS2/+F5AW6+9+UIEX46vi532vPUATKRTcDeQDTA2COteE/G+nTA+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705738657; c=relaxed/simple;
	bh=WSWmk677I/Q0/MjSpdzSelXL8w3hDhv3DWS98lnHAi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XiNwz3L96DJBr+QV5KjCGnuJwSbDrq9LOPAjK1CcuRcOU1C54t/NoDEDG4FEAUUvVzTvNnEx7qnmuXYQDQuwPNF/4qy4uWzFxuSLHPcoplRYRY8YamPec/2+gSkh/ZICTihy7HmLrRAE8msrL9Jovs+hRC2WCwHIRvtb5nTJ7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSs/8spR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSs/8spR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705738655; x=1737274655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WSWmk677I/Q0/MjSpdzSelXL8w3hDhv3DWS98lnHAi8=;
  b=nSs/8spRy2cWN6/pNsLXCA0gqZLfoQl4bPuqznsTygcvK1vzhcR0aDeq
   Zg7n75IERCgvWW+Ko8iGnmTxIhwXzUJn15TFC3m1TcWl3Fyz0WMr3uTsi
   Oy6zkGkNcd+/jQICRjNtdFAy7mAzz7Dqltj6rWA5OEJQo4lUzOcnVmj60
   v/pCVyp5fj8evWujm/XTs/Y/H2kXSvKQIuIt5SJsnVLz8XOYF73GO6VC+
   PMU1LZfiNJwVeAYtA4cOvvYtPURBpS42zYI0iEqgt3sWjGmy2EpHiZVP8
   ZEzovQnSvN2L6he1j8e0PFUcD8pKd9+sfmS+xhdh3/cbuf9VVh4Myibc3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14439232"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="14439232"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 00:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="908514174"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="908514174"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Jan 2024 00:17:32 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR6Xi-0004tq-1O;
	Sat, 20 Jan 2024 08:17:30 +0000
Date: Sat, 20 Jan 2024 16:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/wrap-around 38/77] zip.c:137:46: error:
 implicit declaration of function 'add_would_overflow'
Message-ID: <202401201617.7dVhQJxo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/wrap-around
head:   e89bc1e50a4aea7c77987a344e7917eb41d290eb
commit: d35d22196bde30e00d2b8b7b4e404d1526651659 [38/77] libbpf: Refactor intentional wrap-around test
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240120/202401201617.7dVhQJxo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201617.7dVhQJxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201617.7dVhQJxo-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   zip.c: In function 'check_access':
>> zip.c:137:46: error: implicit declaration of function 'add_would_overflow' [-Werror=implicit-function-declaration]
     137 |         if (offset + size > archive->size || add_would_overflow(offset, size))
         |                                              ^~~~~~~~~~~~~~~~~~
>> zip.c:137:46: error: nested extern declaration of 'add_would_overflow' [-Werror=nested-externs]
   cc1: all warnings being treated as errors
   make[6]: *** [tools/build/Makefile.build:105: tools/bpf/resolve_btfids/libbpf/staticobjs/zip.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile:157: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
   make[4]: *** [Makefile:63: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
   make[3]: *** [Makefile:76: bpf/resolve_btfids] Error 2
   make[2]: *** [Makefile:1351: tools/bpf/resolve_btfids] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
