Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D50084A5B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937954; cv=none; b=Jjpc4ETJllpgFhQ75zJHEWn6086Ogn2O/wqg1qBQQaeuAvlr+npganUqdvlS0r1WdG5ReDch4jia0iiYdsw/g4p93Xuf+xsHG9mC0cTndwlJlFIDEAqSSxOQede1x04NiHRlVQpvS6sVbWRLrnOlkChucrg2Yxl0x+GFG+pi5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937954; c=relaxed/simple;
	bh=LEgBmXaqag2UbFi0g3rQGnYq5L4tkCjBoKcWLdwTFiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHX534zOIPEmWTCUs5HXZ4Yo7fQMvxPj85xufJi+69I8DViRt1VSKnQ3/7bStJbedchm/Q6WsN92FXq/TijQAAOQQbqntXRC+B9WfN1xYV1b+aofDODA/H0xaWzhlcAvdwg7wXBTnCKl70CSTEld7q/tnRdUix9Hu1PY/Vvn/r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bi4yVvC+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bi4yVvC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735937953; x=1767473953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEgBmXaqag2UbFi0g3rQGnYq5L4tkCjBoKcWLdwTFiQ=;
  b=Bi4yVvC+FucmlFMEOED/vL76zlwOFtoPiSo0rh4zBDFwStXqit2kmFY9
   1S9evxtthQVPCMq5Ogl6aBE2hXc+Ey5ZvbEQcywcugvCaw8XMu/6B7fPs
   s0IP3jFmMI3HiJn43ZDl87nR6QPaaAUcujV3UNUIeqvtqDOcEhw+TCs26
   1Q9mIyJRUuIyEsIIm6wXFjG2cy0bpCZyyurE3R/xdjotK1lWIHBnQzZ3t
   O9rgVmCOBKo8dUZDJuvd+39yhaAfYG4b8kh1eyO+4KuDoqfEJIUB/l01J
   n8H4Z73s2of63ncFDFqBRBQd4N1uZwng+YqJs6yo9dRUxYLOo1ExVUH+e
   w==;
X-CSE-ConnectionGUID: w5Qgx86gTFejsSxb6uL/2A==
X-CSE-MsgGUID: YBqlAs0QT2aR584Q2iOX+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36204067"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36204067"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 12:59:13 -0800
X-CSE-ConnectionGUID: ULj+yQADQPupS6lHvE5pEw==
X-CSE-MsgGUID: M7EhRz8iTzGFJw2dZ1ftEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139210050"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Jan 2025 12:59:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTolB-000AIj-1L;
	Fri, 03 Jan 2025 20:59:09 +0000
Date: Sat, 4 Jan 2025 04:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Bakker <xc-racer2@live.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/samsung/aries_wm8994.c:525:34: warning:
 'samsung_wm8994_of_match' defined but not used
Message-ID: <202501040427.NaiIJAPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 7a3a7671fa6c7e90aff5f4242add2a40587b85ef ASoC: samsung: Add driver for Aries boards
date:   4 years, 7 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250104/202501040427.NaiIJAPC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040427.NaiIJAPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040427.NaiIJAPC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/aries_wm8994.c:525:34: warning: 'samsung_wm8994_of_match' defined but not used [-Wunused-const-variable=]
     525 | static const struct of_device_id samsung_wm8994_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~


vim +/samsung_wm8994_of_match +525 sound/soc/samsung/aries_wm8994.c

   524	
 > 525	static const struct of_device_id samsung_wm8994_of_match[] = {
   526		{
   527			.compatible = "samsung,fascinate4g-wm8994",
   528			.data = &fascinate4g_variant,
   529		},
   530		{
   531			.compatible = "samsung,aries-wm8994",
   532			.data = &aries_variant,
   533		},
   534		{ /* sentinel */ },
   535	};
   536	MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
