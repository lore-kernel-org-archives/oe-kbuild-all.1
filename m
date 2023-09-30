Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8645524E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696080418; x=1727616418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQvyzT10jwQT4+HmZaH69GGWFphLbpqpt8hXMeiiCMs=;
  b=mAUiVmNVJdWVfURjj9qjI8h91ujk1O0RoAa/bXZcU6KthkA0jGGXOl5F
   4rsBa8SwY/TX0gu6SBbN5ynhwtoF7/f6/z5Qw/fTQ5J47LaEuy+YqFJr6
   u7n1bEo+HGNlErwoHPNG2sp3gTbD+R7SMF3C5H4BTKVVvWx0t+AfnveRB
   Tdt+JorwwnSVyLSARGcrDndBhx5ryoctHmjag0PgGQcoGQpB1fKYvfQY9
   ASAUcMQth/3h5iydygVAfqJYb6aVb1vjvj4ispUUKs4vdSU7+iGLbYT5f
   3TguyKWlOgZmznyJpRbj0WzRa4mZ2qRAJ3K5zmPMPVfJo5bG0jVj+0obe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="468724929"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="468724929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 06:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="1104310"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2023 06:26:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmZzh-0004AP-2U;
	Sat, 30 Sep 2023 13:26:53 +0000
Date: Sat, 30 Sep 2023 21:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7-next 179/306]
 arch/arm/mm/cache-l2x0.c:760:35: warning: 'l2c310_init_fns' defined but not
 used
Message-ID: <202309302116.7bqoGPGj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: 25c6968d01d7b142f241a1576e0fcdaa7018729f [179/306] ARM: remove unused l2x0_init()
config: arm-randconfig-004-20230930 (https://download.01.org/0day-ci/archive/20230930/202309302116.7bqoGPGj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309302116.7bqoGPGj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309302116.7bqoGPGj-lkp@intel.com/

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
