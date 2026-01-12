Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030619992C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205831; cv=none; b=skhiebJ/8DoagSNpu1prZspzuCyoxG2oqVjJDuvGuDkMUpc5I+lS8QvmHWzG6p2V4HJEtMnFhB3Jcfwo5ZzgbnRBflkqq2s1z+fFFU10k9O+pvq/u1h79xurS4LLStudRDLbDksW8Ht5swVrPTsgeYYIQ2E8SUcTQzy/EU1oapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205831; c=relaxed/simple;
	bh=iFp/ovl2aORKx1THnTegLBlm7ZsZvFe9RUzlGYtiO9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsN1vBpj7loNXIggKIt+B53/EgpINKPS/01q5KjWpiUCG+ULeFTW2029kfVGC0h8Yx8nnZAttXKJL1U/P1DhqAXLah3m6F/EyBnytxi7qeax6Twk4pcCDQai5ycithyb9LYbBOS1Z626sRZ2i0okG9DcYaE3C72pYE8R4PJsvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+C3nm7q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+C3nm7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768205829; x=1799741829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iFp/ovl2aORKx1THnTegLBlm7ZsZvFe9RUzlGYtiO9c=;
  b=l+C3nm7q9wOd0jWyk2erMEt3LW0CgMq097+rY3IQ+fh7GjpnzfD5ZkHW
   RKZOtUYkiWe1Ne7OySGBVfOB5J1oVGlKqz0X6FTPkTbZC5TWQiuhD6QhS
   uenwxtyYH1TkgiyzSg3sfzyjAaH5PUmQglUggotoL0v1jCnj5dTQwAQdb
   pb4j7ACEtmtQAxeOKsAgJyaLcsRcLe20ZMeSjGPrO8LtNrYNVjDqaUp7N
   GJu+bfjK1yUtJ5mr+FBQFVuB5P4C9Pum2IUsdhskcvqU7hPtY4GveGq8l
   SCZs9yE1vXt3F3Pq1jhP3D0XO0AUMBzoWIpovjnliltiQ8BbvRpIj61NO
   Q==;
X-CSE-ConnectionGUID: aBGXsrMYTCeh5qgJX7wwng==
X-CSE-MsgGUID: Du26QX6UTJmFeWtCryiFQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69389531"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69389531"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 00:17:08 -0800
X-CSE-ConnectionGUID: 9W5wbo1VSPS8PbUYA2soSg==
X-CSE-MsgGUID: ZUrUy5sFRTeB60O4x0Kecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204105249"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jan 2026 00:17:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfD6l-00000000D8e-38IZ;
	Mon, 12 Jan 2026 08:17:03 +0000
Date: Mon, 12 Jan 2026 16:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
	airlied@redhat.com, kraxel@redhat.com,
	dmitry.osipenko@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, nirmoyd@nvidia.com,
	vivek.kasireddy@intel.com
Subject: Re: [PATCH v7 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Message-ID: <202601121246.Q3BHNIsw-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260112/202601121246.Q3BHNIsw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121246.Q3BHNIsw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121246.Q3BHNIsw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/virtio/virtgpu_prime.c: In function 'virtgpu_dma_buf_obj_resubmit':
>> drivers/gpu/drm/virtio/virtgpu_prime.c:291:17: error: implicit declaration of function 'DRM_ERROR'; did you mean 'DRM_IOR'? [-Wimplicit-function-declaration]
     291 |                 DRM_ERROR("no sgt bound to virtio_gpu_object\n");
         |                 ^~~~~~~~~
         |                 DRM_IOR


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
