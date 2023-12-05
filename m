Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41F692A8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHbhw7Xy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701810293; x=1733346293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flgsqdy+DtMGZh5CmHSQTJMVGlD8MpCJzZWuLR3x6dc=;
  b=kHbhw7XyVohhEmNtKxRjRU6LfVgmr8kJ2BecDBCHyMriaa1UbEBT/K1E
   j8LjYBdmPlVI30RCP6Ml5Id/z2ZHEymWQASV9ngg2d6EgIt6m+pbwOXgY
   h5nDNoQBNaerEOkZ0oxcLKgu5NP9oMO31W0m9NLMzCHPrne47CnNr+48P
   Cq/dKGBF5/9RXxyd4c3mIFPGXrVwp2OlNe5+Y+t9XtWPNKj4eZbg4DYHJ
   r983hvlpVAL4cCs/ba/PA32ebO2EDt3pmPg6tlgVW25iRYaAGoQXy58QU
   /m2LOl/rRBmXd7Ar4X8LxptBzahuvnGb3P/b+gHB1BswMBGPv6cWfpaSR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458275328"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="458275328"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:04:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800104496"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="800104496"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 13:04:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAcb3-0009jC-2F;
	Tue, 05 Dec 2023 21:04:49 +0000
Date: Wed, 6 Dec 2023 05:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chandan Babu R <chandanbabu@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chandanr:fix-xfs-538-deadlock 4/4] 0000-cover-letter.patch:
 warning: ignored by one of the .gitignore files
Message-ID: <202312060453.fymPBTDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/chandanr/linux fix-xfs-538-deadlock
head:   43e7ee8c4c71300dd32e97dd0bfd1d6e182220d6
commit: 43e7ee8c4c71300dd32e97dd0bfd1d6e182220d6 [4/4] Cover letter
config: m68k-randconfig-r071-20231205 (https://download.01.org/0day-ci/archive/20231206/202312060453.fymPBTDh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060453.fymPBTDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060453.fymPBTDh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> 0000-cover-letter.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
