Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFFB1D5CFB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 00:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787963912; cv=none; b=PJ8hD0CrX4Xhns/s7pC4eUJ2Hr+B2wu/lRVUAciwL2f6XGAAzEvOpM+4+TPdEuOIl2gTRX6sBHoi1l6Dx83VIaEBVFRAdE3FO/Bc1PTed2XAwBfxRc5waD1DLerJ+aHb1PsfcMmco950cMDErE8EcY7tA+tsx3/B6q/rvqRgOpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787963912; c=relaxed/simple;
	bh=QfSGtl4XOzU/fgPo/tX++JvNxz/SGWCNIB6oshXFAjg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PvReZMiWCzmN4zm2/8lId8bjvWYCS/XnEMCve0GuuGQg8A0RGmdOU+ilvZHVh3LUN/GJ2xgOm8XtipTMLXGwHu9mfMnsnrihbAqEMZs/b0z1YnIte0ktqtORtrw2XA10DA2oO66qD2KIxO01WfPoVe6np0Sct3mAlnR0uzF3jOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rw1Sgt3B; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rw1Sgt3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787963910; x=1819499910;
  h=date:from:to:cc:subject:message-id;
  bh=QfSGtl4XOzU/fgPo/tX++JvNxz/SGWCNIB6oshXFAjg=;
  b=Rw1Sgt3BxQvnSBMINTLE9eqvW+55Mm7Ymly4OcPGMptQbDrUgDJq6ij7
   TOXqNJfsv0ObAGr4Ae3XBmHTQL4xDuZ+kj4SnzY5GmooqzeBNQQFJXtSC
   dfJHHjQAXpTO2fFTmTuV2p0xSPHmoDDVAPgoiHNiFrynXG9HKe7J7gHBZ
   XStDQYc0ANHkIcTD5wSd5zT/+rcRhnnrXPpoByBe/OEcxz6bMTDegBsDA
   +jH1H5Vw1E53sA1kShbNu9b6ayT5XKE7g08Oe1Qr1lANqjdz+Mp4nmay4
   tew9lsgcl5qT0kswZj1TaR69dCkE8/k1F5GaBNLO3PzLnU//09c7ftXph
   Q==;
X-CSE-ConnectionGUID: wpDkciuQTuC418AAFO1Avw==
X-CSE-MsgGUID: QbXfadyDQduKWKYMwPpCPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88397013"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="88397013"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 17:38:30 -0700
X-CSE-ConnectionGUID: 4A6B4etxS0W8B5YabBxyIw==
X-CSE-MsgGUID: cTBdaSpEQhyW8eZ4M8FrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="306525765"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Aug 2026 17:38:30 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x075W-00000000CAu-3BIC;
	Sat, 29 Aug 2026 00:38:26 +0000
Date: Sat, 29 Aug 2026 08:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 21/28] Warning:
 drivers/gpu/drm/ttm/ttm_resource.c:125 function parameter 'ordered' not
 described in 'ttm_lru_bulk_move_init'
Message-ID: <202608290836.YQkeHv8O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/vramstuff
head:   da1cf9de1bba45648450c64323fca70bcf2a65ae
commit: 2fbdb6893cc6ed358f0232bff4eef598a6c5b419 [21/28] drm/ttm: Add ordered bulk moves
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260829/202608290836.YQkeHv8O-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290836.YQkeHv8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290836.YQkeHv8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/ttm/ttm_resource.c:125 function parameter 'ordered' not described in 'ttm_lru_bulk_move_init'
>> Warning: drivers/gpu/drm/ttm/ttm_resource.c:125 function parameter 'ordered' not described in 'ttm_lru_bulk_move_init'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
