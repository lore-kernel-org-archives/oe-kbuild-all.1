Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DEF24160
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689174676; x=1720710676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3tIO4ZSafmDhvBgPAoUd7NzvJ1Q14PPwk9xwCZyhUNg=;
  b=KEoRlJPDjnCnlHm9VHJ5UOH4CSopebADzCz1pC35OaHCPsjJYC630IYl
   3e+AAXYZag2ajyRLzLJ8M6x1SloykbpEpvzzCqjOz8mW1ZkDQTOcSQfAv
   EPSIrDkhgP5QOB9etm6LzsQ0q4/50YKR/GoDzeamxg8C2HAbk/D6xRia3
   pGh5S73SwEiYliN3AOD3DH/+ajmbF2HlO79Qm0yd0BniKiunt0WFX1WYm
   CghgKWGNrV1d1V30Aef2Xh5szfg961iBnkdJSZPZpU5Q4OYYp7H86Mmi8
   3nL/zZnglHxBaFUyeLItbF3DOjhn8STZxU5clNXmVQoghe30Rlmy+Fw9K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="364949921"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="364949921"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 08:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="698897238"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="698897238"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jul 2023 08:10:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJbUX-0005mD-1N;
	Wed, 12 Jul 2023 15:10:57 +0000
Date: Wed, 12 Jul 2023 23:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 53/83]
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:399:1: warning: no
 previous prototype for 'nv50_instmem_dtor'
Message-ID: <202307122350.XSOxDLER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3f6fc48703e02597683babc04c512ca13bb95e19
commit: ae58a2cfdd7490ba3d968e3d898b1c953455f936 [53/83] drm/nouveau/imem/tu102-: prepare for GSP-RM
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230712/202307122350.XSOxDLER-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122350.XSOxDLER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307122350.XSOxDLER-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:399:1: warning: no previous prototype for 'nv50_instmem_dtor' [-Wmissing-prototypes]
     399 | nv50_instmem_dtor(struct nvkm_instmem *base)
         | ^~~~~~~~~~~~~~~~~


vim +/nv50_instmem_dtor +399 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c

   397	
   398	void *
 > 399	nv50_instmem_dtor(struct nvkm_instmem *base)
   400	{
   401		return nv50_instmem(base);
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
