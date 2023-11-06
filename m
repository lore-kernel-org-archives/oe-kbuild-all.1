Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011F630
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 02:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQZnyCO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699237652; x=1730773652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fbJgaBkrydLPBMtXr8iNPUh0OCESdL5lpZ4PhRCLRVo=;
  b=XQZnyCO92HwDqp2UFE79p+Qo5SYMWlZgLEwwfV3LAkdVa6qd5GNDYX2A
   zIP5TF06nzE0N/FAkkqQ8FLj/L+ziRYeamONBZjjTU0G/Y7GLP7KyfpLv
   Sr9dXzwAPr/sPC2WYSRMKNqXq7+OhYSHBFSCzzHQ6+PPbpMqAYO1JlS25
   7vMwSHHmHpkcM7GyX1hpTDu0YBzcSBvrQtO7hwZNAJ0iPWNhfMaF3C7Sf
   8Hgpe/e1tiYf4jPNHKjWQUQ3qyYDqLUeOlzwMdD5ufyDDy2LjpDx+/LUN
   yllN+RbhK1V1zhItirxNQi69OtYbULdyCzgREqCjG612i30gbIpICvrjn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420310405"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="420310405"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 18:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="885760714"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="885760714"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2023 18:27:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzpKo-00060x-0V;
	Mon, 06 Nov 2023 02:27:26 +0000
Date: Mon, 6 Nov 2023 10:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 7098/30000]
 drivers/gpu/drm/drm_file.c:789:6: warning: no previous prototype for
 'drm_send_event_helper'
Message-ID: <202311061015.GpMw0ifS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Veera,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2fea3eca9608d8c14fb6963bfe830dfa5985d7de
commit: a9b76c451978471f4e750bbb87f8c9459caeb97c [7098/30000] UPSTREAM: drm/drm_vblank: set the dma-fence timestamp during send_vblank_event
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231106/202311061015.GpMw0ifS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061015.GpMw0ifS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061015.GpMw0ifS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_file.c:789:6: warning: no previous prototype for 'drm_send_event_helper' [-Wmissing-prototypes]
     789 | void drm_send_event_helper(struct drm_device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/drm_send_event_helper +789 drivers/gpu/drm/drm_file.c

   776	
   777	/**
   778	 * drm_send_event_helper - send DRM event to file descriptor
   779	 * @dev: DRM device
   780	 * @e: DRM event to deliver
   781	 * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
   782	 * time domain
   783	 *
   784	 * This helper function sends the event @e, initialized with
   785	 * drm_event_reserve_init(), to its associated userspace DRM file.
   786	 * The timestamp variant of dma_fence_signal is used when the caller
   787	 * sends a valid timestamp.
   788	 */
 > 789	void drm_send_event_helper(struct drm_device *dev,
   790				   struct drm_pending_event *e, ktime_t timestamp)
   791	{
   792		assert_spin_locked(&dev->event_lock);
   793	
   794		if (e->completion) {
   795			complete_all(e->completion);
   796			e->completion_release(e->completion);
   797			e->completion = NULL;
   798		}
   799	
   800		if (e->fence) {
   801			if (timestamp)
   802				dma_fence_signal_timestamp(e->fence, timestamp);
   803			else
   804				dma_fence_signal(e->fence);
   805			dma_fence_put(e->fence);
   806		}
   807	
   808		if (!e->file_priv) {
   809			kfree(e);
   810			return;
   811		}
   812	
   813		list_del(&e->pending_link);
   814		list_add_tail(&e->link,
   815			      &e->file_priv->event_list);
   816		wake_up_interruptible_poll(&e->file_priv->event_wait,
   817			EPOLLIN | EPOLLRDNORM);
   818	}
   819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
