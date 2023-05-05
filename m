Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36A5C13E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683298949; x=1714834949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n4pL4Db0O43Pntt/MHJwkrq51saq8BRKapkAKP9LOGQ=;
  b=mlZucQaC2f3kLScHZqbUobvhmU7RimqfwgQnA7RpXRErPTyMeH/bkVd0
   w2J74KhDO/2BRp+E+RiZOyPFkjLkI/vVEmXp1hEk31hNKdVo9KVKs2Eq3
   /TCppIUclaDYhZ5S6pig/8HH4TF3iUfBAiIDLp7kQ6IeOcoXHn7HQWuhD
   gGHV9dpRZmtQS1FxkquXdd1hLtPRimAkTlq4gsWTBvg8h5jgVHoG2kKOe
   zaQ+XZH0A5RC83QohUSQcM/1jew0IU8iObyq3MfobLplx3xclDg4TM0A2
   IZ2IZ1ojBggwJ83Mb1pTfAQza2pr4jYIsIyv0ODdybX3K1hOR1Dp2qdXY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414761266"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="414761266"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 08:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="1027533437"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="1027533437"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 May 2023 08:02:25 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puwwt-0000fX-11;
	Fri, 05 May 2023 15:02:19 +0000
Date: Fri, 5 May 2023 23:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, airlied@redhat.com, javierm@redhat.com,
	lyude@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 4/4] drm/mgag200: Use DMA to copy the framebuffer to the
 VRAM
Message-ID: <202305052238.7oFMzU5Q-lkp@intel.com>
References: <20230505124337.854845-5-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505124337.854845-5-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 457391b0380335d5e9a5babdec90ac53928b23b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230505124337.854845-5-jfalempe%40redhat.com
patch subject: [PATCH 4/4] drm/mgag200: Use DMA to copy the framebuffer to the VRAM
config: x86_64-randconfig-a001-20230501 (https://download.01.org/0day-ci/archive/20230505/202305052238.7oFMzU5Q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/b3cab0043427adee56c6f3169cdfa15526dd331c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
        git checkout b3cab0043427adee56c6f3169cdfa15526dd331c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305052238.7oFMzU5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mgag200/mgag200_dma.c: In function 'mgag200_dma_run_cmd':
>> drivers/gpu/drm/mgag200/mgag200_dma.c:86:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      86 |         int ret;
         |             ^~~


vim +/ret +86 drivers/gpu/drm/mgag200/mgag200_dma.c

    81	
    82	void mgag200_dma_run_cmd(struct mga_device *mdev)
    83	{
    84		struct drm_device *dev = &mdev->base;
    85		u32 primend;
  > 86		int ret;
    87	
    88		/* Add a last block to trigger the softrap interrupt */
    89		mgag200_dma_add_block(mdev,
    90				MGAREG_DMAPAD, 0,
    91				MGAREG_DMAPAD, 0,
    92				MGAREG_DMAPAD, 0,
    93				MGAREG_SOFTRAP, 0);
    94	
    95		primend = mdev->cmd_handle + mdev->cmd_idx * sizeof(struct mga_cmd_block);
    96	
    97		// Use primary DMA to send the commands
    98		WREG32(MGAREG_PRIMADDR, (u32) mdev->cmd_handle);
    99		WREG32(MGAREG_PRIMEND, primend);
   100		mdev->dma_in_use = 1;
   101	
   102		ret = wait_event_timeout(mdev->waitq, mdev->dma_in_use == 0, HZ);
   103	
   104		if (mdev->dma_in_use) {
   105			drm_err(dev, "DMA transfert timed out\n");
   106			/* something goes wrong, reset the DMA engine */
   107			WREG8(MGAREG_OPMODE, MGAOPM_DMA_BLIT);
   108			mdev->dma_in_use = 0;
   109		}
   110	
   111		/* reset command index to start a new sequence */
   112		mdev->cmd_idx = 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
