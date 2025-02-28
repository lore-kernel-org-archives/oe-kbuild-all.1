Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A923F38E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740775775; cv=none; b=AQ8z/+TUzoAwHC6QjDoxNUpJNIWrsGluL/ujXK6RFJONi99egGQeDouZSqhJz3P+QorGVGyk8RwCb9etTlG6cmfH5TncpvC4pnOkDJQYg3wse9KSCq1vPiNxvB7noTMQhGgURfOHbOiYForjoTVS2s5WVq08FWiEpttkfjGzRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740775775; c=relaxed/simple;
	bh=zkXVGkVrpsDAcei3ubhvZoUQlpvIbOP/dtO/0SVTUmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2Xt2X+2zPsJA9xX6BSMuZPO6i5OpUmbIXfG5uAkRSGzd7kV3U/GZGG4Sy69Pg68S3wf3Ng5jn2/N//nli2x5iTsK1fxtSHJTG/b/FuT9soCtal1ssKPDzD5ZuLZkhpuZlSHJSKeOSoL5NzSNC7gdv05Y3DMgG9p03xNYomWuK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7sirNY1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7sirNY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740775774; x=1772311774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zkXVGkVrpsDAcei3ubhvZoUQlpvIbOP/dtO/0SVTUmc=;
  b=S7sirNY1pycY8VofXQDZk2D3pWj8gtlODTNdV/+PaQMrYIeTX3wMkdGT
   1JfohPlJxdRuAWML5IdYjoKwSmdQPqxEIJjtre13doMDTTnWusQGyj+zj
   CAkr/grVhtFYCvpgteeqiStKOrhmIKT3bSXXWT4JTXzQYTCBgNEFSVTz0
   NNH3MUn7hDgO1rFJK/TB4DeXnUbnraAl0nxZ3mHlA6f7JNNuOx59jfCiw
   tsiBzkRb7na99x/c4jG+8RDoGMlMO76eQi0MpuxeJ3sx7512H1TBQD0aw
   9xk90tSsr2KerjcStGQiTnWfrthv0a1gz2BcrtIdl1KffUhlfBRgRJ7lJ
   w==;
X-CSE-ConnectionGUID: rsDRfTE1QcmzEpTukdm8iw==
X-CSE-MsgGUID: TVAFTKnRSCCyoLZ3+Vj2Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45368346"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="45368346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 12:49:34 -0800
X-CSE-ConnectionGUID: hhVUkCXKT7O6pfQg0y9N0Q==
X-CSE-MsgGUID: DyRhmPc8SVOanC/bEGxlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="122396174"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Feb 2025 12:49:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to7IX-000FV6-24;
	Fri, 28 Feb 2025 20:49:29 +0000
Date: Sat, 1 Mar 2025 04:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>
Subject: kismet: WARNING: unmet direct dependencies detected for G2_DMA when
 selected by SND_AICA
Message-ID: <202503010458.iZun3bkL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   276f98efb64a2c31c099465ace78d3054c662a0f
commit: f477a538c14d07f8c45e554c8c5208d588514e98 sh: dma: fix kconfig dependency for G2_DMA
date:   4 years, 2 months ago
config: sh-kismet-CONFIG_G2_DMA-CONFIG_SND_AICA-0-0 (https://download.01.org/0day-ci/archive/20250301/202503010458.iZun3bkL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250301/202503010458.iZun3bkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010458.iZun3bkL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for G2_DMA when selected by SND_AICA
   WARNING: unmet direct dependencies detected for G2_DMA
     Depends on [n]: SH_DREAMCAST [=y] && SH_DMA_API [=n]
     Selected by [y]:
     - SND_AICA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SUPERH [=y] && SH_DREAMCAST [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
