Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909ED8C07
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 19:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737661855; cv=none; b=GpyAEYZDi9wpIEFy37WrHJrsBSq/UbVEsKn19NjxTidTlBKuYtusymr0DAiMwsYHIKwQaGall8zqzAFosgESJWor34+9VVzzb4VpSuPB+kebu3EDUI4GYa4WAIqeQPdDB5ChEIwVdeu0lnrpV9M1PrpWMO3BJMOxblOkChMH8Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737661855; c=relaxed/simple;
	bh=oksnxFa/F0m3akokjWp3f4SXUIxUtLItuH94YYJiQr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVjoSkFlw3FSpS9X9efNzAJIXH5/Z6QKcu1pEgsoM5CsdcFGdY1WgQYpCUExhqxtfClLvudKrzaT1HqCxuyoGS5RNplztchpYAdv5rei0YFm4N8q/rNEBNLC+rRyRd+E8RS58YERWukaGE2nUEj03QeTTkoW9MdJWPJbdGGOW28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXrjOMQW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXrjOMQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737661854; x=1769197854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oksnxFa/F0m3akokjWp3f4SXUIxUtLItuH94YYJiQr0=;
  b=LXrjOMQW/Gt7UskSiVx2qr0WIpIlb8eXJhYYi7Xght/jhFaIPuDd1Wp/
   iK8BC5/7Exm3cPJMfjgf3OqHNRcVmutZhuu0WfJmk5r4x44gw0lKhdnuV
   aqxoxkQBksHWJtLWG+viuGDuer75uEMSdV9kUCntUYqej5RI3zbLfxSCy
   3d8qEv3RtCjLFj1U+oxa/+FbEKSi7vPPfujEL4hRqTY2he/gZ8kkdaae6
   VPgODW+tVDVH94Vm+Wzld9wUngiAGmYoWvJbGDCSn/k08VCzdBVeLLWPQ
   IbsegogxdQcMcmet9zkC9CQNubaboqXoTqXmYHlLUntbfJ/o9tGiYHk1F
   w==;
X-CSE-ConnectionGUID: sLrPAZtLQ92Cep9Eioy+kQ==
X-CSE-MsgGUID: 8U17E9Y8TX+HFoyiqvrSSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49174153"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="49174153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 11:50:09 -0800
X-CSE-ConnectionGUID: EOCdLnqcSg+YwbSnO+ozlA==
X-CSE-MsgGUID: /atPDzyjSByrdmjc7bDz2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112692795"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jan 2025 11:50:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb3DJ-000bbT-1E;
	Thu, 23 Jan 2025 19:50:05 +0000
Date: Fri, 24 Jan 2025 03:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kismet: WARNING: unmet direct
 dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202501240348.TBwscbxC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   4ad760793763353e3e3a16ef238bb7a72eea3792
commit: 194fc9ea8a50fa11e9b03bf04449614fc79be59a [1/1] ANDROID: GKI: enable hidden configs for DMA
config: arm64-kismet-CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240348.TBwscbxC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240348.TBwscbxC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240348.TBwscbxC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
