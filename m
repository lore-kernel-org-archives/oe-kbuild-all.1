Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7C52F9C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXEvLIsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703528141; x=1735064141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5mFTqMyyG4hXOeTrpP7aERTO3f3wEwjToaoOl7ZNrk=;
  b=gXEvLIsEamN0leC0+5cp/RLqe90wNJd24h4bHkH7PzIgIlhx5yDbM5Jr
   jlsH7yUm6298f/7x0Sa750rxI1QU/COWP+15Vzjr3QrBvn4oFYcaMOR9w
   IOxMFbPB8P9/VVcYekQwIiJNesSTBLhtr0DzizFhpCNC+sHDmz7JCZy4t
   Pxm4zE4TxU2PEUMoIf1GlX79tzNGVH0QdOeCXkm1pIi4jDY6ZzG2zfh1Q
   YXlai6xQkPwA4JV542JdwgU8iTyZLfL1WVrhUso6gfJueaUbwa8QJD6um
   1nxy8yiYDmAZbapnntFhxN9ZvUgx16ZdUVGbpwPawwrBh7ULDaFESYT4a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="400119383"
X-IronPort-AV: E=Sophos;i="6.04,303,1695711600"; 
   d="scan'208";a="400119383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 10:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="921384614"
X-IronPort-AV: E=Sophos;i="6.04,303,1695711600"; 
   d="scan'208";a="921384614"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Dec 2023 10:15:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHpUH-000Dal-0u;
	Mon, 25 Dec 2023 18:15:37 +0000
Date: Tue, 26 Dec 2023 02:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:kselftest-seccomp-benchmark-ktap 2/3]
 seccomp_benchmark.c:149:24: warning: zero-length gnu_printf format string
Message-ID: <202312260235.Uj5ug8K9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git kselftest-seccomp-benchmark-ktap
head:   21f55624b94694bb349f6dc54e9b1375cc2b47ca
commit: 8039719f23c4eb0b7f505e68196b4b4f420c2b22 [2/3] kselftest/seccomp: Use kselftest output functions for benchmark
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260235.Uj5ug8K9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260235.Uj5ug8K9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   seccomp_benchmark.c: In function 'main':
>> seccomp_benchmark.c:149:24: warning: zero-length gnu_printf format string [-Wformat-zero-length]
     149 |         ksft_print_msg("");
         |                        ^~
   seccomp_benchmark.c:154:24: warning: zero-length gnu_printf format string [-Wformat-zero-length]
     154 |         ksft_print_msg("");
         |                        ^~
   seccomp_benchmark.c:156:24: warning: zero-length gnu_printf format string [-Wformat-zero-length]
     156 |         ksft_print_msg("");
         |                        ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
