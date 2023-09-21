Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0980619473
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695332000; x=1726868000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B3NF89Ap9PsrlaAMkAw5YbXb0M806OUO1GxY05QCtr4=;
  b=igk17AYWm8mo4eVKtDLQ+lXpgtmK5NlbM3O6JrLxvDnuW/BUF4RddRWc
   F7RCraWoCKYCCPl35A088z/w4tizrkImCPr4v2TOCuq4dCPfk+T6GvAni
   xsjVDkbz5KXulxe0Uid+Zc0Q1mpF2JG8uaqixQoYZgQh0dwWgRrerNPZX
   wL9ea/aFTax9yT4GEkmrAkdJAiE9rZYRbGC5Ix5jBHhxx4vYTRDMVG/0H
   qUk10Z6mB3eXmZ/9gOghC2gTqwk1MTlsHMT0qsEOKW1DS1Nvlq9QHbrUW
   2ezcmK4e8R8ojV3DIeTfs1TfWvNz9kbiVtvw6xb3rpET49/ahkUJ5tiHM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447150759"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="447150759"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 14:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="747293905"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="747293905"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Sep 2023 14:33:00 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjRIA-0000Qg-27;
	Thu, 21 Sep 2023 21:32:58 +0000
Date: Fri, 22 Sep 2023 05:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	patchwork-lst@pengutronix.de
Subject: Re: [PATCH v2 3/6] drm: lcdif: rework runtime PM handling in the
 atomic commit
Message-ID: <202309220530.84SlbdTU-lkp@intel.com>
References: <20230921200312.3989073-3-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921200312.3989073-3-l.stach@pengutronix.de>

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Stach/drm-lcdif-don-t-clear-unrelated-bits-in-CTRLDESCL0_5-when-setting-up-format/20230922-040438
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230921200312.3989073-3-l.stach%40pengutronix.de
patch subject: [PATCH v2 3/6] drm: lcdif: rework runtime PM handling in the atomic commit
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230922/202309220530.84SlbdTU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220530.84SlbdTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220530.84SlbdTU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/lcdif_drv.c:39:6: warning: no previous prototype for 'lcdif_commit_tail' [-Wmissing-prototypes]
      39 | void lcdif_commit_tail(struct drm_atomic_state *old_state)
         |      ^~~~~~~~~~~~~~~~~


vim +/lcdif_commit_tail +39 drivers/gpu/drm/mxsfb/lcdif_drv.c

    38	
  > 39	void lcdif_commit_tail(struct drm_atomic_state *old_state)
    40	{
    41		struct drm_device *drm = old_state->dev;
    42	
    43		pm_runtime_get_sync(drm->dev);
    44	
    45		drm_atomic_helper_commit_modeset_disables(drm, old_state);
    46		drm_atomic_helper_commit_planes(drm, old_state,
    47						DRM_PLANE_COMMIT_ACTIVE_ONLY);
    48		drm_atomic_helper_commit_modeset_enables(drm, old_state);
    49	
    50		drm_atomic_helper_fake_vblank(old_state);
    51		drm_atomic_helper_commit_hw_done(old_state);
    52		drm_atomic_helper_wait_for_vblanks(drm, old_state);
    53	
    54		pm_runtime_put(drm->dev);
    55	
    56		drm_atomic_helper_cleanup_planes(drm, old_state);
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
