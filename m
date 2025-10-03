Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED72D26FA67
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 22:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759531510; cv=none; b=HOXkEoFzeJspcFeGle/UX7ZWifrfMHT1ldvCbIzsMFporWmHwxNTTh8pb6ZqCcdjPMj0NMDgPl53zcdpL7oZD04/q4ojlKMfHdqaMz5coYq2wofN2Bl9Tiga+JC+i4C+dV5DOuH1m4Pu3C3DzjAv/1+dlkXz99PVf6mehlIg7Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759531510; c=relaxed/simple;
	bh=hAgiclNPGfJHNbBK0OJMeF6ZI093arKwA+G6kNkSjfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jP+IZlacmW+lHWPSChcD5xG4p5YpSxyXmQMBGWvdxBywuedbySaOdxCAYmFHAU69grQqlyxIoHyuq9O9gEXsppdxfksmTCj0z98DgY6khy2DIhOxN1I/YWHe9h9QP1RZ6DiXQtIu8QrC438vc4MwpQ5OJvexG/jXVE+B7UEahtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQoW+cGk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQoW+cGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759531509; x=1791067509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hAgiclNPGfJHNbBK0OJMeF6ZI093arKwA+G6kNkSjfs=;
  b=LQoW+cGk+fSb2nLthGwhvYIZ7Gw+3e8dx0UGtTVpQoXm8CUpD+ErJGPS
   URLvnXty+BY7eU98FvQW3iJIZfV2eMXPAbqO9tUKR3jZx1V3B//vIKVtV
   C0zpjahtve/U/qx7RcWtmflR96qs1U8TbzY31NWF1yC0z7ENRfWij5HYo
   KRj593seooQx6Ws5oixO4jV6JTJgS2d9XSZfP32UgSRU3NnMEr5nbmgjo
   D0arUWDdYUbXNDqjHOUPTShpr31G1zhFhkwyfor+A5cREoJJuTQ3TMVoR
   CU6OE902RiFieqUrtE3maLd/bRW4JiNta1+gEONIfaTfHVN7Z1YPTw7CD
   Q==;
X-CSE-ConnectionGUID: AfLOr/VRTa2G6qdH2p+oCQ==
X-CSE-MsgGUID: b256esR6QAaruLrWVc2+6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="65665231"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="65665231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 15:45:08 -0700
X-CSE-ConnectionGUID: V2agC9oSR1Cy57ZiqPrQ5Q==
X-CSE-MsgGUID: VJkwJoJPTQmzTFujzkHsxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="184676727"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Oct 2025 15:45:07 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4oWP-0004wv-1e;
	Fri, 03 Oct 2025 22:45:05 +0000
Date: Sat, 4 Oct 2025 06:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.17/bbr3 1/1] ERROR: modpost: "__udivdi3"
 [net/ipv4/tcp_bbr.ko] undefined!
Message-ID: <202510040622.Icy8Ta5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.17/bbr3
head:   1c91634fce827f78ab54c06e233311a8068b46fd
commit: 1c91634fce827f78ab54c06e233311a8068b46fd [1/1] tcp/bbr3: add BBRv3 congestion control
config: xtensa-randconfig-002-20251004 (https://download.01.org/0day-ci/archive/20251004/202510040622.Icy8Ta5v-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040622.Icy8Ta5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040622.Icy8Ta5v-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x74 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> ERROR: modpost: "__udivdi3" [net/ipv4/tcp_bbr.ko] undefined!
>> ERROR: modpost: "__divdi3" [net/ipv4/tcp_bbr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
