Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70ACCA58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693054555; x=1724590555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eqwu9v+IHb8jr6W7/4R3x5XOj5Y0j6rxujnq08XUxyM=;
  b=l/BC3wFeLe2SMBe+7YnjbIhlDwp/v968UPwP0zx6F4dGe51fQZxPz8oO
   GfggQu+z9tP6tHAUwBbAVAkpVjDDYNR5o1/w/tCLpfFJRZKX3zE/RAEI3
   rcbbz9Pu+DHvjgrjXSJaVy4Wpojm2lYbRJS8jJQf+4qyxBjsfwDZVtbXx
   AiD4yywnV60wo1E9p9LpNcYyo2EizO8o4X0LW8SP0sisJCAXvktpXjPoD
   LeA9m5eilrJc6Ef64GUixmuQvFyyl2NSE/vduH+YaUtmbKNS5aQ7uRMCC
   skW1alz9xAFGdX01KHL4HVPsKUO8QJKpC7PGhi+2hT4zgF9p9RwEBk26+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="461235531"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="461235531"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 05:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="803229166"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="803229166"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Aug 2023 05:55:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZspV-0004id-18;
	Sat, 26 Aug 2023 12:55:53 +0000
Date: Sat, 26 Aug 2023 20:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 23/83]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:313:1: warning:
 'nv50_outp_dump_caps' defined but not used
Message-ID: <202308262028.dAEhN25y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   19545cf2c6adc9e9dc95a3edb138d6734142a8ca
commit: 9fb72ea4800d5c6fba529a2d4472786b9266d9d5 [23/83] WIPdrm/nouveau/disp: return output info from object ctor
config: x86_64-buildonly-randconfig-r002-20230712 (https://download.01.org/0day-ci/archive/20230826/202308262028.dAEhN25y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308262028.dAEhN25y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308262028.dAEhN25y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/dispnv50/disp.c:2577:1: warning: no previous prototype for 'nv50_display_read_hw_state' [-Wmissing-prototypes]
    2577 | nv50_display_read_hw_state(struct nouveau_drm *drm)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:313:1: warning: 'nv50_outp_dump_caps' defined but not used [-Wunused-function]
     313 | nv50_outp_dump_caps(struct nouveau_drm *drm,
         | ^~~~~~~~~~~~~~~~~~~


vim +/nv50_outp_dump_caps +313 drivers/gpu/drm/nouveau/dispnv50/disp.c

9ca6f1ebba1024 drivers/gpu/drm/nouveau/dispnv50/disp.c Ben Skeggs 2018-05-08  308  
a91d322120a65e drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2014-12-22  309  /******************************************************************************
d92c8adf80fdcd drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2016-11-04  310   * Output path helpers
a91d322120a65e drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs 2014-12-22  311   *****************************************************************************/
36dc1777ded32b drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2020-09-04  312  static void
36dc1777ded32b drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2020-09-04 @313  nv50_outp_dump_caps(struct nouveau_drm *drm,
36dc1777ded32b drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2020-09-04  314  		    struct nouveau_encoder *outp)
36dc1777ded32b drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2020-09-04  315  {
36dc1777ded32b drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2020-09-04  316  	NV_DEBUG(drm, "%s caps: dp_interlace=%d\n",
36dc1777ded32b drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2020-09-04  317  		 outp->base.base.name, outp->caps.dp_interlace);
36dc1777ded32b drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2020-09-04  318  }
36dc1777ded32b drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2020-09-04  319  

:::::: The code at line 313 was first introduced by commit
:::::: 36dc1777ded32be541158c4c5be7626a153d0e06 drm/nouveau/kms/nv50-: Log SOR/PIOR caps

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
