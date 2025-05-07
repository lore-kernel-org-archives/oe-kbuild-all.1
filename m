Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5991F1F8ACA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598030; cv=none; b=RNN/UsWBrI5l19UZA1n4Aenq1NaNrqZ4T7dre7zV+ASF5bzEieLCNbe2du6FW/KdRGhzGO1rlO2R1tH7j/0sVncmFzjN1GC8raN5hpPpbpFPlKwGTxqT4M7v2aNcXDZ2j2Z90gdC5UmHCqS0kwkJnxF2Fri4d8LpEwsl0XeQpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598030; c=relaxed/simple;
	bh=PKjp+ZjZvC+kZn+XXV2pDrNF5ZRH9pPW1xg2Xqr5N2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sv1GuIAsS92P82e9QY0rEeghpLtOo4lwsJNLAb387DcWHeHeD3F8ARAUqLTn2LPcrQLUNOgvPU0xucvCqZg5xA5rMWENLUeVCk1OQ2KJpks7AA1wAVtFRKH2JfuLDR0XTwfHBx8B8urbHyfTz2gCHxJGqy2ZFrGtZjv8y0QMpco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikpUHo+/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikpUHo+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598028; x=1778134028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PKjp+ZjZvC+kZn+XXV2pDrNF5ZRH9pPW1xg2Xqr5N2I=;
  b=ikpUHo+/+hFtVTCzqXhZPYB/Trxz00IwMiw2imFKKQ+j8cgXUWUPkf9E
   eu/klZmxEcxlnjxTCGhS0UQtHI/GUMYmCiweD8FEoSARr8H/qb6rR3d1d
   TmaXOmS+mcPq0Gy2RKc/ro4wnq4W/qH4Uz1XkH9XdlijADBf4p7IKWZMe
   GFpKJisOjdd32dc7XU83WDeEJrd+HWl61nMdr+eqBVyH4KgCKescYfQaD
   YOt0asx3Ojt/HQeebw03/DA8Xx3gjGNvkULeTD43OYM4SAblbznac6df/
   BGChgo7qYsFAOI1/dE8RqAIu3/pcide7FY+uxb6Maf90UvAn/e/Kicuct
   g==;
X-CSE-ConnectionGUID: smNmpP3iRdCfeRjszCG7jw==
X-CSE-MsgGUID: 3ZrZxvV3TQ2i5Mof3ipb9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48316391"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48316391"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:07:06 -0700
X-CSE-ConnectionGUID: BrSD+Ya5Q9ipua3G1JWjOg==
X-CSE-MsgGUID: thHlykKSQ0qCOs6jcHT+dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136370564"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 23:07:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXvr-00079Y-0g;
	Wed, 07 May 2025 06:07:03 +0000
Date: Wed, 7 May 2025 14:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmrmann@suse.de>
Subject: [linux-next:master 5048/8679]
 drivers/gpu/drm/tiny/st7571-i2c.c:965:26: sparse: sparse: symbol
 'st7571_config' was not declared. Should it be static?
Message-ID: <202505071359.emVlEWLu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 4b35f0f41ee295059c46a6f4ae97e4b5b8f10d9e [5048/8679] drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
config: arc-randconfig-r122-20250428 (https://download.01.org/0day-ci/archive/20250507/202505071359.emVlEWLu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071359.emVlEWLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071359.emVlEWLu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tiny/st7571-i2c.c:965:26: sparse: sparse: symbol 'st7571_config' was not declared. Should it be static?

vim +/st7571_config +965 drivers/gpu/drm/tiny/st7571-i2c.c

   964	
 > 965	struct st7571_panel_data st7571_config = {
   966		.init = st7571_lcd_init,
   967		.constraints = {
   968			.min_nlines = 1,
   969			.max_nlines = 128,
   970			.min_ncols = 128,
   971			.max_ncols = 128,
   972			.support_grayscale = true,
   973		},
   974	};
   975	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
