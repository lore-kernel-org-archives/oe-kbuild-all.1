Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807E329E55
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676707; cv=none; b=fsb9Ld1vUkSe23M7s0tiXLUIHJonjYqfHqbsCcjZWDXHM3113lYJjrSDZWx4WEP5aWaIcsy1ucH2XYRfH/9o+Ugzv14+IOqqjo38Zs7XpExgAscRNCzebpv4rxERaNF24TttsDoECDy13LhS4JITt71UyBi0RL88mH0SZfOQ9R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676707; c=relaxed/simple;
	bh=Ib2I5NXQfMHPX8QlaiAKE6ng5xZG+KLiR0uYiJ5mCo8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gNwwWDU7hDJttdB37xuKJmbw9GymbkuOxMOm2+pK+UWTdZSWMCfpEYFQGWp6d/hTr5WX6LHsP9bpzVgx/P6lozZ0KfHBtbQ+4sDT8bNgBoQoihG4d8hm1DDyfKw/aQv1Y4EIOQwA48aFPA4tl5hIqceJUSU02Y3tbrN/e+Nz13w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtzVcU8G; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtzVcU8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786676705; x=1818212705;
  h=date:from:to:cc:subject:message-id;
  bh=Ib2I5NXQfMHPX8QlaiAKE6ng5xZG+KLiR0uYiJ5mCo8=;
  b=DtzVcU8GbPutFqf74hnPK44+bJo4qAt1TTam41WtvSaPDnm8b8s+kUT2
   vFeFb1HqX8a/FkFOthej2kzXF9wPcViLaJZS0tqf73hpj0DU8s7esgp3d
   k7NOnqBdVcP8cX8CRo52smnCofu2O4QSlLw9m0h3y+KKMM5X8aR2YF9kh
   xiUQSNvRFKzaCTum79A7oo1ulKlelDVFSPZVsK6EtRzjrz+grRtH0tflz
   aqjqH+y3RtSvLnyvMxStwvG2IHMF2gOec//XrK919w5XUiHTwoq/RPpdv
   /goRorm2YcVgdWNejNfxcyU1t8Zcgc82U4bY4NOCzcJpVRqiLO+Zyt4si
   Q==;
X-CSE-ConnectionGUID: 6USFBTR4ThSDzLi8sDtrVA==
X-CSE-MsgGUID: M7SwlVj1RzWa8X7xrbJ5lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="89778259"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="89778259"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 20:05:04 -0700
X-CSE-ConnectionGUID: lnlC4HYoQvSRUsUEmBt8iw==
X-CSE-MsgGUID: qGEVCc8SSLaQhqzJVZ6wWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="287587219"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Aug 2026 20:05:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuiE7-00000000XYw-43su;
	Fri, 14 Aug 2026 03:04:59 +0000
Date: Fri, 14 Aug 2026 11:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] mm/vmscan.c:6585:66:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202608141032.AZ76QJbg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   b4d3ec15824254c23211958f2e676e9394bc0600
commit: 874a0a566ede40f3d6062cae8fe1022e616edd1a [1/1] mm: vmscan: add cgroup IDs to vmscan tracepoints
config: arm-randconfig-r112-20260814 (https://download.01.org/0day-ci/archive/20260814/202608141032.AZ76QJbg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141032.AZ76QJbg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 874a0a566ede ("mm: vmscan: add cgroup IDs to vmscan tracepoints")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141032.AZ76QJbg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmscan.c:6585:66: sparse: sparse: Using plain integer as NULL pointer
   mm/vmscan.c:6589:58: sparse: sparse: Using plain integer as NULL pointer

vim +6585 mm/vmscan.c

  6551	
  6552	unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
  6553					gfp_t gfp_mask, nodemask_t *nodemask)
  6554	{
  6555		unsigned long nr_reclaimed;
  6556		struct scan_control sc = {
  6557			.nr_to_reclaim = SWAP_CLUSTER_MAX,
  6558			.gfp_mask = current_gfp_context(gfp_mask),
  6559			.reclaim_idx = gfp_zone(gfp_mask),
  6560			.order = order,
  6561			.nodemask = nodemask,
  6562			.priority = DEF_PRIORITY,
  6563			.may_writepage = 1,
  6564			.may_unmap = 1,
  6565			.may_swap = 1,
  6566		};
  6567	
  6568		/*
  6569		 * scan_control uses s8 fields for order, priority, and reclaim_idx.
  6570		 * Confirm they are large enough for max values.
  6571		 */
  6572		BUILD_BUG_ON(MAX_PAGE_ORDER >= S8_MAX);
  6573		BUILD_BUG_ON(DEF_PRIORITY > S8_MAX);
  6574		BUILD_BUG_ON(MAX_NR_ZONES > S8_MAX);
  6575	
  6576		/*
  6577		 * Do not enter reclaim if fatal signal was delivered while throttled.
  6578		 * 1 is returned so that the page allocator does not OOM kill at this
  6579		 * point.
  6580		 */
  6581		if (throttle_direct_reclaim(sc.gfp_mask, zonelist, nodemask))
  6582			return 1;
  6583	
  6584		set_task_reclaim_state(current, &sc.reclaim_state);
> 6585		trace_mm_vmscan_direct_reclaim_begin(sc.gfp_mask, order, 0);
  6586	
  6587		nr_reclaimed = do_try_to_free_pages(zonelist, &sc);
  6588	
  6589		trace_mm_vmscan_direct_reclaim_end(nr_reclaimed, 0);
  6590		set_task_reclaim_state(current, NULL);
  6591	
  6592		return nr_reclaimed;
  6593	}
  6594	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
