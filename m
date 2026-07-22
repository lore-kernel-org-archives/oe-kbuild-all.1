Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D6411F82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784743337; cv=none; b=ucJX89OP+4SX2aHQkOoSuZaJN/ShmmvC/qWnbPEsWK3jBdgBXFNGjo+R8S5FCZlDoija/X58o2neRgcyVYYb49va8q4UKpPYX/k+wOBYNJhVnTWAQigetY3xa+ZxF5o+AF+SH/bahn8wfTs21iXtxm4REEhbIqB6cf8OVNadtcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784743337; c=relaxed/simple;
	bh=P1+kU3e4KGT+TfB11omSSJPekgbuxQpf9chO1DNXLXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p1M5o/imNH4E9nn9v4EpBlDPqjr/brdEx8jhlM8zA7VkhQCzvHaL9m26+HURg5C0rxfkMcXM6SmbOcaSGezX1711NE+KXMsEnR2qd3oA5O5/dZzjkmRcR8I2HDDPsj/ntE9HZhIwW821j03ncwLnxlYrYICv3SWqTjjI/JDmJ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOnOCGeC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOnOCGeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784743336; x=1816279336;
  h=date:from:to:cc:subject:message-id;
  bh=P1+kU3e4KGT+TfB11omSSJPekgbuxQpf9chO1DNXLXg=;
  b=FOnOCGeCTlxWSTV2ah0Kl6j9nTnrzFjiSJCGQAKGmeRO/9twiWOnLLSz
   r0zphJiAy3hQhPZ1RulaiWpWu+jYk9RwDoUfa4DKyBi3NPTnVDGyMZZ87
   NbpKntcazbnyGUmw0JLsNAbpbIyBzgPQBKmODA/CVTj1lQ5m448zfYCLd
   Y8+UgkmEw+bHymeq+u8UJV8LTBKti751z1BmuwQ30FQ4T09Z1HsHvOtNJ
   1DO4zyxQWt+ZBdSfxcnhFOHgNTl4IeQfqpVZ0NZTi1edC4weddvwfA46+
   UAdBkcIrOCwDREjMcD1b3291uwO5pzZ4q0rNDWrzLNUVC64uGE6clp8+x
   A==;
X-CSE-ConnectionGUID: 8wyYYCdkSfWXHugZYQxNMg==
X-CSE-MsgGUID: Q+XgtH4rRea8rqcirix9cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="87926200"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="87926200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 11:02:14 -0700
X-CSE-ConnectionGUID: CpcYdE+xQ9G85jrIPd5UCQ==
X-CSE-MsgGUID: gmgRwgzwS9iMaRhMYRxJCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="288167463"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Jul 2026 11:02:12 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmbGk-000000000Wm-1Ydl;
	Wed, 22 Jul 2026 18:02:10 +0000
Date: Wed, 22 Jul 2026 20:01:45 +0200
From: kernel test robot <lkp@intel.com>
To: "Shahidan, Muhammad Shahmil" <muhammad.shahmil.shahidan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 1/1] kismet: WARNING: unmet direct
 dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_ISX031
Message-ID: <202607221911.O3CTjsBx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   af406d75818b912a1b72efa75a20f8bf3e9a3f01
commit: 6e6aefa2d1fba10ddbfa66f5d4c4f835b9f7a8bc [1/1] Add ISX301 and MAX9X sensor
config: sh-kismet-CONFIG_VIDEO_V4L2_SUBDEV_API-CONFIG_VIDEO_ISX031-0-0 (https://download.01.org/0day-ci/archive/20260722/202607221911.O3CTjsBx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260722/202607221911.O3CTjsBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607221911.O3CTjsBx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_ISX031
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && MEDIA_CONTROLLER [=n]
     Selected by [y]:
     - VIDEO_ISX031 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && I2C [=y] && MEDIA_CAMERA_SUPPORT [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
