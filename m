Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789721F30AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766980766; cv=none; b=e4lT1EeM29YJ76h3ZMF207hYcG4ww4pd6MTZI3JsfPcB2vKVWnGU3YY3owUmmjzFclvfGmjSpDcrlg9abE4GNb9yDi6WP8cc+Au0pjCTtF7qaDkVDMg883y/1coMpkzRlpt2LTcIe0x0gTaTJKbk8dQGEv7Tl6ClLsTE16E8A9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766980766; c=relaxed/simple;
	bh=3rRgVDagx2Pxo0I5ouP3AphFrt3eYiqgf7GQsV/1xFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tsXzRHTRirqsYdo0QzCV5Fpb6204MWL1a5k9uKHpkotU0o1eVVwloBuoVoEJf28Qjp5dkUmXv33bKl9qGDTIzuRT7sLO9iXeQxyAyrOpTLXBUBZNyv4bx7XL/48zC9SrI7DY5CMCySjznu3X9ldSVov2k00sE+udZcGNQZtUfr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cj6dgkhn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cj6dgkhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766980765; x=1798516765;
  h=date:from:to:cc:subject:message-id;
  bh=3rRgVDagx2Pxo0I5ouP3AphFrt3eYiqgf7GQsV/1xFY=;
  b=cj6dgkhnU4nDhG2JWWnrrgG5evkKYrvIGzcy3irFiwA4EepL9x6h+3jX
   eAd3TIlOOT4L2jRX5rzqJS9/aSgO+X20dp90jnl1HwpzIhum+/h2ysLyE
   NwQkDsAZGS7rCt+CReneE7A96zkWVDDifzFnr6Tx7LRmG2yxnUGamZ8db
   Y97s3OeuEt7X7sFV+h/KUwBXQlOwvw/zWtU1i3TyWtlGJ5GjtT34xv1kB
   66YnElTDYT/wec8GH60sOs8FLe8JsTH1ahEcld9sf4FUVPGv7Qlg6BJDY
   SRvRqZ8fq5dDPEufGvkZcqQ77lgHsUb41hM7rYTgJyiOdGnTaYW9ji6hZ
   A==;
X-CSE-ConnectionGUID: 4MoEANRfT+2TqVTRxLtXWA==
X-CSE-MsgGUID: w0ROzA8ASMycj3WMyrYxDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="78901698"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="78901698"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 19:59:25 -0800
X-CSE-ConnectionGUID: bZ94YlJ/SkKhyIPYQ5WTxQ==
X-CSE-MsgGUID: Jt2az6OpTRKKBUGXAqwNoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="200792288"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Dec 2025 19:59:22 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va4Pf-000000006ub-2Njc;
	Mon, 29 Dec 2025 03:59:19 +0000
Date: Mon, 29 Dec 2025 11:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: chenmiao <chenmiao.ku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __set_fixmap+0x84 (section: .text.unlikely) -> map_page.isra.0 (section:
 .init.text)
Message-ID: <202512291134.rYX7gBXG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi chenmiao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
commit: 4735037b5d9b0f809c51976c87d737fa2c48fdea openrisc: Add text patching API support
date:   4 months ago
config: openrisc-randconfig-r062-20251229 (https://download.01.org/0day-ci/archive/20251229/202512291134.rYX7gBXG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251229/202512291134.rYX7gBXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512291134.rYX7gBXG-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __set_fixmap+0x84 (section: .text.unlikely) -> map_page.isra.0 (section: .init.text)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x14 (section: .data) -> ice_adv_lnk_speed_100 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x30 (section: .data) -> ice_adv_lnk_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x4c (section: .data) -> ice_adv_lnk_speed_2500 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x68 (section: .data) -> ice_adv_lnk_speed_5000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x84 (section: .data) -> ice_adv_lnk_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xa0 (section: .data) -> ice_adv_lnk_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xbc (section: .data) -> ice_adv_lnk_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xd8 (section: .data) -> ice_adv_lnk_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xf4 (section: .data) -> ice_adv_lnk_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x110 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
ERROR: modpost: "__mulsi3" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/trace/ring_buffer_benchmark.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/trace/synth_event_gen_test.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/scftorture.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/fat/fat.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/fat/vfat.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/overlayfs/overlay.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "__mulsi3" [security/keys/encrypted-keys/encrypted-keys.ko] undefined!
ERROR: modpost: "__mulsi3" [crypto/geniv.ko] undefined!
WARNING: modpost: suppressed 627 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
