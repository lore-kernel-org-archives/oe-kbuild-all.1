Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8D9371862
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 22:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773268090; cv=none; b=BYW/jeoNgrhndOxW8wNP/uWSnMWkDSFgQO+OI6QlKoKvxZyXxvb3vPTVxXMVxe66JWYSsIgC633L24xNLIDNdREQFCklbkqDJZbtiWUvqWgbT0/NeiGNocOIIFB0cO1+p+NWqy5Kc0xO+Dq/azWNwEjZCxzPwn84Kh+VS3ARjos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773268090; c=relaxed/simple;
	bh=KipXX5aVvpQORZt+6hvHl/gWHUeUCP0JmN139WBlLsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FXZHaJYdg30hdR3bxBT1QMqp8/4x3GodN1SC1zcBHgC1creqokQjd1dFoTYIfw+IFFArO/LNxakHA0AFXMcEFXOWqc8w41rTwgyU9N0CAjjXIvp5A4JwFysrGqWsZfh1JBataIFvvngMyVDL2lpKv9M1IDeXVM4DsxzCO+FRW6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNywRUWO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNywRUWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773268089; x=1804804089;
  h=date:from:to:cc:subject:message-id;
  bh=KipXX5aVvpQORZt+6hvHl/gWHUeUCP0JmN139WBlLsc=;
  b=KNywRUWOLAyLCFlsT4tfwiuTAXkgrOsuFayFRVnHqb2pY6ZT6uYaxFe6
   j0VhG9/E08Q0yzsdKDB7V18Aa/hHMkhM5isy4vNZi7x5Oh533iaN7pHbt
   /qBbOWfGAyv+pvDYa4/2HONCPLjVEYcn0s6tUHVU0PCs8RBQGGQs0ag1e
   k/fBpMNMawuVZ6KZ/9l8GdX+b8MtnCk+W7T+T2pH6Hdw5uzxKC2h5FO3k
   Jx5Q+ujiNLAf7IEOVoEZPoTtrX4iAFGM+eZoZ0Dr0x8YeXGyedp7dGwfu
   wvxqImqIBpr0wYhS3hgtZXuTty6zrbEjtufdE+w7Eb9KniZk8L8vyEs8e
   w==;
X-CSE-ConnectionGUID: 4vDS0FD5RCeSY+n48VjKTw==
X-CSE-MsgGUID: keDqtMGqSrqb/l9Fc+izaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74468007"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="74468007"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 15:28:08 -0700
X-CSE-ConnectionGUID: HmBnEOM+ReCIdODTY8EZRg==
X-CSE-MsgGUID: mn5od+2LQNyksxdygRcCwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="218079267"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Mar 2026 15:28:07 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0S28-000000001mB-36tg;
	Wed, 11 Mar 2026 22:28:04 +0000
Date: Thu, 12 Mar 2026 06:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 5480/5731]
 arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: simple_ring_buffer.c: No
 such file or directory
Message-ID: <202603120628.bJhW6n48-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
commit: 680a04c333fa29bf92007efe11431be005e8c4bb [5480/5731] KVM: arm64: Add tracing capability for the nVHE/pKVM hyp
config: arm64-randconfig-001-20260312 (https://download.01.org/0day-ci/archive/20260312/202603120628.bJhW6n48-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120628.bJhW6n48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120628.bJhW6n48-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: ./kernel/trace/: No such file or directory [-Wmissing-include-dirs]
>> arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: simple_ring_buffer.c: No such file or directory
    #include "simple_ring_buffer.c"
             ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +16 arch/arm64/kvm/hyp/nvhe/trace.c

    15	
  > 16	#include "simple_ring_buffer.c"
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
