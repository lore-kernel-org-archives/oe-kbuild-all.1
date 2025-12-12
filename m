Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54549304BD7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 03:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765510440; cv=none; b=i6jQE7YAmVxw5CvlO0BfG57LcfXMT21VyMVUhjMzf1LY3ZHQdkDTAkewD3Lh82K3XscFNMZbx14ibBTB8MnaYkcOSrENaPGvgXDi1xQPxUUalvgLXC0RkNrB0fW0Pd6YQU5ePCle/r4lIilRJjqzM0MJgdeGtBc/rKdgsd5G37g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765510440; c=relaxed/simple;
	bh=F+iSx0fU2t24z2XUQTob6jVEWUYAGBmYxXV3BQj1HEo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mra0fKIXKxQOTOFoYeaeynykeymOoPVzGN/Hm13zV7sOuR08i/S2wrAho+CaFUkAk/jkcvLz58NX0ezqk+PlUmT94jd8liaYizkNPU2TtiaHoFYKqwOTRIZlutmSnWENt/UilaeZNbbBE1a3RIBYGsV7wtIh7+C3V39AqoNy9lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuWDZc8X; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuWDZc8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765510438; x=1797046438;
  h=date:from:cc:subject:message-id:mime-version;
  bh=F+iSx0fU2t24z2XUQTob6jVEWUYAGBmYxXV3BQj1HEo=;
  b=KuWDZc8XnY2x7W0BnHPzKW5YrrLiaR5fY1HugShMjYgv3uWcgnGMd8Se
   gbJXB7UbQSUzLnHDJZUIfueKkrA7/x3BGn4PKGXShg5OY5VOh+EaENKWS
   aj4+u/Z282ehoch3lEgdBzA5qrvz4vUBsSLYAKbq0ic9t2SUFU08qsLTU
   2e0+4q9rNHMmFuIio+qC704sRWKUFz9BpF48H60HnFNOJ6EWaUhVUXa6R
   N2/w8sVFWVjHMKg1yuUTIIgsqcLZ3cvMp6kVc0DJP4QV6/oxglmSJhsT6
   CBr4OcjZTxm3NSgVw9ef62U11ufShgt61RdDB//dp0aLGeeLOBdCdOzp+
   A==;
X-CSE-ConnectionGUID: YJC3gWbhRYu0QRkPCxm4+g==
X-CSE-MsgGUID: 9PNl7+7KR7SHZuc6LqIE3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85108263"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="85108263"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 19:33:57 -0800
X-CSE-ConnectionGUID: uyTJrfBcRf+iKmOvhPbvCQ==
X-CSE-MsgGUID: gBuTe5J+Rfyjbv5iguLU+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196881896"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2025 19:33:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTtuk-000000001Hc-0zLx
	for oe-kbuild-all@lists.linux.dev;
	Fri, 12 Dec 2025 03:33:54 +0000
Date: Fri, 12 Dec 2025 04:33:46 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/emt 9/9] fs/eventpoll.c:2148: warning: Function
 parameter or struct member 'ep' not described in 'ep_get_upwards_depth_proc'
Message-ID: <202512120417.BDB8DfcY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: 7a2125962c42d5336ca0495a9ce4cb38a63e9161 [9/9] eventpoll: Fix semi-unbounded recursion
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512120417.BDB8DfcY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120417.BDB8DfcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120417.BDB8DfcY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/eventpoll.c:2148: warning: Function parameter or struct member 'ep' not described in 'ep_get_upwards_depth_proc'
>> fs/eventpoll.c:2148: warning: Function parameter or struct member 'depth' not described in 'ep_get_upwards_depth_proc'


vim +2148 fs/eventpoll.c

  2143	
  2144	/**
  2145	 * ep_get_upwards_depth_proc - determine depth of @ep when traversed upwards
  2146	 */
  2147	static int ep_get_upwards_depth_proc(struct eventpoll *ep, int depth)
> 2148	{
  2149		int result = 0;
  2150		struct epitem *epi;
  2151	
  2152		if (ep->gen == loop_check_gen)
  2153			return ep->loop_check_depth;
  2154		hlist_for_each_entry_rcu(epi, &ep->refs, fllink)
  2155			result = max(result, ep_get_upwards_depth_proc(epi->ep, depth + 1) + 1);
  2156		ep->gen = loop_check_gen;
  2157		ep->loop_check_depth = result;
  2158		return result;
  2159	}
  2160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
