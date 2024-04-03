Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F76014E2E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712160905; cv=none; b=EalNAXUaSVgvQ3IFkhFTl7ahCozejDfcHKeK+Iqrw2bgy2JWrIiT/Go/PH9VyrkETgYu0uOi2rOpyzBnlmU/QiaH4hB5hgeK/6dTVpvUTiMelW9mHyVI8bGKhBtyITsBP020/loQDeNpNjA4hDzd7OwAeYMrDBAs1zvKpF5bC3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712160905; c=relaxed/simple;
	bh=LDjp6Z5BFohqAiVYHTSsrgpmeRh1FXnyiGUh9c7GEN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1G2Zmbb9+XXtXdJSbrBrOuA3MSDjnu2Lh1WR8uJ57Xo36+xXm+fOL7Zdc+1ZzaTT8Lakee8OlV9DDDMxqM33lrD8gMC2heWoCSn2lqjtwdx8pPEnDP7J8p2Z+VztJ1YVMO+iBBN3jhR30mGDDhdk6HS9U37/Tl0u5YKHN5DEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQMax3MZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQMax3MZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712160903; x=1743696903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDjp6Z5BFohqAiVYHTSsrgpmeRh1FXnyiGUh9c7GEN8=;
  b=AQMax3MZQUIa4Nw8iVK3fE7XOuQF3gx2DqOlDKRyFHXcK8U6gpUTyFb3
   qAoh6wuyWtYOF1M33jU5/95OpJdY9QpUTHxxLjzUfpPg2w9P4XEJNIDf/
   iC2K/M3+r60kX21zgc31oZUjN+rJrf77EDNooq4i+UzwHov8CJW5VEhnT
   uz3UdQnQM4eQdczPhhjVXj3ZOwkgIn5/7H0YNQ5bC9vjne9oUjEEiXhsb
   p/FobcAHvmkHUs4lPqj+zMJIuhpnXH8uSgrPFxR7C64ftSWl4UnrjXS+A
   2KY9FV1w2NOfnD+unItAuJEETgmLC5MGpjehIScEmra7UU36r5eY7IT1d
   A==;
X-CSE-ConnectionGUID: FOGuQv27Tq+Pq52s0Y9FPg==
X-CSE-MsgGUID: yytnVGKoQuuYJRQ+XN6dlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7984466"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7984466"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 09:15:02 -0700
X-CSE-ConnectionGUID: /yaK5lAWS22WuGwPE00INA==
X-CSE-MsgGUID: s89f4S3fRlKbmu9fISk+2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="19083367"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Apr 2024 09:15:01 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs3GM-00001q-2u;
	Wed, 03 Apr 2024 16:14:58 +0000
Date: Thu, 4 Apr 2024 00:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 37/50]
 fs/bcachefs/btree_update_interior.c:29:12: sparse: sparse: symbol
 'bch2_btree_update_modes' was not declared. Should it be static?
Message-ID: <202404040054.a5Wq0SAa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   8e260e1e84fc89a41d02db333f84044648385bed
commit: e0319af2b6cdfa7c39edf73dcb813b7ff1261fa5 [37/50] bcachefs: Improve bch2_btree_update_to_text()
config: x86_64-randconfig-122-20240403 (https://download.01.org/0day-ci/archive/20240404/202404040054.a5Wq0SAa-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040054.a5Wq0SAa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040054.a5Wq0SAa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree_update_interior.c: note: in included file:
   fs/bcachefs/bcachefs.h:1022:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/btree_update_interior.c:29:12: sparse: sparse: symbol 'bch2_btree_update_modes' was not declared. Should it be static?
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/btree_iter.h, fs/bcachefs/btree_update.h):
   fs/bcachefs/bset.h:229:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/bset.h:229:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1449:38: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/btree_iter.h, fs/bcachefs/btree_update.h):
   fs/bcachefs/bset.h:229:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/bset.h:229:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/bset.h:229:9: sparse: sparse: self-comparison always evaluates to false

vim +/bch2_btree_update_modes +29 fs/bcachefs/btree_update_interior.c

    28	
  > 29	const char * const bch2_btree_update_modes[] = {
    30	#define x(t) #t,
    31		BCH_WATERMARKS()
    32	#undef x
    33		NULL
    34	};
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
