Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929E01547EE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 04:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766289898; cv=none; b=e1S9QWc6KdSa8cUSG7qsI1Y0mKPbtnchoOrL7nthLaCKDiMTpmGLgsUfntg8xY9xTbAJKT+3EfEFruc9xeSucUCFLoBGv6bhEX4k3LY6IKqW4SEUZdsrbCgrMObDihm+/tCbPTO9e6230aGzu3JbHIU2b6V7NE2U578Iw75ZqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766289898; c=relaxed/simple;
	bh=O0FO2VoL9Ckjn4VTb6ggsmL/sT6OeWSHtDzCX5RDIMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQ6pUi3yUE5pua/y8Hz59vfqO+fuZ7lx67ji5ionjc+OQJHgoeAH23YqV0zFFoK3Q8aA+tJP9v1Gk86q2KGJI43RwHy/Yot294TRLy3ySzpcSUZudIiX3K3j78mk0RVisNxLtCLffuN2ub6FHO8gIBrRmrxoVPwxII6XKsSWdi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5XXzQ1x; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5XXzQ1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766289897; x=1797825897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0FO2VoL9Ckjn4VTb6ggsmL/sT6OeWSHtDzCX5RDIMA=;
  b=g5XXzQ1xLTGivdKuEzRvmRfxHucl2PJam86f2YtrvvkOgMQscY8jF7MH
   kYLcQT4DRAFPIIcUkLsOmbmrBtqQPPqCqlM2RlTTDKBIy1RftlFg+dm/y
   pIn3KFd2vrBxutErNoz8pu8423WWTgMtETHNEPVF4Wo8fwCqIegQ7IFFX
   AgJzgHMx80Jk6Eh34NTjOWbdc77WcytCOHxMTt8vU+nMhFvV+mcjcdmhe
   yKdt0bSAde2ETZ1Qm4SyP1vJrPixIJZyimI+eqos2lJhpIep1PRI03ZoU
   SCG+J+6PrvRXu5Q3695ugDSnAs4i9EkFK+2V7y7K93TbQpk/0umCxWg/Z
   Q==;
X-CSE-ConnectionGUID: z5lJ4uspS/yzvZETsTvQcw==
X-CSE-MsgGUID: qkLWrIT3TbW4dWU5cC9PlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93668750"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93668750"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 20:04:56 -0800
X-CSE-ConnectionGUID: T4ZgvaOMT0CC0w2hGfGCig==
X-CSE-MsgGUID: in79PJMjR1qxsErQlN61ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203696722"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 20:04:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXAge-000000004vg-0Su9;
	Sun, 21 Dec 2025 04:04:52 +0000
Date: Sun, 21 Dec 2025 05:03:57 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_SHA256 when selected by
 INCREMENTAL_FS
Message-ID: <202512210519.eDd1kpyD-lkp@intel.com>
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
commit: a95005100dd1e4f70c4fce3abead12cb5f1d7b0d [12/12] ANDROID: Incremental fs: Remove unnecessary dependencies
config: x86_64-kismet-CONFIG_CRYPTO_SHA256-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210519.eDd1kpyD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210519.eDd1kpyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210519.eDd1kpyD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_SHA256 when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
