Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6665CA4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692039761; x=1723575761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7t5zmlGG++uT+y3+nfbOvRBCH5DdyNlpXIJyJ2t61g=;
  b=DWdJ33XQ5L1oACWzeG5DqwKP57WIKq1+In6HXIyPU9OR2t6Mf3SvclBO
   vSMig6f0u2q4j9iX9ZGVvGMMv8aHRuT6fNR2xTI+C3Bkk8B2ofIiaEgN/
   OaG3NSbXo/ojOHmv1uVRxGTEu9H97+G6s69AW6j0LGaKqWUIX0eFr4tug
   VpYvldKhfgK3SGF4asdPdgna/DtvU8b6DYGhoG7Q5WK3Ad8Lv6Uw3uj/c
   Txo72dUMAkKLGUgVENvQfH9tihmRQ8uTqbdUhZZTmBoBQ264GMEG43Nnm
   TQNnjOGl5ZRzAdF9jHh1NdMf9HhjEGegeBZ3Jn1Y9XYpEOMzKrXBNAFbc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372111157"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="372111157"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 12:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803553794"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="803553794"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 12:02:39 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVcpq-0000MN-2w;
	Mon, 14 Aug 2023 19:02:38 +0000
Date: Tue, 15 Aug 2023 03:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 8302/8441] htmldocs: Warning:
 kernel/Kconfig.kexec references a file that doesn't exist:
 file:Documentation/s390/zfcpdump.rst
Message-ID: <202308150232.oM8LYQIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 78be65e335c135f14b8f21917470aa1e1cfe92f0 [8302/8441] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150232.oM8LYQIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150232.oM8LYQIa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
