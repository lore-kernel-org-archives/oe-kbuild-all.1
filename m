Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E71F32F757
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141377; cv=none; b=LNwnMJlbb3O31caCgsXRtAee3GD3nNCdTs6STjGwO8zgdtcVSDRk8tyqRTjcNVLsND+QuinFeKt2lqz/Cf2ocCJfDAE0oYVFfds8i3Ox9ojJHBuRd5nern7naIi/5p4yhyOLYernYKA4vUOi6nrFFzVlyBEyox7NQ62LPl47zLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141377; c=relaxed/simple;
	bh=fS/NwUutGzK7crUaBEdm/1lUvDf7wh1eyOGvnHKRPy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AiqUuFNvhNJ32t60+3fJhCBrNTGJUArCwNpjdE3qm6tQ8D482I08wz8riV1UlGCKvaMiU3lfuRerXEOYuY3J1Hiu6kbYcubJD4CHG5NY3mDXoByi5/2q5BYVeymQryHdXDticWj+Ff34m1mOYAkxOX/5Wbzp4tIcSxX+K4X13Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZaiUB+g; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZaiUB+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782141375; x=1813677375;
  h=date:from:to:cc:subject:message-id;
  bh=fS/NwUutGzK7crUaBEdm/1lUvDf7wh1eyOGvnHKRPy8=;
  b=CZaiUB+gdKS6t+vhQUSuEj7lcr/cX99xCLZfkqbbfdQKryEVeOaLU0xf
   AAaYGgkyaFjFJS+e20dnuriZhU9tj3ceW27XFvmiLCUkoNaA6/Qp7F/fE
   XmKldv624dWb4rdgijPUe/SZy4D+yh4seLBGzfiiNEK0lSlKAKlNt9aGr
   /2t7sU4Srm2Xw/jc0pgKmq3FHJvUQmz7AjQ9yz14cp1lcFpRaXKjNQOjN
   lJb+JJQz1rSJr3LqLrowqBRuEHLSoleICMH3ZUoY17QNFTigmnVXUzMy2
   U0GJZ2w3wCqZtqXUlK0TQo7b2DeWkGszXoWeAchHZWiPe66rZvYhE+8gh
   g==;
X-CSE-ConnectionGUID: oeBr6TmlR4+mLux1FqVxFw==
X-CSE-MsgGUID: 1AJ3RdSnRfGN81YAEq2WcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93469000"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93469000"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 08:16:13 -0700
X-CSE-ConnectionGUID: X3nC5TRdRBqzcB2i/LJggw==
X-CSE-MsgGUID: iu2LLQKgTAe4EErstVr2JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="272953560"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jun 2026 08:16:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbgNe-000000001Nb-0Ic0;
	Mon, 22 Jun 2026 15:16:10 +0000
Date: Mon, 22 Jun 2026 23:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 11/47] Warning:
 fs/smb/server/oplock.c:1477 function parameter 'send_interim' not described
 in '__smb_break_all_levII_oplock'
Message-ID: <202606222341.pmxkMUP8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   e8683c3fba9d37761fcfb08ab47017e7cc7ca665
commit: 21dfdc00941832fcaeb98bf583b7c7fd92995727 [11/47] ksmbd: chain pending lease breaks before waking waiters
config: x86_64-randconfig-003-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222341.pmxkMUP8-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222341.pmxkMUP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222341.pmxkMUP8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/oplock.c:1477 function parameter 'send_interim' not described in '__smb_break_all_levII_oplock'
>> Warning: fs/smb/server/oplock.c:1477 expecting prototype for smb_break_all_levII_oplock(). Prototype was for __smb_break_all_levII_oplock() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
