Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7402F843
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 21:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8NuBFRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699393775; x=1730929775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TDaA+zg/4Ucns2sd7Qq8Fs9bl3UF9pzIYPDJZm9y0qo=;
  b=L8NuBFRqMGgz5fRHhDFjofLmaRS9OLr4VZwQA/vCV7lafwavBj5kMBG/
   0UlFZpZfFPu3eURXD2z+luX2z50RPN1+yVqlOGknYIPLfE3rp2J4Xs0aM
   reu52yQAAIOQohL10znBdDDNf5PDzeowHTl97IzGX2GeCMkiIP8aAtSYu
   n4YlCmRQgWt566ktzZ8coIdlLVLpgY0r4meW6nq3znsB/ZcCAu5CKlM9O
   ObNx8HtDb201/sVKavjt+9KK0EeOqSYeNE8ALNpBDrkKFp/i7L4tGFbGg
   pPUdCKhlDhndIwncHVF1IIPyBTWt5M5UysQ5uovKW3NdOgFV6SiFSJtdD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393552995"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="393552995"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 13:49:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="936297187"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="936297187"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Nov 2023 13:49:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Tww-0007Pf-1M;
	Tue, 07 Nov 2023 21:49:30 +0000
Date: Wed, 8 Nov 2023 05:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 3/3] arch/arc/kernel/perf_event.c:248:6: warning:
 no previous prototype for 'perf_callchain_user'
Message-ID: <202311080430.BezJSkVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   31b014690f119ab819b20786a567f66715bce1a4
commit: 31b014690f119ab819b20786a567f66715bce1a4 [3/3] todo
config: arc-randconfig-002-20231108 (https://download.01.org/0day-ci/archive/20231108/202311080430.BezJSkVJ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080430.BezJSkVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080430.BezJSkVJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arc/kernel/perf_event.c:248:6: warning: no previous prototype for 'perf_callchain_user' [-Wmissing-prototypes]
     248 | void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
         |      ^~~~~~~~~~~~~~~~~~~


vim +/perf_callchain_user +248 arch/arc/kernel/perf_event.c

389e3160b9b000 Vineet Gupta    2013-11-12  247  
14f81a91ad29a5 Eugeniy Paltsev 2018-12-13 @248  void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
14f81a91ad29a5 Eugeniy Paltsev 2018-12-13  249  			 struct pt_regs *regs)
22f6b899125063 Vineet Gupta    2013-07-12  250  {
22f6b899125063 Vineet Gupta    2013-07-12  251  	/*
22f6b899125063 Vineet Gupta    2013-07-12  252  	 * User stack can't be unwound trivially with kernel dwarf unwinder
22f6b899125063 Vineet Gupta    2013-07-12  253  	 * So for now just record the user PC
22f6b899125063 Vineet Gupta    2013-07-12  254  	 */
22f6b899125063 Vineet Gupta    2013-07-12  255  	perf_callchain_store(entry, instruction_pointer(regs));
22f6b899125063 Vineet Gupta    2013-07-12  256  }
22f6b899125063 Vineet Gupta    2013-07-12  257  

:::::: The code at line 248 was first introduced by commit
:::::: 14f81a91ad29a57d6c3cf123ad9489f2ca9133fb ARC: perf: trivial code cleanup

:::::: TO: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
