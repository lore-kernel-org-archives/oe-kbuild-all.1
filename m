Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7852B9BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 03:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766632086; cv=none; b=iJrT6Dj05Zuqqb1cQbDf0xMfNn/NFIpIDVVHSGuDP6B3eujRmPdErXuBQmbRZN7MEI2WtXx2hvndsU/qhlWt6hCnhHQU1BtgmAJRAc7yqxZSp6Ibj7rt74r5JXJ6pRRAYYZfzyfcNXIvdyJoUjItuCZIDKaJzPktJFq7Bt/s2Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766632086; c=relaxed/simple;
	bh=VSM0krmgDpKSZDmujQl3O7004zJrl3xWTsumye+KUOo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nzqeAmL0diuGOQCtJMVjf7UTHXoI3zePGsfKnZNPK6lh7dDQQaSZDzFrgdYmXSZqdMOsfAskQpfAbk2K4Utp5ZrNPIRMJXJy1Nowj7liCRe/PYOUKmOu1GPWBNYvDVOfJHYQoCBPfEU0fK7RV8RqVzNKIlduSKOeI5zZsOxqadw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2/7HXL9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2/7HXL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766632084; x=1798168084;
  h=date:from:to:cc:subject:message-id;
  bh=VSM0krmgDpKSZDmujQl3O7004zJrl3xWTsumye+KUOo=;
  b=Y2/7HXL996SW75V/3uUjf3WouGjPxq1U4Pi1JqkbyrhyZpgegZMD7BT+
   gIrvfAaM5c+AAmgwEmgY1F6VJS/m9g5gAw7S/oZh+IiaIUZFhlCNONjMI
   E0uDpQ65QRCT2qiTIDiDcs7GGnbq1D2cTFRM0hgA0pXz3bMTaI11/guIC
   WvrJDruSRTZrNo6L/kgFfjtG9F8P4AeiSHzhbENkOl/F96nCPTHfMNO4z
   hTWfKIP2+0Hfp1kt6A8sGoNlGYTnz1HaGxsX3L3tPmfEQkafOBgHKc8S2
   L9HDjoAXGQIOqP/ckxGBc2ilo6NY9+dJt/4lCApgBRxoGQfj7i1kE/I36
   A==;
X-CSE-ConnectionGUID: mb2lwhPtRyCyt4zGP2jQIg==
X-CSE-MsgGUID: 2L+KWHehQXisQUslRKi30A==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="91106196"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="91106196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 19:08:03 -0800
X-CSE-ConnectionGUID: k2IVUbN8QbCubT7uZxNHfQ==
X-CSE-MsgGUID: G5naW/RbTPivG+Ti3fxokA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200047318"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Dec 2025 19:08:02 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYbhn-000000003gL-3mmF;
	Thu, 25 Dec 2025 03:07:59 +0000
Date: Thu, 25 Dec 2025 11:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 drivers/gpu/drm/drm_file.c:789:6: warning: no previous prototype for
 'drm_send_event_helper'
Message-ID: <202512251129.Mt3tXzJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Veera,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: a9b76c451978471f4e750bbb87f8c9459caeb97c [0/4] UPSTREAM: drm/drm_vblank: set the dma-fence timestamp during send_vblank_event
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251225/202512251129.Mt3tXzJo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251129.Mt3tXzJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251129.Mt3tXzJo-lkp@intel.com/

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
