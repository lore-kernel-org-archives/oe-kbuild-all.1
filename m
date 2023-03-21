Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1210E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 00:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679360107; x=1710896107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZHer9Ncbg/NVTXk2nlism8j1Sf+fLmesX1WdkPxr0pA=;
  b=SaTP049tpcR4mEnd4Rlkd4hnRmyUpYYZ6tU1A555gebJxkIyZwh9uYvE
   oJpgLFiA3GRddZGRFoR5+BVEFyljSPzXOw8zmPmNVCDYa/5phjcleRJPw
   6BHwalX1zrBTpxinNCBgXnbhQXgYvvNhqKJyUwTcGYdbF/FYeU2rcJJ15
   plpLwfqDneVoWiQUhSDwoQal62Z4CCUa558fNpGyT398afrF2+jXfiNXS
   Ky1u1Qdo+laq311PPipmMucl2ENxJ3nH1DqcJKCBLUERGNwOt076TCoEz
   Dp3trIjE3Vgxse5bbUT41q3NSFUoiHO7t+L+dtbTCyN9Nc2dHsbfCDsQ9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322655858"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="322655858"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 17:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="683641879"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="683641879"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2023 17:55:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peQHI-000BRq-1U;
	Tue, 21 Mar 2023 00:55:04 +0000
Date: Tue, 21 Mar 2023 08:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marian Postevca <posteuca@mutex.one>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
Message-ID: <202303210820.JYm7LOnS-lkp@intel.com>
References: <20230320203519.20137-4-posteuca@mutex.one>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320203519.20137-4-posteuca@mutex.one>

Hi Marian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marian-Postevca/ASoC-es8316-Enable-support-for-S32-LE-format-and-MCLK-div-by-2/20230321-043847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230320203519.20137-4-posteuca%40mutex.one
patch subject: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303210820.JYm7LOnS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0562079546d40f50d025ea1c4dacd31120b8b0bc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marian-Postevca/ASoC-es8316-Enable-support-for-S32-LE-format-and-MCLK-div-by-2/20230321-043847
        git checkout 0562079546d40f50d025ea1c4dacd31120b8b0bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/amd/acp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210820.JYm7LOnS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c:464:6: warning: no previous prototype for 'acp3x_es83xx_init_ops' [-Wmissing-prototypes]
     464 | void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/acp3x_es83xx_init_ops +464 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c

   462	
   463	
 > 464	void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
