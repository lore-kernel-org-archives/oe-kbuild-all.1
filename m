Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218D414F73
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mar6xuYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700142330; x=1731678330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pzY/oE96AeVU0NMPYUeC3CqcLUSNhtyqBTZLJP57skM=;
  b=mar6xuYS8Pxca5ofobV7HvX6R6+JIg4Qv1j+r1kRsMJQqV8q6+FwIt4m
   /G+qii3piUpvPJMRYydKajTwZkqMVeIlNGU2Bl2/iuHQtjyUKpjL4PTSO
   nkbJwQfM4NnEqawZZrXWIx4X0MSwHpLksEkQaY0jL41KQ6d+4JVPWWacG
   4eTAyr+ZRomx8A0Zc7Y+UbfF7rLdplyrMryg6P7zANtCj8eLmy89xBfuM
   7NqKj0a3wDjyHJLCqyvB4RAiJu8XpHyoW9lw2Fxh+GKQL0P1o0i1Qy44e
   BUT0TlVwUnW9WoGVf7IR7akSeYYDlT+HD1dHQ/w7H7zQ1XRdGABr6qlf+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="371271804"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="371271804"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 05:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765297508"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="765297508"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Nov 2023 05:45:26 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3cgD-0001hr-1u;
	Thu, 16 Nov 2023 13:45:17 +0000
Date: Thu, 16 Nov 2023 21:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>, Dave Airlie <airlied@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v2] drm/ast: use managed devres functions
Message-ID: <202311162100.DnPejGd3-lkp@intel.com>
References: <20231103182542.97589-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103182542.97589-2-pstanner@redhat.com>

Hi Philipp,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc1 next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/drm-ast-use-managed-devres-functions/20231104-022841
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231103182542.97589-2-pstanner%40redhat.com
patch subject: [PATCH v2] drm/ast: use managed devres functions
config: x86_64-randconfig-122-20231116 (https://download.01.org/0day-ci/archive/20231116/202311162100.DnPejGd3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311162100.DnPejGd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311162100.DnPejGd3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ast/ast_main.c:447:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/ast/ast_main.c:466:56: sparse: sparse: Using plain integer as NULL pointer

vim +447 drivers/gpu/drm/ast/ast_main.c

   426	
   427	struct ast_device *ast_device_create(const struct drm_driver *drv,
   428					     struct pci_dev *pdev,
   429					     unsigned long flags)
   430	{
   431		struct drm_device *dev;
   432		struct ast_device *ast;
   433		bool need_post = false;
   434		int ret = 0;
   435	
   436		ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
   437		if (IS_ERR(ast))
   438			return ast;
   439		dev = &ast->base;
   440	
   441		pci_set_drvdata(pdev, dev);
   442	
   443		ret = drmm_mutex_init(dev, &ast->ioregs_lock);
   444		if (ret)
   445			return ERR_PTR(ret);
   446	
 > 447		ret = pcim_iomap_regions(pdev, BIT(1), 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
