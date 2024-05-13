Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D5F15216B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715602772; cv=none; b=r0Eli1mlmowf8QUfyof58A69SgEgsOduToZh8KeXn/Dpap7gL3qZYEqlzbFkqxr4VT2Mi+kLxo1qxmcSg7UZbagF4cDvTAeTDOBPOnv4iulJr5LtKTs1P1AaIgk35dPWXbQaRp1yB1Ay5QMZrLjxcvoZH1hQ2QUiwz/q3nXfQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715602772; c=relaxed/simple;
	bh=DlZkeM1dd06yETfJBi2zbuC4K2oqkBOi8Ru5fmCQ2jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uObcpY+UMAqtOL38dmwfJQ+2sSHapYek6xbc/ZFH6Bs5JlMDYCc+wig+YMGcd+6nTwLP3Nf4hrQXhhgjMd4r3vVwnsyeVHJZvw6CP/qZNI3MuVg8Tg/4msC6tM1Z3hfcN2wn4m1aNyvv8ije/D3PEIBAC9cHf6aDVHXBZ47MPbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNvb4GY9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNvb4GY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715602770; x=1747138770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DlZkeM1dd06yETfJBi2zbuC4K2oqkBOi8Ru5fmCQ2jQ=;
  b=LNvb4GY9GgXX2pURuyKEu3ggi9DJaDCnnEqDljZfbm9wdnoC4Jpx7G03
   EqqzZ04uzE9iC6WNDJUK824NpT3haHoBPSI43eAOSl3rN3tZUHfS8Ght+
   yAidN0Hrrr6CADzttS02H32gtIEuqzLnaQZpxZI6s+kpN6uu3MkyWQfqn
   e31kOTl70120dh0xb/slTW8LljH3alRZcnJhklFGdKqaAaa++aiLrGAvq
   FTrNYivG3sKw/SFPKVqsllCD/49CQxNndB4ei95rVJUYZsAqbmI2uAmNa
   zamVjcWqcDkcW8Lfik5AXHDYXiKXtGYWKGZ7j90LNqy01HO7rykGDJqo6
   A==;
X-CSE-ConnectionGUID: ofYWn94BT2Kwju3HL0rVJQ==
X-CSE-MsgGUID: /AVweOtzQD6ymYKO+oiS9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="34045596"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="34045596"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:19:29 -0700
X-CSE-ConnectionGUID: ZIqz6q3YROWkLOO/fCfLTQ==
X-CSE-MsgGUID: DoutxcT3QnmgMMbmSi0zyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30307669"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 May 2024 05:19:27 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6UeL-000A7B-1D;
	Mon, 13 May 2024 12:19:25 +0000
Date: Mon, 13 May 2024 20:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [drm-misc:drm-misc-next 7/10]
 drivers/gpu/drm/omapdrm/omap_gem.c:757:42: sparse: sparse: cast truncates
 bits from constant value (10000 becomes 0)
Message-ID: <202405132008.ZKR6oYcm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   11cdc8f2bde4bc548da6f995556c4b7183431088
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb [7/10] drm/omap: Allow build with COMPILE_TEST=y
config: powerpc64-randconfig-r131-20240513 (https://download.01.org/0day-ci/archive/20240513/202405132008.ZKR6oYcm-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240513/202405132008.ZKR6oYcm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405132008.ZKR6oYcm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/omapdrm/omap_gem.c:757:42: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   drivers/gpu/drm/omapdrm/omap_gem.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/gpu/drm/omapdrm/omap_gem.c:1503:65: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)

vim +757 drivers/gpu/drm/omapdrm/omap_gem.c

8b6b569eac2e74 drivers/staging/omapdrm/omap_gem.c Rob Clark       2012-05-17  744  
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  745  static int omap_gem_pin_tiler(struct drm_gem_object *obj)
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  746  {
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  747  	struct omap_gem_object *omap_obj = to_omap_bo(obj);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  748  	u32 npages = obj->size >> PAGE_SHIFT;
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  749  	enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  750  	struct tiler_block *block;
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  751  	int ret;
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  752  
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  753  	BUG_ON(omap_obj->block);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  754  
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  755  	if (omap_obj->flags & OMAP_BO_TILED_MASK) {
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  756  		block = tiler_reserve_2d(fmt, omap_obj->width, omap_obj->height,
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19 @757  					 PAGE_SIZE);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  758  	} else {
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  759  		block = tiler_reserve_1d(obj->size);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  760  	}
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  761  
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  762  	if (IS_ERR(block)) {
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  763  		ret = PTR_ERR(block);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  764  		dev_err(obj->dev->dev, "could not remap: %d (%d)\n", ret, fmt);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  765  		goto fail;
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  766  	}
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  767  
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  768  	/* TODO: enable async refill.. */
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  769  	ret = tiler_pin(block, omap_obj->pages, npages, omap_obj->roll, true);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  770  	if (ret) {
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  771  		tiler_release(block);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  772  		dev_err(obj->dev->dev, "could not pin: %d\n", ret);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  773  		goto fail;
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  774  	}
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  775  
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  776  	omap_obj->dma_addr = tiler_ssptr(block);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  777  	omap_obj->block = block;
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  778  
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  779  	DBG("got dma address: %pad", &omap_obj->dma_addr);
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  780  
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  781  fail:
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  782  	return ret;
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  783  }
86ad0397250c58 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  784  

:::::: The code at line 757 was first introduced by commit
:::::: 86ad0397250c585096d242dc3c0f774320ed1a80 drm: omapdrm: simplify omap_gem_pin

:::::: TO: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
