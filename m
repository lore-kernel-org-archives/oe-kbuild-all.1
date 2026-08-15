Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907DD352015
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 23:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786837094; cv=none; b=p1TL7pl5MpOz6kEihZpU/BgZ15eMfDAPgQXX/rXAwqYJ9jaDNLrWmIF0OIt1du/rOP3lrGxArj7CGBMxBSyGoNX/UBk6jnLtamwnk3ILkgfyLNhNpROeAGNRei/oauMDG11NHrhzAGhQlHz8DZJTLDVr+LZUMk81W6XzW1CeHqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786837094; c=relaxed/simple;
	bh=ib3Zcauhvkb83/jYXlJ0Ve2FoX+pzfNKI6rU9PRHipg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KH0EBrp9DfhCZYHqQjTUujtqek3OBpF0kkox+7QjOdOiZgSfpMmIOkg2lyNkkJGGD3E5BQHclpSfA+aOBcOjEF8AzLNghLDhzmmMN/cqb34YiCLumZRyoCeJyXyCcCxkDxhuPUAEJ+mw7oOSnWimJULjikGhdvQAfrDRqijqwlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUvfKA2a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUvfKA2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786837092; x=1818373092;
  h=date:from:to:cc:subject:message-id;
  bh=ib3Zcauhvkb83/jYXlJ0Ve2FoX+pzfNKI6rU9PRHipg=;
  b=DUvfKA2aAVl3M8Cmvih2a05135JE3YLtqMtZsCwnih+9PgL9Hu6O03DR
   DPD+wPAkqdnZMd85AQ95rhi6QduyLKDQrPbwUO73Yii3T/YQRt8lmn9z0
   3q3WZJmNn8CTdt8USo+arIfVsvqowD5qjM253xNTh2iyhQCvm0OvBpdap
   O31pUBjGViJ7/wnbhGFEdjiRzhYUEjUV8yvyefFlkjwH+DxuPscxqSJTV
   At3qPa5k12NU+DvafCxRT6fs3HIFasIl2sD2pPpF/3mwTHE4DKNsX5vy7
   uWpI2MHaoSOZYBaF0t1kGsgvskWWCKSd1Q/Uo0TkWc4FCEDeG3vD7hPMq
   Q==;
X-CSE-ConnectionGUID: +7UW2aG+RQWm8/GD5QN1SQ==
X-CSE-MsgGUID: qTqYDVBcQBOZAZ0qLGAz5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="86484431"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="86484431"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 16:38:11 -0700
X-CSE-ConnectionGUID: 9rod20JxSlOtSoMbFEbPnA==
X-CSE-MsgGUID: Vbk1XAyKSeyGUXhpMInv5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="266550018"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2026 16:38:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvNx1-00000000cWk-3wZy;
	Sat, 15 Aug 2026 23:38:07 +0000
Date: Sun, 16 Aug 2026 07:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 15335/15435] ERROR: modpost:
 drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol '__udivdi3' undefined!
Message-ID: <202608160752.ByyZ6wer-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: 0844dc13585b7f54d4aa1a295725f9d24bc9ab70 [15335/15435] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git
config: i386-randconfig-016-20260815 (https://download.01.org/0day-ci/archive/20260816/202608160752.ByyZ6wer-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160752.ByyZ6wer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160752.ByyZ6wer-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
