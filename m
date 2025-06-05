Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063D1ACEDF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 05:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102923; cv=none; b=LKrf6qlVUVoTPNy7J+RCII99frrP42p3BJ5wIZ2cHT8HrKSNJ32n4Px/eU0td4PCrrnRVSky4NbN5yQ1EzcHCLHGu8nxD0RE21OFme5YnLtKTaFrKqmLvQK+VSfKy7YDQ+oNcP76LH+oX7nezGzWbGdTX2gyChMfU4QOzSKBh3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102923; c=relaxed/simple;
	bh=Xh4PY/23gIirVkg6KVn7T+RE70lyt9HZAMmzk4RdlT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6gwunXSOwyqouF9+m8iyJMiS/cS29RCeysg8vm7XcnwoXzf7hvuquFdno7ywSAmd/k0aGHNW1plsEf2HD2sMWKn/rgoukWtvDM8dk8/tnxGN8xJ2X232/3n/71WYPL+mjRbiPzdwxc0se+ZmmuwW1HSLuRmVfmzPoubl76ZZd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNAYmZsP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNAYmZsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749102921; x=1780638921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xh4PY/23gIirVkg6KVn7T+RE70lyt9HZAMmzk4RdlT8=;
  b=gNAYmZsP9xqh/g+OBQthvCUBeA9iFN7Y+bO75WKeyXuGQsCzTl+tokNz
   mRZho9fjNfp0uBzO+yctaXTdNq+qebgtIwQjjtmA7GHQpDipCu1MMaLGQ
   8FAKmF0BVffRfQS3sorujn3owi5q8PlTdBdPA4YaCgI+BtIPGwP1U7ZFV
   06fl4Fjs1QwwLzXqd03Rd7Q2p6h+vH3d2TvVkDJMIjp6XVFmCfHk+y62d
   QdYRqg7E4xTCPP34NtJZhPCcTNfm7rXmjoGrhXw7YVULtoNjaEYiLOLIi
   JbikPCttBO07PVbdbTW6VQ5JYuJK3lJ0SP0diddlUByFjkH1yuqortV/M
   w==;
X-CSE-ConnectionGUID: XaBxvajeRmWrXn8s9n6G2Q==
X-CSE-MsgGUID: 8FGzp2BMQV6nSGMU94ddMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54997378"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="54997378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 22:55:20 -0700
X-CSE-ConnectionGUID: xEIOfP3aRFeVAN/wJ1bM7g==
X-CSE-MsgGUID: lUELcfFARIe4sCRqpEAtVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="176352554"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2025 22:55:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN3ZM-0003ln-2I;
	Thu, 05 Jun 2025 05:55:16 +0000
Date: Thu, 5 Jun 2025 13:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2357/2357] arch/arm64/kernel/idle.c:54:1: sparse:
 sparse: symbol '__pcpu_scope_contexts' was not declared. Should it be
 static?
Message-ID: <202506051337.VIeB2SKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3160da23afe10e66040ac00ed17174cb467c79b3
commit: 7f2e02718bba28c9969b7f8d5d53301abab7f760 [2357/2357] arm64: entry: Support hardware xcall and xint
config: arm64-randconfig-r123-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051337.VIeB2SKc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051337.VIeB2SKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051337.VIeB2SKc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/idle.c:54:1: sparse: sparse: symbol '__pcpu_scope_contexts' was not declared. Should it be static?

vim +/__pcpu_scope_contexts +54 arch/arm64/kernel/idle.c

    53	
  > 54	DEFINE_PER_CPU_ALIGNED(struct arm_cpuidle_xcall_xint_context, contexts);
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
