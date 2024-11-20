Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7089158D6A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732099298; cv=none; b=qYLMKOeBNIOIABvTJX+Y50mq6CDZxZbw5zttK6lnSwTsbhZSFDWzjBCbwqSO381SZKGFsuhZiph/CoRgVvO4vY8PQ9qz2PdGo4kMzrVUi417j9rTyurJ1HUSdOmayWV/zrdv5EE5DuGAiw31Bs20oFKWshTX8r3EXga6TMlWPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732099298; c=relaxed/simple;
	bh=LOenyyqoA2IfpxK81VDsd4wHXC6xRohj80lNgJgnuVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lboP2EDwoK2E+SyLrtpwcQwIqIFoxi/dDJ/Yyf96pQKqJF//qLIV2u1zds/ncdH8BociB0nZbaPc0YtPGC/KkI06zHH9mPPsGn3dIQmYCZCWVREUNC0e6tSmCLy5eNsIz1gH80eGuCiFCpqb8suJa6Lt94H4MK4QIt9V4ekxFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbbTjLvH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbbTjLvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732099296; x=1763635296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOenyyqoA2IfpxK81VDsd4wHXC6xRohj80lNgJgnuVQ=;
  b=VbbTjLvHsLr02EcwGm+I5TtKSHrtjqbvfvpkaoJohYFgloviw7QBdkY6
   ilxOFMZEu1Dyvkb7wauN2XaTsYcGTcaLxJ9D9hpJjOydcQ4NJ2CYtzRbd
   g0c6iryErQNJMxOIMyeyiEKF1Uu3ELV5Uxzc+lVcLP34lcMZV89JUVpa7
   GinJOYEANAWhrtk3DSipD63NsEHrMUHGa+gNC8mc/weDfhOumK/gFi2oH
   bETTxe0C3sMwCOWILeFnuywxwNgQE4PGAuZpayzk63O8OQfOTJdsJuFwf
   AzKB/urCdAdO7AOW8xtvFLUTPInWl+RPOoIS2swB6qWwz2OwyTJ+NTIPQ
   A==;
X-CSE-ConnectionGUID: nQLrWo1dRqaeUJJ1z+Z4JA==
X-CSE-MsgGUID: NJ5PVG4NTIO2hxNLLy0KQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43216798"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="43216798"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 02:41:35 -0800
X-CSE-ConnectionGUID: hRN2YJ/EQtWmPAHjfZOpDQ==
X-CSE-MsgGUID: jjMaX42+SPyOtwZVgTSJCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="94687863"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2024 02:41:33 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDi9L-0000m5-0E;
	Wed, 20 Nov 2024 10:41:31 +0000
Date: Wed, 20 Nov 2024 18:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wei Li <liwei391@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2421/2421] net/netfilter/nft_set_pipapo.o:
 warning: objtool: nft_pipapo_remove()+0x166b: unreachable instruction
Message-ID: <202411201853.6hew7upQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bf0212daf6239e1b0e65e6dd7ee9fdec378c5dd4
commit: 6da9c2b3be7f43cb2dc8c55be00b80bcdc27dba1 [2421/2421] netfilter: nft_set_pipapo: do not free live element
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241120/202411201853.6hew7upQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201853.6hew7upQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201853.6hew7upQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_set_pipapo.o: warning: objtool: nft_pipapo_remove()+0x166b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
