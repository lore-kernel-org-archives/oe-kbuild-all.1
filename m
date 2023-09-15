Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C14EBC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 07:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694761715; x=1726297715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JH7Hsffz2mtSms/XnZHgKhVuh3duWUhLJUeQCmbE/2Q=;
  b=G4rImfeMYsO+6vJ3alMKIVSPvnqocIz6y7UnHNw2g5Gtj6FzQVZWBqfN
   EUq32zp7JPtfokURcf8kuw3uZ4Zpa8nTY0WXaoGgrhdh90q+C0XtVIsQk
   K7kFuBm0jH0wShpFjd4cVRa7G3IdTJcKKIVUnvcYQBGr1D/7/ommlOhKk
   zpoOsYxufapCx/mK6eBL6ASMBDN2LZ5YnRkgSiPJNVq6hvCYAgwOiDtqK
   LtsJznYcILfpS6eFoFCiwFp/2BJZMVcXNiQ/EJCvXC9karlmWiioAx/rq
   jqDfP3rjON4jThRAYFJhgrZlURxFiILVMGBCKB4BXzjbHV8t0V+p6kjzc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358593336"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="358593336"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 00:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="888127635"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="888127635"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2023 00:07:58 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh2wI-0002cw-1N;
	Fri, 15 Sep 2023 07:08:30 +0000
Date: Fri, 15 Sep 2023 15:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 4030/29478]
 drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202309151515.10McBC7o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   6d437ab24c6334aa48e2397e15e88e366c184da0
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [4030/29478] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151515.10McBC7o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151515.10McBC7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151515.10McBC7o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +50 drivers/android/debug_symbols.c

    41	
    42	/*
    43	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    44	 */
    45	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    46	#ifdef CONFIG_ARM64
    47		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    48	#endif
    49	#ifdef CONFIG_X86
  > 50		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    51	#endif
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
