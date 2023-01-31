Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D638F8803
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675175344; x=1706711344;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KCJ6xq5yNcBn93vYp8FhA/Ux1Y13PxpVGHixxq7vDXk=;
  b=mFroprV1kVpobresAejusjDibWduneMcFCLSJ06KpvnHeD488BnRKzcH
   VuxdLSgkbQuYK9jyuUZEiFOJCeGjYRNLymKdRcjsf3Sa8KCZHJQYAfOBF
   8m1qgIuSnM8ay6h9BnpKMkMVc1ndRwF5AcuR02H2o/Hb9cGeDXqXkZAHD
   tvgFw37MzYd5wx21aZNRyY+Ofmq1skWzT7Cu4HmnlIP6oToiIeOfOt584
   rPrkboJQzchS3LL6HozteBLPv7r7zu2TpZ8x/GnlVXuWmTHUmCICDKJVw
   A8nSOepKBueJ1AYsa5QBWuPqLRWX62O0EqGJ11HJFofo8IgNOHXrmVZx4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392404405"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="392404405"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 06:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="773002211"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="773002211"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2023 06:29:00 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMrd1-0004Ta-0w;
	Tue, 31 Jan 2023 14:28:55 +0000
Date: Tue, 31 Jan 2023 22:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 36/37] drivers/w1/masters/ds1wm.c:314:29:
 error: 'const struct mfd_cell' has no member named 'enable'
Message-ID: <202301312209.fE84Pcpj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   a561a980c024193e342b6878f62e02ff9d018285
commit: 78e7ccec94380519919267670174cbf1711b7963 [36/37] mfd: Remove .enable() and .disable() callbacks
config: arc-randconfig-r043-20230129 (https://download.01.org/0day-ci/archive/20230131/202301312209.fE84Pcpj-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=78e7ccec94380519919267670174cbf1711b7963
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout 78e7ccec94380519919267670174cbf1711b7963
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/w1/masters/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/w1/masters/ds1wm.c: In function 'ds1wm_up':
>> drivers/w1/masters/ds1wm.c:314:29: error: 'const struct mfd_cell' has no member named 'enable'
     314 |         if (ds1wm_data->cell->enable)
         |                             ^~
   drivers/w1/masters/ds1wm.c:315:33: error: 'const struct mfd_cell' has no member named 'enable'
     315 |                 ds1wm_data->cell->enable(ds1wm_data->pdev);
         |                                 ^~
   drivers/w1/masters/ds1wm.c: In function 'ds1wm_down':
>> drivers/w1/masters/ds1wm.c:341:29: error: 'const struct mfd_cell' has no member named 'disable'
     341 |         if (ds1wm_data->cell->disable)
         |                             ^~
   drivers/w1/masters/ds1wm.c:342:33: error: 'const struct mfd_cell' has no member named 'disable'
     342 |                 ds1wm_data->cell->disable(ds1wm_data->pdev);
         |                                 ^~
   drivers/w1/masters/ds1wm.c: In function 'ds1wm_probe':
   drivers/w1/masters/ds1wm.c:512:12: warning: variable 'inten' set but not used [-Wunused-but-set-variable]
     512 |         u8 inten;
         |            ^~~~~


vim +314 drivers/w1/masters/ds1wm.c

f19b121e21c1b03 Andrew Morton          2007-05-08  307  
f19b121e21c1b03 Andrew Morton          2007-05-08  308  static void ds1wm_up(struct ds1wm_data *ds1wm_data)
f19b121e21c1b03 Andrew Morton          2007-05-08  309  {
7d33ccbeecd8393 Philipp Zabel          2009-02-17  310  	int divisor;
75f9e937d24fdf6 Jingoo Han             2013-11-12  311  	struct device *dev = &ds1wm_data->pdev->dev;
75f9e937d24fdf6 Jingoo Han             2013-11-12  312  	struct ds1wm_driver_data *plat = dev_get_platdata(dev);
f19b121e21c1b03 Andrew Morton          2007-05-08  313  
a23a175795cdb20 Philipp Zabel          2009-02-17 @314  	if (ds1wm_data->cell->enable)
a23a175795cdb20 Philipp Zabel          2009-02-17  315  		ds1wm_data->cell->enable(ds1wm_data->pdev);
f19b121e21c1b03 Andrew Morton          2007-05-08  316  
7d33ccbeecd8393 Philipp Zabel          2009-02-17  317  	divisor = ds1wm_find_divisor(plat->clock_rate);
75f9e937d24fdf6 Jingoo Han             2013-11-12  318  	dev_dbg(dev, "found divisor 0x%x for clock %d\n",
75f9e937d24fdf6 Jingoo Han             2013-11-12  319  		divisor, plat->clock_rate);
f19b121e21c1b03 Andrew Morton          2007-05-08  320  	if (divisor == 0) {
75f9e937d24fdf6 Jingoo Han             2013-11-12  321  		dev_err(dev, "no suitable divisor for %dHz clock\n",
7d33ccbeecd8393 Philipp Zabel          2009-02-17  322  			plat->clock_rate);
f19b121e21c1b03 Andrew Morton          2007-05-08  323  		return;
f19b121e21c1b03 Andrew Morton          2007-05-08  324  	}
f19b121e21c1b03 Andrew Morton          2007-05-08  325  	ds1wm_write_register(ds1wm_data, DS1WM_CLKDIV, divisor);
f19b121e21c1b03 Andrew Morton          2007-05-08  326  
f19b121e21c1b03 Andrew Morton          2007-05-08  327  	/* Let the w1 clock stabilize. */
f19b121e21c1b03 Andrew Morton          2007-05-08  328  	msleep(1);
f19b121e21c1b03 Andrew Morton          2007-05-08  329  
f19b121e21c1b03 Andrew Morton          2007-05-08  330  	ds1wm_reset(ds1wm_data);
f19b121e21c1b03 Andrew Morton          2007-05-08  331  }
f19b121e21c1b03 Andrew Morton          2007-05-08  332  
f19b121e21c1b03 Andrew Morton          2007-05-08  333  static void ds1wm_down(struct ds1wm_data *ds1wm_data)
f19b121e21c1b03 Andrew Morton          2007-05-08  334  {
f19b121e21c1b03 Andrew Morton          2007-05-08  335  	ds1wm_reset(ds1wm_data);
f19b121e21c1b03 Andrew Morton          2007-05-08  336  
f19b121e21c1b03 Andrew Morton          2007-05-08  337  	/* Disable interrupts. */
f19b121e21c1b03 Andrew Morton          2007-05-08  338  	ds1wm_write_register(ds1wm_data, DS1WM_INT_EN,
26a6afb917a8e3e Jean-François Dagenais 2011-05-26  339  		ds1wm_data->int_en_reg_none);
f19b121e21c1b03 Andrew Morton          2007-05-08  340  
a23a175795cdb20 Philipp Zabel          2009-02-17 @341  	if (ds1wm_data->cell->disable)
a23a175795cdb20 Philipp Zabel          2009-02-17  342  		ds1wm_data->cell->disable(ds1wm_data->pdev);
f19b121e21c1b03 Andrew Morton          2007-05-08  343  }
f19b121e21c1b03 Andrew Morton          2007-05-08  344  

:::::: The code at line 314 was first introduced by commit
:::::: a23a175795cdb202619ac176129b2f0c2a5c9456 mfd: convert DS1WM to use MFD core

:::::: TO: Philipp Zabel <philipp.zabel@gmail.com>
:::::: CC: Samuel Ortiz <samuel@sortiz.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
