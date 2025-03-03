Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2CD212B14
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741009341; cv=none; b=PSpVxuhjmPSjLqKov0+lb7lkPi2z/36gwEkUYdhYS83cWUWzJY0+/t2o+sFA4vncgA45PPNK5cr6fIn4srUWj9ryIW/XFOdI/U2DmIG4BfNuyhH95arAfR5x1OSAPDCq3a17KWMVMonMr1hBlpaWpBieROMpjwO5xeFbXgFykGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741009341; c=relaxed/simple;
	bh=JGVVfQ3VupI7IJUoPfF2V8z0J7v1Nc0wRYy5WCZBnnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLJXwQ7UwMcdVp0Cg/u39K/qWiyYJPAB5qhzHRYtobIGLwcn0I5KrYtNLjsb9N9TLdyNz+oOR3Zv7ywL3O+IIrM5YkBlnUDOwgTt4cpUsdcx1F9JZzBFs4LcaIXyGotIYa5zVkhtlihBHpF6ZpZwLVZ9uCMjSqny90kgVqEhqKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jvk48vfK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jvk48vfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741009339; x=1772545339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JGVVfQ3VupI7IJUoPfF2V8z0J7v1Nc0wRYy5WCZBnnM=;
  b=Jvk48vfKZLzRZa6e0HfTAmC7E9aRlO5psJ+I2zjjYhUeJZNfQPbceQ6S
   pSKhrFhKCebNukx7L8oYmPapNBqiPlXjzQ8Xro0a/mduwG+wqsfaXR9cd
   MjbS5cf++BguDDG/iDJU5VnyvtRxbXyiAGVLrYDvXHaVVUvt4PL5ZTnlw
   qd1vuDmlubdiC/0LNJoTD7xnak3CM9Pq8YpkQkaKvZYZK7q9hdxyoGUgm
   dVa+Az6hAnOHbtAF5Y0d4qHmOsSQtB8NObuayr0N4mOWb/RpobKEbOabt
   iYbwDpINqTgtR9W4239bXIzsXRu/3MNd4FsBaxUlB2kEZhYiQUjRuJnWl
   A==;
X-CSE-ConnectionGUID: bSuG95TCQw25EEfSEeGIfA==
X-CSE-MsgGUID: 5w3e2rFRRM+Em1EWgVlA4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41590717"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41590717"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:42:17 -0800
X-CSE-ConnectionGUID: 5JuCmvbWROiG2DgaoCTPdQ==
X-CSE-MsgGUID: ZCXP2DHaRW2hYtzZ15J12Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118703997"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2025 05:42:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp62v-000IY7-1D;
	Mon, 03 Mar 2025 13:41:43 +0000
Date: Mon, 3 Mar 2025 21:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
Message-ID: <202503032114.TQkZ0b7R-lkp@intel.com>
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303094808.11860-1-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-client-Build-the-tests-with-CONFIG_DRM_KUNIT_TEST-m/20250303-175715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250303094808.11860-1-ville.syrjala%40linux.intel.com
patch subject: [PATCH] drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
config: riscv-randconfig-002-20250303 (https://download.01.org/0day-ci/archive/20250303/202503032114.TQkZ0b7R-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503032114.TQkZ0b7R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503032114.TQkZ0b7R-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_client_modeset_test_init':
>> drivers/gpu/drm/tests/drm_client_modeset_test.c:59:(.text.drm_client_modeset_test_init+0xa4): undefined reference to `drm_kunit_helper_alloc_device'
   riscv32-linux-ld: drivers/gpu/drm/drm_client_modeset.o: in function `__drm_kunit_helper_alloc_drm_device':
>> include/drm/drm_kunit_helpers.h:63:(.text.drm_client_modeset_test_init+0x198): undefined reference to `__drm_kunit_helper_alloc_drm_device_with_driver'


vim +59 drivers/gpu/drm/tests/drm_client_modeset_test.c

8fc0380f6ba7e9 Maxime Ripard 2022-11-14  52  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  53  static int drm_client_modeset_test_init(struct kunit *test)
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  54  {
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  55  	struct drm_client_modeset_test_priv *priv;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  56  	int ret;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  57  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  58  	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14 @59  	KUNIT_ASSERT_NOT_NULL(test, priv);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  60  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  61  	test->priv = priv;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  62  
9ecd8045bf64f8 Maxime Ripard 2022-12-01  63  	priv->dev = drm_kunit_helper_alloc_device(test);
9ecd8045bf64f8 Maxime Ripard 2022-12-01  64  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
9ecd8045bf64f8 Maxime Ripard 2022-12-01  65  
a9143c5852a7a1 Maxime Ripard 2022-12-01  66  	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev,
a9143c5852a7a1 Maxime Ripard 2022-12-01  67  							sizeof(*priv->drm), 0,
a9143c5852a7a1 Maxime Ripard 2022-12-01  68  							DRIVER_MODESET);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  69  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  70  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  71  	ret = drmm_connector_init(priv->drm, &priv->connector,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  72  				  &drm_client_modeset_connector_funcs,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  73  				  DRM_MODE_CONNECTOR_Unknown,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  74  				  NULL);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  75  	KUNIT_ASSERT_EQ(test, ret, 0);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  76  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  77  	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  78  
fedcaf726f542b Maxime Ripard 2022-11-17  79  	priv->connector.interlace_allowed = true;
fedcaf726f542b Maxime Ripard 2022-11-17  80  	priv->connector.doublescan_allowed = true;
fedcaf726f542b Maxime Ripard 2022-11-17  81  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  82  	return 0;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  83  }
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
