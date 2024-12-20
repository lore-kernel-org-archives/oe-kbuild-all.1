Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F322331
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 03:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734664949; cv=none; b=VvXr+Iz4i899CHAtkFn7p2HCWuSTtVBC5wiY2Bb2ZnLP4eYlrjGtwONFVbJoiCM+TXUlePVCNR5hMNag2BFbIi0jYp5qrkQZobj1gLc9yQQjA+bDepzhwa0UQ4xTQcB2CRfs0nrK3LvqGuGlngKkv8UUwPKRNr7dSXrKqWd8jq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734664949; c=relaxed/simple;
	bh=dPQyzdGBPHsRCaVO9MQiGZlJR0Wqs7LIQMWbB0hnO1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oiJKLfR8LLwFTerEgKzx/5llGUcYntF12l/YeCm32U+lbRUxmZe2WteXNZuWfYg6jXg6NSrM+HI2j6alvLUiLLj3Urnz4xuHPJcfy65jrwByt7u6y/FRhyjUkzaa+U1/gPEMU2qFPsi/9H6rU7vanE3V0HVRs91sQF2rcBJ0tTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLJrB+FC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLJrB+FC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734664948; x=1766200948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPQyzdGBPHsRCaVO9MQiGZlJR0Wqs7LIQMWbB0hnO1k=;
  b=CLJrB+FCwxRN9SgAU233er0pkE76l6YxRotBRVDGTo8QZrX8i6FC/pYQ
   stpp0U/+AdGAm/j1AuUnvMkp8CpcEc9wqEO1e2aYb3zApV+j2Ggzrk4WS
   L4XlRMlCxN5SKp+MdEGQhJjz9aos3L3DEZqmPCj4llTh8H5EEGoka8Rys
   BkwMtejwvsUtOUShNfsDKpQjjjh4GAQkaFs2Z2tj2s80zFuO1IPwBYHpA
   Tv0yChBGjW6RXgwGwUrhkwMwPr6XtdGT3SdZrrzu04x1WQI4pFo4ekLEz
   Rr/4p3A1fHhadw8oO5pVdqr85bDRt/+u5f9jEwz3H84AneoSfkkCk84x0
   Q==;
X-CSE-ConnectionGUID: kWkCedvTRveOc1sIRd2p6Q==
X-CSE-MsgGUID: clXw33wXSxKXq3r96+wdbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35355897"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35355897"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 19:22:27 -0800
X-CSE-ConnectionGUID: ASLQR16zQnKWAcP8xsoMxg==
X-CSE-MsgGUID: 8ly/dxDyQTyN/03yF9xzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="98291989"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Dec 2024 19:22:26 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOTap-0000jJ-0w;
	Fri, 20 Dec 2024 03:22:23 +0000
Date: Fri, 20 Dec 2024 11:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	David Ahern <dsahern@kernel.org>
Subject: include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
Message-ID: <202412201151.S8AkrAyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 4ee2a8cace3fb9a34aea6a56426f89d26dd514f3 net: ipv4: Add a sysctl to set multipath hash seed
date:   6 months ago
config: alpha-randconfig-r123-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201151.S8AkrAyC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241220/202412201151.S8AkrAyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201151.S8AkrAyC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/route.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   net/ipv4/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar

vim +539 include/net/ip_fib.h

   532	
   533	static inline u32 fib_multipath_hash_from_keys(const struct net *net,
   534						       struct flow_keys *keys)
   535	{
   536		siphash_aligned_key_t hash_key;
   537		u32 mp_seed;
   538	
 > 539		mp_seed = READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_seed;
   540		fib_multipath_hash_construct_key(&hash_key, mp_seed);
   541	
   542		return flow_hash_from_keys_seed(keys, &hash_key);
   543	}
   544	#else
   545	static inline u32 fib_multipath_hash_from_keys(const struct net *net,
   546						       struct flow_keys *keys)
   547	{
   548		return flow_hash_from_keys(keys);
   549	}
   550	#endif
   551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
