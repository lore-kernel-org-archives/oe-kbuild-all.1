Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C75B3B9942
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752125; cv=none; b=ImPTPWytsCuPm+gdk5HDHQUJ8FHgTcK4eIJNq18gCJOu4+/JaAp1TnK2tOJ9Xy2c0lyJ69X64Sb18sN6AlmqEM8ZAnPfW1tCC39vso4pHyUPfRXIvitxTHYI1ij9QRoaddGWLRyEb622BM2Ddugq4PJ6ZBQP+2XSWABZFXRmIQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752125; c=relaxed/simple;
	bh=kxKW4VK9bHsnWSvYJKSBq5+02YsNKwq2kQJCSypLJww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M7wFm7VCFXYV08rvZKoa2f9IM4FykpnRGF2LoMS8w2CJKibgIOJv5Dy3DH0qbOB8CUmirqJB0jQS4F/fcwDJskKzlN5QLgW1tKbUiEszaacwWOpva1s/OlTD9URBoJ1wtSDnaRfM/mtiVA7ynddLEZALdDtfMcxvkm1Dun6M9KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ys+qSOYs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ys+qSOYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790752123; x=1822288123;
  h=date:from:to:cc:subject:message-id;
  bh=kxKW4VK9bHsnWSvYJKSBq5+02YsNKwq2kQJCSypLJww=;
  b=Ys+qSOYskI55ucc2Gkj4nqn4VMpK/wEB0TJ27nFdcF/kpoHOPcIzT5l/
   2kJl53VEjbU92d+3pW8ZSP+Wf/rGQcblgMVtlXag6YlxQeYVg1wKe7ktn
   2OYOH+gahi5YtDwHTvpy1q/CiEhAv7kglqXAOeEN0ZPEYSgy9eOO0z+Ue
   Zlp0qQ/TP9Nad41oXKs1Pu+/WNhcDWwJ4hhe7WHiOKqle7Rel2I5hX8w+
   T5DgiHkBvA1lZp+Z3yvBj5D8k4UoaJ/RjolBuqHK5OMU8hleaq4omnn/W
   NGefyPRSOikG94XqJ/kjbFLnkl2lusOHfwZDRZjmBcovc4DFEXmlyEnGp
   g==;
X-CSE-ConnectionGUID: F/nULsWwTv2d1jWWLtNl2g==
X-CSE-MsgGUID: ikmOyZbpTjaxz7L+nGmz2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="94196398"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="94196398"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:08:42 -0700
X-CSE-ConnectionGUID: e3DGZKJwQ3+rbTSy9DfOsA==
X-CSE-MsgGUID: +2hMh9bIS0qfeTaCc/bjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275642683"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2026 00:08:40 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBoQf-000000001lv-3M6S;
	Wed, 30 Sep 2026 07:08:37 +0000
Date: Wed, 30 Sep 2026 09:08:26 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 21/26] kismet:
 WARNING: unmet direct dependencies detected for CRYPTO_SHA512 when selected
 by ATTESTATION_SIM
Message-ID: <202609300921.7AVJwzCo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 70182d901dfdf94f8f611319f5bf3f7f6f18e1da [21/26] attestation: add the simulation provider
config: openrisc-kismet-CONFIG_CRYPTO_SHA512-CONFIG_ATTESTATION_SIM-0-0 (https://download.01.org/0day-ci/archive/20260930/202609300921.7AVJwzCo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260930/202609300921.7AVJwzCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300921.7AVJwzCo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_SHA512 when selected by ATTESTATION_SIM
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - ATTESTATION_SIM [=y] && ATTESTATION [=y] && DEBUG_FS [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA512
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - ATTESTATION_SIM [=y] && ATTESTATION [=y] && DEBUG_FS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
