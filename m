Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77950221DB1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 04:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766550772; cv=none; b=V/WXs6yCZkO1HB+Inn+rpevU98QxvQgLRIyYLsMVJYM2VHKsfO64nWRx9KIDrjysVL2WD7cOs1QwsVv4I+Sn8daDkUESxUmBFQtJCeI5CoOaZuwFp0DfmBAU9J5FTxdLiS5oMTKb94y08kdkF0ZEiRVhC7i6F7cESOv9M2oVwzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766550772; c=relaxed/simple;
	bh=EN+rXpnGImw/meUR3pNVaz/vMEUz7zRaDsVd2CUoyVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ompoXyaD9ghgyYdX/UL8QijfDrE0+jVaaEvxIPgEE/HHuKSwSJAolIoBKJUWZO1XbmQGeSrM6jXStAuZbpfJp0c6FgUKg4wGKh6eczidailWveg+XuQTyI1so5BKgK4qrfxlsrUQikQfcN5TLY2p+SDsMGRh453ilwZ1vdnk6YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nifzPOTZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nifzPOTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766550770; x=1798086770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EN+rXpnGImw/meUR3pNVaz/vMEUz7zRaDsVd2CUoyVY=;
  b=nifzPOTZKRh/gYLAk8UmvRH7Guyk0hIBYorgeYVaVcrVkhDetirnqrBS
   s2EYYHD0Fa8kddnrhR3/ojUtDK78yEe3uKpMtiUuBh+q0X+mjSSQ9R4HK
   8o7qnNTL3iCBYOzZLxqn0btaWMFaV2gF0Dmh0rzhFHjxXAEk0NWL5A0vd
   LFkTfi2Eisz3PsjCwx02jB4LATk+kbutMKvnC3JolgW9QBh4LcAVqBWjY
   xnGzsN9nu1v6mUD76qLV75UK337c97QceD4h3jwZIejBmEe3ITlFyb7hQ
   QKUsqqvbs/bRdaSXssw1gBwO5w8mswDclAMga+KNaLDfqx/ensBnjE9CC
   w==;
X-CSE-ConnectionGUID: E/zYYp9zSWaay4Kh46v4mg==
X-CSE-MsgGUID: rIM/ScwwQduV6pBuRsTjGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68436072"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68436072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 20:32:49 -0800
X-CSE-ConnectionGUID: FGhrYK1yQCOvse6caqZF8A==
X-CSE-MsgGUID: RepttAmpQX6/SV/xhIHUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199914077"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Dec 2025 20:32:49 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYGYI-0000000066u-2Wbo;
	Wed, 24 Dec 2025 04:32:46 +0000
Date: Wed, 24 Dec 2025 05:32:24 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] kismet: WARNING: unmet direct
 dependencies detected for DRM_GEM_CMA_HELPER when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202512240505.vAWTu6w4-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_DRM_GEM_CMA_HELPER-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251224/202512240505.vAWTu6w4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251224/202512240505.vAWTu6w4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240505.vAWTu6w4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER when selected by GKI_HIDDEN_DRM_CONFIGS
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
