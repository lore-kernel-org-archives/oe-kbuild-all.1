Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDD12FB1B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849668; cv=none; b=iVl7qpyjt05lpuAXvNkG5K15NtROp6gRvsdgucqFlhUI8IPGr7dyvIhwWmIR9slOghNZZZuy2ZzqEQajskdzgoCrl/D0LL4SN4eSwjh1P5OIYJgqITn4uDE8Z+OnSnQM0G3grnZDopK3V/0etoCc5ttzVfML21JFlPdKRoQG0ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849668; c=relaxed/simple;
	bh=6rbifKS/b/8sjhIHVhRdr8q9RaoX7LEiMZO8Aw36+T4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tsD1Uuawu8JdQkfIHVonvyMf52SUJdkMVRSPOTnPF+GQNgjEpRAJG1Pd5u7/4AWDUidFPX5CDeORC1lcL7PI/xOlJy4s/jb6kI+Thm50ncuNhC1pZuIRV4frsqsPun9seWdtxSx0NaXdzGPGs9Lx2F+oPVsYSbs6nMsjEcnck3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJC+IzWi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJC+IzWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729849666; x=1761385666;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6rbifKS/b/8sjhIHVhRdr8q9RaoX7LEiMZO8Aw36+T4=;
  b=nJC+IzWiZGGOYaXM+dnlGzSkn3nBUeI4dacqAn8C7Pl8OpNlopRy8sQV
   hft9/IzYpLPmi0R9p6A0wyTITyBeh+AngwUQZ6gEOV6bMAfVTPHRveFFk
   TaDtB1KfnjH7zcs/DLig2z6E+5gsX/qUsRLkWq4ziM1PhD11wukqi1W1E
   VFW2DNZFfhzLobMK56PU4Ry7gsSjdqzuj9kSTCiPLNcZPVfa0UF6A1CXH
   V9ItVEF+idXWt23mNpHfuoUH20ZFaJpRTmIErI/RdrtOv/6LJPqj/P63e
   Mj0eqeQQAl4pVW1WZUB6+x8KsaYYe14q5AIjAhCJYup3VypnStOcWCSNY
   Q==;
X-CSE-ConnectionGUID: Z5LBL1bmQhmGEWZwR/yktA==
X-CSE-MsgGUID: 3z1KX6q0Q5GEUZ8xG5l3tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="46996330"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="46996330"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:47:45 -0700
X-CSE-ConnectionGUID: KEo2T9dkTJus/LCCLp7lIw==
X-CSE-MsgGUID: stIku8ljRxKprzLmkTjRng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81038257"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:47:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>, Javier Martinez
 Canillas <javierm@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Simon Ser
 <contact@emersion.fr>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
In-Reply-To: <202410251351.r16zfufe-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241024162240.2398664-2-jani.nikula@intel.com>
 <202410251351.r16zfufe-lkp@intel.com>
Date: Fri, 25 Oct 2024 12:47:35 +0300
Message-ID: <878qucqzt4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 25 Oct 2024, kernel test robot <lkp@intel.com> wrote:
> Hi Jani,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on next-20241024]
> [cannot apply to drm-exynos/exynos-drm-next shawnguo/for-next drm-xe/drm-xe-next linus/master v6.12-rc4]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-remove-driver-date-from-struct-drm_driver-and-all-drivers/20241025-002344
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20241024162240.2398664-2-jani.nikula%40intel.com
> patch subject: [PATCH 2/2] drm: remove driver date from struct drm_driver and all drivers
> config: i386-buildonly-randconfig-004-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251351.r16zfufe-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251351.r16zfufe-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410251351.r16zfufe-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/accel/qaic/qaic_drv.c:211:10: error: 'const struct drm_driver' has no member named 'date'
>      211 |         .date                   = "20190618",
>          |          ^~~~
>>> drivers/accel/qaic/qaic_drv.c:211:35: warning: initialization of 'unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>      211 |         .date                   = "20190618",
>          |                                   ^~~~~~~~~~
>    drivers/accel/qaic/qaic_drv.c:211:35: note: (near initialization for 'qaic_accel_driver.driver_features')
>    drivers/accel/qaic/qaic_drv.c:211:35: warning: initialized field overwritten [-Woverride-init]
>    drivers/accel/qaic/qaic_drv.c:211:35: note: (near initialization for 'qaic_accel_driver.driver_features')

Hrmh, looks like I missed all of drivers/accel, I'll send an update
later.

BR,
Jani.


>
>
> vim +211 drivers/accel/qaic/qaic_drv.c
>
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  205  
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  206  static const struct drm_driver qaic_accel_driver = {
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  207  	.driver_features	= DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  208  
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  209  	.name			= QAIC_NAME,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  210  	.desc			= QAIC_DESC,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27 @211  	.date			= "20190618",
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  212  
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  213  	.fops			= &qaic_accel_fops,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  214  	.open			= qaic_open,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  215  	.postclose		= qaic_postclose,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  216  
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  217  	.ioctls			= qaic_drm_ioctls,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  218  	.num_ioctls		= ARRAY_SIZE(qaic_drm_ioctls),
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  219  	.gem_prime_import	= qaic_gem_prime_import,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  220  };
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  221  

-- 
Jani Nikula, Intel
