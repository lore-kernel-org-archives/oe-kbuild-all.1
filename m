Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733B52E628
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731223192; cv=none; b=O/VzCcwNLnZd60DMvHVcMhy8QE9ejs9XDuIElq62PdFm2XC+WROM4YmCnq5tiu9JqamqWadEtJveOFqvV9iM6MgGbJiO6A6fUTK7tORiyjYVYrIPK2GrrF3n4FS9zKd6xiTn/FSP4lthuJ8YyaGll43ZNU/cmInbTAXLijJ8w1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731223192; c=relaxed/simple;
	bh=xEO3dj+JOJtfLOkrPgXdJ/Yy3cxl9ik2MJoI495zvTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbQ9DEx4x4voM92qgj7ErWDG5So2Y5+Pcitiy6c+UgKiG0tMEYKJYSJSTPpix+lNfj5glteziMVGDrCIUfBMTxlp2chRuItDVJqnRGjT6eorgab4mIWGCr32g3Uel1B0kT80IP2smKMvij0ynVvcpk/ig7YO+46Mo53M0DVBaA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muio3j9/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muio3j9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731223191; x=1762759191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xEO3dj+JOJtfLOkrPgXdJ/Yy3cxl9ik2MJoI495zvTE=;
  b=muio3j9/k3TucOfx80kSsGld/WNTkFtR0L8HmsF/Jz7Dl3yCDMS176Qa
   D7aiqC3YoYfnFXUUjn+VUZ8KgBxYWj7vJzpOIyDgenrWuB3sfDadILSpb
   IT7XASX8okR2MJalLa8j9/sPsLxPvP3JQYRXCUCcemn8rs3MupwZMNIGj
   La7R/lnMLsKEel+BMNQIybqiYrFq66xhSLrTzuRa+yNmC8qJnz60KM5tL
   H1aFY/Syrp8CEszJtzRGFyEICO6+IwX80P9sJL+rpeKABW9+fTwWrGzTt
   L1NbtW4LmyvDJ4ZswMdzWvNVUOVOIP8PNkujXcq6hhoH5YRsgpUZCjD7g
   Q==;
X-CSE-ConnectionGUID: od6q5pB2T2uaJ222E1jaZA==
X-CSE-MsgGUID: ZmhzNZPEThCdFv5IepSnyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31014586"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31014586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 23:19:50 -0800
X-CSE-ConnectionGUID: jFwQpqJLSH+oymuQmk8lMw==
X-CSE-MsgGUID: jtnjaqFsQJu+l9Lp5v3qIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86329316"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Nov 2024 23:19:37 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA2EQ-00001Z-1C;
	Sun, 10 Nov 2024 07:19:34 +0000
Date: Sun, 10 Nov 2024 15:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bpf-next:master 4/8] ld.lld: error: relocation R_PPC_ADDR16_LO
 cannot be used against symbol 'init_task'; recompile with -fPIC
Message-ID: <202411101557.FaQ2w0nS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   a2b4a9cddae87e6ff605cf0d2014c749cfbaf14e
commit: 163ea3dec3c8048618f561a2c3b30f4c5795e991 [4/8] Merge branch 'fix-lockdep-warning-for-htab-of-map'
config: powerpc-randconfig-r053-20241110 (https://download.01.org/0day-ci/archive/20241110/202411101557.FaQ2w0nS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101557.FaQ2w0nS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101557.FaQ2w0nS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'init_task'; recompile with -fPIC
   >>> defined in vmlinux.a(init/init_task.o)
   >>> referenced by head_85xx.S:223 (arch/powerpc/kernel/head_85xx.S:223)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x3F2) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
