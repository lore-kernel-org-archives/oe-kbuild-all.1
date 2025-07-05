Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE52E370A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 04:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751690243; cv=none; b=DJn+6AwFJ5IWbi4QzjM5We2iPPAygpyOwgeYTdYPFqMmGu4oihKdBfQYkjLdArGCFFanvOCpxS/GaKBP8kp2Nk8aZn5yBcYx/2B2Rz0y9KSlpvWfTC8PTYF4A4Tsn0gda3/WJHLBIT13Bri5BTZTDQDZ3fuGioCKOoEq5Q1iQ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751690243; c=relaxed/simple;
	bh=FVRNvj56e4ZcQTNNiAgMeEImUy3hz6YhEORAAuJwVFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=idwMbH+BMqFsmv232HLbugpCpa/75HgozPyoRaAqAJmA9JedkRoIcB/hZqateDQmz8xmQlrj695x1fUzKcIr6j6c2Q45wTKnpqThQF68IFviTx6ZYibt1gyYrNCvnmJdmJ5VdLgA0ua3DrMSggDdKUAr6+7/2ktftNTsM75tDJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEhtTUmf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEhtTUmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751690240; x=1783226240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FVRNvj56e4ZcQTNNiAgMeEImUy3hz6YhEORAAuJwVFw=;
  b=SEhtTUmfHhfnLmcQuDwdsZwbfbStdtlZefWSQMpWBH+bnh+xfOkSk3wE
   dn0GgvmPZvzwLRPLwEcICSxGOEwoNbq94jNZejRrRSvgppl3lCR1IekIc
   /YGZ0J/O9X57VGzatUjTHBR4vqbN+6ICVtPOyYemyFv3fajYdmmXtO2VX
   Tbn2aOA5CCYC1eAf+FOBZlE01gJ3Xxntm6bflau6zgraEewiH7M0qFcRy
   HV1T2H+eVxFZnOduNqdIhdObC3DmDxGT6oC0N5lTGC+EPxNjyrnIU3H3Q
   dZ64D8rE1ym+ODDvC16SUY59/Vy3sNvYf/xwvhCjdanvE3sAIf4cgKa57
   w==;
X-CSE-ConnectionGUID: vtFtiPViQj+inwRFKJyxhg==
X-CSE-MsgGUID: kYQg71yGRauLC7Cy0S8MBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53223716"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="53223716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 21:37:19 -0700
X-CSE-ConnectionGUID: Vq3k0ycjRhGsXWKEO/F8mA==
X-CSE-MsgGUID: i0IxtCeMQWScHPKHvJrRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="185724308"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jul 2025 21:37:18 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXueK-0004Hn-0P;
	Sat, 05 Jul 2025 04:37:16 +0000
Date: Sat, 5 Jul 2025 12:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1673/1673] drivers/nvme/host/fc.o:
 warning: objtool: nvme_fc_lport_put()+0xa6: unreachable instruction
Message-ID: <202507051224.xruPNJEF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   44dfa3e24fdde8e95b4815dc4d365cb20755a5e4
commit: 7620e9fedb99dd396bc51e06c7571baa0b4adb40 [1673/1673] nvme-fc: do not wait in vain when unloading module
config: x86_64-buildonly-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250705/202507051224.xruPNJEF-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051224.xruPNJEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051224.xruPNJEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/fc.c:335: warning: Function parameter or member 'portptr' not described in 'nvme_fc_register_localport'
   drivers/nvme/host/fc.c:335: warning: Excess function parameter 'lport_p' description in 'nvme_fc_register_localport'
   drivers/nvme/host/fc.c:439: warning: Function parameter or member 'portptr' not described in 'nvme_fc_unregister_localport'
   drivers/nvme/host/fc.c:439: warning: Excess function parameter 'localport' description in 'nvme_fc_unregister_localport'
   drivers/nvme/host/fc.c:649: warning: Function parameter or member 'portptr' not described in 'nvme_fc_register_remoteport'
   drivers/nvme/host/fc.c:649: warning: Excess function parameter 'rport_p' description in 'nvme_fc_register_remoteport'
   drivers/nvme/host/fc.c:821: warning: Function parameter or member 'portptr' not described in 'nvme_fc_unregister_remoteport'
   drivers/nvme/host/fc.c:821: warning: Excess function parameter 'remoteport' description in 'nvme_fc_unregister_remoteport'
>> drivers/nvme/host/fc.o: warning: objtool: nvme_fc_lport_put()+0xa6: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
