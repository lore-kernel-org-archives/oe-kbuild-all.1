Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56B3515C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 01:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213869; cv=none; b=m7bWtNG5dYDxb3GWlMZb2TzSoj9UB8CQGPOeku1+4S0fL2oJifV8Sy699Zm+kKGIbz/HWIeA1h5mNF40OAaj3SQocQLmq5KP4d8UHJGTm2Aq0Rr8y8WZmB8pjwLznaCjMr86x9R2ycCKxLlfD0BxFPS2grSTZJJqwvJSsZZ0BCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213869; c=relaxed/simple;
	bh=q2OhIJwl/mos26CA4yV6eNOztB498G5zEyE01ElKXBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jd6pXg6pZNtJrcLMN/yA5HPCYjDLSUmrT8vVrtERgNb+iB1j+67QDeYZBWoCJ/teGSdja8myJEwuIpYO0UHZNRKIm5cxHNpCt1LAKJU+4MbcIuWEcE1W3xWHRv/zsdZWD0zv31ecJ2Q1hil61xgkXIJm5TLgwArEN4ipdFixP3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqwOkVFZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqwOkVFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790213866; x=1821749866;
  h=date:from:to:cc:subject:message-id;
  bh=q2OhIJwl/mos26CA4yV6eNOztB498G5zEyE01ElKXBA=;
  b=TqwOkVFZiewSf7VF6DsGf71NdOPFXinx499geSS/k7gvhhdKjOh/7WV+
   4yhmjtm7jSYCHUEHCZrhxKN1s4Yy18tThKkQDJqkefZovN5yDSLbjz1rw
   ovKcgqZJDaY8n5cTOXqgAEBVvykQup/tGoVaNDAknqQWMmwEIvJuU/OWo
   5V5ho25enoYHfDKWAw0QdWOHeyYl7+bDcWaI5ngo2d3f5fRLUHMpq9XtN
   PkXKoL7ved/qrwuFCr0BUGcywy+EZVGwEfVwe/xOL2PfxRhY6wzcEaTEN
   aEMJtsoTqPayslM56JBpYQn0je0P2w6FdxaoXauTOx9w9/i4JnZ0qohuf
   g==;
X-CSE-ConnectionGUID: oHAL1qPxTyKDySVgQGlKcw==
X-CSE-MsgGUID: JwHvP/njRZ+bwnsHxIqtCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="102330110"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="102330110"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:37:44 -0700
X-CSE-ConnectionGUID: 6AlAZcXFTpOBE+58FoilDA==
X-CSE-MsgGUID: jDbaedr2R1C7DYOfdnPJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="301807856"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 18:37:43 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9YP5-000000000AQ-3HTt;
	Thu, 24 Sep 2026 01:37:39 +0000
Date: Thu, 24 Sep 2026 03:37:16 +0200
From: kernel test robot <lkp@intel.com>
To: Bokun Zhang <Bokun.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 760/9480] Warning:
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not
 described in 'jpeg_v5_0_2_start_sriov'
Message-ID: <202609240350.559RjW2C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 4052b52a301caaa1ae651f40a4178dbd399e166a [760/9480] drm/amdgpu: Add JPEG v5.0.2 SRIOV code path
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260924/202609240350.559RjW2C-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240350.559RjW2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240350.559RjW2C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not described in 'jpeg_v5_0_2_start_sriov'
>> Warning: drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not described in 'jpeg_v5_0_2_start_sriov'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
