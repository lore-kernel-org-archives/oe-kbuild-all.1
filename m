Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6570E17ADC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 23:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692227411; x=1723763411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nMdgedN70vrbNDaJRWyo00SqwCYBCwzZSqbhpkVhS8=;
  b=T/rdKZ1PtG5TOx4hhSt2YEOJA3JMbN9b8uXOm4w2EE2nWr6xCn1hNvdu
   TZK8oyUJW9bgFbE2WMhHdaXD0XuqAdcrLYHmCxWVVPCFm9zJ34T4+E5s2
   jlYxqxxbPUNr4CE1GGKqbUoohVhBIIUy1b8odQhBBD7THJ1qszJDMFQO5
   /hrw+swu22AZX+ckmkRIfib2FBViTMPtS3tQLtAIO+DcVoKFux5Bynkrl
   Bb6j1/xxy3WMGs4HwKJx8Dufjovt5H6HVwwrqeI9kuMsC2K2kKRzGLwnD
   24d1XfEfnU7ddg4v8z2Sml1fZv0Z0mAeht9GulCe9q6q/uuzHXv30HKKt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436562254"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="436562254"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 16:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="711286702"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="711286702"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Aug 2023 16:10:08 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWPeJ-0000db-2x;
	Wed, 16 Aug 2023 23:10:01 +0000
Date: Thu, 17 Aug 2023 07:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Riley <davidriley@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>,
	Zach Reizner <zachr@chromium.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 4273/6555]
 drivers/gpu/drm/virtio/virtgpu_object.c:176:5: warning: no previous
 declaration for 'virtio_gpu_dma_buf_to_handle'
Message-ID: <202308170756.lct0sTvU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: cea7ac75b0485305ef7d58b47c67d4ab82e620a3 [4273/6555] CHROMIUM: drm/virtio: Add interfaces to share dma bufs via virtwl.
config: i386-randconfig-r025-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170756.lct0sTvU-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170756.lct0sTvU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170756.lct0sTvU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/virtio/virtgpu_object.c:176:5: warning: no previous declaration for 'virtio_gpu_dma_buf_to_handle' [-Wmissing-declarations]
    int virtio_gpu_dma_buf_to_handle(struct dma_buf *dma_buf, bool no_wait,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtio_gpu_dma_buf_to_handle +176 drivers/gpu/drm/virtio/virtgpu_object.c

   175	
 > 176	int virtio_gpu_dma_buf_to_handle(struct dma_buf *dma_buf, bool no_wait,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
