Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3F6C2E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682579418; x=1714115418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10SMsH1dNjTUU2tROuZ0a97E0Wh/8jeBLCmBaG295mE=;
  b=KicXyI1XHOteNsYos8COqOG43MBb79kC+kptOGS6Y7aGtP03JGo65T6+
   NqIupWjLyvI08UPWd/f4QECa6O36MwRHPNKQRszY35y2UuVus1V+tAQDG
   lcWdDG1Ku0EGoHl+DXx4b5+R6u7qtQgp3n19o4jherDjkfPdBIMJBQd3N
   WD6x8Afa6LKFe/HirzJjV3QiJkRiIZGbw3FRNVW6AKcr0vpkuoPe+Eegb
   sOn2rnxnHlC0xYApKeJJOXUzJ+oknwMHUEhK+9IE90g3f8CfrayneaPgQ
   1XiGsgz5i3RW3JDSgW4PTAXUCA65dOUIj6rG/H68LMufgHVxsn913OvOa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="349304137"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="349304137"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 00:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="671670294"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="671670294"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2023 00:10:16 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prvlf-00004b-1B;
	Thu, 27 Apr 2023 07:10:15 +0000
Date: Thu, 27 Apr 2023 15:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 55/56] sound/ppc/awacs.c:741:13: error:
 implicit declaration of function 'of_machine_is_compatible'
Message-ID: <202304271547.yaAeQpOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   4cc2262d09430892703b2d82d4a48f65679a8b53
commit: 577695f881fd1bc6b2df71df7cbb036f1585c81f [55/56] DT include cleanups
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230427/202304271547.yaAeQpOo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=577695f881fd1bc6b2df71df7cbb036f1585c81f
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 577695f881fd1bc6b2df71df7cbb036f1585c81f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash sound/aoa/fabrics/ sound/aoa/soundbus/ sound/ppc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271547.yaAeQpOo-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/ppc/awacs.c: In function 'snd_pmac_awacs_resume':
>> sound/ppc/awacs.c:741:13: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
     741 |         if (of_machine_is_compatible("PowerBook3,1")
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/ppc/burgundy.c: In function 'snd_pmac_burgundy_update_automute':
>> sound/ppc/burgundy.c:571:28: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
     571 |                 int imac = of_machine_is_compatible("iMac");
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_machine_is_compatible +741 sound/ppc/awacs.c

^1da177e4c3f41 Linus Torvalds         2005-04-16  738  
65b29f5039b38a Takashi Iwai           2005-11-17  739  static void snd_pmac_awacs_resume(struct snd_pmac *chip)
^1da177e4c3f41 Linus Torvalds         2005-04-16  740  {
71a157e8edca55 Grant Likely           2010-02-01 @741  	if (of_machine_is_compatible("PowerBook3,1")
71a157e8edca55 Grant Likely           2010-02-01  742  	    || of_machine_is_compatible("PowerBook3,2")) {
989a0b248bbf32 Nishanth Aravamudan    2005-07-09  743  		msleep(100);
^1da177e4c3f41 Linus Torvalds         2005-04-16  744  		snd_pmac_awacs_write_reg(chip, 1,
^1da177e4c3f41 Linus Torvalds         2005-04-16  745  			chip->awacs_reg[1] & ~MASK_PAROUT);
989a0b248bbf32 Nishanth Aravamudan    2005-07-09  746  		msleep(300);
^1da177e4c3f41 Linus Torvalds         2005-04-16  747  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  748  
^1da177e4c3f41 Linus Torvalds         2005-04-16  749  	awacs_restore_all_regs(chip);
^1da177e4c3f41 Linus Torvalds         2005-04-16  750  	if (chip->model == PMAC_SCREAMER) {
^1da177e4c3f41 Linus Torvalds         2005-04-16  751  		/* reset power bits in reg 6 */
^1da177e4c3f41 Linus Torvalds         2005-04-16  752  		mdelay(5);
^1da177e4c3f41 Linus Torvalds         2005-04-16  753  		snd_pmac_awacs_write_noreg(chip, 6, chip->awacs_reg[6]);
^1da177e4c3f41 Linus Torvalds         2005-04-16  754  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  755  	screamer_recalibrate(chip);
^1da177e4c3f41 Linus Torvalds         2005-04-16  756  #ifdef PMAC_AMP_AVAIL
^1da177e4c3f41 Linus Torvalds         2005-04-16  757  	if (chip->mixer_data) {
65b29f5039b38a Takashi Iwai           2005-11-17  758  		struct awacs_amp *amp = chip->mixer_data;
7ae44cfa7ab29b Risto Suominen         2008-04-16  759  		awacs_amp_set_vol(amp, 0,
7ae44cfa7ab29b Risto Suominen         2008-04-16  760  				  amp->amp_vol[0][0], amp->amp_vol[0][1], 0);
7ae44cfa7ab29b Risto Suominen         2008-04-16  761  		awacs_amp_set_vol(amp, 1,
7ae44cfa7ab29b Risto Suominen         2008-04-16  762  				  amp->amp_vol[1][0], amp->amp_vol[1][1], 0);
^1da177e4c3f41 Linus Torvalds         2005-04-16  763  		awacs_amp_set_tone(amp, amp->amp_tone[0], amp->amp_tone[1]);
^1da177e4c3f41 Linus Torvalds         2005-04-16  764  		awacs_amp_set_master(amp, amp->amp_master);
^1da177e4c3f41 Linus Torvalds         2005-04-16  765  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  766  #endif
^1da177e4c3f41 Linus Torvalds         2005-04-16  767  }
8c8709334cec80 Benjamin Herrenschmidt 2005-06-27  768  #endif /* CONFIG_PM */
^1da177e4c3f41 Linus Torvalds         2005-04-16  769  

:::::: The code at line 741 was first introduced by commit
:::::: 71a157e8edca55198e808f8561dd49017a54ee34 of: add 'of_' prefix to machine_is_compatible()

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
