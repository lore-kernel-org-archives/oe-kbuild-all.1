Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46D1B21BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521933; cv=none; b=JXIhhHbxYE4vWPjq2WIWybJf7cVJxmPbditZ+ld8YBMjexfYYYYmVNU66AMxUAmvP9EhvlW2or2CQnwPFfQNC4yIfXXvASLwetT0uNfcrq0ABpxAh2VArZIi1cMhZO7KktJFKC9gOVMmPoZW/b3Efi2Hu3edt84M//obMaJpVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521933; c=relaxed/simple;
	bh=yLbj4WLa1FW95pJKsDSKPi1C8D/v76hLHpk/PFj3PhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJmAS4bGLLALanvVtUemNTpbpUvpLwN8tmKModqxcLLu48gEuZUs4bwBjWSLv1JCbYqfGoUnnNxkEofvMycAILMPVbVXI0Iq3Gg1fgqyQfxMWcuYsLqWIcMLFYvTidwdrhT0WN6i9xWXkIIAgtxIkGUem6WzhUTq/x6EcUoJMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZIczkuR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZIczkuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748521931; x=1780057931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yLbj4WLa1FW95pJKsDSKPi1C8D/v76hLHpk/PFj3PhU=;
  b=WZIczkuRKUa/eHTiSK1PDNIcndaPvKhL3z+39N0Y3IEXcPk9fclnw13n
   NXc7fRA2J2U2bM6mfJ2EojErsydfFU5pzoysXhAMtErWdYqH1F8qjrnG5
   jYS6X8H2K1v/1gPltSzEIDks6VYm8+ZqDvgP7G6v7oEdHZGiTKYDAA9HM
   mymOq5S+0aXBoH0AH7xA0EhkRgmL6T3FgbcP6cT9VHvTKtHnd+sBelTTS
   WMcisnnCtcmJxqpUFh7nLpna/bnyeEwbSSnl+QuGOtXftNrTC0CHK06V+
   e+UsEPNBut/fwjaV1m/VPxkFAbA9VMXrUc9RxzLpqwqQxofU8hFhP1uev
   Q==;
X-CSE-ConnectionGUID: MosFFYIpRHe8zFbgm1ev3g==
X-CSE-MsgGUID: Dd8TW3QPSMKzLhkQ2JipWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="75970799"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="75970799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:32:10 -0700
X-CSE-ConnectionGUID: OhMizr/4ReivJa5oyEuELQ==
X-CSE-MsgGUID: 4neKUg6ATbSEn1JT1J/KbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="143526205"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 May 2025 05:32:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKcQY-000Wfw-1V;
	Thu, 29 May 2025 12:32:06 +0000
Date: Thu, 29 May 2025 20:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	DRI Development <dri-devel@lists.freedesktop.org>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 3/8] drm/panthor: Fix UAF in
 panthor_gem_create_with_handle() debugfs code
Message-ID: <202505292016.42gSDa4w-lkp@intel.com>
References: <20250528091307.1894940-4-simona.vetter@ffwll.ch>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528091307.1894940-4-simona.vetter@ffwll.ch>

Hi Simona,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250527]
[also build test ERROR on linus/master]
[cannot apply to v6.15 v6.15-rc7 v6.15-rc6 v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simona-Vetter/drm-gem-Fix-race-in-drm_gem_handle_create_tail/20250528-171524
base:   next-20250527
patch link:    https://lore.kernel.org/r/20250528091307.1894940-4-simona.vetter%40ffwll.ch
patch subject: [PATCH 3/8] drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code
config: sparc-randconfig-r132-20250529 (https://download.01.org/0day-ci/archive/20250529/202505292016.42gSDa4w-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250529/202505292016.42gSDa4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505292016.42gSDa4w-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_gem.c: In function 'panthor_gem_create_object':
>> drivers/gpu/drm/panthor/panthor_gem.c:249:21: error: 'struct panthor_gem_object' has no member named 'debugfs'
     INIT_LIST_HEAD(&obj->debugfs.node);
                        ^~


vim +249 drivers/gpu/drm/panthor/panthor_gem.c

   225	
   226	/**
   227	 * panthor_gem_create_object - Implementation of driver->gem_create_object.
   228	 * @ddev: DRM device
   229	 * @size: Size in bytes of the memory the object will reference
   230	 *
   231	 * This lets the GEM helpers allocate object structs for us, and keep
   232	 * our BO stats correct.
   233	 */
   234	struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size)
   235	{
   236		struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
   237		struct panthor_gem_object *obj;
   238	
   239		obj = kzalloc(sizeof(*obj), GFP_KERNEL);
   240		if (!obj)
   241			return ERR_PTR(-ENOMEM);
   242	
   243		obj->base.base.funcs = &panthor_gem_funcs;
   244		obj->base.map_wc = !ptdev->coherent;
   245		mutex_init(&obj->gpuva_list_lock);
   246		drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
   247		mutex_init(&obj->label.lock);
   248	
 > 249		INIT_LIST_HEAD(&obj->debugfs.node);
   250	
   251		return &obj->base.base;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
