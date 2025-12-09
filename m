Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394E3314DD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285511; cv=none; b=bxLB0Snt6bGGrrdw8Sl5sZHhUeQkMORrPpRktdVUFVfYwpXFDJGLSxsUPA1BT62TmlBGSlouHyEA9G3jfPun8l7Jw2vsV6gmb1t6LC08W5g3FXP2jMvGcXPj+vUbq20DGNGKbDtMrP8TR4ke/NQNaimMFDrNee4FhuPkhLYB+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285511; c=relaxed/simple;
	bh=IxRvSOM+xOJXh4FMbGTAaIGpiz9NxNw6eFgxq4ZKo0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhbvW4gTm4HKobn6MWumGMqfP5re1JkhQEug8prI309x2oN3rDJ6gVtSSFMlweFYTkAHtP3P5v+ZJQl7uDLTvwR8Ll88YWryEBFFFu4AmEkS5bvWqLlFxQftzscYh+vvzx3FQ/vswiTufh1Z92vl7KnjGqn7EH6B7B9Q51cO0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+eMPWF8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+eMPWF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765285510; x=1796821510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IxRvSOM+xOJXh4FMbGTAaIGpiz9NxNw6eFgxq4ZKo0U=;
  b=X+eMPWF8PNONXBMw/uIEVhg7UtYYVSysBYldsDf91Qw9zulkDjtLOVee
   qvY5a7uYpT1bBJ1wTSNJ0kVlBtSMzIuG36ir/359NR5bIM4l9JjJHB4wI
   Tlyxaqh1JIdTJ/CAxJ6VbNp5eIH3/hW2zVvLsW7qjcC5QxlILyA8ZPU2N
   wbo4brAPRHa9r/n3p7kFnwMV9qZcqOIh6sUnDkzhn+LPGOgesDg+Idilc
   gEsTBI8uNg48abwm7BmfL1lJvZsQhAQ08bXVKicHdcPOdxsHdiFuw2oMx
   MpTGasDL0amvRiQ1BW30cPw1XFQnTgCHI0Gh26n9PGkkzlLW9m73fixrB
   Q==;
X-CSE-ConnectionGUID: g8NdNX2sRvqcb8mNIhWirA==
X-CSE-MsgGUID: 4bf6oGWETMyfadp19Smb2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71097593"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="71097593"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 05:05:05 -0800
X-CSE-ConnectionGUID: 8KGdhP+MQMuzYpJwFolXCA==
X-CSE-MsgGUID: Mn+Bl2aQS96818SEVaE/Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="195987192"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Dec 2025 05:05:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSxOn-000000000Cc-3Fma;
	Tue, 09 Dec 2025 13:05:01 +0000
Date: Tue, 9 Dec 2025 14:04:13 +0100
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
Message-ID: <202512091439.FlmJASlR-lkp@intel.com>
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
config: um-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_PARALLEL_DISPLAY-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091439.FlmJASlR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091439.FlmJASlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091439.FlmJASlR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
