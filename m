Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314C5278E47
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 20:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761077677; cv=none; b=EWHNO6BYBMMD1gN5ixY6Jys9DWsjTO/Wmko8m1YXijWBEhSyMnNL93uN57mRUIR067EUBOSBQXlIYEMgFLaxHyQh1TYPfzVZC3eCy9xMhoRl5a1lIw1X4mTeEEuI+oJHS4ud5BlVbragsWN1HqmuO/GgkMpFjatcZ3Cxj4p2BCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761077677; c=relaxed/simple;
	bh=4zzryxXIJnp3UT5ralaMXQBJCNZ6O30bAF0+aUqZ3VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJiT04GC7Y22oz40UwUhh57LCfXA9MukUqtQB/kve9n5eHyE0geOGRJWg13mKzMZ/AF+eefpJBjcSoyHxwTT4UVA0/XelIvJGPpgEA1kzxkhKN9efAxzTfBvQtrj2eGI9f6J8BUxDWd0z94LNAPW2HWMlkFrFOvxUrp0djMloOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xt5KUG6p; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xt5KUG6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761077676; x=1792613676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4zzryxXIJnp3UT5ralaMXQBJCNZ6O30bAF0+aUqZ3VE=;
  b=Xt5KUG6p9AloyZHc14WEU5Sd14UzIUr70lBG1YukNGytJSQ2R6w4SZrm
   q5idwh5F/H/fBrvQa0kKvedEnYc9SeFs/c/0N50vvki6FjjkJp1jxaywM
   9rWPrkXehBe1jS1aLfpjMGHS8fwoqaWVhua/38w59wkU0csHNSwUlOjmW
   R0gH8xc/EOzjrvOzWQCEXLv9Di/RfNLfp9ISnkR86yDclADAtRDFaTQSd
   rIoBNgi/+eek/Mu/5A281AAKMYc6ux8EnQkogC7QT/OjTQ4wsMk5a9dNa
   32Dv66W1GdyXEUVMQhNkS3IT6nFZOD6+28wN3dsX9PfJCJ79BN5vRfWFo
   g==;
X-CSE-ConnectionGUID: Z8BeIz4bQCaHGOwHenqlfQ==
X-CSE-MsgGUID: SjN809VORjWGbSnZT0A7hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65832187"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="65832187"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 13:14:36 -0700
X-CSE-ConnectionGUID: ZHqmMbnmQpWB2sf2t4KijQ==
X-CSE-MsgGUID: rMl9DxJpQkeQLYQr+iXHcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="188084569"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2025 13:14:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBIkT-000BZJ-0V;
	Tue, 21 Oct 2025 20:14:27 +0000
Date: Wed, 22 Oct 2025 04:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
	maarten.lankhorst@linux.intel.com,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>, simona.vetter@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/ttm: replace drm_print.h include with a forward
 declaration
Message-ID: <202510220338.7c7JsIXK-lkp@intel.com>
References: <8b92271e6b2a50ee6cf4f6dd015123e27be29678.1761063757.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b92271e6b2a50ee6cf4f6dd015123e27be29678.1761063757.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251021]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next linus/master v6.18-rc2 v6.18-rc1 v6.17 v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-mm-replace-drm_print-h-include-with-a-forward-declaration/20251022-003212
base:   next-20251021
patch link:    https://lore.kernel.org/r/8b92271e6b2a50ee6cf4f6dd015123e27be29678.1761063757.git.jani.nikula%40intel.com
patch subject: [PATCH 3/3] drm/ttm: replace drm_print.h include with a forward declaration
config: nios2-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220338.7c7JsIXK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220338.7c7JsIXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220338.7c7JsIXK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/tests/ttm_mock_manager.c:236:20: error: expected declaration specifiers or '...' before string constant
    MODULE_DESCRIPTION("KUnit tests for ttm with mock resource managers");
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c:237:16: error: expected declaration specifiers or '...' before string constant
    MODULE_LICENSE("GPL and additional rights");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +236 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c

32d618e9463888 Karolina Stolarek 2024-06-12  235  
26149e6fe1e89d Jeff Johnson      2024-06-24 @236  MODULE_DESCRIPTION("KUnit tests for ttm with mock resource managers");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
