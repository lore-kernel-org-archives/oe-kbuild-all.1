Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4F33DF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677502363; x=1709038363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3MZ4s6SJ4HgbuFBZZZm4D6aSCV9d4lekRe/kqHmYtEg=;
  b=S4TD3L1SHw6pqgNLycb85g2CFqdlUtaiXN145L+Chpq6bN2chO4qLfrH
   QlGIX8S0JnTGXFLtG+j9hybzGrSC2AgkjXiumjcFauG8TQ9aRfDdklub2
   sMIfQNBypIjKB5qn1dfrxmgoMWSKQf0FrOj7OsZSG+HZ7hdeMaO1x0qS9
   Fbh8BZdJlKhPyNnLf3oJqxwF/32GEU5wYWQcjLe9OMJHC9BY4krSgLYJl
   AWsGrZ7wP/Wmeg40B3T524q46gnNgtM2uDqDLSsDm1EQhGRPJP4NtxkhS
   7gx7KZwbnhqxjt40wmk+adOFqotX7XTPqBCAM/8zuBKZhcyN1DSgJltzE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="322095425"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="322095425"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 04:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="667020407"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="667020407"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Feb 2023 04:52:41 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWczh-0004Pf-03;
	Mon, 27 Feb 2023 12:52:41 +0000
Date: Mon, 27 Feb 2023 20:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 11/583]
 drivers/gpu/drm/vc4/vc4_vec.c:338:1: warning: no previous prototype for
 'vc4_vec_get_default_mode'
Message-ID: <202302272008.BAIidERQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: d68502e631cb6c914d5620c55c5621f1b54dbe92 [11/583] drm/vc4: Allow setting the TV norm via module parameter
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230227/202302272008.BAIidERQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/d68502e631cb6c914d5620c55c5621f1b54dbe92
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout d68502e631cb6c914d5620c55c5621f1b54dbe92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/char/ drivers/gpu/drm/vc4/ drivers/staging/vc04_services/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272008.BAIidERQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_vec.c:338:1: warning: no previous prototype for 'vc4_vec_get_default_mode' [-Wmissing-prototypes]
     338 | vc4_vec_get_default_mode(struct drm_connector *connector)
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/vc4_vec_get_default_mode +338 drivers/gpu/drm/vc4/vc4_vec.c

   336	
   337	enum vc4_vec_tv_mode_id
 > 338	vc4_vec_get_default_mode(struct drm_connector *connector)
   339	{
   340		int i;
   341	
   342		if (vc4_vec_tv_norm) {
   343			for (i = 0; i < ARRAY_SIZE(tv_mode_names); i++)
   344				if (strcmp(vc4_vec_tv_norm, tv_mode_names[i]) == 0)
   345					return (enum vc4_vec_tv_mode_id) i;
   346		} else if (connector->cmdline_mode.specified &&
   347			   ((connector->cmdline_mode.refresh_specified &&
   348			     (connector->cmdline_mode.refresh == 25 ||
   349			      connector->cmdline_mode.refresh == 50)) ||
   350			    (!connector->cmdline_mode.refresh_specified &&
   351			     (connector->cmdline_mode.yres == 288 ||
   352			      connector->cmdline_mode.yres == 576)))) {
   353			/*
   354			 * no explicitly specified TV norm; use PAL if a mode that
   355			 * looks like PAL has been specified on the command line
   356			 */
   357			return VC4_VEC_TV_MODE_PAL;
   358		}
   359	
   360		/* in all other cases, default to NTSC */
   361		return VC4_VEC_TV_MODE_NTSC;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
