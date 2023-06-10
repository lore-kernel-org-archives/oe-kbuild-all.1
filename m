Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AAD1FD5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686395553; x=1717931553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wF5TKK7k1kcR69Vk7uOrfh6BmmiyTQLLLwJOsz9YbAg=;
  b=OTfp2z3Lz1RmQbSDFXJclGlII5flyaWJjX1QbIne/DUBXeVoE7VFF5x8
   pLZy7O9VuSBBlShJneG2rxega/mYF+T0bvBQcm6jFLvdH5Baq8fUhoE2q
   mu9QXiHW0aNgFEwSTis1dUH7QgUYQu+CAER7XT+BzFCRzYkGYJbnZW793
   znkGSVNgxwDK55QH9ZjqTf7Ib5+JWlrB7ZsWGDjejOPBeeTK2TMHTWMUV
   0s0QWiPVHHDVB5fW02vyAF5adus1KCwJjYNIlobP81mz32xg6orFbzBVz
   C812eDS1AgThHoa9FIYxqK3SD1hJKe4xbbWWlJ22L2iqCvHFplTz6Is6T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="444123757"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="444123757"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 04:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="775781995"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="775781995"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2023 04:12:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7wWE-000A2a-2P;
	Sat, 10 Jun 2023 11:12:30 +0000
Date: Sat, 10 Jun 2023 19:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 19/20] sound/ppc/burgundy.c:571:28: error:
 implicit declaration of function 'of_machine_is_compatible'
Message-ID: <202306101954.1hyeb3hJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: 6bd2c1239dfcde3e23570ac6b044382269edfd17 [19/20] DT include cleanups
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230610/202306101954.1hyeb3hJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=6bd2c1239dfcde3e23570ac6b044382269edfd17
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 6bd2c1239dfcde3e23570ac6b044382269edfd17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash sound/ppc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101954.1hyeb3hJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/ppc/burgundy.c: In function 'snd_pmac_burgundy_update_automute':
>> sound/ppc/burgundy.c:571:28: error: implicit declaration of function 'of_machine_is_compatible' [-Werror=implicit-function-declaration]
     571 |                 int imac = of_machine_is_compatible("iMac");
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_machine_is_compatible +571 sound/ppc/burgundy.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  567  
65b29f5039b38a Takashi Iwai   2005-11-17  568  static void snd_pmac_burgundy_update_automute(struct snd_pmac *chip, int do_notify)
^1da177e4c3f41 Linus Torvalds 2005-04-16  569  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  570  	if (chip->auto_mute) {
71a157e8edca55 Grant Likely   2010-02-01 @571  		int imac = of_machine_is_compatible("iMac");
^1da177e4c3f41 Linus Torvalds 2005-04-16  572  		int reg, oreg;
44deee129c9af3 Risto Suominen 2008-04-16  573  		reg = oreg = snd_pmac_burgundy_rcb(chip,
44deee129c9af3 Risto Suominen 2008-04-16  574  				MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES);
44deee129c9af3 Risto Suominen 2008-04-16  575  		reg &= imac ? ~(BURGUNDY_OUTPUT_LEFT | BURGUNDY_OUTPUT_RIGHT
44deee129c9af3 Risto Suominen 2008-04-16  576  				| BURGUNDY_HP_LEFT | BURGUNDY_HP_RIGHT)
44deee129c9af3 Risto Suominen 2008-04-16  577  			: ~(BURGUNDY_OUTPUT_LEFT | BURGUNDY_OUTPUT_RIGHT
44deee129c9af3 Risto Suominen 2008-04-16  578  				| BURGUNDY_OUTPUT_INTERN);
^1da177e4c3f41 Linus Torvalds 2005-04-16  579  		if (snd_pmac_burgundy_detect_headphone(chip))
44deee129c9af3 Risto Suominen 2008-04-16  580  			reg |= imac ? (BURGUNDY_HP_LEFT | BURGUNDY_HP_RIGHT)
44deee129c9af3 Risto Suominen 2008-04-16  581  				: (BURGUNDY_OUTPUT_LEFT
44deee129c9af3 Risto Suominen 2008-04-16  582  					| BURGUNDY_OUTPUT_RIGHT);
^1da177e4c3f41 Linus Torvalds 2005-04-16  583  		else
44deee129c9af3 Risto Suominen 2008-04-16  584  			reg |= imac ? (BURGUNDY_OUTPUT_LEFT
44deee129c9af3 Risto Suominen 2008-04-16  585  					| BURGUNDY_OUTPUT_RIGHT)
44deee129c9af3 Risto Suominen 2008-04-16  586  				: (BURGUNDY_OUTPUT_INTERN);
^1da177e4c3f41 Linus Torvalds 2005-04-16  587  		if (do_notify && reg == oreg)
^1da177e4c3f41 Linus Torvalds 2005-04-16  588  			return;
44deee129c9af3 Risto Suominen 2008-04-16  589  		snd_pmac_burgundy_wcb(chip,
44deee129c9af3 Risto Suominen 2008-04-16  590  				MASK_ADDR_BURGUNDY_MORE_OUTPUTENABLES, reg);
^1da177e4c3f41 Linus Torvalds 2005-04-16  591  		if (do_notify) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  592  			snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
^1da177e4c3f41 Linus Torvalds 2005-04-16  593  				       &chip->master_sw_ctl->id);
^1da177e4c3f41 Linus Torvalds 2005-04-16  594  			snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
^1da177e4c3f41 Linus Torvalds 2005-04-16  595  				       &chip->speaker_sw_ctl->id);
^1da177e4c3f41 Linus Torvalds 2005-04-16  596  			snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
^1da177e4c3f41 Linus Torvalds 2005-04-16  597  				       &chip->hp_detect_ctl->id);
^1da177e4c3f41 Linus Torvalds 2005-04-16  598  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  599  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  600  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  601  #endif /* PMAC_SUPPORT_AUTOMUTE */
^1da177e4c3f41 Linus Torvalds 2005-04-16  602  
^1da177e4c3f41 Linus Torvalds 2005-04-16  603  

:::::: The code at line 571 was first introduced by commit
:::::: 71a157e8edca55198e808f8561dd49017a54ee34 of: add 'of_' prefix to machine_is_compatible()

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
