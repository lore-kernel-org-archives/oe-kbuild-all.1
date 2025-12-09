Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457AC20E6E2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280167; cv=none; b=a5hjMk0cWz1DB8nNYsY5uM6XDLHTFoEEzpc08cow4I0d9tif4Jl04JFBKtF+x5e10fmEC8543dUiju8JMEbq2rFijnwZrqEgzH7/VeQQiN112L4tAmA85vf9m8ayeW6AE8hcgl8hbob9n/DnCpV1SYUT792w4Z4aB1RZMWfkjys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280167; c=relaxed/simple;
	bh=0NUqUhb5HZuWA+Yh6rRq053bqySdbDT8ZbfrCM3VYQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XLE6qXdP6jjjSRfhFpSuy/t19itAQXRY+459xIIkC0skUINDXzqdzDKTPKJOluN69gUa1/t3xafyz7A/T0qAEXyEYFyZFjr/JvBotA3Y06TOvtc2bq9IvvGUOEhNDvMjatOLP+TUf+JdoYNL98FBnfg5CNsQeH93EVk5QgCmd4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8N4nj1I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8N4nj1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765280166; x=1796816166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NUqUhb5HZuWA+Yh6rRq053bqySdbDT8ZbfrCM3VYQc=;
  b=M8N4nj1I7GYYifwIpWFaIeeTg/Z9p9AzCUblYIs2BTPa+8/JFjZ21vIf
   KmaCZmKJ+fcAJiQofx5fDORIQujfUB9KgDwE77bMMQmWdJ0f9fU/hCHPl
   +dUhLjwpMlnVxPgLPmu0dyaO0IR0+o0WFT1MYIFLQl7UM8y2CsQEt/ELq
   el0ybVbB3bbke+KPQ/eAzAUAoy4hH7ZjrNGCv/F8lpa2ZWfsS284qWk1L
   vcpKVILNBkUIqU4llSfV/qTlYUr7FU+n2jv8aXebAlkdGX0EikhtvA55R
   lzajpHFwZO7/VJGTlvsWQYswPmjGNEBy4BCx7+Q6//DQdX+GUZa9SqFzZ
   w==;
X-CSE-ConnectionGUID: LEsIdmikQiSVw+Zx7oe0/g==
X-CSE-MsgGUID: e0sB3OTOT8aUjDhL8WC5QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="70854727"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="70854727"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:36:05 -0800
X-CSE-ConnectionGUID: H8fvX+RYRSeAmHkNyLSr8g==
X-CSE-MsgGUID: kNv5D/EXSjmAV5E1uRksQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="227245735"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 03:36:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSw0e-000000000BR-3N7J;
	Tue, 09 Dec 2025 11:36:00 +0000
Date: Tue, 9 Dec 2025 12:35:30 +0100
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
Message-ID: <202512091200.e5bEAkoe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   1 year, 3 months ago
config: um-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_LDB-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091200.e5bEAkoe-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091200.e5bEAkoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091200.e5bEAkoe-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
