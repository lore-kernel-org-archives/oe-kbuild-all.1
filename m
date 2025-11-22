Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AFB218827
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 04:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763784867; cv=none; b=T3d4KxPcwS9sUexN8ULmOXY66lRbjegMrysxMDbaisaNtvi10Q2rh6tRkz9ppyKP7NN79IEUyWyc+0bm74qAkUUkd4OHDvny/t88Y05D46z1HtE/V0T3ELxGbN+M0fh+wn/6/zx8j1OuxjGYU5xIjnMYCyelfX+qquAby1faxMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763784867; c=relaxed/simple;
	bh=/Tmdks/gvr312XnwfKaZeq0WIJY0PsYwOO5ci0KLZ/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFY2ol18jEWdjXXHvNB7jdcT1v4dgZF9HyPe60QepJiEHMfMGPg2w1FL7ig3vs89NDlFdii2xE9LoVQ6YZT7BKHA3eVf2GA4yk1ym7Y6aH5GRlm+ckPYixmJZ0a+PTZ0e9uNo6N+qC1Sfc822YGRDE3DedpF7TSR4yeO2ceBNvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eY3zJcUI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eY3zJcUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763784865; x=1795320865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Tmdks/gvr312XnwfKaZeq0WIJY0PsYwOO5ci0KLZ/0=;
  b=eY3zJcUIxrTtJjRJYcpKNV36x69ngtG7gGJglnojd8Qp45sb6TALr7/l
   660FigYw+tABNQteGJvtzAelCudQPT8qUGUfuEUorC9O2jZk4rNxEW/Cs
   K1AbApZBd61FvhNvKa4CTYDh52fHKdSqAA80JNOpk7So+ZgminOb4UZkr
   ODkpO3yjsyXuNk8blHBv5hbe4RmNu2C4Ciuo40J0pl6W4WikTxgEQgq19
   G808AT6bE9ukhVZI61Dmg/ZzBXbLpP4JxrdSDqx3kh3DO7MwoArtPjoz7
   URmkjQtIZ4xrKLM3/Q7lhjQMsTy7Q0mopPkZR8xJ+Qg0TR/vfhp29oN1L
   w==;
X-CSE-ConnectionGUID: T/OYvLjHSr2lUkBsOQcWaw==
X-CSE-MsgGUID: X79feIBHToCh5GsYQXtI/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76561887"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="76561887"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 20:14:23 -0800
X-CSE-ConnectionGUID: EHMlKnMxTD+66WuLEvxAfQ==
X-CSE-MsgGUID: F1FpRlsnRuCfsoLd5Ugo6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="192320415"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2025 20:14:23 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMf0u-00079Z-1U;
	Sat, 22 Nov 2025 04:14:20 +0000
Date: Sat, 22 Nov 2025 12:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3304/3304] mm/gmem.c:813:29: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202511221253.wiWo5CIW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2e375b157ddf25336989b074c1f2a88a80ab72f5
commit: 8a89dde40c2bd82755f374bc86b46c77acdfd0b6 [3304/3304] mm: implement hmemcpy API
config: arm64-randconfig-r122-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221253.wiWo5CIW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221253.wiWo5CIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221253.wiWo5CIW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/gmem.c:384:13: sparse: sparse: symbol 'gm_dev_fault' was not declared. Should it be static?
>> mm/gmem.c:813:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int enum gm_ret ret @@     got restricted vm_fault_t @@
   mm/gmem.c:813:29: sparse:     expected unsigned int enum gm_ret ret
   mm/gmem.c:813:29: sparse:     got restricted vm_fault_t

