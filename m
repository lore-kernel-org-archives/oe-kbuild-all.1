Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77853AB47E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787055650; cv=none; b=XANv5mWHF0h26iBFnXpZewbtLVyZCu0+awo8MOAMwnNrjlsqTsL67HESOI3iZo0RmfFEaiYbKtHCFNg/Spct/q77l53pFtvx4e6z1KhxRhi/gfzqKuZUa/y7GpZ2DNg+NVtChbIwBTP3YxKPiWond0SwHe/7YXuZY1pCXkmIAAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787055650; c=relaxed/simple;
	bh=gGeYfQReiySz86cjDhB4VC5IYHR5nSZt/Sm7nM400IQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ljeM/iFEyp7qEtqAy14s1270OiZMOiK6P/oQnR8XyUXvlQ+EfOJaMdyMwkl6D7Kl/kbTyr+0sSP853jb5hZeY6Akwqc+DBuGSTXKnDcVYk1ob5FxBkUQC/bKYm9wbbJUzpoG8mXVrGQ9ugNJDTXu/K5PR/XHOs1BozdEfHE1R7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNo2qrtZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNo2qrtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787055649; x=1818591649;
  h=date:from:to:cc:subject:message-id;
  bh=gGeYfQReiySz86cjDhB4VC5IYHR5nSZt/Sm7nM400IQ=;
  b=kNo2qrtZ9/CwZFOyOSlbka084YwFqYpnW66QRC0jemHVDpvLeY9E6UCO
   a4ZZAw0kR0edGHCVuN1mDbOymSIdhV0hPW64iRxc7zx4hGljUwasWxYN5
   /j2gPkxREdr2uOnYSJZW9hIE6IRcxQRN3baLPq3k1lvN9i+Z3PcX/WWZl
   n7tUGavDo+nLvWAcxsMcSdVfht21qBpdEXL6F29xSIjhkr533PqQ83ZqC
   Xp5PYfAFIpOaPgEPQZviTHToC7AEqJMaMcaMu9vo5GIGyD/ANDwEsbYoj
   JkmhZvUIHCF0vTUmjwW+SdR2Vl4vLUMZkmHnRWAV1mHxvzAJyFuWxNF6D
   g==;
X-CSE-ConnectionGUID: 6F5lFoygS+iWmfisWAvLRA==
X-CSE-MsgGUID: jtM2cHMBSQC9Fe0bqJRIVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91415892"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91415892"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 05:20:48 -0700
X-CSE-ConnectionGUID: tiPlFxnYS/CclzwKn6RKsw==
X-CSE-MsgGUID: Z3L22+wiSfu1KZp3cFqxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="268726391"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2026 05:20:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwIo8-00000000eK2-3lit;
	Tue, 18 Aug 2026 12:20:44 +0000
Date: Tue, 18 Aug 2026 20:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 15877/15982] ERROR: modpost:
 drivers/net/ethernet/sfc/sfc.ko: symbol 'devm_cxl_probe_mem' undefined!
Message-ID: <202608181908.K3oTDSUV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
commit: 5901387c31ca3fc8bce2d89de2c0cc6f1bad68d5 [15877/15982] Merge branch 'main' of https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
config: i386-randconfig-r064-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181908.K3oTDSUV-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181908.K3oTDSUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181908.K3oTDSUV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/net/ethernet/sfc/sfc.ko: symbol 'devm_cxl_probe_mem' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
