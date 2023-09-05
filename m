Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5819063D9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 12:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693917922; x=1725453922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4wDt6FfaOc7q6OEoxSnej8FbBdu6znwyUUnrzJo1zWM=;
  b=i4HTXiFiCU8WD3d/THEEsd9Rv4gYaU8TuROUa3vxrNsh/Sk3hWjjBNE0
   IVMmoVt4c76VizwXx1+OutLIAqZK2MBtL5bCBIwhoWS5pXLQ3IL0AmfvR
   mR7jKkwXq1DOOwvGFjDpEJh+V9L6TzpihE0FkMSoS3u6Zm45zRjkFxbvG
   I82znqqXgKDzEW3x3cey4TIp3biEOYh8ciaxK13sLXTC315DV1K1n0T5f
   9h/a3z2auEiMVjJWjUHtRGfvBn9ieRXsg7tYIv0gD4ytfmUreBlxG4V9W
   Xv7loY6zCEnbRwfmsneqIw9wprRgp9quraerGkhVhLeocHWkJxL4y+VbB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="443181992"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="443181992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 05:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914826084"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="914826084"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Sep 2023 05:45:17 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdVQd-0001fj-02;
	Tue, 05 Sep 2023 12:45:12 +0000
Date: Tue, 5 Sep 2023 20:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [linux-next:master 13355/13985]
 drivers/gpu/drm/nouveau/nouveau_fence.c:210:45: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202309052034.pmZzofzh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c50216cfa084d5eb67dc10e646a3283da1595bb6
commit: 978474dc8278f661930e02e08d292a45a45fa01a [13355/13985] drm/nouveau: fence: fix undefined fence state after emit
config: i386-randconfig-061-20230904 (https://download.01.org/0day-ci/archive/20230905/202309052034.pmZzofzh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309052034.pmZzofzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309052034.pmZzofzh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nouveau_fence.c:210:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct nouveau_channel *chan @@     got struct nouveau_channel [noderef] __rcu *channel @@
   drivers/gpu/drm/nouveau/nouveau_fence.c:210:45: sparse:     expected struct nouveau_channel *chan
   drivers/gpu/drm/nouveau/nouveau_fence.c:210:45: sparse:     got struct nouveau_channel [noderef] __rcu *channel
   drivers/gpu/drm/nouveau/nouveau_fence.c:418:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct nouveau_channel [noderef] __rcu *channel @@     got struct nouveau_channel *chan @@
   drivers/gpu/drm/nouveau/nouveau_fence.c:418:24: sparse:     expected struct nouveau_channel [noderef] __rcu *channel
   drivers/gpu/drm/nouveau/nouveau_fence.c:418:24: sparse:     got struct nouveau_channel *chan

vim +210 drivers/gpu/drm/nouveau/nouveau_fence.c

   206	
   207	int
   208	nouveau_fence_emit(struct nouveau_fence *fence)
   209	{
 > 210		struct nouveau_channel *chan = fence->channel;
   211		struct nouveau_fence_chan *fctx = chan->fence;
   212		struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
   213		int ret;
   214	
   215		fence->timeout  = jiffies + (15 * HZ);
   216	
   217		if (priv->uevent)
   218			dma_fence_init(&fence->base, &nouveau_fence_ops_uevent,
   219				       &fctx->lock, fctx->context, ++fctx->sequence);
   220		else
   221			dma_fence_init(&fence->base, &nouveau_fence_ops_legacy,
   222				       &fctx->lock, fctx->context, ++fctx->sequence);
   223		kref_get(&fctx->fence_ref);
   224	
   225		ret = fctx->emit(fence);
   226		if (!ret) {
   227			dma_fence_get(&fence->base);
   228			spin_lock_irq(&fctx->lock);
   229	
   230			if (unlikely(fctx->killed)) {
   231				spin_unlock_irq(&fctx->lock);
   232				dma_fence_put(&fence->base);
   233				return -ENODEV;
   234			}
   235	
   236			if (nouveau_fence_update(chan, fctx))
   237				nvif_event_block(&fctx->event);
   238	
   239			list_add_tail(&fence->head, &fctx->pending);
   240			spin_unlock_irq(&fctx->lock);
   241		}
   242	
   243		return ret;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
