Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B628287E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815613; cv=none; b=hp4YWvZsXUg8QMYYrjDQ3N4tnzQQU1Kvi8Eobbr8eby4wDfZBwwNYK0PKEKCtj/F+OTavVOPZP6BKq1ADj+BLmwn8HlgkCS37OiHGiONyZuKpzr/HNsAu68X/ZXM7+EAZjmUX7uVTK4HmoMevjRRlWeNhycJO0GcmHUeJJs2oUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815613; c=relaxed/simple;
	bh=Yd+xTtByT20umqVvNNiZBBK1tuP0nHPCbfpeXyl/aNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e599eyurje/Q3fxbpcnC2AZJeErahN966gIRNumovJAXixRVIxN0NEAKRkmkK2yFJU+989SeeVG5jT8Q6x27MczvMh01HSEoCf6nbsalelm+aHeZ82O8h6VznhHSniYF+fqixYIhWK1dzNvN3wnoLaFIAgrXfHuy+BI/LGe7oPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbpPA17B; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbpPA17B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787815612; x=1819351612;
  h=date:from:to:cc:subject:message-id;
  bh=Yd+xTtByT20umqVvNNiZBBK1tuP0nHPCbfpeXyl/aNA=;
  b=IbpPA17BoV41prRk3Ggsuol2BN9Ycb5h6FVniREmzGWSGtlczdTDw5MN
   8eSVUwwj4+Z8ZKu4Q6bEqeWE0RMTjKJGCNhVwnepU6gOtvFO16gpXp8Wq
   6MPwaPq27f04NAWFbdPyr8Xb9dIZhQVPI7OavNMKHGnNJ3SaZct7ewEIF
   eBvwww03FSdtA3DWXGrC8oR8MhFCi4OLcjKZjrYW4WYvTzBnhdc5vdeyC
   fcSq5eDH6UEhLZ0p3qih+quxCeDx6xH1uJPd0qgWow5ib6D/TxUGX7ZH7
   4LfCddcqYZmULCjWBMA95xbDMRM+6SKQRu6IEFkG2JhcV2nh/BIhN1BfL
   g==;
X-CSE-ConnectionGUID: uISK5c6KSS6zCOBoMxF+9w==
X-CSE-MsgGUID: WRLyyw9CT2GqiJe7LiPgPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88432033"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88432033"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:26:43 -0700
X-CSE-ConnectionGUID: +eLwrhGVQLyv8l6sppbkhg==
X-CSE-MsgGUID: SZOIJr1MRJW7Y/iahbn/oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="268366827"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2026 00:26:42 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzUVT-000000000kP-4873;
	Thu, 27 Aug 2026 07:26:39 +0000
Date: Thu, 27 Aug 2026 09:26:04 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for CAN_RX_OFFLOAD when selected by
 GKI_HIDDEN_MCP251XFD_CONFIGS
Message-ID: <202608270932.TXDl28oY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f67745b7d96806e622db56f4be97af16d6e99850
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [6/6] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: x86_64-kismet-CONFIG_CAN_RX_OFFLOAD-CONFIG_GKI_HIDDEN_MCP251XFD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608270932.TXDl28oY-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608270932.TXDl28oY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270932.TXDl28oY-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD when selected by GKI_HIDDEN_MCP251XFD_CONFIGS
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
