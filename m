Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2BC4D6C2D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 18:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224738; cv=none; b=sY6FEWCCD+V/KlMeyrAlj2R5q0AHEDqBUH8D34NLCDLofdSexS02Wm5ndFRIwkXH25g2AbeILhfVbDO3fCh5HmhewgVZIw92g8Fv0k1Ot6K3Wo6eB66s+58GWbzuWuFN7eb1XkbFQsiVsGuhxB+uZ9YZTjnLS7cJ2WgO63uviGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224738; c=relaxed/simple;
	bh=p37zgv3/BDFagqJPuDi2GcyneybL9jYWCSZKjGGrFlo=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXc5K+2UbeSaZo4q+ZFhKjYCY5wDFQSGgV/dxCSaPCXtaXC+THVwCykjMHFv3tc+KHaIiIkZo/0wYIC0q5SbVJ1aO3VkftU2czvPs1UPP5R7QdrT3UR8bw1x8qk02gXjNJHNkzrBiwFSp/zpkT6pHSNZWlF0B2SQuhmttKVFClk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0TUphvA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0TUphvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224737; x=1822760737;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=p37zgv3/BDFagqJPuDi2GcyneybL9jYWCSZKjGGrFlo=;
  b=O0TUphvA4/2K14jN/7vemW92cme9P3X+bL1gU5sWhhgRLBYeWlPuP3TA
   KzjlYWSq5r83BvC/BGb9JK+nyDGlMLZ0RygYOKjipmu2gHNgYQ2HsKwPG
   lrA7nkzr3C+t/T4GGltTb7MpSEX8VQy0XZHFAs2WX7LoLYIU1Wmbexxy0
   DIXrZ2btBAqh19JmgORi7uB76mSM79m8Mnm98jn+vBEI529E8iPRaihQb
   cOCD55MT8FB6KmfDTm9t4crgwU/TeZMc80bHY56VfRzzFNZgl8Y13dBFt
   CC0bUDD5vvObVQBY0G+izMc15tcTGTLoZ7XaHq7+Z9cL3hzLbUZguIwd9
   w==;
X-CSE-ConnectionGUID: qXNK3EFZTY+d1tyv1hu7sA==
X-CSE-MsgGUID: cZICiZZAS6CZLHwRvP/FXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="95720430"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="95720430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:36 -0700
X-CSE-ConnectionGUID: 7lM96kMrRtm1NeE9Z+ibNw==
X-CSE-MsgGUID: LGX6oaRfRiGtxa2SVK2TlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="284985138"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Oct 2026 11:25:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDnNV-000000000G3-4A4J
	for oe-kbuild-all@lists.linux.dev;
	Mon, 05 Oct 2026 18:25:33 +0000
Date: Mon, 5 Oct 2026 20:25:28 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: accel/qaic: Centralize execution info
Message-ID: <202610052021.MNXYUj0M-lkp@intel.com>
References: <202610052021.MNXYUj0M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610052021.MNXYUj0M-lkp@intel.com>

Hi Carl,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Carl-Vanderlip/accel-qaic-Centralize-execution-info/20261002-193813
base:   
patch link:    https://lore.kernel.org/r/202610052021.MNXYUj0M-lkp%40intel.com
config: parisc-randconfig-r2300-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052021.MNXYUj0M-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052021.MNXYUj0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052021.MNXYUj0M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/qaic/qaic_data.c: In function 'send_bo_list_to_device':
>> drivers/accel/qaic/qaic_data.c:1274:6: warning: variable 'handle' set but not used [-Wunused-but-set-variable]
     u32 handle;
         ^~~~~~


