Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79EE3D8F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 22:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677278291; x=1708814291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMluUI1Ybl4XGI5YTkaeRQb/5EKRHc9f/2/N64JX4JY=;
  b=K2PkclrQkMR6H/+923vTnx0sFCpTHFKV/hIl7E6fc6xprSzN3wONV8sG
   gF3Zya1iOXyAYjjnOfaW3gnPWNdFmRio6+FkN5UjFEu+2rUC9YItd9HN1
   weLAl2s0wDipPkQuCK78tWweHOH7eoSVoev+7v0zaT4YQeRDwa35PvwJb
   tpP8GO1ca0nkovkqDvzY5Mlij6dJPZvfl3YDWQQ7pkbQ2wHJUe35xaJsO
   r7yzOKpIHknoEUgILyxZVHJPOx3t+VMVtPNOrvwws0bZcyQmU/AeUkc8V
   ge1ad4jHYN8gwAzqlPGYV0jQ5mcKx+TjkZvRwXqYvfuZWLyhwYzR/2rm0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335831608"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="335831608"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 14:38:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705432578"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="705432578"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 14:38:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVghd-0002lp-1Q;
	Fri, 24 Feb 2023 22:38:09 +0000
Date: Sat, 25 Feb 2023 06:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 10/15] drm/vblank: Add helper to get next vblank time
Message-ID: <202302250606.X9lpaAyi-lkp@intel.com>
References: <20230224200155.2510320-11-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224200155.2510320-11-robdclark@gmail.com>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm/drm-next linus/master v6.2 next-20230224]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/dma-buf-dma-fence-Add-deadline-awareness/20230225-040451
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230224200155.2510320-11-robdclark%40gmail.com
patch subject: [PATCH v6 10/15] drm/vblank: Add helper to get next vblank time
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230225/202302250606.X9lpaAyi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/afd134c1224b4bf8b1e52f3c1e9baed6ee4fb49d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/dma-buf-dma-fence-Add-deadline-awareness/20230225-040451
        git checkout afd134c1224b4bf8b1e52f3c1e9baed6ee4fb49d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250606.X9lpaAyi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_vblank.c:997: warning: expecting prototype for drm_crtc_next_vblank_time(). Prototype was for drm_crtc_next_vblank_start() instead


vim +997 drivers/gpu/drm/drm_vblank.c

   987	
   988	/**
   989	 * drm_crtc_next_vblank_time - calculate the time of the next vblank
   990	 * @crtc: the crtc for which to calculate next vblank time
   991	 * @vblanktime: pointer to time to receive the next vblank timestamp.
   992	 *
   993	 * Calculate the expected time of the start of the next vblank period,
   994	 * based on time of previous vblank and frame duration
   995	 */
   996	int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
 > 997	{
   998		unsigned int pipe = drm_crtc_index(crtc);
   999		struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
  1000		struct drm_display_mode *mode = &vblank->hwmode;
  1001		u64 vblank_start;
  1002	
  1003		if (!vblank->framedur_ns || !vblank->linedur_ns)
  1004			return -EINVAL;
  1005	
  1006		if (!drm_crtc_get_last_vbltimestamp(crtc, vblanktime, false))
  1007			return -EINVAL;
  1008	
  1009		vblank_start = (u64)vblank->framedur_ns * mode->crtc_vblank_start /
  1010				mode->crtc_vtotal;
  1011		*vblanktime  = ktime_add(*vblanktime, ns_to_ktime(vblank_start));
  1012	
  1013		return 0;
  1014	}
  1015	EXPORT_SYMBOL(drm_crtc_next_vblank_start);
  1016	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
