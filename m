Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84E86AB3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677504887; x=1709040887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jq89psfBZkhYtZDiUJ2CG3K8wlATYclPkuA5D1vcnpo=;
  b=C+xJpzgLN8LB87RsQpzaDa+yCXyh5RnRsBPsHuiJN5T/odwSuGC54Soi
   HbESt8yoUgs2b/c4Bvd5shyUoQtwyCEQtMkTm+iYCK9Jxe1CChTPfPBUG
   xnMFoPACkn/XHg4mRYLA3ESu1UUylcAL/DpDSkU80tJIkVDpyJ8//9G7S
   GfQX0XW/Gn7qun/9wfI0kqpzSk2PjFjNwPL6yox3eyD2Ev3arRNWeJ9wD
   6ggSAl6qLQyIdLphaUhfZqsuQOdtD11mIS1U3zTXpe1FxhSqP9tGLyDFg
   hyp3Qb5FkjT78hcvaP0pI/V/wShGj2inoln28k7zpUBc4yLwzSOT6GURK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="361415727"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="361415727"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 05:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="797632022"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="797632022"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Feb 2023 05:34:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWdeM-0004Rt-0y;
	Mon, 27 Feb 2023 13:34:42 +0000
Date: Mon, 27 Feb 2023 21:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 11/583]
 drivers/gpu/drm/vc4/vc4_vec.c:338:1: warning: no previous prototype for
 function 'vc4_vec_get_default_mode'
Message-ID: <202302272126.95TrpwQA-lkp@intel.com>
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
config: arm-randconfig-r046-20230227 (https://download.01.org/0day-ci/archive/20230227/202302272126.95TrpwQA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/l1k/linux/commit/d68502e631cb6c914d5620c55c5621f1b54dbe92
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout d68502e631cb6c914d5620c55c5621f1b54dbe92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/vc4/ drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272126.95TrpwQA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_vec.c:338:1: warning: no previous prototype for function 'vc4_vec_get_default_mode' [-Wmissing-prototypes]
   vc4_vec_get_default_mode(struct drm_connector *connector)
   ^
   drivers/gpu/drm/vc4/vc4_vec.c:337:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   enum vc4_vec_tv_mode_id
   ^
   static 
   1 warning generated.


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
