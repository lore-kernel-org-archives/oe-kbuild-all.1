Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413B17E1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 01:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685755634; x=1717291634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UYae+kxVxE7ULslCyjon8tsM7yX3eZqlHsDyWe14z2I=;
  b=hjy/1nlF5DGHc/ReKTduegrTUpYLXiG8nyDzMFlYCgbdluf2/QY9VfPX
   iBOCRdHX9YDRndDTwpb5Uz6/Y5G0nuTGkYBgWXjlZ9df/BWMgKYeH0X/N
   727bKxV11D32mXGw2xN/uW9ewvwUN7L0vl5MUiKQJXQ/qp/lq/dsRT/e3
   lYel18hsAScWXWXXpfCxz9RyoTx3ZMh3ctaZoAR8RyzqhrQ9e2POdODGp
   NIKCfVCbMNJtBbtOx/IiJS0ohM7CRx2dzDSH1XHS4UYfEoBWdnb+t2+S0
   GYlIjS6Z9nGOoX7hkc2RtMGw4sfFjzJGzvuniAcnjU+wGkZqVF/YWdZu3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="419551014"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="419551014"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 18:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658446175"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="658446175"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2023 18:27:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5G2w-00018y-25;
	Sat, 03 Jun 2023 01:27:10 +0000
Date: Sat, 3 Jun 2023 09:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Kim <jonathan.kim@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:drm-next 781/796]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:164:10: warning: no
 previous prototype for 'kgd_gfx_aldebaran_clear_address_watch'
Message-ID: <202306030952.E9M8UZqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   ddaed940344809039c5bec897bd638bf3cf69643
commit: cfd9715f741a1cc91fa2c8b85d8d8a855d7eb048 [781/796] drm/amdkfd: add debug set and clear address watch points operation
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230603/202306030952.E9M8UZqp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout cfd9715f741a1cc91fa2c8b85d8d8a855d7eb048
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030952.E9M8UZqp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:164:10: warning: no previous prototype for 'kgd_gfx_aldebaran_clear_address_watch' [-Wmissing-prototypes]
     164 | uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:782:10: warning: no previous prototype for 'kgd_gfx_v11_clear_address_watch' [-Wmissing-prototypes]
     782 | uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kgd_gfx_aldebaran_clear_address_watch +164 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c

   163	
 > 164	uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
   165						uint32_t watch_id)
   166	{
   167		return 0;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
