Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557DF5625E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 19:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190777; cv=none; b=COFFJG5Ztdyrz36uqr7ih7ZrNvB8sCRCD2VO6GhgqiOs5hXN73+rX6INpul2KBvL0ktE3pgxjjATX7AJu8HEG8at9JE2mDGSTN9GI7wi4BCnaPWcw+laNqJT1qMgspaJDkumbvj2DkwFLi/lplgw4BuIM2RsqSWqtiBRwkkAXlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190777; c=relaxed/simple;
	bh=7vIIqq53j1ObIZJDELWkJE7gVNkAKUQltFwYKMl31ow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mi9NlOrz6WhCQIlU2o12v9NJuEu+uK+CbHEPJnUgpXMTF/yIzpeGxv4jLhyUCRwRHooDg9Sj/K0KzNzFrfTBhItiYy6cqH3AbMTFCG1IwqvJXNb2zS4jsSxxhRFfyaj6zSoXgHRUTmdwWsw0s7I/k4A+gL8ohaSe5VuOfkHXpAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPUtrA8P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPUtrA8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790190776; x=1821726776;
  h=date:from:to:cc:subject:message-id;
  bh=7vIIqq53j1ObIZJDELWkJE7gVNkAKUQltFwYKMl31ow=;
  b=aPUtrA8Pyp8ptrQBx3n30xcnmSlCDmBhX0zR+4XBhdbx+NTjxyCUbChs
   Qgli4wrUSwqCNXZnc3IYig+L9qQl8zArkUzHE+Q3HpEni/JhdLAjS9aKa
   sPZSMu4xyyfxmu8nrXd/T9wDAFn1hOclfBjgvQ+D+0Q0Jpi9rj8Xt3eX0
   P1CBWKSmJhcWRdAfq2mIPkfxF1dD21EwEydJef/XqcqfCoFHCXNqFolQr
   QCXtWQPzjwxOSILm/nGFR/PXUN5EBOK+fEWJ+C1jYA5CvFCk1qro3OiPV
   7iL+Aqt7NjubXoTB+T+n85m3q9YRwe4gkvZZenylD56xhjDyEMx8eAPC4
   A==;
X-CSE-ConnectionGUID: M19hCeCMQdGtg+p4FYhXwg==
X-CSE-MsgGUID: 1FGR+UMYS/iYtqgsUAJHVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101585328"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="101585328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 12:12:52 -0700
X-CSE-ConnectionGUID: /KDgt6ieTHC6nsoef3E/0g==
X-CSE-MsgGUID: 19m+MdjcSMK62Lh85yr3BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="281824014"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 12:12:51 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9SOf-000000000mb-1pby;
	Wed, 23 Sep 2026 19:12:49 +0000
Date: Wed, 23 Sep 2026 21:11:54 +0200
From: kernel test robot <lkp@intel.com>
To: Bokun Zhang <Bokun.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 759/8910] Warning:
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:713 function parameter 'adev' not
 described in 'vcn_v5_0_2_start_sriov'
Message-ID: <202609232140.lbwlE246-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 98ba50b2ef1397635ff03091b396b93d0850d50a [759/8910] drm/amdgpu: Add VCN v5.0.2 SRIOV code path
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260923/202609232140.lbwlE246-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609232140.lbwlE246-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232140.lbwlE246-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:713 function parameter 'adev' not described in 'vcn_v5_0_2_start_sriov'
>> Warning: drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:713 function parameter 'adev' not described in 'vcn_v5_0_2_start_sriov'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
