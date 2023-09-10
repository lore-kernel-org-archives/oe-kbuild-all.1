Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22311377
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 02:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694311936; x=1725847936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DvldQxRLA8CfufVMHpOQLLOpXHILhbi5JQ6C24t9Rk8=;
  b=fmSkjwWLWCoVOR7thQDzlkVyfVar+WXJrMlPc7XYUhfIUJE/7XdH4YAe
   Z3RBddzlahMlcAUetGnOENt2l3GfqX0i8L4gkaIRL44JBgP4yOWQR+4Ex
   m3Goa9vJiCcYfxHGjs8ZBKvYy5+LqCHOUo8GpgOZO7ayAAlwzs8dinjYh
   GEB4lbDtgJkgVEGrekrpIBdNuG1hHXL8FttCwXhXl3gBV+8LuMcarGrkd
   LER6Yd+WI12L8WEAB35Xvf3oYoUVTp+3wfLmZ09bbiWnHr6J0VnzMd2bW
   hlRPLUxDZk8lnnFBL6Z1cSBHI3T+bVla5NUUxyXxAcwR4qYgCEwo9MFcc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380583363"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="380583363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 19:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="812950626"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="812950626"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2023 19:12:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf9vp-0004Dj-0L;
	Sun, 10 Sep 2023 02:12:13 +0000
Date: Sun, 10 Sep 2023 10:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ben Skeggs <bskeggs@redhat.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 10/88]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2603:1: sparse: sparse: symbol
 'nv50_display_read_hw_state' was not declared. Should it be static?
Message-ID: <202309101034.ojicIIHt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   dcd62291d3f1ba328303b1617495fa4542117fc1
commit: c38b1778a9baee914921a6743ba924907b96caa2 [10/88] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
config: i386-randconfig-062-20230910 (https://download.01.org/0day-ci/archive/20230910/202309101034.ojicIIHt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309101034.ojicIIHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101034.ojicIIHt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/dispnv50/disp.c:134:31: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/dispnv50/disp.c:197:31: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/dispnv50/disp.c:257:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *ptr @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/dispnv50/disp.c:261:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *bgn @@     got void [noderef] __iomem *ptr @@
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:2603:1: sparse: sparse: symbol 'nv50_display_read_hw_state' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
