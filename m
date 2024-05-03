Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC42C694
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714769401; cv=none; b=SHuhBFEffzBVOWtih/uI7tyImmYQlsvdZJoSjov8HF0wFGB2i20qUSZtLwnrPeepsurAm2E3lvZwWQVqU3zw4rKunCJX4cAiWuDyecpupaGqcPk+pTbQ3sD+hE8lxjekyXkrj491eq+6JMwJaPp5r/WntMVXiGvzX+NDGXZ7j68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714769401; c=relaxed/simple;
	bh=8A1J+v3Sl40PHv8hn9n6MaX//n8l8lX7kb54mev8ywI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NweToN9hxvYGXP2kZj30ye67tFf7xEV6BZfySR7P8Sst8HztNFVindFah/UozQxYBGBd4Or96bfrUoxP3Hms++jXd4ltBTYKSYLydDTloot2Oxmvkt7f4DfEVxv8G6qa8GbJVZmhqZs1QfuhMcOMBxgjoTYcYyJrxd1mNsP8dAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHg/Mf6g; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHg/Mf6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714769401; x=1746305401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8A1J+v3Sl40PHv8hn9n6MaX//n8l8lX7kb54mev8ywI=;
  b=UHg/Mf6gibBws9RDGdmPAGavSAXiXdMqVQEb/t5qREQVkW448LNg2OwR
   4TaBhTy7xYP+jAvY7kk5cy2NaIN+nLQohUISGHXr6AswxtSRF0qgcUhCQ
   VWA3oMWNRlqthXMtMH+f6ChUkILn0FH8DODPkgjUHDNUgR/JXAzxEnAHK
   SlEsh4ITsWdTHyPyCFFWctZ/wxmg2BfYt/vSnj9o8zIRzsCrjfzD75GbQ
   GhSqDoOStIFQaI/Px6l0vyYKwoaoyDFDk4kR40uX1maN6xs6AHZGAkmdd
   C2R8uKfddDR6JG0MoiMS85IHZmghHpVpkXp0oXOxXoEHJbtUeDA/MFZI9
   w==;
X-CSE-ConnectionGUID: C+LcEUWtQmePOtvGKnPR1A==
X-CSE-MsgGUID: I7GsuAXhS+KluO6BkxQTVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21743486"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21743486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 13:50:00 -0700
X-CSE-ConnectionGUID: +alliK5sTS+25cOwDGbRFA==
X-CSE-MsgGUID: ZTQSQ/PORuWNgFsuf/RpaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32033789"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 May 2024 13:49:58 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2zqu-000C5k-0g;
	Fri, 03 May 2024 20:49:56 +0000
Date: Sat, 4 May 2024 04:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:wip/v6.9-rc2/unsigned-overflow-sanitizer 17/109]
 scripts/dtc/dtc-parser.tab.c:1722:100: error: 'U64_MAX' undeclared; did you
 mean 'UINT64_MAX'?
Message-ID: <202405040449.t1TndXVf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git wip/v6.9-rc2/unsigned-overflow-sanitizer
head:   4eae48ae0df1d1feb751f794fa8495093e36168d
commit: d0c36bbdfb493729602e1289311015307b7457e8 [17/109] treewide: negative unsigned constant -1ULL: use U64_MAX
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240504/202405040449.t1TndXVf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040449.t1TndXVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040449.t1TndXVf-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/dtc/dtc-parser.tab.c: In function 'yyparse':
>> scripts/dtc/dtc-parser.tab.c:1722:100: error: 'U64_MAX' undeclared (first use in this function); did you mean 'UINT64_MAX'?
    1722 |                                 if (((yyvsp[0].integer) > mask) && (((yyvsp[0].integer) | mask) != U64_MAX)) {
         |                                                                                                    ^~~~~~~
         |                                                                                                    UINT64_MAX
   scripts/dtc/dtc-parser.tab.c:1722:100: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.host:133: scripts/dtc/dtc-parser.tab.o] Error 1
   make[3]: Target 'scripts/dtc/' not remade because of errors.
   make[2]: *** [Makefile:1422: scripts_dtc] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
