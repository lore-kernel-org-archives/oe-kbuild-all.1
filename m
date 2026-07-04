Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D1233134
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 03:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783134246; cv=none; b=ssg1cIOwaoCCBePOeN7QH6tTJons0o0w6gns34tMXcg3O7+ZU6S8bChTJ8N+iord5I0VURD9tSaHB+VXjRU1xEbOAmxlAJU/4ye1gKc4N+JYeCjVuXSy1KagK1neFCi9kWUpqzjd6jgSCavPkZ5fRLtbAThwZCB7G6tCr6Ux1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783134246; c=relaxed/simple;
	bh=8Oqv0B82jF8RtcX7Zipr4qB9nU+Shg/TKsETMTCN4Ig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QgYas78CuwQIlvCjpxoCTtwbNKMcyV8/+OaXVs3Zm2X9F8ROPrXnZJNOl0mUtF6MDU7HSFEIUu4Lk0hTQUTVhaLjh7E79uQZ14t6CF34XREovC4AeAaKyn49kDNSAsNslGiGKy4MfA0QAA8fFIjS6300BwT0MU5hi9gnQE+jiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Izbbh/PB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Izbbh/PB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783134244; x=1814670244;
  h=date:from:to:cc:subject:message-id;
  bh=8Oqv0B82jF8RtcX7Zipr4qB9nU+Shg/TKsETMTCN4Ig=;
  b=Izbbh/PBojwFwS5QitBWU84iiC1ESt5o2X514lQNco/dG1gy6TyLXRtv
   z+IWiP9jW5aePjMx6Rb5nhSJpK4VFEzW1CgX+SqRNUODfPR9nNiweuZfT
   EdlzA6fXqplccROccqcc/HKt+ttTUMGsV92HGCoEzxtj/BAwO5PQU/XOG
   majw90zQgehNED92d5PAmby3Eg16Xo9n3r43KUk4oICVY2PY3aJaJRyJb
   itrm1t+GLcrh+Mx7lMWr1w6nswseINphz82vCvN47YyaRz52JKhhb61Zi
   y9LYmmobdeo5mEP9UH1nbW3b7xHn8JevRKOuXsYpp2t/t2bSqDjkZ1Qsa
   g==;
X-CSE-ConnectionGUID: rxQVdevUTz6SY/u+Vfs9qg==
X-CSE-MsgGUID: Q4E9kOFjQgqAdzyEP3F4Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83919079"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83919079"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 20:04:03 -0700
X-CSE-ConnectionGUID: DmPMKv9GQSqKp7SkJLNIdA==
X-CSE-MsgGUID: y3gX2JgURZqgj3HusBtvUw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jul 2026 20:03:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfqfD-00000000CnT-0Cx9;
	Sat, 04 Jul 2026 03:03:31 +0000
Date: Sat, 04 Jul 2026 11:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 12/13] fault.c:undefined
 reference to `set_pgd'
Message-ID: <202607041124.mWJgU4Ws-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   898b37f4865d94ff198bb62dfe2517a6d1b7d44e
commit: 262ccde2d8b41adf4ccff70b6fb199f3a3b67882 [12/13] mm/pgtable: stop allowing to call folded set_pgd/set_p4d/set_pud
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260704/202607041124.mWJgU4Ws-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041124.mWJgU4Ws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041124.mWJgU4Ws-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: arch/nios2/mm/fault.o: in function `do_page_fault':
>> fault.c:(.text+0x2f4): undefined reference to `set_pgd'
>> fault.c:(.text+0x2f4): relocation truncated to fit: R_NIOS2_CALL26 against `set_pgd'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
