Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D9158D6D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693798; cv=none; b=IlaZpM92F2sZYRC+2mcQpqfLGXzZfNz94HVaToTtzGkQBk3I9W13BVfQ8zCvhPMAd5fsbrrvlR31eDtKw/Ppf5/zDPTo5yyvaIhp/Kxdm/Opu1+Y0ly5xi2XuFy5NrDzgrCLapXCTyiyXsSlu8RBNqBzzuxhhCcm71xgdzvmJfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693798; c=relaxed/simple;
	bh=xLgi/0Ii4CNpvpkadATzALUKGDUyECn2vzUaJG09SM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyCPiW06FipCkVoLL3SdMBfvJdxND9HtajX9H0bHxljuUxKHa29Hdh3s383/S7iunmBvg1uWfOsN/OUELafhM9gd6M+ldrf0DLw8XAIuCxp78LGJl3oJJ1pm67Z+yNFUnadn+XBs0NUVj9Vko/vVyzR8u94EVaMtIf1PctZnffA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bi3NfvCd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bi3NfvCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720693797; x=1752229797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLgi/0Ii4CNpvpkadATzALUKGDUyECn2vzUaJG09SM8=;
  b=Bi3NfvCdOKyBbWa0Z24BhjE8GonJV6kKK/ctj+Q/Dis4XhaVJLUTpWUL
   IHgxjC4qSt11uddcCEcRcjZk6gcZ+CujKTQqzp/tJyjsMyIQg97+qE5vn
   QmuO0NbGv6o3U0SYSWOrlcQL5k0tLMmZA8BWNdLISeRQEjzRVZ4Edsf1T
   LhyY8gDlB2HrDH/p+48BY5CwPLY/yZmj3yk3E1qcW31v+zZ8fNg2Ppwtu
   fHxbLo/9so6Nh73z7I0BbPkje3f0UvwadWvwcnO0/HZUUCmL/gFRyT3k7
   XypEqMuIFxeFVMMdc7OLWpKeq+Bij6QFuvI5GrDHTw23fJ3KhQceGJKOP
   Q==;
X-CSE-ConnectionGUID: lbvZYrKSTc6Bxfh310PWjw==
X-CSE-MsgGUID: SdK6PXpJRO+zhr7cQGl+nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29467715"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="29467715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 03:29:21 -0700
X-CSE-ConnectionGUID: YA9xCeEMSVm7c7qGgEI59Q==
X-CSE-MsgGUID: ezwYpHuwTBKuHu55RQEpEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="86014963"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jul 2024 03:29:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRr37-000Z9j-1P;
	Thu, 11 Jul 2024 10:29:17 +0000
Date: Thu, 11 Jul 2024 18:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: error: unknown target CPU 'mips64r1'
Message-ID: <202407111851.LwDasTcp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9a2f29aefdadc86e450308ff056017a209c755
commit: e7a30874b348d23898f64545b4086edc0741d715 MIPS: BMIPS: Drop unnecessary assembler flag
date:   5 months ago
config: mips-randconfig-r052-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111851.LwDasTcp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111851.LwDasTcp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111851.LwDasTcp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'mips64r1'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> error: unknown target CPU 'mips64r1'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[3]: *** [scripts/Makefile.build:243: scripts/mod/empty.o] Error 1
>> error: unknown target CPU 'mips64r1'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1198: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
