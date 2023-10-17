Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA40C8C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 06:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kikmQYVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697523163; x=1729059163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cd8wWqa2wQWkVesEWRSOGVNVPs5wnXyLcNFqueTKMMc=;
  b=kikmQYVB0fv/OoGe7t5oiyoVnBIwTkmW42is95JJHHgx7lP+iJFrw/Xw
   g9FGuMiiPdVjd5Scenx+zjtEw9OJ9SHB0yC0rdsqeKdnyC5o8uJt3fPQl
   X0aGgwkygb6IKwtgP3VwsHY8FsbYGcuSJXazLXMAboC0mpcM+COD6xRzv
   a2sTUHpG8QnsovhF9r2afmcqlrRpYsWphrb5tuVA6A94fSGy+OHmmPHaX
   RQ57xqZTSXrzatKaxz8lAjGMOWsrkAV47r3YMwaduREDvvhEM0NW+ikBG
   68S+1WY56h7ylT6tDTy+oMHkWfJ5ADtYxhYiTav/zUJprA1tqmuWxfKHP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416783677"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="416783677"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="732601985"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="732601985"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Oct 2023 23:12:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsdJn-00096n-0O;
	Tue, 17 Oct 2023 06:12:39 +0000
Date: Tue, 17 Oct 2023 14:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <christian@brauner.io>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: <stdin>:1508:2: warning: #warning syscall clone3 not implemented
Message-ID: <202310171424.ZUGeHDAN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 8f3220a806545442f6f26195bc491520f5276e7c arch: wire-up clone3() syscall
date:   4 years, 4 months ago
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171424.ZUGeHDAN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171424.ZUGeHDAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171424.ZUGeHDAN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1508:2: warning: #warning syscall clone3 not implemented [-Wcpp]
--
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
>> <stdin>:1508:2: warning: #warning syscall clone3 not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
