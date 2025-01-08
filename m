Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E531369A8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 03:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305457; cv=none; b=bvhX9rfss1pb/EscJwhX6UxgwoyVXrQbV5CQTg5AwI8EgYPBkLp5gD5kzaSGOaZEPwtRj90IfE+xEnbkhufFdtV1EkrQvQ3ubDq/ZTyYWzFlInFAEvk2TVzwKrmDytBk43G6vvlqcWpoS957xgalYsxgRH9JP+AY3z9M37J3fxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305457; c=relaxed/simple;
	bh=u73Ks6qLncBhD6O5eWrJDXxgR1b3lXa+PFVq7AOXBms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EkG4RmwoCOrTi5F6xEoIYXFyxYuiPKhBEpllbVX0c0H2WtcVA5dMPe1NeJp/vgQk0QfiyjowE3h2GvMrvMpYnT5WFwlLsJ8/SgeNX/7T0dFbOtW3nhm6cfDsoyRBB5CNCS9ynh2RGE1d0dkSXjZft898dnkOn+zQf6AqaGd3f7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0mBpMK8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0mBpMK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736305455; x=1767841455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u73Ks6qLncBhD6O5eWrJDXxgR1b3lXa+PFVq7AOXBms=;
  b=a0mBpMK8rKmtD50bjnCnUKfHP+MFE6KF84X6SwdvY9EJ1PQncfj9xucd
   kUcU08Z0e5ZsrXrU+t6EZSBu78tEjpUz2InDCf4SqHCdV2LHIBUfaEIJo
   v2HiYMrZ4RB0CZ10/hPRG72X4mBGSwAfMZX54pVRYDQwtmgEjkPW7amKO
   VWPDSrYb/o5JXMq/ANu5uIaE/4cFcDsrTLrqMnKKdRh2gu4pi3Z+SQ/LA
   B+anoTMTWTJ2+U9j0kgRm3kh2OK3QbML7JNrCO4YvA1Ru8UVzHz2QaHZo
   uoVQH1hsCOOyvomJVkIepfqOoTaNAySqgQoFRA1mP9h4zeYcfFbCsmmMv
   Q==;
X-CSE-ConnectionGUID: e5RHAODaQcGydp9JIfDlJA==
X-CSE-MsgGUID: F34dGgObTSC1sVhwzChxfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36632283"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36632283"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 19:04:15 -0800
X-CSE-ConnectionGUID: sCEF8xDzTgiY9dZjPMAnXg==
X-CSE-MsgGUID: LUhAolPiSsKGUwXsmFuuRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102822171"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Jan 2025 19:04:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVMMc-000FXJ-2N;
	Wed, 08 Jan 2025 03:04:10 +0000
Date: Wed, 8 Jan 2025 11:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/nouveau/nouveau_backlight.c:54:69: warning: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 3
Message-ID: <202501081017.ElY2NtiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: ab244be47a8f111bc82496a8a20c907236e37f95 drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()
date:   2 years, 8 months ago
config: arm-randconfig-c032-20230430 (https://download.01.org/0day-ci/archive/20250108/202501081017.ElY2NtiC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081017.ElY2NtiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081017.ElY2NtiC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_backlight.c: In function 'nouveau_backlight_init':
>> drivers/gpu/drm/nouveau/nouveau_backlight.c:54:69: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Wformat-truncation=]
      54 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                                                                     ^~
   In function 'nouveau_get_backlight_name',
       inlined from 'nouveau_backlight_init' at drivers/gpu/drm/nouveau/nouveau_backlight.c:408:7:
   drivers/gpu/drm/nouveau/nouveau_backlight.c:54:56: note: directive argument in the range [1, 2147483647]
      54 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                                                        ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_backlight.c:54:17: note: 'snprintf' output between 14 and 23 bytes into a destination of size 15
      54 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +54 drivers/gpu/drm/nouveau/nouveau_backlight.c

db1a0ae21461af Pierre Moreau      2016-12-08  44  
db1a0ae21461af Pierre Moreau      2016-12-08  45  static bool
6d757753cef8d5 Lyude Paul         2018-09-06  46  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
6d757753cef8d5 Lyude Paul         2018-09-06  47  			   struct nouveau_backlight *bl)
db1a0ae21461af Pierre Moreau      2016-12-08  48  {
ab244be47a8f11 Christophe JAILLET 2022-02-09  49  	const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
ab244be47a8f11 Christophe JAILLET 2022-02-09  50  
ab244be47a8f11 Christophe JAILLET 2022-02-09  51  	if (nb < 0)
db1a0ae21461af Pierre Moreau      2016-12-08  52  		return false;
db1a0ae21461af Pierre Moreau      2016-12-08  53  	if (nb > 0)
db1a0ae21461af Pierre Moreau      2016-12-08 @54  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
db1a0ae21461af Pierre Moreau      2016-12-08  55  	else
db1a0ae21461af Pierre Moreau      2016-12-08  56  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
6d757753cef8d5 Lyude Paul         2018-09-06  57  	bl->id = nb;
db1a0ae21461af Pierre Moreau      2016-12-08  58  	return true;
db1a0ae21461af Pierre Moreau      2016-12-08  59  }
db1a0ae21461af Pierre Moreau      2016-12-08  60  

:::::: The code at line 54 was first introduced by commit
:::::: db1a0ae21461afa4bc435651a6dd55e0e6ef4a8b drm/nouveau/bl: Assign different names to interfaces

:::::: TO: Pierre Moreau <pierre.morrow@free.fr>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
