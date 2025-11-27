Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7661E523A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764233645; cv=none; b=YmcKbzcc6T4cvebuhYDWRzg3aRpZXNMlE6nvR+hRdh5XkTO4SxkBLB7oZJkBsIBMfaH2WWzQ4iQJl6D6f1vEijfBnJHZiMgOn5zHiwqEYpXCxETETSb//hGoJBhfbRsLQxPBQapng9WIpUbLDDv9lbS5zHTtuLZLPcPElZuTVG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764233645; c=relaxed/simple;
	bh=XppiU50wWZlwbtFy2/SUCzdoXUv7r0j4I0UG0fFSnZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/cwCo63DH688NPrqM23I8VmlgUJzhazWNreyv1ezIgRVMwOg0Lp39YpCBqy81f8plIUub5EiEZFAN6RXbGxERAdNeSLPiRoDFm8WwPM5TACD6HuSPnSG52pSws1fjdI9ng4HOQqJzFhM7ESH2y03tSlmWhlvbzfBwRd7NGxewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCTO72js; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCTO72js"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764233643; x=1795769643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XppiU50wWZlwbtFy2/SUCzdoXUv7r0j4I0UG0fFSnZY=;
  b=iCTO72js/STIjvMi9DEtUHh7oPg6+ErTcTWSGPqfSSzv0M9mJjHIuMky
   eFxnwEZrLjlqbOmgX2Mn+LOMdZ5H3DgCx1ooj9Cg2ke52j/cEavuFrO1z
   gWWipiEyfpYRAZfLv+zkitvd3W1GdQW4RpplqaL41vDsE8ratrSfrShJs
   pBRmEBU8Yu354PMn+dJj/Yr1kcBMV79AAJnzcjji/0yNWERkSlYZ3J3tw
   UGoR2yEHnPshjP34rmM8bYMQUIoA8TmOB/PJQ4Lq3FsoGnuE2e51XEsD1
   fMxy3f7fMo2ezYSYDwpHKSYIAE6b08rvwseZnwzyQIwUfWyRfjcfaqfmX
   A==;
X-CSE-ConnectionGUID: CW3F1L0SST2C5FoWsafU/g==
X-CSE-MsgGUID: X5vkIbpYQ6m7xImptXuRiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70144812"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="70144812"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:54:03 -0800
X-CSE-ConnectionGUID: 5zc6GlHHQbqo622Ngu8r5Q==
X-CSE-MsgGUID: rhF0WphwRsquHwKMOwRA5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="198287453"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2025 00:54:02 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOXlH-0000000042A-2bpt;
	Thu, 27 Nov 2025 08:53:59 +0000
Date: Thu, 27 Nov 2025 16:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1938/1938]
 drivers/net/ethernet/netswift/ngbe/ngbe_sysfs.o: warning: objtool: missing
 symbol for section .text
Message-ID: <202511271639.dU4NNkP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d495515f012a96ae472e8ee75c66680fbdabaddb
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [1938/1938] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-buildonly-randconfig-005-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271639.dU4NNkP5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271639.dU4NNkP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271639.dU4NNkP5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_sysfs.c:19:
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^
   1 warning generated.
>> drivers/net/ethernet/netswift/ngbe/ngbe_sysfs.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
