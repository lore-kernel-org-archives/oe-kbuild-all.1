Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D723929992E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744214; cv=none; b=SPh9YTiI8u1NVuD/WPmABG5eF0LU1Lc96kqCGt0ofepl6TsvPp7uOpXpRvFTIRGoRCsUUWu+om3+wBHx1gf/jDZ3MEGIo9eWwSbwl6tD1z0oUaY1qHRS+7NuAVIYD018LGgZSF8SCgs3nkaxrm3Ac4hrDTX1nMMx3KfCcAtpTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744214; c=relaxed/simple;
	bh=eQAuv1qty3f2PnUNIYqtBip2Pny84/Hg2azGWDTmQyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ps9EJBRomeoQF9UGhQoxQ43CWfsfQuejZLbXJy7E+kaPybE1T14A209KtE3HWHDVonzy6P/ynKLTxxsxiMctpnU0mN64FapBu8sG1ca1WlVmJBfVuTkw8dwmLZzf22Lhg9Am55kXKuz7Yfj3eMEi/YxARDntTg+w093kU9sM73w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tb9HBSjy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tb9HBSjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749744213; x=1781280213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQAuv1qty3f2PnUNIYqtBip2Pny84/Hg2azGWDTmQyw=;
  b=Tb9HBSjyYFr+lgYPXiatDHhrXWCFsYgDewE1zyPN2koEQ7ro5k7tp/+R
   9dDHsEevv0buBMSiSGpOQhPZRxnUm5huay8c07akPDunzsJB+sw+xlaRg
   E/Aql4VhiHbvITNmweotUr0Hivn0RZ36ndok1zzN3B57MfifwsSYw4G60
   8Arbpo/ZmO0ZozNfm7bAFABh91Un03cPAlBAicROtRdLtssfgbYMvSA8/
   NSvNFjsY0hDbBcrPPl5j2OE1lvgg4gl/+hwIqAOtq4SubNMXA5GY+TB/o
   5zTXCbMk7tjbQnPL9LFAv53Mee3xn+uBILxL7pixTYSbCEr6g6B2ICqml
   g==;
X-CSE-ConnectionGUID: kCP3b5XKQIa9H+juu8nMgg==
X-CSE-MsgGUID: eHplebNeRfSloV+G8Oc7yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63346013"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="63346013"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 09:03:33 -0700
X-CSE-ConnectionGUID: L5bJKi6bS9qWu6BgsT/QxQ==
X-CSE-MsgGUID: OI7L6HcbSUqtAaEgt7uvHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="151393233"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2025 09:03:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPkOm-000Bkm-20;
	Thu, 12 Jun 2025 16:03:28 +0000
Date: Fri, 13 Jun 2025 00:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
Subject: [linux-next:master 1896/2199]
 drivers/gpu/drm/i915/display/intel_panel.c:466:30: sparse: sparse: symbol
 'dummy_panel_funcs' was not declared. Should it be static?
Message-ID: <202506122306.3fmBVDue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0bb71d301869446810a0b13d3da290bd455d7c78
commit: 3fdd5bfbd6381e4acf86ee1d00a87d49fd39fdc6 [1896/2199] drm/i915/panel: register drm_panel and call prepare/unprepare for ICL+ DSI
config: i386-randconfig-063-20250612 (https://download.01.org/0day-ci/archive/20250612/202506122306.3fmBVDue-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506122306.3fmBVDue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506122306.3fmBVDue-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_panel.c:466:30: sparse: sparse: symbol 'dummy_panel_funcs' was not declared. Should it be static?

vim +/dummy_panel_funcs +466 drivers/gpu/drm/i915/display/intel_panel.c

   465	
 > 466	const struct drm_panel_funcs dummy_panel_funcs = {
   467	};
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
