Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC863D0CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 23:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSfy8dV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703028875; x=1734564875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqK0RHBgi2XTvZJdYDKldZmNY3YJ4YPCIyqnNn7bnZE=;
  b=DSfy8dV1aPGHSMl/Htz7iktJ6hdYdsBgg04Q6TtSOEuQfaIrKd4olNYf
   8bh0BM7bIIMK0U+60/k+nCKrwku5R0943B7VXE1cS46en4nytwBDqUWN+
   3vNQ8FtXzyczabd1goikEB4LBWvXFbrFx5tppnes9QCMXfPg7Rndo2lQw
   CCXhdIosA0QF6W6NvU+BmXUsLhzcwML690YFzG0Y16QfgyQPBRM4muPKf
   uVofiL6XUVgOm32jwzHCbia0I+6Bo7IkDAOBjDbqY9LRyVOs7X8ZnRbMV
   y9fXIzFCMVl2s6NegkNuMRRSfOhMswVX36iM6/vKBXDYFMoUFgbOw94Z+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2585986"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="2585986"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 15:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="866795396"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="866795396"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2023 15:34:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFjbX-00065F-1n;
	Tue, 19 Dec 2023 23:34:27 +0000
Date: Wed, 20 Dec 2023 07:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: kernel/seccomp.c:1386:1: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202312200703.AoSwZY1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   55cb5f43689d7a9ea5bf35ef050f12334f197347
commit: aa0d6e70d3b34e710a6a57a53a3096cb2e0ea99f s390: autogenerate compat syscall wrappers
date:   4 years, 11 months ago
config: s390-randconfig-r111-20231116 (https://download.01.org/0day-ci/archive/20231220/202312200703.AoSwZY1b-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231220/202312200703.AoSwZY1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312200703.AoSwZY1b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/seccomp.c:1386:1: sparse: sparse: Using plain integer as NULL pointer
>> kernel/seccomp.c:1386:1: sparse: sparse: Using plain integer as NULL pointer
--
>> ipc/syscall.c:110:1: sparse: sparse: Using plain integer as NULL pointer
>> ipc/syscall.c:110:1: sparse: sparse: Using plain integer as NULL pointer

vim +1386 kernel/seccomp.c

48dc92b9fc3926 Kees Cook      2014-06-25  1385  
48dc92b9fc3926 Kees Cook      2014-06-25 @1386  SYSCALL_DEFINE3(seccomp, unsigned int, op, unsigned int, flags,
a5662e4d81c4d4 Tycho Andersen 2018-12-09  1387  			 void __user *, uargs)
48dc92b9fc3926 Kees Cook      2014-06-25  1388  {
48dc92b9fc3926 Kees Cook      2014-06-25  1389  	return do_seccomp(op, flags, uargs);
48dc92b9fc3926 Kees Cook      2014-06-25  1390  }
48dc92b9fc3926 Kees Cook      2014-06-25  1391  

:::::: The code at line 1386 was first introduced by commit
:::::: 48dc92b9fc3926844257316e75ba11eb5c742b2c seccomp: add "seccomp" syscall

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
