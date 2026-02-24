Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE90F330D5E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771969226; cv=none; b=qGG7HxBMRRvPi9hcFH+blzJ9HBFEoRiut/+H4ae1B2qYQUGLgJfcomjFnri6rFahbFIfJF7kx+IBuNu7ik0MzkB28zr8OaLLtNzHTEreSTefI1XmASoVufGZMW0v9Fck6wLvGOmq4DzlA7oouGlY351Vcd124qGYXDiKB1Yxevs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771969226; c=relaxed/simple;
	bh=HgcA/pKnJypyUi3WiVcTGjieV7Ytjt6ZKoGp66ket5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hilUvMDlHMo66XzQzewRhtRKFKdUXmr5bY96NCIhvcXr4Qx+VzCOvkynH12vmCgRkePXLdt1KIxnHZhtw3fwLS0Iu3Dd9JuA+pA2kA6plVCPNp/47WceDrFwmi6gTdr8n+baxMriQ8LpxofD/F55knkKu1BG30Bc4kHgUA8Uxi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=il/lGSod; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="il/lGSod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771969225; x=1803505225;
  h=date:from:to:cc:subject:message-id;
  bh=HgcA/pKnJypyUi3WiVcTGjieV7Ytjt6ZKoGp66ket5A=;
  b=il/lGSod9PAhRUXqrrh79ALMC98g3sRFM6hyEIOqTFeBVx0L+9aOA7Wj
   poXs6HpwvP2utDu117Q1nIk0G3sHkXPrK2sYNoxbHHFDIy5QIuaVzrrly
   oLDk4dzHUheSjA1OASrIQs1h3jieVaBusG9DkuGuXhVDJlHA/jlwnmCbo
   WNtDTTwZQnk9e4RJnZZBidpgRgWkiIIyHrqC1nsVXotAyDX33XzAkCzhm
   TqaNTA6vY9IqsNkzcN4/AK2Q84hV/7VVg8aHRqII/o5Znpsl/5DfTg63g
   9fvms/iBc/jLelzQgUEWbBV7eSe8/uRLl3ev9MJMLrdvk7EKCrvgF5knV
   A==;
X-CSE-ConnectionGUID: r35vihKQTxaRpRNcOl4q3Q==
X-CSE-MsgGUID: SQfTa+/AS4eyd/R+dvIl7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72700615"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72700615"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 13:40:24 -0800
X-CSE-ConnectionGUID: FE67guxlQbKxVKZyUeTfJw==
X-CSE-MsgGUID: WIUPQyUMTMiuEvQkONlplA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="221028191"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Feb 2026 13:40:23 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv08Z-000000002Td-2XTE;
	Tue, 24 Feb 2026 21:40:13 +0000
Date: Wed, 25 Feb 2026 05:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 64/64] ld.lld: error:
 undefined symbol: fips140_lib_funcs_loaded
Message-ID: <202602250505.153Y4wHF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   46dd99e420696c966a7354f8e93d3b36fa6da00d
commit: 1aa0ebd06571e65783bdaee8605f6a8460fe4a5b [64/64] ANDROID: lib/crypto: Support overriding crypto library functions
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260225/202602250505.153Y4wHF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250505.153Y4wHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250505.153Y4wHF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fips140_lib_funcs_loaded
   >>> referenced by sha256.c
   >>>               lib/crypto/sha256.o:(sha224_init) in archive vmlinux.a
   >>> referenced by sha256.c
   >>>               lib/crypto/sha256.o:(sha256_init) in archive vmlinux.a
   >>> referenced by sha256.c
   >>>               lib/crypto/sha256.o:(__sha256_update) in archive vmlinux.a
   >>> referenced 45 more times
--
>> ld.lld: error: undefined symbol: fips140_lib_funcs
   >>> referenced by sha256.c
   >>>               lib/crypto/sha256.o:(sha224_init) in archive vmlinux.a
   >>> referenced by sha256.c
   >>>               lib/crypto/sha256.o:(sha256_init) in archive vmlinux.a
   >>> referenced by sha256.c
   >>>               lib/crypto/sha256.o:(__sha256_update) in archive vmlinux.a
   >>> referenced 35 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
