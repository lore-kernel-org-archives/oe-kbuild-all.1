Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2A817BA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747578639; cv=none; b=GUlnlmhRgwkK9geeWUJQshx9SeijMe6zP5cKhMsIdUlhDJOuD8flcYMeuG+p+5xfgrynqjPLCvbo5ZG10rTNbDnrLd8r+9wXO5cJb+OXx/fpbJupRn+8Ffy1CEqavoBrxaD59TwYjj2ELFFfN4umy0T7me7vcgU82H4w8tHFdwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747578639; c=relaxed/simple;
	bh=zA3oehRC9Y1qNDnzH/Lcol7XPdyBACJQc7Ju5jlFUDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GskgvHxMmE3ezqR2arnvNjLJ/KQ3oODN7ifzU1H2hU7nn8hb1Wk/YFgW1erz6tao5GwvwC+L3vAcyzA0n3OLJuGNHrkrXsIvk6Y8eyB39Ijb2R1YbrnuhMsPZ5MLUDZOHZGC/vsMqs4sb4t36vH7aao0Gq05aqJGXp/sCd4u+vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iADxiKMO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iADxiKMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747578637; x=1779114637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zA3oehRC9Y1qNDnzH/Lcol7XPdyBACJQc7Ju5jlFUDY=;
  b=iADxiKMOPJzlj2e1stx3X3J2/shw+e9Kxw6lJq/Avv5wts+nWooy3X2a
   LpZiL9AS3QQ+77U6VSlzBHy6GtT5GgnDB67Rqb/JcgfJJle31WSmC2EOF
   we5QnQYLmVokgO/K93LLfd5FvzpfQjRAT6A0U39tHf69fKspDxTzijW7b
   xhSappwpTmUxN/tR2yD9bxgs7SvOAcWjNUd+vuxaNQe2YjPFXp30GUAsd
   CK0uuIMvMblJHyTGt+8IYsTikWmrB3h9+duCcaQ5cIkw7gVJubM6DK1BX
   Bd/EM7zr6wlRPz4NeZ7Fc6Z1luHcaWW1vpzLreMoDoIKvwcsU+/L4Aocd
   w==;
X-CSE-ConnectionGUID: 75Ec3l9kQNqmaXVzJrcyDA==
X-CSE-MsgGUID: t/3sbtAlSWCAEXYOYT93jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53158704"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="53158704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 07:30:36 -0700
X-CSE-ConnectionGUID: bMEooHqcTB6E1lnp/IHpUQ==
X-CSE-MsgGUID: iY5+exOjRvW2m6hggidKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="144014280"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 May 2025 07:30:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGf29-000Kpr-1q;
	Sun, 18 May 2025 14:30:33 +0000
Date: Sun, 18 May 2025 22:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 6/6] kismet: WARNING: unmet direct
 dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202505182223.eAobQLFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [6/6] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20250518/202505182223.eAobQLFk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505182223.eAobQLFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505182223.eAobQLFk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
