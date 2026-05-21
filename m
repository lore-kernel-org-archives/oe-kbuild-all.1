Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20F1A9F8D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 06:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779344286; cv=none; b=bHIpY/DiQO//+7xXhGXPtI6uxLzQSnkxr5W0UFbueV+lwBBaX2EctBooD7EqEdwzsJgUrtQOT0l3U2gnHll8mPwPuLDa6U+Mi4T8qagFUAuKoewTyOMCFe3NLetS2KfPKNu2xCKqWTck4GhZK3Me+ysINY2Ks6tSqT9cDE8gOyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779344286; c=relaxed/simple;
	bh=QrC+r42CE8+iu7Y5K59LD6qE8fq4m4FtuP8iPiSgSjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UfUQv0NN7RU3rf8YOG6va7pTBjNmCGtXuJoKq3128Hhn60rUduvFRDTvxBcEDWGJskCAhw/M2Jd06ijvXhHl96NviLe2RwB6SdbyqGSmgHvKQshIqkWrRepYl7Ax1JI53Q9+mxtS++geMvo7dE9Kpv9maSc5d54HdVINfpSebMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgvjX5mG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgvjX5mG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779344284; x=1810880284;
  h=date:from:to:cc:subject:message-id;
  bh=QrC+r42CE8+iu7Y5K59LD6qE8fq4m4FtuP8iPiSgSjc=;
  b=MgvjX5mGn0VtN9x+3DRK68GwmRa5k8tUtfUnpiQpTcaj/EIqhCd3fd4X
   LO1jw24l6utFU4cf0o0n/Uw65ypaZMnEm2HkaGfgc21tEqZ4t6q4A5Wnn
   WOEpm+1GTkBNgZPaqSFyjVsTvtA1KXe11pp1iicjWpm52U7HciJvO5a1R
   HZBpOPx0TqRcShOHw2T/UHO/11FU//bijwEkPzdNbHh9mp4J7Od73ea3x
   cgfQcufJvfGGxn6LI1tP+k1mVzDeCocL/UUx2gck3tqlCVHJ2ryZYmyPc
   d/YAfg+S1vOArs1zAiYzUQILQuLPyyi0fQB8JTM/DtJ2RQceHYjsiYTVu
   A==;
X-CSE-ConnectionGUID: bXrtI1w+S5aggRy6OpBTLw==
X-CSE-MsgGUID: 1CDtaDeATiWdaa0WMATiLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="82835637"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="82835637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 23:18:03 -0700
X-CSE-ConnectionGUID: UHX6UIH+T2eE4MKkQ/NloQ==
X-CSE-MsgGUID: YaYZIS6TTA65QJ/JK2oZYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="237412055"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 May 2026 23:18:02 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPwjH-000000004Vx-3tO7;
	Thu, 21 May 2026 06:17:59 +0000
Date: Thu, 21 May 2026 14:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 517/6922] Warning:
 drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in
 'devm_drm_panel_add'
Message-ID: <202605211430.a0wNIR4M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   687da68900cd1a46549f7d9430c7d40346cb86a0
commit: e43a8e3ad8fa3c2c2220a06fa46545c7ff82a9b7 [517/6922] drm/panel: add devm_drm_panel_add() helper
config: um-randconfig-001-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211430.a0wNIR4M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211430.a0wNIR4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211430.a0wNIR4M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in 'devm_drm_panel_add'
>> Warning: drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in 'devm_drm_panel_add'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
