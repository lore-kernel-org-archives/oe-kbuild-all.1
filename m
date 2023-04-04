Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3397F3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 07:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680593104; x=1712129104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IPheo9y7rINbdqF5rArt0dXvhYx16zJqhbGRKqNDKJI=;
  b=LdxLkVawSwgqVLO/a3aQLROM1RuZv9/rSFrKTARvY/qYGgyYmFe0/R1t
   2V1qnwsE2vAlBhNOtu4Lh3+3cixB2/fnIAj08hWLMqdbDXhRnA+pDo2Pb
   qfYTkYuS+c5IDbJ5MkDNegE3CkKEII+3zQNNR200QehVFWFBOD90ifyuQ
   Ebf7Q9yrO2Ryz2MOcTU9OzwyT2XRYKz9YHy/rX1QSLUvwjEPHP1F05lrh
   BbpcojFWwb9CLuvnOFL1U0bc7JzxshfDwCHLFe/5vJE+Cb09P4Ge2CdFU
   2tj+oqV8yNgveSyjc2UsLZMQ64axde+zKCk+czEo2oSI+QgkarAHviNku
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322506092"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="322506092"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 00:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="718822815"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="718822815"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Apr 2023 00:25:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjb2K-000PMR-0t;
	Tue, 04 Apr 2023 07:25:00 +0000
Date: Tue, 4 Apr 2023 15:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/10] drm/sched: Move schedule policy to scheduler /
 entity
Message-ID: <202304041537.dcZw4xgl-lkp@intel.com>
References: <20230404002211.3611376-3-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404002211.3611376-3-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on linus/master v6.3-rc5 next-20230403]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Convert-drm-scheduler-to-use-a-work-queue-rather-than-kthread/20230404-082438
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230404002211.3611376-3-matthew.brost%40intel.com
patch subject: [RFC PATCH 02/10] drm/sched: Move schedule policy to scheduler / entity
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230404/202304041537.dcZw4xgl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/432d13aa8af1c693fa15eb5a442931332de31937
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Brost/drm-sched-Convert-drm-scheduler-to-use-a-work-queue-rather-than-kthread/20230404-082438
        git checkout 432d13aa8af1c693fa15eb5a442931332de31937
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/dma-buf/ drivers/gpu/drm/v3d/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041537.dcZw4xgl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_sched_init':
>> drivers/gpu/drm/v3d/v3d_sched.c:403:30: error: 'ULL' undeclared (first use in this function)
     403 |                              ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
         |                              ^~~
   drivers/gpu/drm/v3d/v3d_sched.c:403:30: note: each undeclared identifier is reported only once for each function it appears in


vim +/ULL +403 drivers/gpu/drm/v3d/v3d_sched.c

   381	
   382	int
   383	v3d_sched_init(struct v3d_dev *v3d)
   384	{
   385		int hw_jobs_limit = 1;
   386		int job_hang_limit = 0;
   387		int hang_limit_ms = 500;
   388		int ret;
   389	
   390		ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
   391				     &v3d_bin_sched_ops, NULL,
   392				     hw_jobs_limit, job_hang_limit,
   393				     msecs_to_jiffies(hang_limit_ms), NULL,
   394				     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
   395				     v3d->drm.dev);
   396		if (ret)
   397			return ret;
   398	
   399		ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
   400				     &v3d_render_sched_ops, NULL,
   401				     hw_jobs_limit, job_hang_limit,
   402				     msecs_to_jiffies(hang_limit_ms), NULL,
 > 403				     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
   404				     v3d->drm.dev);
   405		if (ret)
   406			goto fail;
   407	
   408		ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
   409				     &v3d_tfu_sched_ops, NULL,
   410				     hw_jobs_limit, job_hang_limit,
   411				     msecs_to_jiffies(hang_limit_ms), NULL,
   412				     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
   413				     v3d->drm.dev);
   414		if (ret)
   415			goto fail;
   416	
   417		if (v3d_has_csd(v3d)) {
   418			ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
   419					     &v3d_csd_sched_ops, NULL,
   420					     hw_jobs_limit, job_hang_limit,
   421					     msecs_to_jiffies(hang_limit_ms), NULL,
   422					     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
   423					     v3d->drm.dev);
   424			if (ret)
   425				goto fail;
   426	
   427			ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
   428					     &v3d_cache_clean_sched_ops, NULL,
   429					     hw_jobs_limit, job_hang_limit,
   430					     msecs_to_jiffies(hang_limit_ms), NULL,
   431					     NULL, "v3d_cache_clean",
   432					     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
   433			if (ret)
   434				goto fail;
   435		}
   436	
   437		return 0;
   438	
   439	fail:
   440		v3d_sched_fini(v3d);
   441		return ret;
   442	}
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
