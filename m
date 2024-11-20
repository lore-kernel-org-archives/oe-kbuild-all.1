Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE13A19C554
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732095569; cv=none; b=PuGK3aKHGP85v2NKjofhX70HiGZAWldk29oQ4zCv51pair3Ve1V054iLMq3j8J6in+Zzfk+OWefHFVr1Cu0ahMD4NUtu1s/LWDNEqqQvUFgKB64JCbD6/GlFi9rVNom5wuQwBBJrJykpQCbXTxd2n4BUIWY0y+zq0/UXZBrtdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732095569; c=relaxed/simple;
	bh=zP9Lf90DrrtUaeZapgQQqzsNGGqjf0glYHdhMUoqbtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AH99KoO8DWUaG3D5a2SvrN1tjCV2XJJd01d7RS9sjJHh/SiCWZKyi/qwiB/MngLkoKQZwhpkI0XPw6kKf9mhS7nE2fMArUP2SHPxyzaSsG6rpX9ggZ+8vcxdNhFoV6pTF2B5ZWtNTpJHe0c6y98iSa7ocLvu4FCNjYH63nVnisw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBKfPzr3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBKfPzr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732095568; x=1763631568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zP9Lf90DrrtUaeZapgQQqzsNGGqjf0glYHdhMUoqbtI=;
  b=JBKfPzr3x3fLgcH87BPfJGQS51QHnOjLKwUMSgFakmqjdwhjSREY5vhq
   fUkzR6h+cpna8D9wcyipsUfoVut66LAxcG0GL8D1vSk9P6fdbQFQoUa1B
   PwdcJm+ltSq7GNouWFCxXOoyTgWjMMpJLD8FtwvbEWm1KP+9nREi/j3jA
   aEAUIwPWcxFifc1TSZrbFkFnd9TWfhySqnIJ5TGT/QcTTRIKK4yOONZYu
   8WJezAcsk74jCzcVSrECu4BvGFq0R/5f0drKCOaJrj7ceSg834Snbf1Ms
   3WcKFucLOMzxYekcY42WYHlbrl9mdGes3OqkrAsf7DHAoaUr6xs7Gv581
   A==;
X-CSE-ConnectionGUID: xihy80V3Smq28rrFlyypBg==
X-CSE-MsgGUID: L7hxxwobRnGPjcvIpxF+Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42764388"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="42764388"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 01:39:27 -0800
X-CSE-ConnectionGUID: 8opWKSkpTAGYM4afj0ckYA==
X-CSE-MsgGUID: GsOdHvsqSUG21N1bDTOmeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="90239112"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2024 01:39:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDhBE-0000jx-0J;
	Wed, 20 Nov 2024 09:39:24 +0000
Date: Wed, 20 Nov 2024 17:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/bbr3 1/1] tcp_bbr.c:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202411201702.D26TqZRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/bbr3
head:   a1f04ded36fb527bc23efdb969b1893c82e61a6e
commit: a1f04ded36fb527bc23efdb969b1893c82e61a6e [1/1] tcp/bbr3: initial import
config: arm-randconfig-r123-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201702.D26TqZRb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241120/202411201702.D26TqZRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201702.D26TqZRb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs':
>> tcp_bbr.c:(.text+0x552): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: net/ipv4/tcp_bbr.o: in function `bbr_quantization_budget':
   tcp_bbr.c:(.text+0x5a0): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: net/ipv4/tcp_bbr.o: in function `bbr_inflight.constprop.0':
   tcp_bbr.c:(.text+0x646): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: net/ipv4/tcp_bbr.o: in function `bbr_packets_in_net_at_edt':
   tcp_bbr.c:(.text+0xd64): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
