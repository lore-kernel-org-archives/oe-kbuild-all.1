Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E842FA0EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 00:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769042427; cv=none; b=cSx/g5v4iVWCG9EDkiWVdAwKofyNCgWnm5Y5fosGV2Ncpp91bO44FoOQWSsEtiDlxSQ/K0isBv6NtTedagitOaKHrOt5uUXjct9uwrNOAm6gbF8vpJRC1JEE+DR+hWRAWTdlOb31jOQAuZuWZlS/MlapSKCDulVwTwlv5UZtfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769042427; c=relaxed/simple;
	bh=K/9kGn/oN0NNF0NXP2IAIqU/d05nCq1mJ2iQpCdpEdA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iEcskG1GXk/AthiqC4iYwoCDSzpJ3EQeDr3UoSC5jKLg175zLfxj6Sh4x0zEkpuOAft1ADBOB06btJYFEat8HVJYgZSu132OGiQJLkXH2nXd04q5Ag/bQ3Nh9e2ih/spPbYhZDT0hLqnLuc8YdqP68FH+8z0ydjksi6I+VfMFng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJAtpo1Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJAtpo1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769042425; x=1800578425;
  h=date:from:to:cc:subject:message-id;
  bh=K/9kGn/oN0NNF0NXP2IAIqU/d05nCq1mJ2iQpCdpEdA=;
  b=cJAtpo1Z9ZlYRXWcDJ84DXj/SdoVCexno6wb+rE/ZTQ/vbvObls471jY
   wsYDb32qX4mkfV8hQnknkEqQudqBxx0/fw/tnnRHuR/OJZWf9dCoNln3d
   lFHj8lVrHJ597ZmPSiELhlZuGo0SMUcDX5iVbHiaiTyaPY2198j/5BKNR
   1CAnarhHLJ5hQV0QGNrFgv21yzSVFTOI4I867djjChybkADrmEaeQ5S6n
   kZV5BCTJEyRA7Vi6icWeJw/T53mh1wWfUeAOkn+ftPHY7pBybAeiSvbUl
   7NfYb6VFMNVJzFXKm849LK5K5YnFMOshR/bIapw75jMhRYR7OWpb3k6c+
   w==;
X-CSE-ConnectionGUID: 7jr4lpw9QUKefO2xRJtGjw==
X-CSE-MsgGUID: NYCyikvrRMKPgk5wqjmlfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70186279"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70186279"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 16:40:23 -0800
X-CSE-ConnectionGUID: G2s15visTNiJaMm5TK9PAg==
X-CSE-MsgGUID: t49Agd6bTjO871LGMIwBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206402821"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jan 2026 16:40:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viikF-00000000SD8-2A7u;
	Thu, 22 Jan 2026 00:40:19 +0000
Date: Thu, 22 Jan 2026 08:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: {standard input}:2578: Error: pcrel offset for branch to
 .LS0009 too far (0x28)
Message-ID: <202601220827.q388gZaT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf38b2340c0e60ef695b7137440a4d187ed49c88
commit: b7c5334af69d359fcd7a39ed409a08138900ec18 drm/radeon: use dev_warn_once() in CS parsers
date:   5 months ago
config: csky-randconfig-r064-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220827.q388gZaT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220827.q388gZaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220827.q388gZaT-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:2578: Error: pcrel offset for branch to .LS0009 too far (0x28)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