vim +/handle +1274 drivers/accel/qaic/qaic_data.c

  1264	
  1265	static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *file_priv,
  1266					  struct execute_info *exec, struct dma_bridge_chan *dbc,
  1267					  u32 head, u32 *tail)
  1268	{
  1269		struct ww_acquire_ctx acquire_ctx;
  1270		struct bo_slice *slice;
  1271		unsigned long flags;
  1272		struct qaic_bo *bo;
  1273		u64 resize;
> 1274		u32 handle;
  1275		int i, j;
  1276		int ret;
  1277	
  1278		ret = drm_gem_lock_reservations((struct drm_gem_object **)exec->bo_arr,
  1279						exec->count, &acquire_ctx);
  1280		if (ret)
  1281			return ret;
  1282	
  1283		for (i = 0; i < exec->count; i++) {
  1284			resize = exec->is_partial ? exec->resize_arr[i] : 0;
  1285			bo = exec->bo_arr[i];
  1286			handle = exec->handle_arr[i];
  1287			ret = mutex_lock_interruptible(&bo->lock);
  1288			if (ret)
  1289				goto failed_to_send_bo;
  1290	
  1291			/*
  1292			 * Take reference to object before sending to device,
  1293			 * released when transfer is complete (in dbc_irq_threaded_fn()).
  1294			 */
  1295			drm_gem_object_get(&bo->base);
  1296	
  1297			if (!bo->sliced) {
  1298				ret = -EINVAL;
  1299				goto unlock_bo;
  1300			}
  1301	
  1302			if (exec->is_partial && resize > bo->base.size) {
  1303				ret = -EINVAL;
  1304				goto unlock_bo;
  1305			}
  1306	
  1307			spin_lock_irqsave(&dbc->xfer_lock, flags);
  1308			if (bo_queued(bo)) {
  1309				spin_unlock_irqrestore(&dbc->xfer_lock, flags);
  1310				ret = -EINVAL;
  1311				goto unlock_bo;
  1312			}
  1313	
  1314			bo->req_id = dbc->next_req_id++;
  1315	
  1316			list_for_each_entry(slice, &bo->slices, slice) {
  1317				for (j = 0; j < slice->nents; j++)
  1318					slice->reqs[j].req_id = cpu_to_le16(bo->req_id);
  1319	
  1320				if (exec->is_partial && (!resize || resize <= slice->offset))
  1321					/* Configure the slice for no DMA transfer */
  1322					ret = copy_partial_exec_reqs(qdev, slice, 0, dbc, head, tail);
  1323				else if (exec->is_partial && resize < slice->offset + slice->size)
  1324					/* Configure the slice to be partially DMA transferred */
  1325					ret = copy_partial_exec_reqs(qdev, slice,
  1326								     resize - slice->offset, dbc,
  1327								     head, tail);
  1328				else
  1329					ret = copy_exec_reqs(qdev, slice, dbc->id, head, tail);
  1330				if (ret) {
  1331					spin_unlock_irqrestore(&dbc->xfer_lock, flags);
  1332					goto unlock_bo;
  1333				}
  1334			}
  1335			reinit_completion(&bo->xfer_done);
  1336			list_add_tail(&bo->xfer_list, &dbc->xfer_list);
  1337			spin_unlock_irqrestore(&dbc->xfer_lock, flags);
  1338			dma_sync_sgtable_for_device(&qdev->pdev->dev, bo->sgt, bo->dir);
  1339			mutex_unlock(&bo->lock);
  1340		}
  1341	
  1342		goto unlock_resv;
  1343	
  1344	unlock_bo:
  1345		drm_gem_object_put(&bo->base);
  1346		mutex_unlock(&bo->lock);
  1347	failed_to_send_bo:
  1348		for (j = 0; j < i; j++) {
  1349			drm_gem_object_put(&exec->bo_arr[j]->base);
  1350			spin_lock_irqsave(&dbc->xfer_lock, flags);
  1351			bo = list_last_entry(&dbc->xfer_list, struct qaic_bo, xfer_list);
  1352			list_del_init(&bo->xfer_list);
  1353			spin_unlock_irqrestore(&dbc->xfer_lock, flags);
  1354			dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
  1355		}
  1356	unlock_resv:
  1357		drm_gem_unlock_reservations((struct drm_gem_object **)exec->bo_arr,
  1358					    exec->count, &acquire_ctx);
  1359		return ret;
  1360	}
  1361	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
