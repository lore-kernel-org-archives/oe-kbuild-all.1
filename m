Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40081800
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689786089; x=1721322089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MVgOXUTwmrGd4/0FjeMY7Q80H8n42QFQ6KutCw9zEw=;
  b=gONvW02y7zd6GCHppGgUkcn5H8uTAW+EWklVYdEOpJd4Z0YFnVFAoqLi
   KwdyzduWScQwXCLi+13iBDfna0ZY9gHfa93/ZyheFrDCaiznUjtXl8Esi
   AsZHHC7lvYVNyUoGSxpHvCVlXmvEyhjldESnrrJJMH6uMRRLNKmwfH8Gs
   hFvAL8NsgTqTnk5ybKEcXSNbMqsNvJRCexbbI5YfgALl8kA5BaiLlTN4n
   yQk1oNZIMv3VJ57lASMVKkB6B/zL9Zkl6pC7uMLM/NS1GxLfmSRDnPgv8
   4QXQYiC4NdOIJ4C46f49FBBQSlrXgUMgdy1mZTAeK8hTi3zHlVa7KHavt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="363983262"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="363983262"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 10:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848127539"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="848127539"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 10:01:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMAYH-0005JV-2w;
	Wed, 19 Jul 2023 17:01:25 +0000
Date: Thu, 20 Jul 2023 01:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 8/13] csky-linux-ld:
 arch/csky/kernel/syscall_table.o:(.data..page_aligned+0x718): undefined
 reference to `sys_futex_requeue'
Message-ID: <202307200011.hnU742Kc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   b70d7a00de0dc4c0525ce8226eb903695114f8ab
commit: 7c350c2f4ddab8995bb0006cc834b652acbd1970 [8/13] futex: Add sys_futex_requeue()
config: csky-randconfig-r035-20230718 (https://download.01.org/0day-ci/archive/20230720/202307200011.hnU742Kc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200011.hnU742Kc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200011.hnU742Kc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> csky-linux-ld: arch/csky/kernel/syscall_table.o:(.data..page_aligned+0x718): undefined reference to `sys_futex_requeue'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
