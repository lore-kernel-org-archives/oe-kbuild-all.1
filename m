Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51048631
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 22:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714085363; cv=none; b=lwecOL1/JNqoLEXywtWCd+yvfGemNaJG3Vv0PQS8c8OcOTukPqs40zrJgHdQhDjJ12EJMmkUEjliyTA1+mowUDb17vr02xndvIosN6riLkgkmgooXPyUEylQjbu04WzWlvX/rth6aiPx0DVaI7oV/m6m162OnS6YEjrSptSpYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714085363; c=relaxed/simple;
	bh=px49F9D9lW5Qnv1N8lORBFlHLqGJnKHNe+jRz2xNk4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7S9kg1DMRu2li2npijscU9yD42+k6vDjWHp0db4wsw0h7RaSGIcrX6iAJmmhMlHPGMgx1qZqxteflt7Ox0WlTmbEeMF6mVxgTfLizSadqPNw2aeaC4AWL5UeEhTFOe4nw6slENybNqSg/PjS0J8F70aB61BJ72mpGQ6r5uMN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPbD5Dpu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPbD5Dpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714085363; x=1745621363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=px49F9D9lW5Qnv1N8lORBFlHLqGJnKHNe+jRz2xNk4M=;
  b=nPbD5DpuCUR6fQPmJxHiqcp/ijV3mEs+3v1BDDwN1gTs5hazpw17WGrO
   1RKzOQBO6yBhRPWL6Icf5NuHGQT5rrtopxOLy3pSJvf0K33PhcLZIdkug
   1HBG5IkiDuX/aPw7ZTwlLOWikhrBvb8/PcrhTPipfMubh3zbyHbtraryW
   nElixYjhExH4tDbzNopBQgx1PYKcuu5jatvk8EwIUbMzyvuXqpwkiUNLY
   qhWvJ48yeWhcw7LGX0BS0QB6hb4Ke00/8Pxmo503d41+gZboq5+q63cpM
   8sUWmrSHNK4GMIJ6MvqbkHrqO+21sJHlpMjjxHsQCvSs8fuoe5iOze5kP
   A==;
X-CSE-ConnectionGUID: tjfEIE22ThmWig/E41RFKg==
X-CSE-MsgGUID: zgRRTYgzSNCa0JsnpFIbbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13589558"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="13589558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 15:49:22 -0700
X-CSE-ConnectionGUID: yYEJSD3vQWmwiCiyU8FLfQ==
X-CSE-MsgGUID: mnJ9y6UOR3O86cU+sZXvig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25192842"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Apr 2024 15:49:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s07u1-0002ya-2V;
	Thu, 25 Apr 2024 22:49:17 +0000
Date: Fri, 26 Apr 2024 06:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:purgatory-cleanup 10/10] /bin/bash: line 1: 16249 Segmentation
 fault      riscv64-linux-ld -melf64lriscv -z noexecstack
 --no-warn-rwx-segments -e purgatory_start -z nodefaultlib -T
 include/asm-generic/purgatory.lds -pie arch/riscv/purgatory/purgatory.o
 arch/riscv/purgatory/sha256...
Message-ID: <202404260640.9GQVTmrw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git purgatory-cleanup
head:   527f9a46016b98434123f3484fea13aab35165d7
commit: 527f9a46016b98434123f3484fea13aab35165d7 [10/10] Switch risc-v to PIE purgatory
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240426/202404260640.9GQVTmrw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260640.9GQVTmrw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260640.9GQVTmrw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 16249 Segmentation fault      riscv64-linux-ld -melf64lriscv -z noexecstack --no-warn-rwx-segments -e purgatory_start -z nodefaultlib -T include/asm-generic/purgatory.lds -pie arch/riscv/purgatory/purgatory.o arch/riscv/purgatory/sha256.o arch/riscv/purgatory/entry.o arch/riscv/purgatory/string.o arch/riscv/purgatory/ctype.o arch/riscv/purgatory/memcpy.o arch/riscv/purgatory/memset.o arch/riscv/purgatory/strcmp.o arch/riscv/purgatory/strlen.o arch/riscv/purgatory/strncmp.o -o arch/riscv/purgatory/purgatory.ro

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
