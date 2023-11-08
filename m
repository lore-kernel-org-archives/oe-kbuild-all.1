Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F26117
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 04:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TijXsVwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699416749; x=1730952749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbBfCbkg85ekH6pDhSYK5D7uW7lEDf32gmGwVObYpyE=;
  b=TijXsVwgTykyuvkwH8QOSHTKHiP4CYCJ1ukKIKiOKFqp/Snn/hvvEIeZ
   7KTCUz0FgksUi9nllLObc2PJ9PP94MrhD59sPYP3scnY3bqWJmoZnlX55
   VmpABCndZYq5lCrO5xfVsi8DZ1oMEYipaR7JNgAWvv0mHj/hmyUZar0lc
   yg6zOoP3pKxZlEHW3lL5izZ7EA7L7m3EN4uRleS+KgFhelQDVWV6AL2yE
   70DyGMKl+RUaJpocDBSM5KM26LNqj1g+pKLRke473BQ5zYVURgRafkaLm
   2Wck4fzurc9mhaFRT29xmTpn5WBsj20a1TSdtA9vS3+QANcot2L5a/FjL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="392554910"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="392554910"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 20:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906650506"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="906650506"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2023 20:12:26 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0ZvU-0007ds-2o;
	Wed, 08 Nov 2023 04:12:24 +0000
Date: Wed, 8 Nov 2023 12:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Ian Kent <raven@themaw.net>
Subject: [brauner-vfs:vfs.mount 6/6] error:
 arch/alpha/kernel/syscalls/syscall.tbl: syscall table is not sorted or
 duplicates the same syscall number
Message-ID: <202311081148.4Zu44ahP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount
head:   dde6ce5647dc453f590401bd6290d26f49e83d3d
commit: dde6ce5647dc453f590401bd6290d26f49e83d3d [6/6] wire up syscalls for statmount/listmount
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311081148.4Zu44ahP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081148.4Zu44ahP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081148.4Zu44ahP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: arch/alpha/kernel/syscalls/syscall.tbl: syscall table is not sorted or duplicates the same syscall number
   make[3]: *** [arch/alpha/kernel/syscalls/Makefile:21: arch/alpha/include/generated/asm/syscall_table.h] Error 1
   make[3]: *** Deleting file 'arch/alpha/include/generated/asm/syscall_table.h'
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [arch/alpha/Makefile:57: archheaders] Error 2
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
