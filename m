Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA7281530
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777739245; cv=none; b=JiWrHPD8y+QZZxfKvIys2+DEKlk5kw3N1nFoMbN6mbd1IKUjBckx8G5u9TMAwF/cSltD1LtL2mYbhtqbbJZry2Jhb0Al2jwuubSnA680tBUPzG0/jLEH6ULvr3iPtf29va3H83ao/aHxESTc052PLCo+v6dCOXWCarkiz7tB/Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777739245; c=relaxed/simple;
	bh=s5Lhf8+7Vm1t29nKdK0ncZBEuJLN36g/rQL0RSkPZdc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cfd122zaiV+mfEdZ7a4P6MJKzrGfzpal18HlFuAjbDKbrDCGGhADZv3vLTS99Kd7NtNSEK42DX4fe120J4tZopH/9Ncoz459CWLMhBmRKiiNFg1Hjj8+Lj6GAzMGponYrUw8Rmecl7y6P/1Os/m/CgGZfqo0CzBFdZLNGqgJekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpdyiZuS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpdyiZuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777739244; x=1809275244;
  h=date:from:to:cc:subject:message-id;
  bh=s5Lhf8+7Vm1t29nKdK0ncZBEuJLN36g/rQL0RSkPZdc=;
  b=ZpdyiZuS+wLiG61+wSWsuB34GTao+vt7k7uwB+P06uOMHRWSvPPksXWA
   +R0lpvQsrNQdHRrBbrlTjBwZcKf1GL4JTS2OyxnD2r/xbQ3jUFAYTZp63
   ajRwrDNw3doqAPFbWWtj/WpYERLHPdvlrjNxKNJBSZzS7DciUlMfUoi2C
   otINBfMBoe+C/ufIm6PXkycTnqBsDfgU4aK3hXrbUYr1wjeWwRbWBaQqu
   f7bzHfm3mRhp3472Po/pblqXaXJfLaXQfwoFgFKQiEeV155wO1bBopOGW
   15cMwsfa/OlH41hIMtZWz72bBw+9dmpdl9fVRv3ni18++ZDLkghz20vrY
   Q==;
X-CSE-ConnectionGUID: brV8lAbRTHu6HlnE2ksVTg==
X-CSE-MsgGUID: hnU94TFqRAyujsbVQaLWqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="90047650"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="90047650"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 09:27:24 -0700
X-CSE-ConnectionGUID: wqm1F0fRTjqVHEKrk/wTtQ==
X-CSE-MsgGUID: 66STDkWaRDOZRUm1rhwz5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="230760749"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2026 09:27:22 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJDBX-000000001ZV-3SPG;
	Sat, 02 May 2026 16:27:19 +0000
Date: Sun, 03 May 2026 00:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v3 14/17]
 drivers/nvme/host/pci.c:2424:6: warning: variable 'sgt' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202605030024.wuJbBTP0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v3
head:   2226dcdd68e72043edf2bad602e2ce5723dbe16b
commit: d0c0b63bed4b3f44c0f1cb157b0143e4e9da1009 [14/17] nvme-pci: implement dma_token backed requests
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605030024.wuJbBTP0-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030024.wuJbBTP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030024.wuJbBTP0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:2424:6: warning: variable 'sgt' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!dma_list) {
               ^~~~~~~~~
   drivers/nvme/host/pci.c:2455:6: note: uninitialized use occurs here
           if (sgt)
               ^~~
   drivers/nvme/host/pci.c:2424:2: note: remove the 'if' if its condition is always false
           if (!dma_list) {
           ^~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2412:22: note: initialize the variable 'sgt' to silence this warning
           struct sg_table *sgt;
                               ^
                                = NULL
   1 warning generated.


vim +2424 drivers/nvme/host/pci.c

  2403	
  2404	static struct io_dmabuf_map *nvme_dmabuf_token_map(struct io_dmabuf_token *token)
  2405	{
  2406		struct nvme_dmabuf_token *data = token->dev_priv;
  2407		struct dma_buf_attachment *attach = data->attach;
  2408		dma_addr_t *dma_list = NULL;
  2409		unsigned long tmp, i = 0;
  2410		struct nvme_dmabuf_map *map;
  2411		struct scatterlist *sg;
  2412		struct sg_table *sgt;
  2413		unsigned nr_entries;
  2414		int ret;
  2415	
  2416		dma_resv_assert_held(token->dmabuf->resv);
  2417	
  2418		map = kmalloc(sizeof(*map), GFP_KERNEL);
  2419		if (!map)
  2420			return ERR_PTR(-ENOMEM);
  2421	
  2422		nr_entries = token->dmabuf->size / NVME_CTRL_PAGE_SIZE;
  2423		dma_list = kmalloc_array(nr_entries, sizeof(dma_list[0]), GFP_KERNEL);
> 2424		if (!dma_list) {
  2425			ret = -ENOMEM;
  2426			goto err;
  2427		}
  2428	
  2429		sgt = dma_buf_map_attachment(attach, token->dir);
  2430		if (IS_ERR(sgt)) {
  2431			ret = PTR_ERR(sgt);
  2432			sgt = NULL;
  2433			goto err;
  2434		}
  2435	
  2436		for_each_sgtable_dma_sg(sgt, sg, tmp) {
  2437			dma_addr_t dma = sg_dma_address(sg);
  2438			unsigned long sg_len = sg_dma_len(sg);
  2439	
  2440			while (sg_len) {
  2441				dma_list[i++] = dma;
  2442				dma += NVME_CTRL_PAGE_SIZE;
  2443				sg_len -= NVME_CTRL_PAGE_SIZE;
  2444			}
  2445		}
  2446	
  2447		ret = io_dmabuf_init_map(token, &map->base);
  2448		if (ret)
  2449			goto err;
  2450		map->nr_entries = nr_entries;
  2451		map->dma_list = dma_list;
  2452		map->sgt = sgt;
  2453		return &map->base;
  2454	err:
  2455		if (sgt)
  2456			dma_buf_unmap_attachment(attach, sgt, token->dir);
  2457		kfree(map);
  2458		kfree(dma_list);
  2459		return ERR_PTR(ret);
  2460	}
  2461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
