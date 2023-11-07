Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E82F840
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwqobgML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699393769; x=1730929769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gyOA9b9Ftz+Yvs6e4ueOWK6bXtXqRFm64TgsmoAM2aM=;
  b=dwqobgMLGVPRVbFcew0OkBlznw4+70xRxUMu9CP/zhEbjcQw+ArRhLjK
   bCY61oiSuVyEqbdGQrcLZqAU9MWQPGChZY0DmgowcVoBWckT5KQBK6/9G
   inUSuZu9zzG6mJulkAUUZ/xdtsHmvAM837rn8RJIcLTsRcB0NYzYV6LhZ
   OCdSBQAww+QLP0LTO5sCdkNBWAxSToTMa+k0eR0LI1gbkdtPYLk84qQ/y
   0BW7JhFkmsOUBsf3C9D7zFO9nalIiNl5162YbTQN6X8TRgWS7F5wE5k2c
   VnrFVyTYe7ERcFBZCsa1cUKKp3t1y/DcFKFlVLTgt+pQo5dYkVLmS56X7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393552981"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="393552981"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 13:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="936297171"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="936297171"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Nov 2023 13:49:27 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Twr-0007PW-0W;
	Tue, 07 Nov 2023 21:49:25 +0000
Date: Wed, 8 Nov 2023 05:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 3/3] core.c:undefined reference to
 `perf_callchain_user_deferred'
Message-ID: <202311080432.tT01kP8f-lkp@intel.com>
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
config: powerpc-randconfig-001-20231108 (https://download.01.org/0day-ci/archive/20231108/202311080432.tT01kP8f-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080432.tT01kP8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080432.tT01kP8f-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/powerpc/perf/callchain.c:104:1: warning: no previous prototype for 'perf_callchain_user' [-Wmissing-prototypes]
     104 | perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
         | ^~~~~~~~~~~~~~~~~~~
--
   powerpc-linux-ld: kernel/events/core.o: in function `perf_callchain_deferred':
>> core.c:(.text+0x142f0): undefined reference to `perf_callchain_user_deferred'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
