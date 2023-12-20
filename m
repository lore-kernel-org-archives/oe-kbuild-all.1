Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1003C1D525
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Dec 2023 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amFw+z1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703054269; x=1734590269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DPg/AV5OURV/VmfFtrr8NptBvJ1W3zcmcEWtuVRMsLI=;
  b=amFw+z1OaiLfzX2F4ptWFQJehCSNv7ijS+/alN1YH5WX9AlbcFdHiZYt
   lZ2Jp2qBwz7K4n1qm8X7iQ4+h4hmLhf16zIrO0s1zZ2JJBt1uR7QSPzIu
   pHaLqnb9u6uEQu/WzXwEuF1w2QyyaEewXYFeainxrsQQ9CyGRlOSi2/oa
   zYTNG+WQ0oRshx8Xt11LTkFfoOC9heDSFbQvwivx+bwqvkjTH8q5RQqhC
   6euRJ6lkXBR8pTg5shKzLJzkpvKGZGw718bhVKc7vAlIstaqVqnQwUpf7
   weGZd1QquvfwEFS/f+qfDNwl8rcgmOKOYeewtGj6FyPYht3kXfpR7Zeof
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2596970"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="2596970"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 22:37:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="919871581"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="919871581"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2023 22:37:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFqDA-0006WP-38;
	Wed, 20 Dec 2023 06:37:44 +0000
Date: Wed, 20 Dec 2023 14:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Changbin Du <changbin.du@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] modules: wait do_free_init correctly
Message-ID: <202312201406.iutKF8s3-lkp@intel.com>
References: <20231219141231.2218215-1-changbin.du@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219141231.2218215-1-changbin.du@huawei.com>

Hi Changbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on linus/master v6.7-rc6 next-20231219]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Changbin-Du/modules-wait-do_free_init-correctly/20231219-221526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20231219141231.2218215-1-changbin.du%40huawei.com
patch subject: [PATCH] modules: wait do_free_init correctly
config: powerpc-ep8248e_defconfig (https://download.01.org/0day-ci/archive/20231220/202312201406.iutKF8s3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312201406.iutKF8s3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312201406.iutKF8s3-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: init/main.o: in function `mark_readonly':
>> init/main.c:1410:(.ref.text+0xe8): undefined reference to `flush_module_init_free_work'


vim +1410 init/main.c

  1399	
  1400	#ifdef CONFIG_STRICT_KERNEL_RWX
  1401	static void mark_readonly(void)
  1402	{
  1403		if (rodata_enabled) {
  1404			/*
  1405			 * load_module() results in W+X mappings, which are cleaned
  1406			 * up with init_free_wq. Let's make sure that queued work is
  1407			 * flushed so that we don't hit false positives looking for
  1408			 * insecure pages which are W+X.
  1409			 */
> 1410			flush_module_init_free_work();
  1411			mark_rodata_ro();
  1412			rodata_test();
  1413		} else
  1414			pr_info("Kernel memory protection disabled.\n");
  1415	}
  1416	#elif defined(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)
  1417	static inline void mark_readonly(void)
  1418	{
  1419		pr_warn("Kernel memory protection not selected by kernel config.\n");
  1420	}
  1421	#else
  1422	static inline void mark_readonly(void)
  1423	{
  1424		pr_warn("This architecture does not have kernel memory protection.\n");
  1425	}
  1426	#endif
  1427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