vim +813 mm/gmem.c

   765	
   766	static void do_hmemcpy(struct mm_struct *mm, int hnid, unsigned long dest,
   767			unsigned long src, size_t size)
   768	{
   769		enum gm_ret ret;
   770		int page_size = HPAGE_SIZE;
   771		struct vm_area_struct *vma_dest, *vma_src;
   772		struct gm_mapping *gm_mapping_dest, *gm_mapping_src;
   773		struct gm_dev *dev = NULL;
   774		struct gm_memcpy_t gmc = {0};
   775	
   776		if (size == 0)
   777			return;
   778	
   779		mmap_read_lock(mm);
   780		vma_dest = find_vma(mm, dest);
   781		vma_src = find_vma(mm, src);
   782	
   783		if (!vma_src || vma_src->vm_start > src || !vma_dest || vma_dest->vm_start > dest) {
   784			gmem_err("hmemcpy: the vma find by src/dest is NULL!");
   785			goto unlock_mm;
   786		}
   787	
   788		gm_mapping_dest = vm_object_lookup(vma_dest->vm_obj, dest & ~(page_size - 1));
   789		gm_mapping_src = vm_object_lookup(vma_src->vm_obj, src & ~(page_size - 1));
   790	
   791		if (!gm_mapping_src) {
   792			gmem_err("hmemcpy: gm_mapping_src is NULL");
   793			goto unlock_mm;
   794		}
   795	
   796		if (gm_mapping_nomap(gm_mapping_src)) {
   797			gmem_err("hmemcpy: src address is not mapping to CPU or device");
   798			goto unlock_mm;
   799		}
   800	
   801		if (hnid != -1) {
   802			dev = get_gm_dev(hnid);
   803			if (!dev) {
   804				gmem_err("hmemcpy: hnode's dev is NULL");
   805				goto unlock_mm;
   806			}
   807		}
   808	
   809		// Trigger dest page fault on host or device
   810		if (!gm_mapping_dest || gm_mapping_nomap(gm_mapping_dest)
   811			|| !hnid_match_dest(hnid, gm_mapping_dest)) {
   812			if (hnid == -1) {
 > 813				ret = handle_mm_fault(vma_dest, dest & ~(page_size - 1), FAULT_FLAG_USER |
   814							FAULT_FLAG_INSTRUCTION | FAULT_FLAG_WRITE, NULL);
   815				if (ret) {
   816					gmem_err("%s: failed to execute host page fault, ret:%d",
   817						__func__, ret);
   818					goto unlock_mm;
   819				}
   820			} else {
   821				ret = gm_dev_fault_locked(mm, dest & ~(page_size - 1), dev, MADV_WILLNEED);
   822				if (ret != GM_RET_SUCCESS) {
   823					gmem_err("%s: failed to excecute dev page fault.", __func__);
   824					goto unlock_mm;
   825				}
   826			}
   827		}
   828		if (!gm_mapping_dest)
   829			gm_mapping_dest = vm_object_lookup(vma_dest->vm_obj, round_down(dest, page_size));
   830	
   831		if (gm_mapping_dest && gm_mapping_dest != gm_mapping_src)
   832			mutex_lock(&gm_mapping_dest->lock);
   833	
   834		mutex_lock(&gm_mapping_src->lock);
   835		// Use memcpy when there is no device address, otherwise use peer_memcpy
   836		if (hnid == -1) {
   837			if (gm_mapping_cpu(gm_mapping_src)) { // host to host
   838				gmem_err("hmemcpy: host to host is unimplemented\n");
   839				goto unlock_gm_mapping;
   840			} else if (gm_mapping_device(gm_mapping_src)) { // device to host
   841				dev = gm_mapping_src->dev;
   842				gmc.dest = phys_to_dma(dev->dma_dev,
   843					page_to_phys(gm_mapping_dest->page) + (dest & (page_size - 1)));
   844				gmc.src = gm_mapping_src->gm_page->dev_dma_addr + (src & (page_size - 1));
   845				gmc.kind = GM_MEMCPY_D2H;
   846			} else {
   847				gmem_err("hmemcpy: src address is not mapping to CPU or device");
   848				goto unlock_gm_mapping;
   849			}
   850		} else {
   851			if (gm_mapping_cpu(gm_mapping_src)) { // host to device
   852				gmc.dest = gm_mapping_dest->gm_page->dev_dma_addr +
   853							(dest & (page_size - 1));
   854				gmc.src = phys_to_dma(dev->dma_dev,
   855					page_to_phys(gm_mapping_src->page) + (src & (page_size - 1)));
   856				gmc.kind = GM_MEMCPY_H2D;
   857			} else if (gm_mapping_device(gm_mapping_src)) { // device to device
   858				gmem_err("hmemcpy: device to device is unimplemented\n");
   859				goto unlock_gm_mapping;
   860			} else {
   861				gmem_err("hmemcpy: src address is not mapping to CPU or device");
   862				goto unlock_gm_mapping;
   863			}
   864		}
   865		gmc.mm = mm;
   866		gmc.dev = dev;
   867		gmc.size = size;
   868		dev->mmu->peer_hmemcpy(&gmc);
   869	
   870	unlock_gm_mapping:
   871		mutex_unlock(&gm_mapping_src->lock);
   872		if (gm_mapping_dest && gm_mapping_dest != gm_mapping_src)
   873			mutex_unlock(&gm_mapping_dest->lock);
   874	unlock_mm:
   875		mmap_read_unlock(mm);
   876	}
   877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
