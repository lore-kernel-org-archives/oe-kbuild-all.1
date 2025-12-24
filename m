Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4221256C6D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 05:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766554373; cv=none; b=dz8EcJSwhNa2ZUdgAKRBQ62BZfWGztpUoQjejbC/N2wUgkwtc0M6XaBHvW5LWnL0nJ3gvijMIIpq0B/sTVrSbLuqHr/UYREQPHOXMy/hkyvOlvoC2k3YzqDrWtv1qYFw0cDjfETOI6TOgt+Ece96r4RYimfngvSWXw5m679a3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766554373; c=relaxed/simple;
	bh=KFYATgQ7icz7QFhPgvkOq8fGuG8W/9pYcQ0BP3wUZ0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6W1eVp5XF9yRAAEAZNy87axvoYw2cf5SRwItgoOZBFMox38gP3EY2j4qFEmfpfKpREcOpxvKnw7r6wMAEgFvkJH9iQJFYQwq/bdSEuM6OYU9/dkwR1n2yP5//zvZ2MaVOcaYTytP7XL8VunNmkn0VYooXsPLMr11zVZrhYF7cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CE7dWXXC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CE7dWXXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766554371; x=1798090371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFYATgQ7icz7QFhPgvkOq8fGuG8W/9pYcQ0BP3wUZ0g=;
  b=CE7dWXXCD1dJ3xWMAbJ3s97ipkqHVjU4L8gXi0L/0zGZVYzNbNOXtQO1
   YAul6DyBgtyAcjmzo7DYdA8xICtU7Rm2MH6F8uuv5wVT2L/lWj/40YtiO
   857D8Bc7T3hwNrSOA/v4smXw7ZGQc5mtw1tUBDkQJEeTyqOCTKm/xemZU
   G4sIsM45kph5/WwFDViCHw3kuireaNve4NmiqtqXtNLtX1/LgZCsiUz6u
   P/vHwnKg1KPjhj2CxQkzT2y36cq1GO0PHF/DW9T5BsWKrTXF3F6+t861j
   /zQajvgKzGHGAgqvyhzu8/6fyAB4Py7vZAmWA7jddJmjQ+fiqCqZ1V1n/
   w==;
X-CSE-ConnectionGUID: jztRc3J+QL6IZ5q5vzD23A==
X-CSE-MsgGUID: ZUS6CYx+SSOqNqIWhrETMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68468697"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68468697"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 21:32:50 -0800
X-CSE-ConnectionGUID: IAjaQdZ2Te6kpPkcioa7Bw==
X-CSE-MsgGUID: MuA/oWozSii6aXof5CqjfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="230983476"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Dec 2025 21:32:49 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYHUN-00000000684-1GzG;
	Wed, 24 Dec 2025 05:32:47 +0000
Date: Wed, 24 Dec 2025 06:32:14 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] kismet: WARNING: unmet direct
 dependencies detected for DRM_KMS_CMA_HELPER when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202512240648.GrxWGKyw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   48ed03a80ad49e3648c77d8c2c1ca10e706d6215
commit: f7fba40921f00bc7b43021aee0efa8c7cef35601 [1/1] ANDROID: init: GKI: enable hidden configs for DRM
config: x86_64-kismet-CONFIG_DRM_KMS_CMA_HELPER-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251224/202512240648.GrxWGKyw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251224/202512240648.GrxWGKyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240648.GrxWGKyw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
