Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C770713A265
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317953; cv=none; b=altw9Jn18CMrkfe2Nf8Gh6I4BxegWmIiWl/05xkvG8nIqme7EtibWAfQ8LMOsXwp42V/km7pt9D8d9GqqTjJuDNYwhkp/s1nxE7q1prO7J7Yn9bqAKeh9/4GSZB26M/+627P5mBjE4bqhzXbhGjq0pRpGsSgFIidniNAZkbND38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317953; c=relaxed/simple;
	bh=WzlCipgLlWb2UWAM2F+P+k7PLS5PLclXG6JokZ+o1UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8XurGnF3Vk8xHvkeGv1MQVuKJnXkgxQJudPbgU2JmgLO4Tbd8Dtaiyl5gu6lo7Xho1T1uT/LnjNFPVmGWRTSdoA7QopQRKXfGg6aAGydZPGkKxcCaCFFSxhAdyo7277HeZ4lEIxhJvZO/AymnyMW4nsHC8XivgLSH5trE2uX8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5GUtseI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5GUtseI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317952; x=1778853952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzlCipgLlWb2UWAM2F+P+k7PLS5PLclXG6JokZ+o1UM=;
  b=U5GUtseIauOoIGZ5k4Dc8zmw/iKH3xLikf/nFNgPELfVo/0SSaq3j3eN
   PgVWpHCHYmnpWIlx/2QqH8t9ZmmTfg6xz6geA+wicuptWK77QXqHKCEGv
   SjeAqJf1toSn9BzQQOBkYHYMshJ8+vy1fCxgUD1WyeCVkISa15BrchpsI
   /kaO6e2PL2W9FeE28FaWRzpBgI1r5UWqAcoANQf7mzeZGkgVE6dum4g0j
   lMlbWqZAuzOOMmbw518WCwsxLeFiC2mUY9ZbbmWnVB76ISWT8QOgRtFKQ
   5oXBKIvu8JyRVEUkiXx66fk4vgE5ebAEYKEDaB9FGcbHCEB/zTOsZpREn
   g==;
X-CSE-ConnectionGUID: WgBnWT33Sk+67UNnbZyI2A==
X-CSE-MsgGUID: aKoPXsj2SdKF4dPMDc9Ufg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943814"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:05:52 -0700
X-CSE-ConnectionGUID: Pb++bxPPSS2wJ31h0Hm7Pw==
X-CSE-MsgGUID: jays9yxaQCaan4g1JOSU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138261403"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2025 07:05:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZDY-0000Fb-2G;
	Thu, 15 May 2025 14:05:48 +0000
Date: Thu, 15 May 2025 22:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] drivers/crypto/ccp/hygon/hct.c:39:
 warning: Function parameter or member 'fmt' not described in 'pr_fmt'
Message-ID: <202505151510.gxHsKg6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [2229/2229] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505151510.gxHsKg6l-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151510.gxHsKg6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151510.gxHsKg6l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/hct.c:39: warning: Function parameter or member 'fmt' not described in 'pr_fmt'
>> drivers/crypto/ccp/hygon/hct.c:39: warning: expecting prototype for VERSION_STRING modification instructions(). Prototype was for pr_fmt() instead


vim +39 drivers/crypto/ccp/hygon/hct.c

    31	
    32	/**
    33	 * VERSION_STRING modification instructions:
    34	 * 0.1 -- support hct/mdev mode.
    35	 * 0.2 -- supoort qemu virtualization.
    36	 */
    37	
    38	#undef  pr_fmt
  > 39	#define pr_fmt(fmt)				"hct: " fmt
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
