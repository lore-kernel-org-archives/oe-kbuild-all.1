Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637297;
	b=Kb4J1XcXS809288+I4+PwohewJIbPLb1Y73wDZV12jthIlPD1dljzWR3Xl5WV3yG9b0k
	 pFl8K80FeN5nQKz3+2nA0ejDSd36BJLG/m4vMbQxwYyJ487kr5xnRk72YQtBCK8eOZKlK
	 7ChPV9/4hjGDBElEZoY7Z+NgxrMrLaOKJVqiFuzKFWQyzErmbMXU0pPebPPFnwtZ8bYl5
	 7Gzv7UzQmkBbP0JaYv7m6CxhkJR+n7UXDDr4PlkjW1gga3tUd29jbei4PLdJmy6ruKleJ
	 fv4XuuykgjGAqeYjnE+93a8KWtlrp76QE9jOCKhu61B4x/CNIFfWLmb9/WD2dqSwDzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637297;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yclnK7W7WsLcuUpbRv0WiOB3Y94it+U5d6PyonnZY7s=;
	b=tA2ZmHEvU2rDvTW4i82R/bQoWKcOPLp/bBirKiY/NeGnbwXU0tn7sunuGATDTLzPVfVb
	 BO6aaT3EW2An4gCMEHnCrVRMISECTf6O88kpLk+9PSQ9QbCL7APANwH3Xwot0pBXi0mmS
	 VhPUBf1SXM/vfaU3xWtlLJ6sPxJ99eDcFLZsLEgWSn2Qi0qml93yBUFaPKobfr9iDTqOn
	 hpNu1zvqQmYYM1nxBdq9LZQ3VEVNtDVM3XhhlEUwxOqxkE02UHsPCzSWCYkUa1r/QJmPn
	 07DvP87NWaG4yFED+PVk43mQNAA9ri7qU+NRArPaoC8Y1dE/ND+BbqOEQeyq7DdXaDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRH0Bm4h;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8957F606A32D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 06:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8957F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRH0Bm4h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794637296; x=1826173296;
  h=date:from:to:cc:subject:message-id;
  bh=xwCI00d9oW5hCsTj74wA4hsJA8xI5cxsC25gj/6ihXo=;
  b=XRH0Bm4hhlevPOOkY34wiObHsAPWUHRwGsQN7jFXJbaARSxQz3IO6xOr
   VqVyUS5NVXfJxZsa8eVQYmpqj4rqwe5vNZmHBiUPbquRlI3I3Q8Lc5A4P
   q92+CJbmfhNSpVNVMrS1zaQHudpKGQYaGnBXNVuT0EZGgsw4QFCSb2n19
   JzJ5cMry0ZKwAolRpcK/7CuLBxlbYGcxgdLSamV8F8ksBCVDXQDfhxzQE
   pso3L6iu+JaA8DNAclvZGUfR5j7UVh1623HhhHSvxKUp5LMPMjszFF3jK
   D/WEPHrRhVNhdnpnjJ0GtbzrhpcI2lf3Sk5z1hU6BOJlG63vK8xpb4Xjc
   Q==;
X-CSE-ConnectionGUID: QAtb9/YnQX6tSSBpw1i5qQ==
X-CSE-MsgGUID: IVNr8bCTRk6SJ7hbsVazWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3440191"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3440191"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 22:21:36 -0800
X-CSE-ConnectionGUID: Jsg0blbER6KIvZwiMVYSdw==
X-CSE-MsgGUID: 997ehH7oTzSQ5nXO+eeICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9531278"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2026 22:21:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS78m-000000001Vx-1IE1;
	Sat, 14 Nov 2026 06:21:32 +0000
Date: Sat, 14 Nov 2026 07:20:42 +0100
From: kernel test robot <lkp@intel.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Subject: main.c:(.init.text+0x74): relocation truncated to fit:
 R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined in .text section in
 ../lib/gcc/arc-linux/11.5.0/hs38/libgcc.a(_millicodethunk_st.o)
Message-ID: <202611140726.L91HtnSf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   97d73c8251226cf27cc6656b4c542869bb8c69fa
commit: 1d0a26cf37c1b2e9928d2b61af6f282232b5daea drm/amdgpu: add CONFIG_GCOV_PROFILE_AMDGPU Kconfig option
date:   8 months ago
config: arc-randconfig-2002-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140726.L91HtnSf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140726.L91HtnSf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1d0a26cf37c1 ("drm/amdgpu: add CONFIG_GCOV_PROFILE_AMDGPU Kconfig option")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140726.L91HtnSf-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `do_early_param':
>> main.c:(.init.text+0x74): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined in .text section in ../lib/gcc/arc-linux/11.5.0/hs38/libgcc.a(_millicodethunk_st.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
