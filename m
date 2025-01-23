Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007E1D47AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737673071; cv=none; b=tc0JaCR9mBQ72Htxo7E6UU7v/q2akfva7VpbCKjMi8SDlaqB+ZBruRj6ULHZCI8MCRyhehFJYZ19BNQxwZBAlxknJwC1agbt95mkGNmCcqOmtRA5ROXto0yD3OSCknuHPyKu7m4g//iq70qKbyWeE87RuZt4L7iI+Yp1iW5wxJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737673071; c=relaxed/simple;
	bh=XZMa88vB7PybXU4I+7Q6PnHaRh73q6zQrUn4xbS/ka4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXfZ/cMouA4gFp9w9WyYPNnMw4DwmsN5M49ZalkSWtQp7pNvfvKU00AvDF5bYU5UHPoaHwm6qIw5rlV2uo289DCF+C/E/S+Yljz1U+yk8yxiofCIH52tNooOKnJ+sGKr2Ouq2kROzd7a5qulpNE05qmTYurWFZcg2dYFxTgnR9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKpbIdsG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKpbIdsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737673070; x=1769209070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XZMa88vB7PybXU4I+7Q6PnHaRh73q6zQrUn4xbS/ka4=;
  b=oKpbIdsGtKM5MprvFDjdDPS4XTneMZeOJ8KjtggtArBK5EUaUm5jgmKl
   v6yw56RtTDBjC4d2ZuPH725KCtO+qeMFMH58cecB55NnLs0pR9VLxFDgM
   fyVKAKYOdsV3Xl6og5rwyS2Fx+PlZeOYKWiM8G+PzdQhK0aP+t8Ts5W9e
   COLgywDaArYc/XFJ7f1hVQ9FGICQWGSQ1uV8W5Ks/PTk2f6AOsklzf5kC
   LF7wmdDK5lFa0AXiwyeIjZgAXzh95gm/+DJIMOsyWkG5OREdm7VCsxIiM
   ocb/QTapOiK7o/qJWxN0WD5svpu7qKEFXZX1hLSxL32rrG+RpeJ5E4KeX
   Q==;
X-CSE-ConnectionGUID: CoIN9+rVTQeBKuHYrxa1kQ==
X-CSE-MsgGUID: gYYhlyjWQPKvm6GCMBWh6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49620510"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49620510"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 14:57:49 -0800
X-CSE-ConnectionGUID: yJike5+sSwW6wXXsb7JffA==
X-CSE-MsgGUID: bMSBgZLcRuihjg4kG+e1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="108141219"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 14:57:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb68r-000boX-1V;
	Thu, 23 Jan 2025 22:57:41 +0000
Date: Fri, 24 Jan 2025 06:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1841/1841] kismet: WARNING: unmet direct
 dependencies detected for PGP_KEY_PARSER when selected by PGP_PRELOAD
Message-ID: <202501240626.LDiPAa0q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   30472c94514880cf07700ef041e5c611a6d6888e
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [1841/1841] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-kismet-CONFIG_PGP_KEY_PARSER-CONFIG_PGP_PRELOAD-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240626.LDiPAa0q-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240626.LDiPAa0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240626.LDiPAa0q-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PGP_KEY_PARSER when selected by PGP_PRELOAD
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
