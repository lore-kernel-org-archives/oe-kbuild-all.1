Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD73DE438
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219720; cv=none; b=YWLJDNLoT+owtR9+u88dOjfhHYA5Rlo01euKOxYJllAh4r3Cv9hztGYN0nUBpuzeNnK10465I0r3flFmiNpzoTPIGNWd49mlgvqumyeODaUQyafTmnYvHm0DoeGnWShYwRt5RCvoL3v1C/3YoqS7Se/tYsNi/5TOAqdOPlzb+J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219720; c=relaxed/simple;
	bh=j1E/AXEiuWe+qKFid+cQCLkZqw/UDJ59wiTRALQhQWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dpy19b/IB1aPo2EJ8soISm4+xqUV5bGBTmIyPjgKL4a+/oJgPp/+rh/oY5QNQaUgn4f0n599p1Hihmnep7pyXwpRgphT9Jdfwswcbs9Xw4LFeGjaMbcFZVxiQc/tQxncoTouDoXXjAhFFz97hF2MwNwTgqWyQAC22b8JjN94FFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvWQphxF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvWQphxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787219718; x=1818755718;
  h=date:from:to:cc:subject:message-id;
  bh=j1E/AXEiuWe+qKFid+cQCLkZqw/UDJ59wiTRALQhQWE=;
  b=PvWQphxFURi4lBTRpoH7l1su9wCcrKI+Rqrra2VN6+wrYh8ESwzOOHRi
   ybytQz4U9sAjh+krKTbOUFHd4n1Fve7gDTHXwEJtHLAunbeJ9EmpD8esO
   s3/nfNbMNeJ0/wNk7Intk1E/vp4rUV2nFLsayXpAMjy/qaPczaYOK/VsM
   6QLWxjdW1ZG0VjjB5thhv9kCfMBvDQ/ds0vUk9KZgyhRUrZpERq01yZOh
   L2Q8etdjkiSMbm1DDbl73XaQNhpGOAOv4ImIK7/DYPHLwzk3bjgReKdBn
   2yxfWSujbNWFGwH0hTDy33joJHopZFwo4Uf75OXyy8xkpDLXgdkix+043
   g==;
X-CSE-ConnectionGUID: Y1/jOC5ASziv6S0dfpHOJA==
X-CSE-MsgGUID: IjjvHe+TRe2MoXBftBDADw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87620592"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87620592"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 02:55:17 -0700
X-CSE-ConnectionGUID: NV2Av4rJRn2+ujfkY2pdmQ==
X-CSE-MsgGUID: UIRxqnqVR62J9qj6dpKUtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="263311234"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2026 02:55:17 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwzUQ-000000007Ub-36Jb;
	Thu, 20 Aug 2026 09:55:14 +0000
Date: Thu, 20 Aug 2026 11:54:37 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/node_features_v6
 36/44] Warning: kernel/dma/contiguous.c:248 Incorrect use of kernel-doc
 format:  * dma_contiguous_owns_node - is a DMA-owned CMA area hosted by this
 node?
Message-ID: <202608201130.TBzEj1XV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/node_features_v6
head:   38c7f48162aa282dc6a9edfb7011378594057c10
commit: ee74567d3e72b82b307fe5704b4ceec6af0f44bc [36/44] dma-contiguous: add dma_contiguous_owns_node()
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260820/202608201130.TBzEj1XV-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201130.TBzEj1XV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201130.TBzEj1XV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/dma/contiguous.c:248 Incorrect use of kernel-doc format:  * dma_contiguous_owns_node - is a DMA-owned CMA area hosted by this node?
>> Warning: kernel/dma/contiguous.c:259 function parameter 'nid' not described in 'dma_contiguous_owns_node'
>> Warning: kernel/dma/contiguous.c:259 expecting prototype for dma_contiguous_reserve(). Prototype was for dma_contiguous_owns_node() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
