Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646EB346FCF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 03:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770781334; cv=none; b=RZyQI2zEDJ1DKxbe1I0ZknTY3aHuFNNMtwNDFWkGbsadVAUdw8eLMlRX7BIaZPgPXsJdREO4QlvzOSCiPdISdntKbo8P1sec6BS1YwNT8x7gi5HBdVn96YNMpCUP8jnq1czDIm5lR4hG+iUsSMnXsHajkAyMzVOBc/KxTKWD1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770781334; c=relaxed/simple;
	bh=9CtZZPb1SuB4ZZdJNEnouEw1FmPTXoiE9LSEcBKtfBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uo6vmXtmRvqTEN2gN3rRhc4ovOsQN9yG4hs7ay6Ie8bEf8bP4y6Z1NNbLO95pTfCmgb+B5dYvThiq8An1a8h/MdUr0TycYZT0AS6enUnrhuHtT/F8WQtEusLFv10G7rim5vLgA9uu/e2agvNGK1m5vyI69tQsq4jRnDDWEzhHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeB0ot9F; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeB0ot9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770781333; x=1802317333;
  h=date:from:to:cc:subject:message-id;
  bh=9CtZZPb1SuB4ZZdJNEnouEw1FmPTXoiE9LSEcBKtfBU=;
  b=EeB0ot9FtHp5cH+ZRi/vIZKec1zOVVumCxLFbKE7SktD3/73e4so/pEW
   6fK/bNNvHvUVCaODGqVw+9rviYUlKtF9HYRZa6B20KyhjzGPYVzPMJvIc
   5aDcjSAd3uKcTM2JgujseFA8ZWz2zinkWv3pNyT9leQJkqREWfpri2U3T
   cVgcMXvSsdvLz9TAOqlmIMGZHKSKOyOMotiwD0xiXBksHlf5OytVqlMTm
   SyZGwuIpGcywrc+x3ihtlQo7axcEdtMKiHUv33RIxYH9t6y3th2oTiVl7
   stKVrYL+T5SDV+rw732jl7Zttb8aoJLwsDM0vXtqucMY8p+tyFlG3W+lP
   A==;
X-CSE-ConnectionGUID: uVgcv7TyQL+adYgiahZK1Q==
X-CSE-MsgGUID: 8Xoc7kDPTQy+KgL8wYsN9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94562211"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94562211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 19:42:13 -0800
X-CSE-ConnectionGUID: c3rm6enxRfSjwPwyqWlQYA==
X-CSE-MsgGUID: m+D82JdLRe6rl+udla73Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212213047"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2026 19:42:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq17A-00000000pe1-2zxS;
	Wed, 11 Feb 2026 03:42:08 +0000
Date: Wed, 11 Feb 2026 11:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 13/24] filecache.c:undefined reference to
 `nfsd_handle_dir_event'
Message-ID: <202602111158.fDoQAUGN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   ab82ce180a346bc50223092e6d94b2aa7c863322
commit: a0638944d0de668162a22ef2e5e5723df61e1112 [13/24] nfsd: add notification handlers for dir events
config: sh-titan_defconfig (https://download.01.org/0day-ci/archive/20260211/202602111158.fDoQAUGN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111158.fDoQAUGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111158.fDoQAUGN-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/nfsd/filecache.o: in function `nfsd_dir_fsnotify_handle_event':
>> filecache.c:(.text+0x24c): undefined reference to `nfsd_handle_dir_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
