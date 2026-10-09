Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727F37F8BD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516494; cv=none; b=EmhTnOcz8UofzhtqDKx98mSF2yohDdjXqDvRJ0Nkn8sm8zfyt1nNzY4d1c2yr4k8RI9yvkfIHAQD0MRvo62exJ9XOxTmfSemD2OpywCHTZ7hpYUlZxk3ANSeSrxcd7UZV0d5jLusCDtCK1hojzXVa5UKrCcDKRmSF0C1H6/5DEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516494; c=relaxed/simple;
	bh=3BVXrJKvzPi4CT/6cyxD7NnzRKKzk2o0o0gZweiLAvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cMq8ieLIzaHcWgYas93ONmysnRSB+W5vh0xLgsZwP7y1xMV7JZjZisaNWTJTkVjE33Sv2Jp4e2Yu7230AwB1XfWVdUSCH5JWs+EMs2LJJCZV/iVaApB39kZQjKG+PHGft2szVcQc/5ual000/byXgDLdPz7Jm+BcBDftFAMoCQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXUpgA6a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXUpgA6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791516481; x=1823052481;
  h=date:from:to:cc:subject:message-id;
  bh=3BVXrJKvzPi4CT/6cyxD7NnzRKKzk2o0o0gZweiLAvA=;
  b=EXUpgA6aFT+oxBbGo10K2fwQt9rTniK94J3EFu1TgHXV0BcfRhPdnWrj
   PiXXJ+CHPdo2+UWUcL+oWo4FA2Fs6kjNhvmsRWGPr0NYKFJnnWfDklbfy
   gR4Mj/0dbTrVMHmnVJF+ZI8dWE00ZNbRNNM9F3qlUH0KB9f2l7FYUbIr8
   sHpjYOR3XWl1L+Y3Ig0a5RtDfeDyastJYlsfW8aynPrehab8qPVK023+l
   sLLu9XV/t6kpBpc/MvfswwJOAzOReOhzPl2kgs087GcDZcmkTC44glFQ/
   pdPNW/vW4eP4qxVMXoLvE8mxK69K1XIdqyT5UJly/dGxER+VDp7AB6lx4
   w==;
X-CSE-ConnectionGUID: k2m4K9BNRTG1YTp3hHXvOQ==
X-CSE-MsgGUID: 9RLZZgvJRHmYxvYT/95ZxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="211396"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="211396"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 20:27:43 -0700
X-CSE-ConnectionGUID: 6CZ+xB3KTIalsdnbyjEKJA==
X-CSE-MsgGUID: eh+AKuKZRJqIdbEvIVeUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="199897"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Oct 2026 20:27:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF1Gl-000000006d5-24d1;
	Fri, 09 Oct 2026 03:27:39 +0000
Date: Fri, 09 Oct 2026 05:27:23 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 27/44] ld.lld: error: undefined symbol:
 tcp_xdp_disconnect
Message-ID: <202610090508.MAxEcr1n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   82fde2d34c9c284bba8b2df97ac7f7ab34719853
commit: dad071b9c79760e60327587237f9b9225b5c949d [27/44] tcp: Send a served connection's segments on a lean path of their own
config: powerpc64-randconfig-r2102-20261009 (https://download.01.org/0day-ci/archive/20261009/202610090508.MAxEcr1n-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 63d485c3ddee18e2838ba7235a4c519eb8fe08b9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090508.MAxEcr1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090508.MAxEcr1n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tcp_xdp_disconnect
   >>> referenced by tcp.c:3445 (net/ipv4/tcp.c:3445)
   >>>               net/ipv4/tcp.o:(tcp_disconnect) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
