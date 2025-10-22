Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A90922F77E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 03:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103636; cv=none; b=dGYLn1a3ulX86pDEi1s+Vin6UA4hMDjCzVcK+1rzjApwBoNNUavfewt4bruNNzYV8/ShQcp4vV/0cLZjnS4GQq/7bJLSQHfJ1FeojS6sOvfn4x6uzpHXpXZD03i/G+5D1JVqLZ7kVQk/+F49NhsJV+z1//jnVlmKgM2N6wa2dxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103636; c=relaxed/simple;
	bh=8070DwsbZV3/pdL9u+Z6F5R9lIi4i2kvgareiNlnUV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTyPivTKrJCp/da7cv1EvTVqcQ3DAXk65uTZ9uOtk4CyLIPZdxXR2y0tuX8Y5w7CzbTTJdM+Rcro0/4fhwqKQ/V013URcfAEED5GBPA7xCNvqnMJlLbKGT+qJdpOe+kl5+bR/vK6a+5GhBeUPHw/mEIwlqhY6trL0F4TNgAImnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjE2i+0E; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjE2i+0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761103634; x=1792639634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8070DwsbZV3/pdL9u+Z6F5R9lIi4i2kvgareiNlnUV0=;
  b=bjE2i+0EiizuW0gW+KJMZusPdigZX5wsfJPB/cDdUfTIDEfiF4ScjBAU
   ag1cN+Who9nRx47hWNUUrLtFhFO20WQMK8IXTQp49fb8/vyMb6xauGl1G
   Su5SG2F3VKoUrLjVh/uUeon77vnl2p/2qAP9hEhs1PE+25Tpq9yWz2Ug0
   g8D0NREghLIknoiMQrT56xzB66jMML4j8J3l1RfdAawErkvSHONLvzlKm
   AirCiMJfR788jjGVhrDg1RvSa53vEE4XYiSRrqD5XYJWUvEn6obfCpGlx
   yRTay1cXqeSRqngM6WamUvIHBGY/x7nGMtfNiipafB/5+gHZ9asXwbSeV
   Q==;
X-CSE-ConnectionGUID: dHfQYZL7QjmVNM+fkOBfrg==
X-CSE-MsgGUID: w2dJdBuqQQG33N5iMU8ZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63163286"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63163286"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:27:14 -0700
X-CSE-ConnectionGUID: Qw31trbgTLWbZLnZdXZCBw==
X-CSE-MsgGUID: dPYj7/ylReC8zLJtllPJGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="187797373"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Oct 2025 20:27:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBPV2-000Bxh-1F;
	Wed, 22 Oct 2025 03:26:58 +0000
Date: Wed, 22 Oct 2025 11:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Nitin Gote <nitin.r.gote@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Christopher Healy <healych@amazon.com>,
	Matthew Wilcox <willy@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 06/12] drm/i915: Use huge tmpfs mountpoint helpers
Message-ID: <202510221301.wU3TSqMg-lkp@intel.com>
References: <20251021113049.17242-7-loic.molinari@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021113049.17242-7-loic.molinari@collabora.com>

Hi Loïc,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251021]
[also build test ERROR on v6.18-rc2]
[cannot apply to akpm-mm/mm-everything drm-misc/drm-misc-next linus/master v6.18-rc2 v6.18-rc1 v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Simplify-page-offset-calculation-in-fault-handler/20251021-193355
base:   next-20251021
patch link:    https://lore.kernel.org/r/20251021113049.17242-7-loic.molinari%40collabora.com
patch subject: [PATCH v5 06/12] drm/i915: Use huge tmpfs mountpoint helpers
config: x86_64-randconfig-003-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221301.wU3TSqMg-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221301.wU3TSqMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221301.wU3TSqMg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_shmem.c: In function '__create_shmem':
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:511:59: error: 'struct drm_device' has no member named 'huge_mnt'
     511 |                 filp = shmem_file_setup_with_mnt(i915->drm.huge_mnt, "i915",
         |                                                           ^


vim +511 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

   486	
   487	static int __create_shmem(struct drm_i915_private *i915,
   488				  struct drm_gem_object *obj,
   489				  resource_size_t size)
   490	{
   491		unsigned long flags = VM_NORESERVE;
   492		struct file *filp;
   493	
   494		drm_gem_private_object_init(&i915->drm, obj, size);
   495	
   496		/* XXX: The __shmem_file_setup() function returns -EINVAL if size is
   497		 * greater than MAX_LFS_FILESIZE.
   498		 * To handle the same error as other code that returns -E2BIG when
   499		 * the size is too large, we add a code that returns -E2BIG when the
   500		 * size is larger than the size that can be handled.
   501		 * If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false,
   502		 * so we only needs to check when BITS_PER_LONG is 64.
   503		 * If BITS_PER_LONG is 32, E2BIG checks are processed when
   504		 * i915_gem_object_size_2big() is called before init_object() callback
   505		 * is called.
   506		 */
   507		if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
   508			return -E2BIG;
   509	
   510		if (drm_gem_has_huge_mnt(&i915->drm))
 > 511			filp = shmem_file_setup_with_mnt(i915->drm.huge_mnt, "i915",
   512							 size, flags);
   513		else
   514			filp = shmem_file_setup("i915", size, flags);
   515		if (IS_ERR(filp))
   516			return PTR_ERR(filp);
   517	
   518		/*
   519		 * Prevent -EFBIG by allowing large writes beyond MAX_NON_LFS on shmem
   520		 * objects by setting O_LARGEFILE.
   521		 */
   522		if (force_o_largefile())
   523			filp->f_flags |= O_LARGEFILE;
   524	
   525		obj->filp = filp;
   526		return 0;
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
