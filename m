Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE814D272
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 04:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708747236; cv=none; b=HxnIuz2U4tWrOzKPNmReaIP2uGlvzevoRWP0Vv179EFe/rwrlP9OI6jKWZezKvaPOsRaOZbJRA4IPnTp3EY3blp15MEtKZaY5EHPQA62AM4dnDHViR37zHhwEuR8C7xj1mQNcnRKmTGsQFQMxu27KVnNqa6lhZuoqSvN4QJTbtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708747236; c=relaxed/simple;
	bh=WATzGMqbbfGxANHqKyPgAL+KPO4Q4Dq5tQyzl8emxM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JBQ49IM1FqfwM8eLPAXNz5MjP4WCTxqPhtDmFAp1NvtGkq7BL6PR10NvnhUEmxYN1/2NgfU7SBFBIADaqgRskvX4EmdkTvcFi4WPrFTZaKO+BZKbcGeVTIJjm8VI5Eqe5oKFDgJISqsMDdCpURKfvz6t5o8Lxn15nL9nj3o2i/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcJl+wfj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcJl+wfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708747234; x=1740283234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WATzGMqbbfGxANHqKyPgAL+KPO4Q4Dq5tQyzl8emxM8=;
  b=XcJl+wfjhUn4064m5swpEibXJ7TSHS45uO0wy38NPHyAInIcrQrFvqjb
   hVywj7l4SMs91s3q20d3262gj/3xwdUPPM+sA5Z+/a15P/SSfzB32ZH9y
   KoV9hR7rfHDUC6/KZ49iGW6klF7Fii2oyI5RXLUKFPvlrpHOs96sDoNCd
   /roN3K1e0gD/prESmKJpeFjXJ33uvCEntJ7hOaDwqj3lWelqloXV3oqc8
   WvS98nOGsvWOAHe9ujeT6KqhQp1AcQQUoIH/Bnq8rnYKwyMcdEKJcvIxt
   DoYp2ERAk1xO31Iobx2Qls/YU6Nx5QZAadxh6Y4NOaUiJ6ueLBuYmTWv+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3214351"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3214351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 20:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6266109"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Feb 2024 20:00:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdjDB-0008C8-0v;
	Sat, 24 Feb 2024 04:00:29 +0000
Date: Sat, 24 Feb 2024 11:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Kim <brian.kim@hardkernel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
	memeka <mihailescu2m@gmail.com>
Subject: [tobetter:odroid-5.15.y 1/204]
 drivers/gpu/drm/exynos/exynos_hdmi.c:165:19: warning: 'hdmi_hpd_enable'
 defined but not used
Message-ID: <202402241158.XRPktcVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   200d2466033be9a082bfb81368de8a994e399a02
commit: d5f4cb5822810fb9310d976216330c988e94848d [1/204] ODROID-XU4: drm/exynos/hdmi: add 'HPD' and 'vout' as boot parameters
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402241158.XRPktcVE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241158.XRPktcVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241158.XRPktcVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/exynos/exynos_hdmi.c:165:19: warning: 'hdmi_hpd_enable' defined but not used [-Wunused-function]
     165 | static int __init hdmi_hpd_enable(char *str)
         |                   ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/exynos/exynos_hdmi.c:151:19: warning: 'dvi_force_enable' defined but not used [-Wunused-function]
     151 | static int __init dvi_force_enable(char *str)
         |                   ^~~~~~~~~~~~~~~~


vim +/hdmi_hpd_enable +165 drivers/gpu/drm/exynos/exynos_hdmi.c

   150	
 > 151	static int __init dvi_force_enable(char *str)
   152	{
   153		if (!strcmp(str, "dvi")) {
   154			gdvi_mode = true;
   155			pr_info("hdmi: using DVI mode\n");
   156		} else {
   157			gdvi_mode = false;
   158			pr_info("hdmi: using HDMI mode\n");
   159		}
   160	
   161		return 0;
   162	}
   163	__setup("vout=", dvi_force_enable);
   164	
 > 165	static int __init hdmi_hpd_enable(char *str)
   166	{
   167		if (!strcmp(str, "false")) {
   168			gEnableHPD = false;
   169		}
   170	
   171		return 0;
   172	}
   173	__setup("HPD=", hdmi_hpd_enable);
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
