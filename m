Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1BE14B954
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 06:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719381781; cv=none; b=T5bUwv5pYRgA+rzbXx0A5fmOlT2PkEH0fJOMR/ijvkbzZ9ZiNpZbz2492a977jDefGAAlBY3KYQKfoosASV6QjapX2amTVRZoVKdvisXH+fwvuNGAHtcSlnWOL01sD3nPNgFFRd936Lu8sG/uyOriKyPIDxHwFdZfaqypApIAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719381781; c=relaxed/simple;
	bh=i3nbNTGdPtzMwCvWGyt6dplWPYLVcAM2yO93Gigm7os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSJ3qk4GtMKBsm6KsPNGOoU6nGjHTywBPl5WSYQYhfoAbpm5ZXPbnN/dZyPMKfo0md0xysSAEni+VVxOh5XfCfBS9ry2b8gSPKEXjjIS3N37jFF5Vu+4RItjulo769oTTHHnyzA/hoiddBvmtX4IPyDtlUqbeel9bT5TmEjJGuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJyA1wmA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJyA1wmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719381779; x=1750917779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i3nbNTGdPtzMwCvWGyt6dplWPYLVcAM2yO93Gigm7os=;
  b=IJyA1wmApmsi2oLRA5/5/uXsuiY2SiI4jnzy3nlbMRcZohwvrY35VEa0
   UAa+wh5wYrMskpf4+zAzqr0QRn3e2PY/atOzCACSR95ErN0YxIE+/in2C
   2uie2hTgi3slzFmxnCTFuKWi3UXmzV/fHoSCapj/ogKw+OIE5BUSU/N5+
   BTOFwcieV3qinXtdI+nQm5DJTs8vKnwWVybjPn7NamAV50pH1pxlVUMp/
   bGq+Qk/i8/r6ffwp9qctQQ7shi+0m/EDgKS/nPMeO2Schh3mYaRhT/h++
   KRmDl5DSpD7hmgnZJN/lm3jiLPoHeUK5L1lM/9/GLVc+Nj7KcKc09g9LU
   Q==;
X-CSE-ConnectionGUID: ihrz3PhfQwmxbeRryLITIA==
X-CSE-MsgGUID: u6LXaLoCQuWe6aXILR/oxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16580351"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16580351"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 23:02:51 -0700
X-CSE-ConnectionGUID: 3PAu7ltzTcSI7ls/tF0xXQ==
X-CSE-MsgGUID: gEYUTH8mSSyvnaP9HAdZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48868497"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jun 2024 23:02:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMLjz-000F2H-1K;
	Wed, 26 Jun 2024 06:02:47 +0000
Date: Wed, 26 Jun 2024 14:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [linux-next:master 7259/8232] drivers/gpu/drm/drm_panic.c:99:
 multiple definition of `init_module';
 drivers/gpu/drm/drm_drv.o:drivers/gpu/drm/drm_drv.c:1079: first defined here
Message-ID: <202406261341.GYsbLpN1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: 294bbd1f2697ff28af7f036b2cb19fee78eb100b [7259/8232] drm/panic: Add support for drawing a monochrome graphical logo
config: i386-randconfig-001-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261341.GYsbLpN1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261341.GYsbLpN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261341.GYsbLpN1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_panic.o: in function `drm_panic_setup_logo':
>> drivers/gpu/drm/drm_panic.c:99: multiple definition of `init_module'; drivers/gpu/drm/drm_drv.o:drivers/gpu/drm/drm_drv.c:1079: first defined here


vim +99 drivers/gpu/drm/drm_panic.c

    97	
    98	static int drm_panic_setup_logo(void)
  > 99	{
   100		const struct linux_logo *logo = fb_find_logo(1);
   101		const unsigned char *logo_data;
   102		struct linux_logo *logo_dup;
   103	
   104		if (!logo || logo->type != LINUX_LOGO_MONO)
   105			return 0;
   106	
   107		/* The logo is __init, so we must make a copy for later use */
   108		logo_data = kmemdup(logo->data,
   109				    size_mul(DIV_ROUND_UP(logo->width, BITS_PER_BYTE), logo->height),
   110				    GFP_KERNEL);
   111		if (!logo_data)
   112			return -ENOMEM;
   113	
   114		logo_dup = kmemdup(logo, sizeof(*logo), GFP_KERNEL);
   115		if (!logo_dup) {
   116			kfree(logo_data);
   117			return -ENOMEM;
   118		}
   119	
   120		logo_dup->data = logo_data;
   121		logo_mono = logo_dup;
   122	
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
