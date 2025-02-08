Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608DD54F81
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 02:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738981132; cv=none; b=LYlZ/8Rr27MV2uZfvWyNw6c0drUDbkj4/qbMXCQCz3yOZM5JTZ8Hws94dNhJEd8nZE4O+Tj5WF0MlcHd8MNnsU4AdKIBGbJ87vz8KPb6teum93RGVz7ehWkXgkUnzuEHg5yAHRJMgqLFqiYOtbK6Ux3C+ANk2PDHICjuGawWoeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738981132; c=relaxed/simple;
	bh=UyJxYNPJWKv+TAr0mtSdSWxCO9rGGBt8cdaahzrfURs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qK5/Tw9ILzWQpcw2kwusb2tSQcGXfyxMlbkpH/2XBD0E8YCaYfgxkeKV77AB9e8+UZyUhiVvelOaUI0UxzH97gMpO2ieihJ9aLuWUfHMBIg55VoWcxiJf/Old8w1qQ1sSLSTGHFr4IgYuWVj5YKqwl0I4+pPc3QR/oiXlv3Jlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Om2I1c7/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Om2I1c7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738981129; x=1770517129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UyJxYNPJWKv+TAr0mtSdSWxCO9rGGBt8cdaahzrfURs=;
  b=Om2I1c7/52C+O3Z75HrE1ojT9bnpCf+00w4YsG2HQY/SqgfbUznizNiZ
   5dCxU7AjnGnVzMeaRTkY7CdnCbyNEzApkcCFGReJzWszFhrsUd8bJAQzE
   SjChy/M7HbNzODcTBkd6OcmhuqbaGYKhBBRI6fP4R0m7oPV66jCm6bjlJ
   sxSkBRBGMtMd6Vt+BD1Ag5ygzRD0nmr11pyQ/RRb7EUMJmEUwKte4ziZJ
   MpLy+SnM0VPNifKAmRHk+qGXJjBX1rhe/x+NEvFKMEkSGIi7xSvXFnmjp
   dOsQCdNYHskAn1zXLlSEwPvAuGiyn6fzL/noCLryRkuwqq2c9jIpH1C4y
   Q==;
X-CSE-ConnectionGUID: U1xz7FARSDa8DugxprdX7g==
X-CSE-MsgGUID: 27mhiLIASkCUboRmoNZfGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42476219"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="42476219"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 18:18:46 -0800
X-CSE-ConnectionGUID: HJgwKOVlQq6Si2ZS9GkVKQ==
X-CSE-MsgGUID: PR+G/wXKRS28Cy5E+AvGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="112197965"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2025 18:18:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgaQd-000zP7-0A;
	Sat, 08 Feb 2025 02:18:43 +0000
Date: Sat, 8 Feb 2025 10:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Zsolt Kajtar <soci@c64.rulez.org>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next 5/15]
 drivers/video/fbdev/core/fb_copyarea.h:58:51: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202502081048.Ea5XVRXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next
head:   720fcad9d12e92368192689a90e2b932a1e44406
commit: 2e270cb683e73038b091a738c81b6d8f45168982 [5/15] fbdev: core: Use generic copyarea for as cfb_copyarea
config: microblaze-randconfig-r111-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081048.Ea5XVRXr-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250208/202502081048.Ea5XVRXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081048.Ea5XVRXr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/core/cfbcopyarea.c: note: in included file:
>> drivers/video/fbdev/core/fb_copyarea.h:58:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const *src @@
   drivers/video/fbdev/core/fb_copyarea.h:58:51: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:58:51: sparse:     got unsigned long const *src
>> drivers/video/fbdev/core/fb_copyarea.h:58:66: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long *dst @@
   drivers/video/fbdev/core/fb_copyarea.h:58:66: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:58:66: sparse:     got unsigned long *dst
>> drivers/video/fbdev/core/fb_copyarea.h:58:80: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *dst @@
   drivers/video/fbdev/core/fb_copyarea.h:58:80: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:58:80: sparse:     got unsigned long *dst
   drivers/video/fbdev/core/fb_copyarea.h:64:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const *src @@
   drivers/video/fbdev/core/fb_copyarea.h:64:59: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:64:59: sparse:     got unsigned long const *src
   drivers/video/fbdev/core/fb_copyarea.h:64:74: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long *dst @@
   drivers/video/fbdev/core/fb_copyarea.h:64:74: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:64:74: sparse:     got unsigned long *dst
   drivers/video/fbdev/core/fb_copyarea.h:64:88: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *dst @@
   drivers/video/fbdev/core/fb_copyarea.h:64:88: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:64:88: sparse:     got unsigned long *dst
