Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302047F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 03:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689131861; x=1720667861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ga+2I6/uYytPWscz7kauJjHz3g5O1ZDTslvdvs/4I3o=;
  b=M/+hySVIafxafx6tZyLLKTDd+IIDus+6nFz6NzX++ztR7EP5BL28LTpa
   w9/FN/qQn1lFaUW8nH1vRkqNATMYox7AqawsdLb9LasQwhtZ8AEkSpx45
   CuxEMXSONM0zFCY5Jt0JIJJLg7jMSje0CG87BuqVb9g42ylHWE1/aZM6o
   hbUCdr81l87DfuCdyHryNZRgllVEbcF+hyOcBJyMQ8f8Y8c5iIQ4ra5j3
   Kj0W4bDl++3gGMZNLyz6bentpC+F8tBIY+lv7ce1Q6YOFCINeH59aMt8x
   M5tY9jjnxFH1vGpgmW8ajgl/aoCKPHWEtSFLWZfsOLPB44DQqJ30DqyJP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="363652510"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="363652510"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 20:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="811424632"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="811424632"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2023 20:17:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJQMD-0005L8-0k;
	Wed, 12 Jul 2023 03:17:37 +0000
Date: Wed, 12 Jul 2023 11:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 13/74] sound/ppc/awacs.c:741:13: error:
 implicit declaration of function 'of_machine_is_compatible'
Message-ID: <202307121101.ZVBGKs60-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3fabe2c33fe8811c575713da027ca6bea22d7d5b
commit: 7642974b8445bbf80b22f91f5cb3484c0eb0c337 [13/74] powerpc: Explicitly include correct DT includes
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230712/202307121101.ZVBGKs60-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121101.ZVBGKs60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121101.ZVBGKs60-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
