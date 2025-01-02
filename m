Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B481C36
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735823677; cv=none; b=V/MNFXu726teRjBmqKPrMrBhCG1aAbhzZC7YjuJ5K0osF829teQoYvWc32pCgRsFUR7FG21yyqcJ92yupWMoHkYWVJ5AJCHzqFJdWmj63WHXB3xCZn9TWsGWTPX3BlBFopUYQ4UD5ZlKbYpxRyVxJECX1UDFwt6/vOAbueX4bcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735823677; c=relaxed/simple;
	bh=9+U8jw3h3A9F99PBQ/5pOgd0Z081r/i99x3+Rci9/Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUIORb5pmSnKfH5Lm+ooPoyWQCKXDBB7RCnJvKMYicVpg1cfY8EfJTTdqqloWNZ4q3eFZTgEFzjFy4lXBE2ONWTchxp+nwA8lu5ohMd3tVweLtGqyZiOjMaqw1dy54yoJyQzglC3S2yi0smprU96VEsRTUlgm9fdiIGzc5uBM44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7/OzNp1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7/OzNp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735823676; x=1767359676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9+U8jw3h3A9F99PBQ/5pOgd0Z081r/i99x3+Rci9/Y0=;
  b=j7/OzNp1sA2R2Z0qxAyLhN842GbjUuMjR8XWi8zNwc9RsrCVTAz8Nh0E
   BPq3IUEf//xcQb6/ewTe9TQ02r36bBWRSbEVhApfo6uDo28MxD7JmTG22
   q6iG5ZHRSWLsq7C7s3ZxnM32gSOujUExKIqklr5GK/NScJbVtDBc4/Dlk
   MUULD0uQROM93EmkHhqR5dgMP6f6nHDzhrfoovLj9H6834vaiFspzBwN1
   8KxjGfJlUouh1oD5mO6lheJC3seXLNVO6G58jUg+YNqvex235hGbCw2Nd
   bBAP4S/L5d1UB44UWkruHd4Q6j3AkLHPvbKpIGuzSPbxkrl1itLqbdin/
   w==;
X-CSE-ConnectionGUID: 5b/XPH5eRxG6Plhlug1FWw==
X-CSE-MsgGUID: hgYksRZkQo+7tV1b14s5Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36281237"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="36281237"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 05:14:36 -0800
X-CSE-ConnectionGUID: OzKiDGGuTuKC+7mpWhYlVw==
X-CSE-MsgGUID: e/O4D4vOSiiWuwRJtMmZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101345270"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jan 2025 05:14:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTL20-0008WJ-10;
	Thu, 02 Jan 2025 13:14:32 +0000
Date: Thu, 2 Jan 2025 21:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: drivers/gpu/drm/nouveau/nouveau_backlight.c:56:69: error: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 3
Message-ID: <202501022122.Pct9ERae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56e6a3499e14716b9a28a307bb6d18c10e95301e
commit: f89632a9e5fa6c4787c14458cd42a9ef42025434 drm: Add CONFIG_DRM_WERROR
date:   10 months ago
config: loongarch-randconfig-002-20250102 (https://download.01.org/0day-ci/archive/20250102/202501022122.Pct9ERae-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022122.Pct9ERae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501022122.Pct9ERae-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_backlight.c: In function 'nouveau_backlight_init':
>> drivers/gpu/drm/nouveau/nouveau_backlight.c:56:69: error: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Werror=format-truncation=]
      56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                                                                     ^~
   In function 'nouveau_get_backlight_name',
       inlined from 'nouveau_backlight_init' at drivers/gpu/drm/nouveau/nouveau_backlight.c:351:7:
   drivers/gpu/drm/nouveau/nouveau_backlight.c:56:56: note: directive argument in the range [1, 2147483647]
      56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                                                        ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_backlight.c:56:17: note: 'snprintf' output between 14 and 23 bytes into a destination of size 15
      56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +56 drivers/gpu/drm/nouveau/nouveau_backlight.c

db1a0ae21461af Pierre Moreau      2016-12-08  46  
db1a0ae21461af Pierre Moreau      2016-12-08  47  static bool
6d757753cef8d5 Lyude Paul         2018-09-06  48  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
6d757753cef8d5 Lyude Paul         2018-09-06  49  			   struct nouveau_backlight *bl)
db1a0ae21461af Pierre Moreau      2016-12-08  50  {
ab244be47a8f11 Christophe JAILLET 2022-02-09  51  	const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
ab244be47a8f11 Christophe JAILLET 2022-02-09  52  
ab244be47a8f11 Christophe JAILLET 2022-02-09  53  	if (nb < 0)
db1a0ae21461af Pierre Moreau      2016-12-08  54  		return false;
db1a0ae21461af Pierre Moreau      2016-12-08  55  	if (nb > 0)
db1a0ae21461af Pierre Moreau      2016-12-08 @56  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
db1a0ae21461af Pierre Moreau      2016-12-08  57  	else
db1a0ae21461af Pierre Moreau      2016-12-08  58  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
6d757753cef8d5 Lyude Paul         2018-09-06  59  	bl->id = nb;
db1a0ae21461af Pierre Moreau      2016-12-08  60  	return true;
db1a0ae21461af Pierre Moreau      2016-12-08  61  }
db1a0ae21461af Pierre Moreau      2016-12-08  62  

:::::: The code at line 56 was first introduced by commit
:::::: db1a0ae21461afa4bc435651a6dd55e0e6ef4a8b drm/nouveau/bl: Assign different names to interfaces

:::::: TO: Pierre Moreau <pierre.morrow@free.fr>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
