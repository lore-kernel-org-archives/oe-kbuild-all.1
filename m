Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C4F329E7B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976828; cv=none; b=Y/4KQ9tvs6QItLLRALqCBd/5uKyjScxKN+ZdI/hkUhPuXxuFC6fDfUOQryjhTwtN1jVbsLojORowsznktUShVDhbcqEO3DRnsShn45DUeX/lrAnanXxUlCSbBdsKHkiEruBWlu0wK+P/5VxTBTpk3Hzv12n+AH6jThOC9Y3kuyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976828; c=relaxed/simple;
	bh=TP07gOAs3B0am8i5Rt0ojHWjVvM7C8IRoD/4mTj1Hho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1vuIH246dJndGlQrsdCJbJPdH18c0exYwsvRD+0/JUgfKTB/tuug/eRD73N3ukzbESuTpq/U7DTmoRQS5gVFMl8HkJa3R6klpHiadGZVz3I1tfoCHAvoO5lGsPnOWuJJZbc5MQb9E+DFT2oHn9mZyIKiU0Mn1K+H7GvetG9r5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDjZD+OY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDjZD+OY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767976827; x=1799512827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TP07gOAs3B0am8i5Rt0ojHWjVvM7C8IRoD/4mTj1Hho=;
  b=hDjZD+OYoMz2M7Yy+xwQK/qBFIkmD6tztP77/en58/duzChG6FNZtS5H
   rxPQGyp2KmM5UA901NW+412ZoGvh10iYiq4/9YR8rgu5MG000CF0vlOKG
   YtFIHOhLokNkwwGdBlUF63C1lX8IIeO8sORLjfVz1QgCOi/+91EZQQw2n
   pVSaTwPrOYhjMlU0y6ihwLCTKQ9DRMg/XZtWlh0WXsEdJJbUYI6T0jTfH
   gpDTWPzK5fe18So2rzgDyKRfCLXtpPdgb1AXs4pJ/qdOFF1gXIsSctE3J
   FD0uUKvt3b/W+n7E9gUg3IEAUsyqLEjq4hiJD7kmvsNHAvQ2wHhR8XmDo
   w==;
X-CSE-ConnectionGUID: vSn3VOvHRSWNZolbITcLHA==
X-CSE-MsgGUID: ePb6su9mTASNmtAv/qh+5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80725881"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="80725881"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 08:40:26 -0800
X-CSE-ConnectionGUID: U0scOjERQW+xdPsgBXfNzg==
X-CSE-MsgGUID: zCn7kt+sRsqxEiGU1KK8Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="207989526"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jan 2026 08:40:25 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veFXC-0000000026e-1iZ9;
	Fri, 09 Jan 2026 16:40:22 +0000
Date: Fri, 9 Jan 2026 17:40:09 +0100
From: kernel test robot <lkp@intel.com>
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
	airlied@redhat.com, kraxel@redhat.com,
	dmitry.osipenko@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, nirmoyd@nvidia.com,
	vivek.kasireddy@intel.com
Subject: Re: [PATCH v7 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Message-ID: <202601091715.AaqfDsnD-lkp@intel.com>
References: <20260107182745.229481-3-dongwon.kim@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107182745.229481-3-dongwon.kim@intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc4 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dongwon-kim-intel-com/drm-virtio-Freeze-and-restore-hooks-to-support-suspend-and-resume/20260108-024124
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260107182745.229481-3-dongwon.kim%40intel.com
patch subject: [PATCH v7 2/3] drm/virtio: Add support for saving and restoring virtio_gpu_objects
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260109/202601091715.AaqfDsnD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091715.AaqfDsnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091715.AaqfDsnD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/virtio/virtgpu_prime.c: In function 'virtgpu_dma_buf_obj_resubmit':
>> drivers/gpu/drm/virtio/virtgpu_prime.c:291:17: error: implicit declaration of function 'DRM_ERROR'; did you mean 'pud_ERROR'? [-Wimplicit-function-declaration]
     291 |                 DRM_ERROR("no sgt bound to virtio_gpu_object\n");
         |                 ^~~~~~~~~
         |                 pud_ERROR


vim +291 drivers/gpu/drm/virtio/virtgpu_prime.c

   282	
   283	int virtgpu_dma_buf_obj_resubmit(struct virtio_gpu_device *vgdev,
   284					 struct virtio_gpu_object *bo)
   285	{
   286		struct virtio_gpu_mem_entry *ents;
   287		struct scatterlist *sl;
   288		int i;
   289	
   290		if (!bo->sgt) {
 > 291			DRM_ERROR("no sgt bound to virtio_gpu_object\n");
   292			return -ENOMEM;
   293		}
   294	
   295		ents = kvmalloc_array(bo->sgt->nents,
   296				      sizeof(struct virtio_gpu_mem_entry),
   297				      GFP_KERNEL);
   298		if (!ents) {
   299			DRM_ERROR("failed to allocate ent list\n");
   300			return -ENOMEM;
   301		}
   302	
   303		for_each_sgtable_dma_sg(bo->sgt, sl, i) {
   304			ents[i].addr = cpu_to_le64(sg_dma_address(sl));
   305			ents[i].length = cpu_to_le32(sg_dma_len(sl));
   306			ents[i].padding = 0;
   307		}
   308	
   309		virtio_gpu_cmd_resource_create_blob(vgdev, bo, &bo->params,
   310						    ents, bo->sgt->nents);
   311	
   312		return 0;
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
