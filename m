Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7672E8B64
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 03:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788318662; cv=none; b=SUV2Fd3Ax9RrcI5nkZgz2+AmZw/qjw/+e1gqqh2ji3VN+arKm6i4DWoX+eRsXqXk3QWLo0dIKUWqBrodA9zj3NsXO+VJSRp4Q5Yivi+nXyGCI3kJ3EYYNieMIi0ensRK/y4D7m9dRtZSeUR18870RXpgB5HGQEpNglrlS1CgeLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788318662; c=relaxed/simple;
	bh=it5Udl9m3WAhFI55NIaltvtqUCKIw2cSgeY6zIEDGTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bakhSPJpwOFJqaju4trUl43aJ4zaFWIxYZuKGPXbuOtft8AVssLDeHVrGmDvZetcG6uxPYeqDBKSQ+c8J+EX/JnjzOCBKKI2meqazWULuJfb9RiPxXKiUeKVVNpLi0QCkCJ81uULnAsIPKcZpQnAE0+9gCaOhY9qphNW0wE47JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D47RhZak; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D47RhZak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788318661; x=1819854661;
  h=date:from:to:cc:subject:message-id;
  bh=it5Udl9m3WAhFI55NIaltvtqUCKIw2cSgeY6zIEDGTw=;
  b=D47RhZak9WvgpNKA5h5rKMv1mnBZGXRW66fgpzavSy6k7Xm7PukS2TMI
   FuZscVQ0D+hDY+ghBqe2LdZBMvNijMwhGJRgeP5h71ZwAEMLj2d5jOnJx
   Nx1MvzPLzbP+5wmGGR2+ZKs0oN8cEhG12XAynuLQNet5Ef+F8+fDqzFHy
   ctq0ebmSCLu+0bV1XWwiRNoDqjgJesnPLcOiwJFSF7hBuyI754KtOuzfr
   0c7kV+GKj/8crPdMRPl+cw43Kqd7uGB3lKyklBa2oUrLDkOqHETVToFUy
   wzDljy/sFwMy6/Yy1loH/9dObk+JnwNry8EpMPpbKCo+kqExLsEhS+vK8
   Q==;
X-CSE-ConnectionGUID: 1LJeGldoQ++/8D4V1ckzYg==
X-CSE-MsgGUID: DZxg2N0aTKmCkCxjKCyr7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88783244"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88783244"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 20:11:00 -0700
X-CSE-ConnectionGUID: tjsQ7bKBT6SzQ6N9sDOaag==
X-CSE-MsgGUID: 3EpYwFSQSauK5NzD+PfG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="299156488"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2026 20:10:57 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1bNI-000000001pc-0Vzr;
	Wed, 02 Sep 2026 03:10:56 +0000
Date: Wed, 02 Sep 2026 11:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/bbr3 1/2] .tmp_gl_tcp_bbr3.o:undefined reference to
 `__udivdi3'
Message-ID: <202609021155.UvuWLXoX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/bbr3
head:   f04474ac60538e992f6c6cf854e0fda08632e2da
commit: f7f00444a9ad2284192bfa6aaef7ce9be2d43388 [1/2] tcp/bbr3: add BBRv3 congestion control
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20260902/202609021155.UvuWLXoX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021155.UvuWLXoX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021155.UvuWLXoX-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: net/ipv4/tcp_bbr3.o: in function `bbr_packets_in_net_at_edt':
>> .tmp_gl_tcp_bbr3.o:(.text+0x1d70): undefined reference to `__udivdi3'
   microblaze-linux-ld: net/ipv4/tcp_bbr3.o: in function `bbr_tso_segs':
   .tmp_gl_tcp_bbr3.o:(.text+0x23d0): undefined reference to `__udivdi3'
   microblaze-linux-ld: net/ipv4/tcp_bbr3.o: in function `bbr_quantization_budget':
   .tmp_gl_tcp_bbr3.o:(.text+0x2518): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
