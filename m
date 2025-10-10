Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4FD34BA59
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760128585; cv=none; b=pogEUHQ2eYTWMJ6O66Cyb3+FHDVfSDHCNmQmM2XtY6u9Z7Pj8uhTiXpkaJ2CO1QUjMf0yIZ9xv2+Rj+JlvBgI1je9TvuH5lDMaSFhvTHsmzOfJwazdrrf7lOE4/zDByrS2FSgznOwgSP1GFmu5KuclPJ7nloVCAGGLdXBCgVHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760128585; c=relaxed/simple;
	bh=ME5D7MNvbp73f8Yk1qugQ5hyd+p5j726lJWyWHl9oRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJNfsq4VbOQf+LsWUjSe6ic12mR2+o2pnFeUH4ExEcyq84+sFol5JTmES+ZHQG133s+ZexHllZg5GpW/9iPkfLyffbNReGt2TzCsF6irAbWCturCpOA4UwwkWGik5MqFJ3zCFsVKShRdBvu8cflC6wUOkxBz6yQtOXCEywUBd2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6PGcato; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6PGcato"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760128584; x=1791664584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ME5D7MNvbp73f8Yk1qugQ5hyd+p5j726lJWyWHl9oRQ=;
  b=L6PGcatojujQgNfx5d8CES/aPqZSJ0UJjGIWSEnI1tfBXZe/iT17RjU4
   a3gPDo8xDZTmxL+Yk0U444B8uYsef3GgxY9kEGbaZOBJMyVfFntp8bLZx
   sJruq1EdxVnsudDWIBwmmkg8n+NhWdu+dDEyFGzpTsP+j528QN9sBbub4
   hquvvIaicCbWV8ky7AmPqOyHiSVJItsENpYl6jon+dPR6uzwNqcFgrqOa
   gQ6gH6ExNSXiiyv9QcKnEKrZ+Z+Utykza5Fwx4mlIIZe+dE+kJQa8m1Zq
   K+iIGKg/fgxSO/8ZcyQBe7WBEbmcTKrciNf3OuuGdOoA05T2aPnV303F1
   Q==;
X-CSE-ConnectionGUID: LU4JQeUDRQS1fr8oApskcA==
X-CSE-MsgGUID: I0XoYpaWTuOwZHFTalO3rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="49913907"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="49913907"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 13:36:23 -0700
X-CSE-ConnectionGUID: 7HY2TrniSlGD2DAFeGfaHQ==
X-CSE-MsgGUID: ak8yFIdnQJSqJbW98oavKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181486922"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2025 13:36:22 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Jqe-00039P-0O;
	Fri, 10 Oct 2025 20:36:20 +0000
Date: Sat, 11 Oct 2025 04:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 10/22]
 include/rv/da_monitor.h:225:21: warning: variable 'da_mon' set but not used
Message-ID: <202510110422.9tepsu2I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   2d8872c2feb1ae4836bc44a6661138d1eb450a57
commit: 75a4bd35213d0cdadf15a562abfba4275ed560ae [10/22] rv: Add Hybrid Automata monitor type
config: arm64-randconfig-003-20251011 (https://download.01.org/0day-ci/archive/20251011/202510110422.9tepsu2I-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110422.9tepsu2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110422.9tepsu2I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/wip/wip.c:18:
>> include/rv/da_monitor.h:225:21: warning: variable 'da_mon' set but not used [-Wunused-but-set-variable]
     225 |         struct da_monitor *da_mon;
         |                            ^
   1 warning generated.


vim +/da_mon +225 include/rv/da_monitor.h

   220	
   221	/*
   222	 * da_monitor_destroy - destroy the monitor
   223	 */
   224	static inline void da_monitor_destroy(void) {
 > 225		struct da_monitor *da_mon;
   226		int cpu;
   227	
   228		for_each_cpu(cpu, cpu_online_mask) {
   229			da_mon = &per_cpu_ptr(&RV_DA_MON_NAME, cpu)->da_mon;
   230			da_monitor_reset_hook(da_mon);
   231		}
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
