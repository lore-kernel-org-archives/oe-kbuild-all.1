Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47212111A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689760928; x=1721296928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ZE/wLC2jLgZk/8FHdzDZLkPWHhAeHzf4sEGSpubFis=;
  b=MFkzv4/o8T56zUXCFF4CKR/dKOmYRFauxq1QCBkBmcefDUi48EjeU9BS
   UAejTRUD+Je+XjOtw3WygSohLUEzxZDWYHNq8bBxwgi5Cpy8P/pBu4Ll7
   noFumLqqecuDJCvo4Lkb7z/rF8Jr5H7SvvgKdns25SnyoGomtjhq8fCAa
   XkiBTRXB9ie2DyXtWXQ5RODH3HIluelcNDtJ3pWJ+mDOrgBWJLEb5olbK
   S+aEswjyLMS8Mjo2hbJXvvA+HdBdChHj3ctnyd9CekyOFiiZc6BS74N9l
   NhQS69PE/3Jo5TfoUx6NaowSJneaf/uqLK18WKTQG7qeI8Fjyc2eJifKU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="430187274"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="430187274"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 03:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="1054644883"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="1054644883"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2023 03:02:06 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM40T-0004ef-1X;
	Wed, 19 Jul 2023 10:02:05 +0000
Date: Wed, 19 Jul 2023 18:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 9/9]
 riscv64-linux-ld:./arch/riscv/kernel/vmlinux.lds:5: undefined symbol
 `screen_info' referenced in expression
Message-ID: <202307191749.CI0DsNOm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   97fab4416008a9207397e26c7a19fdecf401b3fb
commit: 97fab4416008a9207397e26c7a19fdecf401b3fb [9/9] efi: move screen_info into efi init code
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230719/202307191749.CI0DsNOm-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191749.CI0DsNOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191749.CI0DsNOm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv64-linux-ld:./arch/riscv/kernel/vmlinux.lds:5: undefined symbol `screen_info' referenced in expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
