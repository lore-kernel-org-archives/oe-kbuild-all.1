Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3391D54FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 00:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469323; cv=none; b=oqdbF9npAJ+NSZlLbAWXtciJFMRfhB9Brzo7BFGCxw7OsGa96cI/155seiBykYoiLO483tmHtTHtwQU62A2HTAkv09MgSKMExebZOsezr5fBUFX09a9DzZ84Oa+Uh8jjL5pnCcXFnMgaO9RoLpA06eVIA0aP0vzE3+pEOszFJY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469323; c=relaxed/simple;
	bh=fHprsQ+F3fgKJ/6IaPM1BKQRjUYM2nCtCs8KfQNXs18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=svipOE2lKgn9DG5NWRbikAQk6kAWpvFOf60c6fTuDOI4kMNoGPTENcIf0hM75dt6XDaEUhuPmO8aSMZS4CLfZcc15/FRwSwteXo8WQQtbvXvvBu34+1emJEpmyf0xt85Zgxjujl1yNbtlh73r/MyzHPhNbAj1k6R1mYuU0xSqnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgAzhQLo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgAzhQLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790469321; x=1822005321;
  h=date:from:to:cc:subject:message-id;
  bh=fHprsQ+F3fgKJ/6IaPM1BKQRjUYM2nCtCs8KfQNXs18=;
  b=GgAzhQLoqpeR/nktwTRG7ndffX7e41K8t08yP3U9s/YOp9hC107Q+Vj6
   304RgKGfSBAvsEGWJQa/bimoEGj1rUc2DoK+srI98tH7Ox//84V79zvOJ
   nqU4iUE0X2wF8hOqZtD8kPIJq7rLEd5DClZjs2KTLFyVmNAAaZnT1jyZt
   lDl4olRQR5AtspAixVtlBc1ziq3bv2asx+cE3m9pm+rGUE6dVNjHqlrBD
   bQkTM+4+c+HBRRXS24u/LRxh+zBpVNf/Cu6mzwxxhWiElZRGDx/6sIPoQ
   Wl+94s+5QPoRBvVeLMyntidkgxsALW2h/mJMgp/UkP0MuxbafqD2qJdb1
   A==;
X-CSE-ConnectionGUID: oXjCB3QqTamRJRJGGCV9HA==
X-CSE-MsgGUID: L3bhWI8ZQce1mv6JpMUq4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101382851"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="101382851"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 17:35:20 -0700
X-CSE-ConnectionGUID: v4XHreemRiKhnOAKebG++Q==
X-CSE-MsgGUID: Mb1nB9vUTDuSKy1ELhFgEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="279423239"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2026 17:35:19 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAcrM-000000000J9-2WeO;
	Sun, 27 Sep 2026 00:35:16 +0000
Date: Sun, 27 Sep 2026 02:34:04 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_AST
Message-ID: <202609270228.yku16Noi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_AST-0-0 (https://download.01.org/0day-ci/archive/20260927/202609270228.yku16Noi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609270228.yku16Noi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270228.yku16Noi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_AST
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_AST [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
