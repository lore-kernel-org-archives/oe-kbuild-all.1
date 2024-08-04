Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA76041A8E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Aug 2024 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722784921; cv=none; b=cnyfDZFmAWEolPxvfH7AMj8pPZ9Zz86Oxnz3RarNrNEbdQbL33hsVa7N/ngNl0kQvuKgmpbNYh4uZaYMmRUGqInNS4EtYsNlfJZB7aSxvcyXV+ITAUkHJyxN2yhKqcE3+HQWH4pxsaH4iINRs0FOcS/sQtOJUPE6VRntNge/Jz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722784921; c=relaxed/simple;
	bh=hmjSodUoG9t+YbED2rdgVcmjo6BNDnuICbZA1lXquDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7mRjpkUicse8/67GuGexcfuQaFy4Pr7FiiaBw8aN+bTgdv53XFLLX6dXQpKC0CpN+4vceAjW4rRtMswLG77u1S8itEU/Uf8buUxhx90pBn3manV363mJq7N5c0j8tPvin6FnasjvsTyp0QzCH39uURIgIFA9P1+DFrI/bNi/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7HowtuJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7HowtuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722784921; x=1754320921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmjSodUoG9t+YbED2rdgVcmjo6BNDnuICbZA1lXquDg=;
  b=A7HowtuJ9k8vxizVrRkNaO5XioAceaYkHD4SG5mQzNczNctbCYPgeKVG
   mDGDTX/0ZJhnqay6tC5QJLkxvXjIHRkMKfESBuCMQEP8DbNx7WSMU4i89
   eLwuISatc7Dsbo8nbkQjnQ1dc+wsxwihQAHxsFkOvRYVLobKA/hPn6Rer
   IAiLU6YznxpoHAp++p4/ZOOyhBWOEDf6Q+dTIi9ylwoo7zbKThX7e7uyD
   9fWWVPZdO5QKQTce8fA5OXxhZoyVeZ5cRklmke/8QQPNjRsTq65BGiozB
   LpgVu1HEF/AwxGpwB7rkeGvlBeKGVKnd2xUfkOoln1MXLXSRGxGIOZx4l
   g==;
X-CSE-ConnectionGUID: W/Syv0hrSOqjWRSnrVbC7A==
X-CSE-MsgGUID: XDJIRDfwRHGD9mk71dV/Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20886255"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="20886255"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 08:22:00 -0700
X-CSE-ConnectionGUID: QWnTm1xNSou19zfYneBbFw==
X-CSE-MsgGUID: 6ffmHyk9QOOlbC+m+3eElw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="60728845"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Aug 2024 08:21:58 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sad3T-0001U0-1e;
	Sun, 04 Aug 2024 15:21:55 +0000
Date: Sun, 4 Aug 2024 23:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/bbr3 1/1] xtensa-linux-ld: tcp_bbr.c:undefined reference to
 `__udivdi3'
Message-ID: <202408042338.zITQ1omW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/bbr3
head:   be74f82f85cf782f185e15c55dc8d8bda4769588
commit: be74f82f85cf782f185e15c55dc8d8bda4769588 [1/1] tcp/bbr3: initial import
config: xtensa-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240804/202408042338.zITQ1omW-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408042338.zITQ1omW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408042338.zITQ1omW-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_start_bw_probe_down':
   tcp_bbr.c:(.text+0x6e8): undefined reference to `__udivdi3'
>> xtensa-linux-ld: tcp_bbr.c:(.text+0x76e): undefined reference to `__udivdi3'
   xtensa-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_ssthresh':
   tcp_bbr.c:(.text+0x806): undefined reference to `__udivdi3'
   xtensa-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_cwnd_event':
   tcp_bbr.c:(.text+0x206b): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
