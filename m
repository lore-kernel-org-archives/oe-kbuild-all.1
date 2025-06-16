Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022D360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 00:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750032657; cv=none; b=TTta6R//sgaeQJiEo7YB8+9d0IHkZC8vgcOy82SEMq2hJ42kgb0t8pTvaeEJqzbCRvWoZgidYWUftfFMxJOisIhqfn44thNYWS3IYjYyEDEJOVqi5nteICkA0Gt6cWLOPexsHdPwoBosxCPVlyoGlaU4vyJ19QqnR8hBhuj/65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750032657; c=relaxed/simple;
	bh=JSmfgmR0OL8X031V7DujK98fPs6IEwPQV2kEgL+al5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z9vX8syIwUDAaQBJc4Ch/uvvqd830tb5OiISEp6nhQe3uKDSJyQQCLdGN+jFbLOnbZWqkjtOzfoC5MtDMXNw5E+QER4wjq+DAP3hiSucT0ezAz65jiXXGR799qopqbLbF1F6Ofek1IRRrQU9QoNxE/8gyutOk1Uz8RASvXUOht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kjc/p5fw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kjc/p5fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750032656; x=1781568656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JSmfgmR0OL8X031V7DujK98fPs6IEwPQV2kEgL+al5Y=;
  b=Kjc/p5fwmfOUynwN9yVfad4TAtx7PJKdczewg3EG0KWgxP2ODWW/2vLP
   FladCn5SNBS+4IphPYlCGZZoLCknLq3hVB6OTt9mGBkopX4ZzL170Z5RO
   lUqh+Sn+jAzRpwVe+n1D+/6MtIld9GQX1bbtPBpoY2ZWx1m/y4M1i8yEn
   Y1pJso3VAmEcNnFXTXClW3ua57O4yKDLSSXtZMJkW8sHQNPf9wR+cMW8E
   G/GZxXonvPyboVVk82uqlpTCuVUDYmE+nqXzkkvmTH404Rwruf7HqSgBk
   MC+DmDmUsim8MvjOfqx+3lbi6k4Rr4HbZtO9bpLgjrdpsZZpcSBbVE0G6
   A==;
X-CSE-ConnectionGUID: HWwYN7GPRBezi7v4x6uPLg==
X-CSE-MsgGUID: sbNiU6J2QEaDmsFL6Vfvdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63198035"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="63198035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 17:10:55 -0700
X-CSE-ConnectionGUID: 4GZmtW4nSJ620UCEnmezhw==
X-CSE-MsgGUID: zJtTZ4dwTFC/2zHrPrxcXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="149228086"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jun 2025 17:10:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQxR6-000Ebg-0F;
	Mon, 16 Jun 2025 00:10:52 +0000
Date: Mon, 16 Jun 2025 08:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:cryptobench 1/1] crypto/benchmark.c:108:33: error: 'n'
 undeclared
Message-ID: <202506160848.ODQSldSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git cryptobench
head:   25680a40609c1c6512beb09b493ed7fe75f2c7ef
commit: 25680a40609c1c6512beb09b493ed7fe75f2c7ef [1/1] [TESTING, DO NOT MERGE] crypto - add benchmark and testing module
config: s390-randconfig-001-20250616 (https://download.01.org/0day-ci/archive/20250616/202506160848.ODQSldSy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506160848.ODQSldSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506160848.ODQSldSy-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/benchmark.c: In function 'cryptobench_cancel':
>> crypto/benchmark.c:108:33: error: 'n' undeclared (first use in this function)
     108 |         if (atomic_sub_and_test(n, &cryptobench_async_remaining))
         |                                 ^
   crypto/benchmark.c:108:33: note: each undeclared identifier is reported only once for each function it appears in


vim +/n +108 crypto/benchmark.c

   105	
   106	static void cryptobench_cancel(int remaining)
   107	{
 > 108		if (atomic_sub_and_test(n, &cryptobench_async_remaining))
   109			complete(&cryptobench_async_completion);
   110		wait_for_completion(&cryptobench_async_completion);
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
