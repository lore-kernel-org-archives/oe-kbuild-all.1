Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8DDB665
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754118663; cv=none; b=GDIMx+jjra3pOvOwbqebouB8/aRoqBTn011h3VC+TdMP5tyVrB/2sDVKTCEVb4ZXC2sSOPeIrpSNE9IWXYHD7Dfbkff7sLc4lPJMKzNIwCJL9BKyU29GqFt3aS1qLgC49lrW7rDFMFB7fVd0JOp+thaxWB+EBa0lbU615gU2JTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754118663; c=relaxed/simple;
	bh=/9oIDtXSoTnX1RAqmp986PWvp4xRztyDpE6ugxMevHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjsObINMKXVn7gq6lid0XDGRAhJ8UGd5T/YF9Zrv0VcdhqUcKk4XxIaaWUj8ruCV17ym0viqq7chCUxstP5AwQvbBh9NhTBb7WTmsEe/7Rjuklwpk9Sd4BenxwDXPL6FbGy2lAXOKxmyqm0//jh7Sec2HeXiwOZLwtQkgx+uYZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8Yw6nl/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8Yw6nl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754118661; x=1785654661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9oIDtXSoTnX1RAqmp986PWvp4xRztyDpE6ugxMevHc=;
  b=S8Yw6nl/QpgzoJ1JKo3uctfhBYzez216hlPvloMnD6YY/xkkk4+gEuXz
   dQa0lnsyfkK/D2ZJ6ui6alpqKLPrKe5xgoH5jccYn1D4LEsSBDPvGTLdv
   R57jZtOC0Wu/KJZMAAaA8G7hWx+jLnqYhl4OhYHnBn8I8MsctmGsxkAXO
   62mAhaSJNuARsA+xjd+IBxZjD9icPUxN8hlihfs7DADokDI9zFc8tN0Pn
   3G3I1tTyWvOXsm6sET01uh6zoiM4jiqhFJ0DBDIjUASqywNiBOst/SRVG
   cA4byfpWxAH1tzWaRw7dCrAVWBjXLL5hnzxFjFmU6OTThpU/Mw0DNGwrl
   w==;
X-CSE-ConnectionGUID: FLTlmccqTqGG4JWbCPZ5Ig==
X-CSE-MsgGUID: Kb1dx21pR++OJm25caUAxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56326677"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56326677"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 00:11:01 -0700
X-CSE-ConnectionGUID: kaqvkXnxSNunnWaAvlSBEQ==
X-CSE-MsgGUID: 8AaYyffSTKyzWd0OqsK8GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163022816"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 02 Aug 2025 00:11:01 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui6OP-0001O7-1J;
	Sat, 02 Aug 2025 07:10:57 +0000
Date: Sat, 2 Aug 2025 09:10:55 +0200
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, Inki Dae <inki.dae@samsung.com>
Subject: [daeinki-drm-exynos:exynos-drm-next 3/3]
 drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:20: error:
 'DSIM_TYPE_EXYNOS7870' undeclared here (not in a function); did you mean
 'DSIM_TYPE_EXYNOS5410'?
Message-ID: <202508020934.BhKodje9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org:/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
head:   3b57713ed0626c2277b871f11de467fdf8d154ef
commit: 3b57713ed0626c2277b871f11de467fdf8d154ef [3/3] drm/exynos: dsi: add support for exynos7870
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020934.BhKodje9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020934.BhKodje9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020934.BhKodje9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:20: error: 'DSIM_TYPE_EXYNOS7870' undeclared here (not in a function); did you mean 'DSIM_TYPE_EXYNOS5410'?
     158 |         .hw_type = DSIM_TYPE_EXYNOS7870,
         |                    ^~~~~~~~~~~~~~~~~~~~
         |                    DSIM_TYPE_EXYNOS5410


vim +158 drivers/gpu/drm/exynos/exynos_drm_dsi.c

   156	
   157	static const struct samsung_dsim_plat_data exynos7870_dsi_pdata = {
 > 158		.hw_type = DSIM_TYPE_EXYNOS7870,
   159		.host_ops = &exynos_dsi_exynos_host_ops,
   160	};
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