>> drivers/video/fbdev/core/fb_copyarea.h:73:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:73:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:73:55: sparse:     got unsigned long const *
>> drivers/video/fbdev/core/fb_copyarea.h:73:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:73:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:73:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:74:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:74:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:74:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:74:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:74:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:74:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:75:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:75:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:75:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:75:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:75:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:75:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:76:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:76:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:76:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:76:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:76:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:76:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:77:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:77:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:77:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:77:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:77:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:77:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:78:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:78:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:78:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:78:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:78:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:78:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:79:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:79:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:79:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:79:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:79:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:79:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:80:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:80:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:80:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:80:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:80:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:80:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:84:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:84:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:84:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:84:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:84:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:84:63: sparse:     got unsigned long *
>> drivers/video/fbdev/core/fb_copyarea.h:88:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const *[assigned] src @@
   drivers/video/fbdev/core/fb_copyarea.h:88:59: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:88:59: sparse:     got unsigned long const *[assigned] src
>> drivers/video/fbdev/core/fb_copyarea.h:88:74: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:88:74: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:88:74: sparse:     got unsigned long *[assigned] dst
>> drivers/video/fbdev/core/fb_copyarea.h:88:87: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:88:87: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:88:87: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:102:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const *[assigned] src @@
   drivers/video/fbdev/core/fb_copyarea.h:102:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:102:39: sparse:     got unsigned long const *[assigned] src
   drivers/video/fbdev/core/fb_copyarea.h:112:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:112:51: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:112:51: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:117:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:117:53: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:117:53: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:117:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:117:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:117:67: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:126:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:126:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:126:42: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:136:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:136:50: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:136:50: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:143:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:143:53: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:143:53: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:143:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:143:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:143:67: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:151:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:151:50: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:151:50: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:152:72: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:152:72: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:152:72: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:154:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:154:50: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:154:50: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:155:72: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:155:72: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:155:72: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:157:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:157:50: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:157:50: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:158:72: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:158:72: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:158:72: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:160:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:160:50: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:160:50: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:161:72: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:161:72: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:161:72: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:166:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:166:50: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:166:50: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:170:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:170:50: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:170:50: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:181:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const *[assigned] src @@
   drivers/video/fbdev/core/fb_copyarea.h:181:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:181:55: sparse:     got unsigned long const *[assigned] src
   drivers/video/fbdev/core/fb_copyarea.h:187:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:187:61: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:187:61: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:187:74: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:187:74: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:187:74: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:232:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const *[assigned] src @@
   drivers/video/fbdev/core/fb_copyarea.h:232:51: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:232:51: sparse:     got unsigned long const *[assigned] src
   drivers/video/fbdev/core/fb_copyarea.h:232:66: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:232:66: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:232:66: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:232:79: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:232:79: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:232:79: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:238:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const *[assigned] src @@
   drivers/video/fbdev/core/fb_copyarea.h:238:59: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:238:59: sparse:     got unsigned long const *[assigned] src
   drivers/video/fbdev/core/fb_copyarea.h:238:74: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:238:74: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:238:74: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:238:88: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] dst @@
   drivers/video/fbdev/core/fb_copyarea.h:238:88: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:238:88: sparse:     got unsigned long *[assigned] dst
   drivers/video/fbdev/core/fb_copyarea.h:247:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:247:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:247:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:247:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:247:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:247:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:248:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:248:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:248:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:248:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:248:63: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:248:63: sparse:     got unsigned long *
   drivers/video/fbdev/core/fb_copyarea.h:249:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long const * @@
   drivers/video/fbdev/core/fb_copyarea.h:249:55: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/core/fb_copyarea.h:249:55: sparse:     got unsigned long const *
   drivers/video/fbdev/core/fb_copyarea.h:249:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long * @@
   drivers/video/fbdev/core/fb_copyarea.h:249:63: sparse:     expected void volatile [noderef] __iomem *addr

vim +58 drivers/video/fbdev/core/fb_copyarea.h

