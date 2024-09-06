Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCA31552FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725625034; cv=none; b=tgB9YN720rv5FLLNlMEH5P2grJAnwbKKFDT5+W3Ysf7idpf//zU3gIC+DBfAK6gusdKrcA4d1b7TxG/uaU+vWNsP/KBwIRMZjT3NJSRaLJ+X69UGuyLlrYtzgc1DkJU0ZJUedcF5APc6/Aeggg+cNLtMOX2QI6esSAR3Ad+Ag4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725625034; c=relaxed/simple;
	bh=+Qx4z5FNs7SHBiPalSVFSCl7p9NSu6qf9umFOCaZvA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iehqby856kYCgT8WixvgsSxI/Y5EtsbIqLKIYekXFJzQgdqRJN82S4eyX14I11rHMSGqOxCpstc+F51Q0lVnkI+RGrasm36nl8NrF56dVBO4Zlembp9Xs68uNt2RmPeuKJrPriow47OkzVUjQtkO0ki/huvBR/IIRnHxTppf4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyC0cktZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyC0cktZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725625032; x=1757161032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Qx4z5FNs7SHBiPalSVFSCl7p9NSu6qf9umFOCaZvA8=;
  b=TyC0cktZxu0IoufPNby5UHl14cC9YVRNT9/Xgo8TvKb+iuR4mknedg0p
   uG+N98NbbyJ+0A2DQk7HExwxmytadOKnAbItC3nRT/TKJeJRp+NQWeXYO
   OCxKMTf0G50kO2B3iPSSW+R0Z9Omb4HkVXKL2MxrB+HWZH+ZmNmujkxUN
   06mRZDQm7++1hxIUFCoW5q3Eakh/zV+m58TkdeCuO6lenW2KBQZ1Sl748
   hoSjamrgrywGhMoSCCDayRFINWQFf/bRzZ/629gPBCLHH0Bh1wNxGVQHm
   s+fEBAoYUYWu8lmgPy0IaGOaq1lMnSaqWK7kYjdCrzp5u5+uDBQ5yHOFH
   g==;
X-CSE-ConnectionGUID: ocbMc8qtR3a56VxxCmk41g==
X-CSE-MsgGUID: 5pt8vt4AQbi2dq28IlaSHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28130053"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="28130053"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 05:17:11 -0700
X-CSE-ConnectionGUID: 2s0dMdOKQhuCdhQ19s4qSA==
X-CSE-MsgGUID: U/fhRrS5RjeJa343gnjBCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70733574"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2024 05:17:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smXtk-000BAW-0a;
	Fri, 06 Sep 2024 12:17:08 +0000
Date: Fri, 6 Sep 2024 20:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: error: ABI 'o32' is not supported on CPU 'mips3'
Message-ID: <202409062003.wDQ7fEq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b831f83e40a24f07c8dcba5be408d93beedc820f
commit: bfc0a330c1b4526b88f6f9e711484b342cb00fb5 MIPS: Fallback CPU -march flag to ISA level if unsupported
date:   7 months ago
config: mips-randconfig-r111-20240906 (https://download.01.org/0day-ci/archive/20240906/202409062003.wDQ7fEq1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240906/202409062003.wDQ7fEq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409062003.wDQ7fEq1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: ABI 'o32' is not supported on CPU 'mips3'
>> error: ABI 'o32' is not supported on CPU 'mips3'
>> error: ABI 'o32' is not supported on CPU 'mips3'
   make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: *** [scripts/Makefile.build:243: scripts/mod/empty.o] Error 1
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
