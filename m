Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C013AFA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695025475; x=1726561475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCWoiA/y7wlUbGBMEITz5t+dFg0+NODF9e3hIrfLlHM=;
  b=bWDe2D8tA4U3wMSgCJbEUgF6R22ofxmcN1z5VS88JeMCtRjAfQi5EBL1
   twOGEDR4RDijrfpOZxrJzM998rMUEL5KGuErUEvcig409N33ZZ3ock5eC
   8hfFYK1ylf2Lip1rOl1MA6GY4TKdG1mgLVUIw9wCCFUqPqd3acR9+bMdI
   lzG3rqT9QRXPuCY+C4xGp0y06xszJxTVis47mG+47U/CTlHYD9s53d7Yy
   EQWRwfDZCWaPynaKENW3GeVlKG46F+RiU9vCbYsp2fab6JpV0NmzYLy18
   k1haX8OTedag7CkSRzZoYGBcFYv5PTsAOfiNEDUhaxM+4LE20OLm/b5l5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410553207"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="410553207"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 01:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695446531"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="695446531"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Sep 2023 01:24:33 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi9YV-0005vU-0k;
	Mon, 18 Sep 2023 08:24:31 +0000
Date: Mon, 18 Sep 2023 16:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 81/87]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:258: undefined reference to
 `__udivdi3'
Message-ID: <202309181639.XEwufJ6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   0e721db5649d18bcfb3219434d24af61bf5afb15
commit: bd8dac2b4d91ff21d9cb9e58c0e68fe385215e87 [81/87] drm/nouveau/fifo/r535: initial support
config: i386-randconfig-012-20230918 (https://download.01.org/0day-ci/archive/20230918/202309181639.XEwufJ6z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309181639.XEwufJ6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309181639.XEwufJ6z-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.o: in function `r535_chan_id_get_locked':
>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:258: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `nv50_sor_dp_watermark_sst':
   drivers/gpu/drm/nouveau/dispnv50/disp.c:1659: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.c:1664: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.c:1665: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.c:1665: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o:drivers/gpu/drm/nouveau/dispnv50/disp.c:1694: more undefined references to `__udivdi3' follow


vim +258 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c

   241	
   242	static int
   243	r535_chan_id_get_locked(struct nvkm_chan *chan, struct nvkm_memory *muserd, u64 ouserd)
   244	{
   245		const u32 userd_size = CHID_PER_USERD * chan->func->userd->size;
   246		struct nvkm_runl *runl = chan->cgrp->runl;
   247		struct nvkm_fifo *fifo = runl->fifo;
   248		struct r535_chan_userd *userd;
   249		u32 chid;
   250		int ret;
   251	
   252		if (ouserd + chan->func->userd->size >= userd_size ||
   253		    (ouserd & (chan->func->userd->size - 1))) {
   254			RUNL_DEBUG(runl, "ouserd %llx", ouserd);
   255			return -EINVAL;
   256		}
   257	
 > 258		chid = ouserd / chan->func->userd->size;
   259	
   260		list_for_each_entry(userd, &fifo->userd.list, head) {
   261			if (userd->mem == muserd) {
   262				if (userd->used & BIT(chid))
   263					return -EBUSY;
   264				break;
   265			}
   266		}
   267	
   268		if (&userd->head == &fifo->userd.list) {
   269			if (nvkm_memory_size(muserd) < userd_size) {
   270				RUNL_DEBUG(runl, "userd too small");
   271				return -EINVAL;
   272			}
   273	
   274			userd = kzalloc(sizeof(*userd), GFP_KERNEL);
   275			if (!userd)
   276				return -ENOMEM;
   277	
   278			userd->chid = nvkm_chid_get(runl->chid, chan);
   279			if (userd->chid < 0) {
   280				ret = userd->chid;
   281				kfree(userd);
   282				return ret;
   283			}
   284	
   285			userd->mem = nvkm_memory_ref(muserd);
   286	
   287			ret = nvkm_memory_kmap(userd->mem, &userd->map);
   288			if (ret) {
   289				nvkm_chid_put(runl->chid, userd->chid, &chan->cgrp->lock);
   290				kfree(userd);
   291				return ret;
   292			}
   293	
   294	
   295			list_add(&userd->head, &fifo->userd.list);
   296		}
   297	
   298		userd->used |= BIT(chid);
   299	
   300		chan->userd.mem = nvkm_memory_ref(userd->map);
   301		chan->userd.base = ouserd;
   302	
   303		return (userd->chid * CHID_PER_USERD) + chid;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