73cc8886d5f042 Zsolt Kajtar 2025-02-07   47  
73cc8886d5f042 Zsolt Kajtar 2025-02-07   48          first = fb_shifted_pixels_mask_long(p, dst_idx, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   49          last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   50  
73cc8886d5f042 Zsolt Kajtar 2025-02-07   51          if (!shift) {
ff93a18f54971d Zsolt Kajtar 2025-02-07   52                  /* Same alignment for source and dest */
73cc8886d5f042 Zsolt Kajtar 2025-02-07   53  
73cc8886d5f042 Zsolt Kajtar 2025-02-07   54                  if (dst_idx+n <= bits) {
ff93a18f54971d Zsolt Kajtar 2025-02-07   55                          /* Single word */
73cc8886d5f042 Zsolt Kajtar 2025-02-07   56                          if (last)
73cc8886d5f042 Zsolt Kajtar 2025-02-07   57                                  first &= last;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  @58                          FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   59                  } else {
ff93a18f54971d Zsolt Kajtar 2025-02-07   60                          /* Multiple destination words */
73cc8886d5f042 Zsolt Kajtar 2025-02-07   61  
ff93a18f54971d Zsolt Kajtar 2025-02-07   62                          /* Leading bits */
73cc8886d5f042 Zsolt Kajtar 2025-02-07   63                          if (first != ~0UL) {
73cc8886d5f042 Zsolt Kajtar 2025-02-07   64                                  FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   65                                  dst++;
73cc8886d5f042 Zsolt Kajtar 2025-02-07   66                                  src++;
73cc8886d5f042 Zsolt Kajtar 2025-02-07   67                                  n -= bits - dst_idx;
73cc8886d5f042 Zsolt Kajtar 2025-02-07   68                          }
73cc8886d5f042 Zsolt Kajtar 2025-02-07   69  
ff93a18f54971d Zsolt Kajtar 2025-02-07   70                          /* Main chunk */
73cc8886d5f042 Zsolt Kajtar 2025-02-07   71                          n /= bits;
73cc8886d5f042 Zsolt Kajtar 2025-02-07   72                          while (n >= 8) {
73cc8886d5f042 Zsolt Kajtar 2025-02-07  @73                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   74                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   75                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   76                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   77                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   78                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   79                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   80                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   81                                  n -= 8;
73cc8886d5f042 Zsolt Kajtar 2025-02-07   82                          }
73cc8886d5f042 Zsolt Kajtar 2025-02-07   83                          while (n--)
73cc8886d5f042 Zsolt Kajtar 2025-02-07   84                                  FB_WRITEL(FB_READL(src++), dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   85  
ff93a18f54971d Zsolt Kajtar 2025-02-07   86                          /* Trailing bits */
73cc8886d5f042 Zsolt Kajtar 2025-02-07   87                          if (last)
73cc8886d5f042 Zsolt Kajtar 2025-02-07  @88                                  FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   89                  }
73cc8886d5f042 Zsolt Kajtar 2025-02-07   90          } else {
73cc8886d5f042 Zsolt Kajtar 2025-02-07   91                  /* Different alignment for source and dest */
73cc8886d5f042 Zsolt Kajtar 2025-02-07   92                  unsigned long d0, d1;
73cc8886d5f042 Zsolt Kajtar 2025-02-07   93                  int m;
73cc8886d5f042 Zsolt Kajtar 2025-02-07   94  
73cc8886d5f042 Zsolt Kajtar 2025-02-07   95                  int const left = shift & (bits - 1);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   96                  int const right = -shift & (bits - 1);
73cc8886d5f042 Zsolt Kajtar 2025-02-07   97  
73cc8886d5f042 Zsolt Kajtar 2025-02-07   98                  if (dst_idx+n <= bits) {
ff93a18f54971d Zsolt Kajtar 2025-02-07   99                          /* Single destination word */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  100                          if (last)
73cc8886d5f042 Zsolt Kajtar 2025-02-07  101                                  first &= last;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  102                          d0 = FB_READL(src);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  103                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  104                          if (shift > 0) {
ff93a18f54971d Zsolt Kajtar 2025-02-07  105                                  /* Single source word */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  106                                  d0 <<= left;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  107                          } else if (src_idx+n <= bits) {
ff93a18f54971d Zsolt Kajtar 2025-02-07  108                                  /* Single source word */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  109                                  d0 >>= right;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  110                          } else {
ff93a18f54971d Zsolt Kajtar 2025-02-07  111                                  /* 2 source words */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  112                                  d1 = FB_READL(src + 1);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  113                                  d1 = fb_rev_pixels_in_long(d1, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  114                                  d0 = d0 >> right | d1 << left;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  115                          }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  116                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  117                          FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  118                  } else {
ff93a18f54971d Zsolt Kajtar 2025-02-07  119                          /* Multiple destination words */
ff93a18f54971d Zsolt Kajtar 2025-02-07  120                          /** We must always remember the last value read,
ff93a18f54971d Zsolt Kajtar 2025-02-07  121                              because in case SRC and DST overlap bitwise (e.g.
ff93a18f54971d Zsolt Kajtar 2025-02-07  122                              when moving just one pixel in 1bpp), we always
ff93a18f54971d Zsolt Kajtar 2025-02-07  123                              collect one full long for DST and that might
ff93a18f54971d Zsolt Kajtar 2025-02-07  124                              overlap with the current long from SRC. We store
ff93a18f54971d Zsolt Kajtar 2025-02-07  125                              this value in 'd0'. */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  126                          d0 = FB_READL(src++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  127                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
ff93a18f54971d Zsolt Kajtar 2025-02-07  128                          /* Leading bits */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  129                          if (shift > 0) {
ff93a18f54971d Zsolt Kajtar 2025-02-07  130                                  /* Single source word */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  131                                  d1 = d0;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  132                                  d0 <<= left;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  133                                  n -= bits - dst_idx;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  134                          } else {
ff93a18f54971d Zsolt Kajtar 2025-02-07  135                                  /* 2 source words */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  136                                  d1 = FB_READL(src++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  137                                  d1 = fb_rev_pixels_in_long(d1, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  138  
73cc8886d5f042 Zsolt Kajtar 2025-02-07  139                                  d0 = d0 >> right | d1 << left;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  140                                  n -= bits - dst_idx;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  141                          }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  142                          d0 = fb_rev_pixels_in_long(d0, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  143                          FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  144                          d0 = d1;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  145                          dst++;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  146  
ff93a18f54971d Zsolt Kajtar 2025-02-07  147                          /* Main chunk */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  148                          m = n % bits;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  149                          n /= bits;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  150                          while ((n >= 4) && !bswapmask) {
73cc8886d5f042 Zsolt Kajtar 2025-02-07  151                                  d1 = FB_READL(src++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  152                                  FB_WRITEL(d0 >> right | d1 << left, dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  153                                  d0 = d1;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  154                                  d1 = FB_READL(src++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  155                                  FB_WRITEL(d0 >> right | d1 << left, dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  156                                  d0 = d1;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  157                                  d1 = FB_READL(src++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  158                                  FB_WRITEL(d0 >> right | d1 << left, dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  159                                  d0 = d1;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  160                                  d1 = FB_READL(src++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  161                                  FB_WRITEL(d0 >> right | d1 << left, dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  162                                  d0 = d1;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  163                                  n -= 4;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  164                          }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  165                          while (n--) {
73cc8886d5f042 Zsolt Kajtar 2025-02-07  166                                  d1 = FB_READL(src++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  167                                  d1 = fb_rev_pixels_in_long(d1, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  168                                  d0 = d0 >> right | d1 << left;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  169                                  d0 = fb_rev_pixels_in_long(d0, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  170                                  FB_WRITEL(d0, dst++);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  171                                  d0 = d1;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  172                          }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  173  
ff93a18f54971d Zsolt Kajtar 2025-02-07  174                          /* Trailing bits */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  175                          if (m) {
73cc8886d5f042 Zsolt Kajtar 2025-02-07  176                                  if (m <= bits - right) {
ff93a18f54971d Zsolt Kajtar 2025-02-07  177                                          /* Single source word */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  178                                          d0 >>= right;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  179                                  } else {
ff93a18f54971d Zsolt Kajtar 2025-02-07  180                                          /* 2 source words */
73cc8886d5f042 Zsolt Kajtar 2025-02-07  181                                          d1 = FB_READL(src);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  182                                          d1 = fb_rev_pixels_in_long(d1,
73cc8886d5f042 Zsolt Kajtar 2025-02-07  183                                                                  bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  184                                          d0 = d0 >> right | d1 << left;
73cc8886d5f042 Zsolt Kajtar 2025-02-07  185                                  }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  186                                  d0 = fb_rev_pixels_in_long(d0, bswapmask);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  187                                  FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
73cc8886d5f042 Zsolt Kajtar 2025-02-07  188                          }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  189                  }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  190          }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  191  }
73cc8886d5f042 Zsolt Kajtar 2025-02-07  192  

:::::: The code at line 58 was first introduced by commit
:::::: 73cc8886d5f0422a2190da6d745097b59daf0291 fbdev: core: Copy cfbcopyarea to fb_copyarea

:::::: TO: Zsolt Kajtar <soci@c64.rulez.org>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
