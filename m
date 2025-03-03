Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD841F0E2F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994758; cv=none; b=Ybd9V/KWlMn1BnaiGnjS4D4vmskptgFwUXeRRy+pVG4AJI2poTZZFR+jmlDDTc1Q/1HZoISAqhrKjdLk1t+SoZ1uSVAnWNia250QqaN3Ybkf0vyUhSZk7t3eaXu0uFIZU2+jWNvwCkWNQXd00xRmjb3Q4IDMf73FaIOEAmm0mxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994758; c=relaxed/simple;
	bh=5t3O9whUra6gjyVP9IpglTtIw8qjNGKt/m9XmVQp4Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eg4x8eXdT+jSs4xOPa1qvXRmdqZqO+m99Zq3lf1OyvffOx5jwcQmLTwKvwITJyMwLp3wmQJ+3r28G6CBsQ5lBis1Vy8breAs/H8wxTTsONZWd/MXYRvO5MvNAz1bT6BTyszDI63vEk/3n/MNzoMPn8JTGu3/declQfg5ROVwaAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bf39eRhO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf39eRhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740994751; x=1772530751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5t3O9whUra6gjyVP9IpglTtIw8qjNGKt/m9XmVQp4Bc=;
  b=Bf39eRhOzkwYTrSpNbf9T0iRGoMFjw0aQmIJJhnxLD33tyt+aoUY2azy
   Ui7Pj6Ca7gaxH2AkIysV5IjB24X/RvR9U4Klnyn6sBom5r10TMrfCt5NJ
   LemEqcShVZ2OeqtJ0sfpkc4djklzCTKEh9NUagHm7PVDQSKNYUjsU8BJf
   xSVieA5XsK1lGyt2jqscd1vBSjMSDssooeUMkU10RPcg3+hDExt+ej7By
   vgYd1fH89Ff/V3Ip0Knj+6jyO+N/Tqxme1QZL2KdeJjTQAkvfunk9TbjS
   FFfFRpuHy0xVOxdjGMeLg4ald3C2PJXtgSQHuCfBe08n50AO58MrFDetw
   w==;
X-CSE-ConnectionGUID: u425pLyQTVSWT4U9FWpS8g==
X-CSE-MsgGUID: q9PfwGPBQE6jS7Lj65jtnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41773739"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41773739"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 01:39:11 -0800
X-CSE-ConnectionGUID: E6TyBui6QNOUKoSB8IuzJw==
X-CSE-MsgGUID: GGAKkEksQcmytOJWj0kHuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118869623"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2025 01:39:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp2GS-000II3-0u;
	Mon, 03 Mar 2025 09:39:08 +0000
Date: Mon, 3 Mar 2025 17:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] kismet: WARNING: unmet direct
 dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
Message-ID: <202503031726.N3s4zDiM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   413645820de6d715e23ec6200a3e5a469ec69672
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [2/2] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20250303/202503031726.N3s4zDiM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250303/202503031726.N3s4zDiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031726.N3s4zDiM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
