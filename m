Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD5264625
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901303; cv=none; b=P5orLB3UANvu4yyk3ZMsfOEP0TmNSNCRo2iAOHM+WKQ2sqHi9bz7dPbzXZjM1F0gSYX1ZXO2nmjvgLxM/y/Dg841J5Mjt1CFXjwMLFmCfh4YHpwD+TtzMQbKfysftsRC/9lQd3903a9ms9gfoF7C1xL8t0OFyDLC/9/EWycheKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901303; c=relaxed/simple;
	bh=sLa3m+tImlDT0FZ7/GyjEqHIMrWoSYeFaIZtiG86KCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bpz27TlS66jHgu6oQTmYBzixu/hEI0XyOAYsNPKyX1ujCw3iQ9BrO6xNahCp9uM5Iov6O4PyM2XjEKab4OJmdVMILZXVF/tdeS2ondg4EYhYAU1MPXo6ewmCCBmy69G9nDAc7utLXl5vystUn7YvQWJfAT/87igT3t/VWdsO99I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdyUjGTJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdyUjGTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747901301; x=1779437301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLa3m+tImlDT0FZ7/GyjEqHIMrWoSYeFaIZtiG86KCc=;
  b=AdyUjGTJQfKxoQRTGAx7Wp0SMgY4xN/0V/J34SpFsy+ExlDiPERkLV9O
   uYpoXtlGUg6humCG4dUpuaXbb/M1uLLQBHxxeHwLuZ71+FFQ2SkIq/NKG
   h8eERH3UvbpBA/1Geps3gGAs4UJfksEp3TWM0dshDFITiHkNyZrxan9R8
   kV4I4uX7wcQkbFGtHw3UJsdSi1OGkihTtaYQcormW0WSWLlDfvjRAcv0L
   ZtYFiJRVRa9BBRW+PBxNYydgMvscgmdc4x7V2pvyHTMvnmzaXBld9hBu7
   fJp2B6BcZf8+2uhMXkPVqLk6VLxWEG7sIYh6dZPnOmIgn8M/GLwutwojW
   g==;
X-CSE-ConnectionGUID: ojR55IumSxW2y3xREd7hkQ==
X-CSE-MsgGUID: Z3gYFoyAQBSak5CtU+nNOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49813522"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49813522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 01:08:19 -0700
X-CSE-ConnectionGUID: ZIBGHE0aRkq/+u8uHIfygQ==
X-CSE-MsgGUID: 5X0WJ7qKSMK6u3/v6iLH9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141532499"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 May 2025 01:08:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI0yO-000P4m-0a;
	Thu, 22 May 2025 08:08:16 +0000
Date: Thu, 22 May 2025 16:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11]
 drivers/crypto/ccp/vpsp.c:593:6: warning: no previous prototype for function
 'vpsp_set_default_vid_permission'
Message-ID: <202505221516.ce4mJCUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8c0e5d113e2a8ff250d4973be89da61edcab22d5
commit: c8cee0acc0683f57bf575e08a0509c5836301720 [11/11] anolis: crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505221516.ce4mJCUF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221516.ce4mJCUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221516.ce4mJCUF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/vpsp.c:593:6: warning: no previous prototype for function 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     593 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^
   drivers/crypto/ccp/vpsp.c:593:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     593 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         | ^
         | static 
   1 warning generated.


vim +/vpsp_set_default_vid_permission +593 drivers/crypto/ccp/vpsp.c

   586	
   587	/**
   588	 * When 'allow_default_vid' is set to 1,
   589	 * QEMU is allowed to use 'vid 0' by default
   590	 * in the absence of a valid 'vid' setting.
   591	 */
   592	uint32_t allow_default_vid = 1;
 > 593	void vpsp_set_default_vid_permission(uint32_t is_allow)
   594	{
   595		allow_default_vid = is_allow;
   596	}
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
