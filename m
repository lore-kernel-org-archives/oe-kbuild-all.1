Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE133993
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 02:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766370917; cv=none; b=Mn/ZjgEvA7d4mYy0if5sEKmP+C2HsR99vNeCJYcXc4oNvKwLV5qZhiykFzq+oH79CW/vW3058+SZYacvszN73d9wbQ30Gq6x16B3Ty1aKVsX4Ux99dMreYYwwUGD7hojE54JjK4bh6DfQULp+Heye8KsC3yBSLy2pdbUgBkWHeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766370917; c=relaxed/simple;
	bh=7Qc2IQJPHrornscZXV2Rcl/I84TSE24RVOKw6onFlg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxDGxO834dvuSLtuIcWjGuLr94pWeRWdCmLiZR+Y7SuP4Ir+Ty+dnvd0L5kiJ/WCJNxCYObhF3sRO5u937BdOtf1X99UASDn354WYzermquM0QOl8mHxwIhCgwe4Y8ynRrjJXvybe+JhANHuIc09rV0ojrn3nkx5mvO3aIsYt7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtV9bliI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtV9bliI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766370915; x=1797906915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Qc2IQJPHrornscZXV2Rcl/I84TSE24RVOKw6onFlg8=;
  b=TtV9bliIBqW4qeI+CUGHVcKdts8FGkSgarODJ90T5VdJMY+oWgEu0y//
   GEJ+ieSXn36tsU18nh9iZLrCui2jDGBnCvYn0gWWk+npUw8DInakdbvDn
   +n+eHUYfcamEpgaMT9gPeXIt+GUWjJT6wcBewHgWTTIzaZm/g5t99NvVV
   F/ZOgMtfH7AY39SSzc1r3lE7zDZ+9iCzYekDKIj8oVAjvDAnDLDnJNIrK
   xST8kEQOAZMxBCBZtkFo0d/9hesvuK7yuJjhFLoTjtlYIc+QzH3REX+fc
   s1CYdLH+LBzqAX1GaAiVM/a6sCL+qgkA/aNLV153Y0pG787Ug+zypm/PX
   Q==;
X-CSE-ConnectionGUID: vwivXhBxRhqviJY5y2870Q==
X-CSE-MsgGUID: NUy7KiznSsWSwFicnWPGQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68208980"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68208980"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:35:14 -0800
X-CSE-ConnectionGUID: RG1HsSc0QyumDaXJV7Oqng==
X-CSE-MsgGUID: tC17Gex1QFCqBkfLAlvk6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199162751"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2025 18:35:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXVlO-000000005L8-1fZk;
	Mon, 22 Dec 2025 02:35:10 +0000
Date: Mon, 22 Dec 2025 03:34:23 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for GPIO_SWNODE_UNDEFINED when selected by
 GKI_HIDDEN_GPIO_CONFIGS
Message-ID: <202512220356.Xd6LJHmT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: a9941c3487c04548801b67e356636d615668c152 [12/12] ANDROID: GKI: x86: Add GPIO_SWNODE_UNDEFINED to hidden gpio
config: x86_64-kismet-CONFIG_GPIO_SWNODE_UNDEFINED-CONFIG_GKI_HIDDEN_GPIO_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220356.Xd6LJHmT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220356.Xd6LJHmT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220356.Xd6LJHmT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_SWNODE_UNDEFINED when selected by GKI_HIDDEN_GPIO_CONFIGS
   WARNING: unmet direct dependencies detected for GPIO_SWNODE_UNDEFINED
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - GKI_HIDDEN_GPIO_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
