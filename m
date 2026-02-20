Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453BB54654
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 02:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771553879; cv=none; b=qeLtwWr3NEmueZsiKYKvyqxWfLwQXkLwlHIOqxjtTCsn6uca6FaLzVq9MPFE99M5hd9B7dw7lSSiFZsFon8ldHlWf/8h1c6WUvK1s1oauRv7dQ/ebO6WVlgeahmjhruDf9PqMRpmKDOKzzunAeUW9QDnVGBT+MhGL1p6v3m7fmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771553879; c=relaxed/simple;
	bh=FBJbwnSDVVbOJdRT9++6XyL4LGEpHNIs5V+v3keDhpw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sTTuhhRmZMQorlBsFPnRTp0m+HVVoOzc7xPpMNS4ASG/34NSzRYc88D05KT+0F0sx5Fc2Z02cbPJlG1jwCP5ixCd8XpO5pOY+mDkuTNR/YHYk2KdZY40+83VWx4TAx36wh2jx7OZeoUGzt6OzU5CAamWMONdCStOFxAf/1Y1cK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjxP+fXb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjxP+fXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771553879; x=1803089879;
  h=date:from:to:cc:subject:message-id;
  bh=FBJbwnSDVVbOJdRT9++6XyL4LGEpHNIs5V+v3keDhpw=;
  b=mjxP+fXb9tsff0cnz7NEq9TrBR93nXOBtBHceMvAkTj/I5tAdZM6p9xQ
   Qza0uz6TPrLlFIt+72fIzXewQdlpKKiAhhbLGfty8lyXJ1AHTqihQzsNy
   Qn/MVCsBDbbDmS4bFAKzad6jkJx6NhRoghU3W2Ym/FCMg0kZ0eo+vXD3B
   t0h/yEWaVVyU7oxcsTYRoADXye9051EJDUYSKDBB98FitYZqovJfOaG7B
   ZMnBtSKYLjx2T0958Y8mPU3018aCuuPQuBpA0BUmstIlVxmJ4tskkIGRd
   oK0Xfb3MlSFwf9dcOcc9xVqgvZdPjiPxtFTP6hZf9mO5NliCdzUx+TTLk
   w==;
X-CSE-ConnectionGUID: My02xRJjRUaVKpnUxNMk6w==
X-CSE-MsgGUID: YuxAkudIT7GjE/ZbGAHi1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84106992"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="84106992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 18:17:58 -0800
X-CSE-ConnectionGUID: JSW5J4LcTJSs2cg9dgsNyQ==
X-CSE-MsgGUID: Wx9Cbgh1QpyUzYDMtwdv1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="243255011"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2026 18:17:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtG5Z-000000013kC-3dM2;
	Fri, 20 Feb 2026 02:17:53 +0000
Date: Fri, 20 Feb 2026 10:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 9/18] <stdin>:1633:2: warning: syscall
 rootns_kill not implemented
Message-ID: <202602201058.6QILLC1k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   bbfe3fc31c861befc0d2aa15a02e672b2e248cd6
commit: 57ebf30b62f5b37783c8a398d65b499db3ace7ca [9/18] rootns: Implement rootns_kill()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602201058.6QILLC1k-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201058.6QILLC1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201058.6QILLC1k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: syscall rootns_create not implemented [-W#warnings]
    1627 | #warning syscall rootns_create not implemented
         |  ^
   <stdin>:1630:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1630 | #warning syscall rootns_wait not implemented
         |  ^
>> <stdin>:1633:2: warning: syscall rootns_kill not implemented [-W#warnings]
    1633 | #warning syscall rootns_kill not implemented
         |  ^
   3 warnings generated.
--
   <stdin>:1627:2: warning: syscall rootns_create not implemented [-W#warnings]
    1627 | #warning syscall rootns_create not implemented
         |  ^
   <stdin>:1630:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1630 | #warning syscall rootns_wait not implemented
         |  ^
>> <stdin>:1633:2: warning: syscall rootns_kill not implemented [-W#warnings]
    1633 | #warning syscall rootns_kill not implemented
         |  ^
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
