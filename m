Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B17BE6F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rok898E5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699083692; x=1730619692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DDo2mI5/lp191SRjrDdpTIjANs2plmB6uzLXwLGyGs=;
  b=Rok898E5eB0W/cbD8gCK2uIoiRNXIrndQYl6ssvLpFHPKbd20MWgCeWM
   44y4JzMoCQ/oT7si6s3AvtloAciSo+mCWxZdCKpxaT7ewjuvNnJ8Vffn5
   LJ+yLTzbU6msSlF/Cqxu2AB4C2xn163X/QImlQYgf8DH++9K9u1t9z/qP
   aIdzchRN7bs7AfbqZIm1tSByYQzCDeE5KbV+sS6WlU0GsuAwUegDrAHLF
   QV+PBoy9ZNaP3/h0EvUPac6iXoWBcOQbjuYvAnteQGkYOwCPagywwOxGE
   DZX5VYUS7dBfauEhVq8LzpuezWgCVBjsb6gERzpHUNaJIQ+4tkwjA9rht
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392960030"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="392960030"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 00:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="827718717"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="827718717"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Nov 2023 00:41:29 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzBHb-0003dj-34;
	Sat, 04 Nov 2023 07:41:27 +0000
Date: Sat, 4 Nov 2023 15:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7 176/325]
 arch/arm/mm/cache-l2x0.c:760:35: warning: 'l2c310_init_fns' defined but not
 used
Message-ID: <202311041555.Azjq1CQq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7
head:   c9ecd45768d19a28da1d81e19ab3663828a4fec1
commit: 735a728efa3fd00b6dc0c230f34c01db64c2bf25 [176/325] ARM: remove unused l2x0_init()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231104/202311041555.Azjq1CQq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041555.Azjq1CQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041555.Azjq1CQq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mm/cache-l2x0.c:760:35: warning: 'l2c310_init_fns' defined but not used [-Wunused-const-variable=]
     760 | static const struct l2c_init_data l2c310_init_fns __initconst = {
         |                                   ^~~~~~~~~~~~~~~
>> arch/arm/mm/cache-l2x0.c:404:35: warning: 'l2c220_data' defined but not used [-Wunused-const-variable=]
     404 | static const struct l2c_init_data l2c220_data = {
         |                                   ^~~~~~~~~~~
>> arch/arm/mm/cache-l2x0.c:239:35: warning: 'l2c210_data' defined but not used [-Wunused-const-variable=]
     239 | static const struct l2c_init_data l2c210_data __initconst = {
         |                                   ^~~~~~~~~~~


vim +/l2c310_init_fns +760 arch/arm/mm/cache-l2x0.c

e946a8cbe4a47a Russell King 2015-05-15  759  
75461f5c8483be Russell King 2014-03-15 @760  static const struct l2c_init_data l2c310_init_fns __initconst = {
051334bdc52523 Russell King 2014-03-15  761  	.type = "L2C-310",
0493aef4da8231 Russell King 2014-03-15  762  	.way_size_0 = SZ_8K,
75461f5c8483be Russell King 2014-03-15  763  	.num_lock = 8,
4374d64933b1d0 Russell King 2014-03-19  764  	.enable = l2c310_enable,
75461f5c8483be Russell King 2014-03-15  765  	.fixup = l2c310_fixup,
09a5d180ed9d5a Russell King 2014-03-15  766  	.save = l2c310_save,
6b49241ac25258 Tomasz Figa  2015-01-08  767  	.configure = l2c310_configure,
e946a8cbe4a47a Russell King 2015-05-15  768  	.unlock = l2c310_unlock,
75461f5c8483be Russell King 2014-03-15  769  	.outer_cache = {
f777332ba7ae42 Russell King 2014-03-15  770  		.inv_range = l2c210_inv_range,
f777332ba7ae42 Russell King 2014-03-15  771  		.clean_range = l2c210_clean_range,
f777332ba7ae42 Russell King 2014-03-15  772  		.flush_range = l2c210_flush_range,
f777332ba7ae42 Russell King 2014-03-15  773  		.flush_all = l2c210_flush_all,
8ef418c7178fa6 Russell King 2014-03-18  774  		.disable = l2c310_disable,
f777332ba7ae42 Russell King 2014-03-15  775  		.sync = l2c210_sync,
09a5d180ed9d5a Russell King 2014-03-15  776  		.resume = l2c310_resume,
75461f5c8483be Russell King 2014-03-15  777  	},
75461f5c8483be Russell King 2014-03-15  778  };
75461f5c8483be Russell King 2014-03-15  779  

:::::: The code at line 760 was first introduced by commit
:::::: 75461f5c8483bee543df30b288787fd3369312b8 ARM: l2c: implement fixups for L2 cache controller quirks/errata

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
