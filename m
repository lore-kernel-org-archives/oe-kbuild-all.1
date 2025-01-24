Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D11D7E50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 06:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737699599; cv=none; b=t/Dn7Qp75s2ekPbj5mIMIGHiwhkMwiOyFojfiSdH/cYln8RMYeNqzqFRCTgJlnpthHktVOWxRrBZ/FBvWVkccd/PTmpCiTmfd5OkRjiyLvX913igp5/DaR76ymWSMQlmtx/97pBx6oop7M7tCqnAzsJAc/zlD9Odc+pcWinbAcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737699599; c=relaxed/simple;
	bh=1wF21TaX3mMDeeGb5ewvQkxygNkkbBpOkiiMKgT6O6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOZvzxLIjgMsCtN3VqRccbRhk9FUD0JX8I9nSvehOhSFC4fkUHHwlBjnEwTAS7zTjUVXa67oIKL2TUD8a31FUqxjcUyueZIaSyidA9T+DkeQ8i06zm1WCK6kAF/UvDY9CMAwrwh+PpuL9RxMqRFKd+VByXpnrh7cIi6MNjzFaJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBwDdU+G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBwDdU+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737699597; x=1769235597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wF21TaX3mMDeeGb5ewvQkxygNkkbBpOkiiMKgT6O6U=;
  b=GBwDdU+GDzQlBMkWgnpf7b7DJhehOrN4vfMYz7pIzCVtfpTFktlT9itY
   Ma4ka9dsibb24moK+9B4CUFuiF384AipFNaFMmFlRWrZfQHaoivn4j6t7
   Jejbm6CcWtDW/pX3bU6RV03X73HtWsqB3/F+n99TsAr1Ol7T1iLG9dORI
   ZUfv3s7IkxE0ryWh2614KkKYoePnRq8D4qP48o1AIwP+nJSP9D95uVSGh
   BYPJxEwGarzqBTvkQMdufNLtYUtrk+CdXfDR+RhQNnTkC6xl/rY/HVGFy
   Jp7nrJKc7/SGqY+/E0wY6/2obe7Y0Hc3Xd2wT6fXHnhfbJuyUjP+KklFa
   Q==;
X-CSE-ConnectionGUID: 4A/Am1dXSAi4WjjvSJxxPQ==
X-CSE-MsgGUID: 2Wu1KvX4SyCaxhR69Se3ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63580390"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="63580390"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 22:19:57 -0800
X-CSE-ConnectionGUID: xx+M63/XRban3vupgzwRIA==
X-CSE-MsgGUID: kNqU8EZPQBOGdUlhPsZceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107685414"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 22:19:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbD2n-000cGZ-1o;
	Fri, 24 Jan 2025 06:19:53 +0000
Date: Fri, 24 Jan 2025 14:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for DIMLIB when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202501241409.aLqdZ97n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   cdffeeb8cf4188b4609dcaaed0a7586856c3f903
commit: 1dfbe413d21f18f714cca818435299947bf5649a [1/1] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: x86_64-kismet-CONFIG_DIMLIB-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250124/202501241409.aLqdZ97n-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241409.aLqdZ97n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241409.aLqdZ97n-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
