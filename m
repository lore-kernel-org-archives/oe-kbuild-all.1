Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A557C8F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766363594; cv=none; b=Pczvws6QiUZmOUIRf9674cf44A1LmfHgTWs8MfqLcEJUE163jlcvpeqmSSj8H6k5a7WnZafyarEjggdOf7PDwvCO5dTlVJ9LtHCEfFrMH8lfl76rhcla/cJwaFov5h/l5PGb8XVicd4vMZtmNpbkqQqn2oiNWkyvICrxc+Igu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766363594; c=relaxed/simple;
	bh=n5cRNpTjOwjJYntc9AzExyBZUTmWZYX+kSpEkHw34Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hH49osrmuf4euMDDFKRjfa7GPTkTOYvmLNLkDtg3WNFxkFbOzm7ZftXZQbLjdwnj2uUMJlDxWTo1t0tzO+ML+v4gb7jpTHCkaB8G+35UaC4idIgiUOlGcI1wV8WOV9q05Ay6sSJVfNuhYtLJdOojSvMJ+rlhooiii4Kf8qs4an0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/PaxPND; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/PaxPND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766363593; x=1797899593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n5cRNpTjOwjJYntc9AzExyBZUTmWZYX+kSpEkHw34Cw=;
  b=T/PaxPNDncbGULnk2UGWtIacv9pzthYKKyry6dJBN/P060MLfsDxoyOk
   mLLxg9PJRYOiktA42vAZmjdxpPzEgeqUohDTUFcQnwGsHnytKuOaV8LSN
   jETxK6OMU6kvS8fu/QfY2jFEMdOCrcdVBN8XorU0cO9KjvATlal5zQP2x
   o+vHeTVv2b5PEcj1M10dA2b4toZr8CSxVUCbt94X/1SLwNT4jr5Ai1H7u
   eIQ90QbIeAnReWhz6iI5TYrTfeTWvTDn53ppfBLZGNnv/W4THeM4UCHxn
   ncF9oq5vw5u6uGnxbKTyH0URwY2TMlwRMIUEy11d2HqAHI1NgeWTCH9Wz
   w==;
X-CSE-ConnectionGUID: nAzwGDBCTLGbNc2rlBR+EQ==
X-CSE-MsgGUID: /s9GL88kSS2wQnxu8CGg/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85806857"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85806857"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 16:33:12 -0800
X-CSE-ConnectionGUID: /8hiYUGrRc6wG6D1KZLcjA==
X-CSE-MsgGUID: leOXFTm9TX2y4fXDgQMKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230047740"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 16:33:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXTrI-000000005IE-1lIO;
	Mon, 22 Dec 2025 00:33:08 +0000
Date: Mon, 22 Dec 2025 01:32:35 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for DRM_MIPI_DSI when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202512220157.w8O0lck5-lkp@intel.com>
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
commit: f7fba40921f00bc7b43021aee0efa8c7cef35601 [12/12] ANDROID: init: GKI: enable hidden configs for DRM
config: x86_64-kismet-CONFIG_DRM_MIPI_DSI-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220157.w8O0lck5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220157.w8O0lck5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220157.w8O0lck5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_MIPI_DSI when selected by GKI_HIDDEN_DRM_CONFIGS
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
