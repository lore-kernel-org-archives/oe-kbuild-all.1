Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6F515BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 04:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682568325; x=1714104325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwdfu591opvPAKdv8cjHLakwvkduEy3D5FzD6D6/Leo=;
  b=DCwOhNf+OphInRUSKwi15OVAzXOb0qn5SyKprqAd1tO3DEaO1fEBolqW
   LqWJMCG0fhrHC1TGb49Dfx6+W6eSV1rP8Vl7j/dtkImsaWznGj0+dgxfe
   W/LgCgLXLBqCYucOqQlKrH8PPGj7V64MnmU+g2plJMtsPuKgp7VOmSh7d
   G53JSYKm3/17EpreWbNceGKs7xsSVe3ub5AGq728tF0yODUoZtAY+FLjF
   nOdcsRO3laX/gVEFA3yP/9FXu2LPcBNY2mtmfkfB10H9zEBQ4uTCewdwL
   aR779fjstpHWyxb2AvEWjoV2GY/0l+c4CeJ8DAmYDC42Ot0Usl+8wlh3h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433605199"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="433605199"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 21:02:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="940502661"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="940502661"
Received: from lkp-server01.sh.intel.com (HELO 848ce1e85e7c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Apr 2023 21:02:27 -0700
Received: from kbuild by 848ce1e85e7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prspv-000037-08;
	Thu, 27 Apr 2023 04:02:27 +0000
Date: Thu, 27 Apr 2023 12:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Riley <davidriley@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>,
	Zach Reizner <zachr@chromium.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 4273/6555]
 drivers/gpu/drm/virtio/virtgpu_object.c:176:5: warning: no previous
 prototype for 'virtio_gpu_dma_buf_to_handle'
Message-ID: <202304271105.itobcKYu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: cea7ac75b0485305ef7d58b47c67d4ab82e620a3 [4273/6555] CHROMIUM: drm/virtio: Add interfaces to share dma bufs via virtwl.
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230427/202304271105.itobcKYu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/cea7ac75b0485305ef7d58b47c67d4ab82e620a3
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout cea7ac75b0485305ef7d58b47c67d4ab82e620a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/virtio/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271105.itobcKYu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/virtio/virtgpu_object.c:176:5: warning: no previous prototype for 'virtio_gpu_dma_buf_to_handle' [-Wmissing-prototypes]
     176 | int virtio_gpu_dma_buf_to_handle(struct dma_buf *dma_buf, bool no_wait,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtio_gpu_dma_buf_to_handle +176 drivers/gpu/drm/virtio/virtgpu_object.c

   175	
 > 176	int virtio_gpu_dma_buf_to_handle(struct dma_buf *dma_buf, bool no_wait,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
