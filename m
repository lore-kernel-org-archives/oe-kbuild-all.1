Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEED78F54
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 01:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762047400; cv=none; b=Rb9Kwu3POHl5zdns0pwg+pxmoKbU2PjAVzWiC+CKFeBncysAuHPzWFYQV8sTmXxrHxih4U9Y4IRJ1EZAy+ZU+QnXZJ1I+NCOVRtxca58I92J5YKRq3BOjjf+jaI7W5yI0g3lEgmLR67k7t/w0qeczXVU8/y9x55O6HY9aLjRsTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762047400; c=relaxed/simple;
	bh=ekE/yMIQIzZSmj3WTw8LwBt5UHgpRYTc43aORyiYF7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kIoiTYIWMwwD9I4gZKNKFYg1K5KVnUDwS6pMRna90r8kubLVhQLKkdcKZ0/XxqTTIjOUh5iZvVvFjKcJip3qPYEMp5w8wSsuai1aq0SmlQcPQu7G8bbJc8L+t52ZAHeYCVVPlypxYu9PBYIR9hgFKhaonuJhYpJDpHfvHAkRUQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZsn7xze; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZsn7xze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762047398; x=1793583398;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ekE/yMIQIzZSmj3WTw8LwBt5UHgpRYTc43aORyiYF7A=;
  b=cZsn7xzeI8+sBPEysNSI4L0jX4/2msFEMPBMwMfu7jl8w6ISNmfuj1Rh
   o1U32A74wv1tlOas4qroAFbGufH9bOFwJfhJXQ3GJbRtobittDPK+gPyV
   RZ80lhlK+LIisd6K5ZZ12gGSrN6uQ1jjtQOGfHJygpV2bYMGpBzK+Sdz5
   vfhPWMI9R1UsIxO1XdrnvfOSU02VEUQb5iRU6qd45sX0E147jnVpUszh3
   uvH4/q32kc+2RzYhd0dAwxTOeLeeU2Jb2Y1hvBbKI8tinUxser0+GefH4
   hL/HMFvnVFWwkiIAskKiwD82/r908WWVzvKIXQSRu8Wdv3zc+ugUAqTHZ
   g==;
X-CSE-ConnectionGUID: nWXtWRZTS7e5Fd55B947LQ==
X-CSE-MsgGUID: F2R4e7PJTaO9E1Tn3naUDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64316863"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="64316863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 18:36:37 -0700
X-CSE-ConnectionGUID: oshbK108Twuj7cCaXehmmw==
X-CSE-MsgGUID: bJiMJLZHRAikaUbtjPowWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="217191444"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Nov 2025 18:36:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFN1F-000Osu-2M;
	Sun, 02 Nov 2025 01:36:33 +0000
Date: Sun, 2 Nov 2025 09:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: drivers/gpu/drm/drm_gem_shmem_helper.c:560:undefined reference to
 `vmf_insert_pfn'
Message-ID: <202511020901.GlNgowuw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi LiangCheng,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   691d401c7e0e5ea34ac6f8151bc0696db1b2500a
commit: 0c4932f6ddf815618fa34f7403df682aed7862b5 drm/tiny: pixpaper: Fix missing dependency on DRM_GEM_SHMEM_HELPER
date:   6 weeks ago
config: arm-randconfig-004-20251102 (https://download.01.org/0day-ci/archive/20251102/202511020901.GlNgowuw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020901.GlNgowuw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020901.GlNgowuw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_gem_shmem_helper.o: in function `drm_gem_shmem_fault':
>> drivers/gpu/drm/drm_gem_shmem_helper.c:560:(.text+0x1a2): undefined reference to `vmf_insert_pfn'
   arm-linux-gnueabi-ld: (vmf_insert_pfn): Unknown destination type (ARM/Thumb) in drivers/gpu/drm/drm_gem_shmem_helper.o
>> drivers/gpu/drm/drm_gem_shmem_helper.c:560:(.text+0x1a2): dangerous relocation: unsupported relocation

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - DRM_PIXPAPER [=y] && HAS_IOMEM [=y] && DRM [=y] && SPI [=y]


vim +560 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db71 Noralf Trønnes  2019-03-12  537  
2194a63a818db71 Noralf Trønnes  2019-03-12  538  static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
2194a63a818db71 Noralf Trønnes  2019-03-12  539  {
2194a63a818db71 Noralf Trønnes  2019-03-12  540  	struct vm_area_struct *vma = vmf->vma;
2194a63a818db71 Noralf Trønnes  2019-03-12  541  	struct drm_gem_object *obj = vma->vm_private_data;
2194a63a818db71 Noralf Trønnes  2019-03-12  542  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
2194a63a818db71 Noralf Trønnes  2019-03-12  543  	loff_t num_pages = obj->size >> PAGE_SHIFT;
d611b4a0907cece Neil Roberts    2021-02-23  544  	vm_fault_t ret;
2194a63a818db71 Noralf Trønnes  2019-03-12  545  	struct page *page;
11d5a4745e00e73 Neil Roberts    2021-02-23  546  	pgoff_t page_offset;
11d5a4745e00e73 Neil Roberts    2021-02-23  547  
11d5a4745e00e73 Neil Roberts    2021-02-23  548  	/* We don't use vmf->pgoff since that has the fake offset */
11d5a4745e00e73 Neil Roberts    2021-02-23  549  	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
2194a63a818db71 Noralf Trønnes  2019-03-12  550  
21aa27ddc582693 Dmitry Osipenko 2023-05-30  551  	dma_resv_lock(shmem->base.resv, NULL);
2194a63a818db71 Noralf Trønnes  2019-03-12  552  
11d5a4745e00e73 Neil Roberts    2021-02-23  553  	if (page_offset >= num_pages ||
3f6a1e22fae95a5 Dmitry Osipenko 2022-11-16  554  	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
d611b4a0907cece Neil Roberts    2021-02-23  555  	    shmem->madv < 0) {
d611b4a0907cece Neil Roberts    2021-02-23  556  		ret = VM_FAULT_SIGBUS;
d611b4a0907cece Neil Roberts    2021-02-23  557  	} else {
11d5a4745e00e73 Neil Roberts    2021-02-23  558  		page = shmem->pages[page_offset];
2194a63a818db71 Noralf Trønnes  2019-03-12  559  
8b93d1d7dbd578f Simona Vetter   2021-08-12 @560  		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
d611b4a0907cece Neil Roberts    2021-02-23  561  	}
d611b4a0907cece Neil Roberts    2021-02-23  562  
21aa27ddc582693 Dmitry Osipenko 2023-05-30  563  	dma_resv_unlock(shmem->base.resv);
d611b4a0907cece Neil Roberts    2021-02-23  564  
d611b4a0907cece Neil Roberts    2021-02-23  565  	return ret;
2194a63a818db71 Noralf Trønnes  2019-03-12  566  }
2194a63a818db71 Noralf Trønnes  2019-03-12  567  

:::::: The code at line 560 was first introduced by commit
:::::: 8b93d1d7dbd578fd296e70008b29c0f62d09d7cb drm/shmem-helper: Switch to vmf_insert_pfn

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
