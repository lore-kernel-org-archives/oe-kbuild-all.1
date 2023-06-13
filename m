Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162361361
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 23:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686699754; x=1718235754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SAvYsVhrjg6XZhbR+KZY/YVZ8ZkcBx/wtBohhmNXOg4=;
  b=K5Ma74i5OM3/lzr/BTuT0bouLW3YPXaOj6vGsse4QU8GrG8GD1b0+Uoq
   sujxAWXgQHo9ve3HvRW8XWtBWKISSqbG+QUJmjCUYUPfyqu4PWU+HjQOg
   AkzRy6riMNGa9BC+k9qPCFt3Jxa6OnzKbcaftW5I8W0H9a0RAPZNAzMkj
   dudrj3HC7W/RdkDCKmw8eobOXNRbPFwS5Vca1Gjjl2cPLgAp3zb4qfctd
   OCURWxu0qlTjozLy/IDzvnSLqlTSqECFzJ/CCKC0lK5BO2nROBUt+qPGY
   kfPurqN1CDw7s1rkaz1sDSpkrL0DmJKyl787G0h9sMuNC/pc8vWElXW+W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386880718"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="386880718"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 16:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="705990356"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="705990356"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jun 2023 16:42:32 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9Deh-0001ws-0w;
	Tue, 13 Jun 2023 23:42:31 +0000
Date: Wed, 14 Jun 2023 07:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 95/97]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:628: warning: expecting prototype
 for amdgpu_vm_free_table(). Prototype was for amdgpu_vm_pt_free() instead
Message-ID: <202306140749.VvPVzGWP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   4c717d2741fa4597d9427b82dfe2dce7c712e0e9
commit: 58a6fbd5bc2bb161adc6035157461bf6a255d24a [95/97] drm/amdgpu: separate VM PT handling into amdgpu_vm_pt.c
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306140749.VvPVzGWP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=58a6fbd5bc2bb161adc6035157461bf6a255d24a
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 58a6fbd5bc2bb161adc6035157461bf6a255d24a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140749.VvPVzGWP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:628: warning: expecting prototype for amdgpu_vm_free_table(). Prototype was for amdgpu_vm_pt_free() instead


vim +628 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c

   621	
   622	/**
   623	 * amdgpu_vm_free_table - fre one PD/PT
   624	 *
   625	 * @entry: PDE to free
   626	 */
   627	static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
 > 628	{
   629		struct amdgpu_bo *shadow;
   630	
   631		if (!entry->bo)
   632			return;
   633		shadow = amdgpu_bo_shadowed(entry->bo);
   634		entry->bo->vm_bo = NULL;
   635		list_del(&entry->vm_status);
   636		amdgpu_bo_unref(&shadow);
   637		amdgpu_bo_unref(&entry->bo);
   638	}
   639	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
