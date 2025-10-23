Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D33308F38
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761237577; cv=none; b=Y/dpU63DoZZ0agoILyR72fcPPLxXkw0X3VPHaRjznGIAG8vOAsNoOJKqpK8eoivC8GQ4HyvvaX7vftzqk/A2wRpLVqWDr3y4Hv5xQuwEQjRiXudm1P3BISdp9OoTtJ166Kj49jpB73koPrelm2zMJp4T2spX8hB6aO+fQTmkqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761237577; c=relaxed/simple;
	bh=SLdCIP7cLz03b55MQ0vX4PwOYiWsbcDhqGOkIVEqxzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+aESyy2txwkte/oAGWFXo6qzlua7mbh1dTO973YZZqUaPi2ux+LVETzMvM/tiXd6YHGjNf6M0FbpXVoeHMbiJeyIQLGMi+rIpRhUotjmF01oupvVEyRsNrXCG6gf1wU0jJoZgMdAiHzB5NPavnCFF0QZumCjYec5nF2W6joNtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+dfAsRs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+dfAsRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761237575; x=1792773575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SLdCIP7cLz03b55MQ0vX4PwOYiWsbcDhqGOkIVEqxzM=;
  b=Y+dfAsRs8xMBram7tLmfwYANB/aur2627vpWhsDUTlUzIMKjfDnfMT++
   TDTq1yeM2XAbXKGY57LmRVssHXZWDC0LHgqSMcLOHf/MJS+KnWFTqPFen
   67UayYl5+aOGcMFUELntI2wxQq3qg9RJyaOmwIIl87CMW/c/gluSTyizs
   5GYR3h6rycijc2WnvMwES87494G8uYygI6xejcpyQPi17G/ewd9iccOwR
   2V8TAITHClJfrj45fzwSyKBgeE/LUY679379OIlF6MlG0PrR36v14zSrZ
   JygpHC4cMauXdbbq15631LM7dYkfYMgTimSY/lpGG/2yaQcOfoJxYo0bK
   A==;
X-CSE-ConnectionGUID: 3ZmQ1dPFRGSzQI/xdG2R2g==
X-CSE-MsgGUID: cXHiEZbpQNaEsNoo3OOywA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74853224"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="74853224"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 09:39:35 -0700
X-CSE-ConnectionGUID: EsGoV46xT32LyzL8gxF7lQ==
X-CSE-MsgGUID: H+e7qMeoTVmylz3nwuJXKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="183377359"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2025 09:39:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vByLb-000DhE-2D;
	Thu, 23 Oct 2025 16:39:31 +0000
Date: Fri, 24 Oct 2025 00:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Raul E Rangel <rrangel@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: init/main.c:753:(.init.text+0x7a): relocation truncated to fit:
 R_ARC_S25W_PCREL against symbol `__st_r13_to_r16' defined in .text section
 in ../lib/gcc/arc-linux/8.5.0/libgcc.a(_millicodethunk_st.o)
Message-ID: <202510240036.dstaemZG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Raul,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43e9ad0c55a369ecc84a4788d06a8a6bfa634f1c
commit: 17b655759e83fd5e28931a0ece96fa9c2ab718e7 init: Don't proxy `console=` to earlycon
date:   1 year, 1 month ago
config: arc-randconfig-r061-20251023 (https://download.01.org/0day-ci/archive/20251024/202510240036.dstaemZG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240036.dstaemZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240036.dstaemZG-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `do_early_param':
>> init/main.c:753:(.init.text+0x7a): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r16' defined in .text section in ../lib/gcc/arc-linux/8.5.0/libgcc.a(_millicodethunk_st.o)


vim +753 init/main.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  749  
^1da177e4c3f415 Linus Torvalds    2005-04-16  750  /* Check for early params. */
ecc8617053e0a97 Luis R. Rodriguez 2015-03-30  751  static int __init do_early_param(char *param, char *val,
ecc8617053e0a97 Luis R. Rodriguez 2015-03-30  752  				 const char *unused, void *arg)
^1da177e4c3f415 Linus Torvalds    2005-04-16 @753  {
914dcaa84c53f2c Rusty Russell     2010-08-11  754  	const struct obs_kernel_param *p;
^1da177e4c3f415 Linus Torvalds    2005-04-16  755  
^1da177e4c3f415 Linus Torvalds    2005-04-16  756  	for (p = __setup_start; p < __setup_end; p++) {
17b655759e83fd5 Raul E Rangel     2024-09-11  757  		if (p->early && parameq(param, p->str)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  758  			if (p->setup_func(val) != 0)
ea676e846a8171b Andrew Morton     2013-04-29  759  				pr_warn("Malformed early option '%s'\n", param);
^1da177e4c3f415 Linus Torvalds    2005-04-16  760  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  761  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  762  	/* We accept everything at this stage. */
^1da177e4c3f415 Linus Torvalds    2005-04-16  763  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  764  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  765  

:::::: The code at line 753 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
