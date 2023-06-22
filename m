Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB14200D8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687456508; x=1718992508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRiiGjGdv54z/J7itdv3G70cSX/YZlvgu1tU75BM+HY=;
  b=VHn99qi2VQL8F+qDTtJ1JgO7OmJZgx4KBxdtYOUrO3U7kqYDgKfWcaNA
   MZKXkw4kLg5c5gjMHjbaGZJSzbw0c3EsTE4prhs2K7czo10ev5wJ48VES
   C6dQubEEyk2FNrHQ+jc0CRUelGJ87HvCFFYeu5POtDN3kCYIimoT4l+MJ
   veTFbK53xXXSXIpVkw9/Z0aKCDBeXuXnD0ILe4VNmpAsn3tWSxZSGZiF0
   Q355rSJo4Fzt9k52/N3MTXC+ecSeALeCOfW4mAfycOPGj4LnZ/X+3HQjv
   YFFU/ykwnp4b4lJZiNbY+TAWWiK1nYPNULn6zb7HVPuuvZndkvR6E9Tby
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="446940507"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="446940507"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 10:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839157386"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="839157386"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 10:54:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCOW4-0007ir-2f;
	Thu, 22 Jun 2023 17:54:44 +0000
Date: Fri, 23 Jun 2023 01:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arm/mach-imx/pm-imx25.c:31:13: warning: no previous prototype
 for 'imx25_pm_init'
Message-ID: <202306230159.SlgPEfcA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dad9774deaf1cf8e8f7483310dfb2690310193d2
commit: 250c1a694ff304e5d69e74ab32755eddcc2b8f65 ARM: pxa: convert to multiplatform
date:   1 year, 2 months ago
config: arm-randconfig-r034-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230159.SlgPEfcA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230159.SlgPEfcA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230159.SlgPEfcA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/pm-imx25.c:31:13: warning: no previous prototype for 'imx25_pm_init' [-Wmissing-prototypes]
      31 | void __init imx25_pm_init(void)
         |             ^~~~~~~~~~~~~
--
>> arch/arm/mach-imx/cpu-imx25.c:40:5: warning: no previous prototype for 'mx25_revision' [-Wmissing-prototypes]
      40 | int mx25_revision(void)
         |     ^~~~~~~~~~~~~
--
>> arch/arm/mm/copypage-feroceon.c:65:6: warning: no previous prototype for 'feroceon_copy_user_highpage' [-Wmissing-prototypes]
      65 | void feroceon_copy_user_highpage(struct page *to, struct page *from,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mm/copypage-feroceon.c:78:6: warning: no previous prototype for 'feroceon_clear_user_highpage' [-Wmissing-prototypes]
      78 | void feroceon_clear_user_highpage(struct page *page, unsigned long vaddr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx25_pm_init +31 arch/arm/mach-imx/pm-imx25.c

8c4300c227ffff Fabio Estevam 2016-02-02  30  
8c4300c227ffff Fabio Estevam 2016-02-02 @31  void __init imx25_pm_init(void)

:::::: The code at line 31 was first introduced by commit
:::::: 8c4300c227ffffc4db26b6bb3e0271de7ddbd289 ARM: mx25: Add basic suspend/resume support

:::::: TO: Fabio Estevam <fabio.estevam@nxp.com>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
