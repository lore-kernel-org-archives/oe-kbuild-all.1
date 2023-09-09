Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C92370
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 06:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694241349; x=1725777349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gHbKsR7TGa8Za5Sp8Jh01u4/gdfzxmFyKNfwmBe+m9c=;
  b=hifMxBbgizpjPG8+jYaA6DDJs6XbqTy+ae1J6f7RKBFn6PtBOOeioX9x
   gBFmf0nelImNK4Q+LYM+KmW2ZHGVcFrQMg4w2/2rDH4nfCZNgn22uysmk
   xMqu5j9fAQHaIezeGrOhfPvEekpjPY+4xdXX3EeR1ApClI7PQ69YN5Oqx
   RweP2gccQsEHfgG3P/VOUg1t+ADhpIg5ZyoKwbzbECtIP/2LjqysRBWQM
   QbVZVv9B53FeJFhlUfu7dHHsQWRL7jsolAVh3S3Ag1YyiH0yM0bL7SRrL
   m0LYXiPEq7hURvJBi+35SK0tkwOMRFh/uf1Tp6g9oEm8r8TwhVGsRx6Oo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357261789"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="357261789"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 23:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736186461"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="736186461"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Sep 2023 23:35:47 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qerZJ-00030Z-07;
	Sat, 09 Sep 2023 06:35:45 +0000
Date: Sat, 9 Sep 2023 14:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 23/88]
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:188:13: warning: variable
 'ret' set but not used
Message-ID: <202309091448.v9ydau7M-lkp@intel.com>
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
commit: cd2bceb01c38562264d6286cb95b7857cb2cd2cb [23/88] drm/nouveau/disp: add output backlight control methods
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091448.v9ydau7M-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091448.v9ydau7M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091448.v9ydau7M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c: In function 'nvkm_uoutp_mthd_bl_set':
>> drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:188:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     188 |         int ret;
         |             ^~~


vim +/ret +188 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c

   183	
   184	static int
   185	nvkm_uoutp_mthd_bl_set(struct nvkm_outp *outp, void *argv, u32 argc)
   186	{
   187		union nvif_outp_bl_get_args *args = argv;
 > 188		int ret;
   189	
   190		if (argc != sizeof(args->v0) || args->v0.version != 0)
   191			return -ENOSYS;
   192	
   193		if (outp->func->bl.set)
   194			ret = outp->func->bl.set(outp, args->v0.level);
   195		else
   196			ret = -EINVAL;
   197	
   198		return 0;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
