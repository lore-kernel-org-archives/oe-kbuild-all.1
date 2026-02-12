Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2334274FC1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 18:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770919882; cv=none; b=QInDJ+3ZNROL/2jeewTFkN/rPjOC4n08K5eLs6WrpvTUvRPg2FYFSQDhsO9HNNZTrp0BRoly2hauSxnE0NNdQDKqGxrI9Zi+07W0u8T8D+iEFSvEuz4vtZuA+pDnjc6yWn6UnDzAAUjtquzxvVb7OmJ9ftijo16YTa/b5C4OOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770919882; c=relaxed/simple;
	bh=CTaJ5RpRekOX7aluG/oXEjMkShbYquqeeGa54CgPg74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FOCsBNDfNyG+OPkLliYOtPlKuGlSN+R9Ag7tM0ssCclfiC5RI9r2/ZVGeMbXhrCujBgFlXD+S+knrcTfVu4o2hGeg78fHrdnu3kQW0eariRLNL2XhmGZeS6FAOSldoy5IDNs1fB0vK83aJI6M/x8Q6R2DRux1zO+/LkHu7fFS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haNGdq01; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haNGdq01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770919880; x=1802455880;
  h=date:from:to:cc:subject:message-id;
  bh=CTaJ5RpRekOX7aluG/oXEjMkShbYquqeeGa54CgPg74=;
  b=haNGdq01JA3NJNPLuzWDznSwZYi/vcVs+iY1jpvOdXxkcpoGt5LEq7Z2
   mUcoveYMDigf1hruS0KRh17ubkso3U/mpjL46ibfVjk2tJK4H9jnzCr7T
   VQTh6QZt9sflP5bAWfZZQg8wlai/DP7/kpPrThdaOUbcVUeMzfJ+af9z1
   luV/aHP2dlAyiP4dgTkx8mZ8Uo6Yo2GrH4h5Ecf/ii+j6nSkTzmTwIR6m
   5J0jf2le7YRYaF3eujHjh/+IUkr1j0sCklN6Fapn/Kn40Ezd+EVn0MKqn
   rguxAfDKgkSiJqaS4Wmh6VpQffxISe1151rB2zfehbTAx8z1sTzZABWuI
   Q==;
X-CSE-ConnectionGUID: CbLyIVvAS92lo8X0mQTOsw==
X-CSE-MsgGUID: XwwLFVnRTYGt8nUWsFGE6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75946907"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="75946907"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 10:11:19 -0800
X-CSE-ConnectionGUID: 6jTn/NBGSuqEElaCpCsVEw==
X-CSE-MsgGUID: xoY2UOegS3O6YNYnJ8wL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="212155481"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Feb 2026 10:11:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqb9n-00000000sEC-18TH;
	Thu, 12 Feb 2026 18:11:15 +0000
Date: Fri, 13 Feb 2026 02:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk"
 [drivers/media/platform/synopsys/dw-mipi-csi2rx.ko] undefined!
Message-ID: <202602130253.BZnVd4jh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   37a93dd5c49b5fda807fd204edf2547c3493319c
commit: 355a110040665e439af126e8ec9c3968e73f163c media: synopsys: add driver for the designware mipi csi-2 receiver
date:   3 weeks ago
config: i386-randconfig-062-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130253.BZnVd4jh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130253.BZnVd4jh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130253.BZnVd4jh-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk" [drivers/media/platform/synopsys/dw-mipi-csi2rx.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
