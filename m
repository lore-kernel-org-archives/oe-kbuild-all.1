Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09201F945
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692820090; x=1724356090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pgu4+rfAq+4HXthRfACcC7KVMVwv82RjoTvS0RA+h9E=;
  b=h2gckRHarQK6Kg9rr74GG2UkHI3xHTPvX9n4bSgNkSwdhxtVwItTfgya
   qMmjm5ooYDnezC9dNNeehrEmU4PEqbEmM05x5d0uNtgjmRjyLcbP4juNd
   a6OoLjE1FuuuoSXJQEJxsPSOwi+KU2U5+Km2s0/B5FF3F8Jx7xxzftL0k
   f3/utoUST4+UrPzkl8Pz+6ooPDuRKORedW96qfvclDAU+r0UZPS1W0us5
   Sih45/qAKyg9k3eUu5WtZLNCngoRPk90jVBf8BMf8nK7YmyF+3Hywn+V0
   AogCRhYGMbSJG34aSia9/TAMYdNXqjQyMUyQr4Ba2qcxNWIuCvlWt9aE9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405260196"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="405260196"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 12:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802262708"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="802262708"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 12:48:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYtpo-0001SO-1E;
	Wed, 23 Aug 2023 19:48:08 +0000
Date: Thu, 24 Aug 2023 03:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-lpa2-v4 38/61] arch/arm64/mm/mmu.c:672:17: warning:
 'kernel_exec_prot' defined but not used
Message-ID: <202308240354.7IHsXRD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-lpa2-v4
head:   9008d04c49a096b76a306257c177ad6220d6e37f
commit: 94eb34a3d478610610757a5c8a44fda2c9a9abc5 [38/61] arm64: mm: omit redundant remap of kernel image
config: arm64-randconfig-r011-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240354.7IHsXRD6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240354.7IHsXRD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240354.7IHsXRD6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/mmu.c:672:17: warning: 'kernel_exec_prot' defined but not used [-Wunused-function]
     672 | static pgprot_t kernel_exec_prot(void)
         |                 ^~~~~~~~~~~~~~~~


vim +/kernel_exec_prot +672 arch/arm64/mm/mmu.c

068a17a5805dfb Mark Rutland 2016-01-25  671  
601eaec513cc81 Russell King 2023-06-14 @672  static pgprot_t kernel_exec_prot(void)
601eaec513cc81 Russell King 2023-06-14  673  {
601eaec513cc81 Russell King 2023-06-14  674  	return rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
601eaec513cc81 Russell King 2023-06-14  675  }
601eaec513cc81 Russell King 2023-06-14  676  

:::::: The code at line 672 was first introduced by commit
:::::: 601eaec513cc814c3dc6ed504c7c51ce1b80d0ea arm64: consolidate rox page protection logic

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
