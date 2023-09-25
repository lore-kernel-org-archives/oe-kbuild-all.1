Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3101C6B2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695654387; x=1727190387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVNovaiubIhlWAh84kBYHDVXVega6HqOWiMBnDwrBt4=;
  b=ejJ0KRJGWvVzcEfYWCCvf31lgx2qOK6XSQZyuq+htpUlotnfshY0UcFS
   EKVbwu5sj/C+hVMvaB8oELVuL/i3f+8ZonOVB8rZ9H6JQ2gMUMCdUymCG
   se2ZwmLNP6ZNq1a4lfOqrKW0zkdUjh8+MmS65hw0zCJGS/KOxZ0fc8XZG
   hFo8QvgZqMmBm11it/UTJkUiAhEvMbd7Jy4V/mCUYKCfmofiAoj6WqeLo
   t38Nh2MmMYZZe0gsPekADjs90WefUZ5a/izUdq3V16qfziLWqRvWPpYzC
   AAXsm19s58T5IWDo868vVCDsWoVwSUDzWMZzaj8F47MDpezU+nW3msBID
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366332908"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="366332908"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 08:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741950755"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="741950755"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Sep 2023 08:06:25 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qknAF-0001dS-0c;
	Mon, 25 Sep 2023 15:06:23 +0000
Date: Mon, 25 Sep 2023 23:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/mips/kernel/jump_label.c:93:6: warning: no previous prototype
 for 'jump_label_apply_nops'
Message-ID: <202309252207.JQFDtapt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6465e260f48790807eef06b583b38ca9789b6072
commit: fdfd42892f311e2b3695852036e5be23661dc590 jump_label: mips: move module NOP patching into arch code
date:   1 year, 3 months ago
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230925/202309252207.JQFDtapt-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252207.JQFDtapt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252207.JQFDtapt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/mips/kernel/jump_label.c:93:6: warning: no previous prototype for 'jump_label_apply_nops' [-Wmissing-prototypes]
      93 | void jump_label_apply_nops(struct module *mod)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/jump_label_apply_nops +93 arch/mips/kernel/jump_label.c

    91	
    92	#ifdef CONFIG_MODULES
  > 93	void jump_label_apply_nops(struct module *mod)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
